Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE539C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 17:56:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.2051.1711130175451799764
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 10:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Gu2PzCig;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a466fc8fcccso331962566b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711130173; x=1711734973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhe+YAB86QqT6oL9y/uljh/ppkjvJZVz5jfustsfqRI=;
        b=Gu2PzCigfCw5ByBYGimwOLfvfeMHvIBTpLr7bu5vxakG/VoJ4+ppairOmJevJZ/+CS
         tHguir4RUyTu2SdGMWqkySpouRBaQiwg3BCVm8PjWyZ+Z+g5vS+Mi8LN1Xo+VsTlu4yI
         stR7q0cTFYRQDyWrv+OPazvtZ17UqWCVuhLnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711130173; x=1711734973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhe+YAB86QqT6oL9y/uljh/ppkjvJZVz5jfustsfqRI=;
        b=mI90uLmRpSgkhx7mhctGSr2MdbPaPDrygVCULvaUFlZSdM7EwJn7RyaIVBJtjpmwvs
         t4hHzcdcUg6fs2aZZv8/u85lgxH4LXKba2QM8NlZvYald0GYdxRyDbcezb4V8Rla9rqK
         mK8cVFtA5lNzp28WvuoqmrUS8klKEXruqaHf87uNg0X+ktEJXJgbMpEiwaKf5xDrzxBe
         x/BJSuIGjXUp4irmWoFE+GDpRTX4l9oMCe7TBrhmVa7XZO58AYytHqtC6VfeE/Q40UOb
         FqAqZebQaS7Y75h6bT06xUVrP0wvIJHcEHCnnjS1AARMsTRhIGytDMohhsUtN71mzYvh
         U8aQ==
X-Gm-Message-State: AOJu0Yz9q2dv7hMaBV10LAYdGRRkM1XF7+Rk6uClzpHKarWdPCjofNmh
	Q2WvpaHrwsCXG1n8aoTjpxQCiqeR+7YKSIENhKkII0dlICMCI6K4B4ELUamIukwSVhTJgU57x4e
	j
X-Google-Smtp-Source: AGHT+IF/rd+szS3UFkAwiL1n+t6AVZPOZ+VA4M/I9DIQqLmVckG9vgTdw/tc4PUoPG09wXdkd/mpWQ==
X-Received: by 2002:a17:906:1417:b0:a45:b1d8:200c with SMTP id p23-20020a170906141700b00a45b1d8200cmr331936ejc.14.1711130173623;
        Fri, 22 Mar 2024 10:56:13 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d25-20020a170906371900b00a46bb8a44cdsm54742ejc.198.2024.03.22.10.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 10:56:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-httpx: Upgrade 0.26.0 -> 0.27.0
Date: Fri, 22 Mar 2024 19:56:08 +0200
Message-Id: <20240322175608.160631-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240322175608.160631-1-leon.anavi@konsulko.com>
References: <20240322175608.160631-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 17:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109525

Upgrade to version 0.27.0:

- The app=... shortcut has been deprecated. Use the explicit style
  of transport=httpx.WSGITransport() or transport=httpx.ASGITransport()
  instead.
- Respect the http1 argument while configuring proxy transports.
- Fix RFC 2069 mode digest authentication.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-httpx_0.26.0.bb => python3-httpx_0.27.0.bb}    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx_0.26.0.bb => python3-httpx_0.27.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb b/meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb
rename to meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb
index 50bff7f85..e4d3cbeee 100644
--- a/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c624803bdf6fc1c4ce39f5ae11d7bd05"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "451b55c30d5185ea6b23c2c793abf9bb237d2a7dfb901ced6ff69ad37ec1dfaf"
+SRC_URI[sha256sum] = "a0cb88a46f32dc874e04ee956e4c2764aba2aa228f650b06788ba6bda2962ab5"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
@@ -22,6 +22,10 @@ RDEPENDS:${PN} += "\
     python3-httpcore \
     python3-idna \
     python3-sniffio \
+    python3-json \
+    python3-core \
+    python3-netclient \
+    python3-compression \
 "
 
 PACKAGES += "\
-- 
2.39.2


