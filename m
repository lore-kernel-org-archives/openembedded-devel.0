Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218BEC71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:03:26 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.3609.1750410200101032703
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 02:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UtJYMOHh;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad883afdf0cso329201066b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 02:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750410198; x=1751014998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MTCSoSv4Y6edw8bcXeWi9HGMSKKbktKkrJ3H4B2R2o=;
        b=UtJYMOHhTKCJa+NZ9tyOumJ1+0E7Rh6yMbIGTDiDsXn+irO/R95VlllJjhmYLOAJOE
         ys7o7JaM7iPlAftebtgme93m7nMkNUFyeKezzRxGKsipfGDVtttD6AcV+iNEaRr3iZkg
         oaVtpKcy240SkYHw32AMMpczPD1uY9wVYnNBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750410198; x=1751014998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MTCSoSv4Y6edw8bcXeWi9HGMSKKbktKkrJ3H4B2R2o=;
        b=dsGFgh2tTPKP9bBUCmQAE3xPbyouL3Y/1iZOalq06R2FfV/lZOi4u1FlPA+y3gMkaQ
         TGqNZixI3MWmqyv6vBLQ6uG79PakoU8KC3Y6zMQyEeqXFFNfvD5KwnWVCLTz7gnG8UEE
         32lHahKs75MVbjBc3WKJlw3EcBUR8crrePxz9uVYyVnoPgb+pHgYN7ZA14bmJVSOP8ux
         JgW+/+W6aWriWz8AQGNBjZNhGl+DfaYH0C6RIhNyTaQ/BvkPu3btiK8YVGTvq54LhaIT
         bmCdVht5zS8hSl0XO/Ae249TmkMyGezOtOax4A/3vgcp0G+ODgkjHenBATHn8CNDu9dB
         lFEA==
X-Gm-Message-State: AOJu0YwOVqvzfkdkGVZe3bIPODij/99pO/JqrK/t0iY4f0oUo0HmYdVL
	7RofDjUATdV6ulKbZQVb4dVf/QafuAY0LXbrZtvu0RUYNom6zqjP4DviEgBfLbHXpLLOwW1s1cD
	aeWLd
X-Gm-Gg: ASbGncsrRoikGyApEIiHaSd4YmOMrP43icAniSX9FL/a6kQQRX2vU7Mg575YhJOpWIC
	r5WSm4DgmWeuj+JvwAV4f5khbpR0DaF/NxSXHjleZNU8APJEY3gvcARwarb5h0Osooll8xPoBRm
	3o1+egW+NNBcbFCvoDHZCMrXsGyetoCwawf8/zFAFe9ABD9teKHTSgC5GFmMP08WthocfXi1N1O
	tenO9lgBys8oX/cj3Czw1Wu2amZiVsGlz+ix6xGcKNiRE966Vx5JQwwAovJfGAoxbtxBjAWZ7Tp
	PgxEJn2BOGVaUcGPVsNeYooY35fAhdJSEjBJD0f1NY3kWfmaVryW+kan4YvZ2J0PcwS5Bs3b89M
	i7EGjio98R9Y=
X-Google-Smtp-Source: AGHT+IFOI/P5BEuuthbKWKA4ZndqxZ6hKm/8oaaEum1IhZG5wPNOobrp7YJ31cHe44ttwfyExS2TAg==
X-Received: by 2002:a17:906:9f85:b0:ad5:2e5b:d16b with SMTP id a640c23a62f3a-ae05795a62dmr177498866b.27.1750410197777;
        Fri, 20 Jun 2025 02:03:17 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a54sm130551966b.102.2025.06.20.02.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:03:17 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-typeguard: Upgrade 4.4.3 -> 4.4.4
Date: Fri, 20 Jun 2025 12:03:09 +0300
Message-Id: <20250620090309.1619406-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620090309.1619406-1-leon.anavi@konsulko.com>
References: <20250620090309.1619406-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 09:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117966

Upgrade to release 4.4.4:

- Fixed IndexError when using @typechecked on more than one
  function with the same name under certain circumstances
- Fixed TypeError during type checking when the value to check
  is a parametrized generic class

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typeguard_4.4.3.bb => python3-typeguard_4.4.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.4.3.bb => python3-typeguard_4.4.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.4.3.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.4.3.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb
index 42aa7f228b..83dc52ca19 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "be72b9c85f322c20459b29060c5c099cd733d5886c4ee14297795e62b0c0d59b"
+SRC_URI[sha256sum] = "3a7fd2dffb705d4d0efaed4306a704c89b9dee850b688f060a8b1615a79e5f74"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.39.5


