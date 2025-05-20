Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB4EC54754
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 01:55:18 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.11233.1747706110864785918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 18:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Wclyh3+H;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30e9397802eso2577415a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 18:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747706110; x=1748310910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qg/1xNmZvX/qOuogntZBYhOGtj81vfkeqZDQdqt8OSc=;
        b=Wclyh3+H0iXpytUls/P3Gmz+KeM8D1pu1r7YWOMeM87k5x0EOd5IsBIuQZHrxn5B74
         rWcB2wKpKAbvJgMsF5/gkdNiCmuDcUeZMQA4BOg2kDSug8I+hYv4ismVvC6jCe1liScq
         fYqGkbA3Xf+v8Q7KVbhHspsLpJs7alTlY3iF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747706110; x=1748310910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qg/1xNmZvX/qOuogntZBYhOGtj81vfkeqZDQdqt8OSc=;
        b=fpkj0cg9wS8MC5y8YwDfbt6xbq9uHnpgCS+L7WNuXFeQRw0wGZYkf6a+wxceuLq+5K
         UEhyGjZXgz9RCMBYsFqi/O4ERyjagax+zARU2KlnS50dD/7lNYHPwYuh+w94sIg4spmn
         eNDPI8U9L/DISX9g2dPK+7tm2UCZGvIy08yKejH26/6CFXckWsUEx8WYToUQc2POIsuU
         8y/KNR+wwJValMZqGDhiKOcpQrLzXUgxM3M5KPOL0T3N3rqhJoPk1mWD98OOf7QY5KY4
         cp9QwwK+STvbrw/6LkNmh4u7uy/U661ALZKoH2eWOKSwTQWUerogGDrT9px8N1zen1zl
         Q0tg==
X-Gm-Message-State: AOJu0YzLTLSLXrP8a0HjPzrkEBRqqpPK9oaaGBidYIfJpY5w6WAJpaPM
	Az9Bze/Yo6YyWtNt9BgJXCq6xDRQY5Q+IsTcO5dAZ9QsWzxkOSA1E9D5t3zFQuz4l1PZH7TvGsQ
	5b+zbvOE=
X-Gm-Gg: ASbGncuRjOjz+su49S8RD45jGVkfl6GaN1cMR45mh14/qKRpxzk3vP1caJCwqWAFOzu
	39dupyHspry/hQ/ACbn4l7zX77SKMr3dFCxRnHYXORz6x3U12nHBJY2JAEMmrshC8tdT5L3+2f0
	bDFGLQNGrjewAAeuoDSX2fDtRGehzgO42rNr4+dueCtosJ/ClzWHakpK1QcKfPccQC9Wzssjj/M
	9bSA6BDOK/Uxb5qcAKCI2vr4rDztKxLkUToiskuVCIgXyoNdF0inLL5Z/zj/vvBABLIDKVHP8Qe
	gku1uIm8C7+QDmW9CCMY5vy8QI2uul4jKpfvAu4OXHcnCtfqvgp+jWEycUOH
X-Google-Smtp-Source: AGHT+IH4up6OuDGebB6DA3Lla81N9/ZzlshwRjVo+kdmyv0y57hPkZXTYtaIae0bIi67GT8ces8B3g==
X-Received: by 2002:a17:90b:2d47:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-30e7d520bfemr25501310a91.14.1747706109697;
        Mon, 19 May 2025 18:55:09 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c31:2b73:37b8:ebca:d2a2:bd97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4e77sm411607a91.12.2025.05.19.18.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 18:55:09 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Tue, 20 May 2025 07:25:04 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] tcpdump: patch CVE-2024-2397
Date: Tue, 20 May 2025 07:25:03 +0530
Message-Id: <20250520015503.2764152-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 01:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117482

Upstream-Status: Backport from https://github.com/the-tcpdump-group/tcpdump/commit/b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../tcpdump/tcpdump/CVE-2024-2397.patch       | 126 ++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.99.4.bb |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
new file mode 100644
index 0000000000..169ec6be70
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
@@ -0,0 +1,126 @@
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
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ print-ppp.c | 31 +++++++++++++++++--------------
+ print.c     |  8 ++++++--
+ 2 files changed, 23 insertions(+), 16 deletions(-)
+
+diff --git a/print-ppp.c b/print-ppp.c
+index 2cf06c363..9aed23eb9 100644
+--- a/print-ppp.c
++++ b/print-ppp.c
+@@ -37,6 +37,8 @@
+ 
+ #include "netdissect-stdinc.h"
+ 
++#include <stdlib.h>
++
+ #include "netdissect.h"
+ #include "extract.h"
+ #include "addrtoname.h"
+@@ -1358,7 +1360,6 @@ ppp_hdlc(netdissect_options *ndo,
+ 	u_char *b, *t, c;
+ 	const u_char *s;
+ 	u_int i, proto;
+-	const void *sb, *se;
+ 
+ 	if (caplen == 0)
+ 		return;
+@@ -1366,9 +1367,11 @@ ppp_hdlc(netdissect_options *ndo,
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
+@@ -1389,13 +1392,15 @@ ppp_hdlc(netdissect_options *ndo,
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
+@@ -1437,13 +1442,11 @@ ppp_hdlc(netdissect_options *ndo,
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
+index b9ba5997d..f20633388 100644
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
2.34.1


