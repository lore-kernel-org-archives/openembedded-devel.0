Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D89BB7E33A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:43:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:43:47 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:43:47 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:08 -0700
Message-Id: <20190602184318.71277-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 03/13] libcgi-perl: upgrade 4.38 -> 4.43; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:43:46 -0000
Content-Transfer-Encoding: 8bit

* Add libhtml-parser-perl to RDEPENDS for HTML::Entities dependency

Upstream release notes:

4.43 2019-05-01

    [ FIX / TESTING ]
    - support unquoted multipart/form-data name values (GH #234)

4.42 2019-03-26

    [ DOCUMENTATION ]
    - clarify licence also in Makefile.PL (GH #232)

4.41 2019-03-26

    [ DOCUMENTATION ]
    - clarify licence (GH #232)

4.40 2018-08-15

    [ FIX / TESTING ]
    - support perls < 5.10.1 in Makefile.PL by being more dynamic
      (GH #229, GH #230, thanks to Aristotle)

4.39 2018-08-13

    [ FIX / TESTING ]
    - specify CONFIGURE_REQUIRES in Makefile.PL so can use TEST_REQUIRES
      to build with older perls (GH #228)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-perl/libcgi/libcgi-perl_4.38.bb   | 25 ----------
 .../recipes-perl/libcgi/libcgi-perl_4.43.bb   | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 25 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libcgi/libcgi-perl_4.38.bb
 create mode 100644 meta-perl/recipes-perl/libcgi/libcgi-perl_4.43.bb

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.38.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.38.bb
deleted file mode 100644
index db16d8307d..0000000000
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.38.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "CGI.pm is a stable, complete and mature solution for processing and preparing \
-HTTP requests and responses. Major features including processing form \
-submissions, file uploads, reading and writing cookies, query string generation \
-and manipulation, and processing and preparing HTTP headers."
-HOMEPAGE = "http://search.cpan.org/~leejo/CGI-4.28/lib/CGI.pod"
-SECTION = "libs"
-LICENSE = "Artistic-2.0 | GPL-2.0"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2e9769f0a2613a98bc7fce15dee0c533"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "0aeb8563d533e7f83724ed068b5bfc37"
-SRC_URI[sha256sum] = "8c58f4a529bb92a914b22b7e64c5e31185c9854a4070a6dfad44fe5cc248e7d4"
-
-S = "${WORKDIR}/CGI-${PV}"
-
-inherit cpan
-
-RDEPENDS_${PN} += "\
-    perl-module-deprecate \
-    perl-module-if \
-"
-
-RPROVIDES_${PN} += "perl-module-cgi"
diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.43.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.43.bb
new file mode 100644
index 0000000000..b4571b27e6
--- /dev/null
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.43.bb
@@ -0,0 +1,50 @@
+DESCRIPTION = "CGI.pm is a stable, complete and mature solution for processing and preparing \
+HTTP requests and responses. Major features including processing form \
+submissions, file uploads, reading and writing cookies, query string generation \
+and manipulation, and processing and preparing HTTP headers."
+HOMEPAGE = "http://search.cpan.org/~leejo/CGI-4.28/lib/CGI.pod"
+SECTION = "libs"
+LICENSE = "Artistic-2.0 | GPL-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8c1f2cf11e4410911827ea48d58aaecc"
+SRC_URI[sha256sum] = "14b94f9df6e48fc26ebc4fa1e01a7b534cbc1611028a49028f9ac9d8ca27b734"
+
+S = "${WORKDIR}/CGI-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS_${PN} += "\
+    libhtml-parser-perl \
+    perl-module-base \
+    perl-module-deprecate \
+    perl-module-if \
+"
+
+do_install_prepend() {
+    # requires "-T" (taint) command line option
+    rm -rf ${B}/t/push.t
+    rm -rf ${B}/t/utf8.t
+    # tests building of docs
+    rm -rf ${B}/t/compiles_pod.t
+}
+
+RDEPENDS_${PN}-ptest += " \
+    libtest-deep-perl \
+    perl-module-bytes \
+    perl-module-file-find \
+    perl-module-filehandle \
+    perl-module-findbin \
+    perl-module-lib \
+    perl-module-perlio \
+    perl-module-perlio-scalar \
+    perl-module-test-more \
+    perl-module-utf8 \
+"
+
+RPROVIDES_${PN} += "perl-module-cgi"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


