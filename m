Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.26092.1608483249132431603
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZvEDeIV7;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id iq13so4831603pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5octjt+09FidOd6QFOYj/BzsEzDISFZ5U0VDENyjJ7o=;
        b=ZvEDeIV7FjYvDcsroe+K1g34FYZYEf0wIwYkYoVp2X9rY+5Q8xc6Xx8OwBxVOEbsDO
         j+SJwf1dFwhibzt0GOLRdENUk3RCPchTnhMEUXnNwNHZGPB7jnwNfYlrHBvj/W79WmcF
         5kNoza7SENihOuS564ZiLOOpOBBPlWFhUOzWH24tqhoktjt6hVX6mewkRkKxVDtFz4T8
         9F64Z+UDZYUlNmTko0Fjp3EXd/IkqVbtRq5aJCYSNjPM76V90ccRksc+e1PGWctQoN4r
         A4Vbg5RB5tVDvAagCksySLR3d+ctZyn+fHyY7HHxfyaCUlmxbtHM2Xp8TjUP5ehTYQ74
         +q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5octjt+09FidOd6QFOYj/BzsEzDISFZ5U0VDENyjJ7o=;
        b=U7lV1sSsFisLrC2k6IOUSJ9ooirKPOTm7+XrfD386w2p4djxuZLDIItRmIRVtwjTHA
         dHxDaCB/7KSYvlDccElmZaRU4tlF0bbqwbcMYIVVWHYGFqqDEVmxJInzpXf4UDNGEAkQ
         0XczJ6MVZPV+yfqbqKmMllaZQC9Itzsyp4gmE1TUclHY0Gns8Sc4L43ZaOyADDiVgkPh
         igT1+MaGLv5CyUCg4iPGaIwLsI+/RzfQYquzj8hVqMsk/T3ksM8whceJw149Mzxws9rc
         1CDWkF8GjsBrri/T4xf74lifJuecfTtFZ9B5zuMpYzHKbFRcu3F6p5T17mW17gLllIKA
         qMQA==
X-Gm-Message-State: AOAM530k/x5atZJO33AuzNM6snRnJtb3aBuDh8hnjCG8Slz6q06ms7LN
	eObntouVbBmPn6vBswQ0tlYLS9JuoxLiig==
X-Google-Smtp-Source: ABdhPJyy7PDiTWVpvDLV9iDfWwcE3dQ+ntT2kWDi9HVQVjGDucCg7E5UMp8U4eEEFBFKwtoZtVJE+g==
X-Received: by 2002:a17:90a:b010:: with SMTP id x16mr13574677pjq.74.1608483248487;
        Sun, 20 Dec 2020 08:54:08 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:81b4:28ec:120:f083])
        by smtp.gmail.com with ESMTPSA id j15sm14192234pfn.180.2020.12.20.08.54.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:54:07 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 4/6] tcpdump: Patch for CVE-2020-8037
Date: Sun, 20 Dec 2020 08:53:58 -0800
Message-Id: <5e4601a3f92489dc06cbd9164f40d3600b4be73c.1608483161.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608483161.git.akuster808@gmail.com>
References: <cover.1608483161.git.akuster808@gmail.com>

From: viatsk <viatsk@fastmail.com>

Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ping-don-t-allocate-a-too-large-buff.patch | 70 +++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
new file mode 100644
index 00000000000..9b74e00c5b9
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
@@ -0,0 +1,70 @@
+From 32027e199368dad9508965aae8cd8de5b6ab5231 Mon Sep 17 00:00:00 2001
+From: Guy Harris <guy@alum.mit.edu>
+Date: Sat, 18 Apr 2020 14:04:59 -0700
+Subject: [PATCH] PPP: When un-escaping, don't allocate a too-large buffer.
+
+The buffer should be big enough to hold the captured data, but it
+doesn't need to be big enough to hold the entire on-the-network packet,
+if we haven't captured all of it.
+
+(backported from commit e4add0b010ed6f2180dcb05a13026242ed935334)
+
+Upstream-Status: Backport
+Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
+
+---
+ print-ppp.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/print-ppp.c b/print-ppp.c
+index 89176172..33fb0341 100644
+--- a/print-ppp.c
++++ b/print-ppp.c
+@@ -1367,19 +1367,29 @@ trunc:
+ 	return 0;
+ }
+ 
++/*
++ * Un-escape RFC 1662 PPP in HDLC-like framing, with octet escapes.
++ * The length argument is the on-the-wire length, not the captured
++ * length; we can only un-escape the captured part.
++ */
+ static void
+ ppp_hdlc(netdissect_options *ndo,
+          const u_char *p, int length)
+ {
++	u_int caplen = ndo->ndo_snapend - p;
+ 	u_char *b, *t, c;
+ 	const u_char *s;
+-	int i, proto;
++	u_int i;
++	int proto;
+ 	const void *se;
+ 
++	if (caplen == 0)
++		return;
++
+         if (length <= 0)
+                 return;
+ 
+-	b = (u_char *)malloc(length);
++	b = (u_char *)malloc(caplen);
+ 	if (b == NULL)
+ 		return;
+ 
+@@ -1388,10 +1398,10 @@ ppp_hdlc(netdissect_options *ndo,
+ 	 * Do this so that we dont overwrite the original packet
+ 	 * contents.
+ 	 */
+-	for (s = p, t = b, i = length; i > 0 && ND_TTEST(*s); i--) {
++	for (s = p, t = b, i = caplen; i != 0; i--) {
+ 		c = *s++;
+ 		if (c == 0x7d) {
+-			if (i <= 1 || !ND_TTEST(*s))
++			if (i <= 1)
+ 				break;
+ 			i--;
+ 			c = *s++ ^ 0x20;
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
index 94543dd1dac..8f7bd59f185 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://avoid-absolute-path-when-searching-for-libdlpi.patch \
     file://add-ptest.patch \
     file://run-ptest \
+    file://0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch \
 "
 
 SRC_URI[md5sum] = "a4ead41d371f91aa0a2287f589958bae"
-- 
2.17.1

