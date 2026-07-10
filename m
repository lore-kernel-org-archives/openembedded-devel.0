Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CA5C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:30:04 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8375.1783672198630058901
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 01:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Vn36maqD;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: lianux.mm@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cac59f8b64so7278075ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783672198; x=1784276998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7D3idS7pVI3FqV3Me4xCQJQ5rfnmVyMr0jpG+sUz+c=;
        b=Vn36maqD5dRHq26WGhq948rtLztE1AgPcaBK+rvb2iqaMAjp7exyIDtg3mo3c7W8l7
         S8uCaStOdHXe+dyobtufWaTAzqCKrZg4XmpRMppCAO4DLTypuSGp8sxmrkBn4De2yGtn
         TdHB7DRKMOUiExV9bYkc3d78JVboa9DY+g/JSJ6n1RGPxTZM08+XpeL2oCwXEdHa+XwG
         lUkO9sek84kbV+75iqyTBuWOVMoCNxEpbxM8tkIpM6tOZDxaOP+huJyPYEB87oa2K1Nr
         Ur8GrzNJa+th8eQ/+6usiQLd9eGtZPDLnKYvq0DiD49WJOEW+Bq125A+PNzr0P8fLG+q
         V9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672198; x=1784276998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7D3idS7pVI3FqV3Me4xCQJQ5rfnmVyMr0jpG+sUz+c=;
        b=Iktz3n994wcgqlygDuU8WbCIq4Ur4dWWC2T4zGPXO0a7qB9JBrSwnwBGkHtSbTv6Bf
         EgVzgM2XlzydT5wVRxjLFjJmjAsiz8+MXVxvY8GdBHuubgZyAhdHdL4M8118TNaCflC2
         2MVtaIc1bQdEU1iY7jV8PhzOcMHf92Z+B05iP/WbxlWra0j/n2Qf1+GRBQaU1JjYOPuO
         o4htkxouQ2COjdhi522JOtsEfOnAp5511dqeUCaOoedWIp+j9Lltt/qGwmwHv4l0lERl
         9q1mTeRpuDCTD4l/cdVBO4pxc85cJn1U/9Ix90p4+hd+ZkVdER5zt8FT8LJUn8WnT+so
         xNRA==
X-Gm-Message-State: AOJu0YwVNb7P6vijoQ63692p/zjKhC76YdSsFE5lvIbI2N9lVqElh1PP
	htEasau5beiivKmw+FshAD/VzY2gOzK03KoOaV515FQq2YKmtZXR7CZTmvKomjR6
X-Gm-Gg: AfdE7cmV6MYRIZ8VkVh1upvjVgLI4yTdAksCkUVy8rlNAQAueOaOJqrSN6PpCk78g1m
	40FqB6Fdu4umbcDMGjBHUc6jmFvo+a9oi+dq5dB2StKMcqHv3ZPyuJO68q99cc0hPPy65Bz5tIn
	A9rOaZBFpMRoEOiOj4kIzRwTn2+3PqX2Bu1SwTAZEM4WwzUTOFw84+kgTIOK4ZatDFugLvNzjqo
	tYaIDK/+0ElYS2mGHE0G56vrobRvNFobJxPeOYcKIEqRwHBUs992aoAi1PxP6BgsXEikoCIKYa8
	sP28apZnlQLEJ637DGGqzSnaVjf1tSbAP4VE02dxITnNwcJFGQGaEMJ/IFhxp0iMtplDlnf5Wnx
	4CbV9zef7tOuV3WYufUrT9ATxiUMuPM/ILHLaG/ekIJ7B+CuZ1sikZZwTNh+0ce3zeQlrChTFUh
	nvTAChkfuMvMJzdFS6Bn8piI/osmgGfNN3sA==
X-Received: by 2002:a05:6a21:4a89:b0:3b4:7b2a:6a0a with SMTP id adf61e73a8af0-3c0bd206afdmr13513792637.35.1783672197710;
        Fri, 10 Jul 2026 01:29:57 -0700 (PDT)
Received: from localhost.localdomain ([104.28.163.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm17138047eec.22.2026.07.10.01.29.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 10 Jul 2026 01:29:57 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Lian Wang <lianux.wang@processmission.com>
Subject: [meta-networking] tcpdump: upgrade 4.99.4 -> 4.99.6
Date: Fri, 10 Jul 2026 16:29:50 +0800
Message-ID: <20260710082950.8193-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 08:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128127

From: Lian Wang <lianux.wang@processmission.com>

Drop CVE-2024-2397.patch which is fixed upstream in 4.99.5.

Signed-off-by: Lian Wang <lianux.wang@processmission.com>
---
 .../tcpdump/tcpdump/CVE-2024-2397.patch       | 129 ------------------
 .../{tcpdump_4.99.4.bb => tcpdump_4.99.6.bb}  |   3 +-
 2 files changed, 1 insertion(+), 131 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.4.bb => tcpdump_4.99.6.bb} (91%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
deleted file mode 100644
index 6934803..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2 Mon Sep 17 00:00:00 2001
-From: Guy Harris <gharris@sonic.net>
-Date: Tue, 12 Mar 2024 00:37:23 -0700
-Subject: [PATCH] ppp: use the buffer stack for the de-escaping buffer.
-
-This both saves the buffer for freeing later and saves the packet
-pointer and snapend to be restored when packet processing is complete,
-even if an exception is thrown with longjmp.
-
-This means that the hex/ASCII printing in pretty_print_packet()
-processes the packet data as captured or read from the savefile, rather
-than as modified by the PPP printer, so that the bounds checking is
-correct.
-
-That fixes CVE-2024-2397, which was caused by an exception being thrown
-by the hex/ASCII printer (which should only happen if those routines are
-called by a packet printer, not if they're called for the -X/-x/-A
-flag), which jumps back to the setjmp() that surrounds the packet
-printer.  Hilarity^Winfinite looping ensues.
-
-Also, restore ndo->ndo_packetp before calling the hex/ASCII printing
-routine, in case nd_pop_all_packet_info() didn't restore it.
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/tcpdump/commit/b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2]
-CVE: CVE-2024-2397
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- print-ppp.c | 31 +++++++++++++++++--------------
- print.c     |  8 ++++++--
- 2 files changed, 23 insertions(+), 16 deletions(-)
-
-diff --git a/print-ppp.c b/print-ppp.c
-index aba243d..e5ae064 100644
---- a/print-ppp.c
-+++ b/print-ppp.c
-@@ -42,6 +42,8 @@
- #include <net/if_ppp.h>
- #endif
- 
-+#include <stdlib.h>
-+
- #include "netdissect.h"
- #include "extract.h"
- #include "addrtoname.h"
-@@ -1363,7 +1365,6 @@ ppp_hdlc(netdissect_options *ndo,
- 	u_char *b, *t, c;
- 	const u_char *s;
- 	u_int i, proto;
--	const void *sb, *se;
- 
- 	if (caplen == 0)
- 		return;
-@@ -1371,9 +1372,11 @@ ppp_hdlc(netdissect_options *ndo,
-         if (length == 0)
-                 return;
- 
--	b = (u_char *)nd_malloc(ndo, caplen);
--	if (b == NULL)
--		return;
-+	b = (u_char *)malloc(caplen);
-+	if (b == NULL) {
-+		(*ndo->ndo_error)(ndo, S_ERR_ND_MEM_ALLOC,
-+			"%s: malloc", __func__);
-+	}
- 
- 	/*
- 	 * Unescape all the data into a temporary, private, buffer.
-@@ -1394,13 +1397,15 @@ ppp_hdlc(netdissect_options *ndo,
- 	}
- 
- 	/*
--	 * Change the end pointer, so bounds checks work.
--	 * Change the pointer to packet data to help debugging.
-+	 * Switch to the output buffer for dissection, and save it
-+	 * on the buffer stack so it can be freed; our caller must
-+	 * pop it when done.
- 	 */
--	sb = ndo->ndo_packetp;
--	se = ndo->ndo_snapend;
--	ndo->ndo_packetp = b;
--	ndo->ndo_snapend = t;
-+	if (!nd_push_buffer(ndo, b, b, (u_int)(t - b))) {
-+		free(b);
-+		(*ndo->ndo_error)(ndo, S_ERR_ND_MEM_ALLOC,
-+			"%s: can't push buffer on buffer stack", __func__);
-+	}
- 	length = ND_BYTES_AVAILABLE_AFTER(b);
- 
-         /* now lets guess about the payload codepoint format */
-@@ -1442,13 +1447,11 @@ ppp_hdlc(netdissect_options *ndo,
-         }
- 
- cleanup:
--	ndo->ndo_packetp = sb;
--	ndo->ndo_snapend = se;
-+	nd_pop_packet_info(ndo);
-         return;
- 
- trunc:
--	ndo->ndo_packetp = sb;
--	ndo->ndo_snapend = se;
-+	nd_pop_packet_info(ndo);
- 	nd_print_trunc(ndo);
- }
- 
-diff --git a/print.c b/print.c
-index 9c0ab86..33706b9 100644
---- a/print.c
-+++ b/print.c
-@@ -431,10 +431,14 @@ pretty_print_packet(netdissect_options *ndo, const struct pcap_pkthdr *h,
- 	nd_pop_all_packet_info(ndo);
- 
- 	/*
--	 * Restore the original snapend, as a printer might have
--	 * changed it.
-+	 * Restore the originals snapend and packetp, as a printer
-+	 * might have changed them.
-+	 *
-+	 * XXX - nd_pop_all_packet_info() should have restored the
-+	 * original values, but, just in case....
- 	 */
- 	ndo->ndo_snapend = sp + h->caplen;
-+	ndo->ndo_packetp = sp;
- 	if (ndo->ndo_Xflag) {
- 		/*
- 		 * Print the raw packet data in hex and ASCII.
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
similarity index 91%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
index b05b832..5f61b73 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
@@ -24,10 +24,9 @@ SRC_URI = " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
     file://add-ptest.patch \
     file://run-ptest \
-    file://CVE-2024-2397.patch \
 "
 
-SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea"
+SRC_URI[sha256sum] = "5839921a0f67d7d8fa3dacd9cd41e44c89ccb867e8a6db216d62628c7fd14b09"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.55.0


