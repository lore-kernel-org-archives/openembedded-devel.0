Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id F35276FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 06:24:43 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 3so7337046pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 22:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uLnVQXwiUndxiGnKKGa0bqzU2k0TDbFhQjqz6G7qAws=;
	b=qrveOQLiyzbRyLNPzkYmZksUk+2q5/IrVZUt9VtE03IlBxi1/ZLcHRH5v7Aelm3/oC
	en3l4lIVU348J2GVNPnlu2dnQAIj5+bxgnFXVzmtoUZfLgpGk3hUi4peghagAAD18to4
	9/M5c0zO/HivcgoqxTO5YhWYz3mnU+6+FDukWtEnP5J/XO9JASmHjM7R6uJtP5yGQlTh
	9e5x7LtHLtuOFY35CBIUWBADSrdBiafRiGoiorTksfQeAmxRiRdyfhfWfXy3ng5tEBHj
	2hTHRD8Yf2FHcpp7pebzrgpThWM0FEc4Kzk5a4KdJNIJe2YALaEEBB7R40pPDUIkGwhF
	obHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uLnVQXwiUndxiGnKKGa0bqzU2k0TDbFhQjqz6G7qAws=;
	b=Afe8++lwYeXh4Yo1hA+z9tlf9ntqR6JJlVj1pJX5O/CtP4ciBy4rlEwuWzdFZRcCTA
	xy0BO69opc9EwBlfJ/nhfUMospmGsbdx4T40jrvWtXRaZ1kkExGebmOap5bbPII2Z3Io
	bUWAcd3ICsKY+eMxNxhgOzCkBUE/xgRcWlks8ciV7dXWjJQGlKGdgo8hz+BT+gQODi81
	whn34qsG/LFqnPwSB1sD/9Ny6pWh1S0qYLB42YuBGR7lJptwwgA32PTW9iEHvUFD0NNf
	z6lY9Dj4j2WOGNDm9P8qk4SOCF0330K0v86V7/97z7icsAlMUNY807o3Z3hOgZS3OLDb
	XAAQ==
X-Gm-Message-State: AKaTC01p3j/uGZkO1gBbRWVkoZsj21stl8d1Ls7RHRfQ7TEKJviOedjiS7h2I++JkGKVLA==
X-Received: by 10.99.127.72 with SMTP id p8mr20760247pgn.183.1480141485188;
	Fri, 25 Nov 2016 22:24:45 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53946299pgp.10.2016.11.25.22.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 22:24:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2016 22:24:35 -0800
Message-Id: <20161126062435.27569-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161126062435.27569-1-raj.khem@gmail.com>
References: <20161126062435.27569-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH V2 4/4] miniupnpd: Add recipe
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
X-List-Received-Date: Sat, 26 Nov 2016 06:24:44 -0000

Add missing dep on libmnl and libnetfilter-conntrack

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../miniupnpd/miniupnpd_2.0.bb                     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb

diff --git a/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
new file mode 100644
index 0000000..bb361a1
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Lightweight UPnP IGD daemon"
+DESCRIPTION = "The miniUPnP daemon is an UPnP IGD (internet gateway device) \
+which provide NAT traversal services to any UPnP enabled client on \
+the network."
+
+SECTION = "networking"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aa71c78c373ccfe0ff207af0cd966d91"
+
+inherit autotools gettext pkgconfig
+
+DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
+
+SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz \
+"
+SRC_URI[md5sum] = "1c07a215dd9b362e75a9efc05e2fb3b4"
+SRC_URI[sha256sum] = "d96aa3a00e0f5490826bba3cb97e68cd27479e5839adac4b9bcb66eae786bfb7"
+
+IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
+
+do_compile() {
+    cd ${S}
+    CONFIG_OPTIONS="${IPV6} --leasefile" ./genconfig.sh
+    oe_runmake -f Makefile.linux
+}
+
+do_install() {
+    install -d ${D}/${sbindir}
+    install ${S}/miniupnpd ${D}/${sbindir}
+    install -d ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/iptables_init.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/iptables_removeall.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/ip6tables_init.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/ip6tables_removeall.sh ${D}/${sysconfdir}/${BPN}
+    install -m 0644 -b ${S}/miniupnpd.conf ${D}/${sysconfdir}/${BPN}
+    install -d ${D}/${sysconfdir}/init.d
+    install ${S}/linux/miniupnpd.init.d.script ${D}/${sysconfdir}/init.d/miniupnpd
+}
-- 
2.10.2


