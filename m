Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EFCC2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 12:45:48 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.171863.1719319541221420049
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 05:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VD2kWzo0;
 spf=pass (domain: mvista.com, ip: 209.85.128.175, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-632597a42b8so49027607b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719319540; x=1719924340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGQ7F7e+azSpQWObwMfJg5lC0QGU0A4zQQm+OlWmJ3o=;
        b=VD2kWzo04hkQ8/MB8W4f3TTd+wScwjf8nkhMUJH5zSZ7hnkOl0BBDQaQ/kWwcqVH6b
         peyEXAWOxfsJ49XhUlZTvotYgYsBPaX7CsIDSMT+KIgvS1LfyDf/ERvpSoYKcmvDePP+
         sse+IzZSpVgvA8/lWhPYbG9CjEyYtm+dy291U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719319540; x=1719924340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGQ7F7e+azSpQWObwMfJg5lC0QGU0A4zQQm+OlWmJ3o=;
        b=UJYd8c/fZol/j1oJWJxsidxAsTgXvFc4DRmHoVOl0EP04mkfPsq1OgOnhTd/6RKyf8
         fLH81JMczMZqdnicdbBGFRL2ck9pSsl6l7D1L5uPsz1lzze+P0ODsTV/hb81zYywlrzs
         EGt5fOWu4xx1hdhkQo1tXezQU6EG9iBjKzGmHL1Rtkngp9AuKh39QfPLWEcXQtnzzl1u
         I+1qV9+i+inkRa9iDWlFFQRSrN9j8iRjQHkqwYdDLuFat/4mfkNVXEXnE5fj7Q6J1KBh
         UObFD424pUfSCyyM9p3HXFW0q8C3PRQbk+Ennu6ClIpPRV/PWC3pT7Wg/5XYQKA2YCoS
         OV6w==
X-Gm-Message-State: AOJu0Yzw3aOdl1wY1RbL5ev50Hgvuc/NL4iivpPQ+zbPD4jTaMQagttB
	ng+dS1stCiEmn7Nx8tKqjRXWyqQYKSffa1/x0sUFx6uxH1ctpmHH6SSIS/UbBhDAUSqBnRKdL/W
	f
X-Google-Smtp-Source: AGHT+IFKRew5xbAdq1ijLvgT5mEXOx/btMUmLNwbQL58hHZLPtEaBmKWwN+td3/w1c8kyc/Z9WVpBA==
X-Received: by 2002:a0d:dc04:0:b0:627:dfbd:3175 with SMTP id 00721157ae682-643a9af821amr77225957b3.10.1719319540100;
        Tue, 25 Jun 2024 05:45:40 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64538b3b934sm13082257b3.22.2024.06.25.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:45:39 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] tcpdump: fix CVE-2024-2397
Date: Tue, 25 Jun 2024 18:15:31 +0530
Message-Id: <20240625124531.108254-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 12:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111072

Upstream-Status: Backport from https://github.com/the-tcpdump-group/tcpdump/commit/b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../tcpdump/tcpdump/CVE-2024-2397.patch       | 129 ++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.99.4.bb |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
new file mode 100644
index 0000000000..69348030bb
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
@@ -0,0 +1,129 @@
+From b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Tue, 12 Mar 2024 00:37:23 -0700
+Subject: [PATCH] ppp: use the buffer stack for the de-escaping buffer.
+
+This both saves the buffer for freeing later and saves the packet
+pointer and snapend to be restored when packet processing is complete,
+even if an exception is thrown with longjmp.
+
+This means that the hex/ASCII printing in pretty_print_packet()
+processes the packet data as captured or read from the savefile, rather
+than as modified by the PPP printer, so that the bounds checking is
+correct.
+
+That fixes CVE-2024-2397, which was caused by an exception being thrown
+by the hex/ASCII printer (which should only happen if those routines are
+called by a packet printer, not if they're called for the -X/-x/-A
+flag), which jumps back to the setjmp() that surrounds the packet
+printer.  Hilarity^Winfinite looping ensues.
+
+Also, restore ndo->ndo_packetp before calling the hex/ASCII printing
+routine, in case nd_pop_all_packet_info() didn't restore it.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/tcpdump/commit/b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2]
+CVE: CVE-2024-2397
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ print-ppp.c | 31 +++++++++++++++++--------------
+ print.c     |  8 ++++++--
+ 2 files changed, 23 insertions(+), 16 deletions(-)
+
+diff --git a/print-ppp.c b/print-ppp.c
+index aba243d..e5ae064 100644
+--- a/print-ppp.c
++++ b/print-ppp.c
+@@ -42,6 +42,8 @@
+ #include <net/if_ppp.h>
+ #endif
+ 
++#include <stdlib.h>
++
+ #include "netdissect.h"
+ #include "extract.h"
+ #include "addrtoname.h"
+@@ -1363,7 +1365,6 @@ ppp_hdlc(netdissect_options *ndo,
+ 	u_char *b, *t, c;
+ 	const u_char *s;
+ 	u_int i, proto;
+-	const void *sb, *se;
+ 
+ 	if (caplen == 0)
+ 		return;
+@@ -1371,9 +1372,11 @@ ppp_hdlc(netdissect_options *ndo,
+         if (length == 0)
+                 return;
+ 
+-	b = (u_char *)nd_malloc(ndo, caplen);
+-	if (b == NULL)
+-		return;
++	b = (u_char *)malloc(caplen);
++	if (b == NULL) {
++		(*ndo->ndo_error)(ndo, S_ERR_ND_MEM_ALLOC,
++			"%s: malloc", __func__);
++	}
+ 
+ 	/*
+ 	 * Unescape all the data into a temporary, private, buffer.
+@@ -1394,13 +1397,15 @@ ppp_hdlc(netdissect_options *ndo,
+ 	}
+ 
+ 	/*
+-	 * Change the end pointer, so bounds checks work.
+-	 * Change the pointer to packet data to help debugging.
++	 * Switch to the output buffer for dissection, and save it
++	 * on the buffer stack so it can be freed; our caller must
++	 * pop it when done.
+ 	 */
+-	sb = ndo->ndo_packetp;
+-	se = ndo->ndo_snapend;
+-	ndo->ndo_packetp = b;
+-	ndo->ndo_snapend = t;
++	if (!nd_push_buffer(ndo, b, b, (u_int)(t - b))) {
++		free(b);
++		(*ndo->ndo_error)(ndo, S_ERR_ND_MEM_ALLOC,
++			"%s: can't push buffer on buffer stack", __func__);
++	}
+ 	length = ND_BYTES_AVAILABLE_AFTER(b);
+ 
+         /* now lets guess about the payload codepoint format */
+@@ -1442,13 +1447,11 @@ ppp_hdlc(netdissect_options *ndo,
+         }
+ 
+ cleanup:
+-	ndo->ndo_packetp = sb;
+-	ndo->ndo_snapend = se;
++	nd_pop_packet_info(ndo);
+         return;
+ 
+ trunc:
+-	ndo->ndo_packetp = sb;
+-	ndo->ndo_snapend = se;
++	nd_pop_packet_info(ndo);
+ 	nd_print_trunc(ndo);
+ }
+ 
+diff --git a/print.c b/print.c
+index 9c0ab86..33706b9 100644
+--- a/print.c
++++ b/print.c
+@@ -431,10 +431,14 @@ pretty_print_packet(netdissect_options *ndo, const struct pcap_pkthdr *h,
+ 	nd_pop_all_packet_info(ndo);
+ 
+ 	/*
+-	 * Restore the original snapend, as a printer might have
+-	 * changed it.
++	 * Restore the originals snapend and packetp, as a printer
++	 * might have changed them.
++	 *
++	 * XXX - nd_pop_all_packet_info() should have restored the
++	 * original values, but, just in case....
+ 	 */
+ 	ndo->ndo_snapend = sp + h->caplen;
++	ndo->ndo_packetp = sp;
+ 	if (ndo->ndo_Xflag) {
+ 		/*
+ 		 * Print the raw packet data in hex and ASCII.
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
index 803a9bb5f5..b05b832dd8 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
     file://add-ptest.patch \
     file://run-ptest \
+    file://CVE-2024-2397.patch \
 "
 
 SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea"
-- 
2.25.1


