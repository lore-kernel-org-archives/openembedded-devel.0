Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE6B10A88D5
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50970.1774538524294872648
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cetDVuVz;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso12268065e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538521; x=1775143321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOc465uoOplJQ0d0auFqfWdawEgPdJ6hek5Vg77txic=;
        b=cetDVuVzdBawIFyvr7IpqzyiZz72XQxNSlx17PJASEGxmOFnmvNKrogY0uv4faAgRY
         2JSvXAopcyr28NAwT4/FeClg9tg9GZG0Fi5Gs2gwcdtZH1KlkQJywXMKxeM8YmRhIEI/
         W5q6LlL9K1qieAMORAnmCHK20+A5UVcAfTAruuiTno0p+QUGbXMTsYbBKm653v9w/1Kp
         L/8hpsmQjAommpc8fTu48RVA7wlYxgznSlmbuOVcvR9YP7tgtNivz9YDxE8AMd3b4eQn
         N1uZIQJYXiQsbLSP8A6fk/nSMrgzTL3O5c7aIzYd0l9fRCgkvN7RZzxcX2d9OuuAnX0E
         h3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538521; x=1775143321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOc465uoOplJQ0d0auFqfWdawEgPdJ6hek5Vg77txic=;
        b=IF+fE1gi3F9r9GuOrvPqAsC+5vlKV9gWiwsdrFsC6SkSLppIIF3qJxt37zkG3Cw0Y2
         5DWA2XlQrBOCu12gxju11K1pRkmHg4VMN1Tp8+HaQmc8fTl1MNlJXgkUGTiI3yS5X/AG
         /Z2T90ze4uW1CmcuyqYp1fsLKx49Vo++ARRlilPRvA35YEMma3TLKQB0U2jvCr4lu/zc
         LvlQCWghN++clyOVSQzF6fqQBU0WqdWD5BCxqPJywd9QrHcIQcFBrn2xXDh6ZYNArdPI
         USwQ580zMreMnJJTqUgxNsstLB9CJnfqg0s7OWoeOjMZWHecvF/qja7/HV4NUgqRc40F
         en7g==
X-Gm-Message-State: AOJu0Yxbid3L+iBoF9ktK6Ytjoz67QDQIyfK1vrN2iJ4Tgjt7/QGN99K
	7H5qk25HUunI7cno50lv9KW8l57Rd4u0zecfuYcmVgJliAwseUhsH7gmgd9f5Q==
X-Gm-Gg: ATEYQzy0OxT1kB2f5EkOp7NrH7DZ+TGEEbCIvyrkE1umejbqqTqZ1vJLRm6h/wYJMxh
	v3+FgmA+2qqlIuUyvyd+q3FnlQEPXWtE8phUx9qsA4680OwrG9QjOTqoVrTViNRjUXpXWHu2jWF
	pGi7m6t1Q0WJIBxoA5zSWf/yYZc8ptPRgMLXpi9PFU0HekzNWEBvFYMo6V8D6FoYwj7a0/twUrf
	SDWuCZVmjjj/LE7eWvrK43QCimuj5l1LNposPwXnim7z7fmfjG22JYRSe6N5tNQhYa/osbCIb3g
	OjPwVfJ0rPDWeAVj47uzC2pK9udfUZcKHFTKGx6FQVln5e1NoQPxtiHtwKHmvRtVJsJ+qjuGMUJ
	Svo2NjVf2GzA5xLiG0B0Zp9yFLu/K513+tXDcDBSa3HyzzuXY5TB5zmJjcAU9b6a+nEZErySq8M
	UFGbuCVBrFJ1ZiMg==
X-Received: by 2002:a05:600d:a:b0:485:4535:73d with SMTP id 5b1f17b1804b1-48715fbf739mr101839735e9.2.1774538519962;
        Thu, 26 Mar 2026 08:21:59 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:21:59 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 05/13] cmpi-bindings: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 16:14:30 +0100
Message-ID: <20260326152143.2224099-6-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125744

Use PYTHON_DIR instead of the custom constructed directory name.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
index e0d995226e..97c426cc22 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
@@ -18,7 +18,7 @@ SRCREV = "49d6dcfc71ca421100fcf325e31625817c469fc9"
 inherit cmake python3targetconfig
 
 EXTRA_OECMAKE = "-DLIB='${baselib}' \
-                 -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
+                 -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR} \
                  -DPYTHON_ABI=${PYTHON_ABI} \
                  -DBUILD_PYTHON3=NO \
                  -DPython3_SITE_DIR=${PYTHON_SITEPACKAGES_DIR} \
-- 
2.53.0


