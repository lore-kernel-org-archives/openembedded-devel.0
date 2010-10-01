Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P1dK9-0004Zf-R1
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 12:58:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6A649314835A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 12:58:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bFPOZIi2Nhj9; Fri,  1 Oct 2010 12:58:24 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 55D023147E1F;
	Fri,  1 Oct 2010 12:58:23 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 01 Oct 2010 10:58:23 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 10:58:16 +0000
Message-Id: <1285930696-15173-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285836574.3805.42.camel@mattotaupa>
References: <1285836574.3805.42.camel@mattotaupa>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 05/16] netkit-base-0.17: fix compile with gcc-4.x
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
X-List-Received-Date: Fri, 01 Oct 2010 10:58:55 -0000

* v2: Added header to patch.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../netkit-base-0.17/gcc4_buildfix.patch           |   19 +++++++++++++++++++
 recipes/netkit-base/netkit-base_0.17.bb            |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
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
index c9864ae..4e70164 100644
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
 
-- 
1.7.1



