Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07FFC55196
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:21:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41010.1785756068456980889
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j5j+qJNb;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacf197759so46463485ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756068; x=1786360868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xheTwc3yOOkrp69x8B+bUwjYJw2LDHW3VFAPP7pEshM=;
        b=j5j+qJNbCSeH9cKsvQv3uwcf6Kx5RRuf0kEHh4BuzG1l3GyxkuwTJyUk+QSZj5hYV/
         LclU/2O9EPSencATPAlWoBkxbR22bQ4Jmn6U8FAHbTF3FwUWaBlDPnJvzytRZULxdzPe
         +pkfE+zGwtIcYtGQ/jIJbSDTa64Ao7yrdsBayq/RTKlDv5M2MArahDupRBs4F3nNCuTl
         NOZZ/FaeoPdzuLgCwttUzMm26+ZOpaFK85a0374Am0Hjf5vQqwR/beXAsWgmvGRGuyam
         kGA/t+b6TuAi+miXGKvFd6wMy/dmoMOh49Bv8RhHdgwME7CEY8VXcU/nbCdA33zQErlR
         hgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756068; x=1786360868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xheTwc3yOOkrp69x8B+bUwjYJw2LDHW3VFAPP7pEshM=;
        b=dRkCTKsRa19/OF3sAJQUbduAdT8xesvcJS2lckZK9RW3jhZynvoxyAeATndYRrNzBe
         in+OC4PC9zDXkVk48jQYlUdUwacPQZFFHf4oFyQ79CDGez7/LPpsA9dabK09cTbF7z2E
         4VgnzEmqB+h24ktHMqpDl/jdluilv9mVOjH39MGSz+oEl8Au5U0ZCkUiDgTWwMQrMKaL
         j0rcGjF3x2WWbuQBhx9u9o4fzzBykjfQtz0DNSQiOVcv2J8GObr0VHZPUqs4CfoZ2AD9
         JZ7rMtgQybgMuK3IWAcjqgLNs7OFQXgPXrSGIsJLbElNDPOOP67Tlp5Y7cRBO6IesRLh
         ld4w==
X-Gm-Message-State: AOJu0YwO85WynG+d4ktwj3Op6J5KHWzYotcpwptIycbKdih8Ida82JV+
	mTwgDOx8Kh6ZDjZfLZAOA3r2FCbrcS0Cgw3xOo7EeHRUGYpHe2LnrteyscTYzbJA
X-Gm-Gg: AR+sD1096hjrXZCARpbKx80uAfUIpNwpNsgLg3CcnK3t471dTuK8YFFYdX4O5AkG9f2
	Xp3D5dXSab9QptS2K+itqpS7Y+QtVQmeGURogCkKV1AF1Ju1GPPrOamm+LhnvOsGQBh86INMf2A
	CasAKW/idM2dKmUpHo2sHQX3BNYOophdWukwACrw+NvqW6F9ThQ2r2PITALexL7OZMW6yfHHMpN
	kIC1LKLlV4zJ88n8SIItqZiQWzViMxxhd3zEnwO+u7xweiZqYKiCjEYDap6DMTkOM6GGuP6h4DA
	TNtziKp2WyKIXxDUZHA975FTIbYsCQMP9V4vtjzW2bi+Ky9vTatMluHvw+JDAoC/OJOpfC11LlQ
	uUu5gFonGix/TilnqEStobfV9pRkUp69Gibqri9aXYsjdG7JGEW8lOPwslw0gVPA1ZjK6EHNzvt
	G30991LOJiuiKqEXrSDOOr3DkklgXT3S+IM/PzNEgb4xOVv5luE2VViFOMbi7OytpKJipre6Aw+
	6o=
X-Received: by 2002:a05:6a21:1b84:b0:3c3:a0cd:9d27 with SMTP id adf61e73a8af0-3c92a5f1c7emr9791736637.26.1785756067818;
        Mon, 03 Aug 2026 04:21:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddcba2bsm42463843eec.11.2026.08.03.04.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/6] libplacebo: upgrade 7.351.0 -> 7.360.1
Date: Mon,  3 Aug 2026 23:20:52 +1200
Message-ID: <20260803112055.3926085-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
References: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 11:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128678

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is merged in the upstream version.
Also updated branch and included tag in the SRC_URI.

Changelog:
https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.0
https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...vulkan-utils_gen-fix-for-python-3.14.patch | 30 -------------------
 ...acebo_7.351.0.bb => libplacebo_7.360.1.bb} |  6 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-vulkan-utils_gen-fix-for-python-3.14.patch
 rename meta-oe/recipes-multimedia/mplayer/{libplacebo_7.351.0.bb => libplacebo_7.360.1.bb} (88%)

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-vulkan-utils_gen-fix-for-python-3.14.patch b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-vulkan-utils_gen-fix-for-python-3.14.patch
deleted file mode 100644
index 4e381af340..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-vulkan-utils_gen-fix-for-python-3.14.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ae40237869ae1db4de7f6d86865bc99820852495 Mon Sep 17 00:00:00 2001
-From: Nicolas Chauvet <kwizart@gmail.com>
-Date: Tue, 29 Jul 2025 11:42:35 +0200
-Subject: [PATCH] vulkan/utils_gen: fix for python 3.14
-
-Python 3.14+ has added more type checking. This patch fixes usage
-
-Fixes: https://github.com/haasn/libplacebo/issues/335
-
-Upstream-Status: Backport [https://code.videolan.org/videolan/libplacebo/-/commit/12509c0f1ee8c22ae163017f0a5e7b8a9d983a17]
-Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/vulkan/utils_gen.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/vulkan/utils_gen.py b/src/vulkan/utils_gen.py
-index 9a97d35f..9b803d82 100644
---- a/src/vulkan/utils_gen.py
-+++ b/src/vulkan/utils_gen.py
-@@ -202,7 +202,8 @@ if __name__ == '__main__':
-     if not xmlfile or xmlfile == '':
-         xmlfile = find_registry_xml(datadir)
- 
--    registry = VkXML(ET.parse(xmlfile))
-+    tree = ET.parse(xmlfile)
-+    registry = VkXML(tree.getroot())
-     with open(outfile, 'w') as f:
-         f.write(TEMPLATE.render(
-             vkresults = get_vkenum(registry, 'VkResult'),
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb
similarity index 88%
rename from meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
rename to meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb
index 3a1096bb57..94767730a8 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"
 
 DEPENDS += "fastfloat glad-native python3-mako-native python3-jinja2-native vulkan-headers"
 
-SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.351 \
-           file://0001-vulkan-utils_gen-fix-for-python-3.14.patch \
-          "
-SRCREV = "3188549fba13bbdf3a5a98de2a38c2e71f04e21e"
+SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=release;tag=v${PV}"
+SRCREV = "cee9b076f2c63104ccfd497fa79c39a867293ec4"
 
 inherit meson pkgconfig
 

