Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB87FB3D0C
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:29 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47980.1774867167861081188
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M5vC8SMG;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso1322155a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867167; x=1775471967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzFNZJ6VkJXPSEmq8KIZR/TB/5LY4ya/b/jL8tii6Bc=;
        b=M5vC8SMGOtSPOI/LSaVuANuHnTeD+Hq9secs+UhyzxMn1FxPTekcdBPlmUT9ZHyEI6
         0UBgChrq0TB0s4NDCp44jEatLeI3BTJ9zNzaOyRU98ioP0vpgwrcm8G12E2YKfZS1TZV
         nI/jjLIw4/BvGdx7FVGjDIg8cMpRGvZv4blRukaHpe0HSbGWIB7apLJiR+8Zh+xbrmwZ
         AuowZkYpFnwqcSYf3mvZZg5DlNDWc8eF+AeF0I6igdhpikjdV2MCgltaqLKlQkQPsJpr
         U9fMlREGBJytzLK1XRxGERzsemiHecREl+f/zIBqwnY5pHyPMr+FLrnEHJtExNbeG1cJ
         Yk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867167; x=1775471967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fzFNZJ6VkJXPSEmq8KIZR/TB/5LY4ya/b/jL8tii6Bc=;
        b=WLA020SL0FicHoTPCQweWs5GyXSpF8xl+5yAIZocHWi5Zmc750g/HeJjfvUHE/OKX6
         6YnUGdqzmQHhxDxeoWuOc+NyNI9O14CxPj2ptJZoQ69ZD18rHfhlirIdc+cMdDiJYDxF
         oZF601KsxWDyewRwVKOSMhw6FLVf0ZSG6rfYvKfez2lEc7hA1FrMteF1Cv7L6skmhGoo
         uEJPPpzRF/jaYj4F2/IDNoEDLMm6+LmuOMbYWKFGiKM5lphOUg/rdjc6NPFCgVQtFy0i
         6VD71h+Siq9cWEyTIvUDL8OKWbdtKjLhn/3F6zxRkrp00lB4dzQZvfn1mv8L6RPLKs+s
         bqhQ==
X-Gm-Message-State: AOJu0YwWub7RZP3HBXONyAAkXHc/Giyv5GBW145WQzng+5GosIbTX34O
	ItCoseSd6ismvTN+4mNkXJn5SoTPUrosUxpr5W7RZVtmy37Zyf78rXW520zEBQ==
X-Gm-Gg: ATEYQzxlo7Lo1ABV63KEsFT5Qkz1hyVxnURo+hrzwATbC+8Pabn+2f00+IqxP4tclby
	0ioStRD/e+kWEJytrvyVuviFfHYjGeg1AeR2a2VuMLMBndBWz8JblrzGe0xAq7aOH/CWLJjzvvX
	he0vE9wDr5RrofUv/PiFdF718Hqaxwr9SQ0oO6c7nv34kYI/f4ZdI6WS5tgo/nTe4oZ/m53m7lX
	6SUu0u5I0uXnTaVNcM+jO/Uw5faIRXmjI7Kt/wc+RcmtKb7heqLgdZuUIZ/51SJYD6Ex96LqRuj
	JfJdtaRivP7edrg9XVB5O8v/AntOOfLA0FMcokAjyc6udkcu9y1Txe7/JRt6dwInrfvaNC30rK9
	do4huf0wNWEUCGcPsUzr07tBJVNH2rXGnT9qR1eB5rdEhHf3bkLprbjBBZQ3FM0t6NlyWwJCjKn
	YxYvrX7QoY9wDugWcX4ChsoEjMn1lK23prcrM=
X-Received: by 2002:a17:90b:1d48:b0:35b:a170:f266 with SMTP id 98e67ed59e1d1-35c3001a5b3mr12493805a91.13.1774867167058;
        Mon, 30 Mar 2026 03:39:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 9/19] python3-astroid: upgrade 4.0.2 -> 4.0.4
Date: Mon, 30 Mar 2026 23:38:36 +1300
Message-ID: <20260330103846.3381644-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125852

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/pylint-dev/astroid/releases/tag/v4.0.3
https://github.com/pylint-dev/astroid/releases/tag/v4.0.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-astroid_4.0.2.bb => python3-astroid_4.0.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.0.2.bb => python3-astroid_4.0.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb b/meta-python/recipes-devtools/python/python3-astroid_4.0.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.0.4.bb
index 034d9c405e..7c381be394 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.0.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "ac8fb7ca1c08eb9afec91ccc23edbd8ac73bb22cbdd7da1d488d9fb8d6579070"
+SRC_URI[sha256sum] = "986fed8bcf79fb82c78b18a53352a0b287a73817d6dbcfba3162da36667c49a0"
 
 inherit pypi python_setuptools_build_meta
 

