Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8752ACA5FBA
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:04 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1474.1790722677705575336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rwI7KIn9;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-343479e6005so879648eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722677; x=1791327477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IaRt9KYHoEssABYH1p8pYazjI7+hbklDAMkO4dR4h3E=;
        b=rwI7KIn90yj9aasV85HhECbdRMyBxRn+ZkD+c9aF1S7V3slUeXT2YT0tfAXWDBDlvt
         grtnl1aUVXOf+VkZwR/xR9t1eamDIDslsAP+py/mhSZiaPMwf9yvtLy/PsLlVE5dhL9R
         bhEjMXr+VPUnjkKxxA80FgB3/w3wgbCl22Xms2NGgU0Np+JGavYXf/QGKo2f/SRcjXT7
         yU6VnnghVSmp86GvqXeT21hvlX+ufQfNN9PEEvdMzBcujlAnG/M+fpS9NvLgfN0vgCAC
         H408iA81hJ93JJwFh7r2AwTnarInAL7CNpWdZm92ZIs5yFwmr1mQw//VcJZzpCfbd0D/
         SvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722677; x=1791327477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IaRt9KYHoEssABYH1p8pYazjI7+hbklDAMkO4dR4h3E=;
        b=TNeF0G6anLBQNiar3EaajuOAwTpUjAFLQjT1P6cKbYaDDGiEReW0HxaOUgeNGlZXvF
         S0y0ksbEBlPZW6/j6kcxG2avaRUHBcR5bdWnyx8oRHKdz8DlA8D/IO6gAjNaSinR+X1o
         Bjia7UkpPZd5oF/Mk4oHrOHySQ1SQNIoiRlr04Guju/WNTPfrXKUO0iKj3me0hfL2CwM
         h22vUdRE9/X4v7nm4KmlbmWpdxuG4Mn3YzoWNGj17H4VFs2QjOCgUG0b7crILGIuRw31
         B+MROse0M6OAjgIQopnC9B0dmnjQucRDoR/4KjOOqRBWbZDcUxeMp5CCZvOntHckCVf8
         7Pew==
X-Gm-Message-State: AFq9FYK+wY9CCxjJKCk/t9Vrm9W50HNzVBYErrg0Gee5KPq8MGNq3Q1u
	kljZhUjCx2r1mJqJkA534wP8lryBhNaUYE3LFF6uZ4yV0Qt4ioSiN4K1X+m/v3G43yA=
X-Gm-Gg: AYBFou3QJIirVa/oOXC8YdzbL70d60B5mbPZjrkJ46tQAttSFHvKZFMiccY+C8pgwFm
	47Sltx7J+W9NHmS/e5TMpA5pmRegp8mohIsw9CIvY0U6+jm40+ILz/3E17ic0GbIfAYo4KxRN7j
	mKnB3UalLDiaAjVotCtKle7Zn8bttGJ8QVnYJA+Ws7+E/DyZTEq3WSUszi4IZvrLU391R/qfR7S
	H0i9wedJXlRstgr6baZxvD4B9igOytKUaN/RQQU4P6Tj5VJv5T6+SSj0eYkiIyq4NuK0qeciXsq
	LFijbmoMi4oIHe5q7TOcD7tqhyQBZfxSk4veE5e8ytHrLcqzU7ECGjlXLj0Phd8efXA/gGWwzma
	arN72uZPWIznHTvivDdiyjira+zGxvmTEAslIGg97KKZafAs7ecSNRCxSm6V9NvGIEP06joL+jM
	aZBbFPnG2TUbbbxHJ30N5iBe6KDNwHmkOTflv6xw2R4MOmHPPf/6kodp6IiOhptlxaLx8EhgyK+
	degrYygdPAyyLEygnmSEwiX0UKxEM5g1rjXl9HvrbxrLI+mlLCrmdP3IMek3tCqqN+5WfcI/hsW
	bVUzXl5FrxKyjFV7WlUrkNW32XA55zFBggplwydRBxRYgKs+fqit0FUufMviNa57lYwzT1MN/N5
	UU5Q1TRsYL/DoKR44i61UrbVbwAwu1y/qhXe1QhOSPyv46GclhOLqNm0tBraKE7Dpo9yy9GNNVS
	nXaiyVVeXnKMXOOzQgBoQIiRgZSmQIaYWfRTlHHA==
X-Received: by 2002:a05:7301:dd92:b0:341:c383:9afb with SMTP id 5a478bee46e88-34af9303d98mr4205717eec.20.1790722676913;
        Tue, 29 Sep 2026 15:57:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 20/26] bmap-writer: cast BLKGETSIZE64 ioctl request to int for musl
Date: Tue, 29 Sep 2026 15:57:17 -0700
Message-ID: <20260929225723.1046705-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130507

musl's ioctl() takes 'int request' where glibc's takes 'unsigned
long', so passing BLKGETSIZE64 directly trips -Wsign-conversion under
-Werror. Cast it explicitly.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../bmap-writer/bmap-writer_1.0.5.bb          |  4 +-
 ...-library-s-ioctl-request-type-for-BL.patch | 50 +++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/bmap-writer/files/0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch

diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
index 160d1b7112..71ea721eed 100644
--- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
@@ -8,7 +8,9 @@ SECTION = "console/utils"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e49f4652534af377a713df3d9dec60cb"
 
-SRC_URI = "git://github.com/embetrix/${BPN};branch=master;protocol=https;tag=${PV}"
+SRC_URI = "git://github.com/embetrix/${BPN};branch=master;protocol=https;tag=${PV} \
+           file://0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch \
+           "
 SRCREV = "c7b1bec0f40217d17e315226552e461a4a816abc"
 
 DEPENDS = "libtinyxml2 libarchive"
diff --git a/meta-oe/recipes-support/bmap-writer/files/0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch b/meta-oe/recipes-support/bmap-writer/files/0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch
new file mode 100644
index 0000000000..236ff7d1ef
--- /dev/null
+++ b/meta-oe/recipes-support/bmap-writer/files/0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch
@@ -0,0 +1,50 @@
+From 7b96cb4998714bbb338adecafad8614484feb8cd Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 12:56:53 -0700
+Subject: [PATCH] device: Use the C library's ioctl request type for
+ BLKGETSIZE64
+
+The type of ioctl()'s request argument differs between C libraries:
+glibc declares it as unsigned long, musl and bionic as int. BLKGETSIZE64
+is an unsigned long constant, so with -Wconversion -Wsign-conversion
+-Werror passing it directly fails on musl, while casting it to int fails
+on glibc:
+
+  device.cpp:163:50: error: unsigned conversion from 'int' to 'long unsigned int' changes value from '-2146954638' to '18446744071562596978' [-Werror=sign-conversion]
+
+Deduce the request type from the ioctl() declaration and convert the
+request code to it explicitly, which builds on both.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/device.cpp | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/device.cpp b/src/device.cpp
+index 2c06c84..d1fa995 100644
+--- a/src/device.cpp
++++ b/src/device.cpp
+@@ -151,6 +151,13 @@ int openTargetDevice(const std::string& device) {
+     return fd;
+ }
+ 
++// The type of ioctl()'s request argument depends on the C library: glibc
++// uses unsigned long, musl and bionic use int. Deduce it from the
++// declaration so request codes can be converted explicitly on all of them.
++template <typename Request>
++static Request ioctlRequestType(int (*)(int, Request, ...));
++using ioctl_request_t = decltype(ioctlRequestType(&::ioctl));
++
+ // Capacity of the target in bytes, or 0 when it cannot be determined (a
+ // regular file which simply grows as needed).
+ uint64_t getDeviceSize(int fd) {
+@@ -160,7 +167,7 @@ uint64_t getDeviceSize(int fd) {
+     if (::fstat(fd, &statbuf) != 0) {
+         return 0;
+     }
+-    if (S_ISBLK(statbuf.st_mode) && (::ioctl(fd, BLKGETSIZE64, &size) != 0)) {
++    if (S_ISBLK(statbuf.st_mode) && (::ioctl(fd, static_cast<ioctl_request_t>(BLKGETSIZE64), &size) != 0)) {
+         return 0;
+     }
+ 

