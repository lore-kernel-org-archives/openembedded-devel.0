Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13VD-0001lQ-6B
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 10A233148E32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id X0jvQ4WzpDTL; Wed, 29 Sep 2010 22:37:04 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id E39EA3148E1E;
	Wed, 29 Sep 2010 22:37:01 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:01 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:22 +0000
Message-Id: <1285792594-10032-7-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/18] netkit-base-0.17: fix compile with gcc-4.x
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:54 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../netkit-base-0.17/gcc4_buildfix.patch           |   11 +++++++++++
 recipes/netkit-base/netkit-base_0.17.bb            |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch

diff --git a/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch b/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch
new file mode 100644
index 0000000..f284f1a
--- /dev/null
+++ b/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch
@@ -0,0 +1,11 @@
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



