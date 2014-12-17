Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F01CE72608
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 02:06:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45303450"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Dec 2014 10:02:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBH25kUM003506
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 10:05:46 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Dec 2014 10:06:14 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Dec 2014 10:04:54 +0800
Message-ID: <1418781894-1975-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1418781894-1975-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1418781894-1975-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] mcelog: add new recipe
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
X-List-Received-Date: Wed, 17 Dec 2014 02:06:11 -0000
Content-Type: text/plain

mcelog daemon accounts memory and some other errors in various ways.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/mcelog/mcelog_1.04.bb | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/mcelog/mcelog_1.04.bb

diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.04.bb b/meta-oe/recipes-support/mcelog/mcelog_1.04.bb
new file mode 100644
index 0000000..ceadf7a
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mcelog_1.04.bb
@@ -0,0 +1,28 @@
+SUMMARY = "mcelog daemon accounts memory and some other errors in various ways."
+DESCRIPTION = "mcelog is required by both 32bit x86 Linux kernels (since 2.6.30) \
+and 64bit Linux kernels (since early 2.6 kernel releases) to log machine checks \
+and should run on all Linux systems that need error handling."
+HOMEPAGE = "http://mcelog.org/"
+SECTION = "System Environment/Base"
+DEPENDS += "bash"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git"
+SRC_URI[md5sum] = "a06761ad5fed8596238b5a5ea76ed662"
+SRC_URI[sha256sum] = "519390825ec5a0545a7ed48717ef7c7480bb8b9bce68d63a58a52f4e4e275e0f"
+SRCREV = "9de4924e751346df6e2d40ae1007b40ea1915e2b"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;md5=3eb76ca64fa07ad53ebb0ebb5b4c8ede"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}/${sbindir}
+    install -m 0755 ${S}/mcelog ${D}/${sbindir}
+    install -d ${D}/${mandir}/man8
+    install -m 0644 ${S}/mcelog.8 ${D}/${mandir}/man8/
+    install -d ${D}/etc/cron.hourly
+    install -m 0755 ${S}/mcelog.cron ${D}/etc/cron.hourly/
+}
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
+
+RDEPENDS_${PN} = "bash"
-- 
1.8.4.2


