Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1624FCCF9E0
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 06:18:53 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.2531.1761113931575481512
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 23:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UuYFHoaS;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6cdba26639so530764a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 23:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761113931; x=1761718731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7nR8i4MvkzGLG77qjep7fYozZhlMHyCSJzu+IsiXnM=;
        b=UuYFHoaSPgTI4/k0IQRFm9TuKBnl8hmmoa5m/XuddqUzT2GJlQ8NOLLiTrI5BKl32y
         Sxe+DOks3m/X/FrbCcRncaB5EagCoWcCuwRFNO0enGMQpCGvps0jMOJjOGnBxabLCQ2Z
         R44ZQtDTWi+MIk6dAEqvBUxmEluXEFtnU/Gu0CGInbr0ysovMlFnYb9guRttUdveSzMX
         LUz3v08UC9xNoJXxFSgE8g54Lei8d4MNicCuQXWv8Awlf/pVPV5n0GiwAGXaDguHaqV+
         VuT5Je7aK5KLkKEATz4rDCylOtEoi/2g8G9kjIZXpPS70iVCmvW8PJAwJmGtvDUOxbVS
         ZicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113931; x=1761718731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7nR8i4MvkzGLG77qjep7fYozZhlMHyCSJzu+IsiXnM=;
        b=aUhsmYZrW/U8eXHV2wQR+TwRM+RHqsQdpEiycxV0zBa1c+PgV89onG117Ai/IFS5AY
         o53tnYCM7zY5yjgRV0hAefUwPcOUhkhx8tPWeQ9LfZw1CXjz6vuRrL6YuQMDJfdmSFes
         C2bvWweTdgw9eFyae9yYoQCL3kk0Z9YmTY/8Yg7StIGiWZVM5mlu3jwko1XMsyNavrJy
         Kqpq6aztYEhXRvQewyuYcWXMj7rLBAIs6+rh/F6k+W+YItR+qyMhRuDvLmDBFtl7ZSXu
         vj7+HWWLgY0o1Xd/Qs01jSU+oHrgnPm9yYRwXCmpo0xXo+cEvaCBzk3B9HCbmg++siY4
         euvw==
X-Gm-Message-State: AOJu0Yy5RgmpwuwmtKJrTn0nwm92NJDsN0dfhYJt47nu5uCX+e7xZsB2
	W063o9B9fnPorkP3zFxrvxNXZdriDS6CcIJUMaWxJjxMhsz/4eiMhJul3bbRIA==
X-Gm-Gg: ASbGncuBhUjKVcyp+c8xnH3uZmRxN95356cyl/jdL3Hr02M6erqUXhwpKWzk9a31+r9
	akSfkpFaA4PDesHY1GWV3jL3mC7JZevV0pRnEsQffc6jR1rWc9J8NDYO9oqlg1l3tFSmorfVJaX
	UNEs0IBS2Yk/ZMS1bm0EBStzVlsyWactLnomnEd5s3m1xa6HsN0+7rZhRqmTPkVQ+O2Z4UHE3N4
	1B/Wl39JKWgYDE+d2d3EqChDVp2JGW1AxcTaDRXxmC9ofInuEml0FvHxYh9W7K4PtvooTkQ8wty
	BGVqDyuovPKmaVcfdXEV2uxGEhJMjURldmzMd+D0QzLtOiXWPaV80peSw5mJ4jSMeD6WLKLFYdQ
	Qjhn+ZwG96DSdX2qEPdBwqLr+5u/9vSUMpIhNYN7g8zNhKXHrZFBDEaa76xGwCO99JbImCcQ1bx
	PmNqwHd6iJonTm7Q==
X-Google-Smtp-Source: AGHT+IGy2ZuaeLSiS7A/U+/8PZuLPHtpYHAZU76WoAQ5wBKUEvfFPje/x7tgUvR+HbfEJ3ghE+F+3Q==
X-Received: by 2002:a17:903:37c5:b0:271:bd13:7e73 with SMTP id d9443c01a7336-2935e0b4c55mr3590635ad.19.1761113930832;
        Tue, 21 Oct 2025 23:18:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fde09sm127857485ad.93.2025.10.21.23.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:18:50 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 8/8] python3-django: upgrade 5.0.11 -> 5.0.14
Date: Wed, 22 Oct 2025 19:17:59 +1300
Message-ID: <20251022061803.887676-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
References: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 06:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120891

Includes fix for CVE-2025-26699 and CVE-2025-27556

Release notes:
https://docs.djangoproject.com/en/dev/releases/5.0.12/
https://docs.djangoproject.com/en/dev/releases/5.0.13/
https://docs.djangoproject.com/en/dev/releases/5.0.14/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.0.11.bb => python3-django_5.0.14.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.11.bb => python3-django_5.0.14.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-django_5.0.11.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index 5060f3c9ad..b95a5067fb 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "e7d98fa05ce09cb3e8d5ad6472fb602322acd1740bfdadc29c8404182d664f65"
+SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

