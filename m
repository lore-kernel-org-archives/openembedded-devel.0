Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441AFECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.11491.1662276873090317395
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mZfpVrsc;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 u9-20020a17090a1f0900b001fde6477464so9385368pja.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HJdQuOfXftnj2UrWXAu4ujg0TA+p20m6Pl+wEGwgJOA=;
        b=mZfpVrsccA8WL/2Xs2fqvq2Z9H6TOiinwwyDGtVKnBuUV1pNU9Q6xyCuGOUGUuDaLD
         22UxXPPMn7qsNBXKjJDKUK3h+b5UeiDHd6L9hakb1ZQQ2q8Xdgb7UJvCDO3uqzZAsnGs
         l5aXIHoJ9SzNUVKK8h/F/eAOWJtZSEoBzLD2tcBWuvOYs4cAU38Cr8Dw+RsVuI53/Paz
         cp3xSowwOyn0c4U7D7xkBgIy9B0dPT/5hFo3wzPwaOmmOtwU7YiLVNr5eZiNkLhmbH4J
         hUIk9lWpyHaGDTyLwUsvKmkMFJeBEfOW5kdcAHLGGhtz9bZhQ6V5FEC6qNL2aBtQeihM
         DSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HJdQuOfXftnj2UrWXAu4ujg0TA+p20m6Pl+wEGwgJOA=;
        b=BCFQQ8twN5h0G9RVZqLnv67DypZw8rvvQlfp7vGOCjvFV7k5bRIx4lhx25dB46wbxT
         l+zgyKkUCFX651mxy+5X1N1+KRs1+iMkcrOVdKYl2slEGkj21T2F0B4hOLLrx8DWhaJr
         Mry5yDymBhjzzG7yMvZ7kpcNhSjWgmZO/o3HrliTUrr8tUuRAAL2o5iLSX2+DpaFzFJG
         +Zpbucit4FvN+RCBLB+XLFvBXkPhIBPl2+i7CFdAIUSizvFveN4Tw+TN9AC7v4gU3/JR
         L4LL8rB8T6wXOV0LVtiadll6WHoj5XX6EAeRIS4gd1MUObsInajX5GjKq5GAy/3tY86V
         X9Rg==
X-Gm-Message-State: ACgBeo1kqHaVFSavhbzrf23i02gvIWXQXVlJvbSx2GFEArnPaIA8rTcv
	Ozt4dPNMk2uc9UZB4LzxzQ4fuPquQ2vmlg==
X-Google-Smtp-Source: 
 AA6agR5tcA9jK2vhVpULTAAYXHBSEmRBX8xnCIb+4rcjngH9i/0H29X+yKCv1t0+jF6cSU+EbLjvVg==
X-Received: by 2002:a17:90b:4aca:b0:1fe:686:fbf3 with SMTP id
 mh10-20020a17090b4aca00b001fe0686fbf3mr13373952pjb.174.1662276872294;
        Sun, 04 Sep 2022 00:34:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/63] wifi-test-suite: Fix build with clang
Date: Sun,  4 Sep 2022 00:33:25 -0700
Message-Id: <20220904073417.3251865-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98605

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...roc-Store-return-value-into-location.patch | 32 +++++++++++++++++++
 ...uite_git.bb => wifi-test-suite_10.10.1.bb} |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0001-wfa_cmdproc-Store-return-value-into-location.patch
 rename meta-oe/recipes-connectivity/wifi-test-suite/{wifi-test-suite_git.bb => wifi-test-suite_10.10.1.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-wfa_cmdproc-Store-return-value-into-location.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-wfa_cmdproc-Store-return-value-into-location.patch
new file mode 100644
index 0000000000..074f0fe7bb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-wfa_cmdproc-Store-return-value-into-location.patch
@@ -0,0 +1,32 @@
+From 2b7d6cf62296ff4e25e5ad909aa39a257bf9ff78 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 19:37:35 -0700
+Subject: [PATCH] wfa_cmdproc: Store return value into location
+
+Fixes
+| wfa_cmdproc.c:100:20: error: incompatible integer to pointer conversion assigning to 'int *' from 'int' [-Wint-conversion]
+|         paramValue = atoi(str);
+|                    ^ ~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/57]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/wfa_cmdproc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/wfa_cmdproc.c b/lib/wfa_cmdproc.c
+index 9f5fd16..49a3f16 100644
+--- a/lib/wfa_cmdproc.c
++++ b/lib/wfa_cmdproc.c
+@@ -97,7 +97,7 @@ int getParamValueInt(char *pcmdStr, char *pParam, int *paramValue)
+     if(strcasecmp(pcmdStr, pParam) == 0)
+     {
+         str = strtok_r(NULL, ",", &pcmdStr);
+-        paramValue = atoi(str);
++        *paramValue = atoi(str);
+         return 0;
+     }
+     return -1;
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
rename to meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
index 490f8324b4..eda01ca388 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
@@ -8,13 +8,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
 SECTION = "test"
 
 S = "${WORKDIR}/git"
-SRCREV = "2da947374c8324f88a0e2155aeba4cf75464b0d8"
+SRCREV = "12e85fbeca8ca21a632d18e55089a8a7606d64aa"
 SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;branch=master;protocol=https \
 	file://0001-Use-toolchain-from-environment-variables.patch \
 	file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
 	file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch \
 	file://0004-run-ranlib-per-library-and-use-AR.patch \
         file://fno-common.patch \
+        file://0001-wfa_cmdproc-Store-return-value-into-location.patch \
 "
 
 # to avoid host path QA error
-- 
2.37.3


