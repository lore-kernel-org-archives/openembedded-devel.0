Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A30C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 13:59:22 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.74821.1752487833266040324
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 03:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+qm61ip;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: sanakazi720@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so3255649a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752487832; x=1753092632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3Mh8PIvR5sYnMpDJzqkBWSnQUJeO7k8YW1dYaqeKew=;
        b=H+qm61ipR2Gdi35xWtGbB1E5Vv2j0vPU3PJF5wMIpl+vPMl7Luiyw2aP/IxYhCQhtE
         hrN/NRtpyjICVHgwPl1s6at7ndZhpZSZgjkiTybNomo3cyyiM2mGepyBo6qiDaFf64la
         HhVx+eCjsDovIGMg8IiUdIcOxk7xrZX092F9T6ou2TgzfsbSeU96/edt7/5y97tLCtmd
         1PypLPQOjEq8pY4QP4ksBgvvCcVgMCzoIRqZJLI8wGEVZlF3EZFz53MMIJf+H85p00F1
         E8Vtymt40kp2qLHk+tnkegzASnT8pJFK6PDk8TLcn/yqY/m6uJPj4bIwvzAnb8D2Dg4K
         bEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752487832; x=1753092632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3Mh8PIvR5sYnMpDJzqkBWSnQUJeO7k8YW1dYaqeKew=;
        b=WMxkEZMmg0ZFBsA5RwvQs3S0r1afXsyiqRCjrwkFKCSLX2OliBUoMPO2WemfwnwKAK
         toeKZvAiHnPl1HJl9MdeXX64s6CQoMXi/a1INYgZEMvNGumJUvXMefLFf8oRlFwUgckX
         ckY912pBJqIz6iqaYOjFJwrqxszTBDdLe++NBzUuYQBmgnjPO2TSLKCeXT1Kg+VHnUjt
         MAh2yBHNy2UPNBNo17vS3Niio9TjWCae+aOJJgajah+BpdldkGdhYuWXt9o4iRzchylb
         IjJ9tCdyh6onhW6uK8K7ZCTBfZtQN9qHZVjPON11Ig3mwBkurqnL94Pwi/W31gi84vjy
         Zjrg==
X-Gm-Message-State: AOJu0YzWcJzzF0ZxlCHsePI4ZZmPFtpt63rVZECxhKGwPB5kQP5wALN4
	naM/y8Ft49zZwoOziPjf9bSYgBtFhGHOoECUcTG1ZbRKSWoR31boviKCno5piA==
X-Gm-Gg: ASbGnctLpDKGZ98VvmThtrXKvok8ErQac4GkLTvu8xLkV3Io7v/Ea70F5WJy4QvBwzj
	CtbOi7M4JSds9jOfVY5hyXX9IAfqu5RZ9zEtOtRKfqCZzQj106q7gJ4reHmiBwBbEarcL7Lj9tq
	QqJL8jJmZvdC8bis2Wd7+jRhOY9Ibk7T5RNXGmmwP7tzjvQtkDiCy/d+OdEeynnMgornflH1gNi
	qWk2lHebFXMXgdnbBJvasSF/Ni4264YAs3NC54xudXUu1DnJmDOnOgXtgq7mwtgoVv3u2WPGgia
	dTvo+INDd6w6JXIAaUEQPbyoranC01wfkqRUTn6yt362oZDevT2TAqI70c0mgJHq0WQFi5jM5aM
	s+3/NWuCmdd2hFuIMfcvdpZqRPYPdsw7ALBlXwYtH2g==
X-Google-Smtp-Source: AGHT+IEv5rlKNrRtlpSZaTIHawuO/uWoNGWLJqg51BQ+unVjh0wfNJBlXFjjg+VXiLch9FlL98yf0g==
X-Received: by 2002:a17:90b:580c:b0:311:ad7f:3299 with SMTP id 98e67ed59e1d1-31c4cd9d001mr19310195a91.25.1752487832114;
        Mon, 14 Jul 2025 03:10:32 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c16:109b:9344:598d:802f:7ba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm6714341a91.1.2025.07.14.03.10.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 03:10:31 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCH] tcpdump: Fix patch-fuzz issue
Date: Mon, 14 Jul 2025 15:40:20 +0530
Message-Id: <20250714101020.411942-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 13:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118535

Fix patch-fuzz for CVE-2024-2397.patch

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../tcpdump/tcpdump/CVE-2024-2397.patch       | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
index 169ec6be70..1207362b91 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
@@ -1,4 +1,4 @@
-From b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2 Mon Sep 17 00:00:00 2001
+From 732d375501d687812866da0602457109a2088254 Mon Sep 17 00:00:00 2001
 From: Guy Harris <gharris@sonic.net>
 Date: Tue, 12 Mar 2024 00:37:23 -0700
 Subject: [PATCH] ppp: use the buffer stack for the de-escaping buffer.
@@ -29,20 +29,25 @@ Signed-off-by: Ashish Sharma <asharma@mvista.com>
  print.c     |  8 ++++++--
  2 files changed, 23 insertions(+), 16 deletions(-)
 
+---
+ print-ppp.c | 31 +++++++++++++++++--------------
+ print.c     |  8 ++++++--
+ 2 files changed, 23 insertions(+), 16 deletions(-)
+
 diff --git a/print-ppp.c b/print-ppp.c
-index 2cf06c363..9aed23eb9 100644
+index aba243d..e5ae064 100644
 --- a/print-ppp.c
 +++ b/print-ppp.c
-@@ -37,6 +37,8 @@
- 
- #include "netdissect-stdinc.h"
+@@ -42,6 +42,8 @@
+ #include <net/if_ppp.h>
+ #endif
  
 +#include <stdlib.h>
 +
  #include "netdissect.h"
  #include "extract.h"
  #include "addrtoname.h"
-@@ -1358,7 +1360,6 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1363,7 +1365,6 @@ ppp_hdlc(netdissect_options *ndo,
  	u_char *b, *t, c;
  	const u_char *s;
  	u_int i, proto;
@@ -50,7 +55,7 @@ index 2cf06c363..9aed23eb9 100644
  
  	if (caplen == 0)
  		return;
-@@ -1366,9 +1367,11 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1371,9 +1372,11 @@ ppp_hdlc(netdissect_options *ndo,
          if (length == 0)
                  return;
  
@@ -65,7 +70,7 @@ index 2cf06c363..9aed23eb9 100644
  
  	/*
  	 * Unescape all the data into a temporary, private, buffer.
-@@ -1389,13 +1392,15 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1394,13 +1397,15 @@ ppp_hdlc(netdissect_options *ndo,
  	}
  
  	/*
@@ -87,7 +92,7 @@ index 2cf06c363..9aed23eb9 100644
  	length = ND_BYTES_AVAILABLE_AFTER(b);
  
          /* now lets guess about the payload codepoint format */
-@@ -1437,13 +1442,11 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1442,13 +1447,11 @@ ppp_hdlc(netdissect_options *ndo,
          }
  
  cleanup:
@@ -104,7 +109,7 @@ index 2cf06c363..9aed23eb9 100644
  }
  
 diff --git a/print.c b/print.c
-index b9ba5997d..f20633388 100644
+index 9c0ab86..33706b9 100644
 --- a/print.c
 +++ b/print.c
 @@ -431,10 +431,14 @@ pretty_print_packet(netdissect_options *ndo, const struct pcap_pkthdr *h,
-- 
2.25.1


