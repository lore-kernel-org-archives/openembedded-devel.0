Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30270CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:06:01 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.10610.1760515550821435410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RDv69lZk;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so1164368166b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760515548; x=1761120348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/FSDKFLgGxoUfrKJbkz/K6b+6PVjy5itpeB8u+YEKU=;
        b=RDv69lZk8diVBEkvsca1djOEi4kmA7ApxFQwzGqTq1RSLNhhcgHimr7OaMnW9Foriv
         krD0CLddCtWH6nbR8TkOZkb+ffa0VFgyni8gAw2kQWEqjBucqISobBy5fmzAh8e2drpy
         VXcZoHOq28bAUkhNjJ9mNhCXzud8L7kIFe64I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760515548; x=1761120348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/FSDKFLgGxoUfrKJbkz/K6b+6PVjy5itpeB8u+YEKU=;
        b=tRKX1hNQi9x6orTiPyrw0LDgP6efQyrZzfLykUNSjd6N6iC5jFrMbsbbG3R3Y6t6Qg
         HNl4H22GMfmS6dFK2O2jQXfts1/okqWKyOQxXpdVZy4n1a5+/N6ieQFo18lDMaMi4QNB
         fyDie5hZvo6ODfFS6Wn5BasfiqfksJaJ7MsryAB6Xnn0NfkIgxdaxHAQky/Ma3aAztBg
         9knPn7PaT1qKPDZ/hysU7pVLZ7L/GEJ6BzY93bp0wD0hNRkZ4q7xKb4QTvutpismuJ8l
         nLLzXcdj0nV2JfMxOlDPERco5BVgJguM32cYsIrTmXxIdVU1herx1+j55Pr0wkPlZj6u
         8jEQ==
X-Gm-Message-State: AOJu0Yz5dx2JQ/D9Wx2ec5NLcdmBQlSpBYBbZgrAwErygqjP2Z4Frddl
	cmPknh21QsO359PEWenC7KBg/XsUbgzR0DazKqciek/C6UFS6BalEgDp9ocQjwRZOG79qTeGiTk
	/lww3
X-Gm-Gg: ASbGncsbGLqMmoVzPGTSSN9IIph/nS3dniAOJefBxnS+kwUGZlLXhM8EJpHrA7pAD6e
	crxwzx4fC3DvKqqpSmRwiBTJnxGkEoOhjT5lSPUZbBANkcDZ+H+semlCL5eDPan9b76AH7FkD6X
	3K6edLXaP+p5aevxX8nPBHMIskV+C57HaeQCqmsLEZjsCZpeFsHKEKE+ZUfaMK5uLVkdQuJTMqk
	BntHbYjfFcWyokRVqC3yfZyqYuxSf5w2tiRUEiDqVQfggYbM5pOsKvHboA/dQDAET43rionjoO0
	k4YiyA2651PT+1QD8JPWMc5IIl/8SCPWreaV3eMH4Seu8G119DsPhNHEqNSnOXHcu5ImYyjkZRZ
	TpXfmVdxTembDwr9kxVaVh9nA+bg7cWw/4LSrQNpj1XyFcSAP0ZD6nW8=
X-Google-Smtp-Source: AGHT+IHns+pY1NfXesHrAC/1BYPA01r9y+rHSnevxpURFwJeJT4N2E96LQWxPRMUlJqLqYd5SLtHHw==
X-Received: by 2002:a17:906:3394:b0:b54:2edb:2a40 with SMTP id a640c23a62f3a-b542edb2e14mr2037429766b.14.1760515548220;
        Wed, 15 Oct 2025 01:05:48 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1d644sm12977027a12.17.2025.10.15.01.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 01:05:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-httptools: Upgrade 0.6.4 -> 0.7.1
Date: Wed, 15 Oct 2025 11:05:42 +0300
Message-ID: <20251015080542.3607193-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015080542.3607193-1-leon.anavi@konsulko.com>
References: <20251015080542.3607193-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 08:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120698

Upgrade to release 0.7.1:

- Identical to 0.7.0 whose CI failed uploading

Fixes:

WARNING: python3-httptools-0.7.1-r0 do_check_backend: QA Issue:
inherits setuptools3_legacy but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-httptools_0.6.4.bb => python3-httptools_0.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-httptools_0.6.4.bb => python3-httptools_0.7.1.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb b/meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb
rename to meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb
index d8a9f06908..f961745a1b 100644
--- a/meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "https://github.com/MagicStack/httptools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
 
-inherit pypi setuptools3_legacy ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "4e93eee4add6493b59a5c514da98c939b244fce4a0d8879cd3f466562f4b7d5c"
+SRC_URI[sha256sum] = "abd72556974f8e7c74a259655924a717a2365b236c882c3f6f8a45fe94703ac9"
-- 
2.47.3


