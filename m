Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3BC65D19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 23:12:07 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so22783880igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 16:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=tdbd1EnN5gfIBehlLkl+klo3mDCXo0xytMyN8pK+rSw=;
	b=sDuvqQ0T59GjqtTg3da3DXFKMZJNSO+vZ8YwrgzNZxjKoEnDSt7K8SNlflLKcRZ3IE
	heeWTze3zPcCnxMTMmdj+zI68bbZVzs3Bee0sjHuBKDd7kktSEv4IIxCPmlvI88O0iCe
	LND7qeuRNw2ROe+atDl/kI/IASOcb41118wZKDeqOFE3fzhVk1HSIu+gQO8P15vMOhZU
	IGVwaUFqLGHHrZE7WLgLRs7PQbx056Ynp6Qa0xWkig2BOFNr3ilhcUloYWPRKSMZZrIu
	n2t4UyuyscIpxOPfScpiGuPGec0HLkya7IbcrtGGz35JJT1AHuj9aHsiDY/XX00fPTCa
	yGzA==
X-Received: by 10.50.39.9 with SMTP id l9mr1525601igk.45.1432249928751;
	Thu, 21 May 2015 16:12:08 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id qt1sm2312506igb.5.2015.05.21.16.12.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 May 2015 16:12:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Thu, 21 May 2015 16:12:04 -0700
Message-Id: <1432249924-6005-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-xfce][PATCH] xfce: add image
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
X-List-Received-Date: Thu, 21 May 2015 23:12:09 -0000

This allows for an easier method of getting a XFCE image to demo and use.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/images/core-image-minimal-xfce.bb      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb

diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
new file mode 100644
index 0000000..1f83474
--- /dev/null
+++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A XFCE minimal demo image."
+
+IMAGE_INSTALL = "packagegroup-core-boot \
+    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
+    packagegroup-core-x11 \
+    packagegroup-xfce-base \
+"
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+IMAGE_LINGUAS = " "
+
+LICENSE = "MIT"
+
+export IMAGE_BASENAME = "core-image-minimal-xfce"
+
+inherit core-image
-- 
2.3.5


