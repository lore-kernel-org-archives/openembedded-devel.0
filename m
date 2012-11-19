Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TaV6w-00081d-W1
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 18:26:19 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Nov 2012 09:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,280,1352102400"; d="scan'208";a="249506886"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.190])
	by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2012 09:11:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:11:27 +0000
Message-Id: <dc1d4463e8ad193d8b7949f504ddf8664048beb0.1353345006.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353345006.git.paul.eggleton@linux.intel.com>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353345006.git.paul.eggleton@linux.intel.com>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 5/8] vblade: add from OE-Classic, update and tidy up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 17:26:19 -0000

* Update to version 20
* Add LIC_FILES_CHKSUM
* Make LICENSE more accurate
* Set SUMMARY (which sets DESCRIPTION)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-daemons/vblade/files/cross.patch       |   16 ++++++++++++++++
 .../recipes-daemons/vblade/vblade_20.bb            |   20 ++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/vblade/files/cross.patch
 create mode 100644 meta-networking/recipes-daemons/vblade/vblade_20.bb

diff --git a/meta-networking/recipes-daemons/vblade/files/cross.patch b/meta-networking/recipes-daemons/vblade/files/cross.patch
new file mode 100644
index 0000000..481b6fa
--- /dev/null
+++ b/meta-networking/recipes-daemons/vblade/files/cross.patch
@@ -0,0 +1,16 @@
+Remove CC and CFLAGS values, we set these ourselves
+
+Upstream-status: Inappropriate [config]
+
+diff -urN vblade-19.old//makefile vblade-19//makefile
+--- vblade-19.old//makefile	2008-10-08 22:07:40.000000000 +0100
++++ vblade-19//makefile	2008-11-18 19:07:51.700365029 +0000
+@@ -9,8 +9,6 @@
+ mandir = ${sharedir}/man
+ 
+ O=aoe.o bpf.o ${PLATFORM}.o ata.o
+-CFLAGS += -Wall -g -O2
+-CC = gcc
+ 
+ vblade: $O
+ 	${CC} -o vblade $O
diff --git a/meta-networking/recipes-daemons/vblade/vblade_20.bb b/meta-networking/recipes-daemons/vblade/vblade_20.bb
new file mode 100644
index 0000000..2cf7e65
--- /dev/null
+++ b/meta-networking/recipes-daemons/vblade/vblade_20.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Virtual EtherDrive blade AoE target"
+SECTION = "console/network"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${PN}-${PV}.tgz \
+	   file://cross.patch"
+
+SRC_URI[md5sum] = "3c80e4a6bc7d66ae0c235b88cb44bd59"
+SRC_URI[sha256sum] = "c8fe2fc4f2fba8e07e5cfdf17335982584eef2cd5c78bf8b1db93f2b56e7121d"
+
+inherit autotools
+
+do_install() {
+	install -D -m 0755 ${S}/vblade ${D}/${sbindir}/vblade
+	install -D -m 0755 ${S}/vbladed ${D}/${sbindir}/vbladed
+	install -D -m 0644 ${S}/vblade.8 ${D}/${mandir}/man8/vblade.8
+}
+
-- 
1.7.9.5



