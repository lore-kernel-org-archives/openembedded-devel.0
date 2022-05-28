Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4CDC433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 22:55:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.19947.1653778532026008993
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 15:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iFdtaO9S;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id 202so7449673pfu.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 15:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NMeVboaVZIEOfuRXTZR1/uSvWTuqDr0rDCpfX7oezrg=;
        b=iFdtaO9SUnMaI0ErBknn0yusD9sWJbTOALCb6cMTmSae/Lw9vgK4XlArPIlrNOxNdx
         ocMhOku2bsisoTOlAz8ffAfV5+9MyPE8f3PnCUZOUkAOBBEiPQCjCcX1w3qZ8Z/ugJ5R
         ssnZPeWdancst06kNWeSpVsHvTFznD/YeSw1FkxRfJn7HJWhGifmaBGK8OkKBnulQND3
         P4U84DrxorHXYd4pxsvtk9gUS0BL3sDoeK9CantgXDGnZZp++q+OYh5ToUyXxwEVbGTR
         PWeVIG57HKQwbJmUZOaE40JYyo36AT4hrxwtmQ4RFqQcT2DOYCyWxqz21oH40LRwgf92
         3Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NMeVboaVZIEOfuRXTZR1/uSvWTuqDr0rDCpfX7oezrg=;
        b=VSiWgnX7naagwHstcrSBBkiM8zLClmozE2sAaEFqXzWkbT5aLs+WCfh5bC8iqsG4ep
         NI16C9b8ujDt1LjzVEjp22v4Y5w569NWJl5/Vxvpuc6ZqdbnswTClGYVQno+aVE9aKYr
         p9/Ij4+xxT1Pq32lXA41KWJ/RXrw5QHHlJSSrrSeYN3UPIbKZn0elEWAwIhgr15j8Sa8
         y7+fkI0zu1mdn+4b+NFu/l+VWs0M0R1guyb74G638ii4Nc0pyaXmISn9XBjRoXCNL7O6
         fK05A24cDHTe2Hcj2dlQEeEF5xaVlXXy9oMas+e/KV90duj6QDUSVlcjeFgqCPNUvPLH
         3Ubg==
X-Gm-Message-State: AOAM531y1XZEo/NLjqMoundJxu3BG0RjhqzI3yOELk4NeyreXAoYtmbf
	7KplFb1Up9ztEDjQXSDuvidjlzwKvTpS8Q==
X-Google-Smtp-Source: 
 ABdhPJxH16xh6gh+mnA80cvQlDR3gkHIDMiuKJgVmeqtiNurv1rm7Sg9+4NzEXpg7Aw3OdjtCfgWGQ==
X-Received: by 2002:a63:8048:0:b0:3fb:d725:977b with SMTP id
 j69-20020a638048000000b003fbd725977bmr3867591pgd.579.1653778531143;
        Sat, 28 May 2022 15:55:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::47b1])
        by smtp.gmail.com with ESMTPSA id
 w20-20020a170902a71400b0016232dbd01fsm6117818plq.292.2022.05.28.15.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 15:55:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] sdbus-c++: Link with libatomic for rv32
Date: Sat, 28 May 2022 15:55:27 -0700
Message-Id: <20220528225528.985788-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 May 2022 22:55:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97314

Fixes
libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
index 03d1356042..107dbc6c9d 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
@@ -32,6 +32,7 @@ S = "${WORKDIR}/git"
 # libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'
 LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 LDFLAGS:append:powerpc = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
 do_install:append() {
     if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
-- 
2.36.1


