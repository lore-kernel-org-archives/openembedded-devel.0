Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14870.1793092904506570088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XD2/a2rQ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so33554095e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092903; x=1793697703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ny3n9znLwE5n6QsbQyu8qPORu5e7JW1BXOsz4J1yGsg=;
        b=XD2/a2rQ58jPHtv6P0p8Nbw4COHPdMZyMjQgZLVu0AV7X0rMc8wUBWp8HuhTTss93F
         gB37qTKnenG/8Wo3aqkYC2APmM1b2XkEdWKxp5vQsUcCgIPRF8OgV82+uYksCNwqxxzD
         gnOr5XuCjrN+bPmFrXPLtrOFiAqCS75RkCp7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092903; x=1793697703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ny3n9znLwE5n6QsbQyu8qPORu5e7JW1BXOsz4J1yGsg=;
        b=A5wcMs4Nu4bdaviA0GKKPs+thLXOg1p9i7022Vd8GpIiwejY2Nx/VIZ3Hm87RCuruI
         /5X4m4JngMOLpNUpm+rCf7uznsZWi4/ND28jSs9xzLVRguFE+qo4lyeXp6cuO+b5/xQh
         rysQtZ0PHDzGyEL9h5w1iWn/2RiKiSdb8N07N5nCJ4NiI0ELj2Nos9wS82auasz/Fami
         jPElftKf+EUao8iDF8ye1f4nF2eENOAqMkkZegiZJNXSHgPKnkXuv9g6NCkb9dpLtgzf
         +wD6pG+r3sRjjAyxXZ0MhomVeG8t6Q4K8DpLW1AMlmXqIX+MbW8oaNuPjN8nZI23LFVA
         sltQ==
X-Gm-Message-State: AFq9FYIghqvoo1EgPOhB5/AKjUydaSzxZIkLgf2FHTbxR2LlcjGZwKpB
	S6csoGTJs8Nh3IsbibKBEjUIgRJekyBCgwffhKSZ2YYJ6ur7uX5f96JQ8AqZnrOY31GgQvZ9cjl
	NQxx6
X-Gm-Gg: AYBFou0Vaur7Lic/eo0lN/Yux/tmydtYc7h4RBgvdi6a7Z6a9yduFCYqh/8EnY5D84M
	EOE/k7FuGQNFHln6/4Q/4Lxo/bfGEudTe6FKUk0oG17SPb/JEa+4cRQGyraRl/yUL3uQURX28km
	TsM49vGLfbxdTrsmeK6IJOtcShPkYwLe1qAGWngpdD9s7VGTp/OcAQN26Zw9V9D/EexassFUdFu
	325MKm/sUqADKLNb81v+8t0JCk69K/AjqmpcKVoCx7/nBcDHMd9DslN7/+082QqkqxONMVsYKAp
	q3ybUysDos9ayRc60OzUuwYZDFi6FXClYSJ0lUNAnHg9QneG9cif2BVE/qTcivjRGMTR9kCgDZT
	jjranI1vlwQn8PQuZ/3ACC5nnPlnr/BYQDgRTvbLW1sZiLx6+yN2tPqA5hbBYu9+J8H2wh0kdBT
	eQPTSZxxhwVzuSaUbgr/Rgy5WgFAnXfmvRzM1g5+xls2eOcLd3wUqnm6S/9VHVFNjITGf7gGZw+
	Bv8A9ZDL+G2c2WW0sp+QTzoPRDs7aHQYCyUHkcbctra9Q8tJj+X+5V1gnaKnrFMICvZSrCtk1aq
	MvBRxmCdCLmfw6bb1New1AM5pjWdZlWGgmNrR5uDgtns2tY4OY9n69BYn0M9h2ybMc1BjOSukL6
	K+AIR
X-Received: by 2002:a05:600c:4f10:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a35acaa4a8mr178661225e9.27.1793092902847;
        Tue, 27 Oct 2026 02:21:42 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 57/61] python3-wtforms: Upgrade 3.2.2 -> 3.3.1
Date: Tue, 27 Oct 2026 11:20:24 +0200
Message-ID: <20261027092028.782979-57-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131521
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.3.1:

- Keep the form prefix when FieldList renumbers its entries
- Speed up URL validation on hostnames with many dashes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wtforms_3.2.2.bb => python3-wtforms_3.3.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_3.2.2.bb => python3-wtforms_3.3.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.2.2.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.3.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-wtforms_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_3.3.1.bb
index 3adb2a57b4..dbf472a618 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.3.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=17ed54aa95f4a6cd0d7a4747d14b64d0"
 
-SRC_URI[sha256sum] = "7b00c73f8670f35d4edb0293dcd81b980528bee72fd662b182aaba27ae570b93"
+SRC_URI[sha256sum] = "9d10ccb5740290c9ae6673522d87bcae3b669cf0cb4e4584aee229b4694af10c"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

