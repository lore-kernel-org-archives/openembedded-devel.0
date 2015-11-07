Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97B2B770C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 08:21:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA78LV0H020391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 7 Nov 2015 00:21:32 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sat, 7 Nov 2015 00:21:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 7 Nov 2015 16:21:25 +0800
Message-ID: <1446884486-23655-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: jeffrey.honig@windriver.com
Subject: [meta-perl][PATCH 1/2] libmodule-build-perl: add 0.31
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
X-List-Received-Date: Sat, 07 Nov 2015 08:21:35 -0000
Content-Type: text/plain

[Description from CPAN]
`Module::Build' is a system for building, testing, and installing Perl
modules. It is meant to be an alternative to `ExtUtils::MakeMaker'.
Developers may alter the behavior of the module through subclassing in a
much more straightforward way than with `MakeMaker'. It also does not
require a `make' on your system - most of the `Module::Build' code is
pure-perl and written in a very cross-platform way.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libmodule/libmodule-build-perl_0.31.bb         | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb
new file mode 100644
index 0000000..c0fa06d
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
+DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
+Makefile.PL file to drive distribution configuration, build, test and \
+installation. Traditionally, Build.PL uses Module::Build as the underlying \
+build system. This module provides a simple, lightweight, drop-in replacement. \
+Whereas Module::Build has over 6,700 lines of code; this module has less than \
+120, yet supports the features needed by most distributions."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~kwilliams/Module-Build-0.31/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=43339d8f9d3a956ee9eceb07717ee95e"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/K/KW/KWILLIAMS/Module-Build-${PV}.tar.gz"
+SRC_URI[md5sum] = "3d4fdffe58f6236253767e5a71edf29b"
+SRC_URI[sha256sum] = "e2f723be8d6c70b4ddbca3b5e32e52e6e98eae8f43e34d7ede87efcb1796bbb5"
+
+S = "${WORKDIR}/Module-Build-${PV}"
+
+inherit cpan_build
+
+do_install () {
+        cpan_build_do_install
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


