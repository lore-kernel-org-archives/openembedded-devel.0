Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6868.1795733423324210651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 14:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SX/ny/+X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261126225019e24ddbaada000207e2-oe7ovf@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261126225019e24ddbaada000207e2
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 26 Nov 2026 23:50:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vtJdgwGTEXnwc0Q6Swth5TCvfsvVIo8FSNWK4T5rA+8=;
 b=SX/ny/+XUY1cmbX7DvfAs/mJJnrJ6DjDB3ifvhcN8Ju1JS7wO0WmI8RYNW9gUghsdQVJqq
 wYG2KW1OdnmbByAj1cPEU1fGMTf09D13fbWdbB3AX0gggZN7MEa49pdHt4/YJlRxh4Zqh8iM
 qhbteMPRN2UjUiY+vkW6Kj3H9b/IalYhA0+Lx2wMfgSHaI77iTZTlcOgwkPYKgYzPlC0loR0
 OeWd+XEOAJYF3O5uKYSOSMtCxtInD4WKcSGl/2LumVk2z+m3Yz88AHlkKgbplLSjyLmrm8xl
 lXhQyKfMCWeLoWcF/1/HcrZbxwRMz//BdHTiQjskqNwhkYNU2NImg9bQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 1/4] nss: patch CVE-2024-11704
Date: Thu, 26 Nov 2026 23:50:07 +0100
Message-ID: <20261126225010.31859-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 22:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133094
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing [1].

[1] https://bugzilla.mozilla.org/show_bug.cgi?id=1899402

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nss/nss/CVE-2024-11704.patch              | 30 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11704.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2024-11704.patch b/meta-oe/recipes-support/nss/nss/CVE-2024-11704.patch
new file mode 100644
index 0000000000..0f8c4dc447
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2024-11704.patch
@@ -0,0 +1,30 @@
+From 355276751baea8b557e1c850fd6eb044fa11f52a Mon Sep 17 00:00:00 2001
+From: Kai Engert <kaie@kuix.de>
+Date: Thu, 26 Sep 2024 21:22:17 +0200
+Subject: [PATCH] Bug 1899402 - Correctly destroy bulkkey in error scenario.
+ r=jschanck
+
+Differential Revision: https://phabricator.services.mozilla.com/D223837
+
+--HG--
+extra : rebase_source : d06a6bb8d51bb844c814c5ee682a1b24de3e2e69
+
+CVE: CVE-2024-11704
+Upstream-Status: Backport [https://github.com/mozilla/nss/commit/355276751baea8b557e1c850fd6eb044fa11f52a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nss/lib/pkcs7/p7decode.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/nss/lib/pkcs7/p7decode.c b/nss/lib/pkcs7/p7decode.c
+index 7a01f3671..02be982f6 100644
+--- a/nss/lib/pkcs7/p7decode.c
++++ b/nss/lib/pkcs7/p7decode.c
+@@ -542,6 +542,7 @@ sec_pkcs7_decoder_start_decrypt(SEC_PKCS7DecoderContext *p7dcx, int depth,
+      * We are done with (this) bulkkey now.
+      */
+     PK11_FreeSymKey(bulkkey);
++    bulkkey = NULL;
+ 
+     if (decryptobj == NULL) {
+         p7dcx->error = PORT_GetError();
diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
index 8cff9372f1..d180346b39 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://CVE-2026-2781.patch \
            file://0008-Bug-2083709-Remove-eMudhra-emSign-Root-CA-C1-and-emS.patch \
            file://0009-Bug-2084101-Remove-eMudhra-emSign-Root-CA-G3-from-NS.patch \
+           file://CVE-2024-11704.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
