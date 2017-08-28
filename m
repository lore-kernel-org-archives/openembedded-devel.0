Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB94660290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 05:46:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7S5kLT9006920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 27 Aug 2017 22:46:21 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 27 Aug 2017 22:46:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Aug 2017 01:46:19 -0400
Message-ID: <1503899179-79867-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libreport: 2.9.1 -> 2.9.2
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
X-List-Received-Date: Mon, 28 Aug 2017 05:46:22 -0000
Content-Type: text/plain

Change SRC_URI to git fetcher, github archives can be regenerated from
time to time with different checksums.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libreport/{libreport_2.9.1.bb => libreport_2.9.2.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.1.bb => libreport_2.9.2.bb} (84%)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
similarity index 84%
rename from meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
rename to meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
index ee9a84c..2fdfd7d 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
@@ -11,16 +11,15 @@ DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 
-SRC_URI = "https://github.com/abrt/${BPN}/archive/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "git://github.com/abrt/libreport.git;protocol=https"
 SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch \
             file://0003-without-build-plugins.patch \
             file://0004-configure.ac-remove-prog-test-of-augparse.patch \
             file://0005-remove-python2-support.patch \
 "
-
-SRC_URI[md5sum] = "f732a63dcc68cf96f0df02bcfc5fccc7"
-SRC_URI[sha256sum] = "484e15759a079730608b708ea9ae74a045ebe74f35dbfe9c9c16834c4462bcd4"
+SRCREV = "cfff49f06d9d17e269d463ee71b3d94c8bfb0c58"
+S = "${WORKDIR}/git"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "systemd"
-- 
2.8.1


