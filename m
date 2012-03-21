Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATXs-0003Nr-VX
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 22:58:17 +0100
Received: by wgbdr12 with SMTP id dr12so828202wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jRRM6MzfcBtVqR8SxQrYA3+Su5V+2ee2Z92V43YDq0U=;
	b=rFqKgzHk7MQdQuHv8d7pJaUSiVx27fe6XBfEyJDdCvHqm55X4vTg7W9XZF88p2J7ui
	jLMK6KHWZshdHuFxnglNFwpcZrlPZrrcbSKbSU397wGeJqkVxf8dzsnTCDK6UJRq/Qs8
	hOBv85UXXjkVfbIH7T2ZzI56GLoqtZn+Zr7CBioocx0m8iF99g3NfYR/9sEFi2GxL00D
	AxhB3PRz/dxSADG6nsiwEi7AESdnz0WQPIuafGyT4VgTQ6zbCxWC/mkF7uBvMZ+8fPeA
	YUjX9B/njoeXP5H9Z7z/muNy7cWtu5n1Iq9vw/rMxdzhDuT3PKQbNrXtjzG3lHlce59s
	iNIQ==
Received: by 10.216.45.146 with SMTP id p18mr3172822web.47.1332366562946;
	Wed, 21 Mar 2012 14:49:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg2sm12526115wib.7.2012.03.21.14.49.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:49:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:49:01 +0100
Message-Id: <9d61ed2fa58b77777cb4a40a4395e0477d69c3a5.1332366214.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <f155e80f9a8c90337e79928293daa7f807328b45.1332366214.git.Martin.Jansa@gmail.com>
References: <f155e80f9a8c90337e79928293daa7f807328b45.1332366214.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332366214.git.Martin.Jansa@gmail.com>
References: <cover.1332366214.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] libusb*: remove native support, was moved to oe-core
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
X-List-Received-Date: Wed, 21 Mar 2012 21:58:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libusb/libusb-compat_0.1.3.bbappend            |    6 ------
 .../recipes-support/libusb/libusb1_1.0.8.bbappend  |    1 -
 2 files changed, 0 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
 delete mode 100644 meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend

diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend b/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
deleted file mode 100644
index 5b50d6b..0000000
--- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PROVIDES += "virtual/libusb0"
-PROVIDES_virtclass-native += "virtual/libusb0-native"
-BBCLASSEXTEND = "native nativesdk"
-
-inherit lib_package
-
diff --git a/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend b/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend
deleted file mode 100644
index 608377e..0000000
--- a/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.8.5



