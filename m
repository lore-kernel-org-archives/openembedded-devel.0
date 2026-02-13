Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C24DEDF176
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 15:42:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74624.1770997353249730171
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 07:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjiqO/jK;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-436263e31abso1002607f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 07:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770997352; x=1771602152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqCwEPL5SYQssa7JrIGpelCWXCHQOGs76fF92jmmJ2A=;
        b=mjiqO/jK50jaRSblcfTETEUQ9N1vkIftIfugqGO/ZUvj1V66s4M8Cxn0Hjp819hd7c
         8qPOKp7f/xjqQQcgfNJzPAPlJ6HcsgiJP+ojbtc/PTiff2O1tFcAl8eJ5Nc4rzRBiAFt
         iBMD9PVSJNij/6+VX6VKHSojEA8oPE+XK5R2Yn4R+pDgYkpfB2O9oyhUdICt2+HJk/Uo
         GUkofk23p68T5DUnKa4Cv7uHAFwoJz5UJaqSSgWXGNGfM6z+x0SOvYhtGb8bJIAsEtTJ
         yXBXkNZQQjj6V7UXY/vCCSBceFZj2qf62YcZpGL4MmWFW05H972posULr/SOxcsdGaOA
         /yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770997352; x=1771602152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GqCwEPL5SYQssa7JrIGpelCWXCHQOGs76fF92jmmJ2A=;
        b=YCcDcG6bs+gR8ihXHLpbzmcags5mdsvFiSbNQ7yCDQKT061gXR2DtTwfG8pkcx7bqV
         f1QZdYFj8PiPM4E6HNthS4T8VRASDGbHXkPi3aFLcZyfGexatslBjVBcWi8vux1z9tiU
         8/QiIs5bBsWx57Rs6daVPuuVkklbso0XZpZI5rloQ9+PVfxTRW7YK3Vi9lq/qAQoV//k
         gVtCk+wFZxHogElfasbNqa0AuXDbZ4AoiC5sWf6EFxTYFXDHnRc68ITwPnzAMqX+kjrW
         1+jolDVYtKwoNODaL2m+ot+iU8bG53tS2I/+Jn1p7enNLjIlzV9N34bxj+SUKm3LeKZw
         6AUA==
X-Gm-Message-State: AOJu0Yz0HvAyCAzUVb35bEKHw4ylqTcYeXT7OAq7uQ7MbEJpmHhIj6ue
	9SFgdoedFe/oTuBM97iQSmbSVIqmGOjMjkgElv2XwYgoVxZp69BtO3/sJvIxTg==
X-Gm-Gg: AZuq6aI4Y9WSIsFmCh0RPcDsgcbSYVVrMgzRCSUQA2UrSVtxIiDHPynwS+GlbUesikP
	uYXZ5rxATZ7TZ8rSLqq2u4ru9JXkiwYzEeUL1/D7eZyZPdTHauz1zqG5r6PeRC2lRt+OSdHgkdr
	p6uxiO7AYzkWrNPsa7TZLGswM1CLYjqXMNxQL0US5qWsdOld9AvyZ5xlrHLb2cGhdMZi2uf82Kn
	MVqzk2ibjHT8uAT47NYMRqVH23K6Kiqqnvved4Y8qx3wPWN9ZWM00zHe5OLlGjU7v77F7cNeIRt
	Nzq3TRzpBL7HzEQ668DgBZHtB/+G8tZ69pQuVaNwiFYUb4BuZD9yRA6i0sH/DSMdLyUmYE6qhJk
	IKdtB155D8L7tkTZh/KaM6R7OM+PI1wjAavYcsu1eB7eLvW5g0zIwqNAV05YiiDJ5BAP8rZxo+I
	wn026eQsO3VX9Y3ssJaqTm
X-Received: by 2002:a05:6000:603:b0:436:3483:5c8 with SMTP id ffacd0b85a97d-4379791ce00mr4369678f8f.50.1770997351453;
        Fri, 13 Feb 2026 07:42:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1b4sm5807957f8f.14.2026.02.13.07.42.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 07:42:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 2/5] libeml: patch CVE-2015-8791
Date: Fri, 13 Feb 2026 16:42:26 +0100
Message-ID: <20260213154229.1329476-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213154229.1329476-1-skandigraun@gmail.com>
References: <20260213154229.1329476-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 15:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124391

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-8791

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libebml/libebml/CVE-2015-8791.patch       | 29 +++++++++++++++++++
 .../recipes-mkv/libebml/libebml_1.3.0.bb      | 10 +++----
 2 files changed, 34 insertions(+), 5 deletions(-)
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/CVE-2015-8791.patch

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/CVE-2015-8791.patch b/meta-multimedia/recipes-mkv/libebml/libebml/CVE-2015-8791.patch
new file mode 100644
index 0000000000..e007e2fb92
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libebml/libebml/CVE-2015-8791.patch
@@ -0,0 +1,29 @@
+From 22b87d8217606d891e73fc59a598bae830e61d65 Mon Sep 17 00:00:00 2001
+From: Moritz Bunkus <moritz@bunkus.org>
+Date: Tue, 20 Oct 2015 14:49:44 +0200
+Subject: [PATCH] EbmlElement: don't read beyond end of buffer when reading
+ variable length integers
+
+CVE: CVE-2015-8791
+Upstream-Status: Backport [https://github.com/Matroska-Org/libebml/commit/24e5cd7c666b1ddd85619d60486db0a5481c1b90]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/EbmlElement.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/EbmlElement.cpp b/src/EbmlElement.cpp
+index 4b96d06..0969468 100644
+--- a/src/EbmlElement.cpp
++++ b/src/EbmlElement.cpp
+@@ -149,6 +149,11 @@ uint64 ReadCodedSizeValue(const binary * InBuffer, uint32 & BufferSize, uint64 &
+ 			// ID found
+ 			PossibleSizeLength = SizeIdx + 1;
+ 			SizeBitMask >>= SizeIdx;
++
++			// Guard against invalid memory accesses with incomplete IDs.
++			if (PossibleSizeLength > BufferSize)
++				break;
++
+ 			for (SizeIdx = 0; SizeIdx < PossibleSizeLength; SizeIdx++) {
+ 				PossibleSize[SizeIdx] = InBuffer[SizeIdx];
+ 			}
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
index 744486fa2a..9caf25205b 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
@@ -2,11 +2,11 @@ SUMMARY = "libebml is a C++ libary to parse EBML files"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "\
-    http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2 \
-    file://ldflags.patch \
-    file://override-uname.patch \
-"
+SRC_URI = "http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2 \
+           file://ldflags.patch \
+           file://override-uname.patch \
+           file://CVE-2015-8791.patch \
+           "
 SRC_URI[md5sum] = "efec729bf5a51e649e1d9d1f61c0ae7a"
 SRC_URI[sha256sum] = "83b074d6b62715aa0080406ea84d33df2e44b5d874096640233a4db49b8096de"
 

