Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsK-0000ZB-Rm
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:47 +0100
Received: by mail-ew0-f224.google.com with SMTP id 24so4866221ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=0CNkxwL5n7kYz4xHFxZB5QQOGJDTRdaS1kHA0Nmw4OY=;
	b=r0Ly5P4fRsVj7OJQ4q6DoTp1BGGuv8rs2AzPuDkCdZOBB8hOoXE+qL80VsLrSmf0w7
	0V5QTdaoVC9aICejrlYNIj0dhyOdlEz+I/BQKn+k+zDJcyS7sni8ygoP8O74iaYoi75v
	y73IOKwy0Qvn67Vv79lqHnfjYYVawbQC7OUXk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CoDlyMJlB2NpY+L3p+ddKiuxCNL8lPGab6zccAaKzUP1RKobMuubAmnlxrzc1e9K+5
	YonuNefphwJ3ZIHbKDx393VGVAhKHSKnjhXqmR3+ImZyufYhwHqqqRod4thcKCnM9d2/
	+wAX16dXl6BQE0apSPZm8NABD2JaZ1afXLYl0=
Received: by 10.213.98.144 with SMTP id q16mr6203181ebn.29.1260139508158;
	Sun, 06 Dec 2009 14:45:08 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:07 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:44 +0100
Message-Id: <1260139496-21442-9-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-8-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] gcc{, -cross}{, -intermediate}_nios2-3.4.6.bb: GCC for nios2.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:48 -0000

gcc-cross for nios2. This is from a non-upstream, GIT'd fork of
GCC for the nios2 architecture, community maintained.

Tested-by: Walter Goossens <walter.goossens@axon.tv>
Tested-by: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 recipes/gcc/gcc-cross-initial_nios2-3.4.6.bb      |    2 ++
 recipes/gcc/gcc-cross-intermediate_nios2-3.4.6.bb |    2 ++
 recipes/gcc/gcc-cross_nios2-3.4.6.bb              |    9 +++++++++
 recipes/gcc/gcc_nios2-3.4.6.inc                   |   19 +++++++++++++++++++
 4 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gcc/gcc-cross-initial_nios2-3.4.6.bb
 create mode 100644 recipes/gcc/gcc-cross-intermediate_nios2-3.4.6.bb
 create mode 100644 recipes/gcc/gcc-cross_nios2-3.4.6.bb
 create mode 100644 recipes/gcc/gcc_nios2-3.4.6.inc

diff --git a/recipes/gcc/gcc-cross-initial_nios2-3.4.6.bb b/recipes/gcc/gcc-cross-initial_nios2-3.4.6.bb
new file mode 100644
index 0000000..1639511
--- /dev/null
+++ b/recipes/gcc/gcc-cross-initial_nios2-3.4.6.bb
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-initial.inc
diff --git a/recipes/gcc/gcc-cross-intermediate_nios2-3.4.6.bb b/recipes/gcc/gcc-cross-intermediate_nios2-3.4.6.bb
new file mode 100644
index 0000000..eb59de9
--- /dev/null
+++ b/recipes/gcc/gcc-cross-intermediate_nios2-3.4.6.bb
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
diff --git a/recipes/gcc/gcc-cross_nios2-3.4.6.bb b/recipes/gcc/gcc-cross_nios2-3.4.6.bb
new file mode 100644
index 0000000..ae439f9
--- /dev/null
+++ b/recipes/gcc/gcc-cross_nios2-3.4.6.bb
@@ -0,0 +1,9 @@
+PR = "r13"
+
+require gcc_nios2-3.4.6.inc
+require gcc-cross.inc
+require gcc-configure-cross.inc
+require gcc-package-cross.inc
+
+DEPENDS += "elf2flt-cross"
+
diff --git a/recipes/gcc/gcc_nios2-3.4.6.inc b/recipes/gcc/gcc_nios2-3.4.6.inc
new file mode 100644
index 0000000..9b2a54a
--- /dev/null
+++ b/recipes/gcc/gcc_nios2-3.4.6.inc
@@ -0,0 +1,19 @@
+JAVA = ""
+FORTRAN = ""
+OBJC = ""
+SHARED_LIBRARIES = "no"
+EXTRA_OECONF_append_nios2 = " --enable-cxx-flags=-static "
+require gcc-common.inc
+#DEPENDS += "elf2flt-cross"
+
+BINV = "3.4.6"
+PV = "nios2-3.4.6"
+
+GCCREV = "b773f7eccc6cc2ffa8fa2bd201ea62f24ba0bb41"
+SRCREV = "b773f7eccc6cc2ffa8fa2bd201ea62f24ba0bb41"
+
+SRC_URI = "git://sopc.et.ntust.edu.tw/git/gcc3.git;protocol=http;branch=nios2-linux"
+
+S = "${WORKDIR}/git"
+
+SRC_URI += "file://gcc-posix-open-fix.patch;patch=1"
-- 
1.6.0.4



