Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1UX9Ll-00084F-RW
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 14:08:32 +0200
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.3])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id A9579401A2;
	Tue, 30 Apr 2013 13:03:41 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 13:50:06 +0200
Message-Id: <1367322606-5466-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
Cc: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>
Subject: [meta-oe][PATCH] python-dateutil: update to 1.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2013 12:08:39 -0000

From: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>

This commit updates python-dateutil to the latest version 1.5 and resets PR.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 ...on-dateutil_1.4.1.bb => python-dateutil_1.5.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-dateutil_1.4.1.bb => python-dateutil_1.5.bb} (78%)

diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb b/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
similarity index 78%
rename from meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
rename to meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
index 2d913e4..6e10524 100644
--- a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d82268718c68bda0b091006ec6e583c6"
 SRCNAME = "${PN}"
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "http://labix.org/download/python-dateutil/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
@@ -19,5 +19,5 @@ RDEPENDS_${PN} = "\
     python-datetime \
 "
 
-SRC_URI[md5sum] = "2a5f25ab12fcefcf0b21348f2d47595a"
-SRC_URI[sha256sum] = "74b615c6a55b4421187feba1633fc233e7c5ebdd7abe9b092447a32946823357"
+SRC_URI[md5sum] = "35f3732db3f2cc4afdc68a8533b60a52"
+SRC_URI[sha256sum] = "c08aca7d85f8f8eed61e83b3423b829262c596a9a78f7ca3de0bcee2217d0e3b"
-- 
1.7.9.5



