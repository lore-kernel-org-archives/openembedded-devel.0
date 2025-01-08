Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1EFE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 09:39:00 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.15648.1736329139642282745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 01:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jTS1fyv0;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so31123513a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 01:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736329138; x=1736933938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLl5Gf1NIenPwi6WSrYA2qIyOQsCCJsJrJCPQD8pf6E=;
        b=jTS1fyv0yJIeQdhGk133UNIW6JcAM0hm6J20LnnbE34HrvMlVsYE6pzCVUSEbwawhV
         0IZ3ZyD07YQMfX78FMsWDrAxKGpH4Q2yW01JdQmn580Xz1s6F/gdKr8yD8OdLgZfkLKs
         8cgI9dqL3WbrzBeTZluM+7VtgMbHB1ayOEW9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329138; x=1736933938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLl5Gf1NIenPwi6WSrYA2qIyOQsCCJsJrJCPQD8pf6E=;
        b=PhPdqWs8FLmbYzNtjs10ws2YXXlVAIkE8Nfe/WmYybXiLgMsv5w1su1+uS8+hlVbU3
         TFq0cOv9cH/zq5ycPZyqBwXMipNcP723ONz8lYlqR5oHRK0FOKThsCrvvRHDaKDk0m6n
         EgbF49OSRzR8lTh+fKFVGaYjRWTVJDF+pviIJlK8+ceEcvjcb3vsKMocxRuw8Y/xoFAH
         Ca0ugVLcEcm+dILUCaGfiCXfJdhpuNrRCuXknKXW2jTdSHiyT1XEXmMLIMVj4CX/usLg
         54KIiy2a9tjEKLs4QVF58hLEVs89++OiGEmOC/c+WntzYbdb6dNJrsH6XJpPmX/JOJof
         rrqg==
X-Gm-Message-State: AOJu0YzgGHH/qbkfKgsgTYJpeiwJ+iGMnmt4RYX07c41WeH9Yfjnn1lP
	+SzvP17eWg1VBIidEuJN6Fb5vVaEa+o/BOxNiMYfcuUiFPBsuPIHEmejhQJDtc6JZ6zuGNW27Ac
	s
X-Gm-Gg: ASbGncs241CY2kzxXiF535RTKXJ2moyJ89a2ZHkKe8yzP3tB1fbLeZR87hDLIZXCD1B
	cEy7oeCtGruVluscCX2Y2rN8etYacDor+N+4UoOzxPkSIvHVLg6SU9vkRNtFtdAP3k7HkBeII+K
	NUc0kg/F7wBz/Mo2JWNKelzJ/H45XO809tJSgZIrB/mxxDJqOeBhCH/WHpOs3JZF4UG/81E8StB
	QyBjpjWKwCPDAPq4R+8uHDT3aKCcWcKG4sdJ4WnAKYw0Zn30x+rjf6Wjykp0IN01OXrds0=
X-Google-Smtp-Source: AGHT+IF7M9ziMiV3gBx4ss3N58Nhggl6G87uKq6sITm9WvpMn8WehZbPArA1BnCSd0GzQVcAykfuzA==
X-Received: by 2002:a05:6402:50c6:b0:5d0:efaf:fb73 with SMTP id 4fb4d7f45d1cf-5d972e16517mr1790634a12.15.1736329137690;
        Wed, 08 Jan 2025 01:38:57 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f496sm25179772a12.34.2025.01.08.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:38:57 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-a2wsgi: Upgrade 1.10.7 -> 1.10.8
Date: Wed,  8 Jan 2025 11:38:49 +0200
Message-Id: <20250108093851.1560110-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108093851.1560110-1-leon.anavi@konsulko.com>
References: <20250108093851.1560110-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 09:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114739

Upgrade to release 1.10.8:

- Fix asgi.py's Task thread safety

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-a2wsgi_1.10.7.bb => python3-a2wsgi_1.10.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-a2wsgi_1.10.7.bb => python3-a2wsgi_1.10.8.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.8.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb
rename to meta-python/recipes-devtools/python/python3-a2wsgi_1.10.8.bb
index 023f227909..b9daf044f0 100644
--- a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e10d05d29ec6d8be8bfc503683f1bc9a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-SRC_URI[sha256sum] = "ce462ff7e1daac0bc57183c6f800f09a71c2a7a98ddd5cdeca149e3eabf3338e"
+SRC_URI[sha256sum] = "fc00bab1fc792f89a8ce1b491b2ad1717b145d8caefb75d0a8586946edc97cb2"
 
 DEPENDS += " \
         python3-pdm-native \
-- 
2.39.5


