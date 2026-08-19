Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823E1C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.840.1787117846232235622
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FWQOpyO/;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so655618a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117845; x=1787722645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3HthjjUSI7qNGH3Q9g2dzyKcClPVJwIiVFC9U0AmCQ=;
        b=FWQOpyO/S53WEaieVFtzi2qjyxSOFpMJ4HoNW+KmPxDgx+Um2g33VN2f4F/tlP9REO
         rhqGL/RPpvcxnX7x+3ohwO2cQ3zENNdMiNxJBB5zVrFI2WnCDLeORmPjAg3DP4n9mMK+
         /oig3kTE9Hfa/48Y/hiJDS6/JOqf//Pjnh4NgL65AL029zbKGVEG+9zyF6uMj9dAuTd5
         ZrywConkTc9CrBII/vxh2KHULQOyPs+ac9gFzYUHWHdT6d9rac/KrTyWAluAkqklqOHk
         4VsP051ad5UDhqYni0nMMIo7WWyK0pnClhtMynh34pvQMWtdB0AMcOetRnsE6b3xORNb
         1yyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117845; x=1787722645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3HthjjUSI7qNGH3Q9g2dzyKcClPVJwIiVFC9U0AmCQ=;
        b=RXEMgRV5e8i+ftzif3apZ5eSrGPk8dnKoTmxD2leuDtCFq+hvACNj0c6kkls1+WSKN
         RrO3Xu3Z2bobOVH45wk+ycvO99BUyAKkMbjUjnrV9PX4kCuE3of8IuRtWEirJn7MNhXs
         Xg1eXZjadvfzWH+r0PTN4CNJtj/WWwzIVXxX9rHyRLj8tBxuoOZlMMIRFQmoDS0IogSb
         KmD3BU2l1+7eg1lnG3J6oGtE6U8WNGPAD4Eq4BaT1BHBdQo1+0X5yTRvuggZJgqEVxfp
         TU7P3JDTqLE3h0wVYTFr9PYtZYl+Dba0hhNU7kvFkYBr9KrSQH4zV6iKDcRBKGZ6OqgP
         Sz5g==
X-Gm-Message-State: AOJu0Ywjx1SsbjtNhzrWb+q3leekmvUlv26Ed3uQdUmOnbnP5fZCXNAo
	GJwqigS7iy06rNDWExye1Bm/DH2ygZUhY3ANbCIW6lrKkzeWxdFTcyzhfppjH0hZ
X-Gm-Gg: AR+sD13v6q2DH7vem9rQB6ptD7TZ3z1lbUvDhDlClZHHQRsUKRhjZpx41HT6ttxdMPU
	UeDW29i68CN51TzIUXcnQ3wW3ADx3AsGF52NksKjAwCopsHLWj/BKUgcT9Xr37J4IAyGb09UmS4
	E7YNOU4CmSq7grxJe5QZXHhKqgpi8hnvJ9z5LCFBp1NMjVEb49yqcAjcRUvyIjEzVfGE/Cl+6h3
	aCUQUPrJCCy11NuuCPedf8/Z71a2cIzKVXIgSbJll+Pjy7fyjwJrOoBb1Roe/cWosuB+H/nLlCO
	+9ID3duXa2FoqA/VBR8+liEZsDTi7o4QzH3YZ4WuUF4p9pj/6EexcafqNo536djZP5kobpZknU7
	6FawMMLpuT5ETdzIknIebQxfs5i28CkAfL0T2ZZ92syZ3sg2jWFhGoPFyXCnng/QLNq4sSsAnNQ
	xT9NBTrIpFGcQ5Dla1qL/98ZFh7GBpis/+sA4esOdqn23gB1exOIrpOOZKECfsNXqFND1mdsnVn
	A==
X-Received: by 2002:a17:90b:17c5:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-395814cf6c4mr3083020a91.16.1787117845525;
        Tue, 18 Aug 2026 22:37:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 19/25] botan: upgrade 3.12.0 -> 3.13.0
Date: Wed, 19 Aug 2026 17:36:23 +1200
Message-ID: <20260819053629.391864-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129263

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://botan.randombit.net/news.html#version-3-13-0-2026-08-13

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-crypto/botan/{botan_3.12.0.bb => botan_3.13.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.12.0.bb => botan_3.13.0.bb} (95%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.12.0.bb b/meta-oe/recipes-crypto/botan/botan_3.13.0.bb
similarity index 95%
rename from meta-oe/recipes-crypto/botan/botan_3.12.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.13.0.bb
index ae122af77d..1813b51d16 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.12.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.13.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "5370f98dc15f8c222ee1ce52cd61c8756a53be0dc57cc4c1b0714d5a09ad74fb"
+SRC_URI[sha256sum] = "12f5a8358890bbee82edfe9d2e7769b0a610b6dd0e0698aea13d20a675d84620"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 

