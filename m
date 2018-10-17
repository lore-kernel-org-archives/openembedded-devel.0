Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id C24F879AF4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 06:11:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2018 23:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,391,1534834800"; d="scan'208";a="92646657"
Received: from chiron.jf.intel.com ([10.54.74.39])
	by orsmga003.jf.intel.com with ESMTP; 16 Oct 2018 23:11:50 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Oct 2018 23:11:41 -0700
Message-Id: <20181017061141.72274-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181017061141.72274-1-timothy.t.orling@linux.intel.com>
References: <20181017061141.72274-1-timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH v2 2/2] libnet-dns-perl: upgrade 1.17 -> 1.18; enable ptest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2018 06:11:48 -0000

* Add UPSTREAM_CHECK_REGEX to ignore DEV releases
* Add RDEPENDS that were missing
* Enable ptest and add RDEPENDS for tests
* Add RRECOMMENDS for libnet-dns-sec-perl

* Upstream release notes:
"""
**** 1.18 Sep 21, 2018

        Documentation revised to remove ambigous use of "answer" which
        has been used to refer to both the answer section of a packet
        and the entire reply packet received from a nameserver.

Fix rt.cpan.org #127018

        Net::DNS::ZoneFile->parse() fails if include directory specified.

Fix rt.cpan.org #127012

        DNS resolution broken when options ndots used in /etc/resolv.conf
"""

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>

---

Changes in v2:
  Use TCLIBC to determine if we are using glibc or musl
  and then set os.environ['LIBC'] to statically export path to libc.so
---
 .../recipes-perl/libnet/libnet-dns-perl_1.17.bb    | 27 ---------
 .../recipes-perl/libnet/libnet-dns-perl_1.18.bb    | 66 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 27 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
deleted file mode 100644
index 79583551f9..0000000000
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "This package contains the DNS.pm module with friends."
-HOMEPAGE = "http://www.net-dns.org/"
-SECTION = "libs"
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
-
-DEPENDS += "perl"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "28fcbcbf4483a9f23f75be4b9e3e45c8"
-SRC_URI[sha256sum] = "9a79fd8fea1a708726c18d193ae4437479206ccb20ffa7f0971371e172e2c2e0"
-
-S = "${WORKDIR}/Net-DNS-${PV}"
-
-EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
-
-inherit cpan
-
-RDEPENDS_${PN} = "perl-module-integer"
-
-do_compile() {
-    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-    cpan_do_compile
-}
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
new file mode 100644
index 0000000000..4e0c9c446b
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
@@ -0,0 +1,66 @@
+DESCRIPTION = "This package contains the DNS.pm module with friends."
+HOMEPAGE = "http://www.net-dns.org/"
+SECTION = "libs"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
+
+DEPENDS += "perl"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "67af7e5c1c339f60c45c1054374bd8ee"
+SRC_URI[sha256sum] = "52ce1494fc9707fd5a60ed71db5cde727157b7f2363787d730d4d1bd9800a9d3"
+
+UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
+
+S = "${WORKDIR}/Net-DNS-${PV}"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan ptest-perl
+
+RDEPENDS_${PN} = " \
+    libdigest-hmac-perl \
+    perl-module-base \
+    perl-module-constant \
+    perl-module-digest-md5 \
+    perl-module-digest-sha \
+    perl-module-file-spec \
+    perl-module-integer \
+    perl-module-io-file \
+    perl-module-io-select \
+    perl-module-io-socket \
+    perl-module-io-socket-ip \
+    perl-module-mime-base64 \
+    perl-module-scalar-util \
+    perl-module-test-more \
+    perl-module-time-local \
+"
+
+RRECOMMENDS_${PN} += " \
+    libnet-dns-sec-perl \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-encode \
+    perl-module-encode-byte \
+    perl-module-extutils-mm \
+    perl-module-extutils-mm-unix \
+    perl-module-overload \
+"
+
+python __anonymous () {
+    # rather than use "find" to determine libc-*.so,
+    # statically export the known paths for glibc and musl
+    import os
+    if d.getVar('TCLIBC') == "glibc":
+        os.environ["LIBC"] = "${STAGING_BASELIBDIR}/libc.so.6"
+    elif d.getVar('TCLIBC') == "musl":
+        os.environ["LIBC"] = "${STAGING_LIBDIR}/libc.so"
+    else:
+       raise bb.parse.SkipRecipe("incompatible with %s C library" %
+                                   d.getVar('TCLIBC'))
+}
+
+BBCLASSEXTEND = "native"
-- 
2.14.4


