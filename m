Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD221D43371
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:02:12 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8286.1765526532117042607
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gUmLj/md;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso1115745b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765526531; x=1766131331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSqzKGnsSo5MYtp7HRZwyYO6VioN7XspBp02DDW8E3o=;
        b=gUmLj/mdzG+PlupBDCnPjIwt1Umn7udceIuJp7nQ8Xc+8syVt23xemSgC02JlVQ+Qk
         HrMH4SmcmidPHBdCsSZ9R90bpwjp5b9AicJReAb/XX+NwrF3TNWfCVJ81YySfI9If7Tc
         B8t10ijBqIDwBfOJmUCttiG15HiQa4VJ8aubyr/UWWjBDhK9Fsi1sskhlItS1rK/U9Ua
         EULgjRIdRytc3WSMhSSNgD55WblIWMsNMXNVHUB9voXgA9oxtbBdrpwhLEACbleENEkh
         g7Q6RgZ5FVmv6ycGOsKctOblwRI1y6Vwgx1kONUSZbl7IolFWHiBWqZSxIrcRNrlC9ef
         Ygew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526531; x=1766131331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jSqzKGnsSo5MYtp7HRZwyYO6VioN7XspBp02DDW8E3o=;
        b=darHYLhSpHqvnPw1KY4WhRsxgpbTE8Qj/XrwPhhZeNYV+1L+8iYLk48+qSx+vNGTDV
         syto8AbWBvpqw0Gpb0DCxCJUaSh2ZNeikCr0g0vUXfWqUsvUeghCf479SlbZpM90Kre/
         1HGA+tF8pktb/szWJDYA3W9L78oszzI+0m4RCH8LkDQKhbIJhEcqKDHhmQB+KOgmdfRU
         uK5Dj+Ej9LN4U2SX6Z6BLuNxzz6IQjSHAnmLZXzzc+s4Oyd4/VZvXHemxGXxEgt8QePb
         JR0puJmT203gnJJeEjekw9+9vRYsiAfcYhm64/k5amdkct08LDYXJi+R6S1JZsyrIPFH
         f95A==
X-Gm-Message-State: AOJu0Ywmfg965ru0j016v4Z3lAAZZt509dpVgNfGV+Hbo7+KxhrG6e2m
	tcdE12Bh/Y+skxiXLbOLEog9r/ECBTMnB+5e9wEcYIgy+tU15iMQdJ7utxyt8g==
X-Gm-Gg: AY/fxX45pbFn9/SxRnSQY05Z3ZGBAGpwB1F4CfZOwOMW8Ay+FZkDmTULZhYUA6KmY2f
	6NOeaLpmVqhKiBsXnd/jKiKsIG2D66Os48EXaR2xnFRKEp4LIplQ3qWlF3n8gt8xhLlDVsnKzEH
	VAaL7m4dKEEJ7xmremWUI5mb4dYurhC0yuoWljYT/UPyUjCdavyGmhMy8a+B5ssme9hLDVJVRnw
	ZNCfHfGy1QQtnc1V6+WwGj+IeNUORk0BQyFXlDwwtH/3Vv17u7n7c2ZIDCaxRCPzz1WfU2StODo
	zceaKLFXUdeBqRE9ZLRBo55A1ejSdYilJiRIHZZw2LZXXLYNojLApLLLVvw7N2EYq8Pffos3gfK
	F0D1KZIX96Ctz3NyYLe5HPkp6LBFZ7TI0fL8w9LtE/lW6k6rLuSAeIcDQgn0z40HrxFn2AXizzQ
	smP3h4vn1XGjRp6ikL5OAmvAo=
X-Google-Smtp-Source: AGHT+IHK0r8BrMgN4sZ+DaY6x4TkVHiC6t0Zz+Xy6V8KMZAcJC/mwgHqbcu7IDO8vBoPrcVzidFP7g==
X-Received: by 2002:a05:6a00:1d21:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-7f66773859dmr1729003b3a.1.1765526530998;
        Fri, 12 Dec 2025 00:02:10 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093c4bsm4494882b3a.48.2025.12.12.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:02:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 3/8] gupnp: upgrade 1.6.6 -> 1.6.9
Date: Fri, 12 Dec 2025 13:31:46 +0530
Message-ID: <20251212080151.3711461-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
References: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122591

From: Gyorgy Sarvari <skandigraun@gmail.com>

Drop patch that was incorporated in this release.

Changelog:

1.6.9:
 - Linux-CM: Fix a potential memory leak
 - Fix documentation link for libsoup
 - Fix unnecessary g_thread_unref in tests
 - Fix issues with Since: in documentation
1.6.8:
 - ServiceProxyAction: Remove some left-over debug output
 - ServiceProxyAction: Stop leaking the HTTP response
 - Docs: Fix various issues
 - ServiceProxyAction: Add get_value_as()
 - Linux-CM: Silence a false-positive with scan-build
1.6.7:
 - Fix compatiblity with libxml2 2.12.x
 - Improve reproducability
 - ControlPoint: Fix re-scan
 - ContextManager: Fix boot-id update
 - Context: Fix crash if served URI is not an IP address

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dd108a46f88102a998a71c41f14ee6aec1ea90ea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...mplate-use-basename-instead-of-filen.patch | 32 -------------------
 .../gupnp/{gupnp_1.6.6.bb => gupnp_1.6.9.bb}  |  5 +--
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.6.bb => gupnp_1.6.9.bb} (83%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch
deleted file mode 100644
index 373eb4548e..0000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f875a0afe24fdebdefc46d132f6722dfcb55115a Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 24 Apr 2024 18:52:45 +0200
-Subject: [PATCH] gupnp-enums.c.template: use @basename@ instead of @filename@
-
-This would prevent the build path from leaking into the source code.
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gupnp/-/merge_requests/36]
----
- libgupnp/gupnp-enums.c.template | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libgupnp/gupnp-enums.c.template b/libgupnp/gupnp-enums.c.template
-index 3ce5fa4..a7ff89c 100644
---- a/libgupnp/gupnp-enums.c.template
-+++ b/libgupnp/gupnp-enums.c.template
-@@ -3,8 +3,8 @@
- 
- /*** END file-header ***/
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
--#include "@filename@"
-+/* enumerations from "@basename@" */
-+#include "@basename@"
- /*** END file-production ***/
- /*** BEGIN value-header ***/
- GType
--- 
-2.44.0
-
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
similarity index 83%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
index 7d9b8a477f..ee980cd382 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
@@ -6,10 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "e2fsprogs gssdp libsoup-3.0 libxml2"
 
 inherit gnomebase pkgconfig vala gobject-introspection
-
-SRC_URI[archive.sha256sum] = "c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3dae2891e311a993a574f5a04f"
-SRC_URI += "file://0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch"
-
+SRC_URI[archive.sha256sum] = "2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 

