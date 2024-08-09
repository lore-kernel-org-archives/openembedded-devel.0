Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E115FC52D7F
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.88281.1723221137516900129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m9qKudqZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36bb2047bf4so1454804f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221135; x=1723825935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrq54RDWjkeHglfj7Vg37qVBqN/gqOjiC/4+teGLVxY=;
        b=m9qKudqZz+wwoVlv0mm/hR1L2hPI2cZzCpt2hdbo8CzrGIqM4Tx/CZSVe/raVdHIY4
         3viHy09V4kejKuPjhFPvki4IUvG3jvMKQt875HP0qD5j2mmLmQTtDIpWAtwMJbcOo3Ul
         0atJag2xTVmbBwj5uPaCoIPgkSb5bx0UbBonH4k1SVq69vWpdV0j6vpNS4cLuJknQc/L
         K6hOooI6zSgcmWEdiGTcaPfZRh4Eyy25YOcaRbOXeWcKlzCYQyb6vJjbCpkRz9apkKvM
         WVqk69QuwakIOcfSOMiGvnVUJP+Ee6LwbDdjzp8GAxgI1OT1uVUDTXC/VveieoRYNp/Z
         78wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221135; x=1723825935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrq54RDWjkeHglfj7Vg37qVBqN/gqOjiC/4+teGLVxY=;
        b=igKk1zpLYioGkGklR7buBfZEsf35T5jF+t2VkKgO1YjmP6AFAzsz0+WQ5bQeVglvE8
         JbjjsI6y3vo/DffIw03rp6wt9eXW/ECk0W++aUHQHoCUiSS06sTfZGP4CDHn8/6EHfWQ
         bNGP24TMXdhi/PT7mg9kJPogBTYGMwfPWyQaFnPqG9WHYbv8unRdJ6cOju2fX/cgN8RE
         sHLDew78g/kXRswqVrXKUaD/Bsvu4SQUC+StAxhwdlAuuWywi51tR0+6+XMaQ+Gb5esN
         oOwnuS5F86plM6uuxwm21uSowV0QtxmzBfe5V+p3fWVKE1UQLm7zxznvKpQKt+UXH7PO
         n/mQ==
X-Gm-Message-State: AOJu0YxUWyAl49fFcM8sPFu2kzUQRd/vMy6ouWMvveOxxNNCuOEwhmHJ
	YrMWLz+tDzi7ZoWOiiwiu5TKm2ADTDjEnuusYBrN05ovcUNNen+YBj0eqA8n
X-Google-Smtp-Source: AGHT+IG643iKxWGMsQ2wb/6XG+bP9U59dQU8hDmeoAlWkypNyxkdH7TDN8zoqbOoXYShm2pMm9J25A==
X-Received: by 2002:a5d:4d90:0:b0:36b:c126:fe6d with SMTP id ffacd0b85a97d-36d5fe75457mr1341914f8f.24.1723221135306;
        Fri, 09 Aug 2024 09:32:15 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:14 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 03/12] python3-regex: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:52 +0300
Message-Id: <20240809163101.8416-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111714

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-regex-2024.7.24-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
index 682c30fc9..b6e09fc83 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "9cfd009eed1a46b27c14039ad5bbc5e71b6367c5b2e6d5f5da0ea91600817506"
 
-- 
2.25.1


