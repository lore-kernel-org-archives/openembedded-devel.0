Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070D6CA6CBC
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 11:19:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8548.1769512746596555652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 03:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oz3AJoKL;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso5311425e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 03:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769512744; x=1770117544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlGFTismm1FNH6B74mKUdxz6xPW7QgzmTBeJRb+T+LY=;
        b=oz3AJoKLbhV5hWUTsquzYxAPKuYUkEm9hzDbepMhwwyhXZSJ9OwgSdlVGY1ZrXOltk
         nqkws68EAZbucWCjCfggI5kPqnwxzc258j44eFN3w5t2Gd0kN4c3RXE6isL2qaCSD33A
         t0h0jxhXeoaaPMiHmiYC7D+Q2uqJpo6+hTrZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512744; x=1770117544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UlGFTismm1FNH6B74mKUdxz6xPW7QgzmTBeJRb+T+LY=;
        b=bhHO0avoLq6IwFbQE51Yp9iOARNEQmhCEvuE6enh9+Tf7a37SGf0/nYeNkyN4UGVIY
         cntqMGSBL4nz1IPDgZ53R6q/b9ZhjP1O6FCxYF8xlGmMlGeNlIQWwmGIvzT2SbMkziXT
         w7HDE9uqPA/8HGZ7dIZWccISYmABxqV3m+5w/+Op3Cf1eEzx6lbRv23vyOszJ7UJMMQy
         2AbSeadZNb+f6hSYw/isoEcnJDjX3Q3LGPsjXJdKyFfaH1oUDQptEv25LG5RJgHd0E3K
         NPnmUSOJTHkLlJwdJIyLhvnz6FjhIep21gXW4M0nbkR8Fg9CloUXqsC3F3NXi0O6nRN4
         ZGBw==
X-Gm-Message-State: AOJu0YzZ8eJEkjb2q7taZlc4pyaq7h8nI4FjAlArq3mzOvOMTwlSsWUC
	rhDEnkoOhf6bO++YVy35ToMAxirT+YCAMESynnpZ7eeDuImn6h4w50ByWdrQlmlZYdJzZYrmFtr
	AgMDH
X-Gm-Gg: AZuq6aLXmph04lpnejtA/HNCP103EgH25S92VeAB7frmrfqP52CMNolpy5D1Qx2XM3Q
	ipmAAGImOVcJdP5xvL2TGhpo8pqQZS1BRI5uxMqBdrcjltn5188htRCc1IKiQ5dL3zaH7wT+iMo
	VMiXb32DDaEnAgdUsnBga700yhA+MiSUW4emliSGxTLQDohYYroHj//ediNm1jUtDp+brQvGIbz
	6HsdDpNJ9ELfpy35pBWZoLUoEcLxZlUCDYXRrHEJeUyQvtZdxzQ8o+vrk/io/Ixlq7JTQ88C0SW
	FuVH1MCzLhIYzb2akkXk63NZlLJoSqe1+Q0q0tMxBQ97ovIP7upJyifUzsBj5r6JFWPrfZOaowm
	YIB38pZiEIGhUqJtrWn0gjowUJ0Ah5tMtexBP2e9dKFo1GLWVUvzfKvK9viJWuY8An5MlldRaHS
	BPHegs/esKVY1sWTbgaBRiBrsY
X-Received: by 2002:a05:600c:8b22:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-48069c2335cmr21052205e9.16.1769512744558;
        Tue, 27 Jan 2026 03:19:04 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066beeaf9sm58189925e9.6.2026.01.27.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:19:04 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-path: Upgrade 17.1.0 -> 17.1.1
Date: Tue, 27 Jan 2026 13:19:00 +0200
Message-ID: <20260127111900.3683454-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127111900.3683454-1-leon.anavi@konsulko.com>
References: <20260127111900.3683454-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 11:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123939

Upgrade to release 17.1.1:

- Feed the hobgoblins (delint)
- Supply the types, irrespective of platform
- Ignore the arg type

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-path_17.1.0.bb => python3-path_17.1.1.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-path_17.1.0.bb => python3-path_17.1.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-path_17.1.0.bb b/meta-python/recipes-devtools/python/python3-path_17.1.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-path_17.1.0.bb
rename to meta-python/recipes-devtools/python/python3-path_17.1.1.bb
index 066f756730..be150f3dbb 100644
--- a/meta-python/recipes-devtools/python/python3-path_17.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_17.1.1.bb
@@ -1,8 +1,8 @@
 SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1aeae65f25a15b1e46d4381f2f094e0a"
 
-SRC_URI[sha256sum] = "d41e05ed4fa1d4f6d702df3c1e0a1a255d7b544287432456455dc7c51e5f98e9"
+SRC_URI[sha256sum] = "2dfcbfec8b4d960f3469c52acf133113c2a8bf12ac7b98d629fa91af87248d42"
 
 SRC_URI += "\
     file://run-ptest \
@@ -10,7 +10,10 @@ SRC_URI += "\
 
 inherit pypi python_setuptools_build_meta ptest
 
-DEPENDS += "python3-setuptools-scm-native"
+DEPENDS += " \
+    python3-setuptools-scm-native \
+    python3-coherent-licensed-native \
+"
 
 RDEPENDS:${PN} += " \
     python3-appdirs \
@@ -22,6 +25,7 @@ RDEPENDS:${PN} += " \
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-unittest-automake-output \
+    python3-more-itertools \
 "
 
 BBCLASSEXTEND = "nativesdk native"
-- 
2.47.3


