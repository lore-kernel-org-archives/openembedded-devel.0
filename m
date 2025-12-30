Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC886E9411C
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 06:52:08 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59967.1767077521661895973
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 22:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVBbh5+e;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d6f647e2so157079195ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 22:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767077521; x=1767682321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7yt+GwxQZVVsCGM57xIqxQsVNa3romJHQ97N3fVhm4=;
        b=UVBbh5+enYCfrLZAmvBLXp+30IbD1ugH4+pGKF/pnU2+AtyHNnp5PtoD4MKXd2H51A
         yNjTvMey1sYY/+mWLZqc6Ky5Em0pL0oQLE1q2wQdJzOO6GouHCkSlZgr4ADUROqme72B
         6iH8eX05RpJkG26ddjq2lJHhmud8eqCxtVnWo1sLT0oVPaH7mUkgNABoBaEAl+Ekxb1F
         /yh0/2znhZdLC3O7s7CF4u+gdDidn8dNQWmmipM1McYAl3KIhjyxIFp6t6incO6TdMUi
         qjs6JYfDzCQe4OxoIhv/OiKMxeRYgmFqQ0MjPfOBKEAlnoF0mYnhPMfuVd8NE6yZSIM6
         u2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767077521; x=1767682321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7yt+GwxQZVVsCGM57xIqxQsVNa3romJHQ97N3fVhm4=;
        b=U/87hEG9E6ZORtfa9jbtOf528KsH7x5aYN177alJcdVt/VLLyHi2FXwaprGZu7ENkr
         ABy7Wbyn3qENfVB4y3SnQIzxlOwh3dgkq8TJuHwZD4ZCAWq82RGjYpVPtF7s2Wj/dxlr
         77XpOGK5+rcV4wx4c2nO5C/8g/ur2wHHMqNq4CTPG9Y53NGiWs5IojPBtq601/VG+Gym
         EK+Q7piIPBcM1JTnUvvXoAFZ9jQ2I7T3y9BJae37KNZdJ2VODignqpAYq9La1zhqPaTp
         R8gRx9EulfmqnninwnhzeHmfa4Yg0GOkqSOThe/Dv0f+vdHnX/TAw7hB90O9LDFSKpD0
         sUIg==
X-Gm-Message-State: AOJu0Yxb5t05Ur5HvS98d2x466ULJAHUHk64FlhoiVK60yNr0Lo/Z4Xq
	RCcxc0oA3594y3/D9gJMbJC98wARN1FeOCzJjfTEkjlkRUvGVDpHRtkXSmVPgpMg
X-Gm-Gg: AY/fxX5UX4dDmNb6MgZEdoXqlDnftNEsJhY6VycJKW+WLGMsh+9FVdsXtI/iAlUMp9/
	A9ljDdle5X/Slxebb56PSf0m/pjSk8sO0KUUIrUCcPaxjI2+Jlh1gpik3fKJOuUM29CXr11BOKT
	iukQ6g7JiYBmyXCggBWXzds9HoT9ybLLy5avvSLcRB1ASLbz/04wHgpeR9vBw/VSONEyMQGiPSQ
	fNKIcn/rYH8g/P/3NP9VLwQaun62lWFS1u4krchY2KKhKvzCKMl9+/GdlFTdOG2f4j8yfF9b/qt
	SeUzL3uAsE2tdFCLSSxXpsr3Vut5CoRGdgf1kU0P1Jpy44gbcVbJE14vONl76byFMIQTSC7Vc+t
	jQwgDR4Gb+2PvUHJkvx4tM4b1KXJaDIL+isRg/1SiQlTdA3uJZ9l+f4o4f0lzbo2hNJwlNo3xI3
	dnWtwg/TMS0flP8RXtEMOeAHhH0IPthKD5jexdoc/lFU8Wm3YI08gCcUCgCMO+FZ5K97O3B/LV8
	0lVzkz4SeY5qo6jXa3jJxJyZrVe7xs=
X-Google-Smtp-Source: AGHT+IG3rjqQndcDyJCXa0cm9qaSVK9/bRcDiEPyavIDseqQ8bZCncnA/0+bOSWlHNvonA7NjsoJyw==
X-Received: by 2002:a05:7022:f902:20b0:11c:b3ad:1fe1 with SMTP id a92af1059eb24-121722b1a7bmr29157169c88.11.1767077520674;
        Mon, 29 Dec 2025 22:52:00 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm126240207c88.17.2025.12.29.22.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 22:51:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-backports-zstd: Upgrade to 1.3.0
Date: Mon, 29 Dec 2025 22:51:58 -0800
Message-ID: <20251230065158.2261955-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123004

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ackports-zstd_1.2.0.bb => python3-backports-zstd_1.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-backports-zstd_1.2.0.bb => python3-backports-zstd_1.3.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-backports-zstd_1.2.0.bb b/meta-python/recipes-devtools/python/python3-backports-zstd_1.3.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-backports-zstd_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-backports-zstd_1.3.0.bb
index 2a07c36c40..fb8c4fb6c6 100644
--- a/meta-python/recipes-devtools/python/python3-backports-zstd_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-backports-zstd_1.3.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=224f30639105a6ab845e068c2d0903ff \
                     file://src/c/pythoncapi-compat/COPYING;md5=f74f54822fab8814a50330e4e4578b88 \
                     file://src/c/zstd/LICENSE;md5=0822a32f7acdbe013606746641746ee8"

-SRC_URI[sha256sum] = "6c3fc19342db750b52fde793e4440a93575761b1493bb4a1d3b26033d2bd3452"
-
 inherit pypi python_setuptools_build_meta ptest-python-pytest

+SRC_URI[sha256sum] = "e8b2d68e2812f5c9970cabc5e21da8b409b5ed04e79b4585dbffa33e9b45ebe2"
+
 PYPI_PACKAGE = "backports_zstd"

 RDEPENDS:${PN}-ptest += "bash python3-compile python3-codecs python3-mypy"

