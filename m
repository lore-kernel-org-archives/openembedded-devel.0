Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF236C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 13:33:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.22383.1651325601531414259
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 06:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nyLAjMW5;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id i1so3166252plg.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBzsWXcmL9rIurktYDExeleBFh4K+yukp1xaTKtEkpo=;
        b=nyLAjMW5LA0gNPECjIk2XedTj+nHlwLsJb1tXQwbjQwj23A+5cVDhP5ikYkDRMbi6P
         Sv7WXGK22cfIV45Sd0iqyOGkdb/SEAEnSYR1M/Qbet8xBOOSXYut/hNbs+LS/BVQjVDb
         CGQC5myJoZnk7bZEsy6J2tN9GcIdyxjbspsdxypW8tGKI9whmjQJW8lAm9jCB78e3iA9
         qeJKD759Qa6Prv0cD/O+Selzl/Pf+Ur9S9/WVCqrt8eLHc4FYyrsWoXhOdny28XnyreL
         ZXevoK1k444f1rnTIvRZQrtn1khUWtdERSJSLwCrqHIbiGAGimFqT8cYzZU61H5xU8fS
         AcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBzsWXcmL9rIurktYDExeleBFh4K+yukp1xaTKtEkpo=;
        b=qdQIfzpfRlFjV0GsljB3M2NDdhTRpAQxpwdva4Ig3yMvQFzcmHJuCeTCn7iz0pLLw8
         ZJ6ywTUfMzz4kLPkeTRoCn7ycM1aN9eWD2yAOygodrrtNl1+9fiw9l/nxnxkbiI0GudL
         nHfCB68cyAu7ZdouKxXiLPpmCmUGSRwa5A6iq1a1QeHv/nnfnz8FMZI1udIRZR9pU18I
         vX+GirznS+p5t90jgfj5ozZ34rcY0eTVtw4iUsCAvyvUGlHImNTu83P/4P2m/+YlpEuJ
         yB2Uq5+H6qFEJZaJwstYIIjLBRj6DQbncXw/alGSa1nJMBjPi6gG/RiQN2u+Ni5V8yrN
         6Gdw==
X-Gm-Message-State: AOAM532vbpOBDWbgSSQRHsqavOFDwRVEYw5Is1K7lRdWuyeDwf5hwRVL
	lu7vSyEmuA5IR/l1DkqKvNAR8fe3X6fbcw==
X-Google-Smtp-Source: 
 ABdhPJyIlflkv6VHTyllFfu+d0PJ3L3kJ+rY9VPauayqUrb2/f34ep2nF6jjAVsYYN+2d0dUmPN5pg==
X-Received: by 2002:a17:902:9b92:b0:158:9b65:a78 with SMTP id
 y18-20020a1709029b9200b001589b650a78mr3964462plp.53.1651325600760;
        Sat, 30 Apr 2022 06:33:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a170902e29300b0015e8d4eb231sm1464520plc.123.2022.04.30.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 06:33:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [mwta-networking][PATCH] ufw: Fix packaging errors found with ppc64
Date: Sat, 30 Apr 2022 06:33:18 -0700
Message-Id: <20220430133318.1052127-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 13:33:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96864

default baselib in ppc64 is lib64 which catches this latent issue

ERROR: ufw-0.36.1-r0 do_package: QA Issue: ufw: Files/directories were installed but not shipped in any package:
  /usr/lib/ufw
  /usr/lib/ufw/ufw-init
  /usr/lib/ufw/ufw-init-functions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index 6dca784bf4..b6a768e08a 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -63,7 +63,7 @@ INITSCRIPT_PARAMS = "defaults"
 FILES:${PN} += " \
                 ${sbindir}/* \
                 ${datadir}/ufw/* \
-                /lib/ufw/* \
+                ${nonarch_base_libdir}/ufw/* \
                 ${sysconfdir}/ufw/* \
                 ${sysconfdir}/default/ufw \
 "
-- 
2.36.0


