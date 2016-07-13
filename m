Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8666067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 02:34:45 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id y188so2269147ywf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 19:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wHam/sWXC2sZ5Eu5yE9xHKGXEGfK8QFpwcsSmnm4Xp4=;
	b=NlLbMRQWQvW4UFERYyoGS4oIFaQ9fGPiKyBBW5KCFJdAaUPLYCANStuEUix8kl8iJA
	JivX/2Sv889yp7Pxw9ddc+pXJCVYF5Azuxlr7cB8RkTzYuZ9NHeHNgEcxFgRIosWq02s
	voiwYy7PM2nbrcyQt16MCMp5EEwkxSjSOhf0Dc+GZywHc7Y89mXROaqbW6zptljcqkU8
	9jyYkWekE2eHAI1vqRCubqPUrvm0YIlL4q+s5vpNGLoyPksLwVDvNR9ERLpGdb1O9IVQ
	f+7HrnGgXe2zb+ayxOQYAcDG/C3aIcmWXU+JisraGzvYd9/8GB9VA4AEDShBJ7AT+TGR
	fYyQ==
X-Gm-Message-State: ALyK8tIALgDxBbsuIsrCgqAXt5GCpQ3ZAFAWk2wHsQtp1C+91OFHsp71IQe5xM4KvRL0Tg==
X-Received: by 10.37.231.69 with SMTP id e66mr3851922ybh.165.1468377285365;
	Tue, 12 Jul 2016 19:34:45 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id r68sm490250ywh.44.2016.07.12.19.34.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jul 2016 19:34:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2016 22:34:39 -0400
Message-Id: <1468377279-5718-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-bcrypt: update to version 3.1.0
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
X-List-Received-Date: Wed, 13 Jul 2016 02:34:46 -0000

  * Update LICENSE to reflect upstream changes

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-bcrypt_2.0.0.bb        | 15 ---------------
 .../recipes-devtools/python/python-bcrypt_3.1.0.bb        | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-bcrypt_3.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb b/meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb
deleted file mode 100644
index 3cbe33e..0000000
--- a/meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Modern password hashing for your software and your servers."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e19d0fe40c5ce4109e6bcbf4aab2a5bd"
-
-DEPENDS = "python-cffi-native"
-
-SRC_URI[md5sum] = "e7fb17be46904cdb2ae6a062859ee58c"
-SRC_URI[sha256sum] = "8b2d197ef220d10eb74625dde7af3b10daa973ae9a1eadd6366f763fad4387fa"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-    python-cffi \
-    python-six \
-"
diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.0.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.0.bb
new file mode 100644
index 0000000..caeef60
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-bcrypt_3.1.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Modern password hashing for your software and your servers."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
+
+DEPENDS = "python-cffi-native"
+
+SRC_URI[md5sum] = "49d79e646dbf27a05b81e4f0c4f717c7"
+SRC_URI[sha256sum] = "e54820d8b9eff357d1003f5b8d4b949a632b76b89610d8a933783fd476033ebe"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "\
+    python-cffi \
+    python-six \
+"
-- 
1.9.1


