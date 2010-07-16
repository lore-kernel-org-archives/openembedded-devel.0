Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZsmX-000898-58
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 23:49:26 +0200
Received: by bwz10 with SMTP id 10so1645900bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 14:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=UdBihraO3H8zt1TKVtX2ILR/jalxWUg6Du/ShZt8C2U=;
	b=YGNlA268R8ZPA4UYrmz/PCNNU/C/0JCml9XevtqnO9qMON7TIkIBOy1phvYrnKiCml
	1DWT8gCKiPMSexiUtLRrntycPkCaNQXX/Vwc1UmAY8xlYkMnKPApaFuLXfa3CUMtrA2Y
	Ktc1KVtkO2YgIOBgF+vbeAWMJ+lf1Degm6ZnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=R3ktqSKydySrk4QdKo5w6q3lQ5KeGR9lBGnCncRGN9JklPYc3CxNarbIU3drY0COSA
	FqSy3g/ptsdMvV1C68A46hp1nRf8UrgmvJ2KxVzY8S8JtKNjtynVLKKVtZk+1U0bQ5V2
	VrAKH4Eu6NanVtzpu9Dt4Qb869NEUKTuThJXE=
Received: by 10.204.152.4 with SMTP id e4mr1367798bkw.120.1279316956700;
	Fri, 16 Jul 2010 14:49:16 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id x19sm12710908bkv.9.2010.07.16.14.49.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 14:49:16 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZsmJ-0002LM-58; Fri, 16 Jul 2010 23:49:07 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: raj.khem@gmail.com
Date: Fri, 16 Jul 2010 23:49:04 +0200
Message-Id: <1279316946-8901-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][CFT 1/3] libmpc: bump version and cleanup staging
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
X-List-Received-Date: Fri, 16 Jul 2010 21:49:26 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/libmpc/libmpc-native_0.8.1.bb |    6 ------
 recipes/libmpc/libmpc_0.8.1.bb        |    9 ++++-----
 recipes/libmpc/libmpc_0.8.2.bb        |   11 +++++++++++
 3 files changed, 15 insertions(+), 11 deletions(-)
 delete mode 100644 recipes/libmpc/libmpc-native_0.8.1.bb
 create mode 100644 recipes/libmpc/libmpc_0.8.2.bb

diff --git a/recipes/libmpc/libmpc-native_0.8.1.bb b/recipes/libmpc/libmpc-native_0.8.1.bb
deleted file mode 100644
index 8ea0a3e..0000000
--- a/recipes/libmpc/libmpc-native_0.8.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libmpc_${PV}.bb
-inherit native
-DEPENDS = "mpfr-native gmp-native"
-
-SRC_URI[md5sum] = "5b34aa804d514cc295414a963aedb6bf"
-SRC_URI[sha256sum] = "e664603757251fd8a352848276497a4c79b7f8b21fd8aedd5cc0598a38fee3e4"
diff --git a/recipes/libmpc/libmpc_0.8.1.bb b/recipes/libmpc/libmpc_0.8.1.bb
index f8b12b7..f79321c 100644
--- a/recipes/libmpc/libmpc_0.8.1.bb
+++ b/recipes/libmpc/libmpc_0.8.1.bb
@@ -1,13 +1,12 @@
 require libmpc.inc
 
 DEPENDS = "gmp mpfr"
-
-SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
 S = "${WORKDIR}/mpc-${PV}"
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
+PR = "1"
 
-do_stage() {
-	autotools_stage_all
-}
+SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "5b34aa804d514cc295414a963aedb6bf"
 SRC_URI[sha256sum] = "e664603757251fd8a352848276497a4c79b7f8b21fd8aedd5cc0598a38fee3e4"
diff --git a/recipes/libmpc/libmpc_0.8.2.bb b/recipes/libmpc/libmpc_0.8.2.bb
new file mode 100644
index 0000000..1d383fa
--- /dev/null
+++ b/recipes/libmpc/libmpc_0.8.2.bb
@@ -0,0 +1,11 @@
+require libmpc.inc
+
+DEPENDS = "gmp mpfr"
+S = "${WORKDIR}/mpc-${PV}"
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
+
+SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e98267ebd5648a39f881d66797122fb6"
+SRC_URI[sha256sum] = "ae79f8d41d8a86456b68607e9ca398d00f8b7342d1d83bcf4428178ac45380c7"
-- 
1.7.1



