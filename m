Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1UI3Zm-0008Ht-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 21:56:06 +0100
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2JKdES7028235
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 13:39:15 -0700 (PDT)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2013 16:39:12 -0400
Message-Id: <1363725552-11114-2-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.11.3
In-Reply-To: <1363725552-11114-1-git-send-email-joe.macdonald@windriver.com>
References: <1363725552-11114-1-git-send-email-joe.macdonald@windriver.com>
Subject: [meta-networking][PATCH] xl2tpd: dump 1.3.1 in favour of git version
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
X-List-Received-Date: Tue, 19 Mar 2013 20:56:07 -0000

When the yocto kernel updated to 3.8.x, it exposed some breakage in the
xl2tpd 1.3.1 release that has been since fixed in tree.  Rather than
cherry pick patches, we'll migrate to the current HEAD.

Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 .../xl2tpd/xl2tpd-1.3.1/cflags.patch               | 58 ----------------------
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb       |  8 ---
 .../recipes-protocols/xl2tpd/xl2tpd_git.bb         |  5 ++
 3 files changed, 5 insertions(+), 66 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch b/meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch
deleted file mode 100644
index 3550812..0000000
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 678d71e3b50f566776dbc29db49a1128be89caf6 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Fri, 26 Oct 2012 10:07:31 +0100
-Subject: [PATCH] Adjust CFLAGS for building within OE
-
-Updated version of cflags.patch from OE-Classic written by
-Vladimir Sorokin <sorokin@altell.ru>.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- Makefile |    8 +++++---
- 1 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 6f6481f..c7602db 100644
---- a/Makefile
-+++ b/Makefile
-@@ -62,7 +62,7 @@ OSFLAGS?= -DLINUX -I$(KERNELSRC)/include/
- # are packages seperately (eg kernel-headers on Fedora)
- # Note: 2.6.23+ support still needs some changes in the xl2tpd source
- #
--#OSFLAGS+= -DUSE_KERNEL
-+OSFLAGS+= -DUSE_KERNEL
- #
- #
- # Uncomment the next line for FreeBSD
-@@ -90,7 +90,6 @@ OSFLAGS?= -DLINUX -I$(KERNELSRC)/include/
- 
- IPFLAGS?= -DIP_ALLOCATION
- 
--CFLAGS+= $(DFLAGS) -O2 -fno-builtin -Wall -DSANITY $(OSFLAGS) $(IPFLAGS)
- HDRS=l2tp.h avp.h misc.h control.h call.h scheduler.h file.h aaa.h md5.h
- OBJS=xl2tpd.o pty.o misc.o control.o avp.o call.o network.o avpsend.o scheduler.o file.o aaa.o md5.o
- SRCS=${OBJS:.o=.c} ${HDRS}
-@@ -110,6 +109,9 @@ all: $(EXEC) pfc $(CONTROL_EXEC)
- clean:
- 	rm -f $(OBJS) $(EXEC) pfc.o pfc $(CONTROL_EXEC)
- 
-+%.o: %.c
-+	$(CC) $(CFLAGS) $(DFLAGS) -O2 -DSANITY $(OSFLAGS) $(IPFLAGS) -o $@ -c $<
-+
- $(EXEC): $(OBJS) $(HDRS)
- 	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)
- 
-@@ -117,7 +119,7 @@ $(CONTROL_EXEC): $(CONTROL_SRCS)
- 	$(CC) $(CONTROL_SRCS) -o $@
- 
- pfc:
--	$(CC) $(CFLAGS) -c contrib/pfc.c
-+	$(CC) $(CFLAGS) $(DFLAGS) -O2 -DSANITY $(OSFLAGS) $(IPFLAGS) -c contrib/pfc.c
- 	$(CC) $(LDFLAGS) -o pfc pfc.o -lpcap $(LDLIBS)
- 
- romfs:
--- 
-1.7.1
-
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb
deleted file mode 100644
index 5321d6a..0000000
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xl2tpd.inc
-PR = "${INC_PR}.0"
-
-# 95445fc9aaeaf709d54c1cd934d4bed4467e910d corresponds to 1.3.1 tag
-SRCREV = "95445fc9aaeaf709d54c1cd934d4bed4467e910d"
-
-SRC_URI += " file://cflags.patch"
-
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
new file mode 100644
index 0000000..bd084aa
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
@@ -0,0 +1,5 @@
+require xl2tpd.inc
+PR = "${INC_PR}.0"
+
+SRCREV = "df7e30eb199fc5710faa83866381aea18b66e60c"
+
-- 
1.7.11.3



