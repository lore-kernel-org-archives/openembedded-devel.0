Received: from [62.2.86.239] (helo=a.mx.bitcloner.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1Mk3bV-0005tC-A8
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 00:19:29 +0200
Received: from p5b2ce5db.dip.t-dialin.net ([91.44.229.219] helo=127.0.0.1)
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <betheg@bitcloner.org>)
	id 1Mk3J1-00021Z-AE for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 00:00:23 +0200
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Sep 2009 23:56:54 +0200
Message-Id: <1252187814-28449-1-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <19c1b8a90909051405u66dffc20yac0767b757508276@mail.gmail.com>
References: <19c1b8a90909051405u66dffc20yac0767b757508276@mail.gmail.com>
Subject: [PATCH] libconfig: updated to version 1.3.2
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
X-List-Received-Date: Sat, 05 Sep 2009 22:19:29 -0000

---
 conf/checksums.ini                   |    6 +++---
 recipes/libconfig/libconfig_1.3.1.bb |   19 -------------------
 recipes/libconfig/libconfig_1.3.2.bb |   15 +++++++++++++++
 3 files changed, 18 insertions(+), 22 deletions(-)
 delete mode 100644 recipes/libconfig/libconfig_1.3.1.bb
 create mode 100644 recipes/libconfig/libconfig_1.3.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 053a2ad..61d7732 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -13294,9 +13294,9 @@ sha256=74def55ba6a61e966e0873a4081fd3dd65089b94b837810d3bc056221d7e41c7
 md5=68ac3177685c577aadf8d2e9f47b1878
 sha256=c3540df46bd9716c6a6f521806c70ae548822a5e62d245900cc28b5fa9fc3eb3
 
-[http://www.hyperrealm.com/libconfig/libconfig-1.3.1.tar.gz]
-md5=f02bfa27a21b3040089026975b9dc0b8
-sha256=5677f32eff184883d7ca402234f92142f35bea7d04d503becdd104ae8343cb1c
+[http://www.hyperrealm.com/libconfig/libconfig-1.3.2.tar.gz]
+md5=094a82afd382aa2305c6cc3c06025c2d
+sha256=2a680bb33e290c3c799e3a90cf2c0fb9f5482dd930ad93d9f83ce39923258c0a
 
 [http://repository.maemo.org/pool/maemo4.0/free/source/libc/libconic/libconic_0.13-0.8.tar.gz]
 md5=b4078390c459ae4df3acdabca36f53da
diff --git a/recipes/libconfig/libconfig_1.3.1.bb b/recipes/libconfig/libconfig_1.3.1.bb
deleted file mode 100644
index 0856afb..0000000
--- a/recipes/libconfig/libconfig_1.3.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Library for manipulating structured configuration files"
-AUTHOR = "Mark Lindner"
-HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "LGPLv2"
-DEPENDS = ""
-PV = "1.3.1"
-PR = "r0"
-
-SRC_URI = "http://www.hyperrealm.com/libconfig/libconfig-${PV}.tar.gz"
-
-S = "${WORKDIR}/libconfig-${PV}"
-
-inherit autotools
-
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/libconfig/libconfig_1.3.2.bb b/recipes/libconfig/libconfig_1.3.2.bb
new file mode 100644
index 0000000..37958a9
--- /dev/null
+++ b/recipes/libconfig/libconfig_1.3.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Library for manipulating structured configuration files"
+AUTHOR = "Mark Lindner"
+HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2"
+DEPENDS = ""
+PV = "1.3.2"
+
+SRC_URI = "http://www.hyperrealm.com/libconfig/libconfig-${PV}.tar.gz"
+
+S = "${WORKDIR}/libconfig-${PV}"
+
+inherit autotools_stage
+
-- 
1.6.3.3



