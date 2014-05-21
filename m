Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f176.google.com (unknown [209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id B421C6A499
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:50:02 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id p10so1139446pdj.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gL8CiNtawOtaxOe83Ya50pDh7bv5uPXTsynQFky2UCs=;
	b=NqBs8LNjkjj3eSKvmFuUbgyLVUbfK5P2VPTNPp5E4XevaTe/IoeIHraYSVlw8QrVp+
	XDk5SQM3CW5sZBNn6WwoZTB7Ibs59ohUI+oKgeXaEHjxN4xr9d4Vi5yz8xvx2unrrpN8
	M71kG687WM+aBGu9D3bRPQcX3zzHj24+eLHnVos8eFzOqvhB2Ja0zu1lyALGBNJ8O78N
	ykzvvFrWpiBYbgWwsL4nPPZNckfoqkRiS/mGah8I9FLE2ANkoGwMDw4t27/6l1hSJRBU
	cZRk8UNxhsvGCIFmcqoBSWLz8DVqTyRR6iJAi0Ekwjr4BtVw0caez27akcBCZL5Epswx
	Xrqg==
X-Received: by 10.66.232.68 with SMTP id tm4mr56371235pac.114.1400658117684;
	Wed, 21 May 2014 00:41:57 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:56 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:40 -0700
Message-Id: <1400658223-15804-8-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 07/10] libmodule-build-tiny-perl: add 0.036
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 May 2014 07:50:02 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
Many Perl distributions use a Build.PL file instead of a
Makefile.PL file to drive distribution configuration, build, test and
installation. Traditionally, Build.PL uses Module::Build as the
underlying
build system. This module provides a simple, lightweight, drop-in
replacement.

* Add ${CPAN_MIRROR} option
* Versions since 0.033 depend on TAP::Harness::Env

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libmodule/libmodule-build-tiny-perl_0.036.bb   | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
new file mode 100644
index 0000000..2e725a8
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
+DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
+Makefile.PL file to drive distribution configuration, build, test and \
+installation. Traditionally, Build.PL uses Module::Build as the underlying \
+build system. This module provides a simple, lightweight, drop-in replacement. \
+Whereas Module::Build has over 6,700 lines of code; this module has less than \
+120, yet supports the features needed by most distributions."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aaca61412962cf972aec0cdad99d0a84"
+
+DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
+SRC_URI[md5sum] = "bfc92c655158ce623f0ced94f4ef02e5"
+SRC_URI[sha256sum] = "d6706bf35e080e5af20cccf4fd565cc8af9c2a1e2e2075cee0a7de42cf0d6df9"
+
+S = "${WORKDIR}/Module-Build-Tiny-${PV}"
+
+inherit cpan_build
+
+do_install () {
+        cpan_build_do_install
+}
+
+RDEPENDS_${PN} = " libextutils-config-perl \
+                   libextutils-helpers-perl \
+                   libextutils-installpaths-perl \
+		   libtap-harness-env-perl \
+                   perl-module-xsloader \
+                   perl-module-file-spec \
+                   perl-module-io-handle \
+                   perl-module-tap-harness-env \
+                   perl-module-ipc-open3 \
+                   perl-module-file-path \
+                   perl-module-cpan-meta \
+                   perl-module-extutils-cbuilder \
+                   perl-module-getopt-long \
+                   perl-module-extutils-makemaker \
+                   perl-module-exporter \
+                   perl-module-carp \
+                   perl-module-test-more \
+                   perl-module-text-parsewords \
+                   perl-module-module-load \
+                   perl-module-file-temp \
+                   perl-module-data-dumper \
+                   perl-module-extutils-parsexs \
+                   perl-module-pod-man \
+                   perl-module-json-pp \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


