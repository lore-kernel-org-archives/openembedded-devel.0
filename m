Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1450CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 08:14:05 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.6889.1759997645143057504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 01:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qehVVXZi;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so107286366b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 01:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759997643; x=1760602443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMkT4U5CsXUUfkrQhgHYl5rDkl8bZD2mBGKHEGvjM5o=;
        b=qehVVXZi+ewKNahhZw0opY7kzM1nxguZwyngNVIWt8ndqnhxVbmyHOXpNMfdWvVV2b
         uWTiQmAJ59oA4lLNuUJYD97yjjucYohKHI5J4BjEoNm+1SGN1Y/e2M60C73v2WermCfc
         hSrTcFTgNwCOmvSb6rJ3EePcKvRamV7K4b9bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997643; x=1760602443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMkT4U5CsXUUfkrQhgHYl5rDkl8bZD2mBGKHEGvjM5o=;
        b=VUcjDOUYTxMMBMZHhfFiTuwKEUxYT7Nlk5jShJPtNWxlutgsXRL4N+599MkhRHvFfO
         aCc5tvsRbIEV7LmFdcV4OaP8iVwSoqsi8yhnq7VxKOfefJSb9ZY9nCFLGfaxW1BF1xKY
         BUmW8lOAr74To5TbUp3/2NNiquLF5pN8LI/cIqYcFfnpir+JsAjHUPOb7TzxV46PkvRh
         hf4BdMLIWSOO4eIkEWx+REOtkE8z+SXrqa/e3kF0vf9hDEdzIM/NuOFd765YB7bhtli3
         2pSbqs3lXrwohZdmfJpxOQrvJMbvBu8Ukp2AmJ4FSxwrk9OZcvXIFim+LQYksKdMZKhX
         5G5A==
X-Gm-Message-State: AOJu0Yxsx8GOEt1xyLAopp42uaXM5v0ORtyduuu6lGLDwBAlB0yC+jH9
	NwApnFMSyxdDds7vRCifAgWfIp0uo57E97pGH1vcXa1zE9GkGbWDdXyzIkTVHr34CL7WZx5XGgH
	gXIXy
X-Gm-Gg: ASbGnctp6i/pbo/JZfsOWyOz1DWpNtfIevlAMSe+kZIND93srf+anw+7ciQNJvOocqS
	bkZI9XLs5+Urw1bVkfQjzCwIZCI4pF2NohDdko8BnhTNXDuphrebgPYbM34GDoAgjw+saNqKfJy
	PIHSnt63GlIXZG8hC46Yvid9kNb3L2/c0+/RWT86VGIS9dXt+KAAlxSThSiA5SFFNmTcr6OGFMU
	nLvLobVvdOskc9rwY0Vbc07fLzX7KKdh8rXDCJ1V++AVtIe9hUb7Tv5HrAhIEDoNcLnaIknTQeS
	j8kaq/LqsrYSFvisuoe30Wwq0cF0RvYHzo2d3BVKle2ejP76m4X1oFrl2wzD1gCpPQIpPlt0Gs4
	o4Pk4rhW4+lLRueTrW+0DVb+zCrFwGkMX+MdycDtOVOLC41e5beOHpCp8yfv07dvnaVyB8mZXnJ
	DbZepuWw==
X-Google-Smtp-Source: AGHT+IEoejCg7XSwdUSXWNhrWsst4hoTeiLF5hP2zZukeGvBhGkYQ9qKUl43Q4mmTcB7mgSADlXglA==
X-Received: by 2002:a17:907:968b:b0:b3b:9832:f9b with SMTP id a640c23a62f3a-b50aa8a1827mr830436566b.25.1759997643141;
        Thu, 09 Oct 2025 01:14:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652ad839sm1844874266b.1.2025.10.09.01.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:14:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-filelock: Upgrade 3.18.0 -> 3.20.0
Date: Thu,  9 Oct 2025 11:13:54 +0300
Message-ID: <20251009081357.3446410-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009081357.3446410-1-leon.anavi@konsulko.com>
References: <20251009081357.3446410-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 08:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120423

Upgrade to release 3.20.0:

- Added tox.toml to sdist
- Updated docs with example
- Added 3.14 support and drop 3.9

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_3.18.0.bb => python3-filelock_3.20.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.18.0.bb => python3-filelock_3.20.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.18.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.18.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb
index 9c4721d4bf..4ce89a853e 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "adbc88eabb99d2fec8c9c1b229b171f18afa655400173ddc653d5d01501fb9f2"
+SRC_URI[sha256sum] = "711e943b4ec6be42e1d4e6690b48dc175c822967466bb31c0c293f34334c13f4"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


