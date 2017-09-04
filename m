Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9E977E65
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 17:34:28 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d8so532086pgt.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Sep 2017 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MhOBTfWQOlhAAsm3AmRJUuq6jMGL56IOTg8haqQfG9w=;
	b=AZOgDcNdXHQ2zm5t1JYgdGCIpkTel2W7v7c/+leRZss5omJKhI3ninyw4XB290WBF2
	wO2ts/JgqCJC5C4zsCwZdyHxuDIt2m3hpeOUEk+OB4IZR7fx7lKvIxYOJlZCmLlKVKJC
	vBSIccoxGr9KhwBetRyD4YjAA2G064X87/0MoWeWflJKPzCaCDiT0iwY1D9JGj8BmotT
	vKDvhqFklPxbnwgNxgLliFLiFmMRygWVwzAYGHKTZExCHMQdYOCmkH+7UYOvT+/XwnzZ
	Af2DbrjodFwrnEP1CreJLGuUxSEqNfrjyhcgOiXibnRI2MLLXGm7iHWVokiHzZrLHSbi
	pDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MhOBTfWQOlhAAsm3AmRJUuq6jMGL56IOTg8haqQfG9w=;
	b=li5MzLsW9ITa/Hh5O731LU5hm/W+Jhegl2cxdj545Qe2Ao+UaDsnLCnca/TsRv+ajw
	LqQ3CzrpMBcFD0ghHsB0ZP0kUzdRqMtYpSqGACOZl/7k/WqFIQl7RrTlXabhAmON/qUg
	m/ZInqczuk7ipRP4XmejSAC+43CE2oNWrfl7RLfLfmr3H4GYzMxJkMWJzu82Iq1ZHzMH
	ZAb+8Drk2zUiBJfKQEmDGfMPjSwSp4flT+rYAKGYhUp6deI15suiI8QLtF1lDbAidFk7
	U/+q2PihQVt+e3E4JjyDTIE8FbNvL4gh1fonv0+1jMxnEOhSzcWn5daWYd04x8gDbU/K
	XHmw==
X-Gm-Message-State: AHPjjUju9N9MGF0x+dgEzerZbu4iDuJzQDECqyrhff7bhUWp7TOwFe38
	0/YV1KzJF8lyjd1g
X-Google-Smtp-Source: ADKCNb7yTRVI/Lp15RGz53udfUDVikjAkwDiRqJWyLwIdnOhEKKemNr1e3SCAAoxmrUsLw/1gUY6gw==
X-Received: by 10.84.231.202 with SMTP id g10mr1354212pln.407.1504546469259;
	Mon, 04 Sep 2017 10:34:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	q66sm11078482pfb.132.2017.09.04.10.34.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 10:34:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Sep 2017 10:34:20 -0700
Message-Id: <20170904173420.20442-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904173420.20442-1-raj.khem@gmail.com>
References: <20170904173420.20442-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 2/2] ndisc6: Fix build with clang and update to latest on git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2017 17:34:28 -0000

Change recipe to git and http protocol
Pass PERL variable to configure
Add patches to fix VLAIS
Re-organize structure of recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-replace-VLAIS-with-malloc-free-pair.patch | 124 +++++++++++++++++++++
 .../ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch     |  30 +++++
 .../ndisc6/{ndisc6_1.0.3.bb => ndisc6_git.bb}      |  48 ++++----
 3 files changed, 180 insertions(+), 22 deletions(-)
 create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch
 create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.3.bb => ndisc6_git.bb} (86%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch b/meta-networking/recipes-support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch
new file mode 100644
index 000000000..dc58b5b79
--- /dev/null
+++ b/meta-networking/recipes-support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch
@@ -0,0 +1,124 @@
+From 3a7d5396e633e6c02a4583be7faf3d79d0d33748 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Aug 2017 11:14:41 -0700
+Subject: [PATCH 1/2] replace VLAIS with malloc/free pair
+
+Makes it compatible with non-gnu compilers
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/trace-icmp.c |  7 +++++--
+ src/trace-tcp.c  | 14 ++++++++++----
+ src/trace-udp.c  |  7 +++++--
+ 3 files changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/src/trace-icmp.c b/src/trace-icmp.c
+index 842938e..c76cb54 100644
+--- a/src/trace-icmp.c
++++ b/src/trace-icmp.c
+@@ -43,16 +43,19 @@ send_echo_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
+ 	struct
+ 	{
+ 		struct icmp6_hdr ih;
+-		uint8_t payload[plen - sizeof (struct icmp6_hdr)];
++		uint8_t *payload;
+ 	} packet;
+ 	memset (&packet, 0, plen);
++	packet.payload = malloc(plen - sizeof (struct icmp6_hdr));
+ 
+ 	packet.ih.icmp6_type = ICMP6_ECHO_REQUEST;
+ 	packet.ih.icmp6_id = htons (getpid ());
+ 	packet.ih.icmp6_seq = htons ((ttl << 8) | (n & 0xff));
+ 	(void)port;
+ 
+-	return send_payload (fd, &packet.ih, plen, ttl);
++	ssize_t ret = send_payload (fd, &packet.ih, plen, ttl);
++	free(packet.payload);
++	return ret;
+ }
+ 
+ 
+diff --git a/src/trace-tcp.c b/src/trace-tcp.c
+index 940f918..62d22ff 100644
+--- a/src/trace-tcp.c
++++ b/src/trace-tcp.c
+@@ -54,10 +54,11 @@ send_syn_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
+ 	struct
+ 	{
+ 		struct tcphdr th;
+-		uint8_t payload[plen - sizeof (struct tcphdr)];
++		uint8_t *payload;
+ 	} packet;
+ 
+ 	memset (&packet, 0, sizeof (packet));
++	packet.payload = malloc(plen - sizeof (struct tcphdr));
+ 	packet.th.th_sport = sport;
+ 	packet.th.th_dport = port;
+ 	packet.th.th_seq = htonl ((ttl << 24) | (n << 16) | (uint16_t)getpid ());
+@@ -65,7 +66,9 @@ send_syn_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
+ 	packet.th.th_flags = TH_SYN | (ecn ? (TH_ECE | TH_CWR) : 0);
+ 	packet.th.th_win = htons (TCP_WINDOW);
+ 
+-	return send_payload (fd, &packet, plen, ttl);
++	ssize_t ret = send_payload (fd, &packet, plen, ttl);
++	free(packet.payload);
++	return ret;
+ }
+ 
+ 
+@@ -131,10 +134,11 @@ send_ack_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
+ 	struct
+ 	{
+ 		struct tcphdr th;
+-		uint8_t payload[plen - sizeof (struct tcphdr)];
++		uint8_t *payload;
+ 	} packet;
+ 
+ 	memset (&packet, 0, sizeof (packet));
++	packet.payload = malloc(plen - sizeof (struct tcphdr));
+ 	packet.th.th_sport = sport;
+ 	packet.th.th_dport = port;
+ 	packet.th.th_ack = htonl ((ttl << 24) | (n << 16) | (uint16_t)getpid ());
+@@ -142,7 +146,9 @@ send_ack_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
+ 	packet.th.th_flags = TH_ACK;
+ 	packet.th.th_win = htons (TCP_WINDOW);
+ 
+-	return send_payload (fd, &packet, plen, ttl);
++	ssize_t ret = send_payload (fd, &packet, plen, ttl);
++	free(packet.payload);
++	return ret;
+ }
+ 
+ 
+diff --git a/src/trace-udp.c b/src/trace-udp.c
+index 4adde6b..a6cbb07 100644
+--- a/src/trace-udp.c
++++ b/src/trace-udp.c
+@@ -46,9 +46,10 @@ send_udp_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
+ 	struct
+ 	{
+ 		struct udphdr uh;
+-		uint8_t payload[plen - sizeof (struct udphdr)];
++		uint8_t *payload;
+ 	} packet;
+ 	memset (&packet, 0, plen);
++	packet.payload = malloc(plen - sizeof (struct udphdr));
+ 
+ 	(void)n;
+ 	packet.uh.uh_sport = sport;
+@@ -61,7 +62,9 @@ send_udp_probe (int fd, unsigned ttl, unsigned n, size_t plen, uint16_t port)
+ 	/*if (plen > sizeof (struct udphdr))
+ 		packet.payload[0] = (uint8_t)ttl;*/
+ 
+-	return send_payload (fd, &packet, plen, ttl);
++	ssize_t ret = send_payload (fd, &packet, plen, ttl);
++	free(packet.payload);
++	return ret;
+ }
+ 
+ 
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch b/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch
new file mode 100644
index 000000000..3cc2ba80c
--- /dev/null
+++ b/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch
@@ -0,0 +1,30 @@
+From 2a50154fbce38fd36be7e14f5cd4a8b03c65c72f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Aug 2017 11:15:37 -0700
+Subject: [PATCH 2/2] Do not undef _GNU_SOURCE
+
+There are functions from tcp.h which are under _GNU_SOURCE
+in musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/trace-tcp.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/trace-tcp.c b/src/trace-tcp.c
+index 62d22ff..380008e 100644
+--- a/src/trace-tcp.c
++++ b/src/trace-tcp.c
+@@ -21,7 +21,6 @@
+ # include <config.h>
+ #endif
+ 
+-#undef _GNU_SOURCE
+ #define _DEFAULT_SOURCE 1
+ 
+ #include <string.h>
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
similarity index 86%
rename from meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index 6bc0531b9..e1ab3ae76 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -3,22 +3,32 @@ IPv6 networks, including ndisc6, rdisc6, tcptraceroute6 and traceroute6."
 SECTION = "net"
 HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-# The tcptraceroute6 and tracert6 commands depend on rltraceroute6 to
-# perform the actual trace operation.
-RDEPENDS_${PN}-tcptraceroute6 = "${PN}-rltraceroute6"
-RDEPENDS_${PN}-tracert6 = "${PN}-rltraceroute6"
-RDEPENDS_${PN}-misc += "perl"
-
-SRC_URI = "http://www.remlab.net/files/ndisc6/ndisc6-${PV}.tar.bz2 \
-"
-SRC_URI[md5sum] = "21afdaa3a5a5c1ce50eb7f2b7d795989"
-SRC_URI[sha256sum] = "0f41d6caf5f2edc1a12924956ae8b1d372e3b426bd7b11eed7d38bc974eec821"
+PV = "1.0.4+git${SRCPV}"
+SRCREV = "4c794b5512d23c649def1f94a684225dcbb6ac3e"
+SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http \
+           file://0001-replace-VLAIS-with-malloc-free-pair.patch \
+           file://0002-Do-not-undef-_GNU_SOURCE.patch \
+           "
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+S = "${WORKDIR}/git"
 
 inherit autotools gettext
 
+EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
+
+do_configure_prepend() {
+    ${S}/autogen.sh
+}
+
+do_install_append () {
+    rm -rf ${D}${localstatedir}
+    # Enable SUID bit for applications that need it
+    chmod 4555 ${D}${bindir}/rltraceroute6
+    chmod 4555 ${D}${bindir}/ndisc6
+    chmod 4555 ${D}${bindir}/rdisc6
+}
 ALLOW_EMPTY_${PN} = "1"
 
 # Split into seperate packages since we normal don't want them all
@@ -49,15 +59,9 @@ or IPv4."
 DESCRITPION_${PN}-rdnssd       = "Daemon to autoconfigure the list of DNS \
 servers through slateless IPv6 autoconfiguration."
 
-# We do not run perl during the build, but only use it on the target.
-do_configure_prepend() {
-    export PERL="/usr/bin/perl"
-}
+# The tcptraceroute6 and tracert6 commands depend on rltraceroute6 to
+# perform the actual trace operation.
+RDEPENDS_${PN}-tcptraceroute6 = "${PN}-rltraceroute6"
+RDEPENDS_${PN}-tracert6 = "${PN}-rltraceroute6"
+RDEPENDS_${PN}-misc += "perl"
 
-do_install_append () {
-    rm -rf ${D}${localstatedir}
-    # Enable SUID bit for applications that need it
-    chmod 4555 ${D}${bindir}/rltraceroute6
-    chmod 4555 ${D}${bindir}/ndisc6
-    chmod 4555 ${D}${bindir}/rdisc6
-}
-- 
2.14.1


