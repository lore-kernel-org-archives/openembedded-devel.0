Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 237CC76845
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2015 16:20:50 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so112901058wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Aug 2015 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OnrCMAcn2c6rGWD1KFrh+o6zu/Z2CnPEZCsA8tdtTVg=;
	b=jLu2nSOTGRD2a6ZGAvio4Qgu7aHvHa39aPhVQ7+Bqlq7tBkWvg8ziuNY6s9QcfsrP7
	KQoi/NNxPkie5310k5ZkJgnCyQ7lC88ZGvu4B5o0Cmm5w/kiVj03WAISO/XAEHQIiXef
	gLgWNJ3RCHmIcjhqcRC19L8TNYrg0IZKDCR8qwF9VNbgSCxC5a/B7hp+c1HiuVrfNnZF
	mqTHZ5bKj9B6agvvgXUICJkwqVNQ8BfaomX8gMs8s2oY8rM7/qcCw35SmSQzW1glr6UA
	Wt6geWjl8pgnaS0XYkq1LKzL4mown+K76fn0OI1Dyk0ERN3ZP+r42HDYJ7npAxvfLVS/
	HU9w==
X-Received: by 10.194.47.209 with SMTP id f17mr35423300wjn.39.1439137250610;
	Sun, 09 Aug 2015 09:20:50 -0700 (PDT)
Received: from Saturn.local.all (212-41-105-41.adsl.solnet.ch. [212.41.105.41])
	by smtp.gmail.com with ESMTPSA id
	pu6sm25001437wjc.34.2015.08.09.09.20.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Aug 2015 09:20:49 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Aug 2015 18:20:13 +0200
Message-Id: <1439137213-18585-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [meta-oe][PATCH] libvpx: fix build errors for gcc 5
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
X-List-Received-Date: Sun, 09 Aug 2015 16:20:51 -0000

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 .../webm/libvpx/gcc-5-max_align_t.patch            | 37 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb    |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/webm/libvpx/gcc-5-max_align_t.patch

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/gcc-5-max_align_t.patch b/meta-oe/recipes-multimedia/webm/libvpx/gcc-5-max_align_t.patch
new file mode 100644
index 0000000..e017fc0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/webm/libvpx/gcc-5-max_align_t.patch
@@ -0,0 +1,37 @@
+max_align_t is a type in gcc5 thus the definition here throws a compile
+time error.
+patch taken from:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=777976
+
+Upstream-Status: pending
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+--- libvpx-1.3.0/debian/patches/gcc-5.diff	1970-01-01 00:00:00.000000000 +0000
++++ libvpx-1.3.0/debian/patches/gcc-5.diff	2015-03-05 23:03:15.000000000 +0000
+@@ -0,0 +1,26 @@
++Index: b/nestegg/halloc/src/align.h
++===================================================================
++--- a/nestegg/halloc/src/align.h
+++++ b/nestegg/halloc/src/align.h
++@@ -30,7 +30,7 @@ union max_align
++ 	void (*q)(void);
++ };
++ 
++-typedef union max_align max_align_t;
+++typedef union max_align h_max_align_t;
++ 
++ #endif
++ 
++Index: b/nestegg/halloc/src/halloc.c
++===================================================================
++--- a/nestegg/halloc/src/halloc.c
+++++ b/nestegg/halloc/src/halloc.c
++@@ -30,7 +30,7 @@ typedef struct hblock
++ #endif
++ 	hlist_item_t  siblings; /* 2 pointers */
++ 	hlist_head_t  children; /* 1 pointer  */
++-	max_align_t   data[1];  /* not allocated, see below */
+++	h_max_align_t data[1];  /* not allocated, see below */
++ 	
++ } hblock_t;
++ 
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
index eb19a57..cd0af50 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
 SRC_URI += "http://webm.googlecode.com/files/libvpx-v${PV}.tar.bz2 \
             file://libvpx-configure-support-blank-prefix.patch \
-            file://0001-configure.sh-quote-local-variables.patch"
+            file://0001-configure.sh-quote-local-variables.patch \
+            file://fix_build_with_gcc5.patch"
 SRC_URI[md5sum] = "14783a148872f2d08629ff7c694eb31f"
 SRC_URI[sha256sum] = "d3dcc8d84af51c6c382b214397c62402e37a799e8ebcda6f4217aef0010451a9"
 
-- 
1.8.4.5


