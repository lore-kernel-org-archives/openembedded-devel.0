Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AE5ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 08:30:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9777.1662021038107916412
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 01:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bNdaoqk+;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id e13so20397616wrm.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 01:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=xp+pqk4XxFpIwv+4MqOXjFHy7CrtjzyFVgMHDuVjf0M=;
        b=bNdaoqk+TBY8Ya8fpdfviQQb7d9OLA/OdLEymAtJYoiPw6L8Emi+rLPQ0lK1aT82n3
         hslJwB13OLqXTy8ZaHbjbV4MUn7nvLCPjIaZ4RoXyb5/nCTIFVrKmuOK/BAe5Zop0cC7
         77Qt/4U6cWvdmzQV5sAbGs2lk01q9BN6FelXSAWT3G48vVNbPLk9R1e1wn9nN4vrB95W
         iIKsDQKLR04yqQGL0+XDca2445RhABbW1cAMf3MrerON45k3p2mrYZGqnYDiSsUn45SL
         W4HS1THr4mgzUay6vQlrw6Ph8f2t2hisM6mjsSWwxVyjKXEg7fpJvn2/dBwiBytB7b+t
         qLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=xp+pqk4XxFpIwv+4MqOXjFHy7CrtjzyFVgMHDuVjf0M=;
        b=V2uKrWrwID8vnmHuQOEaeren9iBeUvISfGXDV7SzHH7HPdeS3pc+aEVzLgCSPnLGnX
         0K43+mo5OCLSSvICz+sDIF1LDSBaNJm9d9aX4JJsYMbRROLRLHXWHBrEJlfcONX5nU7D
         yGtL6ErVQcXoa5IlScatFEREpHfQYRjnO3fwwm+U+v0FsuCx6E9ajozjRwxpBIY9UYXs
         JFXfzhuvtkUwVuJL79i8NDgjiQad9oaaRuttW4zgphYNt8hGfeZALiZaTZ/aKHmI/xHL
         sliuXW7mAn9NOXrs548ZHXg/n0Ddyu2sVrG0isEJzarfo90KC4sm9MrT2qDdpPUiOG8G
         Ri4w==
X-Gm-Message-State: ACgBeo2hIR8bSHh8H4mWu+12QUdBPrBcgn2I428p2AxWfqmoY3uU6Ptp
	b70v62RPn7fwVoRbyvYxtl2kTFO58FM=
X-Google-Smtp-Source: 
 AA6agR47wYbJTCkRDlsOr78f3OYnGFp3IDOJXZzvAuh0u0WqcmdtQcb8KnJZXD1LHGDdT8XQC1/QfA==
X-Received: by 2002:a05:6000:1888:b0:222:ca41:dc26 with SMTP id
 a8-20020a056000188800b00222ca41dc26mr13199967wri.442.1662021036288;
        Thu, 01 Sep 2022 01:30:36 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 u1-20020a5d6ac1000000b00225250f2d1bsm14279824wrw.94.2022.09.01.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 01:30:35 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] libcoap: Fix gnutls/openssl/mbedtls
 PACKAGECONFIG conflicts
Date: Thu,  1 Sep 2022 09:30:31 +0100
Message-Id: <20220901083031.6087-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 08:30:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98580

These were missing a comma so were being added as RRECOMMENDS.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
index aba81d126a67..4b467d212f03 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
@@ -23,10 +23,10 @@ PACKAGECONFIG ?= "\
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
 "
 PACKAGECONFIG[async] = "--enable-async,--disable-async"
-PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,openssl mbedtls"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,,openssl mbedtls"
 PACKAGECONFIG[manpages] = "--enable-documentation --enable-doxygen --enable-manpages,--disable-documentation,asciidoc-native doxygen-native graphviz-native"
-PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,,gnutls openssl"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,,gnutls mbedtls"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,,,gnutls openssl"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,,,gnutls mbedtls"
 PACKAGECONFIG[small-stack] = "--enable-small-stack,--disable-small-stack"
 PACKAGECONFIG[tcp] = "--enable-tcp,--disable-tcp"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,cunit"
-- 
2.35.1


