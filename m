Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15C4C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 10:27:43 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7675.1783668136927375440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F7TUAXEI;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: lianux.mm@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so768061a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 00:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783668136; x=1784272936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7D3idS7pVI3FqV3Me4xCQJQ5rfnmVyMr0jpG+sUz+c=;
        b=F7TUAXEIIljZ0+Feoqrepb8rkkl84222avYB53++Hwtl77YoTHAepPF8f0SFaE7Syu
         uJRqJgTdrVtp1fLdssJ/PBJP2Z+B/CcZR+rj9deJwNmLJkm6t2+TcIu7yb/2ZI2Abgy4
         qxjwQPcl9GeUwaQMg2NtgQMzadvonqAxaIelA0/Mwu1Wd/2xel54WrfU3xTZgQtOLrZX
         6TAbtzgi0OB172RcNciXgqPACZwVvsxlzU9le3NH+eCWokvETIqgt17gAMLuF3Y8UCPN
         msMofkfUvTxIVvS0UP2+bmcQN8HO8xyi5eu4A8IpcyPNPJEwgrQ6FBgNCZwjt+8XoKhe
         WsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783668136; x=1784272936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7D3idS7pVI3FqV3Me4xCQJQ5rfnmVyMr0jpG+sUz+c=;
        b=U1vzmdLz2s2y5ZxLOxtYmm8dabcksatgfz0wkhfsb69MTHXaccz7z4sfivp3KXSKMg
         yTFbRgx95sOMVv4wZDx/n8L62ZTFd/UdDSPDnZsvWKAgcGxwyrscLuBj/6DWkWbXVj+F
         uM91Vk4aTyQqHMHy2bpl8BFkCdnaiEQNIywmzlWVyFSDHQHRb37jfKoJB5qh6hB/zIWE
         fFyvArsb6kZM7ieC3I/mioXpS1B71XQCCQgBfMmVinboVpmZvi6PzSTAtw8fF6R9HLYF
         ywD3pZCSdwC2Z5DeURhiHHoXPY0q96stiYNSUwlmDRzFXh5OLIDXqsk4uzFGGNTbuJV8
         co2A==
X-Gm-Message-State: AOJu0YznHEQfNwmfAoAE7qTWenHV4wIu/AXYSWYLm84WQPeIiz3z+olK
	c+dptTKq73MFpcp9X9hJswINUq8lrTMylBZarsX/6iTsOE5TNvcvYpG6AB2Xg5uy
X-Gm-Gg: AfdE7cmbi7mfR1H3yYu59yz1Y3OXAjqr8kL1qNHGZ6t36xLdyVOLxgwT9xaSONXTSGb
	wbDuPfFkV6ZjDaDpBTT19qK7nyVDdqeD+UcHiBWeLOhb/9wjoehL/3T/TZbu/hV8spGHetpzstk
	j/zOrbdKjC4xurnF4EWxPdFcC3g/GzeucgS4bxq1wTW62t2jOJ1OwDGs88/rWYLm3wB1OqwjdKn
	dP7dYBJn8NxYKneRUvWnWEhCiYQwMDHyumLH9bfOoVTkrN473JtKelZ9alPA3A6fR/UTu0hOPhD
	3OklI3N712R2eCvme0NluQc3H0UPv2eTWQz/3otit0XRrH5DvnV7YUyebEYRnFGgmQdup3nVoTh
	Qor8wKKGG60w5lUTEgmEEhja0EdsT79vVu8r6KVuvDrz5Wlb49D4BGK1ZNqe6Po8xSOZVyoex6Q
	hkV/9pI14SAW0ucmtn4X5J0l4=
X-Received: by 2002:a05:6a21:7d02:b0:3b4:65ac:e2e3 with SMTP id adf61e73a8af0-3c0bc905534mr11897822637.5.1783668136024;
        Fri, 10 Jul 2026 00:22:16 -0700 (PDT)
Received: from localhost.localdomain ([104.28.163.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm65867111c88.14.2026.07.10.00.22.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 10 Jul 2026 00:22:15 -0700 (PDT)
From: "wang lian" <lianux.mm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Lian Wang <lianux.wang@processmission.com>
Subject: [meta-networking][PATCH] tcpdump: upgrade 4.99.4 -> 4.99.6
Date: Fri, 10 Jul 2026 15:21:59 +0800
Message-ID: <20260710072159.4628-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 10:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128154

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


