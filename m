Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA95D0D178
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 22:13:39 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18450.1767824013541111337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 14:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WIl3Mbm+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202601072213305b7c4633f700020775-_sw0of@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202601072213305b7c4633f700020775
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 07 Jan 2026 23:13:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4Epw47H5sHrTy0Xdtqjt3XZamHI1jXLyLj64utXCsVY=;
 b=WIl3Mbm+xwf8msGWOT7V+B66PJ7j0Hj2xYHexwXFhyxBVh1iwqxZo2W+teIwKoJXYhSRqS
 2NpPTRYdRSUf/gaDEpEsxw13+CLw+zu4DObzQP39VNRHd/c6nLf/8goNxU97q6zYzw1ICsXG
 mBuIxuSY9Bv6rUmhI58cXn3qrkTH0s409GTqbOrpeNx8OqckcM6rfIBkZcWAYoC1vNW3wo98
 1IE7EbkcQFz7lR3D4q/Fzq24OAgGMRky3oa3I2CqLNmPiursAhfeRYg416UrBwDI6P+a2cXS
 kjXaJ6yyGWMdn0wWGlvLSsdRNSYSX0b7bGIP4fNppim9aTY3yzkd10bA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][whinlatter][PATCH] net-snmp: patch CVE-2025-68615
Date: Wed,  7 Jan 2026 23:11:00 +0100
Message-Id: <20260107221101.3556840-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 22:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123239

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-68615

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../net-snmp/net-snmp/CVE-2025-68615.patch    | 33 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.4.bb                |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch
new file mode 100644
index 0000000000..865a6187c7
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch
@@ -0,0 +1,33 @@
+From b4e6f826d9ddcc2d72eac432746807e1234266db Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Sun, 2 Nov 2025 14:48:55 -0800
+Subject: [PATCH] snmptrapd: Fix out-of-bounds trapOid[] accesses
+
+Fixes: https://issues.oss-fuzz.com/issues/457106694
+Fixes: https://issues.oss-fuzz.com/issues/458668421
+Fixes: https://issues.oss-fuzz.com/issues/458876071
+
+CVE: CVE-2025-68615
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ apps/snmptrapd_handlers.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/apps/snmptrapd_handlers.c b/apps/snmptrapd_handlers.c
+index 6cd126f26..afd93ed0f 100644
+--- a/apps/snmptrapd_handlers.c
++++ b/apps/snmptrapd_handlers.c
+@@ -1112,6 +1112,12 @@ snmp_input(int op, netsnmp_session *session,
+ 	     */
+             if (pdu->trap_type == SNMP_TRAP_ENTERPRISESPECIFIC) {
+                 trapOidLen = pdu->enterprise_length;
++                /*
++                 * Drop packets that would trigger an out-of-bounds trapOid[]
++                 * access.
++                 */
++                if (trapOidLen < 1 || trapOidLen > OID_LENGTH(trapOid) - 2)
++                    return 1;
+                 memcpy(trapOid, pdu->enterprise, sizeof(oid) * trapOidLen);
+                 if (trapOid[trapOidLen - 1] != 0) {
+                     trapOid[trapOidLen++] = 0;
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 44a3cfc745..6dc6a677d2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://netsnmp-swinst-crash.patch \
            file://net-snmp-5.9.4-kernel-6.7.patch \
            file://0001-Fix-LDFLAGS-vs-LIBS-ordering.patch \
+           file://CVE-2025-68615.patch \
            "
 SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
 

