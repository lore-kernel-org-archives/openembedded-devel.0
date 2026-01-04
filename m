Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4E0C2A074
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 10:39:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40712.1767523129762743954
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 02:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=agv4rNKc;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477770019e4so111161375e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767523128; x=1768127928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0BdsLP0SyISk8g+K6y65QfMbi3f4bvfBs0TxsFnRTo=;
        b=agv4rNKcSB0EEBj4S8hLo8QmkC4RChF3264Hjb5ivpbl3wdveJsXIAtAwkm9memaeW
         Y3+Fzzisz+/sHEPEwFtCiJ18YAN1nCrdVzBnZbXZPjwfJMfNiatiYj3dHG3g2EQ5vxqp
         oiD1kwGpUI3UNC9AeFEaJ5ALjcauTCW8g4P4KpzX0/e19Mr2h/jDttE1phH+dhnXjfx3
         izAwJJCSdRHiI/C0jTgBGnTLBjuBlb4+GbnV/1xMpca0YHW9BogjImhknBdj7Zg0e6rP
         AMGrZ7W85sQAlI2GgRqU7iOFK0DHS0+fsQ9TCK09bHADznKlWh4qWLzc4KQsggJGMbPU
         CnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767523128; x=1768127928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I0BdsLP0SyISk8g+K6y65QfMbi3f4bvfBs0TxsFnRTo=;
        b=QpHD3mW2N7qj+TFEMOErA5UcKJLndSRQ/L+nL5J3YvbzxWtxnjRS84K7R2d9PZDmNv
         OOF2emAEVPl2K0LQh+GH/D3jjksTMSjjCh0klIjVAyCg6oCI5aFodtXqknc7e2JLszh4
         LKF0BEIt8TDtoqQ7Q3KYjyJkizelH1FzUnDkgQR/0l1anL9nqrRekDwzPULn/c31U04j
         SZQuoHad8dxEuokd+Vx3q6WJ7CjDDEDvZOwbQWNuBMD0EXngaszg6wjKu5KrOJPXZzbl
         Gfy2tQBaOfuVCrLnUwNcMJP+0gHga9RPkndGJ4tZxAz5J7ntFCYnF43UB4VV/k6mle1i
         CyBQ==
X-Gm-Message-State: AOJu0Yybn8cHh5t6L/1NhOKxta6StmE+mkvfLIRQGsN53LY6QgXTrEth
	r5PLgadnjV/xyUAsUNlU9NpVew8urXSWbQ+I67P9N9vQU340wm25LYraNyvXTA==
X-Gm-Gg: AY/fxX7gu010PqCCt3qC57GU0xcLxzNGO7qZhji/6BW/u2Jx7qBZUB2mV3BwIOOH8AU
	W0XNPEmHnExz4BzSR6F37kwDjmtETXWDPGrwpspB4BSlErIjBJbf2c/Zrn4F03ZhNe6UlGY/Xtq
	WpQjH6YVQSDkPJrR/1qZUD98JDGjwjLn/ZDJMv1NXRboX3wtw9pk1ew3btU+1tCchcB4ndNyj3Q
	MvRc+C5Dt/HB0CM5coKPrzG2PkQ9fH+FSx12/6kxV28glcQ+rw7YIYYfFhwZ0Cml2HeKGOZUdIO
	eZuOoH3dtSPhY3sbi6GKCJfWp8N3s+z6jiA/gvFqAWxHovPGJRreh0qcI1b6Ai5D3xTLaeYf8ZE
	5f11tKwVH/NNJ1+gMXKgbns2O5wyCuJ4Pd2uvXauD8qSaFAxIbY6Qp6swFMcKHUqWlsMRSOOQ37
	qpzKy9vBxh
X-Google-Smtp-Source: AGHT+IFyXpQ2xAubLatyRnRxgkkHlY1mDYY86p7o2JjGovsUb7cuG1sZkQHggB4QSJSyEwZSFN+3kg==
X-Received: by 2002:a05:600c:620d:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47d19549f5dmr579003775e9.10.1767523128031;
        Sun, 04 Jan 2026 02:38:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm95885178f8f.4.2026.01.04.02.38.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 02:38:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 5/5] lldpd: patch CVE-2021-43612
Date: Sun,  4 Jan 2026 11:38:43 +0100
Message-ID: <20260104103843.3450950-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104103843.3450950-1-skandigraun@gmail.com>
References: <20260104103843.3450950-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 10:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123118

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-43612

Pick the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../lldpd/files/CVE-2021-43612.patch          | 93 +++++++++++++++++++
 .../recipes-daemons/lldpd/lldpd_1.0.8.bb      | 12 +--
 2 files changed, 99 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/CVE-2021-43612.patch

diff --git a/meta-networking/recipes-daemons/lldpd/files/CVE-2021-43612.patch b/meta-networking/recipes-daemons/lldpd/files/CVE-2021-43612.patch
new file mode 100644
index 0000000000..30d416d769
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/CVE-2021-43612.patch
@@ -0,0 +1,93 @@
+From 97ea7541a12540fa6680058f09d47be451275725 Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Sun, 19 Sep 2021 21:18:47 +0200
+Subject: [PATCH] sonmp: fix heap overflow when reading SONMP packets
+
+By sending short SONMP packets, an attacker can make the decoder crash
+by reading too much data on the heap. SONMP packets are fixed in size,
+just ensure we get the enough bytes to contain a SONMP packet.
+
+CVE-2021-43612
+
+CVE: CVE-2021-43612
+Upstream-Status: Backport [https://github.com/lldpd/lldpd/commit/73d42680fce8598324364dbb31b9bc3b8320adf7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/daemon/protocols/sonmp.c |  2 +-
+ src/daemon/protocols/sonmp.h |  2 +-
+ tests/check_sonmp.c          | 10 +++++-----
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/daemon/protocols/sonmp.c b/src/daemon/protocols/sonmp.c
+index d2eed15..6c80cb0 100644
+--- a/src/daemon/protocols/sonmp.c
++++ b/src/daemon/protocols/sonmp.c
+@@ -311,7 +311,7 @@ sonmp_decode(struct lldpd *cfg, char *frame, int s,
+ 
+ 	length = s;
+ 	pos = (u_int8_t*)frame;
+-	if (length < SONMP_SIZE) {
++	if (length < SONMP_SIZE + 2*ETHER_ADDR_LEN + sizeof(u_int16_t)) {
+ 		log_warnx("sonmp", "too short SONMP frame received on %s", hardware->h_ifname);
+ 		goto malformed;
+ 	}
+diff --git a/src/daemon/protocols/sonmp.h b/src/daemon/protocols/sonmp.h
+index 0e60106..ff7a720 100644
+--- a/src/daemon/protocols/sonmp.h
++++ b/src/daemon/protocols/sonmp.h
+@@ -24,7 +24,7 @@
+ #define LLC_ORG_NORTEL { 0x00, 0x00, 0x81 }
+ #define LLC_PID_SONMP_HELLO 0x01a2
+ #define LLC_PID_SONMP_FLATNET 0x01a1
+-#define SONMP_SIZE (2*ETHER_ADDR_LEN + sizeof(u_int16_t) + 8)
++#define SONMP_SIZE 19
+ 
+ struct sonmp_chassis {
+ 	int type;
+diff --git a/tests/check_sonmp.c b/tests/check_sonmp.c
+index 8c7a208..b25f0e2 100644
+--- a/tests/check_sonmp.c
++++ b/tests/check_sonmp.c
+@@ -33,7 +33,7 @@ START_TEST (test_send_sonmp)
+ IEEE 802.3 Ethernet 
+     Destination: Bay-Networks-(Synoptics)-autodiscovery (01:00:81:00:01:00)
+     Source: 5e:10:8e:e7:84:ad (5e:10:8e:e7:84:ad)
+-    Length: 22
++    Length: 19
+ Logical-Link Control
+     DSAP: SNAP (0xaa)
+     IG Bit: Individual
+@@ -55,7 +55,7 @@ Nortel Networks / SynOptics Network Management Protocol
+ IEEE 802.3 Ethernet 
+     Destination: Bay-Networks-(Synoptics)-autodiscovery (01:00:81:00:01:01)
+     Source: 5e:10:8e:e7:84:ad (5e:10:8e:e7:84:ad)
+-    Length: 22
++    Length: 19
+ Logical-Link Control
+     DSAP: SNAP (0xaa)
+     IG Bit: Individual
+@@ -76,13 +76,13 @@ Nortel Networks / SynOptics Network Management Protocol
+ 	*/
+ 	char pkt1[] = {
+ 		0x01, 0x00, 0x81, 0x00, 0x01, 0x00, 0x5e, 0x10,
+-		0x8e, 0xe7, 0x84, 0xad, 0x00, 0x16, 0xaa, 0xaa,
++		0x8e, 0xe7, 0x84, 0xad, 0x00, 0x13, 0xaa, 0xaa,
+ 		0x03, 0x00, 0x00, 0x81, 0x01, 0xa2, 0xac, 0x11,
+ 		0x8e, 0x25, 0x00, 0x00, 0x04, 0x01, 0x0c, 0x03,
+ 		0x01 };
+ 	char pkt2[] = {
+ 		0x01, 0x00, 0x81, 0x00, 0x01, 0x01, 0x5e, 0x10,
+-		0x8e, 0xe7, 0x84, 0xad, 0x00, 0x16, 0xaa, 0xaa,
++		0x8e, 0xe7, 0x84, 0xad, 0x00, 0x13, 0xaa, 0xaa,
+ 		0x03, 0x00, 0x00, 0x81, 0x01, 0xa1, 0xac, 0x11,
+ 		0x8e, 0x25, 0x00, 0x00, 0x04, 0x01, 0x0c, 0x03,
+ 		0x01 };
+@@ -99,7 +99,7 @@ Nortel Networks / SynOptics Network Management Protocol
+ 	chassis.c_id_len = ETHER_ADDR_LEN;
+ 	TAILQ_INIT(&chassis.c_mgmt);
+ 	addr = inet_addr("172.17.142.37");
+-	mgmt = lldpd_alloc_mgmt(LLDPD_AF_IPV4, 
++	mgmt = lldpd_alloc_mgmt(LLDPD_AF_IPV4,
+ 				&addr, sizeof(in_addr_t), 0);
+ 	if (mgmt == NULL)
+ 		ck_abort();
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
index 022bb62dd8..34cde7b929 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e
 
 DEPENDS = "libbsd libevent"
 
-SRC_URI = "\
-    http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
-    file://lldpd.init.d \
-    file://lldpd.default \
-    file://CVE-2023-41910.patch \
-    "
+SRC_URI = "http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
+           file://lldpd.init.d \
+           file://lldpd.default \
+           file://CVE-2023-41910.patch \
+           file://CVE-2021-43612.patch \
+           "
 
 SRC_URI[md5sum] = "000042dbf5b445f750b5ba01ab25c8ba"
 SRC_URI[sha256sum] = "98d200e76e30f6262c4a4493148c1840827898329146a57a34f8f0f928ca3def"

