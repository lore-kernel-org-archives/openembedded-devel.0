Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A816C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:32:32 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.5529.1692930742507465445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FMUUnNL1;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-44d4c3fa5beso226923137.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 19:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692930741; x=1693535541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3yJXd9uT8moab9/E/x/zLRncLMqnr68sdgrL1YmedQ=;
        b=FMUUnNL1NKh+vEs+KS8kZAliPwOc0GxG13mOg21d0dm9dmEE+spM6DtDnLjeoz3iqE
         lW0Lun/MRP1Yo/UMjGx0beFLeJfBrV/C7RdSlUnbgWmLCFQ2bbh9Va1txzL4JnQ9D6Np
         /G8GmAVFMyT78fJ6gg80/SxyxT0G0MxY083Id7ybyz2ZH+6+y8ZBqNQ44RUM+rWrUL8T
         3mB5r72O99QLdew7AaBzvDn9dURR8yMW1oR2VGunDm9q6hpm0lBcMR2CeFpobhr5HC2j
         OJTwaJOlnwKZbTKhq/VtuRmpVDD43c8v7sE2i4zuhe9zU0xCgFyUHj2kLz48wKpOHP7R
         CNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692930741; x=1693535541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3yJXd9uT8moab9/E/x/zLRncLMqnr68sdgrL1YmedQ=;
        b=TEi/U7GnMVV8137I1AWUCoIMseEeMJPaqXidqGb5vxytkZNg4fNWOatP7I+qy57cYV
         tXrRpH2LX79wJDGhD95ww8/r+cmiOY6MLt0QPvCssQVVSx9czxg1vfZ79wenXNjZaSNS
         XSbeDUpI03+xjMC0bNvD3wHP0nW3TWs8CFvsKOEnRWVo2vfBQ1A+PwT3p33sTBKUu727
         Eu8PXUZWjUoA4lqRpB1anOZW/mVcd2PzZxjfnULR3L5UiCCoeaSWWhkMW1GXHMlgKHu8
         Qs65GxnMJqiko6DhIyE3QrRAN1Hd7GfZaTz+nCfaeEbzqOfUPvT6BFA8+E+fHEcNFnlJ
         Zsvw==
X-Gm-Message-State: AOJu0YwdFlyK4Opbo9KY5gahHzD91eijsV8HDyhGPWSym3bqKGy/xBMn
	P3s2aUdjKDLUwA5o9OF9OLLamsM0+ep1wg==
X-Google-Smtp-Source: AGHT+IEc+OAXlcitZoNAapQu2q0xYu4UYCQ52o3CF6uZpBhnLq/EH2v6M9Rn5AqIXQVluICCmWKfJw==
X-Received: by 2002:a67:ffd6:0:b0:44e:8ae0:3df with SMTP id w22-20020a67ffd6000000b0044e8ae003dfmr5757967vsq.3.1692930741268;
        Thu, 24 Aug 2023 19:32:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090a890300b002682392506bsm416031pjn.50.2023.08.24.19.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:32:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] libio-socket-ssl-perl: Upgrade to 2.083
Date: Thu, 24 Aug 2023 19:32:18 -0700
Message-ID: <20230825023218.3779-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 02:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104591

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ket-ssl-perl_2.078.bb => libio-socket-ssl-perl_2.083.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.078.bb => libio-socket-ssl-perl_2.083.bb} (90%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
similarity index 90%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
index ff2559b8a7..8ae5c0e68d 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4cf83737a72b0970948b494bc9ddab7f725420a0ca0152d25c7e48ef8fa2b6a1"
+SRC_URI[sha256sum] = "904ef28765440a97d8a9a0df597f8c3d7f3cb0a053d1b082c10bed03bc802069"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
@@ -33,7 +33,7 @@ do_install:append () {
     cp ${S}/Changes ${D}${docdir}/${PN}/
     cp ${S}/README ${D}${docdir}/${PN}/
     cp -pRP ${S}/docs ${D}${docdir}/${PN}/
-    cp -pRP ${S}/certs ${D}${docdir}/${PN}/
+    cp -pRP ${S}/t/certs ${D}${docdir}/${PN}/
     cp -pRP ${S}/example ${D}${docdir}/${PN}/
 }
 
@@ -50,7 +50,7 @@ RDEPENDS:${PN}-ptest += "\
 "
 
 do_install_ptest:append () {
-    cp -r ${B}/certs ${D}${PTEST_PATH}
+    cp -r ${B}/t/certs ${D}${PTEST_PATH}
 }
 
 BBCLASSEXTEND = "native"
-- 
2.42.0


