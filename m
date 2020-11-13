Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3259.1605268891189416470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2020 04:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 163.172.53.213
Received: from build.dedibox.fr (build.bootlin.com [163.172.53.213])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A73F7C0005
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 12:01:28 +0000 (UTC)
From: kory.maincent@bootlin.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libftdi: add swig-native to dependencies
Date: Fri, 13 Nov 2020 13:01:28 +0100
Message-Id: <20201113120128.2629082-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build of libftdi-native return
Error: Unable to find 'swig.swg'
Error: Unable to find 'python.swg'
Add swig-native in the dependencies to fix it.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
index c33c79111..8479b274e 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM= "\
     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 "
 
-DEPENDS = "libusb1 python3"
+DEPENDS = "libusb1 python3 swig-native"
 
 SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0c09fb2bb19a57c839fa6845c6c780a2"
-- 
2.25.1

