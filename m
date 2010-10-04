Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P2lTg-00024J-Ez
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 15:53:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A72B43148FF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 15:52:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 7q237gSUSdRz; Mon,  4 Oct 2010 15:52:51 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 8DAF03147E1F;
	Mon,  4 Oct 2010 15:52:50 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 04 Oct 2010 13:52:50 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Oct 2010 13:52:41 +0000
Message-Id: <1286200361-15982-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <AANLkTin6=N4BaKiYkRVmwT4gKjGkr2JoPpMON5maVZKm@mail.gmail.com>
References: <AANLkTin6=N4BaKiYkRVmwT4gKjGkr2JoPpMON5maVZKm@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] netkit-base-0.17: fix compile with gcc-4.x
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
X-List-Received-Date: Mon, 04 Oct 2010 13:53:29 -0000

* v2: Added header to patch.
* v3: Set CFLAGS and LDFLAGS correctly.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I decided to patch the file MCONFIG instead. LD was unused and CFLAGS was set
to a wrong value, too.

 .../netkit-base-0.17/gcc4_buildfix.patch           |   19 +++++++++++++++++++
 recipes/netkit-base/netkit-base_0.17.bb            |    9 +++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch

diff --git a/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch b/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch
new file mode 100644
index 0000000..b5b476c
--- /dev/null
+++ b/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch
@@ -0,0 +1,19 @@
+upstream: unmaintained
+source: org.openembedded.dreambox fb4bee1268b9a0600fd6236ac0e9245f17b33f95
+
+| servtab.c: In function 'loadconfigent':
+| servtab.c:785:4: error: lvalue required as left operand of assignment
+[...]
+| servtab.c:798:4: error: lvalue required as left operand of assignment
+
+--- bla/inetd/servtab.c	2000-07-22 22:20:50.000000000 +0200
++++ bla/inetd/servtab.c	2006-03-01 15:26:46.000000000 +0100
+@@ -771,7 +771,7 @@
+ 			return;
+ 		}
+ 		
+-#define SWAP(type, a, b) {type c=(type)a; (type)a=(type)b; (type)b=(type)c;}
++#define SWAP(type, a, b) {type c=(type)a; a=(type)b; b=(type)c;}
+ 
+ 		/*
+ 		 * sep->se_wait may be holding the pid of a daemon
diff --git a/recipes/netkit-base/netkit-base_0.17.bb b/recipes/netkit-base/netkit-base_0.17.bb
index c9864ae..8ab8935 100644
--- a/recipes/netkit-base/netkit-base_0.17.bb
+++ b/recipes/netkit-base/netkit-base_0.17.bb
@@ -1,11 +1,12 @@
 SECTION = "base"
 DESCRIPTION = "netkit-base includes the inetd daemon."
 LICENSE = "BSD"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-base-${PV}.tar.gz \
            file://configure.patch \
            file://mconfig.patch \
+           file://gcc4_buildfix.patch \
            file://init \
            file://inetd.conf"
 
@@ -17,7 +18,11 @@ INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 0 1 6 ."
 EXTRA_OEMAKE = "-C inetd"
 
 do_compile () {
-	oe_runmake 'CC=${CC}' 'LD=${LD}' all
+        sed -e 's:^CC=.*:CC=${CC}:' \
+            -e 's:^CFLAGS=.*:CFLAGS=${CFLAGS}:' \
+            -e 's:^LDFLAGS=.*:LDFLAGS=${LDFLAGS}:' \
+            -i ${S}/MCONFIG
+        oe_runmake
 }
 
 do_install () {
-- 
1.7.1



