Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12AFC021A7
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:22:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.47553.1739784138060245934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 01:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=f/lpFHAy;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f3ea6207cso849413f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739784136; x=1740388936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXfgQbUt4gOGl6DHOwC5mZNJy2fVsVA3pwafn5QyD3o=;
        b=f/lpFHAyUbKJHtpyHsaggKvKMJbuUR8x7cLh6q5LEV5MsrcbJMjSvuBM0rlY7cVOzq
         JdTdHH8Hi1wBCOpqPeCFaz9zwnS2m6rs2qD5AYhbz/gnxy3ULbiiWawsK/+YvRrCTyxy
         ILeLkM+DAl9ly+fV0unyzALNlCAlADCaX2Em4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784136; x=1740388936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXfgQbUt4gOGl6DHOwC5mZNJy2fVsVA3pwafn5QyD3o=;
        b=IoXOiNvqi6mhotWgrbDMvUnSXcDWHY2clrrYzznhmfyCAyl04IIMD5ViijIhOvY3Zk
         p7Y58EOTj3riR/6cGzp/ZIcUqlA0XBHEIwgLMIep6Blt7oQm0Sj4KyhDyLpfeOPgwBqx
         0V+9Xg1W723GwDcoVya9ER0QI3VPIHXsTy3N/W6n839I7ugsz/bKzGcAOjxx3r76BZBF
         NBu5df+XQEs6TZfmtS13GfrXHXQYMkbjJGHbBsv0eez/4fkpmgW411RNKSJHXSnmIxQ4
         RDOOgSVNljW2YMPOswWCBZUOXjPDYwE1Yr4tcbfFgwSZljH5BUam5vgC+ovQjE87Dd2G
         nnmA==
X-Gm-Message-State: AOJu0Yy0606qskk3kCbn9Klz8FWsQEbFDmd8FwfBGAeq5s3adtAJG1SZ
	fV8bQ5fN7aY/gu2I3GP9+GuVA6ZJfDN+Ewnf9RDkIgjOSb6MrEBZ3UgT4OjgVTcD4qXctWsaQpW
	O
X-Gm-Gg: ASbGncsIQp6Ytr+eFDJHNluL+K6sqw/XvZJzMUewg8DSTsUsb38Z+b9U0clp+dk0JTx
	WyJZVNUUDXsmRow4Crxpcl1q6bU916nd4T7iUwgKxhtpOR/6/l5TuvCXaXRn+yDX9UyaE9SKBpp
	JPLXiP3FfFFnaxSFS/vB6ctJUzcSlyUai8XVQ4kHksuNLoCB+OocWMwY1wq31Zz1cqOEMSWb4zc
	DNS8IX7MVn7oQdx5f0RXWJ6ffcCMNQQ1PMDT2TD7I8iGrpGXiYIJkTvkNnZ5SwGD6qlzKL8qfGW
	lQWvrdRjniWpw42r3piBjH9Km4AohA==
X-Google-Smtp-Source: AGHT+IHf+JzzXWMqr8om42nAReV02KMLUBptsB2eT6rk2RJDtm9fUOFMgy0RCSYYl0kR94uJxTNhnA==
X-Received: by 2002:a05:6000:1f8d:b0:38d:e070:6cf5 with SMTP id ffacd0b85a97d-38f34167e85mr7909566f8f.51.1739784136356;
        Mon, 17 Feb 2025 01:22:16 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4118sm12022347f8f.18.2025.02.17.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:22:15 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-bandit: Upgrade 1.8.2 -> 1.8.3
Date: Mon, 17 Feb 2025 11:22:10 +0200
Message-Id: <20250217092212.3970278-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217092212.3970278-1-leon.anavi@konsulko.com>
References: <20250217092212.3970278-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 09:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115511

Upgrade to release 1.8.3:

- Bump docker/build-push-action from 6.10.0 to 6.11.0
- Bump docker/build-push-action from 6.11.0 to 6.12.0
- Bump docker/build-push-action from 6.12.0 to 6.13.0
- [pre-commit.ci] pre-commit autoupdate
- Update bug template to include latest released versions
- Add markupsafe.Markup XSS plugin
- Warn not error on an nonexistant test given
- Bump sigstore/cosign-installer from 3.7.0 to 3.8.0
- Bump docker/setup-buildx-action from 3.8.0 to 3.9.0
- B107: Skip None values in hardcoded password detection
- Pytorch fix

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-bandit_1.8.2.bb => python3-bandit_1.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.8.2.bb => python3-bandit_1.8.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.8.2.bb b/meta-python/recipes-devtools/python/python3-bandit_1.8.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.8.2.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.8.3.bb
index 4c1ff88a87..76e0ad2a32 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.8.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "e00ad5a6bc676c0954669fe13818024d66b70e42cf5adb971480cf3b671e835f"
+SRC_URI[sha256sum] = "f5847beb654d309422985c36644649924e0ea4425c76dec2e89110b87506193a"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.39.5


