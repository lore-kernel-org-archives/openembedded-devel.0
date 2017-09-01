Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id BE8CC78461
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 05:07:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r187so995567pfr.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 22:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VPKSuMslYhcXa5TP7er//rDYw/K0Yjr1HpCzUB8RLKw=;
	b=bCrC9x3hlxWt95EgcbzpnCBC50mW840iZLepfAI88KlED1ETRfpxEUZqgZXgMAphdc
	F1YDLGGmjVP+acGW++A+y5ahoi26JergbxR7wOx/Um5pNbb9wwVxHqrY4Vl7FXXq9RRU
	RSEZSV6+ARYBsyKSGSRHGLGvu8+FrJ5Cs+K7RKlwEtEFIwjsJa0RjXrm9Mg+SM0BEV8H
	MhfqIR9fV3KY7dKVBhIosXkMeVmB6eWxuIq9kQd8Uhr1rQ0im90jycU1iP5wXugCXP6k
	hYDaewz+oVMTME8pZMAhmgO+pQ9KbhR9ddSr5x/p/0HeoLyu4IC4o9+236nYjdhKG2uU
	tKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VPKSuMslYhcXa5TP7er//rDYw/K0Yjr1HpCzUB8RLKw=;
	b=SMwqorCjKJwBW9hSB7U25e0SxvxUKfOS2zlxapsy89lLFi0mc1tvYoGPy3KBRxzy02
	KWwyDhJMPlk3JjDewdbTlvH70jBOMJyr13esCC2+iK9tLBKJ0+1ycOMHu4wSTy9Hh/FR
	NGobMD+n7DsZU7IbMT7/aIXcBsZZZBcwolExhXPu021TMTPxc9IROm6tm39kcEIEpiXA
	Pw4gvPnYH1an0WzZB1NzCcxqb8n9+npAWXZyabCgG0EAsn4+dlfVdpWf2ULo1gW9LoY+
	eWtDLs4t+BWvKRc6Y1ePV72lNNkjr6v5zNX/yHefmoyaLFS5r/Bm4aDq2HXLxpGirhcO
	KqEg==
X-Gm-Message-State: AHPjjUgHqUOAB+WCic0qCrzrQlXPpeLRN2G2uZfKU/Bc6qSbdz0XMyG3
	g6IK4YIE4gi1wusB
X-Google-Smtp-Source: ADKCNb70r9FjVL+fD1KozPmgnYdjPFOWAyDQ+Wlq6i2QyCJLAq9yfTF3cdkVeTmRpvweuGIhkLpd0A==
X-Received: by 10.84.129.7 with SMTP id 7mr932927plb.57.1504242457336;
	Thu, 31 Aug 2017 22:07:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	n66sm1797491pfi.44.2017.08.31.22.07.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 22:07:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 22:07:27 -0700
Message-Id: <20170901050728.37511-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] iptraf-ng: Add new recipe
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
X-List-Received-Date: Fri, 01 Sep 2017 05:07:36 -0000

Delete iptraf and use iptraf-ng to provide
iptraf functionality

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-printd-formatting-strings.patch       |  54 ++++++++
 .../iptraf/iptraf-ng/ncurses-config.patch          |  81 ++++++++++++
 meta-oe/recipes-devtools/iptraf/iptraf-ng_1.1.4.bb |  42 +++++++
 .../0001-src-Fix-error-in-cross-compile.patch      | 138 ---------------------
 .../iptraf/iptraf/format_string.patch              |  31 -----
 .../recipes-devtools/iptraf/iptraf/ldopts.patch    |  35 ------
 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb    |  42 -------
 7 files changed, 177 insertions(+), 246 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-Fix-printd-formatting-strings.patch
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/ncurses-config.patch
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng_1.1.4.bb
 delete mode 100644 meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile.patch
 delete mode 100644 meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch
 delete mode 100644 meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch
 delete mode 100644 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-Fix-printd-formatting-strings.patch b/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-Fix-printd-formatting-strings.patch
new file mode 100644
index 000000000..5b9afd961
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-Fix-printd-formatting-strings.patch
@@ -0,0 +1,54 @@
+From 86b4d398dbb95e2437b70eba3b30e995ec9be505 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Aug 2017 20:47:50 -0700
+Subject: [PATCH] Fix printd formatting strings
+
+Fixes
+error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ipfilter.c | 2 +-
+ src/othptab.c  | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/ipfilter.c b/src/ipfilter.c
+index eb17ec7..8c76e4c 100644
+--- a/src/ipfilter.c
++++ b/src/ipfilter.c
+@@ -146,7 +146,7 @@ void gethostparams(struct hostparams *data, char *init_saddr, char *init_smask,
+ 				snprintf(msgstr, 60,
+ 					 "Invalid protocol input at or near token \"%s\"",
+ 					 bptr);
+-				tui_error(ANYKEY_MSG, msgstr);
++				tui_error(ANYKEY_MSG, "%s", msgstr);
+ 				doagain = 1;
+ 			} else
+ 				doagain = 0;
+diff --git a/src/othptab.c b/src/othptab.c
+index 142c9c2..fe395c2 100644
+--- a/src/othptab.c
++++ b/src/othptab.c
+@@ -410,7 +410,7 @@ void printothpentry(struct othptable *table, struct othptabent *entry,
+ 				break;
+ 			}
+ 
+-			sprintf(scratchpad, rarp_mac_addr);
++			sprintf(scratchpad, "%s", rarp_mac_addr);
+ 			strcat(msgstring, scratchpad);
+ 			wattrset(table->othpwin, ARPATTR);
+ 			break;
+@@ -485,7 +485,7 @@ void printothpentry(struct othptable *table, struct othptabent *entry,
+ 		wattrset(table->othpwin, UNKNIPATTR);
+ 		protptr = getprotobynumber(entry->protocol);
+ 		if (protptr != NULL) {
+-			sprintf(protname, protptr->p_aliases[0]);
++			sprintf(protname, "%s", protptr->p_aliases[0]);
+ 		} else {
+ 			sprintf(protname, "IP protocol");
+ 			unknown = 1;
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng/ncurses-config.patch b/meta-oe/recipes-devtools/iptraf/iptraf-ng/ncurses-config.patch
new file mode 100644
index 000000000..65b92dade
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng/ncurses-config.patch
@@ -0,0 +1,81 @@
+Use pkg-config to search for ncurses libraries
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: iptraf-ng-1.1.4/Makefile
+===================================================================
+--- iptraf-ng-1.1.4.orig/Makefile
++++ iptraf-ng-1.1.4/Makefile
+@@ -205,8 +205,8 @@ endif
+ 
+ ifndef NCURSES_LDFLAGS
+ ifdef NEEDS_NCURSES5
+-	NCURSES_CFLAGS := $(shell ncurses5-config --cflags 2>/dev/null)
+-	NCURSES_LDFLAGS := $(shell ncurses5-config --libs 2>/dev/null)
++	NCURSES_CFLAGS := $(shell pkg-config ncurses --cflags 2>/dev/null)
++	NCURSES_LDFLAGS := $(shell pkg-config ncurses --libs 2>/dev/null)
+ 	ifndef NO_PANEL
+ 		NCURSES_LDFLAGS += -lpanel
+ 	endif
+@@ -215,8 +215,8 @@ endif
+ 
+ ifndef NCURSES_LDFLAGS
+ ifdef NEEDS_NCURSESW5
+-	NCURSES_CFLAGS := $(shell ncursesw5-config --cflags 2>/dev/null)
+-	NCURSES_LDFLAGS := $(shell ncursesw5-config --libs 2>/dev/null)
++	NCURSES_CFLAGS := $(shell p[k-config ncursesw --cflags 2>/dev/null)
++	NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
+ 	ifndef NO_PANEL
+ 		NCURSES_LDFLAGS += -lpanel
+ 	endif
+@@ -225,8 +225,8 @@ endif
+ 
+ ifndef NCURSES_LDFLAGS
+ ifdef NEEDS_NCURSES6
+-	NCURSES_CFLAGS := $(shell ncurses6-config --cflags 2>/dev/null)
+-	NCURSES_LDFLAGS := $(shell ncurses6-config --libs 2>/dev/null)
++	NCURSES_CFLAGS := $(shell pkg-config ncurses6 --cflags 2>/dev/null)
++	NCURSES_LDFLAGS := $(shell pkg-config ncurses6 --libs 2>/dev/null)
+ 	ifndef NO_PANEL
+ 		NCURSES_LDFLAGS += -lpanel
+ 	endif
+@@ -235,8 +235,8 @@ endif
+ 
+ ifndef NCURSES_LDFLAGS
+ ifdef NEEDS_NCURSESW6
+-	NCURSES_CFLAGS := $(shell ncursesw6-config --cflags 2>/dev/null)
+-	NCURSES_LDFLAGS := $(shell ncursesw6-config --libs 2>/dev/null)
++	NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
++	NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
+ 	ifndef NO_PANEL
+ 		NCURSES_LDFLAGS += -lpanel
+ 	endif
+@@ -246,17 +246,17 @@ endif
+ # try find ncuses by autodetect
+ ifndef NCURSES_LDFLAGS
+ 	ifneq ($(shell ncursesw6-config --libs 2>/dev/null),)
+-		NCURSES_CFLAGS := $(shell ncursesw6-config --cflags 2>/dev/null)
+-		NCURSES_LDFLAGS := $(shell ncursesw6-config --libs 2>/dev/null)
+-	else ifneq ($(shell ncurses6-config --libs 2>/dev/null),)
+-		NCURSES_CFLAGS := $(shell ncurses6-config --cflags 2>/dev/null)
+-		NCURSES_LDFLAGS := $(shell ncurses6-config --libs 2>/dev/null)
+-	else ifneq ($(shell ncursesw5-config --libs 2>/dev/null),)
+-		NCURSES_CFLAGS := $(shell ncursesw5-config --cflags 2>/dev/null)
+-		NCURSES_LDFLAGS := $(shell ncursesw5-config --libs 2>/dev/null)
+-	else ifneq ($(shell ncurses5-config --libs 2>/dev/null),)
+-		NCURSES_CFLAGS := $(shell ncurses5-config --cflags 2>/dev/null)
+-		NCURSES_LDFLAGS := $(shell ncurses5-config --libs 2>/dev/null)
++		NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
++		NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
++	else ifneq ($(shell pkg-config ncurses --libs 2>/dev/null),)
++		NCURSES_CFLAGS := $(shell pkg-config ncurses --cflags 2>/dev/null)
++		NCURSES_LDFLAGS := $(shell pkg-config ncurses --libs 2>/dev/null)
++	else ifneq ($(shell pkg-config ncursesw --libs 2>/dev/null),)
++		NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
++		NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
++	else ifneq ($(shell pkg-config ncurses --libs 2>/dev/null),)
++		NCURSES_CFLAGS := $(shell pkg-config ncurses --cflags 2>/dev/null)
++		NCURSES_LDFLAGS := $(shell pkg-config ncurses --libs 2>/dev/null)
+ 	endif
+ 
+ 	ifneq ($(NCURSES_LDFLAGS),)
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.1.4.bb b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.1.4.bb
new file mode 100644
index 000000000..c53e66300
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.1.4.bb
@@ -0,0 +1,42 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A console-based network monitoring utility"
+DESCRIPTION = "IPTraf-ng is a console-based network monitoring utility.  IPTraf gathers \
+data like TCP connection packet and byte counts, interface statistics \
+and activity indicators, TCP/UDP traffic breakdowns, and LAN station \
+packet and byte counts.  IPTraf-ng features include an IP traffic monitor \
+which shows TCP flag information, packet and byte counts, ICMP \
+details, OSPF packet types, and oversized IP packet warnings; \
+interface statistics showing IP, TCP, UDP, ICMP, non-IP and other IP \
+packet counts, IP checksum errors, interface activity and packet size \
+counts; a TCP and UDP service monitor showing counts of incoming and \
+outgoing packets for common TCP and UDP application ports, a LAN \
+statistics module that discovers active hosts and displays statistics \
+about their activity; TCP, UDP and other protocol display filters so \
+you can view just the traffic you want; logging; support for Ethernet, \
+FDDI, ISDN, SLIP, PPP, and loopback interfaces; and utilization of the \
+built-in raw socket interface of the Linux kernel, so it can be used \
+on a wide variety of supported network cards."
+
+HOMEPAGE = "https://fedorahosted.org/iptraf-ng/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2b3850593b899b1a17594ed4cc4c731"
+DEPENDS = "ncurses"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/iptraf-ng/iptraf-ng-1.1.4.tar.gz/e0f8df3b7baf2b5106709abc4f8c029a/${BP}.tar.gz \
+           file://ncurses-config.patch \
+           file://0001-Fix-printd-formatting-strings.patch \
+           "
+SRC_URI[md5sum] = "e0f8df3b7baf2b5106709abc4f8c029a"
+SRC_URI[sha256sum] = "16b9b05bf5d3725d86409b901696639ad46944d02de6def87b1ceae5310dd35c"
+
+inherit autotools-brokensep pkgconfig
+
+CFLAGS += "-D_GNU_SOURCE"
+
+PROVIDES = "iptraf"
+RPROVIDES_${PN} += "iptraf"
+RREPLACES_${PN} += "iptraf"
+RCONFLICTS_${PN} += "iptraf"
+
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile.patch b/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile.patch
deleted file mode 100644
index 291ed3196..000000000
--- a/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 27910ea19260b7f7a3f9c0465addd1dea80cf3bd Mon Sep 17 00:00:00 2001
-From: Li Xin <lixin.fnst@cn.fujitsu.com>
-Date: Thu, 8 Oct 2015 15:11:17 +0900
-Subject: [PATCH] src: Fix error in cross-compile
-
-The errors are like this:
-tcptable.h:26:25: fatal error: linux/if_tr.h: No such file or directory
-ld: cannot find -ltextbox
-
-Upstream-Status: pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- src/Makefile     | 2 +-
- src/hostmon.c    | 2 +-
- src/install.sh   | 4 ++--
- src/othptab.c    | 2 +-
- src/packet.c     | 2 +-
- src/tcptable.h   | 2 +-
- src/tr.c         | 2 +-
- support/Makefile | 3 +--
- 8 files changed, 9 insertions(+), 10 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 2043c2d..0f77bea 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -39,7 +39,7 @@ LDOPTS		= #-static
- # you may want to change this to point to your ncurses include directory
- # if the ncurses include files are not in the default location.
- 
--INCLUDEDIR	= -I/usr/include/ncurses -I../support
-+INCLUDEDIR	=  -I../support
- 
- # You can uncomment this one to disable the backspace key in input fields.
- # This means you must use the Del key or Ctrl+H combination to erase the
-diff --git a/src/hostmon.c b/src/hostmon.c
-index 14df2c8..6571562 100644
---- a/src/hostmon.c
-+++ b/src/hostmon.c
-@@ -31,7 +31,7 @@ details.
- #include <linux/if_packet.h>
- #include <linux/if_ether.h>
- #include <linux/if_fddi.h>
--#include <linux/if_tr.h>
-+#include <netinet/if_tr.h>
- #include <net/if_arp.h>
- #include <stdlib.h>
- #include <time.h>
-diff --git a/src/install.sh b/src/install.sh
-index d2fd360..36d3516 100755
---- a/src/install.sh
-+++ b/src/install.sh
-@@ -23,9 +23,9 @@ echo
- echo "*** Installing executable programs and preparing work directories"
- echo
- echo ">>> Installing iptraf in $TARGET"
--$INSTALL -m 0700 -o root -g root -s iptraf $TARGET
-+$INSTALL -m 0700 -o root -g root  iptraf $TARGET
- echo ">>> Installing rvnamed in $TARGET"
--$INSTALL -m 0700 -o root -g root -s rvnamed $TARGET
-+$INSTALL -m 0700 -o root -g root  rvnamed $TARGET
- 
- if [ ! -d $WORKDIR ]; then
-     echo ">>> Creating IPTraf work directory $WORKDIR"
-diff --git a/src/othptab.c b/src/othptab.c
-index 97771d1..a8bb536 100644
---- a/src/othptab.c
-+++ b/src/othptab.c
-@@ -18,7 +18,7 @@ details.
- 
- #include <asm/types.h>
- #include <linux/if_ether.h>
--#include <linux/if_tr.h>
-+#include <netinet/if_tr.h>
- #include <linux/if_fddi.h>
- #include <winops.h>
- #include "arphdr.h"
-diff --git a/src/packet.c b/src/packet.c
-index 33fdf2a..1e2b81b 100644
---- a/src/packet.c
-+++ b/src/packet.c
-@@ -36,7 +36,7 @@ details.
- #include <linux/if_packet.h>
- #include <linux/if_ether.h>
- #include <linux/if_fddi.h>
--#include <linux/if_tr.h>
-+#include <netinet/if_tr.h>
- #include <linux/isdn.h>
- #include <linux/sockios.h>
- #include <msgboxes.h>
-diff --git a/src/tcptable.h b/src/tcptable.h
-index 3e17793..d1380b5 100644
---- a/src/tcptable.h
-+++ b/src/tcptable.h
-@@ -23,7 +23,7 @@
- #include <linux/if_packet.h>
- #include <linux/if_ether.h>
- #include <linux/if_fddi.h>
--#include <linux/if_tr.h>
-+#include <netinet/if_tr.h>
- #include <net/if.h>
- #include <netinet/ip.h>
- #include <netinet/udp.h>
-diff --git a/src/tr.c b/src/tr.c
-index 40c9e63..11f8045 100644
---- a/src/tr.c
-+++ b/src/tr.c
-@@ -7,7 +7,7 @@
-  */
- 
- #include <asm/types.h>
--#include <linux/if_tr.h>
-+#include <netinet/if_tr.h>
- #include <netinet/in.h>
- 
- unsigned int get_tr_ip_offset(unsigned char *pkt)
-diff --git a/support/Makefile b/support/Makefile
-index 114bfc3..c962c09 100644
---- a/support/Makefile
-+++ b/support/Makefile
-@@ -1,4 +1,3 @@
--INCLUDEDIR		= -I/usr/include/ncurses
- 
- OBJS			= input.o menurt.o listbox.o winops.o labels.o \
- 				msgboxes.o txbox.o
-@@ -12,7 +11,7 @@ libtextbox.a: $(OBJS)
- #	gcc -shared -o libtextbox.so $(OBJS)
- 
- %.o: %.c *.h
--	gcc -O2 -g -Wall -fPIC $(INCLUDEDIR) -c -o $*.o $<
-+	${CC} -O2 -g -Wall -fPIC  -c -o $*.o $<
- 
- clean:
- 	rm -rf *.o *~ libtextbox.a libtextbox.so
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch b/meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch
deleted file mode 100644
index 5f96f0f4c..000000000
--- a/meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Index: iptraf-3.0.0/src/othptab.c
-===================================================================
---- iptraf-3.0.0.orig/src/othptab.c
-+++ iptraf-3.0.0/src/othptab.c
-@@ -335,7 +335,7 @@ void printothpentry(struct othptable *ta
-                 break;
-             }
- 
--            sprintf(scratchpad, inet_ntoa(saddr));
-+            sprintf(scratchpad, "%s", inet_ntoa(saddr));
-             strcat(msgstring, scratchpad);
-             wattrset(table->othpwin, ARPATTR);
-             break;
-@@ -354,7 +354,7 @@ void printothpentry(struct othptable *ta
-                 break;
-             }
- 
--            sprintf(scratchpad, rarp_mac_addr);
-+            sprintf(scratchpad, "%s", rarp_mac_addr);
-             strcat(msgstring, scratchpad);
-             wattrset(table->othpwin, ARPATTR);
-             break;
-@@ -421,7 +421,7 @@ void printothpentry(struct othptable *ta
-         wattrset(table->othpwin, UNKNIPATTR);
-         protptr = getprotobynumber(entry->protocol);
-         if (protptr != NULL) {
--            sprintf(protname, protptr->p_aliases[0]);
-+            sprintf(protname, "%s", protptr->p_aliases[0]);
-         } else {
-             sprintf(protname, "IP protocol");
-             unknown = 1;
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch b/meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch
deleted file mode 100644
index c84a0a0ad..000000000
--- a/meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Index: iptraf-3.0.0/src/Makefile
-===================================================================
---- iptraf-3.0.0.orig/src/Makefile
-+++ iptraf-3.0.0/src/Makefile
-@@ -5,7 +5,7 @@
- #
- # Architecture determination string borrowed from the kernel makefile.
- #
--ARCH 		:= $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
-+ARCH 		?= $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
- 			-e s/arm.*/arm/ -e s/sa110/arm/)
- PLATFORM 	= -DPLATFORM=\"$(shell uname -s)/$(ARCH)\"
- VERNUMBER	:= $(shell cat version)
-@@ -17,7 +17,7 @@ VERSION 	= -DVERSION=\"$(VERNUMBER)\"
- #
- BINDIR		= ../../iptraf-$(VERNUMBER).bin.$(ARCH)
- 
--CC		= gcc
-+CC		= $(CC)
- LIBS		= -L../support -ltextbox -lpanel -lncurses   # in this order!
- 
- # comment this one out to omit debug code when done.
-@@ -31,10 +31,10 @@ PROF		= #-pg
- # options to be passed to the compiler.  I don't believe they need to be
- # modified (except for -m486 on non-Intel x86 platforms).
- 
--CFLAGS		= -Wall #-O2 #-m486
-+CFLAGS		?= -Wall #-O2 #-m486
- DIRS		= -DWORKDIR=\"$(WORKDIR)\" \
- 		  -DLOGDIR=\"$(LOGDIR)\" -DEXECDIR=\"$(TARGET)\"
--LDOPTS		= #-static
-+LDOPTS		?= #-static
- 
- # you may want to change this to point to your ncurses include directory
- # if the ncurses include files are not in the default location.
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
deleted file mode 100644
index abfab02e0..000000000
--- a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "IPTraf is a console-based network statistics utility for Linux. \
-It gathers a variety of figures such as TCP connection packet and byte counts, \
-interface statistics and activity indicators, TCP/UDP traffic breakdowns, \
-and LAN station packet and byte counts."
-
-HOMEPAGE = "http://iptraf.seul.org"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc0bdc29df738baf327368b1bbb15a45"
-
-DEPENDS = "ncurses"
-
-SRC_URI = " \
-    ftp://iptraf.seul.org/pub/iptraf/iptraf-3.0.0.tar.gz \
-    file://0001-src-Fix-error-in-cross-compile.patch \
-    file://format_string.patch \
-    file://ldopts.patch \
-"
-SRC_URI[md5sum] = "377371c28ee3c21a76f7024920649ea8"
-SRC_URI[sha256sum] = "9ee433d95573d612539da4b452e6cdcbca6ab6674a88bfbf6eaf12d4902b5163"
-RDEPENDS_${PN} = "ncurses"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS= LDOPTS='${LDFLAGS}' ARCH='${TARGET_ARCH}'"
-
-do_compile() {
-    oe_runmake -C src all
-}
-
-do_install_append() {
-    rm -r ${D}/${localstatedir}/run
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    oe_runmake -C src install \
-        TARGET=${D}${bindir} \
-        WORKDIR=${D}${localstatedir}/local/iptraf \
-        LOGDIR=${D}${localstatedir}/log/iptraf \
-        LOCKDIR=${D}${localstatedir}/run/iptraf
-}
-
-FILES_${PN} += "${bindir} ${localstatedir} /run"
-- 
2.14.1


