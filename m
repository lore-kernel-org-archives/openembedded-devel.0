Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52031C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:35:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18838.1784626550246160936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KHr4TeFf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F0DC14E40E9B;
	Tue, 21 Jul 2026 09:35:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0E0B60368;
	Tue, 21 Jul 2026 09:35:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E605E11BD03C7;
	Tue, 21 Jul 2026 11:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784626547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=m6qshz54GsZCwc9OZCGbjrXF6FRtk2tJhH6hbJYZbKo=;
	b=KHr4TeFfYtvinW05w1vPikgS1cB3555IPbmOYQFguy1wBQMMsz0ECnj0TwZvopbIbi3PNT
	rzTFkJPvRMmw4mhqsKaN4Ba5HX23BqNQom9G4nJXHATXfSO5V+e5Kv1ynKcljAw1gWZRYU
	I9GPskv9NGWOL69ODXbHr68QCVlqxGZhAJbHwFDaokQIVTgXuff29IXY6QAav0LkM53pc8
	nljTzyiK/7aRcRYXc6wMb/8pkZTtYgWpHyrVff3U4LRO859iiixtr7mq5UCoM0Sd1Gdkr3
	yv7bRj19s8X/K9EhuKR8oGBaorAjhJD8YKMVikNb+6UC+x3dn44T3rpD5tS6hA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Tue, 21 Jul 2026 11:35:45 +0200
Subject: [scarthgap][meta-networking][PATCH v3] dnsmasq: fix CVE-2026-4890
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dnsmasq-cve-2026-4890-v3-1-2cf4e03fa5df@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwY6CMBRFf8V07ZtQUEBX/gdh8do+oCqttrXOx
 PDvU9TEuNLluck9OTfmyWnybLu4MUdRe21NgmK5YHJA0xNolZjlWV5mVcZBGT+iP4OMBPMIq3q
 TQbcWBValogIVS9+To07/3r1N+2B/EXuSYZY1XqILQ4+nthkpIBgKV+sO2vTt8+3ofEkx4aUYt
 A/W/d1LI5/XT1GRA4eNQuxkzbvUthPWhqM2P9KObHbG/CtPnjxVSWIleFnIev3umabpHyz2OmN
 HAQAA
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
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128345

A Denial of Service (DoS) vulnerability in the DNSSEC validation of
dnsmasq allows remote attackers to cause a denial of service via a
crafted DNS packet.

This patch is used by debian bookworm (2.90-4_deb12u2).
It is also referenced here [1].

[1] https://thekelleys.org.uk/dnsmasq/CVE/CVE-2026-4890.dnsmasq-2.91.diff

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
This patch needs to be applied on top of the previous CVE-2026-2291 patch
---
Changes in v3:
- Update patch link (instead of using debian link) to reference:
  https://thekelleys.org.uk/dnsmasq/CVE/CVE-2026-4890.dnsmasq-2.91.diff
- Fix patch, by keeping all whitespace at end of line. Applying this patch
  series is going to generate warnings, but the patch fixing the CVE contained
  in this patch series should apply without any issue.
- Link to v2: https://patch.msgid.link/20260701-dnsmasq-cve-2026-4890-v2-1-76eb4b163c85@bootlin.com

Changes in v2:
- Fix email subject
- Link to v1: https://patch.msgid.link/20260701-dnsmasq-cve-2026-4890-v1-1-9daafc81fde3@bootlin.com
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb        |  1 +
 .../dnsmasq/files/CVE-2026-4890.patch              | 75 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

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
index 000000000000..975a80d474b2
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
@@ -0,0 +1,75 @@
+From 6a185fdd49ee668c75ad7e95461de45c3a3d8d10 Mon Sep 17 00:00:00 2001
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Fri Apr 10 22:16:45 2026 +0100
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
+Upstream-Status: Backport [https://thekelleys.org.uk/dnsmasq/CVE/CVE-2026-4890.dnsmasq-2.91.diff]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ src/dnssec.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index ed2f53ff1763..68f1b5d0fab4 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -1270,10 +1270,10 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+ 	     packet checked to be as long as rdlen implies in prove_non_existence() */
+ 	  
+ 	  /* If we can prove that there's no NS record, return that information. */
+-	  if (nons && rdlen >= 2 && p[0] == 0 && (p[2] & (0x80 >> T_NS)) != 0)
++	  if (nons && rdlen >= 2 && p[0] == 0 && p[1] >= 1  && (p[2] & (0x80 >> T_NS)) != 0)
+ 	    *nons = 0;
+ 	  
+-	  if (rdlen >= 2 && p[0] == 0)
++	  if (rdlen >= 2 && p[0] == 0 && p[1] >= 1)
+ 	    {
+ 	      /* A CNAME answer would also be valid, so if there's a CNAME is should 
+ 		 have been returned. */
+@@ -1301,8 +1301,8 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+ 		  break; /* finished checking */
+ 		}
+ 	      
+-	      rdlen -= p[1];
+-	      p +=  p[1];
++	      rdlen -= p[1] + 2;
++	      p +=  p[1] + 2;
+ 	    }
+ 	  
+ 	  return 0;
+@@ -1429,7 +1429,7 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
+ 		p += hash_len; /* skip next-domain hash */
+ 		rdlen -= p - psave;
+ 
+-		if (rdlen >= 2 && p[0] == 0)
++		if (rdlen >= 2 && p[0] == 0 && p[1] >= 1)
+ 		  {
+ 		    /* If we can prove that there's no NS record, return that information. */
+ 		    if (nons && (p[2] & (0x80 >> T_NS)) != 0)
+@@ -1458,8 +1458,8 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
+ 			break; /* finished checking */
+ 		      }
+ 		    
+-		    rdlen -= p[1];
+-		    p +=  p[1];
++		    rdlen -= p[1] + 2;
++		    p +=  p[1] + 2;
+ 		  }
+ 		
+ 		return 1;
+-- 
+2.55.0
+

---
base-commit: 7eb94107580092f79ff1b639a87762fe6f96aa12
change-id: 20260701-dnsmasq-cve-2026-4890-f5b3a76de3ad

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


