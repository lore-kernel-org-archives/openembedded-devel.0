Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6777E807
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 12:44:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45cn9w3Pxfz3t
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 14:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561985044;
	bh=G+lAmnBSA6pk5SfnUXo8hD3ZujzXYuhMY7t1Ne8JBvo=;
	h=From:To:Subject:Date:From;
	b=oZym6x5hxxiYnWWndxj/mIl5g46M9cX4mtl63zWGlVmuhfyCTRLZy8V77rRGTMOFS
	vaVss8Ra/V14gIqNqtILvGjcQE64gsl1VPqHjJXPVY6p68eoVv4EfDLgGMC0DjEFfb
	CSW+jmyMuPZcgHdvTPZZggZHy2jn/RxTST4Bdo4cPSzgRh4w7ENIGQ4nJeA19B71lb
	ZzYtuDnIfYO5bFglQ0JXgVu1NI6vmAQRY0CmWt2+YBCConfNxq6jfNS1KsPV/1YqV5
	h8AaekaPLKB1Vyv6vIuTZ9JSzxveHbsI1ojGarm87h3Kl8u+PtQgg8HlfczKKSUP7P
	rA1QOFrcj4Qvt2ftRtneuYAgzhsPWfc87FAMBqKv6QNzdB+9EmrcjrwKMycEm8EbtM
	BLaufFpsVf+Zc/kO7FU7vkC7hxnOOXgAQmZqSLTN3Imkg9h3AAJ07jDGCpzoZMDuLj
	SXaGkpbZxAGzLwW/ZFVm/Sb9sZa/nezksHBImg6w+daZEngN32k8r1S1gCQ9Lyg6CF
	yRaFApkTTV6AD87JtssqB7IDo+vXDcsnPhJbOl6bm7W77FYHJT1k3AqSSZNWBZtwxX
	ZfdJM8HRNCdS6HpCVlfpli5BWXsS4ECo5EXJmKzC9+aPhmGGHYmAVG9/wt9Xluf6hI
	Fhs+jZDLxDsAZmsmyimk+FwA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 15:44:03 +0300
Message-Id: <20190701124403.26479-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] blueman: Enable thunar support by default but don't rdepend on it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jul 2019 12:44:04 -0000

This matches upstream default.
The no longer required bbappend in meta-xfce is also removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-networking/recipes-connectivity/blueman/blueman_git.bb | 3 ++-
 meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend   | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)
 delete mode 100644 meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
index 947db7836..91b64a36b 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
@@ -28,7 +28,8 @@ RDEPENDS_${PN} += " \
     packagegroup-tools-bluetooth \
 "
 
-PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto,,thunar"
+PACKAGECONFIG ??= "thunar"
+PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
diff --git a/meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend b/meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend
deleted file mode 100644
index 916f083b9..000000000
--- a/meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-# Just a comment line to avoid PAK archive (application/x-pak)
-PACKAGECONFIG_append = " thunar"
-- 
2.17.1


