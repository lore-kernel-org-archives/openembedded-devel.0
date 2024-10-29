Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBA4D74946
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 22:12:18 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.1113.1730239929821912644
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 15:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=M4RQEYD6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241029221206a017a9b076d7c9b4fe-vy1u_b@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241029221206a017a9b076d7c9b4fe
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 29 Oct 2024 23:12:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FaUuya4oaoweohObGvGKeKctT7t36nQ31L3doOvyz0M=;
 b=M4RQEYD6RNAd0x0k9osEaz5AOAV75Z2TyZAylYjjrZr1f6b1VV99+VEDj/JdSJSyCxWbdW
 xFXPwzZ6SS4E66A7llNe9sGJHWkmoNNr7qIfzPFmX+g915zkDSVcg/mcelVdAcU2dPcC5nmn
 ElThBPOAd/VNuliat2xCxdDcpRNF2WKgWyiGWP4CsudfRgrhgYt93yudnWCsYR3s1l+LwpkA
 rXfrzQtybWP1UYC2BivirHer1zozc2DTGMXuZ7y/8H40lBMCRSqtgSI9xw74pv2nRCWqacrj
 sf+Nrvu54r7cn+ZCaVA+e9gTZTEVUn3RZjgxkQozXcN6bpcAcqwXuVxw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH 1/2] nss: patch CVE-2024-6602
Date: Tue, 29 Oct 2024 23:11:11 +0100
Message-Id: <20241029221112.197996-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 22:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113334

From: Peter Marko <peter.marko@siemens.com>

Pick the same patch as Debian took for bullseye.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nss/nss/CVE-2024-6602.patch               | 65 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.74.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch b/meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch
new file mode 100644
index 0000000000..f75d822d03
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch
@@ -0,0 +1,65 @@
+From 7804e99346339bb31f801a2fcba63b6fbd8bca4a Mon Sep 17 00:00:00 2001
+From: John Schanck <jschanck@mozilla.com>
+Date: Mon, 20 May 2024 18:46:14 +0000
+Subject: [PATCH] Bug 1895032 - remove redundant AllocItem implementation.
+ r=nss-reviewers,rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D209476
+
+--HG--
+extra : moz-landing-system : lando
+
+CVE: CVE-2024-6602
+Upstream-Status: Backport [https://hg.mozilla.org/projects/nss/rev/f9b22115dc97be76e388dc9d0dca946dde955e64]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nss/lib/util/secitem.c | 23 ++++-------------------
+ 1 file changed, 4 insertions(+), 19 deletions(-)
+
+diff --git a/nss/lib/util/secitem.c b/nss/lib/util/secitem.c
+index cd6996178..6ba11a551 100644
+--- a/nss/lib/util/secitem.c
++++ b/nss/lib/util/secitem.c
+@@ -238,35 +238,20 @@ SECITEM_ArenaDupItem(PLArenaPool *arena, const SECItem *from)
+     SECItem *to;
+ 
+     if (from == NULL) {
+-        return (NULL);
++        return NULL;
+     }
+ 
+-    if (arena != NULL) {
+-        to = (SECItem *)PORT_ArenaAlloc(arena, sizeof(SECItem));
+-    } else {
+-        to = (SECItem *)PORT_Alloc(sizeof(SECItem));
+-    }
++    to = SECITEM_AllocItem(arena, NULL, from->len);
+     if (to == NULL) {
+-        return (NULL);
++        return NULL;
+     }
+ 
+-    if (arena != NULL) {
+-        to->data = (unsigned char *)PORT_ArenaAlloc(arena, from->len);
+-    } else {
+-        to->data = (unsigned char *)PORT_Alloc(from->len);
+-    }
+-    if (to->data == NULL) {
+-        PORT_Free(to);
+-        return (NULL);
+-    }
+-
+-    to->len = from->len;
+     to->type = from->type;
+     if (to->len) {
+         PORT_Memcpy(to->data, from->data, to->len);
+     }
+ 
+-    return (to);
++    return to;
+ }
+ 
+ SECStatus
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index cffeee5ecb..464a353ff7 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://CVE-2023-0767.patch \
            file://0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch \
            file://regenerate_NameConstrain_test_certificates.tar.gz \
+           file://CVE-2024-6602.patch \
            "
 SRC_URI[sha256sum] = "88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056"
 
-- 
2.30.2


