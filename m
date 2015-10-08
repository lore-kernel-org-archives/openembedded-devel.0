Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id ACD8165CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 07:58:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="101473129"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Oct 2015 16:01:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t987wPqE020032
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Oct 2015 15:58:25 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 8 Oct 2015 15:58:49 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Oct 2015 15:58:35 +0800
Message-ID: <1444291115-1950-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] iptraf: add new recipe
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
X-List-Received-Date: Thu, 08 Oct 2015 07:58:54 -0000
Content-Type: text/plain

From: Li Xin <lixin.fnst@cn.fujitsu.com>

IPTraf is a console-based network statistics utility for Linux.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../0001-src-Fix-error-in-cross-compile.patch      | 138 +++++++++++++++++++++
 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb    |  33 +++++
 2 files changed, 171 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile.patch
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile.patch b/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile.patch
new file mode 100644
index 0000000..291ed31
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile.patch
@@ -0,0 +1,138 @@
+From 27910ea19260b7f7a3f9c0465addd1dea80cf3bd Mon Sep 17 00:00:00 2001
+From: Li Xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 8 Oct 2015 15:11:17 +0900
+Subject: [PATCH] src: Fix error in cross-compile
+
+The errors are like this:
+tcptable.h:26:25: fatal error: linux/if_tr.h: No such file or directory
+ld: cannot find -ltextbox
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ src/Makefile     | 2 +-
+ src/hostmon.c    | 2 +-
+ src/install.sh   | 4 ++--
+ src/othptab.c    | 2 +-
+ src/packet.c     | 2 +-
+ src/tcptable.h   | 2 +-
+ src/tr.c         | 2 +-
+ support/Makefile | 3 +--
+ 8 files changed, 9 insertions(+), 10 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 2043c2d..0f77bea 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -39,7 +39,7 @@ LDOPTS		= #-static
+ # you may want to change this to point to your ncurses include directory
+ # if the ncurses include files are not in the default location.
+ 
+-INCLUDEDIR	= -I/usr/include/ncurses -I../support
++INCLUDEDIR	=  -I../support
+ 
+ # You can uncomment this one to disable the backspace key in input fields.
+ # This means you must use the Del key or Ctrl+H combination to erase the
+diff --git a/src/hostmon.c b/src/hostmon.c
+index 14df2c8..6571562 100644
+--- a/src/hostmon.c
++++ b/src/hostmon.c
+@@ -31,7 +31,7 @@ details.
+ #include <linux/if_packet.h>
+ #include <linux/if_ether.h>
+ #include <linux/if_fddi.h>
+-#include <linux/if_tr.h>
++#include <netinet/if_tr.h>
+ #include <net/if_arp.h>
+ #include <stdlib.h>
+ #include <time.h>
+diff --git a/src/install.sh b/src/install.sh
+index d2fd360..36d3516 100755
+--- a/src/install.sh
++++ b/src/install.sh
+@@ -23,9 +23,9 @@ echo
+ echo "*** Installing executable programs and preparing work directories"
+ echo
+ echo ">>> Installing iptraf in $TARGET"
+-$INSTALL -m 0700 -o root -g root -s iptraf $TARGET
++$INSTALL -m 0700 -o root -g root  iptraf $TARGET
+ echo ">>> Installing rvnamed in $TARGET"
+-$INSTALL -m 0700 -o root -g root -s rvnamed $TARGET
++$INSTALL -m 0700 -o root -g root  rvnamed $TARGET
+ 
+ if [ ! -d $WORKDIR ]; then
+     echo ">>> Creating IPTraf work directory $WORKDIR"
+diff --git a/src/othptab.c b/src/othptab.c
+index 97771d1..a8bb536 100644
+--- a/src/othptab.c
++++ b/src/othptab.c
+@@ -18,7 +18,7 @@ details.
+ 
+ #include <asm/types.h>
+ #include <linux/if_ether.h>
+-#include <linux/if_tr.h>
++#include <netinet/if_tr.h>
+ #include <linux/if_fddi.h>
+ #include <winops.h>
+ #include "arphdr.h"
+diff --git a/src/packet.c b/src/packet.c
+index 33fdf2a..1e2b81b 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -36,7 +36,7 @@ details.
+ #include <linux/if_packet.h>
+ #include <linux/if_ether.h>
+ #include <linux/if_fddi.h>
+-#include <linux/if_tr.h>
++#include <netinet/if_tr.h>
+ #include <linux/isdn.h>
+ #include <linux/sockios.h>
+ #include <msgboxes.h>
+diff --git a/src/tcptable.h b/src/tcptable.h
+index 3e17793..d1380b5 100644
+--- a/src/tcptable.h
++++ b/src/tcptable.h
+@@ -23,7 +23,7 @@
+ #include <linux/if_packet.h>
+ #include <linux/if_ether.h>
+ #include <linux/if_fddi.h>
+-#include <linux/if_tr.h>
++#include <netinet/if_tr.h>
+ #include <net/if.h>
+ #include <netinet/ip.h>
+ #include <netinet/udp.h>
+diff --git a/src/tr.c b/src/tr.c
+index 40c9e63..11f8045 100644
+--- a/src/tr.c
++++ b/src/tr.c
+@@ -7,7 +7,7 @@
+  */
+ 
+ #include <asm/types.h>
+-#include <linux/if_tr.h>
++#include <netinet/if_tr.h>
+ #include <netinet/in.h>
+ 
+ unsigned int get_tr_ip_offset(unsigned char *pkt)
+diff --git a/support/Makefile b/support/Makefile
+index 114bfc3..c962c09 100644
+--- a/support/Makefile
++++ b/support/Makefile
+@@ -1,4 +1,3 @@
+-INCLUDEDIR		= -I/usr/include/ncurses
+ 
+ OBJS			= input.o menurt.o listbox.o winops.o labels.o \
+ 				msgboxes.o txbox.o
+@@ -12,7 +11,7 @@ libtextbox.a: $(OBJS)
+ #	gcc -shared -o libtextbox.so $(OBJS)
+ 
+ %.o: %.c *.h
+-	gcc -O2 -g -Wall -fPIC $(INCLUDEDIR) -c -o $*.o $<
++	${CC} -O2 -g -Wall -fPIC  -c -o $*.o $<
+ 
+ clean:
+ 	rm -rf *.o *~ libtextbox.a libtextbox.so
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
new file mode 100644
index 0000000..7b8f0db
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "IPTraf is a console-based network statistics utility for Linux. \
+It gathers a variety of figures such as TCP connection packet and byte counts, \
+interface statistics and activity indicators, TCP/UDP traffic breakdowns, \
+and LAN station packet and byte counts."
+
+HOMEPAGE = "http://iptraf.seul.org"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc0bdc29df738baf327368b1bbb15a45"
+
+DEPENDS = "ncurses"
+
+SRC_URI = " \
+    ftp://iptraf.seul.org/pub/iptraf/iptraf-3.0.0.tar.gz \
+    file://0001-src-Fix-error-in-cross-compile.patch"
+SRC_URI[md5sum] = "377371c28ee3c21a76f7024920649ea8"
+SRC_URI[sha256sum] = "9ee433d95573d612539da4b452e6cdcbca6ab6674a88bfbf6eaf12d4902b5163"
+RDEPENDS_${PN} = "ncurses"
+
+do_compile() {
+    oe_runmake -C src all  
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    oe_runmake -C src install \
+        TARGET=${D}${bindir} \
+        WORKDIR=${D}${localstatedir}/local/iptraf \
+        LOGDIR=${D}${localstatedir}/log/iptraf \
+        LOCKDIR=${D}${localstatedir}/run/iptraf 
+}
+
+FILES_${PN} += "${bindir} ${localstatedir} /run"
-- 
1.8.4.2


