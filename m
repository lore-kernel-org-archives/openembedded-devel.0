Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1THmY1-0005Yj-Qe
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Sep 2012 04:12:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8T1xwoi006556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 18:59:59 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Fri, 28 Sep 2012 18:59:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 29 Sep 2012 09:59:55 +0800
Message-ID: <1348883995-19168-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <1348883995-19168-1-git-send-email-jackie.huang@windriver.com>
References: <1348883995-19168-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2 2/2] ptpd: update to 2.2.0
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
X-List-Received-Date: Sat, 29 Sep 2012 02:12:54 -0000
Content-Type: text/plain

ptpd: update to 2.2.0

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ptpd/ptpd-2.2.0/adjust-daemon-name.patch       |   61 ++++++++++++++++++++
 .../ptpd/ptpd-2.2.0/ld-as-needed.patch             |   37 ++++++++++++
 meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |   27 +++++++++
 3 files changed, 125 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.patch
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.patch b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.patch
new file mode 100644
index 0000000..f6934b6
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.patch
@@ -0,0 +1,61 @@
+Patch from http://patch-tracker.debian.org/package/ptpd
+
+Description: Executable name ptpd
+ This patch adjusts the binary executable to be called ptpd instead of ptpd2.
+ Similarly, the man page name is adjusted.
+Author: Roland Stigge <stigge@antcom.de>
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/Makefile |    4 ++--
+ src/ptpd2.8  |    8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index dbbe525..a672625 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -1,4 +1,4 @@
+-# Makefile for ptpd2
++# Makefile for ptpd
+ 
+ #
+ # Compile time defines:
+@@ -42,7 +42,7 @@ CFLAGS += -DPTP_EXPERIMENTAL
+ 
+ LDFLAGS+= -lm -lrt
+ 
+-PROG = ptpd2
++PROG = ptpd
+ SRCS = ptpd.c arith.c bmc.c protocol.c display.c\
+ 	dep/msg.c dep/net.c dep/servo.c dep/startup.c dep/sys.c dep/timer.c
+ 
+diff --git a/src/ptpd2.8 b/src/ptpd2.8
+index c6100f4..21f1906 100644
+--- a/src/ptpd2.8
++++ b/src/ptpd2.8
+@@ -1,9 +1,9 @@
+ .\" -*- nroff -*"
+-.TH ptpd2 8 "January, 2012" "version 2.2.0" "Precision Time Protocol daemon"
++.TH ptpd 8 "January, 2012" "version 2.2.0" "Precision Time Protocol daemon"
+ .SH NAME
+-ptpd2 \- Precision Time Protocol daemon (1588-2008)
++ptpd \- Precision Time Protocol daemon (1588-2008)
+ .SH SYNOPSIS
+-.B ptpd2
++.B ptpd
+ [?]
+ [-B]
+ [-c]
+@@ -182,7 +182,7 @@ run as master without NTP
+ set an initial delay request value
+ .TP
+ .B \-L
+-enable running multiple ptpd2 daemons
++enable running multiple ptpd daemons
+ .TP
+ .B \-j
+ turn off IGMP refresh messages
+-- 
+1.7.4
+
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
new file mode 100644
index 0000000..7d5251b
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
@@ -0,0 +1,37 @@
+Patch from http://patch-tracker.debian.org/package/ptpd
+
+Description: Fix ld --as-needed
+ This patch fixes the order of gcc arguments to fix ld --as-needed
+Author: Roland Stigge <stigge@antcom.de>
+Bug-Debian: http://bugs.debian.org/607583
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index a672625..88a2fc8 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -40,7 +40,7 @@ CFLAGS += -DDBG_SIGUSR2_CHANGE_DEBUG
+ 
+ CFLAGS += -DPTP_EXPERIMENTAL
+ 
+-LDFLAGS+= -lm -lrt
++LIBS += -lm -lrt
+ 
+ PROG = ptpd
+ SRCS = ptpd.c arith.c bmc.c protocol.c display.c\
+@@ -63,7 +63,7 @@ TAGFILES = GPATH GRTAGS GSYMS GTAGS cscope.in.out cscope.out cscope.po.out
+ all: $(PROG)
+ 
+ $(PROG): $(OBJS)
+-	$(CC) -o $@ $(OBJS) $(LDFLAGS)
++	$(CC) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)
+ 
+ $(OBJS): $(HDRS)
+ 
+-- 
+1.7.4
+
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
new file mode 100644
index 0000000..3449ee8
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "The PTP daemon (PTPd)"
+DESCRIPTION = "The PTP daemon (PTPd) implements the Precision Time protocol (PTP) as \
+defined by the relevant IEEE 1588 standard. PTP Version 1 implements IEEE-1588-2002, \
+and PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very precise \
+time coordination of LAN connected computers."
+HOMEPAGE = "http://sourceforge.net/projects/ptpd"
+SECTION = "network"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://../COPYRIGHT;md5=3d8ac2c46c116bce2d2ad838b6cf3491"
+
+SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz \
+           file://adjust-daemon-name.patch;striplevel=2 \
+           file://ld-as-needed.patch;striplevel=2 \
+"
+
+SRC_URI[md5sum] = "c63a3a149d30c710773ccb02df5782a3"
+SRC_URI[sha256sum] = "f2266a22db84318d8b9ce266ea83772c03438c31f4993fa9643fa675a07c26b4"
+
+S = "${WORKDIR}/ptpd-${PV}/src"
+
+EXTRA_OEMAKE = ""
+
+do_install() {
+        install -d ${D}${bindir} ${D}${mandir}/man8
+        install -m 0755 ptpd ${D}${bindir}
+        install -m 0644 ptpd2.8 ${D}${mandir}/man8
+}
-- 
1.7.4



