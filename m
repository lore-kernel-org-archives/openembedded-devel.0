Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947E0C369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:43:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.19059.1744720984635366373
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 05:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JZkcGkri;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so968803766b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744720983; x=1745325783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYDkGPxX79GcLmUH1EtxNIILgCZ7i+79KARt9ulEJBU=;
        b=JZkcGkriVvtpD/5qlAYrEEamq2OkvjcB9n78Eh/94UxrOfL2shVOpln6ejarHPEN2p
         i2qWSznwQkggOrBg0MnSnKkpPfrkfIdrSskU/73GSSK91wImW0cLmIWl9gW3HiMCRKRS
         nogZLaKMKarrfKhk9Kn2Uq7+HPciPrKobNiVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720983; x=1745325783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYDkGPxX79GcLmUH1EtxNIILgCZ7i+79KARt9ulEJBU=;
        b=v+aa+4xGN2r38iwiumT5HYzvfOFat0ozL10WxqaEJDcc1VrJ24GAIldSgraqyPLpRE
         l0+1ZpYo0vbkCZV0WZTb9clNsggSsOelX9tFzjM/WQE3KYWnxfHL2u7aQcVKR9BBte0w
         eYwO8OyY49PhZMuaXGUAPDwPe50UUl9dzrmYuU7uM5OzMD84sq05SYkoq3Y3xaKjKwFl
         /pzd5ahfpOwbddY7VEkwXvG8Amxc1Y3Ukz8h9P67Do/1r/BnL1p9JlqqERVcsfrwefCe
         8BFTGMLmGUeXW+vVFNJs1uh8wpZ5uR7K9mWXP8Ew6JR6if3q/TIb8DHhRO7EhQkVT4tF
         2H3A==
X-Gm-Message-State: AOJu0Yy+qH5G3QiiOQinbxekx+efpG3iNp4dP2mnv9DaI82inevCW/Cy
	ONEyQDT5RCWqC1e3JQkTIDFMlcdUTsanzkBVF0+yDrXTsSMvqQdNoIt6fzjyOSXIdwcccR+c1ac
	n
X-Gm-Gg: ASbGncuSlUUktSiGAF333nl3zCXFflVw9UHIMdDfymW/EEDEP3Ce9pK38V+imfVDnXP
	NmAUuy9Tg93rZI+iwaXDNvDrCrLQmzd+LPlzd0KDv2OS/XAehkQ9L6KDTvdC41jJJ4QPKAHluBN
	VIFbGluDblVrvNku7tthXM6f3lktqnjUxspYFPKpgfFBsX0YEYW60PpeTdUxC4HUL1ACKK+4G0I
	YePHYaF5JvqGUg22Y5x/p0hnAyB2CXr4yNdyq8YeiAlFyHOJyjmh1LklzFsABfMcP4p8KTDlpu2
	fXZLnfOyMtYSd8Y1c0YCDbc2Qwaq6dX5xKgNZlEltViAN1+VfuCIzuE=
X-Google-Smtp-Source: AGHT+IEsooeaCx8IsxAhvpO8JHnA6rXOuziCjxTT+hLjuf7mOlXhU3uSLLeCfjEzGuRRypjL/O6NjQ==
X-Received: by 2002:a17:907:7f07:b0:ac1:e53c:d13f with SMTP id a640c23a62f3a-acad36d7d8fmr1491006466b.50.1744720982563;
        Tue, 15 Apr 2025 05:43:02 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be913asm1069660766b.47.2025.04.15.05.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:43:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pydantic: Upgrade 2.11.2 -> 2.11.3
Date: Tue, 15 Apr 2025 15:42:58 +0300
Message-Id: <20250415124258.1202166-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250415124258.1202166-1-leon.anavi@konsulko.com>
References: <20250415124258.1202166-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 12:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116863

Upgrade to release 2.11.3:

- Update V1 copy to v1.10.21
- Preserve field description when rebuilding model fields

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.11.2.bb => python3-pydantic_2.11.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.11.2.bb => python3-pydantic_2.11.3.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
index 896a8d6471..03a9483f5b 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "2138628e050bd7a1e70b91d4bf4a91167f4ad76fdb83209b107c8d84b854917e"
+SRC_URI[sha256sum] = "7471657138c16adad9322fe3070c0116dd6c3ad8d649300e3cbdfe91f4db4ec3"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.39.5


