Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D890010A88FB
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:58:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54023.1774547874185406632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dr+4Wprk;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso830178f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774547872; x=1775152672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLPBkycirwHGNG9jGEGuWM/HKaMwfz2jrCtl7N30bTw=;
        b=dr+4WprkRNs+fWuYcDXBsZEPBvSnWQKZ50GHr6xU8TkQ1vNF9yaayCbBIG9E6c/PGl
         sXOI2I0hcKxFqTt2bie0LdBill8qvK7I6V+Bnpn5+t1DhzjJpFiLTEbHZ2X3lnSvWWbX
         1xjt+Tnbbzfvb/EPksMvPL/7Wde6DLBnatCv2/rtGV64fJXTx7rrDiSmrHFzjvPjdsOm
         M6V1Gk+9vOiMjVWkHGp5OBFyc6znJVIkjC8Qw5rxtHV8hqOA9Ke6H6j922dpDbxh5uXx
         bDCw7lKtSFHj2xHJtH82Q6gh6/9ubnCafMrYJXrWKPT8+ZCOYmZt1HlFkKYRj5EukvCH
         Dd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547873; x=1775152673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLPBkycirwHGNG9jGEGuWM/HKaMwfz2jrCtl7N30bTw=;
        b=o4S5i3vLIeAisfZBjzInUJ5ZaAVVbuBbOHDFy7LRqYntTf4XxvXqBX0dLV9r8p9Bpf
         zK282r6pfxq/LVPncY1vDSlZtyDn4tBwbwfsxS3dV5AIyhvTxPgL9/a59G3kaYPtACYQ
         V/gpZjHdlSu8LxP9uPPMrHMdNTEIVputXLPo7K/ZuvbnrEnIt4OOHlBNWnk0/P2yyhyQ
         LLwti07N4GZDrsHm8NCfs+1xdoewbAg9fnFVBLDTuXws8SVmNXhJOf3JxF1iT/zBzqiE
         Q0KebOHsIrqo7gGpomkKLYnBRQicNQChn2UAtQxwD0HEzXVtIXi1yLhEWTFe/hi6l6+f
         uLYg==
X-Gm-Message-State: AOJu0YwON3GEf0zRD2a6e5g7q8U8JQzRjLo65rhBoGHYftonAoAxkrbF
	4ihZwFw2WGTRNIdBnQkRyqrjV0ozbhqIqURduiFv6xuRRmmQK6xsKujSfW36WZtG
X-Gm-Gg: ATEYQzxAkSZ7PbUTczY4b/DQ7QShsWOSa9cNPQ+DRdNbnfoHaV3bQ/4ZuUA+GDP4Ed/
	YAI8lKN9eUQtDKIcr+CJbiX+zDgWcBjjc1xae+1vS8BPXdS1MKUBnvEIH+lRJvOgFZBy41qQo9P
	+2xbj35hfEkwAJ/ebtPAhwnqZW5r2CkhjpAIt4iNd/EraoaBiQXK6k9pgkRw8+zFsNRLZHWq1+v
	wWveT/rZJFP6FbmTZYWrSJ1CnNX9kkXMnIP7j1zcTFRoqHmIYP6my96q126mbN7vlEgx1mtKrM3
	SiDjm9Qspdlc9rCvQNh5DMZErfkPb5RyWRwNu2JiyIaALRVZwgQkW/W1CQQp3YY/mFFYaV58ApQ
	7VEvItLdCi6defDTylHQUezcPnnKIZvH/wmzGaP8McTBS4C0mRg6o1Os210sUzKPFHmxr4sfG4v
	vw6++AdjEYYH7MMpws4uoQ4iCdIQ==
X-Received: by 2002:adf:fa04:0:b0:43b:60f7:2282 with SMTP id ffacd0b85a97d-43b889f58fdmr10229521f8f.28.1774547872406;
        Thu, 26 Mar 2026 10:57:52 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm9679538f8f.30.2026.03.26.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:57:51 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] freerdp: remove 0001-Fix-const-qualifier-error.patch
Date: Thu, 26 Mar 2026 18:57:48 +0100
Message-ID: <20260326175748.4159234-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 17:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125769

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

