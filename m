Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49805C54737
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2130.1674324096164790802
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QsfIlCaV;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id k18so7976908pll.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6Mmq6W8+GK6gUr+dGQZZfJVge37nr9fsPuouuFbQsM=;
        b=QsfIlCaV4NO5htQf8/hQU2iUFRgJ8H8ETLJmNL/p9zY+6ie9wYEPNHK/jFrl77S8px
         6wUuK4bFHmN3QUtw8Y5sTyqvDBfXkntHRZADJTSCV+h488Vqj/r+bKRzy+QA78nyGFvO
         IWKofOx+5d1/Q0661vIZfsD/z6JBuVumLFuyMMKZLzC/6GBj7LTxSUhjQDWFE/FDtXkO
         YfC2llXTIOBc6YCPJs0/krVAz0/v3qYR2tzkKnith/0af3xzxIue9YAiihWBsSbmubvq
         c6+lSeAe3Hkl2PDPgFNeIGMq9Mcj/BMPSRgJzyfUxf+B8tf/JTiDUTl8d35tpMHMf+UC
         bp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6Mmq6W8+GK6gUr+dGQZZfJVge37nr9fsPuouuFbQsM=;
        b=2zNLISi0nDxPhPYLbNKf63B71KTn8C/+9HXAGtOYHBwaICtDw5tFSC1uMh08J4xnPo
         8IPSvgH2LDb86RynmiXsSLiBPWGEu1g5OXfFMyHrc+diOr5hSILvLeOr5qzMr0zWMwrv
         c1GksoQiU3SHJ2vdFerCGdjMJsPEFygBusio2rlYwLvTEm+CkTae/roultaZkqImpUg6
         hIbgmpAkX/42x9u5GSWB7W/YNOELevLhx+H5KS8xEDPtNK544ApRyHzEOqtrGtWDMQ3U
         ezfvUv540eWRUZTRJawwVB1bzSIjmMk79yBk7Q0c8iJuUucRC4oWLKaxSu85TSY6N1Q+
         IS1Q==
X-Gm-Message-State: AFqh2kqdsIcd163l8wRXNTMKScN5ouFwPCj4JMxVYo+Ym01ubUTFHJEg
	qh3FcX0cnLhrOJNoIjPR99w06cKgf4E5ng==
X-Google-Smtp-Source: AMrXdXvngke1BcTC4jL14SXiPE6leSBMZItIDNSqe5cUHjVemHnSehsVt5NSu7toImJtibWuvknSaA==
X-Received: by 2002:a17:90a:ba11:b0:223:de00:f5ab with SMTP id s17-20020a17090aba1100b00223de00f5abmr19569635pjr.28.1674324095302;
        Sat, 21 Jan 2023 10:01:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/30] ace: Upgrade to 6.5.19
Date: Sat, 21 Jan 2023 10:01:05 -0800
Message-Id: <20230121180121.1229895-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100681

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ace/{ace_6.5.12.bb => ace_6.5.19.bb}                   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/ace/{ace_6.5.12.bb => ace_6.5.19.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.12.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/ace/ace_6.5.12.bb
rename to meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
index 6c68aede03..af4f2c54bb 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.12.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
@@ -7,12 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"
 
 DEPENDS += "openssl gperf-native"
 
-SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_12/ACE-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_19/ACE-${PV}.tar.bz2 \
            file://ace_config.patch \
            file://no_sysctl.patch \
           "
-
-SRC_URI[sha256sum] = "ccd94fa45df1e8bb1c901d02c0a64c1626497e5eeda2f057fcf0a1578dae2148"
+SRC_URI[sha256sum] = "739be290a38229aaa5b5150e6ea55ce427e80970f0ace4c5040ac46644526f41"
 
 COMPATIBLE_HOST:libc-musl = "null"
 
@@ -23,7 +22,7 @@ export ACE_ROOT="${WORKDIR}/ACE_wrappers"
 inherit pkgconfig
 
 CXXFLAGS:append = " -fpermissive -Wnodeprecated-declarations"
-CXX:append = " -ffile-prefix-map=${WORKDIR}= -fdebug-prefix-map=${WORKDIR}= "
+CXX:append = " -std=gnu++14 -ffile-prefix-map=${WORKDIR}= -fdebug-prefix-map=${WORKDIR}= "
 EXTRA_OEMAKE += "INSTALL_LIB=${baselib}"
 
 do_install() {
-- 
2.39.1


