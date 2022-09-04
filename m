Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C11ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.11281.1662276883227394393
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NQUE2vb1;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id jm11so5720427plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OgeFfTDKN73KOYjD3pZ3H67lW/gZUZ/Jnfi8xZugJNw=;
        b=NQUE2vb1Op3on2IFO2vyxoGV7Jc1yNn7jLBaUFrp9QFsx58CmC+6Eu8XBP17CzCpLP
         CX474mNW0PgvskuFk4THVyfp6g924JVG0v9tWhJtXS2dBOm+W8qg9uTESPTf05dbRkIL
         KjAeO1z4UhBOgshfdRVQLWG7GPw1Yc6IRY+DNhqyyA1iqWOH/NhLt4U9vkkMIAASZebk
         u8KjvWVdmZH+wB3tOtJGmeGPW3f7KiOQzFFIwcMAd2gvMYczPa+JWV8vyXwmWoEg4wyG
         eZasugiCzG0aJWQoML9I/Te3mfKawdGQRdjLr65JZzOZirN3T/NEmpOf+afNjvGKC8K5
         wJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OgeFfTDKN73KOYjD3pZ3H67lW/gZUZ/Jnfi8xZugJNw=;
        b=UUvNlj4pwnWEVlM/j9x/b0Frj+aFZvjQlZ5TmwaKS9N0ng1gD7+Nmv3fZVU99Q4mjf
         51rXqIvViSjGOobB+h/l8qTnpLdlhevxedE48Ub/XuBsqXMKrrljgAB2B9rFOkhRSeW8
         H31DmlEqzv5xons1GgxWJ7XdvF06ryGeyH5GdOedzXRXLWYwe1HiabWlhGQx1Imo9ahb
         ekGicIBl8R0S3EA9sjrC7jbebQ05NoohPQqedCysMgu0qmzpyeDZH6M0GMwLl7B1nwBl
         9WTy8UpCaZZr5I8nubLkkAvRjOiG0CaDBt1mmH4BJX0p2cRSQcpBm5oYe+8TWQVACplw
         FEGA==
X-Gm-Message-State: ACgBeo0WYT+qB3TuB6foKSTcb2qF++eoaMM2oypzs4lV2mCw30LC3t7D
	mq/knHiYt9sjPhdE3YOgaHJfFM5gKzJ56w==
X-Google-Smtp-Source: 
 AA6agR42F8OZEZHTAJitjFLYN/YxveS9AWmLh8M7YRgL+3nSJpYAZlZGhGD9vqYl08hdyM52MoSP3g==
X-Received: by 2002:a17:90a:e58a:b0:1e2:fe75:dd5f with SMTP id
 g10-20020a17090ae58a00b001e2fe75dd5fmr13715299pjz.138.1662276882450;
        Sun, 04 Sep 2022 00:34:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 21/63] gensio: Fix AC_CHECK_LIB for libwrap
Date: Sun,  4 Sep 2022 00:33:35 -0700
Message-Id: <20220904073417.3251865-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98615

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-request_init-API-when-probing-fo.patch | 31 +++++++++++++++++++
 .../gensio/gensio_2.5.2.bb                    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/gensio/files/0001-configure-Check-for-request_init-API-when-probing-fo.patch

diff --git a/meta-oe/recipes-connectivity/gensio/files/0001-configure-Check-for-request_init-API-when-probing-fo.patch b/meta-oe/recipes-connectivity/gensio/files/0001-configure-Check-for-request_init-API-when-probing-fo.patch
new file mode 100644
index 0000000000..3b4caa2215
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gensio/files/0001-configure-Check-for-request_init-API-when-probing-fo.patch
@@ -0,0 +1,31 @@
+From f56e59712d8708c74a4cf66d24b5703fc16b22ae Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 11:31:48 -0700
+Subject: [PATCH] configure: Check for request_init API when probing for
+ libwrap
+
+checking for main() is not right check, since this function is not part
+of libwrap but the app. Newer autocof and toolchain may fail
+
+Upstream-Status: Submitted [https://github.com/cminyard/gensio/pull/48]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 90cfcb6b..1c06d918 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -109,7 +109,7 @@ AC_ARG_WITH(tcp-wrappers,
+ if test "$tcp_wrappers" != "no"
+ then
+   AC_CHECK_HEADERS([tcpd.h])
+-  AC_CHECK_LIB(wrap,main)
++  AC_CHECK_LIB(wrap,request_init)
+ fi
+ 
+ AC_ARG_ENABLE([doc],
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
index 9de21209ca..d6b5f1987e 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
@@ -9,6 +9,7 @@ SRCREV = "b6cd354afe6d5f63bc859c94fd3a455a3cdf0449"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master \
            file://0001-tools-gensiot-Fix-build-with-musl.patch \
+           file://0001-configure-Check-for-request_init-API-when-probing-fo.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.37.3


