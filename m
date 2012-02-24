Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0p9m-0001Oj-ES
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 08:01:30 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so968643eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 22:53:10 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.28.205 as permitted sender) client-ip=10.14.28.205; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.28.205 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.28.205])
	by 10.14.28.205 with SMTP id g53mr581900eea.130.1330066390551 (num_hops
	= 1); Thu, 23 Feb 2012 22:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fFX8Q/7tBuGXOKVpXA155s2FNG8oP0I+vfU2k8dMWws=;
	b=jZSNJ3WhgXzz23HC82ig4BQ1N8XxdSQCLGklLQeOWTaYpz9EJC1whhB/jileurklPb
	xmqRcA1zuFZQq6akKqqLIPqEGp6Rc3AerT37hHxTCrYFxFyyIreAhgBeGwwTq/rlb8bv
	3kakW1KLpdCU4ARQ4cbzcJTyP52X0PZbwsIdg=
Received: by 10.14.28.205 with SMTP id g53mr441389eea.130.1330066390477;
	Thu, 23 Feb 2012 22:53:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm14730180eeb.7.2012.02.23.22.53.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 22:53:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 07:53:00 +0100
Message-Id: <41737570e153add481d7f7008fb1e070d1f63a37.1330066140.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1330041429.git.Martin.Jansa@gmail.com>
References: <cover.1330041429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330066140.git.Martin.Jansa@gmail.com>
References: <cover.1330066140.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] kmod: disable man pages generation because we don't have working xsltproc
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
X-List-Received-Date: Fri, 24 Feb 2012 07:01:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-man-page-generation-because-we-don-t-hav.patch |   26 ++++++++++++++++++++
 meta-oe/recipes-kernel/kmod/kmod_git.bb            |    6 +++-
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch

diff --git a/meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch b/meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
new file mode 100644
index 0000000..5361b84
--- /dev/null
+++ b/meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
@@ -0,0 +1,26 @@
+From ce6f0cabb65e67dd4d31e1e555db8bc6eaf435d3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 24 Feb 2012 07:35:38 +0100
+Subject: [PATCH] man: disable man page generation because we don't have
+ working xsltproc
+
+Upstream-Status: Inappropriate [build system specific change]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 141c102..a8bdfd1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = . libkmod/docs man
++SUBDIRS = . libkmod/docs
+ 
+ DISTCLEAN_LOCAL_HOOKS =
+ EXTRA_DIST =
+-- 
+1.7.8.4
+
diff --git a/meta-oe/recipes-kernel/kmod/kmod_git.bb b/meta-oe/recipes-kernel/kmod/kmod_git.bb
index 14c59a3..c382ffc 100644
--- a/meta-oe/recipes-kernel/kmod/kmod_git.bb
+++ b/meta-oe/recipes-kernel/kmod/kmod_git.bb
@@ -3,13 +3,15 @@ DESCRIPTION = "kmod - handle kernel modules"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools gitpkgv
 
 PKGV = "${GITPKGVTAG}"
 SRCREV = "80e54cb675d08f4f81b093a1919465ea86110a3b"
-SRC_URI = "git://git.profusion.mobi/kmod.git"
+SRC_URI = "git://git.profusion.mobi/kmod.git \
+           file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.8.4



