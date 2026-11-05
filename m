Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.899.1793947433037629725
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=dtbLKbxo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202611060643493c9d491494000207fc-efumip@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202611060643493c9d491494000207fc
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Nov 2026 07:43:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=aqtEk0VVTHPpX75mpmkxTLQGqrqNuSFaaESWIt+CTWk=;
 b=dtbLKbxofOg3yQ6bP0jToCI/PVcX3tFOuoCJCUB/+EeZP5jJvX2QEcV+SSM3yOu28NsGUX
 hIsqzKZNssL+wX5pl9NJngyra3VSw856IzQJhiLdgB78bJegAEbzMf0XdUaFtSaovHRNyNi7
 s4yyenWZygSUxj3rDg5NrUJAw2OMdn7ko/x/XjBtqMsbRUTLyVMB5lmC6DsIdlkY+oQuvQ/D
 4MI2CqF1j7uyD2lDMLrY3SCE11DgYo0yqhS+AXspWg/7wzufrV23DnpKM0EUWW199WNW2AUb
 pl1VqDoKXhiD4eUOcRVwaAxh9aeB7DzDyQi/G4J+NWvR6ODQwX0b8YrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 1/4] nss: patch CVE-2024-11704
Date: Fri,  6 Nov 2026 00:23:11 +0100
Message-ID: <20261105232314.3699451-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 06:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131960
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing [1].

[1] https://bugzilla.mozilla.org/show_bug.cgi?id=1899402

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../images/meta-networking-image-ptest.bb     |  2 +-
 .../nss/nss/CVE-2024-11704.patch              | 30 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11704.patch

diff --git a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
index b6238d61003..874af9c6bda 100644
--- a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
+++ b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
@@ -33,7 +33,7 @@ QB_MEM:virtclass-mcextend-nftables = "-m 2048"
 TEST_SUITES = "ping ssh parselogs ptest"
 
 # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
-PTEST_EXPECT_FAILURE = "1"
+#PTEST_EXPECT_FAILURE = "1"
 
 python () {
     if not d.getVar("MCNAME"):
diff --git a/meta-oe/recipes-support/nss/nss/CVE-2024-11704.patch b/meta-oe/recipes-support/nss/nss/CVE-2024-11704.patch
new file mode 100644
index 00000000000..0f8c4dc4477
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
index 8cff9372f1b..d180346b396 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://CVE-2026-2781.patch \
            file://0008-Bug-2083709-Remove-eMudhra-emSign-Root-CA-C1-and-emS.patch \
            file://0009-Bug-2084101-Remove-eMudhra-emSign-Root-CA-G3-from-NS.patch \
+           file://CVE-2024-11704.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
