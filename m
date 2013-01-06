Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmX6-000360-Ez
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:45 +0100
Received: by mail-pb0-f51.google.com with SMTP id ro12so10023602pbb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=BB5JsbGE6fEItJj71jG2Am2gwrFbdPzhExS3pq2JvCE=;
	b=1CpZERVnqxFxbcBj6H5kMd0PrWwUbEKY2YYnPLwKeQVPS20EZ28fKo5laSWxqzrFrG
	+YaRaBSuZF/UWG8YOcvDhpoqnQygWaSVVSuG+eHBS5gY/S5CMSnZw3nm1GOfTbiKmzWt
	j/cqlIHGhB31Vn6z5GbKWuRSTRhlu8ku8649tqrz85hwaRnAeEtAA2JRldLmyzoCeK5E
	EFDo3edb90tkHShkRTCN8ORS2UQ7yIGBpdNvCkupxxKwapcH67In/QofDuSC5SU3NpPP
	uB+9Wctt7HDYXoSUGURyKrMyYSPVLqaUhPxrCHT/lpKQrjeth6QndrIrSXt9IbssNu8W
	k2YA==
X-Received: by 10.66.82.162 with SMTP id j2mr168488264pay.13.1357463616235;
	Sun, 06 Jan 2013 01:13:36 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:25 -0800
Message-Id: <1357463568-26241-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 02/25] ebtables: Fix segfault by linking with no-as-needed
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
X-List-Received-Date: Sun, 06 Jan 2013 09:28:46 -0000

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



