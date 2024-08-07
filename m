Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D32BC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:35:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.31323.1723030519219351562
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GiO4vM02;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428e1915e18so11453995e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723030517; x=1723635317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smSj9YaOy3Q8eul1NzdmEKcEamMY+7okZ0hMFf9fh5s=;
        b=GiO4vM02qWyDV/RcNTcDhNzIXBarasWhiZCom6B+4oFKFk6BwKPIkR7sKqpIS3OEnb
         25vbcTHv79X3x/YECon+nnjXI74WACx5/MSnbziYKkV9Lr6lmU2LWeNn4haAAngnUcpH
         FkdEAAIk0Xy0QrXOGgKkwfEq8pzEoKAeOgEUW9IQeW9DbtgfiD8GGAV5ipR2cFTvZSsU
         WILuLoVgVeAIKagpaevTvpBHUmcD5zkmueA92KkjNcXj1xxbscoLJsci0/N8u9LSGC2L
         m2xXMUqCycH4zoJJqyTJM3RTtGrWZyMvdXO8ez5b/BJ/a7rHZuSNAU6gMi/kaaDHrrj2
         sIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723030517; x=1723635317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smSj9YaOy3Q8eul1NzdmEKcEamMY+7okZ0hMFf9fh5s=;
        b=q3KvQKKmqbN0ZUJH1QOZrjBszYq1y3jqk8fY8vzLohJ7ujDDVrCWl7SwHcmrF3+syA
         WbZyjLls0xhy+9MP+9+cXf4gADxu5Y0uGZ/QI6GnzrY/BGepiYc1AqJtekUqNYjUMo2S
         +7cXOutsRdyA1UW1F6ka2elf3gs0fW2qx2azDGupU6buUpCjaiGeYWLeIZneHG0GkZSW
         unqSc0eloS/+cbeXfv926oJWWz17kWmMwhHNaVqRFfwszBn60hAYDOqmi0CrCnwm0nhH
         X9BrG/QZpmR54LymmpfzBWIxPeh+C8ufIxrC20iXcK6coL5E1ALrH+sZSsoM5eBFo/ys
         aJOw==
X-Gm-Message-State: AOJu0YzIlkFVXkoE4TO68vQyhXhCxh9j4YuYGB54LkNTAPdyEij4cGhi
	ZNG/lWx1A7PKayWO3XJyaMln4DyjNwS79ZRF3JpbV+A3qlEYXWdzkMwIUfIe
X-Google-Smtp-Source: AGHT+IGhintZFnokXe6TQkJleNtyyVkSfACUXqrt+WYJQq9jNI3XhMA9rOrviygmi6/ZMjHlI32LCw==
X-Received: by 2002:a05:600c:4514:b0:426:6000:565a with SMTP id 5b1f17b1804b1-428e6b07ebamr110674885e9.16.1723030516858;
        Wed, 07 Aug 2024 04:35:16 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059719f6sm25670835e9.15.2024.08.07.04.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:35:16 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-screeninfo: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:35:13 +0300
Message-Id: <20240807113513.76522-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111617

The project has a proper pyproject.toml which declares the  poetry.core.masonry.api PEP-517 backend.

Fix:

WARNING: python3-screeninfo-0.8.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with poetry.core.masonry.api, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-screeninfo_0.8.1.bb       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb b/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
index 19ac3f67f..a7a20707e 100644
--- a/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
@@ -4,11 +4,9 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a23813181e06852d377bc25ae5563a97"
 
-PYPI_PACKAGE = "screeninfo"
-
 SRC_URI[sha256sum] = "9983076bcc7e34402a1a9e4d7dabf3729411fd2abb3f3b4be7eba73519cd2ed1"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.25.1


