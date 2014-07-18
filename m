Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 85284706C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h38S030281; Fri, 18 Jul 2014 09:43:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iJx_M0qGdc26; Fri, 18 Jul 2014 09:43:03 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gwRP030244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:42:59 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kj-0006ib-1e; Fri, 18 Jul 2014 09:42:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:25 +0100
Message-Id: <1405672966-25729-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/27] hplip: Use "foreign" automake strictness and autotools-brokensep
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 08:57:14 -0000

---
 .../recipes-extended/hplip/hplip-3.12.6/configure.patch    | 14 ++++++++++++++
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb             |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/configure.patch

diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/configure.patch b/meta-oe/recipes-extended/hplip/hplip-3.12.6/configure.patch
new file mode 100644
index 0000000..31c005c
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip-3.12.6/configure.patch
@@ -0,0 +1,14 @@
+Index: hplip-3.12.6/configure.in
+===================================================================
+--- hplip-3.12.6.orig/configure.in	2014-07-16 20:03:51.310044196 +0000
++++ hplip-3.12.6/configure.in	2014-07-18 07:53:31.589559192 +0000
+@@ -27,8 +27,7 @@
+ 
+ #AC_PREREQ(2.59)
+ AC_INIT([HP Linux Imaging and Printing], [3.12.6], [3.12.6], [hplip])
+-#AM_INIT_AUTOMAKE([1.9 foreign])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([1.9 foreign])
+ AC_DISABLE_STATIC
+ 
+ # Checks for programs.
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 95b6cab..fc5ef18 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -8,11 +8,12 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://setup-add-sleep-after-cups-reset.patch \
            file://fix-libusb-paths.patch \
            file://cups-1.6.patch \
+           file://configure.patch \
 "
 
 DEPENDS += "cups python libusb"
 
-inherit autotools python-dir pythonnative pkgconfig
+inherit autotools-brokensep python-dir pythonnative pkgconfig
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.0.2


