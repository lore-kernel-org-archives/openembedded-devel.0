Return-Path: <prvs=673fc8d93=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id DE433746F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 12:25:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,430,1520895600"; 
   d="scan'208";a="1454936"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 May 2018 14:25:00 +0200
Message-ID: <20180522122500.4092-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: dev@g0hl1n.net
Subject: [meta-oe][PATCH] uhubctl: add recipe
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
X-List-Received-Date: Tue, 22 May 2018 12:25:30 -0000
Content-Type: text/plain

Add recipe for uhubctl v2.0.0, an utility to control USB power per-port
on "smart" USB hubs.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...001-Makefile-set-program-version-to-2.0.0.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb   | 22 ++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch
 create mode 100644 meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb

diff --git a/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch b/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch
new file mode 100644
index 000000000..e9e06bc71
--- /dev/null
+++ b/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch
@@ -0,0 +1,34 @@
+From 4f241d2f407e834c30db4047cfb6863cd5f14ea6 Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Tue, 22 May 2018 13:42:20 +0200
+Subject: [PATCH] Makefile: set program version to 2.0.0
+
+Remove the dynamic PROGRAM_VERSION gathering via "git describe" an
+replace it with the hardcoded value "2.0.0".
+
+This is needed because "git describe" fails with an error when executed
+in a non-git directory as it will occur when uhubctl source is not
+downloaded via "git clone". But for example as an source archive.
+
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7074cbf..c80fa17 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,8 +14,7 @@ RM		:= rm -rf
+ CC ?= gcc
+ CFLAGS ?= -g -O0
+ CFLAGS += -Wall -Wextra -std=c99 -pedantic
+-GIT_VERSION := $(shell git describe --abbrev=4 --dirty --always --tags)
+-CFLAGS += -DPROGRAM_VERSION=\"$(GIT_VERSION)\"
++CFLAGS += -DPROGRAM_VERSION=\"2.0.0\"
+ 
+ ifeq ($(UNAME_S),Linux)
+ 	LDFLAGS += -Wl,-z,relro -lusb-1.0
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
new file mode 100644
index 000000000..80fc92332
--- /dev/null
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "USB hub per-port power control"
+HOMEPAGE = "https://github.com/mvp/uhubctl"
+BUGTRACKER = "https://github.com/mvp/uhubctl/issues"
+DEPENDS = "libusb1"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "\
+    https://github.com/mvp/${PN}/archive/v${PV}.tar.gz \
+    file://0001-Makefile-set-program-version-to-2.0.0.patch \
+    "
+SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
+SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} = "${sbindir}/uhubctl"
-- 
2.11.0


