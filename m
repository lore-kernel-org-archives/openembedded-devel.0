Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EDE176D03A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 16:25:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Nov 2013 08:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,729,1378882800"; d="scan'208";a="436093254"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.202])
	by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2013 08:25:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2013 16:25:48 +0000
Message-Id: <1384878348-16319-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-networking][PATCH] lowpan-tools: fix do_install failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2013 16:25:57 -0000

We don't have a proper help2man so building the manpages fails; just
disable building them to fix this as we do elsewhere.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../lowpan-tools/lowpan-tools/no-help2man.patch    | 41 ++++++++++++++++++++++
 .../lowpan-tools/lowpan-tools_git.bb               |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.patch

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.patch
new file mode 100644
index 0000000..9ecd707
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.patch
@@ -0,0 +1,41 @@
+Disable building manpages so that make install doesn't fail due to lack of help2man
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 46c4017..d6ed312 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -9,11 +9,6 @@ izcoordinator_DESC = "simple coordinator for IEEE 802.15.4 network"
+ iz_DESC = "configure an IEEE 802.15.4 interface"
+ izchat_DESC = "simple chat program using IEEE 802.15.4"
+ 
+-if MANPAGES
+-dist_man_MANS = $(manpages)
+-endif
+-EXTRA_DIST = $(manpages)
+-
+ izattach_SOURCES = serial.c
+ 
+ iz_SOURCES = iz.c iz-common.c iz-mac.c iz-phy.c
+@@ -27,18 +22,6 @@ izcoordinator_LDADD = ../addrdb/libaddrdb.la $(LDADD) $(NL_LIBS) $(LEXLIB)
+ iz_CFLAGS = $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE
+ iz_LDADD = $(LDADD) $(NL_LIBS)
+ 
+-izattach.8: $(izattach_SOURCES) $(top_srcdir)/configure.ac
+-	-$(HELP2MAN) -o $@ -s 8 -N -n $(izattach_DESC) $(builddir)/izattach
+-
+-izcoordinator.8: $(izcoordinator_SOURCES) $(top_srcdir)/configure.ac
+-	-$(HELP2MAN) -o $@ -s 8 -N -n $(izcoordinator_DESC) $(builddir)/izcoordinator
+-
+-iz.8: $(iz_SOURCES) $(top_srcdir)/configure.ac
+-	-$(HELP2MAN) -o $@ -s 8 -N -n $(iz_DESC) $(builddir)/iz
+-
+-izchat.1: $(izchat_SOURCES) $(top_srcdir)/configure.ac
+-	-$(HELP2MAN) -o $@ -s 1 -N -n $(izchat_DESC) $(builddir)/izchat
+-
+ install-data-hook:
+ 	$(mkinstalldirs) $(DESTDIR)`dirname $(leasefile)`
+ 	$(mkinstalldirs) $(DESTDIR)`dirname $(pidfile)`
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 152ee49..5fc0de3 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libnl python"
 
 PV = "0.3+git${SRCPV}"
-SRC_URI = "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee"
+SRC_URI = "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee \
+           file://no-help2man.patch"
 SRCREV = "a1d9615adde6d1a568813c24a128273ed755af04"
 
 S = "${WORKDIR}/git"
-- 
1.8.1.2


