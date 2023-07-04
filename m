Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DB4EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 22:03:42 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.4818.1688508214967809456
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 15:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PG9BWfow;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6686a05bc66so3246322b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688508214; x=1691100214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9uMEEpxxVl9yjjnVYpqdppx5GGgSsmLUWlZFIo5rL4=;
        b=PG9BWfow9klN2E6DZ+UH49YNcl4osBL782otfT3fHYs2MhGjceLJzpCED+EGsLSvPW
         QuLJMhvZsNnGip4GxtsHUNNEAhcV8gTf8Afi+Qdd3pr/DkmVHBkuCkqzq4B1kVyidTEd
         lYR39NaN4SjLTWDuGjhg0wTGot17NbABDkmXoqrWKdP79taGtUFshPN5wU2cgekfViG7
         PW1kZztULTkwB1uM6Nlc3iuIqh9UQfpk7ql5PZg/gbNHe7+0HADo3bC5imKsNOFLGVTh
         NfGoMD4RZr9sK9xuhvmF+uifOYH3RbSUlcLSV1i3tkPlRP0Sbognfymenkl8t16mInAC
         /RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688508214; x=1691100214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9uMEEpxxVl9yjjnVYpqdppx5GGgSsmLUWlZFIo5rL4=;
        b=SNjs6mixFoAHTAat8QafoGm7bUBj92CtrEjXE8V2UBX4QPWbAJg3Hgs870n1Hdn36R
         9uWlCGdORy6xxCTD9TaXv+93LdzgyXy28vCu8NLnpQUL606rNdL1mBoPH7jb37VwOlZc
         ZMarWTsXN+vOSTMFPsPtMP8RnjTxMJOPlEXIVW6BVapCMu/84E68P5COXfO2I4ZIssw2
         2EV076TIF9hwhg8/ti1A1qElIR9D2o77G7ZXOY2y/esycwdL4s0YgypB1/KoUcFI5+WK
         DZmPNsqU+TyRPb2EJDhDMVyIXJMfAsgwAlAWGfqK10vOklLEk3fDIf/qj5mYV1xtbidP
         wnsQ==
X-Gm-Message-State: ABy/qLbCbpcaXxJPvWoTMSL0dlye7qoeL8pflHfq1RhXzk7xtUvmIGLS
	cjiYMiHE693e8Xm2oKfE49L/VRKDCD0=
X-Google-Smtp-Source: APBJJlH6NkCxGPtCaNACHa35o087h+vBZWezCiZkrflNi2/nVnb15KgNU75pWpOj85HBQIuy1E4hBQ==
X-Received: by 2002:a05:6a00:148b:b0:65d:d5cd:6f17 with SMTP id v11-20020a056a00148b00b0065dd5cd6f17mr15710233pfu.24.1688508213933;
        Tue, 04 Jul 2023 15:03:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::e2fe])
        by smtp.gmail.com with ESMTPSA id s21-20020a62e715000000b0067b643b814csm12419850pfh.6.2023.07.04.15.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 15:03:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] libcoap: Build linker symbol file explicitly
Date: Tue,  4 Jul 2023 15:03:15 -0700
Message-ID: <20230704220315.1958265-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704220315.1958265-1-raj.khem@gmail.com>
References: <20230704220315.1958265-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 22:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103664

Since we autoreconf, it should be better to build the linker map file
too, which requires ctags during build. This is otherwise flagged as
error by lld linker where we specify a linker symbol file on cmdline
but the file is not there.

Fixes
| libtool:   error: symbol file './libcoap-3.sym' does not exist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb
index 0fc342560a..efea3fab74 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb
@@ -16,6 +16,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig ptest
 
+DEPENDS += "ctags-native"
+
 PACKAGECONFIG ?= "\
     async openssl tcp \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
@@ -42,6 +44,10 @@ python () {
 
 export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
 
+do_compile:prepend() {
+    oe_runmake update-map-file
+}
+
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}
 	install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
-- 
2.41.0


