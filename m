Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5450D706BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:08 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h38a030281; Fri, 18 Jul 2014 09:43:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dZvTMglOAFMU; Fri, 18 Jul 2014 09:43:08 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gxEJ030260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:01 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kk-0006jt-Hx; Fri, 18 Jul 2014 09:42:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:41 +0100
Message-Id: <1405672966-25729-22-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 22/27] mtr: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:08 -0000

---
 meta-networking/recipes-support/mtr/files/configure.patch | 12 ++++++++++++
 meta-networking/recipes-support/mtr/mtr_0.82.bb           |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta-networking/recipes-support/mtr/files/configure.patch

diff --git a/meta-networking/recipes-support/mtr/files/configure.patch b/meta-networking/recipes-support/mtr/files/configure.patch
new file mode 100644
index 0000000..c978b87
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/files/configure.patch
@@ -0,0 +1,12 @@
+Index: mtr-0.82/configure.in
+===================================================================
+--- mtr-0.82.orig/configure.in	2014-07-16 19:52:56.306026346 +0000
++++ mtr-0.82/configure.in	2014-07-17 21:59:03.208587150 +0000
+@@ -1,5 +1,5 @@
+-AC_INIT(mtr.c)
+-AM_INIT_AUTOMAKE(mtr, 0.82)
++AC_INIT(mtr.c, 0.82)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ 
+ AC_SUBST(GTK_OBJ)
diff --git a/meta-networking/recipes-support/mtr/mtr_0.82.bb b/meta-networking/recipes-support/mtr/mtr_0.82.bb
index 3a93948..b9a1ea2 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.82.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.82.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://mtr.c;beginline=5;endline=16;md5=56e390ced194aff352eefab404883057"
 
 SRC_URI = "ftp://ftp.bitwizard.nl/mtr/mtr-${PV}.tar.gz \
+           file://configure.patch \
            file://no-gtk.patch"
 
 SRC_URI[md5sum] = "10601ea543fda3e51545c4bce195b64c"
-- 
2.0.2


