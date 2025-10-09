Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573F8CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 21:41:58 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.2213.1760046114687011002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 14:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=MSVwRT8E;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025100921415298daf5ecae00020745-f6w0a6@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025100921415298daf5ecae00020745
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 09 Oct 2025 23:41:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=81GQxzPgeX6xl5QedsZyiu6RJdCvujB9c8RHJgzGfmY=;
 b=MSVwRT8E5VIrwAwLMJE1G2Ww6dMMErHAl5c4ZLvinHPmn8b7YJfGsOpsrer67wx0k++yjL
 8KUF+D5ef2X2zHnTJQqZ8ei08N3ElRK+PH09TJQJuzhlK6t1xlRyhGvUx6yeCBB+0w7IZRuL
 DRamCRFge7EM0dD+obtIqkeDfz0c0eKRLhoUeEHhFD+cEH8yrFEO2xWNDXg//7CBJGmz5gBP
 UtKfd/GnrnRkHkN3fa0M5h7WFjHowstr/x86sfTKYGXLpqhPwCQGsBAT9zERxW8vptvnM/ol
 hX86bZ8QUu3BcyZum5wu5Ap476OuzsA6jbHc0GMLIRDua2pQdMXAa7gQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 3/3] squid: patch CVE-2025-59362
Date: Thu,  9 Oct 2025 23:41:32 +0200
Message-Id: <20251009214132.856182-3-peter.marko@siemens.com>
In-Reply-To: <20251009214132.856182-1-peter.marko@siemens.com>
References: <20251009214132.856182-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120453

From: Peter Marko <peter.marko@siemens.com>

Pick patch from PR ]1] mentioned in NVD report [2].

[1] https://github.com/squid-cache/squid/pull/2149
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-59362

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2025-59362.patch          | 52 +++++++++++++++++++
 .../recipes-daemons/squid/squid_7.1.bb        |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch b/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
new file mode 100644
index 0000000000..26a3896625
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
@@ -0,0 +1,52 @@
+From 0d89165ee6da10e6fa50c44998b3cd16d59400e9 Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Sat, 30 Aug 2025 06:49:36 +0000
+Subject: [PATCH] Fix ASN.1 encoding of long SNMP OIDs (#2149)
+
+CVE: CVE-2025-59362
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/0d89165ee6da10e6fa50c44998b3cd16d59400e9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/snmplib/asn1.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/lib/snmplib/asn1.c b/lib/snmplib/asn1.c
+index 81f2051fb..2852c26b2 100644
+--- a/lib/snmplib/asn1.c
++++ b/lib/snmplib/asn1.c
+@@ -735,6 +735,7 @@ asn_build_objid(u_char * data, int *datalength,
+      * lastbyte ::= 0 7bitvalue
+      */
+     u_char buf[MAX_OID_LEN];
++    u_char *bufEnd = buf + sizeof(buf);
+     u_char *bp = buf;
+     oid *op = objid;
+     int asnlength;
+@@ -753,6 +754,10 @@ asn_build_objid(u_char * data, int *datalength,
+     while (objidlength-- > 0) {
+         subid = *op++;
+         if (subid < 127) {  /* off by one? */
++            if (bp >= bufEnd) {
++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                return (NULL);
++            }
+             *bp++ = subid;
+         } else {
+             mask = 0x7F;    /* handle subid == 0 case */
+@@ -770,8 +775,16 @@ asn_build_objid(u_char * data, int *datalength,
+                 /* fix a mask that got truncated above */
+                 if (mask == 0x1E00000)
+                     mask = 0xFE00000;
++                if (bp >= bufEnd) {
++                    snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                    return (NULL);
++                }
+                 *bp++ = (u_char) (((subid & mask) >> bits) | ASN_BIT8);
+             }
++            if (bp >= bufEnd) {
++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                return (NULL);
++            }
+             *bp++ = (u_char) (subid & mask);
+         }
+     }
diff --git a/meta-networking/recipes-daemons/squid/squid_7.1.bb b/meta-networking/recipes-daemons/squid/squid_7.1.bb
index d17223e866..bba26cc5fa 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.1.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://0002-squid-make-squid-conf-tests-run-on-target-device.patch \
            file://0001-libltdl-remove-reference-to-nonexisting-directory.patch \
            file://squid.nm \
+           file://CVE-2025-59362.patch \
            "
 
 SRC_URI[sha256sum] = "763b5a78561cedc4e47634fa42b8e6b8d46c87c949a151b4e7ac2396d2f97dea"

