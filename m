Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Qxx6y-0002Nr-Pr
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 10:22:29 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Qxx2I-0007jK-Bx from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 01:17:38 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 29 Aug 2011 10:17:37 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 13:17:49 +0500
Message-Id: <0efa8c83632b62007db2a307b9264eb6bd0ac82f.1314603785.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1314603785.git.noor_ahsan@mentor.com>
References: <cover.1314603785.git.noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 29 Aug 2011 08:17:37.0557 (UTC)
	FILETIME=[1CD66450:01CC6624]
Subject: [meta-oe][PATCH v2 1/4] dbench: Add version 4.0 (initial recipe)
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
X-List-Received-Date: Mon, 29 Aug 2011 08:22:29 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported from oe.dev commit id d6f49fe115206047b41b0195724ba872897ef531

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb     |   25 +++++++++++++++++
 .../recipes-benchmark/dbench/files/destdir.patch   |   28 ++++++++++++++++++++
 .../recipes-benchmark/dbench/files/makefile.patch  |   18 ++++++++++++
 3 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
 create mode 100644 meta-oe/recipes-benchmark/dbench/files/destdir.patch
 create mode 100644 meta-oe/recipes-benchmark/dbench/files/makefile.patch

diff --git a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
new file mode 100644
index 0000000..b61eb91
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "The dbench (disk) and tbench (TCP) benchmarks"
+DESCRIPTION_dbench = "Filesystem load benchmark"
+DESCRIPTION_tbench = "TCP load benchmark"
+HOMEPAGE = "http://samba.org/ftp/tridge/dbench/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "popt"
+
+SRC_URI = "\
+  http://samba.org/ftp/tridge/dbench/dbench-${PV}.tar.gz \
+  file://destdir.patch \
+  file://makefile.patch"
+
+inherit autotools
+
+PACKAGES =+ "tbench tbench-dbg"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+FILES_tbench = "${bindir}/tbench* ${prefix}/share/client.txt"
+FILES_tbench-dbg += "${bindir}/.debug/tbench*"
+
+SRC_URI[md5sum] = "1fe56ff71b9a416f8889d7150ac54da4"
+SRC_URI[sha256sum] = "6001893f34e68a3cfeb5d424e1f2bfef005df96a22d86f35dc770c5bccf3aa8a"
diff --git a/meta-oe/recipes-benchmark/dbench/files/destdir.patch b/meta-oe/recipes-benchmark/dbench/files/destdir.patch
new file mode 100644
index 0000000..ca9a8ee
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dbench/files/destdir.patch
@@ -0,0 +1,28 @@
+Append $(DESTDIR) to all $(bindir), $(datadir) and $(mandir). Got 
+this patch from OE commit id 709c4d66e0b107ca606941b988bad717c0b45d9b
+
+Upstream-Status: Inappropriate [not author]
+
+Index: dbench-3.04/Makefile.in
+===================================================================
+--- dbench-3.04.orig/Makefile.in	2006-09-17 20:21:07.000000000 +0200
++++ dbench-3.04/Makefile.in	2006-09-17 20:21:36.000000000 +0200
+@@ -32,12 +32,12 @@
+ 
+ # Careful here: don't install client.txt over itself.
+ install: all
+-	${INSTALLCMD} -d $(bindir) $(datadir) $(mandir)
+-	${INSTALLCMD} dbench tbench tbench_srv $(bindir)
+-	${INSTALLCMD} client.txt $(datadir)
+-	${INSTALLCMD} -m644 dbench.1 $(mandir)
+-	ln -sf dbench.1 $(mandir)/tbench.1
+-	ln -sf dbench.1 $(mandir)/tbench_srv.1
++	${INSTALLCMD} -d $(DESTDIR)$(bindir) $(DESTDIR)$(datadir) $(DESTDIR)$(mandir)
++	${INSTALLCMD} dbench tbench tbench_srv $(DESTDIR)$(bindir)
++	${INSTALLCMD} client.txt $(DESTDIR)$(datadir)
++	${INSTALLCMD} -m644 dbench.1 $(DESTDIR)$(mandir)
++	ln -sf dbench.1 $(DESTDIR)$(mandir)/tbench.1
++	ln -sf dbench.1 $(DESTDIR)$(mandir)/tbench_srv.1
+ 
+ clean:
+ 	rm -f *.o *~ dbench tbench tbench_srv
diff --git a/meta-oe/recipes-benchmark/dbench/files/makefile.patch b/meta-oe/recipes-benchmark/dbench/files/makefile.patch
new file mode 100644
index 0000000..09d619a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dbench/files/makefile.patch
@@ -0,0 +1,18 @@
+Add space between install -m option and its argument. Got this patch from 
+OE 709c4d66e0b107ca606941b988bad717c0b45d9b
+
+Upstream-Status: Inappropriate [not author]
+
+Index: dbench-4.0/Makefile.in
+===================================================================
+--- dbench-4.0.orig/Makefile.in
++++ dbench-4.0/Makefile.in
+@@ -35,7 +35,7 @@ install: all
+ 	${INSTALLCMD} -d $(DESTDIR)$(bindir) $(DESTDIR)$(datadir) $(DESTDIR)$(mandir)
+ 	${INSTALLCMD} dbench tbench tbench_srv $(DESTDIR)$(bindir)
+ 	${INSTALLCMD} client.txt $(DESTDIR)$(datadir)
+-	${INSTALLCMD} -m644 dbench.1 $(DESTDIR)$(mandir)
++	${INSTALLCMD} -m 644 dbench.1 $(DESTDIR)$(mandir)
+ 	ln -sf dbench.1 $(DESTDIR)$(mandir)/tbench.1
+ 	ln -sf dbench.1 $(DESTDIR)$(mandir)/tbench_srv.1
+ 
-- 
1.7.0.4



