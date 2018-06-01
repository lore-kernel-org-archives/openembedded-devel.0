Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7003774F83
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 04:58:16 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id z1-v6so3771472pgv.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 21:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w/5V5ZDQTNffrWZjAUQcjJegvAdjlCHW/EPKzQphJw0=;
	b=NB2Kua4mYT9NRnpikW6SCoD8Ls0cgQKdWKnVOebBbPWeT1sw0IKThP8GKgoJb3q1Ap
	xmoL3ASCfSSbsJlHQVchUDoMCUQdsHeAWx1X1RxRvWW/D+x6/ThfmmYzzLgzdmOh1ZXl
	UytAxgAywTchFPmjMmB7O8KqX6V5XC5JGfJ1ACcdCqdg0bJSwlvUr2yFzqSABDYUTsuG
	1E7FEveyxMns8mGn+AW250e8//MJKEVR608LPY8Q8GsnS8qnuighZVEFb1lh78yQMTjm
	oK/mlxmLV3F3XL24kt8ugmPnnyYbFgSi8hdCecXkKpNrHHW5TgTgg/9/dY/6sRE3TNuy
	NBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w/5V5ZDQTNffrWZjAUQcjJegvAdjlCHW/EPKzQphJw0=;
	b=jkuQYq7JNBBbApyFO/WSyF4OVdeXNzn/RFizOxRNZpIheP9oP//SLnjPW39keQRiDO
	9gi0+5CiV338MEo5FS+fv8e3bETgZFRguZdHHu94ei0SQPyxp5xnTmxBwjoozwTjM3s5
	/i3U55Wdr37eIqPQJZ3k2lHe7MqXfIs84D9nPn//8i5LnBttD1Crz0XEXbVnrqrMpBOX
	1cF2DKUYnB7BdDWS7WQu1CTEg800wnAmF+727gQksHrUUjsLyKNmkGfVQNdJvop33k5t
	jjZbr6Vtwa0eBFYdwsUpuRlCHD8uplMSn2euybWzfcsx5m1ajwP+pb/5UYnTPyPpN+3J
	GyQg==
X-Gm-Message-State: ALKqPweCX2RTeG0J8WCM1V3A3nexnDy4s23diN4gFa0tXvrW1RRoPigz
	NSic1NP0DLHQCDCV6h630o2eFQ==
X-Google-Smtp-Source: ADUXVKJaRlX36I1GxhQyVulw1NhhyWX5tp3AtpPzW4LzPBFkYBzeY9bYtA9DU37wrmA2tgMlgfXYEQ==
X-Received: by 2002:a63:bd09:: with SMTP id
	a9-v6mr7607655pgf.250.1527829097069; 
	Thu, 31 May 2018 21:58:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q68-v6sm67909762pfb.182.2018.05.31.21.58.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 May 2018 21:58:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2018 21:58:15 -0700
Message-Id: <20180601045815.15819-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180601045815.15819-1-raj.khem@gmail.com>
References: <20180601045815.15819-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] openocd: Upgrade to latest tip of master
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
X-List-Received-Date: Fri, 01 Jun 2018 04:58:16 -0000

Fix build with new libusb and gcc8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...2-deprecated-libusb_set_debug-with-l.patch | 39 +++++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  5 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
new file mode 100644
index 0000000000..c5b9083dca
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
@@ -0,0 +1,39 @@
+From b95a996bfb281104b68ec66f32ebb79db519a4a8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 May 2018 21:06:46 -0700
+Subject: [PATCH] Fix libusb-1.0.22 deprecated libusb_set_debug with
+ libusb_set_option
+
+libusb_set_debug is deprecated in libusb >= 1.0.22 therefore replace
+with equivalent libusb_set_option()  API
+
+see libusb commit for more details
+
+https://github.com/libusb/libusb/commit/539f22e2fd916558d11ab9a66f10f461c5593168
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [http://openocd.zylin.com/#/c/4540/]
+ src/jtag/drivers/xds110.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/jtag/drivers/xds110.c b/src/jtag/drivers/xds110.c
+index 90b699027..9bfe02ea8 100644
+--- a/src/jtag/drivers/xds110.c
++++ b/src/jtag/drivers/xds110.c
+@@ -367,8 +367,11 @@ static bool usb_connect(void)
+ 
+ 		/* Set libusb to auto detach kernel and disable debug messages */
+ 		(void)libusb_set_auto_detach_kernel_driver(dev, 1);
++#if LIBUSB_API_VERSION >= 0x01000106
++		libusb_set_option(ctx, LIBUSB_OPTION_LOG_LEVEL, LIBUSB_LOG_LEVEL_NONE);
++#else
+ 		libusb_set_debug(ctx, LIBUSB_LOG_LEVEL_NONE);
+-
++#endif
+ 		/* Claim the debug interface on the XDS110 */
+ 		result = libusb_claim_interface(dev, INTERFACE_DEBUG);
+ 	} else {
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 67abeede93..84727bf970 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -5,8 +5,9 @@ DEPENDS = "libusb-compat libftdi"
 RDEPENDS_${PN} = "libusb1"
 
 SRC_URI = "git://repo.or.cz/openocd.git \
-"
-SRCREV = "3737dd69e73816d186ba418d7b833462a8041079"
+           file://0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch \
+          "
+SRCREV = "cdf1e826eb23c29de1019ce64125f644f01b0afe"
 
 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
-- 
2.17.1


