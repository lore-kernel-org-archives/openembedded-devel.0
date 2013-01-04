Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygs-0001zM-AV
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:54 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so9018244pad.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=STNKgT+46Ks6tnmUpwY50GEGx20EhJ8UzyJ93esXLBM=;
	b=ulto3Vdlo3rC2S8/S4T2dobkWygZwz+eAkJ0yAL2/vaaVwkl2rBDLAxEQdo13HkQnO
	aKLoVoS0n2g1Af4jC/DXAvZ+vYDthsN665smHrNJMvqEMq6IU0rjqn1BfjH5ZLE4J1UT
	2DEo6s1m0MjOoUGM8q7fE6G3I57y6B2JaCmjbhZhctipfguXqwBpcXcoNhC1gwQCZNtQ
	2v77Q8EkGWa/QygUwNOrFw6txRUkF2w1Xo2xfnJEpeESz4b5dDVU87P5LVJw/j+j6AWu
	Bv1PEbn/qwNeWG3kbd2ZCnR+5mHayU6rHfe3fnM2mSTX+fIylTJhhIM6iWsuybPPu0RI
	qoug==
X-Received: by 10.68.226.71 with SMTP id rq7mr158816769pbc.60.1357272024777;
	Thu, 03 Jan 2013 20:00:24 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:34 -0800
Message-Id: <1357271974-3317-12-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 13/13] ebtables: Fix segfault by linking with no-as-needed
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
X-List-Received-Date: Fri, 04 Jan 2013 04:16:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ebtables/ebtables-2.0.10-4/no-as-needed.patch  |   25 ++++++++++++++++++++
 .../recipes-support/ebtables/ebtables_2.0.10-4.bb  |    1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-support/ebtables/ebtables-2.0.10-4/no-as-needed.patch

diff --git a/meta-networking/recipes-support/ebtables/ebtables-2.0.10-4/no-as-needed.patch b/meta-networking/recipes-support/ebtables/ebtables-2.0.10-4/no-as-needed.patch
new file mode 100644
index 0000000..336119d
--- /dev/null
+++ b/meta-networking/recipes-support/ebtables/ebtables-2.0.10-4/no-as-needed.patch
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
diff --git a/meta-networking/recipes-support/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-support/ebtables/ebtables_2.0.10-4.bb
index 9be2494..eb7fa0d 100644
--- a/meta-networking/recipes-support/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-support/ebtables/ebtables_2.0.10-4.bb
@@ -10,6 +10,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 SRC_URI = " \
 	${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
 	file://01debian_defaultconfig.patch \
+	file://no-as-needed.patch \
 	file://ebtables.init \
 	"
 SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
-- 
1.7.9.5



