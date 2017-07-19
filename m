Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8EE3782F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:41:50 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id t8so345105pgs.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KmHh2EW3cP7bixvqMtBQEWcRiNgEIA7vALbBH5SzQSc=;
	b=Y/RkOc2DQ9N3eqvTFEoKL4s7jfkL7Soa2OyzJszZdyb0s0N/JL7vucnm8hxwFKMaV9
	210+n3vjkmKWnwYGtDxmwtX1c/8SMQQtbquLozAI5M4oa6IDX9ptg8HtjNrsy1PNfnMg
	6lk+3GF5vXyVfFZFIzdMJS2wynNFo6xwOU7bX9kw+mNaivfoUdwQsevr34jQx/M/NSb5
	XUFcjSFvoAAAsyzxGJAt7UfO/AaEg39UljKYB/fkJPbujQsSafM7cy1SjWL3R+qnZX0G
	IWhgjYHsWHqL2IYKuKpta0Wbc7C2PdoOWH3PdU5l9/TD29gwXL5a/ICk9ZwbAm8RXJxt
	6G8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KmHh2EW3cP7bixvqMtBQEWcRiNgEIA7vALbBH5SzQSc=;
	b=MIh6ZEc9BVzKPaE+ziTS3DPTrcQ3QSjsW/8luBGiRskEX/W+FjyQXLRZiTxJumLxHd
	MkWCSz9he7PS0LOor6/nZ73Zw7pQlASyHP2/rVhX88qPiDvGS/pPLKhsv56vUPDj3+5I
	ijmNT+Bea9/X2xBhf82gw8n0/6fV0Q8oaVrpaB63q/Z3IKgwy7iZ17rTq09LuynbDv8p
	txxr7qtbo6DAD1njBurby//biqPeB0UUGXh1YxfXR7ui98L8hqV/7xc9MK15Hed27Obf
	pXoKG1UOKtOKDFu18E9uAd182oN7OolK9xozYPr61f8y33WukWAByOxFRPJuUg+hkU+E
	lW1w==
X-Gm-Message-State: AIVw110CU/wNX+vzsX/oYFAQsSxZh3WgvRQz/X0AILzxhHErSksXG4Vv
	R9TtBmlI2w3Ed5fm
X-Received: by 10.84.173.4 with SMTP id o4mr610278plb.180.1500478911600;
	Wed, 19 Jul 2017 08:41:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b85sm494845pfe.94.2017.07.19.08.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jul 2017 08:41:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 08:41:32 -0700
Message-Id: <20170719154132.20556-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170719154132.20556-1-raj.khem@gmail.com>
References: <20170719154132.20556-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] zeroconf: Fix build with musl
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
X-List-Received-Date: Wed, 19 Jul 2017 15:41:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...name-arp_op-to-avoid-namespace-conflicts-.patch | 69 ++++++++++++++++++++++
 .../recipes-protocols/zeroconf/zeroconf_0.9.bb     |  4 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch b/meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch
new file mode 100644
index 000000000..b4d6d94b0
--- /dev/null
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch
@@ -0,0 +1,69 @@
+From 549773fdaf1fb003b84f25df386a07d299cdeb3e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Jul 2017 21:25:33 -0700
+Subject: [PATCH] zeroconf: Rename arp_op to avoid namespace conflicts with C
+ library
+
+on musl e.g. we get
+In file included from /mnt/a/oe/build/tmp/work/corei7-64-bec-linux-musl/zeroconf/0.9-r1/recipe-sysroot/usr/include/net/ethernet.h:10:0,
+
+This is because in musl arp_op is a define which is included
+and causes the conflict
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ zeroconf.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/zeroconf.c b/zeroconf.c
+index 812d34b..f27e907 100644
+--- a/zeroconf.c
++++ b/zeroconf.c
+@@ -14,8 +14,6 @@
+ 
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <linux/rtnetlink.h>
+-#include <linux/if.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -34,6 +32,8 @@
+ #include <sys/time.h>
+ #include <signal.h>
+ #include <limits.h>
++#include <linux/rtnetlink.h>
++#include <linux/if.h>
+ 
+ #include "delay.h"
+ 
+@@ -108,7 +108,7 @@ int  arp_conflict(struct intf *intf, struct arp_packet *pkt);
+ void arp_packet_dump(struct arp_packet *pkt);
+ void arp_packet_send(int as,
+ 		     struct intf *intf,
+-		     short int arp_op,
++		     short int arpop,
+ 		     int null_sender);
+ void arp_probe(int as, struct intf *intf);
+ void arp_claim(int as, struct intf *intf);
+@@ -1591,7 +1591,7 @@ int  arp_conflict(struct intf *intf, struct arp_packet *pkt)
+ 
+ void arp_packet_send(int as,
+ 		     struct intf *intf,
+-		     short int arp_op,
++		     short int arpop,
+ 		     int null_sender)
+ {
+ 
+@@ -1605,7 +1605,7 @@ void arp_packet_send(int as,
+   ap.arp.ar_pro = htons(ARP_IP_PROTO);
+   ap.arp.ar_hln = ETH_ALEN;
+   ap.arp.ar_pln = 4; /* octets in IPv4 address */
+-  ap.arp.ar_op = htons(arp_op);
++  ap.arp.ar_op = htons(arpop);
+ 
+   /* filling with 0xff sets the destination to
+    * the broadcast link-layer address for free
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index 13f9b9b9a..753d83298 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -20,7 +20,9 @@ SRC_URI = "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-${PV}.tar.g
            file://compilefix.patch \
            file://makefile-add-ldflags.patch \
            file://zeroconf-default \
-           file://debian-zeroconf"
+           file://debian-zeroconf \
+           file://0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch \
+           "
 
 SRC_URI[md5sum] = "bdafb16b008ebb5633e4e581f77821d2"
 SRC_URI[sha256sum] = "a8c74df127753e2310fa1e072f3c9ca44a404bb0bbce9cfec7a84c6dff8bec7b"
-- 
2.13.3


