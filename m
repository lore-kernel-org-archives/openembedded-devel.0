Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrB35-0008Mq-Kj
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 18:27:15 +0100
Received: by mail-da0-f51.google.com with SMTP id i30so7576092dad.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=BB5JsbGE6fEItJj71jG2Am2gwrFbdPzhExS3pq2JvCE=;
	b=KQRfqf+9tl8P4saFrHto3Ui+aw2jO3MeOlExy8rtmqMgtAuTUHXBW31AUW0QF2OH5g
	VySTXi55Pkg9X2FrrxyGQji00BNubR/FdnY35+wRwKGb45HtFE3AOsVnqhWl5U4GAMv1
	WkYE1PUxgczKpM+ZOofAuBteJKMr84XEoNCxrmhpBCCDm/2C9xL//QeKT7JrgZ3Ekwra
	NnQA3/rMuS2jXiHPfcG+z2kEe+WNmLmWuVp1ENz8D62useP11R4/pARpbNPai6LF3Yoa
	qcUB4VHNV56TyDmkD8e2rqLTOD2kINNG1W7hYUtXIrKTSIleyzqaE2DVjfieI2cd8ito
	kxBg==
X-Received: by 10.66.85.74 with SMTP id f10mr155907360paz.38.1357319529526;
	Fri, 04 Jan 2013 09:12:09 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id mn5sm32535854pbc.12.2013.01.04.09.12.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 09:12:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2013 09:11:27 -0800
Message-Id: <1357319488-789-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH 13/13][V2] ebtables: Fix segfault by linking with no-as-needed
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
X-List-Received-Date: Fri, 04 Jan 2013 17:27:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ebtables/ebtables-2.0.10-4/no-as-needed.patch  |   25 ++++++++++++++++++++
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/no-as-needed.patch

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/no-as-needed.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/no-as-needed.patch
new file mode 100644
index 0000000..336119d
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/no-as-needed.patch
@@ -0,0 +1,25 @@
+link ebtables with --no-as-needed and adjust the link order to fix runtime crash
+
+Program terminated with signal 11, Segmentation fault.
+#0  0x00007ffaa837fb53 in ebt_initialize_entry () from /lib64/ebtables/libebtc.so
+(gdb) bt
+#0  0x00007ffaa837fb53 in ebt_initialize_entry () from /lib64/ebtables/libebtc.so
+#1  0x00007ffaa83824dc in do_command () from /lib64/ebtables/libebtc.so
+#2  0x000000000040065c in ?? ()
+#3  0x00007ffaa7fed755 in __libc_start_main () from /lib64/libc.so.6
+#4  0x0000000000400691 in ?? ()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: ebtables-v2.0.10-4/Makefile
+===================================================================
+--- ebtables-v2.0.10-4.orig/Makefile	2011-12-15 12:02:47.000000000 -0800
++++ ebtables-v2.0.10-4/Makefile	2012-12-17 22:09:45.065973753 -0800
+@@ -90,7 +90,7 @@
+ 	$(CC) -shared $(LDFLAGS) -Wl,-soname,libebtc.so -o libebtc.so -lc $(OBJECTS2)
+ 
+ ebtables: $(OBJECTS) ebtables-standalone.o libebtc.so
+-	$(CC) $(CFLAGS) $(CFLAGS_SH_LIB) $(LDFLAGS) -o $@ ebtables-standalone.o -I$(KERNEL_INCLUDES) -L. -Lextensions -lebtc $(EXT_LIBSI) \
++	$(CC) $(CFLAGS) $(CFLAGS_SH_LIB) $(LDFLAGS) -o $@ ebtables-standalone.o -I$(KERNEL_INCLUDES) -L. -Lextensions -Wl,--no-as-needed $(EXT_LIBSI) -lebtc \
+ 	-Wl,-rpath,$(LIBDIR)
+ 
+ ebtablesu: ebtablesu.c
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index e3476da..2596d2f 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -2,12 +2,13 @@ SUMMARY = "Utility for basic Ethernet frame filtering on a Linux bridge, MAC NAT
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
 SECTION = "console/network"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://installnonroot.patch \
            file://01debian_defaultconfig.patch \
            file://ebtables.init \
+           file://no-as-needed.patch \
            "
 
 SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
-- 
1.7.9.5



