Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB53E95A7E
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63148.1767097500109329174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jQ5XLfL9;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so4079877f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097498; x=1767702298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/g3DaeLX11NpZYYlPib9Ad2aUl879OY0vhWmYVgX4c=;
        b=jQ5XLfL9Q6t6QFt2tTaSxLfkUoaeOkJKB3pauILcqaAbY2QVBIt0z6itAtbj47FZGQ
         SQK5NHbourXH1dKy8uaLsxm2xDI3JWrc2uMvJhyXEj8Co2DRaJ+3ypKOUSpM8WDsXyuD
         is9MS7nZLXyYtJ6u/WoAhBQbxwEvmTGaluwVKOYl5CX/0CV5T50F/2//+iADGT1hWI2Z
         p27daT8d4LqQvbN8Wdj8Wi6GgGc6I5S7R+ph0LaknEWsbI+IBbBSso263MSai8lmJoQ2
         tanO3OzgPUpwvwhkECiB9yachZYvXpdr+SP6FsO4xtKsgsuWPR1ZG3P44O1Y0YWGWhDP
         BSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097498; x=1767702298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K/g3DaeLX11NpZYYlPib9Ad2aUl879OY0vhWmYVgX4c=;
        b=Q/fA720bTVetoZcCqHAl08Q3EDlAzN+X1Zc8AfPkqVQxQRUbpDh9oJQ3/TWNiZEYyr
         zO14a8aXaRe5uyV5GXCSp0NWvHNI8KEnU/p/fWE2B40oaDi8qrGCtLH5zp5wnZob+Kpn
         ncCkr9CpRIqMABGI0ipIJVouzJcThHCOVA8FET0QtWj5/NIvkBVoEQHKmB4us2ZiFRDc
         mHbQXW6A+PWSForserupO/IDwCPMMWp+U6l0SoMlOf2BVbQNBvO9dA5eZI4UXZlrj83v
         A6zZChSpFfUAuztwAxOMQHxzfhV/E55rdc4E0UuQjPRe4QM97YFsuN1DXTvJjFobok1Z
         7Z6A==
X-Gm-Message-State: AOJu0YwokHAyoNx1oF4oYHytOJ60NLIQKnuHbX0cCwPJheLpzDj+Gb/R
	tTdSqCfkjaJ416OroStuAAOaW4MrvgivxXqyda8IgpcfJ3Poa1rdxXuMKWUicQ==
X-Gm-Gg: AY/fxX4Gm9ywhrIpwu5lm3DAeXeqRX5qbzpzysVpV721jtyaC9vZz3Lcl8PWJy02l9G
	0jp0f7/FenT39DgP2YSLkqMBAxmiOCrMzbUrOCn35xY72HiXSK8UJ/++SkJKcTxwXNrHJkn7NWC
	ky8u2Qhr8/HNmlKEJ+3/WB0schrBFVbPIC3+qbRnMFGhDVd60X4n2ACvvlhLKZih6Ff0/21c+du
	aEWyt9boN8CUM1qYQnG50ZLRgUlSfepw68uC0fIsplngJzrkJVS9Z0Pb/z/b3rX5Cy6MB3pj61H
	s+4wxjAJeN+GucN9lao9Fc1hQh11dYz/suu+SsSAp8qhv8qTszx9rRx8cmXXeCyiliOHqPeiIn3
	R8txdlmxG7zI/fEWXlXBXJ+kW9qdJVmlAc/hx5j1e68eEv2heICpa5Yra4BtxhyvvMz2XzxWP14
	nN9ZNutKAq
X-Google-Smtp-Source: AGHT+IH123XwffGk4petTbPRwUPia1cmf3HnIDl7rji1KqgoyoltSifd2g5OiguccQC0bp1MCdDPzg==
X-Received: by 2002:a05:6000:2dc1:b0:432:857d:e420 with SMTP id ffacd0b85a97d-432857de48cmr13056213f8f.55.1767097498436;
        Tue, 30 Dec 2025 04:24:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.24.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:24:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/10] python3-redis: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:49 +0100
Message-ID: <20251230122454.721515-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123011

Set the correct CVE_PRODUCT for the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-redis_5.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb b/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
index 702e9d9db5..ba214f5869 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
@@ -19,3 +19,5 @@ RDEPENDS:${PN} += " \
     python3-json \
     python3-packaging \
 "
+
+CVE_PRODUCT = "redis-py"

