Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9389D60766
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 08:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9D8SWUN028639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 01:28:32 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 13 Oct 2016 01:28:31 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Oct 2016 16:28:55 +0800
Message-ID: <1476347335-30308-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libsocketcan: upgrade to 0.0.10
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
X-List-Received-Date: Thu, 13 Oct 2016 08:28:32 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...e-strcmp-instead-of-sizeof-on-char-string.patch | 39 ----------------------
 .../socketcan/libsocketcan_0.0.10.bb               | 14 ++++++++
 .../socketcan/libsocketcan_0.0.9.bb                | 20 -----------
 3 files changed, 14 insertions(+), 59 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/socketcan/libsocketcan/0001-Use-strcmp-instead-of-sizeof-on-char-string.patch
 create mode 100644 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb
 delete mode 100644 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb

diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan/0001-Use-strcmp-instead-of-sizeof-on-char-string.patch b/meta-oe/recipes-extended/socketcan/libsocketcan/0001-Use-strcmp-instead-of-sizeof-on-char-string.patch
deleted file mode 100644
index aa6196e..0000000
--- a/meta-oe/recipes-extended/socketcan/libsocketcan/0001-Use-strcmp-instead-of-sizeof-on-char-string.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 94094cc4ee7ae585da3e5e7e83e7d82b5d6de656 Mon Sep 17 00:00:00 2001
-From: Alexander Stein <alexander.stein@systec-electronic.com>
-Date: Wed, 14 Nov 2012 12:13:06 +0100
-Subject: [PATCH] Use strcmp instead of sizeof on char* string
-
-This bug was detected by the clang warning:
-libsocketcan.c:384:16: warning: argument to 'sizeof' in 'strncmp' call
-is the same expression as the source; did you mean to provide an
-explicit length? [-Wsizeof-pointer-memaccess]
-sizeof(name)) != 0)
-~~~~~~~^~~~~~
-
-Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
----
-Upstream-Status: Backport
-
- src/libsocketcan.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/libsocketcan.c b/src/libsocketcan.c
-index fedcbdc..841c2ed 100644
---- a/src/libsocketcan.c
-+++ b/src/libsocketcan.c
-@@ -379,9 +379,8 @@ static int do_get_nl_link(int fd, __u8 acquire, const char *name, void *res)
- 				nl_msg->nlmsg_len - NLMSG_LENGTH(sizeof(struct ifaddrmsg));
- 			parse_rtattr(tb, IFLA_MAX, IFLA_RTA(ifi), len);
- 
--			if (strncmp
--			    ((char *)RTA_DATA(tb[IFLA_IFNAME]), name,
--			     sizeof(name)) != 0)
-+			if (strcmp
-+			    ((char *)RTA_DATA(tb[IFLA_IFNAME]), name) != 0)
- 				continue;
- 
- 			if (tb[IFLA_LINKINFO])
--- 
-1.8.3.1
-
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb
new file mode 100644
index 0000000..60ca580
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Control basic functions in socketcan from userspace"
+HOMEPAGE = "http://www.pengutronix.de"
+SECTION = "libs/network"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38adced4385d8fba1ae2437cedee1"
+
+SRCREV = "51f1610160a1707f026f8c2d714a6f7aa3ca232b"
+
+SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
deleted file mode 100644
index 98ef73f..0000000
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Control basic functions in socketcan from userspace"
-HOMEPAGE = "http://www.pengutronix.de"
-SECTION = "libs/network"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38adced4385d8fba1ae2437cedee1"
-
-SRCREV = "e1a224bf1c409adf0c02b07a90deada634e54b88"
-
-SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git \
-    file://0001-Use-strcmp-instead-of-sizeof-on-char-string.patch \
-"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-do_configure_prepend() {
-    sed -i -e s:tests/GNUmakefile::g -e s:trunk:0.0.9: ${S}/configure.ac
-}
-- 
2.8.3


