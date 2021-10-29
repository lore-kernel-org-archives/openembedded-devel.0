Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A61FC433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 09:42:59 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.3301.1635500578149528283
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=lMN3oIDm;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.179, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f179.google.com with SMTP id k13so15874570ljj.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQ69nfhAmbo0CclxPzf+ZtCpl01MDMbxblw+Vd7N1VU=;
        b=lMN3oIDm4a3UVA1LaQRPYJs4AXvHN/G1q/bHjweYyslMAXazA4lol3RWDp+jz0OdRQ
         yyPulBg4y7a7Mdwjkr1vjEnXVDpByXk0ZuexjDRr+CYQV0etFMpC9nicaMtBySy3sjGp
         cI31jKmrlRwkjMv+TODwTXEo7IUn2thgwjIMMSpiGf7mxPYTEfOwBkzsC96yNBasQcFz
         +Oom+osuL1l2NOlRqzhExYjMnoYuUDiY745t1jxBaRPIOndT8R8JYOnjwxXWs+Khay4F
         DIsiM02oLeuTZa27Njqo3v0DTENtWkIHsiffheIaUNg+r8YK2KX4Yo4sPPJVp2/nic5d
         pdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQ69nfhAmbo0CclxPzf+ZtCpl01MDMbxblw+Vd7N1VU=;
        b=Pe1gIAPI73k76ch2x1Y8HWdkfGsiroyXUFq2WM9IiWv2QObnaRGU6kRHbh/uMCB4nk
         KX/bwN6i8p98HorlGVOOKjMPddfZakrNcL1R0GiYRcWJiacWbXnKcrZ0mwhYMxqMH22C
         2zUu5AxBx5fOKKEFHc8dd6L+LhUBBWUFWiMMdNXYYn4vmWi4Dlc7Le9MTpA3aeKXCTOg
         LksHIUE8i8pbYdQAqAL07DLinXQl5iupNTjJ+9EMXCs97uGahev0AglNICSIV7uq48wj
         /P1ttb0zYobIExMwkX/PEwIf48d61Y9iYI4Hd3FTnEUr4AgRU/3nKJ/dQnBoIzwHIPXw
         q5/w==
X-Gm-Message-State: AOAM5306gPJVNqRGTTSq0FMbXvewR0RWVm/ln3NCuh9pd5soINwo0a4n
	n4lx6vnD/n8EGDkcKwMR5JwGtnyRZKnUIhxr
X-Google-Smtp-Source: 
 ABdhPJzJVnN1ue9Cf+jm9Z8Q4TXQ8ZQeL2AoDkb1hWhwIFt5q0ucW80++D9RZ21LKTz+wxvBIFSjhw==
X-Received: by 2002:a05:651c:33a:: with SMTP id
 b26mr10891380ljp.353.1635500576211;
        Fri, 29 Oct 2021 02:42:56 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t12sm559342lfc.55.2021.10.29.02.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 02:42:55 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-google-api-core: update to 2.2.0
Date: Fri, 29 Oct 2021 11:42:53 +0200
Message-Id: <20211029094253.1415162-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 09:42:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93649

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...oogle-api-core_2.1.1.bb => python3-google-api-core_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.1.1.bb => python3-google-api-core_2.2.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb
index 34489af72..d6293613b 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "646d9399c3c478fe475cfe523e84572ab31a340814ea977fb2774eca5a6549a2"
+SRC_URI[sha256sum] = "dca67b5e369a5127ec00c8ea02de48517e39c1aad882e2e6d85da8050520cab6"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


