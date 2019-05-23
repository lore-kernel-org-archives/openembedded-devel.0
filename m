Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C7EDA7E44C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 11:55:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f204so5527534wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 04:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fjNp+8wm3fgUTq/p2tjOMcezXtTac28IlUDA7iarH2M=;
	b=PiMN1mn3fPBJGHRAmxiEN2iyjtT7yjTPN1pJsCTOOpBBuol3j5BS5MmcwpsGBnuggu
	G54Kbs5YCv7d/N+YjpnpygpQqshyLSWOdhUS27JKkDz2xztIiz4JAKu5GdFHKX2KAK41
	v4i9EzM25rfi8jfcfupJlPiZXv+2I2GJ9sjGpIUPF1QXITevYrTUpfEaZJ7b9s1UXMmi
	Iwc+tTea73ucyCGyfePZ2peNC3sKcJRQ9CfFV9nNcd2pyR/tpnTvp/covheXjtTBaUzz
	Nc2HJA5hHr2nl3I5A/xRQ7eBBgm97dnX512vPPCeYbPmMpVwY+Q4exJUOQSSFWEQWY7E
	QM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fjNp+8wm3fgUTq/p2tjOMcezXtTac28IlUDA7iarH2M=;
	b=ECoKznnhIu2uLSUZquIYPiy4JpGAFrvKPijkiuzlifDaHpOWy5bMOooeLQ0TSJZiWO
	EZ5BXbybxdSp9wPDlcI2XzCuSnpeuN5GgL7gMrnBEOTKmXH1o1FITDP07cctmiUpd18/
	kBAqwxDkJL0Mk8y/D0Rj5K1txjmk1cR8NBnUTVbnG+3jjC4fuYIbgvY2HBhe3yOsUgkc
	LutUdvgUS+Et7eb0vt9CYQvq4fEaFxiuezR1aagJtOkp1OPpKi+mFy3Ty+sicPZZABrn
	2X70W5EY2XHLWYKyvvHhw8bsB/nC7foktKwvxCAY9tJit7NEVAoIrrDpUKH+EoyN9lWc
	WiCg==
X-Gm-Message-State: APjAAAUSJq+jXNXdkAiC2PpCdlDtDinl32ZZrb0A0gEHL+H8uxIHpT8p
	jgWdNnTFiPTHSDwCtbnwubZg32RT
X-Google-Smtp-Source: APXvYqxu4edk6YqwM+PWTJwPayrS9Kd3uwQoQpxxN2T9bCym0gLr+ONzEhLLnc9ovafq4LIggaU3+Q==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr11836866wmc.28.1558612505393; 
	Thu, 23 May 2019 04:55:05 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	a128sm10510599wmc.13.2019.05.23.04.55.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 04:55:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 11:55:05 +0000
Message-Id: <20190523115505.18245-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523115505.18245-1-Martin.Jansa@gmail.com>
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 8/8] android-tools-conf: import one more improvement for android-gadget-setup from meta-luneos
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
X-List-Received-Date: Thu, 23 May 2019 11:55:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../android-tools-conf/android-gadget-setup              | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
index beca353e67..26cf30eddd 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
@@ -9,6 +9,15 @@
 # model=$(getprop ro.product.model Android)
 # serial=$(getprop ro.serialno 0123456789ABCDEF)
 
+#below are now needed in order to use FunctionFS for ADB, tested to work with 3.4+ kernels
+if grep -q functionfs /proc/filesystems; then
+    mkdir -p /dev/usb-ffs/adb
+    mount -t functionfs adb /dev/usb-ffs/adb
+    #android-gadget-setup doesn't provide below 2 and without them it won't work, so we provide them here.
+    echo adb > /sys/class/android_usb/android0/f_ffs/aliases
+    echo ffs > /sys/class/android_usb/android0/functions
+fi
+
 manufacturer="$(cat /system/build.prop | grep -o 'ro.product.manufacturer=.*' | cut -d'=' -f 2)"
 model="$(cat /system/build.prop | grep -o 'ro.product.model=.*' | cut -d'=' -f 2)"
 # get the device serial number from /proc/cmdline directly(since we have no getprop on
-- 
2.17.1


