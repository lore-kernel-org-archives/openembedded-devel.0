Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210A8E9E303
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:52:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18288.1770814340781553789
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HzzXeqKz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso8578005e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770814339; x=1771419139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3reNRf/evuNOL4FdpyrntJNfyhOtbT2p38j1vL34yxI=;
        b=HzzXeqKzEEsobtOrpwYtQ4z6WPut0IaVUggG4g/JVGYd0iO0TgdYY6FmDUnrCHHFcb
         Jdizdy9XlQFnw+4xTxKFpP2rwZMCjeB44VLayYQdOooAVzrzlxbPxT8ieC/vpwVWPFw0
         6l4eKQ35rVjZ5Cytk++Q954uURHEM2YDzcCRjpwLnnqf0JJpuZQRV2iR7IF5MfBEuUXW
         Nn56ZYJX97MyoaCE7bSH7vu63zLwzLXZ9xW+bmRlGXBeWIHvj5tcinuAJGke64QXYpM/
         zwL6VGemkBadl393axJ6UjAghoIWrm8RraTx06XohGcYCzySG8c8p9HwRCuo9WDj5Lns
         0hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770814339; x=1771419139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3reNRf/evuNOL4FdpyrntJNfyhOtbT2p38j1vL34yxI=;
        b=Km7Svax7S8Haa5zyWqXy6paLAxVgrRIPV/Pig14Kl3CpO+a53+Yvach+Fh+brxxGmr
         0XeRQhTgENdbh6nHBYYsWtD8ME4uunaO9ZUKYcwBF3Xqmlyiv8/03rczdhhUSD9245wG
         YUf/FA7ffiYyLpeYzCoUY5037fr9od6X/LrJgpC/rjVGW+nsZ1PU6A714hM/XmSydbgh
         wWoFyy7m3/vrckOgM5IIvKnMgkEGEzSRpWIgAMTcPMnAV2Gr80Y551rm18Fjs2pD/Pku
         pg+DU9N2rM/uwgNQGrubxeup2RfwmNGBoVKUFFmhgoX3bT4lO2//ONxnNllvIP5Ej5qf
         WUpQ==
X-Gm-Message-State: AOJu0YyvDXwhpm+/pc3omUOBvxgbaZcR9V7yJwh4khU6VjQGH12RZti1
	zzeMMzEsCHkgIOLY7USgt9mC+j/4zWx1vuewLYWgA2dLXiVcjF13izP7bY+eAg==
X-Gm-Gg: AZuq6aJtoktW1tNJSp1bj0IOBnZV0FCW4c52p9Fxday8jPIMUqd26bRFubMvXpeS4gY
	fv17LQn0WD4V7GS+BC2PGC+5gnNBzb9cSG+zyVWEO8w+1CT57NkniUuxPa0k/j2lQzA8kw0YYTm
	czO/0/AFR9nTs4xOEyeJBvOTiLv8E5ws8bI3adkC6Fb72yd9p0tkKXTY7rF+ycpUsUi/YiGqBfu
	pkgO/bCR2GW03Lbaswsyyv4i3b0jjzfnliQE4AgjxWHFBNeFxU+w+qRKPQvkDjrRNhydYdka8aC
	HVowf85PjMClq5grM6isl5GikOX0iLEyNCfrvztvE8AEoq1iz5ufXp7xwGNFAI+3HMBUipKsv6r
	FHxv80eppix5Uz/J+S04a8HQPqfgU9/+nqikYuqHoGPaEOv9Q3ymmpBwK/oZ4w37uROJaJNPmIu
	CX38MO3Lr0GDRY4peyF0ip
X-Received: by 2002:a05:600c:1548:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-4835052d123mr76415715e9.9.1770814338879;
        Wed, 11 Feb 2026 04:52:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm119141545e9.4.2026.02.11.04.52.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:52:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH v2] gnome-commander: upgrade 1.16.1 -> 1.16.2
Date: Wed, 11 Feb 2026 13:52:17 +0100
Message-ID: <20260211125217.2074834-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124339

Drop patch that is included in this version.

Changes:
 - Fix double g_error_free call in remote_close_callback
 - Fix build with taglib 2.0
 - Set project gnu++11 c++ language version explicitely

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: drop the patch from the recipe that is included in this release

 ...001-Build-fix-needed-with-taglib-2.0.patch | 37 -------------------
 ...er_1.16.1.bb => gnome-commander_1.16.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.16.1.bb => gnome-commander_1.16.2.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
deleted file mode 100644
index 8f6920c2cc..0000000000
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From dc3aa0ff5a41114b17816f1f36f6bb5631c6ab5c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Mar 2024 17:17:29 -0800
-Subject: [PATCH] Build fix needed with taglib 2.0
-
-Fixes
-| ../gnome-commander-1.16.1/src/tags/gnome-cmd-tags-taglib.cc:153:29: error: no member named 'sampleWidth' in 'TagLib::FLAC::Properties'
-|   153 |         if (flacProperties->sampleWidth())
-|       |             ~~~~~~~~~~~~~~  ^
-| ../gnome-commander-1.16.1/src/tags/gnome-cmd-tags-taglib.cc:154:67: error: no member named 'sampleWidth' in 'TagLib::FLAC::Properties'
-|   154 |             cout << "Audio.FLAC.SampleWidth  " << flacProperties->sampleWidth()<< endl;
-|       |                                                   ~~~~~~~~~~~~~~  ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tags/gnome-cmd-tags-taglib.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tags/gnome-cmd-tags-taglib.cc b/src/tags/gnome-cmd-tags-taglib.cc
-index 9e65836..573f5eb 100644
---- a/src/tags/gnome-cmd-tags-taglib.cc
-+++ b/src/tags/gnome-cmd-tags-taglib.cc
-@@ -150,8 +150,8 @@ bool getAudioProperties(GnomeCmdFileMetadata &metadata, const TagLib::AudioPrope
-     if (flacProperties)
-     {
-         metadata.add(TAG_AUDIO_CODEC,"FLAC");
--        if (flacProperties->sampleWidth())
--            cout << "Audio.FLAC.SampleWidth  " << flacProperties->sampleWidth()<< endl;
-+        if (flacProperties->bitsPerSample())
-+            cout << "Audio.FLAC.BitsPerSample  " << flacProperties->bitsPerSample()<< endl;
- 
-         return true;
-     }
--- 
-2.44.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
index bb36d59e56..e762298dbf 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
@@ -16,8 +16,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
-SRC_URI += "file://0001-Build-fix-needed-with-taglib-2.0.patch"
-SRC_URI[archive.sha256sum] = "3f1d00c4a650fe7902167648286b32c9ca4ef86e31a5d8ccca0139f12d10d0b3"
+SRC_URI[archive.sha256sum] = "7cf5d56c77a95d828f25407294312abaae20dc6b556ceafd9424dbfe209e5ed3"
 
 PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
 PACKAGECONFIG[exiv2] = "-Dexiv2=enabled,-Dexiv2=disabled,exiv2"

