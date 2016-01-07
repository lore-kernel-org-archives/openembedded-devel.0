Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id BC2A3731EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 17:06:33 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id ho8so2294309pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 09:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9NBxlL1a6RLaeDUlgZl1sgowkvBxHm2aB7lWVFmnBW8=;
	b=HwqfLnr4aHBQ6oinjfcfpWTfBewp1WEb3CjoxwpioN0Av6gjyfjEinAJIXp/+arOK2
	3jlI9USGBBIhOdfXLLB0PUXGNon5G1bkErzQC6OsBv0kJaglPrLMvENd7LELMd5mIZW/
	NU4LYTdMN2w8c62xbEuSofGGteUWE3NmwJIm8QNrTWjAclOIuAKdzH+tPYQCC667x8jb
	UHYH1vLmoSZRnmKhUAaWgcAFPrwh4iJKgDvkjKoxlp3BM4Sfc3BEQxjGPXdz1PJroCPG
	likBrMExoZMxGJe48H2zmoYruEXLrHmv14mAOv8pIIYam9JEzssnGnTwDujfp3/Mg6hX
	40fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9NBxlL1a6RLaeDUlgZl1sgowkvBxHm2aB7lWVFmnBW8=;
	b=jv3siSNK+8RPfSaWtPDHvlBQTT6E/DpeW8kGXljMtZyAKxY9wOxVJJ6YsWZyiMmtLN
	T2dcvw48H3oH69Uezte4YlBwak2AJh8hcF0NVTD+j6gI8vDUWjpn2xMth4gulstJEP+8
	zJrb/mDln9kVyZpT6NTQwj2q67aM0K4264HTZjMN09FCWHJu5WMxACruBZ3FJbiQOtaF
	5jvs03Om6hLN51NgoSTczudgJW3D+n2NmMa5MMSVwAZXPRcS4bu1Jc3A7mt9mQg61clP
	OoOfiV3sU7z/Xomg/wLbNW/egJ9DAdqwQLjbjbkmuDBywJVGm0SxO+M7njSTq30Mc/lN
	vzDw==
X-Gm-Message-State: ALoCoQmMhAI1uKhYJ/xpCO1bLKhFyIRV54+qk2w39BTjL/qWEr+CB8qndkdJzBRjHJUEsEGYMffmQOKYsKmlpguAOyGhRBPjbA==
X-Received: by 10.66.90.133 with SMTP id bw5mr54875050pab.22.1452186394394;
	Thu, 07 Jan 2016 09:06:34 -0800 (PST)
Received: from fenrir.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	d8sm83449435pas.14.2016.01.07.09.06.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 09:06:33 -0800 (PST)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jan 2016 09:06:28 -0800
Message-Id: <1452186388-6796-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.4.3
Subject: [meta-oe][PATCH] gpsd: Add patch to fix broken ACTIVATE hook.
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
X-List-Received-Date: Thu, 07 Jan 2016 17:06:35 -0000

This patch is already in mainline gpsd. It fixes a
bug where the ACTIVATE hook for a device never gets
called.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 ...e-Fix-issue-with-ACTIVATE-hook-not-being-.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch
new file mode 100644
index 0000000..ce971de
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch
@@ -0,0 +1,32 @@
+From 6ff099b1ba8de74df9ddeb61e3825264b96ef692 Mon Sep 17 00:00:00 2001
+From: Moritz Fischer <moritz.fischer@ettus.com>
+Date: Tue, 22 Dec 2015 19:38:31 -0800
+Subject: [PATCH] libgpsd-core: Fix issue with ACTIVATE hook not being called.
+
+In the current system session->mode seemed to ignore the
+O_OPTIMIZE flag, leading to the ACTIVATE hook being ignored.
+
+Another way to fix this would be to keep the session->mode
+condition pull up the check for O_CONTINUE.
+
+Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
+---
+ libgpsd_core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgpsd_core.c b/libgpsd_core.c
+index 31fec2a..a84e85f 100644
+--- a/libgpsd_core.c
++++ b/libgpsd_core.c
+@@ -543,7 +543,7 @@ int gpsd_open(struct gps_device_t *session)
+ int gpsd_activate(struct gps_device_t *session, const int mode)
+ /* acquire a connection to the GPS device */
+ {
+-    if (session->mode == O_OPTIMIZE)
++    if (mode == O_OPTIMIZE)
+ 	gpsd_run_device_hook(&session->context->errout,
+ 			     session->gpsdata.dev.path, "ACTIVATE");
+     session->gpsdata.gps_fd = gpsd_open(session);
+-- 
+2.4.3
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 6ae2f30..646360c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch \
     file://0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch \
     file://0001-Include-stdatomic.h-only-in-C-mode.patch \
+    file://0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch \
     file://gpsd-default \
     file://gpsd \
     file://60-gpsd.rules \
-- 
2.4.3


