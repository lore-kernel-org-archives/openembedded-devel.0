Received: from cernan.electric.net ([72.35.23.19] helo=out2a.electric.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from
	<mstirling=openembedded-devel=lists.openembedded.org=dfhkgqas@ad-holdings.co.uk>)
	id 1QkDs0-000651-2v for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 13:26:16 +0200
Received: from 1QkCKy-0007n3-Ve by out2a.electric.net with emc1-ok (Exim 4.76)
	(envelope-from <mstirling@ad-holdings.co.uk>)
	id 1QkCKz-0007oN-Uf; Fri, 22 Jul 2011 02:48:05 -0700
Received: by emcmailer; Fri, 22 Jul 2011 02:48:05 -0700
Received: from [213.218.221.154] (helo=localhost.localdomain)
	by out2a.electric.net with esmtpa (Exim 4.72)
	(envelope-from <mstirling@ad-holdings.co.uk>)
	id 1QkCKy-0007n3-Ve; Fri, 22 Jul 2011 02:48:05 -0700
From: Mike Stirling <mstirling@ad-holdings.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jul 2011 10:47:29 +0100
Message-Id: <1311328049-22455-1-git-send-email-mstirling@ad-holdings.co.uk>
X-Mailer: git-send-email 1.7.0.4
X-Outbound-IP: 213.218.221.154
X-Env-From: mstirling@ad-holdings.co.uk
X-PolicySMART: 794533
X-Virus-Status: Scanned by VirusSMART (c)
Cc: Mike Stirling <mstirling@chipwrights.com>
Subject: [PATCH] vblade: Fix GNU_HASH QA error
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
X-List-Received-Date: Fri, 22 Jul 2011 11:26:16 -0000

From: Mike Stirling <mstirling@chipwrights.com>

Build fails QA with (at least) external-toolchain-csl.  Fix patches makefile to pass OE's LDFLAGS to linker.

Upstream-Status: Pending - issue still exists in vblade-20

Signed-off-by: Mike Stirling <mstirling@chipwrights.com>
---
 recipes/vblade/files/ldflags.patch |   12 ++++++++++++
 recipes/vblade/vblade_19.bb        |    5 +++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 recipes/vblade/files/ldflags.patch

diff --git a/recipes/vblade/files/ldflags.patch b/recipes/vblade/files/ldflags.patch
new file mode 100644
index 0000000..3350513
--- /dev/null
+++ b/recipes/vblade/files/ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN vblade-19.orig/makefile vblade-19/makefile
+--- vblade-19.orig/makefile	2011-07-20 15:45:43.851538824 +0100
++++ vblade-19/makefile	2011-07-20 15:46:26.863358466 +0100
+@@ -11,7 +11,7 @@
+ O=aoe.o bpf.o ${PLATFORM}.o ata.o
+ 
+ vblade: $O
+-	${CC} -o vblade $O
++	${CC} ${LDFLAGS} -o vblade $O
+ 
+ aoe.o : aoe.c config.h dat.h fns.h makefile
+ 	${CC} ${CFLAGS} -c $<
diff --git a/recipes/vblade/vblade_19.bb b/recipes/vblade/vblade_19.bb
index f100a46..7b3504a 100644
--- a/recipes/vblade/vblade_19.bb
+++ b/recipes/vblade/vblade_19.bb
@@ -1,10 +1,11 @@
 DESCRIPTION = "Virtual EtherDrive blade AoE target"
 SECTION = "console/network"
-PR = "r1"
+PR = "r2"
 LICENSE = "GPL"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${PN}-${PV}.tgz \
-	   file://cross.patch"
+	   file://cross.patch \
+	   file://ldflags.patch"
 
 inherit autotools
 
-- 
1.7.0.4



