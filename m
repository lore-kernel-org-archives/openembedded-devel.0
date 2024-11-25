Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DA0D58D4C
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 13:32:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.18730.1732541535586641110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 05:32:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MQZUpFXY;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38232cebb0cso3436581f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 05:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732541534; x=1733146334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLcPtpJMW8oLSyCj+i8hDep1fdLk1Nh7dWSKQ4/MGfo=;
        b=MQZUpFXY97u/ewJlsh9WJugMOMoWQz4/sP1G//wPo7Z8mnjfrKU+vnhbGhgtj+58hY
         LXcJjlHlOLUqd8K/NQrxmUV5pLPYD3nZG+Fpe+WEWJTY6eabonec4W0EbrVBIREocZ/a
         yS07eodKUO3eNR3mrWcXJMKNxRkEeienFuJsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541534; x=1733146334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLcPtpJMW8oLSyCj+i8hDep1fdLk1Nh7dWSKQ4/MGfo=;
        b=LATKqNpmvFwEf1BFKA/d3DAOp7+Mc/mE8OktefJ0+OfiklQw6+egYstVElI0FXuDFp
         MwQBTAmG/xyGq4cJcC6/6Tg93OMV9dE/4fwDitbH+G2IuaMi31WneBzQpGPHnRnVh9ua
         TtgNEHNEOBUuqIDY85QWfARBNa2dZRSynq4rEU4bJrD8ug+QIQqk0IwwpkaA0RN7dEHK
         JV8QIcM1BKjQH18XoKURZVkqJ1CJEFcWHxCucLBq0+if0oldRALZwNXudttxbUvALSQt
         Ez3+OIEpozR55CscSpHH193APYaxVAtAdVZhU+qXG6RcdC71rOKgtedSPJIg2PCIliGX
         /WDA==
X-Gm-Message-State: AOJu0Yywkm8bXoHtQkJ3MVw1bB+QpW5OlDp4fHbKcKOANhjew99HbYff
	YRCs9O/4I/g/LfoLxfY/KD6rL+DL1bJGDr7WypIYHFWZXrjPDmd40mv61c4pX6z5O3rgpd2WPQL
	+
X-Gm-Gg: ASbGnct+mvZQejxPI+/WTwbWTMefuzftNW0ermGqsIBEuXFTzdo3FBYsAjYo0Zwpd3e
	9iowvctvMEIWCX431usYnALbkCmeuqxTmWPxqW7Ll2vsaqgrlmuJY4HP6V6hHLwuoPnTpp8brHh
	aIqhx8P5qh10n/WdHy2x8yQtYwwcJPVDJxWPxLn8yPk2tFOJWN7xMhsjLf4/7+xqPKzZESx+TD1
	lDEqMLVfCHfNw5g67YOLctB5p6V7wsrrd//juhyJWj/yKfIO1b2rmkEePcelWME
X-Google-Smtp-Source: AGHT+IHzeCj0gxLZFdJ+mNjYnh8BwyxNEPkWfZeY48y/22EM2eZO0pn5Ss7RFT67HjfrLnc7xdwLmQ==
X-Received: by 2002:a05:6000:4010:b0:381:f5c3:1d02 with SMTP id ffacd0b85a97d-38260bc8e60mr9682348f8f.44.1732541533750;
        Mon, 25 Nov 2024 05:32:13 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad60e5sm10741023f8f.3.2024.11.25.05.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 05:32:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-fsspec: Upgrade 2024.9.0 -> 2024.10.0
Date: Mon, 25 Nov 2024 15:32:04 +0200
Message-Id: <20241125133204.31594-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125133204.31594-1-leon.anavi@konsulko.com>
References: <20241125133204.31594-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 13:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114037

Upgrade to release 2024.10.0:

- Performance of memoryFS rm
- Performance of git FS info
- Avoid git hex for newer pygit
- Tests fix for zip
- Missing open_async for dirFS
- Handle pathlib in zip
- Skip tests needing kerchunk if not installed
- Allow repeated kwargs in unchain
- Code style
- Allow pyarrow in referenceFS parquet
- Don't hardcode test port for parallel runs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-fsspec_2024.9.0.bb => python3-fsspec_2024.10.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2024.9.0.bb => python3-fsspec_2024.10.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2024.10.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2024.10.0.bb
index 1073f94802..e6c2b45f8c 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2024.10.0.bb
@@ -3,13 +3,14 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "4b0afb90c2f21832df142f292649035d80b421f60a9e1c027802e5a0da2b04e8"
+SRC_URI[sha256sum] = "eda2d8a4116d4f2429db8550f2457da57279247dd930bb12f821b58391359493"
 
 inherit pypi python_hatchling ptest
 
 PYPI_PACKAGE = "fsspec"
 
+DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
+
 RDEPENDS:${PN}-ptest += "\
 	python3-pytest \
 	python3-pytest-mock \
-- 
2.39.5


