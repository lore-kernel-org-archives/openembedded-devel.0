Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28150E81A3F
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 16:09:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23099.1771258170497317788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 08:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cGo3+DRD;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4837584120eso21224175e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 08:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771258168; x=1771862968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgV9Vkx386A23qKh6k2wDt1PjhVQTHQlArMv9dWK6ME=;
        b=cGo3+DRDJOFZcWfBy3lenNK4PvAdhPrAujQP4kG1Kyk5Rg4cJn8TaHE8Sao99dDb8u
         Kgf7/60K8X1GVy8c1/SkrckhyCXLLcowx4pehho+bQvOXFP3n1ROsAhVasVbQOYpLLo6
         V4VyFMUkHieZ1isZtjGtCP16lzrKLDcj2FM3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258168; x=1771862968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgV9Vkx386A23qKh6k2wDt1PjhVQTHQlArMv9dWK6ME=;
        b=k6v7kap6mtn3ZmOTBh0XBchFRQdKB6q8CBsGo/mg9C+d8tY/XytBnotJKO0oKESdD3
         28XQEJ3w3Ye3xRwLkR4/7vGkc32mks79CeCsevmdBnuJuwddKVX2BlC/x11VWuPh2vRQ
         3X7ycugb7SA6Dj4dhpVyex2GE/htL3FSRj4uufKe+tOoBZWHrN1ef16/TOJypP8+oU1E
         60gcGVt2ESKeXNItv1HH6LmdFtF1WUINA+MMVPwSOLlSdfPeQYTrsvnng/+thPiXhIXz
         qyOTt8bsrOV8IRpvUzlzynWMhQ2GMWD3JIM9vYiEZClN3By5oMCFJ5EMcGbDY8b8C6wr
         d7Gg==
X-Gm-Message-State: AOJu0Yys8ZxQqG7UYom1CiqEwViwu6JJM1dzmdTxF1tG4KDWeEgalACG
	/AvOxVWQFia4sKvkwY8uziVWa5wDJgZqNraWNuGOS/1le3ZUb8WdwCQVlCfmHLZafvSZyA+h/ra
	pR4EI
X-Gm-Gg: AZuq6aLN5UNQe84/8ZXnlvJeKBOHKondaPGYzcrQhGrI7K+uErpYGu44mgaak2kz3IA
	abWvhzzJv4yNVl82ID3nrKrmBICo4RwwUoOgA5+AFxLZhCYIzKmexouwKsEp35DPFsaTGyWtgHx
	l9UckH/SoYBctgnQc1a1mmA9gnXIr3QU9YTiSWsOsf06CyP4cpekg9cQQZj3BOXdq7brELc0w9X
	+7ScSBph5g2cJuCHk9KcbgPWpxETipsOpPaIO9+f99tk2fS4NzswggZQ1V6QkcidO2F23xSiH11
	U8ptaoXzAxK4+MYTK3vOt5RDVAbcO3IA3BQa5Tz41CES0Sv1AwsOMtAdHeG+QC9S1wm+yZt8HnR
	986/+tWSwKrVwFLFCPI2Wy7uJ1knACrex5EQMWri9ttDIImJSXx2TZOtAmrsj2NAspKBhG12lvy
	ZBW3ESI2O/7FJ8dnnA2Mq2vokPorWNSaQzGUZj
X-Received: by 2002:a05:600c:3505:b0:483:71f7:2795 with SMTP id 5b1f17b1804b1-48379b990b2mr110112405e9.11.1771258168399;
        Mon, 16 Feb 2026 08:09:28 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837f4c46b3sm88347945e9.4.2026.02.16.08.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:09:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-lief: Upgrade 0.17.2 -> 0.17.3
Date: Mon, 16 Feb 2026 18:09:23 +0200
Message-ID: <20260216160923.2698331-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 16:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124424

Upgrade to release 0.17.3:

- Fix bug with resources
- Fix VA/RVA confusion in the PE's builder

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-lief_0.17.2.bb => python3-lief_0.17.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lief_0.17.2.bb => python3-lief_0.17.3.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb b/meta-python/recipes-devtools/python/python3-lief_0.17.3.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.17.3.bb
index 44b4976ab1..69e1d59956 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.17.3.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9ab5db472ff936b441055522f5000547"
 SECTION = "libs"
 
-SRCREV = "aa2b617f47c2f75fca9ff00b146dabbaf1b9f422"
+SRCREV = "03aca30b53db2f336b36f90843061bb3f840ff5a"
 SRC_URI = " \
     git://github.com/lief-project/LIEF.git;protocol=https;branch=release/0.17.x;tag=${PV} \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \
-- 
2.47.3


