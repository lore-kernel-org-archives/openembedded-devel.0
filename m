Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6194410A88DB
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50123.1774538538392963413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S61/vBG9;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f454be5bso20723855e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538536; x=1775143336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YChsij6iNBfX5hUqLwsqcZCO/u/wKpl+EdCcNkl9x8=;
        b=S61/vBG9gJ7cXBc4bO+SLIZht6x5XlCiEN01MhJmv1JIYmHaOu8TN7293nLKE6E8wV
         M5GAtht9PB2hapcoD01IdGJ3kBLBtcr0AxbpI7fdKmL8rnfs9RYAXEvhb7w7g7+cxc8z
         YWE9cigpnTO+EGpsonq/Ii+tJrgHRv6wxVC9V1BO/o+2ef/rKlreP7ZBOEU19aAYnabn
         yNClieB3ajogBYlYWQYyweLAfySdtulSX9ITTu1TcTU9rpvxnhxxPplcMJ7O1Gy0hyH+
         oBSZradyPpvRFoSOurhQtgkL3G/N3tYfK8td4tGpdwnAzQx5xE1UD4rGcxx5MnC5v56A
         3sDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538536; x=1775143336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YChsij6iNBfX5hUqLwsqcZCO/u/wKpl+EdCcNkl9x8=;
        b=syL+SRavXDY5A7OCONmbZtz7JA0dOGVBXlpRBX0K8fE6y/zRNmIHKCDW0s/auSq9cA
         QXctkIJVHu8R7qtmsgaMzU0QbIntXC7VxvCdmQzmExZXeLN1AgPaSX5VJDNUcHb2A9/5
         r1kvVYxEgiddxFPDLPmAuQYjKvooJ2D2ouq2fbKRvC47HrJ5J7Y0hO2FQmAFp/9sqmgh
         dDB7Vtzccv5ZIGu0YYYqDY/AT0etwOrDm5wYhlCHIfkir3QZIIZC5FA3N1Vf/EjR6+/A
         j52HsWihagzs7KzGc2petT45epF6RuT3BG4o67eKmzHSrdE5zE42q8bZxmNp50K17xH0
         MJ+g==
X-Gm-Message-State: AOJu0YyHG7JVX4bjNCMPvTqEv6iPXwjaP1IBqSxzteKN7NQZY855yDHk
	2ICIQnBpjX9TvseZcN1aAGO7ppQVAotfyiV5QehE3LmC5x5FKsdizYkZ2JWPog==
X-Gm-Gg: ATEYQzzCIoEUvvKuX/Nz753bGMdorgRpJDGJ3vUdZkqI7eeTw24VU6cqOpXRzr7a+jp
	k8vve+YG4D8ZAMV56vMvN3zxJzkbY2atRlQ9cMZIfl0dt5PJGTCrb3tAK4ilT/xiwPtb92g0crh
	EOOFVihqe9oiqrpwo5PhvkjFtQHWOdh/2XZdyLxiNFjzLtX3MP4O/OAfM9vh8jnLoTAw0hd1gJq
	hDDbRg98LDVxijQGg5ZkOUxpkUvF6KIQBBh9v2rS+z7MurK1ehwcuSx4hVwjFia6FU6jB4C+hMZ
	kPdIe2PWbZXSzmv+cfUarlmUVxWdUmV+zSbTdwfneAZYYIC1lYtMS4KKFeoyYe7GHuHq/Fq71bz
	yswN4C8DBint9n4YePqNB388OnJFykhCPdd/gEZvwPTBJsOUiFRz32PQqbzAGZXLBoFQzbKrUIZ
	EwDIvDhZ2rcJhWqg==
X-Received: by 2002:a05:600c:3ba1:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48722bdfeebmr34823595e9.11.1774538534096;
        Thu, 26 Mar 2026 08:22:14 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:22:13 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 12/13] libftdi: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 16:14:37 +0100
Message-ID: <20260326152143.2224099-13-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125751

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index 6faab82ad5..931342186c 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -32,8 +32,8 @@ PACKAGECONFIG[ftdi-eeprom] = "-DFTDI_EEPROM=on,-DFTDI_EEPROM=off,libconfuse"
 
 EXTRA_OECMAKE = "-DSTATICLIBS=off -DEXAMPLES=off \
                  -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
-                 -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
-                 -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+                 -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}.so \
+                 -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}"
 
 do_install:append() {
     # remove absolute paths
-- 
2.53.0


