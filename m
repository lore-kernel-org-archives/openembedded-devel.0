Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2112272624
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 02:05:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45303435"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Dec 2014 10:02:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBH25IcP003470
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 10:05:18 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Dec 2014 10:05:48 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Dec 2014 10:04:53 +0800
Message-ID: <1418781894-1975-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1418781894-1975-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1418781894-1975-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] makedev: add new recipe
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
X-List-Received-Date: Wed, 17 Dec 2014 02:05:47 -0000
Content-Type: text/plain

makedev is a tool for creating the necessary static
device nodes, usually residing in the /dev directory.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/makedev/makedev_3.24.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/makedev/makedev_3.24.bb

diff --git a/meta-oe/recipes-support/makedev/makedev_3.24.bb b/meta-oe/recipes-support/makedev/makedev_3.24.bb
new file mode 100644
index 0000000..18395df
--- /dev/null
+++ b/meta-oe/recipes-support/makedev/makedev_3.24.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "MAKEDEV is a script for creating the necessary static \
+device nodes, usually residing in the /dev directory."
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+SECTION = "base"
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/MAKEDEV/MAKEDEV-${PV}-1.tar.gz/38546d1306ead17afbc34f60c06fcb20/MAKEDEV-${PV}-1.tar.gz"
+SRC_URI[md5sum] = "38546d1306ead17afbc34f60c06fcb20"
+SRC_URI[sha256sum] = "554f9b4a7344addf6a7ea2264f21c726939976cfdd08520e3ed8dd38c5605ffa"
+
+inherit autotools-brokensep pkgconfig
+S = "${WORKDIR}/MAKEDEV-3.24"
+do_install () {
+    oe_runmake DESTDIR=${D} makedevdir=/sbin install
+    rm -fr ${D}/dev
+}
-- 
1.8.4.2


