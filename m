Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD5CC433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:30 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.16228.1647763709352042808
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z3+E6zJG;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id n2so10294694plf.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GsJrAzm8blDhWVsIl0awtLWUpWvFrxIMRA9wLrPCWLg=;
        b=Z3+E6zJGhVzRWDtc6uNUWLI277MK0MltS0m43GMqPrWyrYnh1CgqY9Xi7wPG4h+3Zr
         l/h6YL503ImLZbYUAditya3ZFHoNr9ed3NxyCDHxSNx0MQ4D1PV6CFUNywHOpz3Vrk22
         NguxtE4I2MuP7Dp/Tqv0QwMF8bkzqqNHCrJ1rh/dqUEvGdpyyYAY7Y6nW8Ddq/MsvZGw
         XYPBP/8xxsimeKLcxMla4/W+OEkp8XQZihCQkdiumHdjHKx/ToP4urPYfLfn2GN9Mu1o
         kXd1y32yINUHbZukuMBRJrWi0icC0Z8d9oRm3UAtlhLAGWK3uU+8h46EtiP3Fp/i+pGA
         KGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GsJrAzm8blDhWVsIl0awtLWUpWvFrxIMRA9wLrPCWLg=;
        b=FMVLReQJdQQFhxHrmh+DhRPrSAi5lMBZc7kU5+RAeVDmL0f2KWtEVdFMsV6ebw7E7u
         y8NyjIYojnqUIEgcRdbTDKcHl8J2HLRC9pFPN+n/m01ZYo03NjyCAj/vy4dJ8Bvv8JcR
         EuW5gMx0+xYyH+zX3s48KaIgjZc68qYCds/EtinhlJqeAYy6wH4CpeXg+9BAlns7K+JC
         AxlvxkYouthnM148ssWkiMvg1rEUTbY9JRTX29CE9rzvSfDZdwGAWXoLv4s+BdmxCwVy
         cZN+IFeQgwTQ4/k14hT9WLfXq/HxsGlRhj6hrJg8CDp16UHZDfDrJjdrN2WhxXo/FhjW
         qrzA==
X-Gm-Message-State: AOAM530qKS0reGCKo9Wb/XN+WDJsW4ypiS/VxbMkInQ6LhjOoQbSY7sq
	o+3CP5/uYY/HQVNl/VIaRQ7IY4h1eTN1Vw==
X-Google-Smtp-Source: 
 ABdhPJxdnCg3NTXv0EhIYSf8HzARcq4jnz38MWuWafpuCEbqKzi9RX5s2LM76qvhIrcAoGBAdgiBNA==
X-Received: by 2002:a17:90b:1811:b0:1bf:582e:443c with SMTP id
 lw17-20020a17090b181100b001bf582e443cmr30813081pjb.0.1647763708589;
        Sun, 20 Mar 2022 01:08:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/17] fsverity-utils: Define LIBDIR
Date: Sun, 20 Mar 2022 01:08:13 -0700
Message-Id: <20220320080815.825928-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96079

This helps make it platform independent since some platforms e.g. ppc64
uses lib64 for system libpaths

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
index 89e92d62f4..c95a5b2d32 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "openssl"
 
-EXTRA_OEMAKE:append = "PREFIX=${prefix} USE_SHARED_LIB=1"
+EXTRA_OEMAKE:append = "PREFIX=${prefix} LIBDIR=${libdir} USE_SHARED_LIB=1"
 # We want to statically link the binary to libfsverity on native Windows
 EXTRA_OEMAKE:remove:mingw32:class-nativesdk = "USE_SHARED_LIB=1"
 EXTRA_OEMAKE:remove:mingw32:class-native = "USE_SHARED_LIB=1"
-- 
2.35.1


