Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2466E770CA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 08:21:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA78LYGF006614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 7 Nov 2015 00:21:34 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sat, 7 Nov 2015 00:21:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 7 Nov 2015 16:21:26 +0800
Message-ID: <1446884486-23655-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446884486-23655-1-git-send-email-hongxu.jia@windriver.com>
References: <1446884486-23655-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: jeffrey.honig@windriver.com
Subject: [meta-perl][PATCH 2/2] libhtml-tree-perl: add version 5.03
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

HTML-Tree is a suite of Perl modules for making parse trees out of HTML source.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
new file mode 100644
index 0000000..0b457e3
--- /dev/null
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -0,0 +1,40 @@
+SUMMARY = "HTML::TreeBuilder - Parser that builds a HTML syntax tree"
+DESCRIPTION = "This distribution contains a suite of modules for representing, \
+creating, and extracting information from HTML syntax trees; there is \
+also relevent documentation.  These modules used to be part of the \
+libwww-perl distribution, but are now unbundled in order to facilitate \
+a separate development track."
+SECTION = "libs"
+
+HOMEPAGE = "http://www.cpan.org/authors/id/C/CJ/CJM/HTML-Tree-${PV}.readme"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz"
+SRC_URI[md5sum] = "d9271d60b872ed6fbe68b2d0fe8c450e"
+SRC_URI[sha256sum] = "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec0387f01eefc2148f"
+
+S = "${WORKDIR}/HTML-Tree-${PV}"
+
+inherit cpan_build
+
+DEPENDS += "libmodule-build-perl-native \
+"
+
+RPROVIDES_${PN} = " libhtml-element-perl \
+		    libhtml-tree-assubs-perl \
+		    libhtml-tree-perl \
+		    libhtml-treebuilder-perl \
+"
+
+RDEPENDS_${PN} = " perl-module-b \
+                   perl-module-base \
+                   perl-module-strict \
+                   perl-module-warnings \
+                   perl-module-exporter \
+                   perl-module-carp \
+"
+
+BBCLASSEXTEND = "native"
+
-- 
1.9.1


