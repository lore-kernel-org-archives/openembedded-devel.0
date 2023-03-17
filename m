Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C934EC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 10:40:07 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.16139.1679049598584009747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Mar 2023 03:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f2UFoKV7;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id ja10so4867690plb.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679049598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwKeDbteExwYSaPPfJR0Uczz9n5ovVDszrqKVr16Fr4=;
        b=f2UFoKV7T6sCtXs9O03nkCyxEqJwMxES1tokJyJ3PHVtl9d3QkSljK7l4l+re81sXx
         rkhcCoE09XUMxxlAuXwwLFyHDiipmYUL9+CE7q/OvlkPDPRsu/WLSj89tM4cUT/ZhuOa
         6KeHzvcWHIkuWfJF2wPXbU3R/ToblSxPz/a8hcL+ut/ZLJEs+aTBDOsBhmgSDxHxB8rs
         sLWIHP+mYL2CCxg51ifRVYCkJ07dYifj5VtM7/ANfstDEN4mwZMl3hezgkPo5J914cPI
         0m0bpiRtCvbG6yapmIYLkojGvdCfhy19tBXw3nTLO+8Lg2h3x2e80ntl8dexPW45RYuh
         a18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679049598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwKeDbteExwYSaPPfJR0Uczz9n5ovVDszrqKVr16Fr4=;
        b=slPo99iU2B6c6f8FblybnLDc/WwsUpchNY4adc21MFTEsuxkOXtAfQZ4Hsz0a6bUq2
         TYZ81kWPaWHm0/Jtt6En7QHnKHZdRKia0/MUKRrkM/T6cB3dZUqku1Vwp+i0nuCuAzP9
         TcPh1n9CmFQ8d6ysY6XYvIxsAReiE4ukwttbc8q7vIIVh/p2fCmDRnZcPlrVOojYLELe
         QyPRimEtO9dkOHllty6ELCSWonI92hIAQ13eeeQa2ZW7+617aB9y515x1GvoozHEIMjv
         1VWn8dsiVcxVJWJzgNO1tuZbh+PXKiRBZoZp+mAOGATR0DVtJOvo6QrJuZDmLfBwcF4A
         eIiw==
X-Gm-Message-State: AO0yUKXHuDezI8h5jtfzwREofzKFWeC5IcBEhYO+faB68smSpb5ngVyR
	S1wCjSmHglY1AuKZT54Ne65Pi4lKr56hDQ==
X-Google-Smtp-Source: AK7set9FqlrJWBKDpmpw+OwsaDnS36B4Dg0J5BJR80P6eKXkC/1jjzZndll9l4IQdZVETGOoE/leXg==
X-Received: by 2002:a05:6a20:3d15:b0:d6:4003:e386 with SMTP id y21-20020a056a203d1500b000d64003e386mr8931551pzi.48.1679049597765;
        Fri, 17 Mar 2023 03:39:57 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f26:5d2f:e9c0:191:187d:c313])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78dc8000000b00571f66721aesm1275782pfr.42.2023.03.17.03.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 03:39:57 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	rajmohan.r@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Virendra Thakur <virendrak@kpit.com>,
	Bhabu Bindu <bindudaniel1996@gmail.com>
Subject: [oe][meta-oe][dunfell][PATCH] nss: Fix CVE CVE-2023-0767
Date: Fri, 17 Mar 2023 16:09:49 +0530
Message-Id: <20230317103949.349469-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 10:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101591

From: Virendra Thakur <virendrak@kpit.com>

Add CVE-2023-0767.patch to fix CVE-2023-0767

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
---
 .../nss/nss/CVE-2023-0767.patch               | 124 ++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch b/meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch
new file mode 100644
index 000000000..ec3b4a092
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch
@@ -0,0 +1,124 @@
+
+# HG changeset patch
+# User John M. Schanck <jschanck@mozilla.com>
+# Date 1675974326 0
+# Node ID 62f6b3e9024dd72ba3af9ce23848d7573b934f18
+# Parent  52b4b7d3d3ebdb25fbf2cf1c101bfad3721680f4
+Bug 1804640 - improve handling of unknown PKCS#12 safe bag types. r=rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D167443
+
+CVE: CVE-2023-0767
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/nss/2:3.35-2ubuntu2.16/nss_3.35-2ubuntu2.16.debian.tar.xz]
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+diff --git a/nss/lib/pkcs12/p12d.c b/nss/lib/pkcs12/p12d.c
+--- a/nss/lib/pkcs12/p12d.c
++++ b/nss/lib/pkcs12/p12d.c
+@@ -332,41 +332,48 @@ sec_pkcs12_decoder_safe_bag_update(void 
+                                    unsigned long len, int depth,
+                                    SEC_ASN1EncodingPart data_kind)
+ {
+     sec_PKCS12SafeContentsContext *safeContentsCtx =
+         (sec_PKCS12SafeContentsContext *)arg;
+     SEC_PKCS12DecoderContext *p12dcx;
+     SECStatus rv;
+ 
+-    /* make sure that we are not skipping the current safeBag,
+-     * and that there are no errors.  If so, just return rather
+-     * than continuing to process.
+-     */
+-    if (!safeContentsCtx || !safeContentsCtx->p12dcx ||
+-        safeContentsCtx->p12dcx->error || safeContentsCtx->skipCurrentSafeBag) {
++    if (!safeContentsCtx || !safeContentsCtx->p12dcx || !safeContentsCtx->currentSafeBagA1Dcx) {
+         return;
+     }
+     p12dcx = safeContentsCtx->p12dcx;
+ 
++    /* make sure that there are no errors and we are not skipping the current safeBag */
++    if (p12dcx->error || safeContentsCtx->skipCurrentSafeBag) {
++        goto loser;
++    }
++
+     rv = SEC_ASN1DecoderUpdate(safeContentsCtx->currentSafeBagA1Dcx, data, len);
+     if (rv != SECSuccess) {
+         p12dcx->errorValue = PORT_GetError();
++        p12dcx->error = PR_TRUE;
++        goto loser;
++    }
++
++    /* The update may have set safeContentsCtx->skipCurrentSafeBag, and we
++     * may not get another opportunity to clean up the decoder context.
++     */
++    if (safeContentsCtx->skipCurrentSafeBag) {
+         goto loser;
+     }
+ 
+     return;
+ 
+ loser:
+-    /* set the error, and finish the decoder context.  because there
++    /* Finish the decoder context. Because there
+      * is not a way of returning an error message, it may be worth
+      * while to do a check higher up and finish any decoding contexts
+      * that are still open.
+      */
+-    p12dcx->error = PR_TRUE;
+     SEC_ASN1DecoderFinish(safeContentsCtx->currentSafeBagA1Dcx);
+     safeContentsCtx->currentSafeBagA1Dcx = NULL;
+     return;
+ }
+ 
+ /* notify function for decoding safeBags.  This function is
+  * used to filter safeBag types which are not supported,
+  * initiate the decoding of nested safe contents, and decode
+diff --git a/nss/lib/pkcs12/p12t.h b/nss/lib/pkcs12/p12t.h
+--- a/nss/lib/pkcs12/p12t.h
++++ b/nss/lib/pkcs12/p12t.h
+@@ -68,16 +68,17 @@ struct sec_PKCS12SafeBagStr {
+     /* Dependent upon the type of bag being used. */
+     union {
+         SECKEYPrivateKeyInfo *pkcs8KeyBag;
+         SECKEYEncryptedPrivateKeyInfo *pkcs8ShroudedKeyBag;
+         sec_PKCS12CertBag *certBag;
+         sec_PKCS12CRLBag *crlBag;
+         sec_PKCS12SecretBag *secretBag;
+         sec_PKCS12SafeContents *safeContents;
++        SECItem *unknownBag;
+     } safeBagContent;
+ 
+     sec_PKCS12Attribute **attribs;
+ 
+     /* used locally */
+     SECOidData *bagTypeTag;
+     PLArenaPool *arena;
+     unsigned int nAttribs;
+diff --git a/nss/lib/pkcs12/p12tmpl.c b/nss/lib/pkcs12/p12tmpl.c
+--- a/nss/lib/pkcs12/p12tmpl.c
++++ b/nss/lib/pkcs12/p12tmpl.c
+@@ -25,22 +25,22 @@ sec_pkcs12_choose_safe_bag_type(void *sr
+     if (src_or_dest == NULL) {
+         return NULL;
+     }
+ 
+     safeBag = (sec_PKCS12SafeBag *)src_or_dest;
+ 
+     oiddata = SECOID_FindOID(&safeBag->safeBagType);
+     if (oiddata == NULL) {
+-        return SEC_ASN1_GET(SEC_AnyTemplate);
++        return SEC_ASN1_GET(SEC_PointerToAnyTemplate);
+     }
+ 
+     switch (oiddata->offset) {
+         default:
+-            theTemplate = SEC_ASN1_GET(SEC_AnyTemplate);
++            theTemplate = SEC_ASN1_GET(SEC_PointerToAnyTemplate);
+             break;
+         case SEC_OID_PKCS12_V1_KEY_BAG_ID:
+             theTemplate = SEC_ASN1_GET(SECKEY_PointerToPrivateKeyInfoTemplate);
+             break;
+         case SEC_OID_PKCS12_V1_CERT_BAG_ID:
+             theTemplate = sec_PKCS12PointerToCertBagTemplate;
+             break;
+         case SEC_OID_PKCS12_V1_CRL_BAG_ID:
+
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index c201dc11f..b0d705f0a 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://CVE-2020-12403_2.patch \
            file://CVE-2021-43527.patch \
            file://CVE-2022-22747.patch \
+           file://CVE-2023-0767.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.25.1


