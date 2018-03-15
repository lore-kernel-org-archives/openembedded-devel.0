Return-Path: <mmovchan@cisco.com>
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 225C46AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 17:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2531; q=dns/txt; s=iport;
	t=1521135858; x=1522345458;
	h=from:to:cc:subject:date:message-id;
	bh=k9QKNxOq3s1qqxdmQOhyQGkxvbBnizS62XwWhfPi69k=;
	b=Bolep8s/k0zw2V4vh/jGOt3bSi0blAcqml3nkFu5ia+tbYuoOnUtRWuC
	Uv+WaEPgtgThbyYqaZq+njINU1dD1z9DpKiXutqOMZFBTo2qKJCv16ev6
	PBMbYt8NNDdb3HT83gw7S2P8W/ghWu2WjEm82iccK6NcrG4MPcXjGBlH3 A=;
X-IronPort-AV: E=Sophos;i="5.48,311,1517875200"; 
   d="scan'208";a="2629310"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 17:44:16 +0000
Received: from KBP1-LHP-F55617.cisco.com (dhcp-10-61-97-215.cisco.com
	[10.61.97.215])
	by aer-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w2FHiFfk026419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Thu, 15 Mar 2018 17:44:16 GMT
From: Mariia Movchan <mmovchan@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Mar 2018 19:46:58 +0200
Message-Id: <20180315174658.6477-1-mmovchan@cisco.com>
X-Mailer: git-send-email 2.15.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: xe-linux-external@cisco.com
Subject: [meta-networking] [PATCH v2] ipcalc: add initial recipe for version 0.2.2
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
X-List-Received-Date: Thu, 15 Mar 2018 17:44:16 -0000

Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
---
 .../0001-Makefile-pass-extra-linker-flags.patch    | 31 ++++++++++++++++++++++
 .../recipes-support/ipcalc/ipcalc_0.2.2.bb         | 22 +++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
 create mode 100644 meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb

diff --git a/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch b/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
new file mode 100644
index 000000000..38d306475
--- /dev/null
+++ b/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
@@ -0,0 +1,31 @@
+From fd80c0599083013a1b583feba5d7473f52b35938 Mon Sep 17 00:00:00 2001
+From: Mariia Movchan <mmovchan@cisco.com>
+Date: Tue, 6 Mar 2018 16:03:39 +0200
+Subject: [PATCH] Makefile: pass extra linker flags
+
+Fixes
+ERROR: QA Issue: No GNU_HASH in the elf binary
+
+Upstream-Status: Pending
+
+Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8beff8f..047f02a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -8,7 +8,7 @@ LIBS?=
+ VERSION=0.2.2
+ CC?=gcc
+ CFLAGS?=-O2 -g -Wall
+-LDFLAGS=$(LIBS)
++LDFLAGS+=$(LIBS)
+ 
+ ifeq ($(USE_GEOIP),yes)
+ ifeq ($(USE_DYN_GEOIP),yes)
+-- 
+2.15.1
+
diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
new file mode 100644
index 000000000..3e278db68
--- /dev/null
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
+HOMEPAGE = "https://github.com/nmav/ipcalc"
+
+SECTION = "net"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "\
+    https://github.com/nmav/ipcalc/archive/${PV}.tar.gz;downloadfilename=ipcalc-${PV}.tar.gz \
+    file://0001-Makefile-pass-extra-linker-flags.patch \
+"
+
+SRC_URI[md5sum] = "343db932a3ad407328920b7430965faf"
+SRC_URI[sha256sum] = "bf1b95eca219e564c85fa4233fe65342963cf3e8a303a7e10b4dd7269c864794"
+
+export USE_GEOIP = "no"
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/ipcalc ${D}/${bindir}
+}
-- 
2.15.1

