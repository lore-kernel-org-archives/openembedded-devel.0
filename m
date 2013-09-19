Return-Path: <eric@eukrea.com>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id 774C961013
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 20:56:20 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 285654C8229
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 22:56:17 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Sep 2013 22:56:21 +0200
Message-Id: <1379624182-10388-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libsocketcan: upgrade to 0.0.9
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
X-List-Received-Date: Thu, 19 Sep 2013 20:56:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

and include a compile fix

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 ...e-strcmp-instead-of-sizeof-on-char-string.patch | 39 ++++++++++++++++++++++
 ...libsocketcan_0.0.8.bb => libsocketcan_0.0.9.bb} |  7 ++--
 2 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/libsocketcan/0001-Use-strcmp-instead-of-sizeof-on-char-string.patch
 rename meta-oe/recipes-extended/socketcan/{libsocketcan_0.0.8.bb => libsocketcan_0.0.9.bb} (57%)

diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan/0001-Use-strcmp-instead-of-sizeof-on-char-string.patch b/meta-oe/recipes-extended/socketcan/libsocketcan/0001-Use-strcmp-instead-of-sizeof-on-char-string.patch
new file mode 100644
index 0000000..aa6196e
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan/0001-Use-strcmp-instead-of-sizeof-on-char-string.patch
@@ -0,0 +1,39 @@
+From 94094cc4ee7ae585da3e5e7e83e7d82b5d6de656 Mon Sep 17 00:00:00 2001
+From: Alexander Stein <alexander.stein@systec-electronic.com>
+Date: Wed, 14 Nov 2012 12:13:06 +0100
+Subject: [PATCH] Use strcmp instead of sizeof on char* string
+
+This bug was detected by the clang warning:
+libsocketcan.c:384:16: warning: argument to 'sizeof' in 'strncmp' call
+is the same expression as the source; did you mean to provide an
+explicit length? [-Wsizeof-pointer-memaccess]
+sizeof(name)) != 0)
+~~~~~~~^~~~~~
+
+Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+---
+Upstream-Status: Backport
+
+ src/libsocketcan.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/libsocketcan.c b/src/libsocketcan.c
+index fedcbdc..841c2ed 100644
+--- a/src/libsocketcan.c
++++ b/src/libsocketcan.c
+@@ -379,9 +379,8 @@ static int do_get_nl_link(int fd, __u8 acquire, const char *name, void *res)
+ 				nl_msg->nlmsg_len - NLMSG_LENGTH(sizeof(struct ifaddrmsg));
+ 			parse_rtattr(tb, IFLA_MAX, IFLA_RTA(ifi), len);
+ 
+-			if (strncmp
+-			    ((char *)RTA_DATA(tb[IFLA_IFNAME]), name,
+-			     sizeof(name)) != 0)
++			if (strcmp
++			    ((char *)RTA_DATA(tb[IFLA_IFNAME]), name) != 0)
+ 				continue;
+ 
+ 			if (tb[IFLA_LINKINFO])
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
similarity index 57%
rename from meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
rename to meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
index 34ba56b..6b31a1e 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
@@ -5,9 +5,10 @@ SECTION = "libs/network"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38adced4385d8fba1ae2437cedee1"
 
-SRCREV = "3a2cec63a4e6212cc63d21008453bd799cfe8774"
+SRCREV = "e1a224bf1c409adf0c02b07a90deada634e54b88"
 
-SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git \
+SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git \
+    file://0001-Use-strcmp-instead-of-sizeof-on-char-string.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -15,5 +16,5 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 do_configure_prepend() {
-    sed -i -e s:tests/GNUmakefile::g -e s:trunk:0.0.8: configure.ac
+    sed -i -e s:tests/GNUmakefile::g -e s:trunk:0.0.9: configure.ac
 }
-- 
1.8.4.rc3


