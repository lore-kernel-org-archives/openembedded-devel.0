Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014B8E77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 13:53:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.48591.1736430795044721178
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 05:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sJ0imxpC;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso10785415e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736430793; x=1737035593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PktvOjCB7pnEvgDdH4kNwCxjf6RYfMDKy8cADb1eiZk=;
        b=sJ0imxpCqFXvPDv7MZYQNmK3E2otFGLbHkSoGL44x/Jofr8yT5jSgwIgwSFyEF0N0Q
         eZHtDAroGtvYmjDRm/hT4ZXoJZcUievxis8eG8CBEm5s61dR4tHQHfDgSqhh9TRXqyzo
         SYgKwThVmnDFqXf34jz2MrUxlbiHGAi2Nk0zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430793; x=1737035593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PktvOjCB7pnEvgDdH4kNwCxjf6RYfMDKy8cADb1eiZk=;
        b=Z/LBKCvu+FG8RSku35Gu99YhT2dfpGwRJ2g4qqS5/nR2SUsFOqL8zhCojeFO3k1lvM
         DH6UvqplF/PRaU82LkzNu1xUbACMQxjuoKx2ZA9oAHaGJp2VEXwNsX2jVjFJMCgXhnyG
         fY3RPQ2WLY+F/svKsD+eFdyNwOA6/zT588XpoaUARm24mfZH/9Hf0RHjjB3v6wZmgk/c
         8VrHkhBR+Gnaygaq2+Km691qANtKjMvOFEOXyY77jn1pXC8dVk0sAHvmraxT8oR3MGMp
         GYz70NmhdAW1TpSJOFEfy0q6XLeRUqx2jNpu3lbroaC0E1OKeTsTtuujSgxNmlW50G/1
         u3mQ==
X-Gm-Message-State: AOJu0YwK5jUil8BKGi+HlIiB2wesUX/cLfbZ825oGystGb8GMB6WqUoy
	Ll5oi4i92aBZR54M6ZQkKMKp9XXilIUct8Oof2K5+mECOnWg8bKrpbYrlQVIjpW0MeaXKBsV/zQ
	a
X-Gm-Gg: ASbGnctTzA/fd11DNousXobLUCIdxSFBrDayDf7TUaKbRbzGSyCbQbKjxNrT3z+Ft59
	JOppsTkKrONQFNRu9HJB/USro2aXxoEqvooJ9pHAcHe1L8pZM/3KO4fSh2cFAFPwnC5UMbfswz6
	P1OQ7s6oDFkTic/uH0SPPg2w96Ls1zAJd9cXGSZ67WerT+H5k4HKsNrNL3/nqzNlEbCNWEkTFdK
	QdZyMTXHblnDX39BgFkNFRpLtZox/ayoadYiLq9Ila5MLWb1MbyUic2pM0RmLadM0FuO2o=
X-Google-Smtp-Source: AGHT+IEHqaBMS/7Hw6E7on+rGcdJzIMI7BYBiDgrjXx55yd9Y1Yea5yuRfIIPUCHpLPuJe2rklhoeg==
X-Received: by 2002:a05:6000:1a8a:b0:386:1cd3:8a07 with SMTP id ffacd0b85a97d-38a872fc363mr5202474f8f.7.1736430792974;
        Thu, 09 Jan 2025 05:53:12 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38332asm1870994f8f.23.2025.01.09.05.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:53:12 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-cached-property: Upgrade 1.5.2 -> 2.0.1
Date: Thu,  9 Jan 2025 15:53:08 +0200
Message-Id: <20250109135308.2948649-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250109135308.2948649-1-leon.anavi@konsulko.com>
References: <20250109135308.2948649-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 13:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114753

Upgrade to release 2.0.1:

- Specify py3.8 or higher / Officially drop py2.7
- Link to functools.cached_property
- Add official support for current Python versions (3.8, 3.9, 3.10,
  3.11, 3.12, 3.13)
- Migrate AUTHORS.rst to AUTHORS.md
- Migrate README.rst to README.md
- Changed from black to ruff for formatting

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ched-property_1.5.2.bb => python3-cached-property_2.0.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cached-property_1.5.2.bb => python3-cached-property_2.0.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
index 059c34a29d..41211534b5 100644
--- a/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
@@ -5,7 +5,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db7ff60c4e14f58534201242803d8abc"
 
-SRC_URI[sha256sum] = "9fa5755838eecbb2d234c3aa390bd80fbd3ac6b6869109bfc1b499f7bd89a130"
+PYPI_PACKAGE = "cached_property"
+SRC_URI[sha256sum] = "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641"
 
 inherit pypi setuptools3
 
-- 
2.39.5


