Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CFFCA601A
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:59 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31579.1768811331289925005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PjCELG7P;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f0f875bc5so27843795ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811330; x=1769416130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B9EWMo3GLzAw3COib/nv/ruTfM91pHgjKjL0N8RDs4=;
        b=PjCELG7PKUr1YWn/Iszm1byP6kzTCxC+CnWhDeRnNXZ4g9TJ4Wsz0E7vq4op9VuOmd
         nlRhBZs2eAcgzf8gLquyh8REVKBrJTTIiYN7gCBqWEw+CRVgoJSIxKIr8YQTDm0As6Po
         jh8tWALYeoHWjZLyeDjowT/54p5DYGRxUwp9Rps52thy4fVV/+Qefsg00ScT6y9ORwEn
         YVpPTb750t/ggfwMbT0M9HhHL09iDRWCI33wp4L7rzPgD/kwS04vkBVA8I/3V2ztGoPp
         coC3LvuOc96sknnGAp7k1bjIWyUNIJ0JmwNawv3cPj7d0Mg5lRYMaQ+aKTGWNCBCIT68
         MgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811330; x=1769416130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0B9EWMo3GLzAw3COib/nv/ruTfM91pHgjKjL0N8RDs4=;
        b=q78AI98B6KlruFp/KEwgTWgxLrVEwynhmjDGUOkexr4MV2eW5mlI7Aru4icRhvl8Kc
         T/XLZp62na08C7HatzP3xJl4lvtzq7CGXy58O57AqGiloADROAMQX1mDPJP/OhFxTq8j
         kskIgNiptJst8DCg+xLxTDd1oC95ZwtMRFzt7pIXxYpygsI93ofptwFog1aasKngyloX
         vlcTaIBSHKzSF9SR+tP/FyAPsC0JdnA9sQXwC8cXwjYg4mor7gaViNmhtgASBTy0I6yy
         Dpc9WFcu7JCmO6YHSSXyrs1ZJxdVNjnX8ijqKOr/gzGznhmPQs1ywdcMlpeyBoeSv+ZL
         dNLg==
X-Gm-Message-State: AOJu0Yxzx1S76JNxMjvAyyqIX9Es3aRNwOZfl756rJvW5hDFLGPT7u/n
	UxsHbquYu06MyfarKKRSf4J5QtrbY1F/VKCnfcor7TMCD4y50hoW4wY+H4SwfQ==
X-Gm-Gg: AZuq6aJmHZYOAX9t28Vb9V8g5GkjpW+0d3sWLyPiP4OTL/F1AqfCbL2Yuo9azJ6AiMc
	U2MBibiY9ApCs64C7/q0TmI7gBvxq8r2WF1zLlzgdVhSjsq7PFMeg1UgCd10qPo8Jq8nyJG0OYz
	+9WjCW/DSNOFGEu8pABfKF4e8d7pPZaTMh+w3MbIUZ3hyKIP0ekR0tc9dpquHO916Ggh+t6ZIO3
	ncTTaDzG8lqFHkQA+YIkHCZCezmjtFupzkomBvTLP2aYZxq/L2XPNTOf1BePkF53plg/IlbOC3u
	TYxWG1zEchT91uX2WZB2y4E9qzI0nI4eKdhrXaDzVyyRk62AyTAN0ad4Y08LihtQHkRO0zSlQaI
	JjszNaeZ2P2UTtXq/0jhD+udAUKEMFphN73f9vjcLnvDtG6VULviAtqTvWYQQToDZqBTqWA13Mw
	uyYf2MkSNBErrzUGNYygzYAtQ=
X-Received: by 2002:a17:902:daca:b0:29e:e642:95d6 with SMTP id d9443c01a7336-2a7177f0ec4mr116567975ad.59.1768811330456;
        Mon, 19 Jan 2026 00:28:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 19/28] libsdl3: upgrade 3.2.28 -> 3.2.30
Date: Mon, 19 Jan 2026 21:27:41 +1300
Message-ID: <20260119082752.4120991-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123613

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Changelog:
  https://github.com/libsdl-org/SDL/releases/tag/release-3.2.30

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a524aaddaceabedcfba002550eaef0b5aa10e0eb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsdl3/{libsdl3_3.2.28.bb => libsdl3_3.2.30.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.28.bb => libsdl3_3.2.30.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb
index 98eebd30e8..bb111050e1 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "1330671214d146f8aeb1ed399fc3e081873cdb38b5189d1f8bb6ab15bbc04211"
+SRC_URI[sha256sum] = "4c3b09330d866dc52eb65b66259a6684ad387252ca8c57901b3a2b534eb42e3d"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 

