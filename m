Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C72C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 20:20:06 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.14491.1637353206037518527
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 12:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IF0ubs3W;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: geoffhp@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id b11so7889701qvm.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 12:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hDVC6oFEJUWOUfIvksIYO6a9xvgD06bvNYO8D43lxx0=;
        b=IF0ubs3Wyjn8rkNDId114mf6e1AKsaldq+Uv56Nt1+EAGlWyyauhd9/ji88Q52Da2j
         CDqNcWiYDGeKfxYw0Muk4K5ElIx/ZTbHmf31C9KFzis8hozUHpY1kicKmxtlJxU3BZDL
         6MoltZKRhcnS6eFajLSt9rdzrzdCjkjR2fFnVwKs3gqxkcyWVY+cJIzPZBRQXS81asgL
         B2sT09gaB9S4RvNe6pZdeqFJEGwiwkyN6p0PYBnsDRMyfFAWqgC62p3I29t+hyEKfCoe
         erLCtfPpTPxCpUlXSECJ6dsSachRnW+PMUQv0hh/zxPU4UVM0sO6Va2+CysyTbAt+2ZX
         lIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hDVC6oFEJUWOUfIvksIYO6a9xvgD06bvNYO8D43lxx0=;
        b=nLzjclnDEZv4v2jR+2EiU7+NJ7nIxflxMqxEt0qN/PUhszpys10CvynwVg0XNp+9bv
         e9iDaaWJoKx9r+0fNLeATE8JThaFrFMHAYFBG78wJbTBegny2rrj4lyVJ4ugwGt7koH0
         quXy1MvXXc1aSOKelobrBa2m5Lo6yMc/7gmLDnr05ezd5gDNGWzJdUX3EAXUKsrkKVnv
         lsYEPUzGLrwEIxfBgswO2fDPXJwHguUABRTAs06B35yZ5WoqbUJAgsKCdaRMqZtWVBaE
         rQ5/txDVLOSdGjLaAY4vFjoTBOXkwTs1c77//CwUB28vtTyZcgyKqQm3WSRSngF5FhTJ
         T0Gw==
X-Gm-Message-State: AOAM5301jGH4WMc5N6SAMGvecaGQTAUdkAxy4dZAKvdixr40ebkk59rp
	uUSp5EoFGw/ip32yIzz/MyDaQs6EUYXs5w==
X-Google-Smtp-Source: 
 ABdhPJxWvsv6vrLRdqbp1qMINGEt51UZdfMtKAEhFePVMGG5iazb1DOuS7wRb4390LQ3BpMb5pOSuw==
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr77143325qvb.5.1637353204909;
        Fri, 19 Nov 2021 12:20:04 -0800 (PST)
Received: from localhost.localdomain ([2607:fb91:401:c4d:225e:bb4a:477:9653])
        by smtp.gmail.com with ESMTPSA id h3sm439096qko.78.2021.11.19.12.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 12:20:04 -0800 (PST)
From: geoffhp@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] python3-cchardet: add BBCLASSEXTEND = "native nativesdk"
Date: Fri, 19 Nov 2021 12:19:25 -0800
Message-Id: <20211119201925.915650-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 20:20:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94066

From: Geoff Parker <geoffrey.parker@arthrex.com>

The python3-cchardet recipe that was introduced in honnister to supplant the
slower python3-chardet was missing support for building native and nativesdk
variants.

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
index ebd8130ab..8fa979776 100644
--- a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
 SRC_URI[sha256sum] = "c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf"
 
 inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


