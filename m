Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2448310A88F6
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:47:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54600.1774547245035002459
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ofhKkHYh;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso823955f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774547243; x=1775152043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLPBkycirwHGNG9jGEGuWM/HKaMwfz2jrCtl7N30bTw=;
        b=ofhKkHYhZnVWnX+qaiEBodlLhriuoDBu/WFZls/g2KZYxNU8DuL6Qx76qTtlXOWtZ5
         d9MY3id068uxptW6gMPCrUBBXvvub0B/veWvkiE3DtGZ0D0JZW6wJDzZ+cs59gBFQWAQ
         qel2GcAmNysldTrPzigXK0GNnUIPA7UnzNUAqXgxcIe/olA8kBCJiyBJu6Js++Eoh4jr
         hUMCV22OjE3NHn6xSiP4oCHflU376Tie1rn2mLCf9S8HUfQ5ky6yAwiqyjdcoT7hWG3V
         KoJgt0stznlM+wwJaJcErQzkS2llI/KaTCJOhGTMg7OOuv06A+Cn10zrll1gzw1zorAi
         IFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547243; x=1775152043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLPBkycirwHGNG9jGEGuWM/HKaMwfz2jrCtl7N30bTw=;
        b=bsOLhtVcLu2ZtXcebFp5kd4y92zIpMxpWNMlMtpKlcNPj01AW8OIZDTSQ7ujNSVZ0Z
         e6+DVA3+fPMfMy+iJ8CkOlfBBTiDpznktK906GFii5M48FghyfQgnZd/YdZWmeYLfH+s
         LP5v31LVQBiY0LWW1n3Buj0TK4HiO1vVp2Lxu7QR2VA4AGKZpPRaF4YlrTXzBGPyTmg4
         XY0N6kgV9Ji3+UC1fuHCBlvsyVHtugSWfOyom9XBTAJjkfXlqPdcUtjD85tkpimysTPr
         1gLOUdAMjT9EJspDzLwp5/mL+8wkqEZ6hmXdbvFP3fsaLDb8LOf4/NE4qo7e4goIV+nl
         XBjA==
X-Gm-Message-State: AOJu0YyxfdmYGDWfCtlH+1wJWyNO2GyQ3cd7R/iZIhkabgzuTQNBMgZb
	hVcLl5m/tydzcapnW5OoEXpwHQMSL7C24gHav+TeCi/jmVY6Dn/Q37OwqfyRdm8y
X-Gm-Gg: ATEYQzz2bpN5Y8WkclL/FmDQGRxe9zOtxPVIOYf2gmGmd1vHXRkyI1uMFM/LHS1LKSx
	Z/CpQueIXoS1qo4qKMXP8sNeEp6nw6YY0pa1wByoE8Nx5VeZjAm/xjkfqR2A1ECDHPq7a4M4xtC
	TEq2THrMj+SgmAVOlAu6GjxHHnK1llm4cWqC1Ze1JTof/4y7+xb6v430wav6ka9WVT6e00Du74T
	Xu6Hj0p64GWHWb82T9qUfy005LJE5zBf4cedGhIBUWkpVJdNKwdnPEXlwCCyDWMxznubQwdM23M
	wPHJglkZQAcBFilf4rkN8mVOtYy55r4dqu7l6ozyjeZaYdhnWUF5yG6/0mQKmMk+w4ZXQONnn/+
	7i4A4fKxYVyBHJRv5eDoKSi4amDWe4S/16P87iN0vXUvstkjeBXI4mgCrSPt4Fiex5F6B/beFek
	1dn8EiOS+4z1fQPWixFsCsjq8DqA==
X-Received: by 2002:a05:6000:26cb:b0:43b:9903:2ba3 with SMTP id ffacd0b85a97d-43b99032babmr3300062f8f.33.1774547243218;
        Thu, 26 Mar 2026 10:47:23 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm8908570f8f.16.2026.03.26.10.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:47:22 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] freerdp: remove 0001-Fix-const-qualifier-error.patch
Date: Thu, 26 Mar 2026 18:47:14 +0100
Message-ID: <20260326174714.3811074-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 17:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125765

From: Martin Jansa <martin.jansa@gmail.com>

Instead of fixing the build with clang this is now breaking it after 2.11.8 commit:
https://github.com/FreeRDP/FreeRDP/commit/67818bddb31900cdf3acb26cb0b673cc90b71cc9

freerdp/2.11.8/git/client/Wayland/wlfreerdp.c:637:19: error: incompatible function pointer types assigning to 'OBJECT_NEW_FN' (aka 'void *(*)(const void *)') from 'void *(void *)' [-Wincompatible-function-pointer-types]
  637 |         obj->fnObjectNew = uwac_event_clone;
      |                          ^ ~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-Fix-const-qualifier-error.patch      | 57 -------------------
 .../recipes-support/freerdp/freerdp_2.11.8.bb |  1 -
 2 files changed, 58 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
deleted file mode 100644
index 87a456d16d..0000000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 761b4df04a141cc8c9507c741e4046c6c6b00491 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Mon, 11 Sep 2023 09:00:39 +0000
-Subject: [PATCH] Fix const qualifier error
-
-Fixes clang error
-error: incompatible function pointer types assigning to 'OBJECT_NEW_FN' (aka 'void *(*)(void *)') from 'void *(const void *)' [-Wincompatible-function-pointer-types]
-|         obj->fnObjectNew = uwac_event_clone;
-|                          ^ ~~~~~~~~~~~~~~~~
-
-https://github.com/FreeRDP/FreeRDP/commit/6e3c00725aae99d03a0baa65430eceddebd9dee8
-Upstream-Status: Backport
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- libfreerdp/codec/rfx.c            | 4 ++--
- winpr/include/winpr/collections.h | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c
-index ccbc5af..eec7365 100644
---- a/libfreerdp/codec/rfx.c
-+++ b/libfreerdp/codec/rfx.c
-@@ -153,7 +153,7 @@ static void rfx_tile_init(void* obj)
- 	}
- }
- 
--static void* rfx_decoder_tile_new(void* val)
-+static void* rfx_decoder_tile_new(const void* val)
- {
- 	RFX_TILE* tile = NULL;
- 	WINPR_UNUSED(val);
-@@ -184,7 +184,7 @@ static void rfx_decoder_tile_free(void* obj)
- 	}
- }
- 
--static void* rfx_encoder_tile_new(void* val)
-+static void* rfx_encoder_tile_new(const void* val)
- {
- 	WINPR_UNUSED(val);
- 	return calloc(1, sizeof(RFX_TILE));
-diff --git a/winpr/include/winpr/collections.h b/winpr/include/winpr/collections.h
-index 807f011..b8c8d9d 100644
---- a/winpr/include/winpr/collections.h
-+++ b/winpr/include/winpr/collections.h
-@@ -36,7 +36,7 @@ extern "C"
- {
- #endif
- 
--	typedef void* (*OBJECT_NEW_FN)(void* val);
-+	typedef void* (*OBJECT_NEW_FN)(const void* val);
- 	typedef void (*OBJECT_INIT_FN)(void* obj);
- 	typedef void (*OBJECT_UNINIT_FN)(void* obj);
- 	typedef void (*OBJECT_FREE_FN)(void* obj);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
index 9c3d532438..c596aaa328 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
@@ -16,7 +16,6 @@ PKGV = "${GITPKGVTAG}"
 SRCREV = "9b678b6d5a40ce01607d8c3b1b1416437c8416c4"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
-           file://0001-Fix-const-qualifier-error.patch \
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
            file://CVE-2024-32661.patch \
            "

