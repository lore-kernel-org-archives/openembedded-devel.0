Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id E622C770FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 05:04:45 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vy10so3021022pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 22:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RFp5LnUe5bSuiEW6/9kgvHNcKkAR1ZH1HTaMvbHYP6Y=;
	b=tWFgSXgcZyT5MCsXw1HuAzmwDe3kHKPqzZWCAFEZ+WNOzHFdIB/aeK9uKnEvxF/msR
	mZohrVWMc58C23XM57PhO/hEPp6VA/eLcIrT/grYB7Vhc1uVUg1pq/FvC3GtqNrnipYh
	WR+PuyJz68dlYAxORvg5frtw4nuCxSS7NgJ+4n+TTVtoHgwbaBval76bZmvsJ2X1fndf
	BgOhKDvd4VktCrL78IDLk3WPYkjAE1/GBJuNJ342062YnM+uBR4gEhoeGVbWzqURV46g
	qOnCZgXC7pu7L4pCNN2ghjmnlg4rrUPXbiWszao2tJPduIdYb2ssXY6vBdlocp47HdRI
	2xFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RFp5LnUe5bSuiEW6/9kgvHNcKkAR1ZH1HTaMvbHYP6Y=;
	b=CqW2/Yl/hpZtsOgAkdPjT/jAAqchK5heCcLEQmz4LPsu87Seio+RgDeSrf3mfSaw1X
	Ac9THdXErOivAiUxqtoeNVkUu4Mn499EiTk2CGlFPo6aILlT7gQrDhneECrQYxHLUihy
	y7sOQNKIPSYTjq0CAzi0uHDQtWLToCLECFe6YPI09KE3Nl1/96jheWPEC2FUgwXbKKKG
	rx/vMCGqykFQUAT2TQbDFvNSlOfojeAi5ikn2QVmaSETFXpMqJgW14mx1Rxmb4BXmCb3
	SdE6bK2MnPB9rZWVJf8Tv1kUH/ZxKLo4Qikzw6Itq2+8GCWzMt5Rl6Yoiu0wwU7os0aK
	5hqQ==
X-Gm-Message-State: AEkoouumHQOPUdlGkvB9N/knG3oDh9FGZOqAThMjm7kejdc3+iKbemahz9FyeleuqDnPXA==
X-Received: by 10.66.160.165 with SMTP id xl5mr5040192pab.63.1471237486081;
	Sun, 14 Aug 2016 22:04:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	ty6sm29178421pac.18.2016.08.14.22.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Aug 2016 22:04:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Aug 2016 22:04:34 -0700
Message-Id: <20160815050434.20974-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160815050434.20974-1-raj.khem@gmail.com>
References: <20160815050434.20974-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 3/3] thunar-volman: Fix build with clang
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
X-List-Received-Date: Mon, 15 Aug 2016 05:04:46 -0000

clang poins a void return for a boolean function
| ../../thunar-volman-0.8.1/thunar-volman/tvm-block-device.c:717:3: error: non-void function 'tvm_block_device_mount' should return a value [-Wreturn-type]
|   g_return_if_fail (context != NULL);

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...with-no-value-in-function-returning-non-v.patch | 26 ++++++++++++++++++++++
 .../thunar-volman/thunar-volman_0.8.1.bb           |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch
new file mode 100644
index 0000000..7233ea7
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch
@@ -0,0 +1,26 @@
+From 2e295e9ce8f7f60a271adf004588b0d8db88db09 Mon Sep 17 00:00:00 2001
+From: Matt Thirtytwo <matt.59491@gmail.com>
+Date: Sat, 7 Mar 2015 22:50:32 +0100
+Subject: [PATCH] Fix return with no value in function returning non-void (bug
+ #11656)
+
+---
+ thunar-volman/tvm-block-device.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/thunar-volman/tvm-block-device.c b/thunar-volman/tvm-block-device.c
+index da31efa..edb6cad 100644
+--- a/thunar-volman/tvm-block-device.c
++++ b/thunar-volman/tvm-block-device.c
+@@ -714,7 +714,7 @@ tvm_block_device_mount (TvmContext *context)
+   GMountOperation *mount_operation;
+   GVolume         *volume;
+ 
+-  g_return_if_fail (context != NULL);
++  g_return_val_if_fail ((context != NULL), FALSE);
+ 
+   /* determine the GVolume corresponding to the udev device */
+   volume = 
+-- 
+1.9.0
+
diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
index 08e6f5b..44e3777 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
@@ -6,6 +6,7 @@ DEPENDS = "exo glib-2.0 gtk+ libxfce4ui libxfce4util xfconf libnotify libgudev"
 
 inherit xfce
 
+SRC_URI += "file://0001-Fix-return-with-no-value-in-function-returning-non-v.patch"
 SRC_URI[md5sum] = "65ab6e05b2e808d1dcc8d36683a59b7e"
 SRC_URI[sha256sum] = "5a08bb5ce32c296a64dfbdb2406d4e45a208b2c91e4efa831dc28f1d6c2ac2bd"
 
-- 
2.9.3


