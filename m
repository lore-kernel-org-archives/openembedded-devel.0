Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF66CA600E
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:19 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31268.1768811296319587123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRDczLgd;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0bae9aca3so26926155ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811295; x=1769416095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n6tU7vDzguYojs6XMixDKWFiL2ug/XX5JFsV460plM=;
        b=CRDczLgdFY+mTq3A6pg0jK6vIvBaNYGIDz2RFfO2idbSAkD2fFxFqUtq8jR4CJEGU7
         C0TGxM6yTj6bbs7Yj8CMYKA2HC2jq+FdRbXUNxURc2UwM8AzU4oXq/yK8mKoIyKqKHBu
         TJ+ujwaaIPOtnSDDiIVsbLIFat7r0jEbP96fW8250IwT9aJ7j7Tgk3k33V6fCG91y4T3
         wl9sNrb0XrB9s6zXNFvtSqz5miRdK60vsI0U68Hr+uihgfCCJ1Uu92TumFa3FDOUunIR
         4pyX893wjkOWvHSDpId7IjXlYOlB+O2Ji+7UXY2f/4qWPpcZTWoWLwmAhcWoQjkAOVT5
         KrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811295; x=1769416095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6n6tU7vDzguYojs6XMixDKWFiL2ug/XX5JFsV460plM=;
        b=saOrMoc6MijKCHnTR0JhbiqzOkXr5CTXtMSNcpNAxmMl/sH/oJktzlZ2u8gZ8QdPpE
         CsP95TiOfLrK0LMsqqcqarACDXMF7w66douITzStfCcYI2uE5Kud/zX+unPQ53GeRAxy
         Ln9o5MqzrgA0y8XHqskFwFKuY59G/l4cMSqItiYIf8L3Bsx5ghuKNHuNIXU98AxgL1F8
         6BZe+gR7ED//xUa3EM0Zf0ZitjT3Ei4pO6gwCOZh9GzVH2Ic5JU0pA6kKv113UBgXVpt
         9K7ubzvkGr0lXJXaJO8kiavTDUgQ59eqwMocVcHFER2nzPLc9ysd12BrEuKibeRiMjL7
         LgXg==
X-Gm-Message-State: AOJu0Yz4QZB+AISOpwQ47fHAp9KzdN7qoBIa9jWJJ2Dr0JGdQ0TLd03F
	5mp0ATb8aKYvZcd1nxZiex/L5Czr8e7N6CvLLq+dRFOBiRJHkN4lMYCUr0qOKA==
X-Gm-Gg: AZuq6aLirlc5m7lwieUYX9YnraJEIEEBR2+B6vGNjtLZBH8eOCbPXTj9Zcp96OdJiqX
	7myu7dDyfyTAi0Ot/YlI5E5h6jc2lKevYzN5F9AQyKltQ3JjA7PDU42kROHz5GH/nGbC18KE+kO
	lKJYuT25g3zgYFr85MG7p0kPRion8emrs5jpOeHYWK0BGqpdy+IijGIaJWSR/iPwhsiR3MuY8pY
	UMuDOEgRoz9VHzceFvl7jcnfU//Xpo5vb+uidAVLYs14aXpHAbaubh96/mZJ01WhPtrbEO8vuwm
	EJ7qKY6VjSF0pztk1Zwe9k7kTNHkLSxnw5CjA2AwVeVqVk10Z2eU7lyJ3i/xh7Vp7wwm9pUeAp/
	nb8BcwfBETuaU5El9cpL1CoxTwg7emkZT5kwS12t38XSm0LbVTUUgZ3GocfyIb2yaW8WpwFwZTb
	b2sLCYcWKuEwqd7xGSKt/3K1PIjWzXrcmUdA==
X-Received: by 2002:a17:902:db0b:b0:2a2:efa2:5d0e with SMTP id d9443c01a7336-2a717537574mr88959385ad.20.1768811295512;
        Mon, 19 Jan 2026 00:28:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 06/28] usb-modeswitch: upgrade 2.6.1 -> 2.6.2
Date: Mon, 19 Jan 2026 21:27:28 +1300
Message-ID: <20260119082752.4120991-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123600

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-build-with-gcc-15.patch
removed since it's included in 2.6.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dfbe08b6c3d842bf4add77580a579f76a1cd4cee)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-Fix-build-with-gcc-15.patch          | 51 -------------------
 ...witch_2.6.1.bb => usb-modeswitch_2.6.2.bb} |  6 +--
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.1.bb => usb-modeswitch_2.6.2.bb} (86%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
deleted file mode 100644
index eb65beb686..0000000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From f497eef1f38bd79a96a13269f251f1413c54b790 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Tue, 25 Mar 2025 12:36:32 +0100
-Subject: [PATCH] Fix build with gcc-15
-
-* fixes:
-  http://errors.yoctoproject.org/Errors/Details/848747/
-
-usb_modeswitch.c: In function 'main':
-usb_modeswitch.c:573:28: error: too many arguments to function 'get_current_config_value'; expected 0, have 1
-  573 |         currentConfigVal = get_current_config_value(dev);
-      |                            ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~
-In file included from usb_modeswitch.c:59:
-usb_modeswitch.h:55:5: note: declared here
-   55 | int get_current_config_value();
-      |     ^~~~~~~~~~~~~~~~~~~~~~~~
-usb_modeswitch.c:775:52: error: too many arguments to function 'get_current_config_value'; expected 0, have 1
-  775 |                                 currentConfigVal = get_current_config_value(dev);
-      |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~
-usb_modeswitch.h:55:5: note: declared here
-   55 | int get_current_config_value();
-      |     ^~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Submitted [https://www.draisberghof.de/usb_modeswitch/bb/viewtopic.php?t=3122]
----
- usb_modeswitch.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/usb_modeswitch.c b/usb_modeswitch.c
-index 2d4c0aa..bfbcbfb 100644
---- a/usb_modeswitch.c
-+++ b/usb_modeswitch.c
-@@ -570,7 +570,7 @@ int main(int argc, char **argv)
- 	/* Get current configuration of default device, note value if Configuration
- 	 * parameter is set. Also sets active_config
- 	 */
--	currentConfigVal = get_current_config_value(dev);
-+	currentConfigVal = get_current_config_value();
- 	if (Configuration > -1) {
- 		SHOW_PROGRESS(output,"Current configuration number is %d\n", currentConfigVal);
- 	} else
-@@ -772,7 +772,7 @@ int main(int argc, char **argv)
- 	if (Configuration > 0) {
- 		if (currentConfigVal != Configuration) {
- 			if (switchConfiguration()) {
--				currentConfigVal = get_current_config_value(dev);
-+				currentConfigVal = get_current_config_value();
- 				if (currentConfigVal == Configuration) {
- 					SHOW_PROGRESS(output,"The configuration was set successfully\n");
- 				} else {
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
similarity index 86%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
index b6b720fe1e..af2b5b6491 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=091556bd6d0154cd4c2d17a1bfc7380a"
 
 DEPENDS = "libusb1"
 
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2 \
-    file://0001-Fix-build-with-gcc-15.patch \
-"
-SRC_URI[sha256sum] = "5195d9e136e52f658f19e9f93e4f982b1b67bffac197d0a455cd8c2cd245fa34"
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "f7abd337784a9d1bd39cb8a587518aff6f2a43d916145eafd80b1b8b7146db66"
 
 inherit pkgconfig systemd
 

