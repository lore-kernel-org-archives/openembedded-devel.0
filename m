Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 94A1B706A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fm030280; Fri, 18 Jul 2014 09:43:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id J4JqcA71boYb; Fri, 18 Jul 2014 09:43:09 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gxx7030259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:00 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kk-0006jp-FE; Fri, 18 Jul 2014 09:42:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:40 +0100
Message-Id: <1405672966-25729-21-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 21/27] rp-pppoe: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:12 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.patch   | 11 +++++++++++
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb    |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.patch

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.patch
new file mode 100644
index 0000000..1380ba4
--- /dev/null
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.patch
@@ -0,0 +1,11 @@
+Index: rp-pppoe-3.8/configure.in
+===================================================================
+--- rp-pppoe-3.8.orig/configure.in	2014-07-16 19:31:33.549991388 +0000
++++ rp-pppoe-3.8/configure.in	2014-07-17 22:01:18.116590827 +0000
+@@ -1,4 +1,4 @@
+-AC_INIT(src/pppoe.c)
+-AM_INIT_AUTOMAKE([rp-pppoe], [3.8])
++AC_INIT([rp-pppoe], [3.8])
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_SUBDIRS(src)
+ AC_OUTPUT(Makefile)
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
index b3e60fe..d1b0481 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
            file://dont-swallow-errors.patch \
            file://discard-use-of-dnl-in-Makefile.am.patch \
            file://use-ldflags.patch \
+           file://configure.patch \
            file://pppoe-server.default \
            file://pppoe-server.init"
 
-- 
2.0.2


