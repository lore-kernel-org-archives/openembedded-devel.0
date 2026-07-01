Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99FBC43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 12:55:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44435.1782910500369357174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2026 05:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=el6Wx7cb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3F0744E40BEA;
	Wed,  1 Jul 2026 12:54:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB24860288;
	Wed,  1 Jul 2026 12:54:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EAE3104C95FB;
	Wed,  1 Jul 2026 14:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782910497; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ZXVD1S/FNGjbAQoDlzp6tri26pjjzsfnqaV4w2ePaCA=;
	b=el6Wx7cbtozAcdSeV5YexQsF+bnEQfrIiwJn9kFQ2YMpss6lkoEtqGyzCOok1dbLbSNgyV
	7kohIzpD+pf0b0+e9wx5PCVog0Wxn9DEB7/4GKcwzg7QLGI2eiBEBlayISxIU/L9fUdbW+
	mFf8Ty1LonYWZHkjafg92heplgth0OiNUQNhq7AmLxWQ+p2zMzO0fEtmB5cWXNIRRTpvWG
	pe1zhm/xvrp2/ffZVodRslsoGXY3rCNP/GrbVhoDkDOn+awDyxF7dNMnrLsvzPQTHgGr4Z
	NUHxYyufRFf8pwdBKc8wYmv7uC0uMpr1pcTaB6uBrNGJgH5tbVwHV8/JNAhoSw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 01 Jul 2026 14:54:56 +0200
Subject: [scarthgap][meta-networking][PATCH v2] dnsmasq: fix CVE-2026-4890
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-dnsmasq-cve-2026-4890-v2-1-76eb4b163c85@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WQwW6DMBBEfwX5XFe2oWA45T8Qh/V6DW4LJLZDW
 0X8e01Sqaeqxxlpnp7mxiIFT5F1xY0F2nz065KDeioYTrCMxL3NmSmhatEIye0SZ4gXjhvxo+S
 VbgV3L6aEprZUgmV5ew7k/Oed2w+PHK/mlTAdsD4ihDSNcB76mRLwhdLHGt78Mg4/60CXa5ZJD
 8SvS1b700SpVnKHypqytJa07TZ54AxE4rjOs09dYQQqrCsNEpxuqQFtbYWKUFfSlQYFWYFoWnZ
 oTz6mNXzd38msw+SfIzbJJW8tgEMtXf7jZNY1vfvlOQuwYd/3b/RV2JtzAQAA
X-Change-ID: 20260701-dnsmasq-cve-2026-4890-f5b3a76de3ad
To: openembedded-devel@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 12:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127995

A Denial of Service (DoS) vulnerability in the DNSSEC validation of
dnsmasq allows remote attackers to cause a denial of service via a
crafted DNS packet.

This patch is used by debian bookworm (2.90-4_deb12u2).

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
This patch needs to be applied on top of the previous CVE-2026-2291 patch
---
Changes in v2:
- Fix email subject
- Link to v1: https://patch.msgid.link/20260701-dnsmasq-cve-2026-4890-v1-1-9daafc81fde3@bootlin.com
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb        |  1 +
 .../dnsmasq/files/CVE-2026-4890.patch              | 74 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 3a7af56c34d7..ad79a3bfa828 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-4893.patch \
            file://CVE-2026-5172.patch \
            file://CVE-2026-2291.patch \
+           file://CVE-2026-4890.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
new file mode 100644
index 000000000000..1c60ae0b798f
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
@@ -0,0 +1,74 @@
+From 12e5ee3495842ededf8057758ef8da59745bbf33 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Fri, 10 Apr 2026 22:16:45 +0100
+Subject: [PATCH] Fix NSEC bitmap parsing infinite loop. CVE-2026-4890
+
+Report from Royce M <royce@xchglabs.com>.
+
+Location: dnssec.c:1290-1306, dnssec.c:1450-1463
+
+The bitmap window iteration advances by p[1] instead of p[1]+2 (missing the 2-byte window header). With bitmap_length=0, both rdlen and p are
+unchanged, causing an infinite loop and dnsmasq stops responding to all queries.
+
+The same code accesses p[2] after only checking rdlen >= 2 without verifying p[1] >= 1, causing OOB reads at 6 locations.
+
+Both bugs are reachable before RRSIG validation (confirmed by the source comment at line 2125), so no valid DNSSEC signatures are needed.
+
+CVE: CVE-2026-4890
+Upstream-Status: Backport [https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/CVE-2026-4890.patch]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ src/dnssec.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index ed2f53ff..68f1b5d0 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -1270,10 +1270,10 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+	     packet checked to be as long as rdlen implies in prove_non_existence() */
+
+	  /* If we can prove that there's no NS record, return that information. */
+-	  if (nons && rdlen >= 2 && p[0] == 0 && (p[2] & (0x80 >> T_NS)) != 0)
++	  if (nons && rdlen >= 2 && p[0] == 0 && p[1] >= 1  && (p[2] & (0x80 >> T_NS)) != 0)
+	    *nons = 0;
+
+-	  if (rdlen >= 2 && p[0] == 0)
++	  if (rdlen >= 2 && p[0] == 0 && p[1] >= 1)
+	    {
+	      /* A CNAME answer would also be valid, so if there's a CNAME is should
+		 have been returned. */
+@@ -1301,8 +1301,8 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+		  break; /* finished checking */
+		}
+
+-	      rdlen -= p[1];
+-	      p +=  p[1];
++	      rdlen -= p[1] + 2;
++	      p +=  p[1] + 2;
+	    }
+
+	  return 0;
+@@ -1429,7 +1429,7 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
+		p += hash_len; /* skip next-domain hash */
+		rdlen -= p - psave;
+
+-		if (rdlen >= 2 && p[0] == 0)
++		if (rdlen >= 2 && p[0] == 0 && p[1] >= 1)
+		  {
+		    /* If we can prove that there's no NS record, return that information. */
+		    if (nons && (p[2] & (0x80 >> T_NS)) != 0)
+@@ -1458,8 +1458,8 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
+			break; /* finished checking */
+		      }
+
+-		    rdlen -= p[1];
+-		    p +=  p[1];
++		    rdlen -= p[1] + 2;
++		    p +=  p[1] + 2;
+		  }
+
+		return 1;
+--
+2.43.0

---
base-commit: b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9
change-id: 20260701-dnsmasq-cve-2026-4890-f5b3a76de3ad
prerequisite-change-id: 20260701-dnsmasq-cve-2026-2291-fc2db33dde8d:v1
prerequisite-patch-id: e7e3fdcabd23649336d34bd2f492f09007d73472

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


