Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRh-00053r-4v
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:29 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:41 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:41 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:36 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:24 +0100
Message-Id: <a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:36.0424 (UTC)
	FILETIME=[E83A3C80:01C97913]
Subject: [PATCH 04/14] kexecboot: add new recipe for kexecboot-0.4
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:29 -0000

- kexecboot can now be used as init
---
 conf/checksums.ini                  |    3 ++
 packages/kexecboot/kexecboot_0.4.bb |   37 +++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 packages/kexecboot/kexecboot_0.4.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 5467494..abb74ef 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -24622,3 +24622,6 @@ sha256=5cc1a53bb909922596bdd0fa967b654fe1bfbe0dcf1d34608f0b7c90e0c27867
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 
+[http://projects.linuxtogo.org/~jay7/kexecboot-0.4.tar.gz]
+md5=b4a4509ca3f546cfedd23aa6f99ab81d
+sha256=b8c9d3a51f04bdecabbb4135079d408e02c98cdf3156bab8418a6830cb64b890
diff --git a/packages/kexecboot/kexecboot_0.4.bb b/packages/kexecboot/kexecboot_0.4.bb
new file mode 100644
index 0000000..19c2372
--- /dev/null
+++ b/packages/kexecboot/kexecboot_0.4.bb
@@ -0,0 +1,37 @@
+LICENSE = "GPL"
+PR = "r0"
+DEPENDS = "klibc"
+RDEPENDS = "kexec-static"
+
+inherit autotools
+
+# You can create your own *-img.h by doing
+# ./make-image-header.sh <file>.png HAND
+
+SRC_URI = "http://projects.linuxtogo.org/~jay7/kexecboot-${PV}.tar.gz"
+
+S = "${WORKDIR}/kexecboot-${PV}"
+
+export CC=${TARGET_PREFIX}klcc
+
+# standard oe cflags don't work with klcc
+export CFLAGS = ""
+export CPPFLAGS = ""
+export LDFLAGS = ""
+
+do_install () {
+
+# hard way
+#        install -d ${D}
+#        install -m 0755 kexecboot ${D}/init
+
+        install -d ${D}${bindir}
+        install -m 0755 kexecboot ${D}${bindir}/
+        install -d ${D}
+        ln -sf ${bindir}/kexecboot ${D}/init
+
+        install -d ${D}/proc
+        install -d ${D}/mnt
+}
+
+FILES_${PN} = "/init /usr/bin/kexecboot /proc /mnt"
-- 
1.6.0.6



