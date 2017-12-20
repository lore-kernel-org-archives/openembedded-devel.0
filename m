Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C096D781DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 05:35:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="31880914"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Dec 2017 13:35:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A495D486A76E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 13:35:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 20 Dec 2017 13:35:44 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Dec 2017 22:35:09 +0800
Message-ID: <1513780509-29610-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: A495D486A76E.A62AD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libyui: new add
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
X-List-Received-Date: Wed, 20 Dec 2017 05:35:40 -0000
Content-Type: text/plain

Add a new recipe libyui, which is a rdepend for dnfdragora.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/libyui/libyui_git.bb | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui_git.bb

diff --git a/meta-oe/recipes-graphics/libyui/libyui_git.bb b/meta-oe/recipes-graphics/libyui/libyui_git.bb
new file mode 100644
index 0000000..9b1d1d8
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Libyui is a widget abstraction library providing Qt, GTK and ncurses frontends."
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                   "
+
+SRC_URI = "git://github.com/libyui/libyui.git \
+           "
+
+PV = "3.3.3+git"
+SRCREV = "f4ccea39f6b6f37eabd0a4df49db5f9bcb3c013a"
+
+S = "${WORKDIR}/git"
+
+inherit cmake gettext pkgconfig
+
+DEPENDS += "boost"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_configure_prepend () {
+        cd ${S}
+        ./bootstrap.sh
+        cd -
+}
+
+do_install_append () {
+        if [ "${libdir}" = "${base_prefix}/usr/lib" ] && [ -d ${D}/usr/lib64 ]; then
+            mv ${D}/usr/lib64 ${D}/usr/lib
+        fi
+}
+
+do_install_append_class-nativesdk () {
+        mkdir -p ${D}/${base_prefix}
+        mv ${D}/usr ${D}/${base_prefix}
+}
+
+FILES_${PN}-dev = "${libdir}/* ${includedir}/yui*"
-- 
2.7.4




