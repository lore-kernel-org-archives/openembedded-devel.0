Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734E4C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.2694.1633977716687922063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bd+Hex57;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id y3so26057122wrl.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tMDJ1FNHBl4jqLzX8fFE2KLLVEVa3Ubt7MXWQzXZ8JM=;
        b=Bd+Hex57zaUaI7bl367m4gwGdrjDB8oMopiUr+WA1mRx2Jz+SWGNa+bCNEfzbII1Dv
         h8U9Jlchl3Nh4H30RZFOFiEzp6G2o4lthC42l1HOSd7OgPBO31E3dQTCv7aKIXzcWF9m
         EuBWkWStUGRjY0Xps/wV1K1dVQ393lXce6hU42CTDne9yXty4FqbYJi2n0GDeyxnNaDQ
         MlyLfh42SszwWy1fV1bviD6/D8LQ2CE4ZIan9brGvip7R1DY5bj9XniY8ngZ3CalDh4h
         ip2GmRtB+1iO51DQC7of/+u85i/C7SgIvJUxH/OiBYt5ECqPzuc0e6SPKdV39xpBXNT5
         1ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tMDJ1FNHBl4jqLzX8fFE2KLLVEVa3Ubt7MXWQzXZ8JM=;
        b=plzkSHgm28UK5sRpy7fBtg3bRYrFVK1pbFCC8ovNRvitzXurD/ct6dq2o0pnMOIdXx
         2LlylX8goZrzNWcaZqmuYjTU5ksnnV/epKd8j3U4BRw6WYrCA++LDnF2ejd1kM7nPWSz
         5W0xBw82MapwYV9jJozuBRuxJ89Wzxli6m1Ijpz7IpeiEq6xKyERMJBkU+ChkYEiqRdU
         IcLay04JbrRRRKqvZQBOCOS707h8/bOlukcfV0P2n9EgNrxIDGUvCaPXH9G14zMxg2AY
         ifLqMbrx6awxEBlbe4ytYf7slz41Q3fzn0DWRAmoiQxG7qaMWy7ITUHdXW5wrdeTJyPN
         mL0A==
X-Gm-Message-State: AOAM531CyBN0es/eOJ7oXFNEuA3oHnUYCeFMaprEoxywT/4wsNQ+sKDT
	zB4Z1jVSf90k6Q6mFiIwzZof/D4PJIxNeA==
X-Google-Smtp-Source: 
 ABdhPJy7xbPfaqfQzskBpS6BLQV2f7Gb4jJE2lvIYcSIxk7lqXF2+aDSa8voNYG9wdoCVQMuuehUpA==
X-Received: by 2002:a05:600c:1c1b:: with SMTP id
 j27mr666656wms.1.1633977715275;
        Mon, 11 Oct 2021 11:41:55 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/24] pkcs11-helper: backport a openssl 3.x patch
Date: Mon, 11 Oct 2021 20:41:28 +0200
Message-Id: <20211011184140.653609-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93226

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...move-RSA_SSLV23_PADDING-constant-usa.patch | 27 +++++++++++++++++++
 .../pkcs11-helper/pkcs11-helper_1.27.bb       |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch
new file mode 100644
index 000000000..f2baae914
--- /dev/null
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch
@@ -0,0 +1,27 @@
+From 5b9a8da964ee0b998955cd986000cfa27cfa698d Mon Sep 17 00:00:00 2001
+From: Alon Bar-Lev <alon.barlev@gmail.com>
+Date: Wed, 4 Aug 2021 19:02:34 +0300
+Subject: [PATCH] build: openssl: remove RSA_SSLV23_PADDING constant usage
+
+Due to openssl-3 compatibility, thanks to t0b3
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/pkcs11h-openssl.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/lib/pkcs11h-openssl.c b/lib/pkcs11h-openssl.c
+index 9c9b2cd..85c8193 100644
+--- a/lib/pkcs11h-openssl.c
++++ b/lib/pkcs11h-openssl.c
+@@ -474,9 +474,6 @@ __pkcs11h_openssl_rsa_dec (
+ 		case RSA_PKCS1_OAEP_PADDING:
+ 			mech = CKM_RSA_PKCS_OAEP;
+ 		break;
+-		case RSA_SSLV23_PADDING:
+-			rv = CKR_MECHANISM_INVALID;
+-		break;
+ 		case RSA_NO_PADDING:
+ 			mech = CKM_RSA_X_509;
+ 		break;
diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
index a7365f193..944f49fc7 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
@@ -15,7 +15,9 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=8a71d0475d08eee76d8b6d0c6dbec543 \
     file://COPYING.BSD;md5=66b7a37c3c10483c1fd86007726104d7 \
 "
-SRC_URI = "git://github.com/OpenSC/${BPN}.git"
+SRC_URI = "git://github.com/OpenSC/${BPN}.git \
+           file://0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch \
+           "
 
 S = "${WORKDIR}/git"
 # v1.27
-- 
2.20.1


