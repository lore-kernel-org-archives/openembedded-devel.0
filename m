Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04963C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:19 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22335.1785672318237912353
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YMfTxGXx;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceab75934dso27995895ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672317; x=1786277117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgexWeVnQH06iCQNGCNtXdC8muWGeckal94DD6yGy0g=;
        b=YMfTxGXxdeVD+t2SbCOff1EtqDgWF0D0F8SUIHCtmIRFwzbaerncNHpPJ3JgsG23On
         UNbEqFLpSTBgrzdD4U6Z1jYNqC3I9Aqpd+StGyupLZY7Kgy2z36sufNIRE2Ehs6HJoQb
         dxBcLWH/bF5H2RMrJ0y2Hzb7cffQRljwXotC7R3oJEZGcbm+XcZW/tgeXiSHVH5XSG7O
         eqLvVrHZaFJqa2VGD0T+zDSHLineoA1tyegA17gTL7qJ5B6Wjbf4+L9WpzQN0EOHAeZl
         mv56wIV+JwIOe1cqSo4SB9Im4gIdGY0M3uWVkWfJ6kcotlZAcn3260xLlkLVu8BXcXZG
         9Lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672317; x=1786277117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgexWeVnQH06iCQNGCNtXdC8muWGeckal94DD6yGy0g=;
        b=dYzyKWmcyOAKj1Rkerx1+IdexVze8gAdA83tij+yyTmpBbaFdi+W7PMULEBmVOvS0g
         iGQsrHG584d8Y+1OKjsFfasBhVysm2+Muai4QztttbHG/+FrG9NfcELigzVypDUJ3Dgx
         HzgogCrrNXbwdaWk1HiBGeZhNcgdBmBIXJOircz37hspZCrd37v5T9Rl2eAsdLvZ8Wjl
         5c+7QQrD4AieqSoYK13TKvHlE2ogAtvWevEItcnaBjw0ViZ1BN0JjNfKRj8eLvxZFjN0
         2D+A1M9LX5Wsd3LzqH0RYd/Ul4OzSYbbimax15Oc9aVQ7EbBqS4F7nzOSzwm9ubOtDMn
         B9gQ==
X-Gm-Message-State: AOJu0YwgxDA87TwwALumPy9aSXWkk4e3q6JPuOCIUEOb0DyETmLRWAPT
	JToqtLfsr1XWSgn9CYly3jG6L97zOUP+/MPqlT/fjgEhGuKuO1H51X/YsszfDg==
X-Gm-Gg: AR+sD13DDnmmOvcQqC0lBl8B9aLQRE1SRgIN2rzyT0/a3yB1IphJNH4mKDLOB5Zamkm
	+Hogl/Ik7A1Xo0DmPyR06+mkRtBvCS4B7Qnm4WqtrfS6FPoViXDrbJlO0rujzki57cwZsdQCeZ4
	niqa1g6r3FzAwrKia5pB1VstWvfa4E7+fSQGczBpcSl8WpzWa8nLK4Qw9kOaOi0QQZ7/7OxASar
	14SWSJjHp3NTx9X5AfvWBEF7aWYtursU35CyT6KN6L8kclE1UNogZ8jU2N9TOjOqyTxIGXYDRJ+
	Zmv8UGrV/l8r82XBV12VeuQN6SS7o57dkGWDnfjVjsLuXcIN46i7sKuDA7+kHWiLfSKpgCHnbID
	btXkkF8NV41NBgFvOUUOplIagOFAH3x/lYfnzG2Mur5GB0j48u87UMfQ8L6NZiwe4XY0dp5OicP
	BurzuhFG4iBLsfjI2yauVIOhKCdOXNkuYx+04U+RW1QijX381mquyGyrqSK4aXzUHOBLA6XG12s
	6urloIWvUKQ
X-Received: by 2002:a05:6a21:1690:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3c92a517612mr6813977637.1.1785672317305;
        Sun, 02 Aug 2026 05:05:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master-next][PATCH 9/11] mbpoll: upgrade 1.5.2 -> 1.5.4
Date: Mon,  3 Aug 2026 00:04:40 +1200
Message-ID: <20260802120444.2973561-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128664

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped 0001-allow-build-with-cmake-4.patch as upstream fixed it.
Also included tag in the SRC_URI.

https://github.com/epsilonrt/mbpoll/releases/tag/v1.5.3
https://github.com/epsilonrt/mbpoll/releases/tag/v1.5.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 42 -------------------
 .../{mbpoll_1.5.2.bb => mbpoll_1.5.4.bb}      |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/mbpoll/mbpoll/0001-allow-build-with-cmake-4.patch
 rename meta-oe/recipes-devtools/mbpoll/{mbpoll_1.5.2.bb => mbpoll_1.5.4.bb} (84%)

diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/mbpoll/mbpoll/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index 25f4692856..0000000000
--- a/meta-oe/recipes-devtools/mbpoll/mbpoll/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 765fbaea85b723893c0c27d5527df479ab6abc46 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Mon, 7 Jul 2025 20:09:45 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Submitted [https://github.com/epsilonrt/mbpoll/pull/95]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6daa039..af32354 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- # -*- CMakeLists.txt generated by CodeLite IDE. Do not edit by hand -*-
- 
--cmake_minimum_required(VERSION 2.9)
-+cmake_minimum_required(VERSION 3.5)
- 
- # Workspace name
- project(mbpoll)
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.4.bb
similarity index 84%
rename from meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
rename to meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.4.bb
index 82afe632fd..18d5b4ad20 100644
--- a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
+++ b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.4.bb
@@ -8,8 +8,7 @@ HOMEPAGE = "https://github.com/epsilonrt/mbpoll"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS = "libmodbus (>=3.1.4)"
 
-SRC_URI = "git://github.com/epsilonrt/mbpoll;protocol=https;branch=master \
-        file://0001-allow-build-with-cmake-4.patch"
-SRCREV = "a0bd6c08d3d15b086f2104477295c0705aed366a"
+SRC_URI = "git://github.com/epsilonrt/mbpoll;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "d541211d0e2451888de11c82fb1604c3d6285b1a"
 
 inherit pkgconfig cmake

