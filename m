Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.21301.1610905593103081207
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pqXKf2D6;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id m5so8218196pjv.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jk+qDWv7ti2bxdXXJwVQ6M+7/Bh+11C+4TORJAyEi1Q=;
        b=pqXKf2D6YJH6YngTUITuVMSkdF4otboyQgSNaF5bMYYvPKpDaXmYsJ6v6MaJNGQvim
         SZJQLUb5H8j0qEsnGXnz56LGpfM6kw8XQ9bGAdkM3nUv+m6b7Cxgw/rsmLrI13zWcmVc
         jeqMkCfXis21ks2Q48UgfuCZ2bgRGjIkiXTTqBGTabheSgNa3SzNoT3ACTOrulH9o3wp
         vGBX2Mf0SqklWI/F5pF8DG7/ZYXy7xAi+U+Mtn+KGqgQQavAzbeKG5dibyOZ0nXNceIA
         /ieLY/ofaUfcrKx9NqP2hly74TBhM+xP2pQZLOZkcaLACIzxzaCMTZppzI3RuygZZk+b
         L5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jk+qDWv7ti2bxdXXJwVQ6M+7/Bh+11C+4TORJAyEi1Q=;
        b=dvHsC8cYj0k/puTgaWGHfT7RhEyQ3sucwDECQahFpgTOSkrKFodybH0jb3Hz8/1rpN
         F0Y61V3Ghi/tMvIcOv83MZKY1TrX/mCA4xdqYCU7RIe+7O8o23btWOxNP6TRKGPcPNAW
         ZgqbIC0AoQ8plw8tMeUug6X9tEAN+5155sJlTu85Vgv5KbZZ5kIjaaG0K5AysMtJz6Yw
         W7FZUEplvN5PDCnFRHP44THIEogXvW6qyUMUBTQZINQaW5rvGeHBhjHzKCxRYkirrn0+
         QqhY+zLvT1aypK/21fBqPs3V2UM1NDrgzS/9pyfQ+T6S8IJgbh/wf9xifc07q0nYEFyX
         MsRg==
X-Gm-Message-State: AOAM532WF+9D0MgZYGKsksuMHG3APgaP90/zEyle77cEKp3oz5+f9mQB
	JJoPC+E3tkWFgvq+p5DUyPTiFZWrYtirsw==
X-Google-Smtp-Source: ABdhPJwxy3/+ztgHdfk6sIN/JgsFWxbeCtPrJGTyxCipCgrN9RXHAhojNRNG9F5OzvL67g0tl1ph/g==
X-Received: by 2002:a17:902:b606:b029:da:c8ed:7c2e with SMTP id b6-20020a170902b606b02900dac8ed7c2emr22617814pls.5.1610905592251;
        Sun, 17 Jan 2021 09:46:32 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:31 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/28] tcpdump: Patch for CVE-2020-8037
Date: Sun, 17 Jan 2021 09:45:59 -0800
Message-Id: <27832ef6c02bf71694f5539d42046f148453a49b.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

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
index 0000000000..9b74e00c5b
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
index 94543dd1da..8f7bd59f18 100644
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

