Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540FCC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 07:52:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.10873.1716537164180967700
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 00:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CnU5sXef;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f449f09476so3345205ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 00:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1716537163; x=1717141963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7yc1V5exVdjVQmObjo5viVYc24a/4gt0cGVuSrfQlY=;
        b=CnU5sXefOXmJ1gwHWCdQVJ/cBEopVxeIEFGBV0mHfV9w3+AKSvq8SZeynZjeCQ8qSD
         U+Ww9r6EikDEVsdFv/x2O4ezkbe3ADVBZNxGIAyKLWj83d+dzluCqyNxZWjDoA5D3wNR
         VQv9Go8baa/vB7LirZqj1wDp+BPnnJ0nbilnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716537163; x=1717141963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7yc1V5exVdjVQmObjo5viVYc24a/4gt0cGVuSrfQlY=;
        b=uto+k5y4EWPaMCH/ECukC1PbaHwBLYUM9e8HVnHvU+n7xr8cQQpsUGf9AhvvfNZyf9
         3wZuPPmWRwqCd+1TBJtuy3hjQARKm4k/ov4ht1ZduMxRhcQkY+LD65ssOgywCadNYlWX
         /KlglHhQW/HwFE39hjIiWrWISeABC2Jn5vQqsGFkWjNNnWES74h54rNa3Gk3IF+YzZ6B
         PHB3yUlXIwpzbRPGOlN3LcAByhX/dhOfhMdRER3OhWpPz3Lf42J7caKmxdUgUv0a+bJL
         0K1zIH26VnlgBbZ1Fe0zVqkOJswgbXB0/3ctdhtFKA34uo+TF2ScrEOhkFChheFMhPcp
         1WKw==
X-Gm-Message-State: AOJu0YxABVrMyOGIA8GFFhYlyZC9dGEB4R2Uvz27waNdMfknEqtwJDg1
	FL2YhGmFkDupmcKXtLGO/2AKI0SW4GXcQ4GmYIBrBzR4XyO+TcBEtpsA/y83vjA15xmTQ9egJmE
	f
X-Google-Smtp-Source: AGHT+IHmvtF3aYQf4nvLgdjR7lthVpjqmOrOacGPx1XKCrbiAZPeBa885G0bNYCwAEfQQWLyxK+jTw==
X-Received: by 2002:a17:902:ea03:b0:1f3:81c:c17 with SMTP id d9443c01a7336-1f4481f22cfmr22749365ad.23.1716537162546;
        Fri, 24 May 2024 00:52:42 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.174.154])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f44c971012sm7732685ad.173.2024.05.24.00.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 00:52:42 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] nss: Backport fix CVE-2023-0767
Date: Fri, 24 May 2024 13:22:33 +0530
Message-Id: <20240524075233.390146-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 07:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110508

Upstream-Status: Backport from [https://hg.mozilla.org/projects/nss/rev/684586ec163ad4fbbf15ea2cd1ee5c2da43036ad]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../nss/nss/CVE-2023-0767.patch               | 102 ++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.74.bb       |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch b/meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch
new file mode 100644
index 0000000000..0e0725b5f5
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch
@@ -0,0 +1,102 @@
+# HG changeset patch
+# User John M. Schanck <jschanck@mozilla.com>
+# Date 1675974326 0
+# Node ID 684586ec163ad4fbbf15ea2cd1ee5c2da43036ad
+# Parent  58d7a8a55aea6a363bb8c7a9a7752739c4d32823
+Bug 1804640 - improve handling of unknown PKCS#12 safe bag types. r=rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D167443
+
+Upstream-Status: Backport [https://hg.mozilla.org/projects/nss/rev/684586ec163ad4fbbf15ea2cd1ee5c2da43036ad]
+CVE: CVE-2023-0767
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ nss/lib/pkcs12/p12d.c    | 23 +++++++++++++++--------
+ nss/lib/pkcs12/p12t.h    |  1 +
+ nss/lib/pkcs12/p12tmpl.c |  4 ++--
+ 3 files changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/nss/lib/pkcs12/p12d.c b/nss/lib/pkcs12/p12d.c
+index 676f33b..decddc5 100644
+--- a/nss/lib/pkcs12/p12d.c
++++ b/nss/lib/pkcs12/p12d.c
+@@ -337,31 +337,38 @@ sec_pkcs12_decoder_safe_bag_update(void *arg, const char *data,
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
+diff --git a/nss/lib/pkcs12/p12t.h b/nss/lib/pkcs12/p12t.h
+index b22f0dd..d449afd 100644
+--- a/nss/lib/pkcs12/p12t.h
++++ b/nss/lib/pkcs12/p12t.h
+@@ -73,6 +73,7 @@ struct sec_PKCS12SafeBagStr {
+         sec_PKCS12CRLBag *crlBag;
+         sec_PKCS12SecretBag *secretBag;
+         sec_PKCS12SafeContents *safeContents;
++        SECItem *unknownBag;
+     } safeBagContent;
+
+     sec_PKCS12Attribute **attribs;
+diff --git a/nss/lib/pkcs12/p12tmpl.c b/nss/lib/pkcs12/p12tmpl.c
+index 7437cbc..b08384f 100644
+--- a/nss/lib/pkcs12/p12tmpl.c
++++ b/nss/lib/pkcs12/p12tmpl.c
+@@ -30,12 +30,12 @@ sec_pkcs12_choose_safe_bag_type(void *src_or_dest, PRBool encoding)
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
+--
+2.34.1
diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index 26baf669d1..ce4137a67f 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            file://0001-Bug-1780432-CVE-2023-5388-Timing-attack-against-RSA-.patch;patchdir=nss \
            file://0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch;patchdir=nss \
+           file://CVE-2023-0767.patch \
            "
 SRC_URI[sha256sum] = "88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056"
 
-- 
2.34.1


