Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15784CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 18:29:06 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.2014.1761157742710420123
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 11:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ktY2jA2E;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251022182859d7dccd6f62000207da-txoa9g@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251022182859d7dccd6f62000207da
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 22 Oct 2025 20:29:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AePXZUmZRo5ULOjNF/QM3TDT0+PkLVo5fgGXmIZHucU=;
 b=ktY2jA2Ek02DjaSbxQKa14A3Qar5O9DpFr48elYfU4nf7uue0SvNqDeX+iBX415FLjTmga
 TL9ag1XOU90Ix3WC4PTZQ6i24Y+rMyGiRMGrIMmoSAfm/9pkO/FU5rDlUq75aIxRWeXy2FC5
 srwyL3I6EOr77nd3WsKQKvxjYSyykLA9COr4HhDY4E533s89hYKQ7dzNN+LZBbsxgdK0Tbqi
 ZwLow16fwC0AwYVBpSMsxeeS2jEDZpsI1Y2L+QzY4VYLlvjya4sthg9Tt0MObWjEYjBR3VbJ
 0ZW4uK8pGVIq3tENkYfzM/gM/ii10P3XkbsXB3loyXv3pzM8cOJ00jxw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH] squid: patch CVE-2025-59362
Date: Wed, 22 Oct 2025 20:28:53 +0200
Message-Id: <20251022182853.1917342-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 18:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120897

From: Peter Marko <peter.marko@siemens.com>

Pick commit from PR mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2025-59362.patch          | 52 +++++++++++++++++++
 .../recipes-daemons/squid/squid_6.9.bb        |  1 +
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
diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.9.bb
index f6312521d9..490a5401c3 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0002-squid-make-squid-conf-tests-run-on-target-device.patch \
            file://squid.nm \
            file://CVE-2024-37894.patch \
+           file://CVE-2025-59362.patch \
            "
 
 SRC_URI[sha256sum] = "1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882"

