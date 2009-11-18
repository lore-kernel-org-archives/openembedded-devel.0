Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NAkzn-000306-Hl
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 14:54:58 +0100
Received: by fxm1 with SMTP id 1so1145722fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 05:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ZK+nXfIcsu9bvDa9+N0IVOTD52yzBoO8MyJR+D/IjQM=;
	b=miOsNKjDdYeErHzX2DMe5hSiiQfvAeyedKKQaVWYf6CaKY3vjEpsULiXQCWc4iOuJv
	DvU1MUZWDl7N6ejZr2JCBLaq/47FtSAILI8twD1u4XTZtYIFGeG9EVb9fNXkFsb7EWgB
	fB3cfFaCsWXjzj3UADmuDwD/B43lnm5IgAekw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ecpFQ6s5bJMyYw2zZLjelgnQQo1YpfIi9Zy6ygCOwERR5bpvD2TRozBZjh/n4EI6an
	Jb8xu5oI0wSCaeAxGd2hP887nzZ+s7WaYQC93vpWFSfxTE2uSv3BkYJ6DXdcmyExJT3y
	0Tuq6STlNPf+KpmtwPE2bmuceX8BhYAzxn5fI=
Received: by 10.204.24.2 with SMTP id t2mr6227939bkb.65.1258552410658;
	Wed, 18 Nov 2009 05:53:30 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm33307fxm.13.2009.11.18.05.53.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Nov 2009 05:53:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Nov 2009 14:53:22 +0100
Message-Id: <1258552403-11571-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.3
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 06/51] opkg: don't install update-alternatives script
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
X-List-Received-Date: Wed, 18 Nov 2009 13:54:58 -0000

* it is copy of update-alternatives-cworth
* it's not what distribution specifies with
  virtual/update-alternatives(-native)
* make sure that update-alternatives-native is available for image
  creation (added to task-boot)
---
 recipes/opkg/opkg.inc                              |    5 +++--
 .../opkg/dont-install-update-alternatives.patch    |    6 ++++++
 recipes/tasks/task-boot.bb                         |    2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100644 recipes/opkg/opkg/dont-install-update-alternatives.patch

diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index d744e72..3b4cc35 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -4,14 +4,15 @@ SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "curl gpgme"
 PV = "0.1.6+svnr${SRCPV}"
-INC_PR = "r16"
+INC_PR = "r17"
 
 FILESPATHPKG =. "opkg:"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 	file://opkg_unarchive.patch;patch=1;maxrev=201 \
 	file://opkg-intercept-cleanup.patch;patch=1 \
-	file://isatty.patch;patch=1"
+	file://isatty.patch;patch=1 \
+	file://dont-install-update-alternatives.patch;patch=1"
 
 SRC_URI += "file://configure"
 
diff --git a/recipes/opkg/opkg/dont-install-update-alternatives.patch b/recipes/opkg/opkg/dont-install-update-alternatives.patch
new file mode 100644
index 0000000..4ab7707
--- /dev/null
+++ b/recipes/opkg/opkg/dont-install-update-alternatives.patch
@@ -0,0 +1,6 @@
+diff -uNr trunk.orig/utils/Makefile.am trunk/utils/Makefile.am
+--- trunk.orig/utils/Makefile.am	2009-10-24 00:55:25.000000000 +0200
++++ trunk/utils/Makefile.am	2009-11-11 16:56:00.000000000 +0100
+@@ -1 +1 @@
+-bin_SCRIPTS = update-alternatives opkg-key
++bin_SCRIPTS = opkg-key
diff --git a/recipes/tasks/task-boot.bb b/recipes/tasks/task-boot.bb
index 1a1b9f2..bdba970 100644
--- a/recipes/tasks/task-boot.bb
+++ b/recipes/tasks/task-boot.bb
@@ -14,7 +14,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
 # Make sure we build the kernel
-DEPENDS = "virtual/kernel"
+DEPENDS = "virtual/kernel virtual/update-alternatives-native"
 
 #
 # minimal set of packages - needed to boot
-- 
1.6.5.3



