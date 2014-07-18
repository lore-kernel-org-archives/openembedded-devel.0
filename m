Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3DF70691
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fh030280; Fri, 18 Jul 2014 09:43:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gKrReKC6MYAO; Fri, 18 Jul 2014 09:43:06 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gwG5030252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:00 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kj-0006jF-RX; Fri, 18 Jul 2014 09:42:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:33 +0100
Message-Id: <1405672966-25729-14-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/27] ipsec-tools: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:16 -0000

---
 .../recipes-support/ipsec-tools/ipsec-tools/configure.patch | 13 +++++++++++++
 .../recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb        |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/configure.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/configure.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/configure.patch
new file mode 100644
index 0000000..8d270a6
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/configure.patch
@@ -0,0 +1,13 @@
+Index: ipsec-tools-0.8.1/configure.ac
+===================================================================
+--- ipsec-tools-0.8.1.orig/configure.ac	2013-01-08 12:43:29.000000000 +0000
++++ ipsec-tools-0.8.1/configure.ac	2014-07-18 07:51:30.045555880 +0000
+@@ -6,7 +6,7 @@
+ AC_CONFIG_SRCDIR([configure.ac])
+ AC_CONFIG_HEADERS(config.h)
+ 
+-AM_INIT_AUTOMAKE(dist-bzip2)
++AM_INIT_AUTOMAKE([foreign dist-bzip2])
+ 
+ AC_ENABLE_SHARED(no)
+ 
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
index fcf329c..2e5c0a4 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -10,6 +10,7 @@ DEPENDS = "virtual/kernel openssl readline flex-native bison-native"
 SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV}.tar.bz2 \
            file://0001-Fix-warning-with-gcc-4.8.patch \
            file://0002-Don-t-link-against-libfl.patch \
+           file://configure.patch \
           "
 SRC_URI[md5sum] = "d38b39f291ba2962387c3232e7335dd8"
 SRC_URI[sha256sum] = "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
-- 
2.0.2


