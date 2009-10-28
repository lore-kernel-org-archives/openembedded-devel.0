Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N360w-0001ug-3Y
	for openembedded-devel@openembedded.org; Wed, 28 Oct 2009 11:44:29 +0100
Received: (qmail 31168 invoked by uid 813007); 28 Oct 2009 10:43:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Oct 2009 10:43:21 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 11:45:57 +0100
Message-Id: <1256726758-22996-6-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 5/6] task-proper-tools: added few extra packages
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
X-List-Received-Date: Wed, 28 Oct 2009 10:44:29 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/tasks/task-proper-tools.bb |   35 ++++++++++++++++++++---------------
 1 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/recipes/tasks/task-proper-tools.bb b/recipes/tasks/task-proper-tools.bb
index c5045a1..056109e 100644
--- a/recipes/tasks/task-proper-tools.bb
+++ b/recipes/tasks/task-proper-tools.bb
@@ -1,31 +1,36 @@
 DESCRIPTION = "Full versions of tools provided by busybox"
-PR = "r9"
+PR = "r10"
 
 inherit task
 
 RDEPENDS_${PN} = "\
+		binutils-symlinks \
 		coreutils \
+		cpio \
+		debianutils \
+		diffutils \
+		e2fsprogs \
+		e2fsprogs-fsck \
+		fbset \
 		findutils \
-		util-linux-ng \
-		grep \
 		gawk \
-		sed \
-		wget \
-		patch \
-		tar \
-		diffutils \
+		grep \
+		gzip \
+		iproute2 \
+		iputils \
 		less \
-		vim \
-		e2fsprogs \
-		binutils-symlinks \
 		module-init-tools \
+		netcat \
 		net-tools \
-		iproute2 \
-		iputils \
+		patch \
+		procps \
 		psmisc \
-		debianutils \
+		sed \
+		tar \
 		tcptraceroute \
-		fbset \
+		util-linux-ng \
+		vim \
+		wget \
         "
 #
 # binutils-symlinks provide ar in a way which conflict with busybox - #1465 for more info
-- 
1.6.5





