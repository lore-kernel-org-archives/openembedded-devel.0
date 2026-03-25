Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5FB106B510
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20828.1774441269212882035
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EE0xW/CH;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48541edecf9so21384415e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441267; x=1775046067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfzj3HFCzIJOy5qjogNVcV0d5BYGg3ubdFaZqDgHSfQ=;
        b=EE0xW/CHx8ru5i/2/ZTyyJeHC2nSpdzvU/zSffw+1P//ddBttzgpkwENpxlH/2wHd9
         YWjeaq86RoPOg8Bz4sAokUqxQ1gwFJ7Vsmup9A0O9FcTL0wD5VZ5TYJdErgJhgy7qiMx
         gb/0jW0fWTJB9Zzd4VHeDSakWAVku1RzypSLAVvawsGvVbE2/5dmDdy4IiQ8m+K+wVm3
         p0Oj2WQuF+WtENg+eLn3xeEyNtaLboKPANX6EhX2kBbQ5poeLnJM1GlpVLsF/uRdsoqr
         iMYzq//DpbEmgwfh9kgBNmQoPLVcFBLJI1HOk1i4B9f11fCrnEbJ0VvG276uHMOrmTbV
         /OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441267; x=1775046067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yfzj3HFCzIJOy5qjogNVcV0d5BYGg3ubdFaZqDgHSfQ=;
        b=WnZzFl67naGtHikL9a75D/ko01PpPmpFvowDr1VLS4NqE4uDtCtIxec2iRKxD/pSPr
         A6RGzFivFCEjwhNhUghTmsSsIlWoNWg4uoxxcb1buxxOM5dtt6HwAE34RGzs9lQ+3hG8
         jOP/0hVwjJDqWKhYGIJhUqGqD5UhJs4aHEHSRcxEQIOM8EBKonlAqpPYQFKV801tzl0h
         kWDpInHi2om3h2XcWhmkVeOYVqTnasjD/E2ipf5CWrdxN3OQyPD9GlFzy57c5GnMcdVF
         vpfqjEnAf/oj86vmnYvmc0nBwAUhkLWGXU9k+GZ69wdpj457rpmyUKQlzNsysWrBNejK
         gsIQ==
X-Gm-Message-State: AOJu0YySRm74asMpijPnjj1KXdsqsX/Yrb6s4qUFi7j8xh8qBmPnNThW
	YxSdXINwB0DP7bnm9l5Rli1oDpVkUTUplhrGRuvBiswTBlx2u1plvgXpknvISw==
X-Gm-Gg: ATEYQzzYL7JYmXDuIcQcQdcU2YZjYmH/aq/UDf/e7ZCdlwpPKVOfJ30IA/MAfCRnvDV
	ZoCRvDNpKDXyBLdEor+P2GcQU3ZRJXPvN9JjlixnIPrXzOMBhZYfKfkkuTVyzFQcPsn3s6fz/zK
	lB0KbmWqJnmX5kCNI3UcfyI3e9T7tP4kWTuIBmPScI1C0ZxRzLPhYTsZZKhq5StF7sFW67OXk7t
	70sGVHIXaZJQvVtS051xTVvcG+BOw2BE3iSuiq7J+j+8Msjes/JL3AMhzX/6/rjFl1E0rQprM5c
	wNDtZND3UU81nuh1l3sipx2kwbkz4ukbZ65IhzD+oTHP4hzN3ZgoKE9Bqpi+oyZHyGH3u0QfNUY
	kaKZoUXBU6Wzy0+b7nknfV1gh4q9P6VDr8WfCEFYXYrJ9dtXu5rM4UqWUeK0/vhSED8UGObW6j4
	2aas+ufp9zIb7VEQ==
X-Received: by 2002:a05:600c:a4f:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-4871606c9e8mr42896935e9.23.1774441267270;
        Wed, 25 Mar 2026 05:21:07 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:06 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 06/15] cmpi-bindings: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:32 +0100
Message-ID: <20260325122046.1211090-7-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125613

Use PYTHON_DIR instead of the directory name based on PYTHON_BASEVERSION.

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


