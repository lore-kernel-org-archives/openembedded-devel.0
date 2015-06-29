Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 002D46AB99
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 06:43:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97852506"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jun 2015 14:47:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5T6fsTB012279
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 14:41:54 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 29 Jun 2015 14:43:33 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jun 2015 14:34:07 +0800
Message-ID: <1435559647-37696-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH] sysdig: add new recipe
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
X-List-Received-Date: Mon, 29 Jun 2015 06:43:36 -0000
Content-Type: text/plain

sysdig is a tool for system-level exploration and troubleshooting

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
new file mode 100644
index 0000000..72a0386
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
@@ -0,0 +1,32 @@
+SUMMARY = "A New System Troubleshooting Tool Built for the Way You Work"
+DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
+system state and activity from a running Linux instance, then save, \
+filter and analyze."
+HOMEPAGE = "http://www.sysdig.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit cmake pkgconfig
+
+DEPENDS = "luajit zlib ncurses"
+RDEPENDS_${PN} = "bash"
+
+
+SRC_URI = "https://github.com/draios/sysdig/archive/${PV}.tar.gz"
+
+SRC_URI[md5sum] = "5fe96a3a0fd98b2157a40cb29af41afc"
+SRC_URI[sha256sum] = "6995e39be565514901b5cb587689ee2efbf8359293e4e597362382cccf0e9db6"
+
+DIR_ETC="/etc"
+EXTRA_OECMAKE = ' -DUSE_BUNDLED_LUAJIT="OFF" \
+                  -DUSE_BUNDLED_ZLIB="OFF" \
+                  -DBUILD_DRIVER="OFF" \
+                  -DUSE_BUNDLED_NCURSES="OFF" \
+                  -DDIR_ETC="${DIR_ETC}" \
+                '
+
+FILES_${PN} += " \
+    ${DIR_ETC}/* \
+    ${datadir}/zsh/* \ 
+    ${prefix}/src/*  \
+"
-- 
1.8.4.2


