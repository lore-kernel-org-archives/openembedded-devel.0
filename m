Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DD4C07FA4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472Qh349D3zQN
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572340019;
	bh=xKRYqsTSmA+/XzsyKrN/hm4oQh8aUZkJlAHyhArEO7M=;
	h=From:To:Subject:Date:From;
	b=CizdZoMFEeupTVAPPkyZi73OXeF0L8Pi922GywnWDhKyTbdkeuKcKWOrdz6z6oc3P
	tVDn96hfSxrSnl2RMl0ix6OrKtAqVAwMi1Pn0/gwvnBXysHWRLWVT6198qp626Y67H
	s78+7HrHqMXObC1o5HQG9n0CVuXeNGvRme+XSpe31VJEtdAfFzmnc8x102GcsnjXSO
	lW4iZ2EPMQw9lwoL2LrA1NhOTBTjkc5DYifOMl0rEA1NtA9Is7uajDpuZ9mdPa+SAQ
	0b667UCWXovO2sZymvk0Skyv2J1qavsaKCv81SUVEm3TcXdcSxowMa9VuF7ySsEpwj
	cV79fvdmVjeJRbqknK9OUjQRvQEhWru6cvXhGyCa8HiNrUJ2OISYffQowc+QuTwAC2
	9I47QzK+tKrnkobSfBCEHaRqyGzPmhUtDhctsQrNjJIS0wVvKM85AtoJSLCNrY08xv
	ENSnqwslYQ/5z9V64U61S5arCi2xNsbvB/iFvPpk63PIYn9pX/G+j3qHNiKDELZXhx
	eJNcJRI88SiqgiJCuoPZ0QCF6l7PUErTDdnfIKjaQT+0KMYbemYb8z2HYO9x6d4lDP
	pf3kyJnjek3zs5e7lS1+BRSwKrGSB5/jSzKpYWvOmJWj3LLSG3NdeA5cRPxxPoOANL
	1Z74oHKxb7fOwkbVhPS8eYf0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 11:06:55 +0200
Message-Id: <20191029090657.30771-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] usrsctp: Upgrade to a more recent git snapshot
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
X-List-Received-Date: Tue, 29 Oct 2019 09:06:59 -0000

Patch applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...0001-Use-foreign-switch-for-automake.patch | 28 -------------------
 .../recipes-protocols/usrsctp/usrsctp_git.bb  |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp/0001-Use-foreign-switch-for-automake.patch

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp/0001-Use-foreign-switch-for-automake.patch b/meta-networking/recipes-protocols/usrsctp/usrsctp/0001-Use-foreign-switch-for-automake.patch
deleted file mode 100644
index b932ebbb4..000000000
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp/0001-Use-foreign-switch-for-automake.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 748bc693cf24baf42e459e12f152349e392b6737 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 20 Dec 2016 21:32:11 -0800
-Subject: [PATCH] Use foreign switch for automake
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 64cc9994..19ccd4a3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -29,7 +29,7 @@ dnl SUCH DAMAGE.
- dnl
- 
- AC_INIT([libusrsctp], [0.9.3.0])
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- 
- AC_PROG_CC
- AC_PROG_LIBTOOL
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index 3ec746684..a5a5605da 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -2,9 +2,8 @@ DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
 
-SRCREV = "dbfc1b8c4cf1a46a4d8987ba542d5ff06bdaf14c"
+SRCREV = "a10cd498d964508c0e6ec6bd2be9dd4afcbb4d86"
 SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
-           file://0001-Use-foreign-switch-for-automake.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


