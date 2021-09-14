Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
 by mx.groups.io with SMTP id smtpd.web10.291.1631653042975872869
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 13:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=JPC7lRje;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.73, mailfrom: 3sqxbyqmkan4wakgoogle.com@flex--wak.bounces.google.com)
Received: by mail-qv1-f73.google.com with SMTP id u6-20020ad449a6000000b003798010ad14so994590qvx.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=qM8VzY62YdxYSZ1A1pW5f8HWBGpD/gDRgm8DOHxK4D8=;
        b=JPC7lRje55zGDJDlM2qb1vFd3FqGJSb5IQiCabGxYeKMk0i6H/HlpjZCFMFzXXsH3o
         PzntWgvePN6+u1cHklUFhpwvo5XMHJbC9G6rH5gH4x/gS7yqmpVhTBowoxxRszTEKhWR
         h37dRMBokC2btAkdjmpYwJEDrHbH5q3GkJqkZgMoiDo63TmVvAid0MvIzW6VXKVAt7gD
         w8zsUB1y8N6J9Bvs8SdP0HAWwNlDTlKLh54Mve0Sl+soV5iSRrJU0bmxq9OrJyWHpMgE
         Tgj9Xr8P76xHkSxqAiXaS8Sbr6bPl+g99TFGk62F00BXqMVcnQyVzLEXJ5XI0fPP5kHp
         qoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=qM8VzY62YdxYSZ1A1pW5f8HWBGpD/gDRgm8DOHxK4D8=;
        b=fjzSqWGlMixQjyVafizUNMhNmtieVYvCeKXjKLuBrlAlBNtxl0IrmlHXjtmWLz+FL9
         5M/fMcVk0btHjzjrl8fBSellI6CPXfS/0xKfJU2lj+2Lg4F7OJEQftTAzQOhdJomRG10
         MFatA4SMzC8fvAUfA/nL+qptnMYxdRwR0yRUZCAnBXrIv/pMtpUfbptXhvNMZhKn97oU
         gGVAZTk3JtScxpBswG2B0RGt5/tzAB0+McFDNLr+vTn/wpQwOSYTSDJlNeiR/Otac3TN
         a0AvHabxWoFzZ2E0KRYesYzLmQ3JrrSS1Ga/LQfrhQu2wgWjtb8fUF5XPjERrLl1NJy2
         kA5Q==
X-Gm-Message-State: AOAM532K+f3SEyYDEoS17jsYZDvM+DM4Qswf7slL+3jsI3PZe/puF5mI
	d2LPYLNZGDv8ddXoKg4Izr/sMv/hTb+LE42hV/2Nf2/ilRy8qbUaLGKXOe6/brO/0WtomYbaGMR
	LZ3j55R9dLv01BRPnGBeI17L5hr/xcooTrIuElK8MjDhXbtEFXU8kEXoM0+nZv2mHbQLzca2yzm
	D7m7A=
X-Google-Smtp-Source: ABdhPJyfvci/Sl9ka8pAk7658SHt1HNi8SlZ7f79eSAubiWEQF5k5xC8B4794pcxw1zcLEWvvEjg0tA=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2c5:13:ceb9:3bb:4c36:65a5])
 (user=wak job=sendgmr) by 2002:a05:6214:5281:: with SMTP id
 kj1mr7818851qvb.29.1631653041691; Tue, 14 Sep 2021 13:57:21 -0700 (PDT)
Date: Tue, 14 Sep 2021 13:57:13 -0700
Message-Id: <20210914205713.439035-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [meta-oe][PATCH] ndisc6: Upgrade 1.0.4 -> 1.0.5
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

STABLE RELEASE 1.0.5:
 - Add --no-solicit option to skip sending the discovery packet.
 - Ignore multicast advertisements when discovery was sent as unicast

Signed-off-by: William A. Kennington III <wak@google.com>
---
 ...-replace-VLAIS-with-malloc-free-pair.patch | 124 ------------------
 .../0002-Do-not-undef-_GNU_SOURCE.patch       |  30 -----
 .../recipes-support/ndisc6/ndisc6_git.bb      |   6 +-
 3 files changed, 2 insertions(+), 158 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch
 delete mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch b/meta-networking/recipes-support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch
deleted file mode 100644
index dc58b5b79..000000000
--- a/meta-networking/recipes-support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 3a7d5396e633e6c02a4583be7faf3d79d0d33748 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Aug 2017 11:14:41 -0700
-Subject: [PATCH 1/2] replace VLAIS with malloc/free pair
-
-Makes it compatible with non-gnu compilers
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/trace-icmp.c |  7 +++++--
- src/trace-tcp.c  | 14 ++++++++++----
- src/trace-udp.c  |  7 +++++--
- 3 files changed, 20 insertions(+), 8 deletions(-)
-
-diff --git a/src/trace-icmp.c b/src/trace-icmp.c
-index 842938e..c76cb54 100644
---- a/src/trace-icmp.c
-+++ b/src/trace-icmp.c
-@@ -43,16 +43,19 @@ send_echo_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
- 	struct
- 	{
- 		struct icmp6_hdr ih;
--		uint8_t payload[plen - sizeof (struct icmp6_hdr)];
-+		uint8_t *payload;
- 	} packet;
- 	memset (&packet, 0, plen);
-+	packet.payload = malloc(plen - sizeof (struct icmp6_hdr));
- 
- 	packet.ih.icmp6_type = ICMP6_ECHO_REQUEST;
- 	packet.ih.icmp6_id = htons (getpid ());
- 	packet.ih.icmp6_seq = htons ((ttl << 8) | (n & 0xff));
- 	(void)port;
- 
--	return send_payload (fd, &packet.ih, plen, ttl);
-+	ssize_t ret = send_payload (fd, &packet.ih, plen, ttl);
-+	free(packet.payload);
-+	return ret;
- }
- 
- 
-diff --git a/src/trace-tcp.c b/src/trace-tcp.c
-index 940f918..62d22ff 100644
---- a/src/trace-tcp.c
-+++ b/src/trace-tcp.c
-@@ -54,10 +54,11 @@ send_syn_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
- 	struct
- 	{
- 		struct tcphdr th;
--		uint8_t payload[plen - sizeof (struct tcphdr)];
-+		uint8_t *payload;
- 	} packet;
- 
- 	memset (&packet, 0, sizeof (packet));
-+	packet.payload = malloc(plen - sizeof (struct tcphdr));
- 	packet.th.th_sport = sport;
- 	packet.th.th_dport = port;
- 	packet.th.th_seq = htonl ((ttl << 24) | (n << 16) | (uint16_t)getpid ());
-@@ -65,7 +66,9 @@ send_syn_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
- 	packet.th.th_flags = TH_SYN | (ecn ? (TH_ECE | TH_CWR) : 0);
- 	packet.th.th_win = htons (TCP_WINDOW);
- 
--	return send_payload (fd, &packet, plen, ttl);
-+	ssize_t ret = send_payload (fd, &packet, plen, ttl);
-+	free(packet.payload);
-+	return ret;
- }
- 
- 
-@@ -131,10 +134,11 @@ send_ack_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
- 	struct
- 	{
- 		struct tcphdr th;
--		uint8_t payload[plen - sizeof (struct tcphdr)];
-+		uint8_t *payload;
- 	} packet;
- 
- 	memset (&packet, 0, sizeof (packet));
-+	packet.payload = malloc(plen - sizeof (struct tcphdr));
- 	packet.th.th_sport = sport;
- 	packet.th.th_dport = port;
- 	packet.th.th_ack = htonl ((ttl << 24) | (n << 16) | (uint16_t)getpid ());
-@@ -142,7 +146,9 @@ send_ack_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
- 	packet.th.th_flags = TH_ACK;
- 	packet.th.th_win = htons (TCP_WINDOW);
- 
--	return send_payload (fd, &packet, plen, ttl);
-+	ssize_t ret = send_payload (fd, &packet, plen, ttl);
-+	free(packet.payload);
-+	return ret;
- }
- 
- 
-diff --git a/src/trace-udp.c b/src/trace-udp.c
-index 4adde6b..a6cbb07 100644
---- a/src/trace-udp.c
-+++ b/src/trace-udp.c
-@@ -46,9 +46,10 @@ send_udp_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
- 	struct
- 	{
- 		struct udphdr uh;
--		uint8_t payload[plen - sizeof (struct udphdr)];
-+		uint8_t *payload;
- 	} packet;
- 	memset (&packet, 0, plen);
-+	packet.payload = malloc(plen - sizeof (struct udphdr));
- 
- 	(void)n;
- 	packet.uh.uh_sport = sport;
-@@ -61,7 +62,9 @@ send_udp_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
- 	/*if (plen > sizeof (struct udphdr))
- 		packet.payload[0] = (uint8_t)ttl;*/
- 
--	return send_payload (fd, &packet, plen, ttl);
-+	ssize_t ret = send_payload (fd, &packet, plen, ttl);
-+	free(packet.payload);
-+	return ret;
- }
- 
- 
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch b/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch
deleted file mode 100644
index 3cc2ba80c..000000000
--- a/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2a50154fbce38fd36be7e14f5cd4a8b03c65c72f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Aug 2017 11:15:37 -0700
-Subject: [PATCH 2/2] Do not undef _GNU_SOURCE
-
-There are functions from tcp.h which are under _GNU_SOURCE
-in musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/trace-tcp.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/trace-tcp.c b/src/trace-tcp.c
-index 62d22ff..380008e 100644
---- a/src/trace-tcp.c
-+++ b/src/trace-tcp.c
-@@ -21,7 +21,6 @@
- # include <config.h>
- #endif
- 
--#undef _GNU_SOURCE
- #define _DEFAULT_SOURCE 1
- 
- #include <string.h>
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index d1e006c08..fdacd4143 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -5,11 +5,9 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PV = "1.0.4+git${SRCPV}"
-SRCREV = "4c794b5512d23c649def1f94a684225dcbb6ac3e"
+PV = "1.0.5+git${SRCPV}"
+SRCREV = "b706f5f01aa82aa0db678fffd15a1527f330c50"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http \
-           file://0001-replace-VLAIS-with-malloc-free-pair.patch \
-           file://0002-Do-not-undef-_GNU_SOURCE.patch \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "
 
-- 
2.33.0.309.g3052b89438-goog

