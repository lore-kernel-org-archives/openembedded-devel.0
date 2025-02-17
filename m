Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA22C021A4
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:22:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.47551.1739784137365933374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 01:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FFMN/VQw;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4397e5d5d99so4737405e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739784135; x=1740388935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQVnwec1zv10j/ffFMzui32C0MNiPWS8UViY+DDqJ9Q=;
        b=FFMN/VQwWBWX8AbfPpmjpedFIBb7Q4VXb/rXuTkugKyCDolYaogLqhN2pc33oknzGd
         Qzt6HoAjSstl60ZSbZw5EJTy72YYzh8ggX+yuKaA+dG6I0AUcnyueougupC1s0XXkWvR
         Zu1zV5MgeA1f7f9ygaOKC1Jk+ss2021TUVAmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784135; x=1740388935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQVnwec1zv10j/ffFMzui32C0MNiPWS8UViY+DDqJ9Q=;
        b=EHBGJDVX/n+3iCHrrmeydNauh97qFSDguX6vR+4LCdKYX/+7irlpyesg0P4MwPJwmN
         ckUS+jG/1SR6EPvmVUL+qGsbb8ilTQIqjsp/JjfOFbGEy3gTdShppWTiUUtOU/dL5iyK
         BTafA4xnyGz/1fSaJb6c0u5Nk1QDratFRpFb/FBjtubbavol8ofUjY0uPdCXTU6UH07w
         lmGdziaXdt1nAqrS6vgLZu0HZVwi6XNNL3aqWp/79GMZVVQVFPRjqEX0OzoqQ+AHQcaa
         er5oRUtlwJ2Q7qa1HPfGVNHduxxj0viliTdI138Zlq75rsG3OcuLGFyNXrru8sX982Nz
         UFTQ==
X-Gm-Message-State: AOJu0YwZzNJTD8FSABv47LD1gv7+NuSeKXDHA9tvhmaI9mqDdskyvJGG
	pgJ48SqsAaPw5lv8cPQU+fz2Mx9WYFW2CTFkAeYwGuVWq/jyosvfuWfhOuHDrzbk7d/oo55W/Yd
	I
X-Gm-Gg: ASbGnctvfLWQ2wYlbJ7xgwX8N9wD52hQxXNXCehuQR1hVZWVP9TuUjERUWq3aI1st06
	erGbZnWuCTKJzgforR1QnHEKatIdjB9+ePQFYoud7484O9VfMsh6y1gEDL+Moqh/j4MDwXqWz5B
	c6hMDKjkNo+l4KKQYJAc0BoHJRyN5zCyZJ3G4j+cUjYfTZmhJ7Yet6MLD3fGyloiMQsLjz4BGma
	QJgBrylooR8dVlEpKNQOOgyFxShEKiGCa/fnX8RDYvSidbzL6wgs0N+xB7rR0MaxCvRxMCUqt2J
	66We0KxCmwRtgpHm2mCCh3tHjLROSw==
X-Google-Smtp-Source: AGHT+IGenOnx6sX0CPNvV6Iiqwwa08nggvcTKb9erL/O5nOTik6sQ0HyCj78Te9m5/ZZ+em7tAhIyQ==
X-Received: by 2002:a05:600c:154d:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-4396e701614mr84434075e9.15.1739784135465;
        Mon, 17 Feb 2025 01:22:15 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4118sm12022347f8f.18.2025.02.17.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:22:15 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-simplejson: Upgrade 3.19.3 -> 3.20.1
Date: Mon, 17 Feb 2025 11:22:09 +0200
Message-Id: <20250217092212.3970278-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217092212.3970278-1-leon.anavi@konsulko.com>
References: <20250217092212.3970278-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 09:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115510

Upgrade to release 3.20.1:

- Do not memoize keys before they are coerced to string

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-simplejson_3.19.3.bb => python3-simplejson_3.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.19.3.bb => python3-simplejson_3.20.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.19.3.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.19.3.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
index 094efcd8a8..b623673104 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.19.3.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "8e086896c36210ab6050f2f9f095a5f1e03c83fa0e7f296d6cba425411364680"
+SRC_URI[sha256sum] = "e64139b4ec4f1f24c142ff7dcafe55a22b811a74d86d66560c8815687143037d"
 
 inherit pypi setuptools3
 
-- 
2.39.5


