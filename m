Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7033CFD317
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 11:53:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15096.1763985185617148501
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 03:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q+npUO5N;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so35424495e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 03:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763985183; x=1764589983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wQiePlUqo4fKsf6A48+VOV8g4qXn7WM2cOfuizrY7c=;
        b=q+npUO5NRstGxPeRGzfAKC34YXxSg0qsKjfhKBUl6qG8JKHkOzjMaqhNzt3pK75UCn
         GuruaU8l+/yW60Me9ev3/wxhtA654WK4divaN71G6gDySrM6gQukD89aPfku8M8Mofnm
         IQeNo3O2kx/TIIQTb1hWPq4ZoeTewnDKXMDD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763985183; x=1764589983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wQiePlUqo4fKsf6A48+VOV8g4qXn7WM2cOfuizrY7c=;
        b=qCWtqIwDD43NHwQ4VZSKlQzpYLcBMoEGcIjLlrdNj60TRKmJbIF3I+cY7dHPRvvtCK
         bOQeaEJHQv/X7ZgqPEmRU8qxkGCVpCFIxzSz334VqyfcyOEICsg49/uLw1BgE61vzVzL
         YGd9Is321zrmPUTPYMajpyGnNkonDL9rAVuOrDttQlUDuqPI+kiOJgA3DozkLdBhG2Ui
         NHEoPunWf5jwDz2Y3uDUmOdmlK1Qxjai8pmlyeMPAVQnJfayYxpUkYYNpUcVtiiqZViO
         h99HJyJ1K9B9kVBLtqr6EjuQzHvI5hr390oFzmHlPqyRczx+qJu7Vd7FXPXH7cV0J6xY
         9Bng==
X-Gm-Message-State: AOJu0Yyvns1RJq2UQ8DEAWYEuUha+4F64VyRYbJIjwTUyh/2VRMxKkNR
	0t9/6DVpFaFt9OxIs5p3oIEPM7q6QP2DfAx47T7qBBfiJnVyvRH2kECDwVqJakwLXe9D5sH6Y1p
	ACzU9
X-Gm-Gg: ASbGncs4tXHihtsuLnwpnNYN/gKoZjdzKGD6RwUV9DyZJ7uY7GYlQ/WoaOYTcy6t5Sn
	oaKiQAVi5Q74eXsrO7WfD/KP/b5y0rhJfE8J1BNXMKvi0jFmttDu7wx976y7y74wHhcPbDk+T2x
	NAPWmtnaMUwYZLebtVKQpn9LCTD+muAKMigIx5CKL6K2C/5gt94FR2UE8ujL1MdNOB0e9pkllRO
	we2qw3pv8U+s9LkU3gDbBpE6re78Ug6xJQfIcrTIXxYFh4qgG7rUX43diWzKlcxrQNAqNGFQMpl
	3WSyqqQYMu5V83QKCEmvO5N7SOY+S8gljonLNKYFvqyD22CsljwFNTCj05z5KYOmpZEUc5Mrx8n
	CvZIrQMiv5fwEr3YI4202mIynNPPdlwy56KkIkblXEZI6V9Ji/WQCkXm7Ioe+eJOZGOJ45DutAB
	RwbqOIuCfnG8/e5K5rEfNHQDIT
X-Google-Smtp-Source: AGHT+IErsv43anjBK5Hrufod0C/FuxgIhsxBP04eBlwPnmf066V8bGKV07bgDY0sNhW99p2lX3VeCQ==
X-Received: by 2002:a05:600c:1d01:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-477c016bbe2mr116713865e9.6.1763985183059;
        Mon, 24 Nov 2025 03:53:03 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3b4fafsm195964165e9.14.2025.11.24.03.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 03:53:02 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-unidecode: Add recipe
Date: Mon, 24 Nov 2025 13:52:57 +0200
Message-ID: <20251124115258.3337453-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 11:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122007

Add recipe for release 1.4.0:

- Drop support for Python <3.7.
- Add replacements for playing card suits and chess pieces
- Add replacements for U+211F "RESPONSE" and 0x2123 "VERSICLE"
- Fix replacement for U+1D6D5 "MATHEMATICAL BOLD SMALL TAU".
- Fix replacements for U+014A "LATIN CAPITAL LETTER ENG" and
  U+014B "LATIN SMALL LETTER ENG".
- Add replacements for U+2103 "DEGREE CELSIUS" and U+2109 "DEGREE
  FAHRENHEIT".

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-unidecode_1.4.0.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb b/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb
new file mode 100644
index 0000000000..c6969fca4d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "ASCII transliterations of Unicode text"
+HOMEPAGE = "https://pypi.org/project/Unidecode/"
+DESCRIPTION = "This is a Python port of Text::Unidecode Perl module by Sean M. Burke"
+SECTION = "devel/python"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "Unidecode"
+
+SRC_URI[sha256sum] = "ce35985008338b676573023acc382d62c264f307c8f7963733405add37ea2b23"
-- 
2.47.3


