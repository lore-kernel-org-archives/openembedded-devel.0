Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048A9D1119B
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 21:06:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4389.1764191158818423979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 13:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DcnD8wCB;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297e264528aso2087815ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 13:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764191158; x=1764795958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GjQYyqyF7gcErhEr9iN1wfQAN2KoYesxyowEHN4qqnU=;
        b=DcnD8wCBLxO3Piw3unFpHdSi4Awc2QYYJmM12E7MXorLAro3lWfFcLaKqDv7h5tGqN
         WwwjZtx9tCNq/Y5hLlZ/tVKaWLCjHMMObik4eaKVxpR49XKIYoRjuUWOpSdQm+coShsg
         OaVHaAYi5lg/7lP40ZgmUkPjWDnJak+D04C2LbhYhoDXR+jqe8/H8nr/ojvqpf8Fo20+
         WLyzeG7YG8nLW4LkA/oPey3RFNiCnZCRmelM6ULgKxxw/FFOxZP0myzDr5NXa1OTeTGU
         iLnXLzIxYCIU92NeakQQRnJD1pgg6K7bQzAIdykWxl79DrqV+FqvgK3EAZ0bbB+e+Pz7
         Q81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764191158; x=1764795958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjQYyqyF7gcErhEr9iN1wfQAN2KoYesxyowEHN4qqnU=;
        b=DvBtzMseX+lWiN/exAmY0+d4X0sjv6IVHf+yzOFyuppZinGUzwkw11o6vNQ+vtNr5O
         s8KKu6Tudrm1XdrN3U8z5lojF0KZouodRAoAzKIJXQJb6UoMkrbtoS4wg38/T6Nq9eNj
         ayxyrolyO3fEdBMeX5Cfdy7Q6lhP7aRQjG1qF990kMBye1W3bTzhvccQ2zFPhMvvako6
         sHdepCKKiTYKV+ZVa4RF+rQ9bKNzqMKuYcC0BRyjtQMLu0KJXXMmq83P7Ud/FhBRW5S/
         xx4YqZkGehqeRPvTgVWFlfWGtYcDKYYj/0Ts0zD5rnVCLKM31zL4jzEjp9NL38pucwHu
         PF7w==
X-Gm-Message-State: AOJu0YyAiECqjgh8NovmiZHRxYrBfRu4z9OXjTEu3PwVFrRXT9skwHnO
	28vj7DSk2x17eRoAFXGShaPLCynS3GvlM1Z1Fvx4IIhFH1X5kCXm+GjB3XNFXg==
X-Gm-Gg: ASbGnctLqTNSSGp3xhi5I/3JQQkLkd2Lpl/euEWnp0HUB8Fz2ej4xHSnCfkoPR8LmpU
	BY8PpyT4HevcGG1paSAl53BUIzm9Vf7u8VVFwnnU9J9e2UW2wQmB7W3/LXiewCZqAKP/kplxAEg
	L04mhFrb88YezZAO9J4skX+hRIvp0tJFQ+3KQUZ6Io4NRXL7LYF6GzpI3KDHYsvr8gzog/HlSac
	QZGxZwtxNzONVG35whRMWmrHz7s73tsj5pq/ellYz9zMdUQQVBlLc3V9LDGpp7VQsgoMJHH4BpG
	pJ7g3VzV4ROSKYBmkq1nY8tOf6ZRXjGx1G0Vpo9QakefwbMjh/QcGoPkfklYtVroxgv3zZs8xWb
	ENqvo7WOaj/Ju9B3GJT+QwEx8cWFf4ftkHchrW+JTtHm170WXdjM/MYvg4nxMfT7uhohBzvZ4Fk
	3pZBWOlLEIxdLvKsiIDa405/8=
X-Google-Smtp-Source: AGHT+IH5OUYcAGwa8lTC9J9SD8vxC7zBGpHDo29Hkkdn1PZuZ2fLh+jLvhJ7G1L7T5JjwoG4kSOfJQ==
X-Received: by 2002:a17:90b:35c8:b0:32e:a8b7:e9c with SMTP id 98e67ed59e1d1-3475ed6afe1mr8485558a91.29.1764191158050;
        Wed, 26 Nov 2025 13:05:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ff57b47sm3067834a91.5.2025.11.26.13.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 13:05:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 1/2] python3-django: upgrade 5.2.7 -> 5.2.8
Date: Thu, 27 Nov 2025 10:05:49 +1300
Message-ID: <20251126210550.2010120-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 21:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122092

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/5.2.8/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_5.2.7.bb => python3-django_5.2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.7.bb => python3-django_5.2.8.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.7.bb b/meta-python/recipes-devtools/python/python3-django_5.2.8.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.2.7.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.8.bb
index a0589d9916..f205b5b247 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.8.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd"
+SRC_URI[sha256sum] = "23254866a5bb9a2cfa6004e8b809ec6246eba4b58a7589bc2772f1bcc8456c7f"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

