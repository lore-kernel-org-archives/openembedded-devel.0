Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26C4D58D4A
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 13:32:14 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.18724.1732541532171491553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 05:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IhV3qhnT;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3824709ee03so3181965f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 05:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732541530; x=1733146330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ol8uli+wtY4Wx9n2F01nv/TGwm4X6g08JN4fZcyBBa8=;
        b=IhV3qhnTim+AmtYXvuF6Zsrfw0z64E0uwKFMoRRmJAspftbmODeZxpIsbjB+ipyLry
         3xOIZGAkW3zQNf3biupCDxoC/Lk9OVYHY7pnDZ7bBjFmRKQtYwo7QTZH8X7lASmclDjA
         6ECYZpHom8STrO11MLleGYK3qBOHSIEtGbn14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541530; x=1733146330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol8uli+wtY4Wx9n2F01nv/TGwm4X6g08JN4fZcyBBa8=;
        b=a/ehIIIMORuI+jXXH6FiiG1r5gaQDWTWeXTfadWY0XndUVr7YVXMqOIHNgJF9HXRi4
         RYzgOiG5K04TbDlq6hd/KxcCgGAoTh/NkIhd36JfpgI34KYgPktQuL0uz2FyTasxAHfp
         M5S3s6xfHeIMhQGW8LgTkfoZ9vpvTIGHW8rQxy2/ZMmwpb1xfmaR4dFFcm8OuV9sPgMY
         6EB+jXYH0goYCmRe7QPOTdr7fIuk4LI5dFoi9d46w6B79v9RWHHWAHpMPIhzCmknyY8O
         NnarLhRKy/nnhaubZ9EWVvUvQHTYAaipSWw8Wkdo34Hzf8wSWA6DaclKHzcQf8ZZ/IcX
         gvTw==
X-Gm-Message-State: AOJu0YzrS5zKrwtP5hAt035JkoDO2Ux8jB+b2NnG23SciAAiafb9kiNW
	skS1aaZg3tkhbrL9a59deOKoY3RPp7UzIPzmyIoi2Ul2+tD/nhe5HISsW/KxHYgCqBhYPRwrPLo
	a
X-Gm-Gg: ASbGncsIZYnN5f1BKpUJWv1ool7VxKkSVNAU4JnFFzKaqVxfxwiH8iwCtuA7ZAmTW1V
	GU6JMJJgI36ckpebzVt97Aljxx0snEHuNVkUZk21R9cSgNnRSsw+BLOOGae8G7THisH2sok5fej
	KdcOLqRrLbIQG4f971G6LjJuguhcrMkVH+9WZbkO9FikfdCGl04wXUln+CzdxxYVWtOMnLAH2ZJ
	0RHGs5bzJSJAVH/oAOXIhE+gaAFulZoXTaCO8uxZQCM5FIHpdWQQlnDe4AXLUZX
X-Google-Smtp-Source: AGHT+IHxZ0VsLoZHCb12v8Y9EIw8duHBmSdgApoj+0fnorTWpGWJjnLzAEyCDVDXYl7lwzBaYHDYhg==
X-Received: by 2002:a05:6000:18ac:b0:37c:d1bc:2666 with SMTP id ffacd0b85a97d-38260b502dcmr10176931f8f.4.1732541530239;
        Mon, 25 Nov 2024 05:32:10 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad60e5sm10741023f8f.3.2024.11.25.05.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 05:32:09 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-typeguard: Upgrade 4.3.0 -> 4.4.1
Date: Mon, 25 Nov 2024 15:32:00 +0200
Message-Id: <20241125133204.31594-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 13:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114033

Upgrade to release 4.4.1:

- Dropped Python 3.8 support
- Changed the signature of typeguard_ignore() to be compatible with
  typing.no_type_check()
- Avoid creating reference cycles when type checking uniontypes and
  classes
- Fixed checking of variable assignments involving tuple unpacking
- Fixed TypeError when checking a class against type[Self]
- Fixed checking of protocols on the class level (against
  type[SomeProtocol])
- Fixed Self checks in instance/class methods that have
  positional-only arguments
- Fixed explicit checks of PEP 604 unions against types.UnionType
- Fixed checks against annotations wrapped in NotRequired not being
  run unless the NotRequired is a forward reference

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typeguard_4.3.0.bb => python3-typeguard_4.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.3.0.bb => python3-typeguard_4.4.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.3.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb
index 3f6acdd8e7..8b2604e4a2 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "92ee6a0aec9135181eae6067ebd617fd9de8d75d714fb548728a4933b1dea651"
+SRC_URI[sha256sum] = "0d22a89d00b453b47c49875f42b6601b961757541a2e1e0ef517b6e24213c21b"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.5


