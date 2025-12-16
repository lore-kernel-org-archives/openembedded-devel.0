Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B38D5B87C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:16:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16513.1765869353185528159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKOF4Otv;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so3468191b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869352; x=1766474152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htAbpUKlCc/TR4vGCROwIN8Gc694O1RCQc8DvhYzi+U=;
        b=LKOF4OtvNbRm+NuDJbd8r5kG2CD6lSbKwojhbfYJU/YOWOrisw1GnmCJutDI1jJrPq
         tuMfOBP3U3SueBqDWZwRzVznaJri89ZtJZaprn4CKncs6s4eDdxncInDTFEanV5Ccj8/
         oURwW5BH+QNyS/d3zLFVbQiWvfvFSfdVHzw2J4JhxH1fU0IXdc00IBp7SEuoNjlTuhju
         a1gbNYR0y6lDbI1UL9A9OfQS0j2QiAeMeLsApjP7Xyr6QWb45DFSdGbrz/F9gTEp60Hf
         d3YnjN99Uf5KxWSI4y6wdR758UfTILJZHCUiBbBBsMsi4l8zAnRp1Zs9/OpoQ43ZgirA
         R+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869352; x=1766474152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htAbpUKlCc/TR4vGCROwIN8Gc694O1RCQc8DvhYzi+U=;
        b=OrqdZPxTehZmzAKETlW4vTntDL+z/kGOJklA54lqM5FP7ihjYQ6HdJuSyLCm6/BpzX
         ml628GfSP23RI0c0jA9+bYj86m+sdn9Cqt2mJfwY5rYpEF3mNHHb0D9ctSmZsQnl02iZ
         3T94wXBR1adRSpqwC7ztaciO0xqAP5uXE5GW3cY6YXwskwIzB2/Ry9o2N9HZIPrzXF97
         +/8a9ygLUjXW+30R4KZkRCes3yDJs5QYMlKKiEmf7GHa8RrGLD2pTKdY7w4nJkdH7y4m
         Hsc7/fB4dsk6MPVb08vggO5naFg4Kd1HCEb1zsI8shwEAahI1/qqWyR7xofhUDLMwPH1
         JyGA==
X-Gm-Message-State: AOJu0Yz+t63itTfOrIpJNuqerZh7xcy6F6chFIx7URiXFkJHXpuqd+HU
	eO2Tr6sqRNvqos/kex6EaHjNNmhtBJCGLT2OGcOCHB2JcuZXab9tDZZZT3wHdA==
X-Gm-Gg: AY/fxX559iqpXuP0Lfz6T3qe47ZcF9382mRhQQu8QUJiaEPztJxOqS6cqNypkoZ4Qo1
	dv8/XHAIyMZNbUyyanfnDKXN1NIOJ5nZJ16FMCkZqEeLatMPbmdzdor6ZSoaDRksxLFUmc3vL4P
	LyaceUkmd4qA1X5ztzxyRT+hWKzfEnPHMcvkZkznJcAF6EIBiGoJC0uX9pRuMlcnXN+d3uEReLX
	qz7UXx0aOTimlPoY+fR2qbEW/ZOehdIxFlxBy3uw5zX6zyZgnECbd38vZ36b0Lm12Pbpwel/AIU
	nT795nrgcPv1EfUpiLZIqvzXR3g0sDWnaz4Q6Sjj7cP7fptCLqcIUZl91K/pxckrtSBrNZjjNpR
	zowROqy+24jcAI5hc+gS7Kdv25a5RnBiWif/DNkmGdhwb6EFHrrX2sH2ZycZpxVv/BbFmhMurEb
	sO9L+woWiPJ1t6N36dBaQbmR0P8MxRETVwnB0=
X-Google-Smtp-Source: AGHT+IFFYzY5XCGCdtlGTJE5enSzVGrD4ZcpF/kg1YJBHxtrG3orqwd5g8wWJZtaTR4ZJ3VL5ZWIYw==
X-Received: by 2002:a05:6a00:1d14:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-7f66763cdabmr12835226b3a.2.1765869352392;
        Mon, 15 Dec 2025 23:15:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2d48514sm14471448b3a.30.2025.12.15.23.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:15:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Archana Polampalli <archana.polampalli@windriver.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 5/6] tcpreplay: fix CVE-2025-9157
Date: Tue, 16 Dec 2025 12:45:36 +0530
Message-ID: <20251216071537.3174578-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
References: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122684

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was determined in appneta tcpreplay up to 4.5.2-beta2.
The impacted element is the function untrunc_packet of the file
src/tcpedit/edit_packet.c of the component tcprewrite. Executing
manipulation can lead to use after free. It is possible to launch
the attack on the local host. The exploit has been publicly disclosed
and may be utilized. This patch is called 73008f261f1cdf7a1087dc8759115242696d35da.
Applying a patch is advised to resolve this issue.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 0538af085a47b038e369db9872ffed8945b200c2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tcpreplay/tcpreplay/CVE-2025-9157.patch   | 44 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
new file mode 100644
index 0000000000..e52ec0dffc
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
@@ -0,0 +1,44 @@
+From 73008f261f1cdf7a1087dc8759115242696d35da Mon Sep 17 00:00:00 2001
+From: Fred Klassen <fred.klassen@broadcom.com>
+Date: Mon, 18 Aug 2025 18:35:16 -0700
+Subject: [PATCH] Bug #970 tcprewrite: --fixlen: do not use realloc
+
+No need to realloc if buffer is already proven to be big enough.
+
+CVE: CVE-2025-9157
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/73008f261f1cdf7a1087dc8759115242696d35da]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/tcpedit/edit_packet.c | 1 -
+ src/tcprewrite.c          | 2 ++
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/tcpedit/edit_packet.c b/src/tcpedit/edit_packet.c
+index 1025ff9..f9ade8f 100644
+--- a/src/tcpedit/edit_packet.c
++++ b/src/tcpedit/edit_packet.c
+@@ -558,7 +558,6 @@ untrunc_packet(tcpedit_t *tcpedit,
+          * which seems like a corrupted pcap
+          */
+         if (pkthdr->len > pkthdr->caplen) {
+-            packet = safe_realloc(packet, pkthdr->len + PACKET_HEADROOM);
+             memset(packet + pkthdr->caplen, '\0', pkthdr->len - pkthdr->caplen);
+             pkthdr->caplen = pkthdr->len;
+         } else if (pkthdr->len < pkthdr->caplen) {
+diff --git a/src/tcprewrite.c b/src/tcprewrite.c
+index c9aa52c..ee05a26 100644
+--- a/src/tcprewrite.c
++++ b/src/tcprewrite.c
+@@ -270,6 +270,8 @@ rewrite_packets(tcpedit_t *tcpedit_ctx, pcap_t *pin, pcap_dumper_t *pout)
+
+         if (pkthdr.caplen > MAX_SNAPLEN)
+             errx(-1, "Frame too big, caplen %d exceeds %d", pkthdr.caplen, MAX_SNAPLEN);
++        if (pkthdr.len > MAX_SNAPLEN)
++            errx(-1, "Frame too big, len %d exceeds %d", pkthdr.len, MAX_SNAPLEN);
+         /*
+          * copy over the packet so we can pad it out if necessary and
+          * because pcap_next() returns a const ptr
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index a784190868..866661b4d1 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://CVE-2023-43279.patch \
     file://CVE-2024-22654-0001.patch \
     file://CVE-2024-22654-0002.patch \
+    file://CVE-2025-9157.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"

