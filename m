Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B21C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:13:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.4802.1745403181391685914
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JsvEXwvr;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so30168855e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745403179; x=1746007979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNInbwPGn+oInm0/xjMI5a/eoum0psm8jeoL8kUsXks=;
        b=JsvEXwvrvjnfHSDLEJCHLhFfu6SD04NZEE8n6ALKaUCE1a4/ORClKOdfYc+R55LTyM
         n/DJTlNKr+aJP4LwZhr3pPpd2iCZVhnMR5IB3u/Ba6OyQZgQGFTbSOknm5PKUOd9oGSD
         x1Pk20juCzFBoOLXNK76VjIcebcTVqXrMe/4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745403179; x=1746007979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNInbwPGn+oInm0/xjMI5a/eoum0psm8jeoL8kUsXks=;
        b=dzRnLwgwy1PckobkaQ5PxOOoNe31x7VDDuKED7KPJN24jiiBdd6UILzMfKINrOTzzD
         zZrzEvVZUeKs1/70kMzfRtP6ExR8dMen1/20YzARYPbXb5avWKwFJsDjDbLvlCPNLcOh
         7SFCAfUc4dJ/qUAtmYSNiq8MKsxuv2fNhsI+r1EJDBGWfRKuZ9SbQl1ZFT+qxAASCULo
         MCVD8v3IcinY38pcGHl1TIXqw1iY5yqDVxV/YsnhRS2Qz55JqYn2NHPPUaP4HujZXbJJ
         h77ESFx3GKQ78wEgRc+mPq0kxyNal6xoeIMloM2DXHpTTeN9pnulreEJ/9hf+nnWpj0P
         PViw==
X-Gm-Message-State: AOJu0YwE6EzKqZy2rlzGtd93mhv2pObhEVnbQUgLeuISaNre3teRbmmY
	uSt0QTKWKZEt5LLLD7JGXDC3dCAqFb3l0QYfmpB60OGkt3jLXBBk6bExwdVCTwFjhdeY9B1FCIa
	p
X-Gm-Gg: ASbGncvFbTGrU0QD8E1yJbxBFkINHpF9RnnxcomgVdawpEMWtuIBbwG6qdWO2AJq2T3
	IYBdmIdczciUYnSokNpWK7tZN0+TEI1XG9rdsgKPX6PQWCnouiKEJnuekE/oVuhbZS500TNMxvZ
	q365bm82nOilxExLeVB3DNKbTJHBLaymtvHcl4O3Uh8mePjIe+4or+PxQBaCOEjdco9AOMvkMYj
	AWTQEcpEBX3ffYeZwu0+cl50obB9HMjn4CDGw7u7kyBfMMtyzpp76adBNkjxZdeHrQE/s/sS4Ua
	sJEM0HgEkJv4B2NC4R9b1ytU4efV1yFnXiLwSsSGg0+1xFZY3aeUsoYSAPiwO8RpDQ==
X-Google-Smtp-Source: AGHT+IFv0kaz6EsULhKYrWn3BVE4+3XAH8luIMvmUGL5IhoQCBqpGdmpRhHl6STH/FzyiCusunoRHw==
X-Received: by 2002:a5d:47cf:0:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-39efbaf6f60mr16347756f8f.54.1745403179309;
        Wed, 23 Apr 2025 03:12:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43beb4sm17896704f8f.42.2025.04.23.03.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:12:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-trio: Upgrade 0.29.0 -> 0.30.0
Date: Wed, 23 Apr 2025 13:12:55 +0300
Message-Id: <20250423101257.3244224-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 10:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117074

Upgrade to release 0.30.0:

- Add @trio.as_safe_channel, a wrapper that can be used to make
  async generators safe. This will be the suggested fix for the
  flake8-async lint rule ASYNC900.
- Allow trio to be a types.ModuleType and still have deprecated
  attributes.
- Fixed socket module for some older systems which lack
  socket.AI_NUMERICSERV.
- Now trio works on legacy (pre-Lion) macOS.
- Update type hints for trio.run_process and
  trio.lowlevel.open_process.
- Don't mutate the global runner when MockClock is created.
- Fix incorrect return type hint for Nursery.start().

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-trio_0.29.0.bb => python3-trio_0.30.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trio_0.29.0.bb => python3-trio_0.30.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.29.0.bb b/meta-python/recipes-devtools/python/python3-trio_0.30.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-trio_0.29.0.bb
rename to meta-python/recipes-devtools/python/python3-trio_0.30.0.bb
index 35fd05a199..2013891074 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.29.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.30.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
 
-SRC_URI[sha256sum] = "ea0d3967159fc130acb6939a0be0e558e364fee26b5deeecc893a6b08c361bdf"
+SRC_URI[sha256sum] = "0781c857c0c81f8f51e0089929a26b5bb63d57f927728a5586f7e36171f064df"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


