Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 446DA782D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:34:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6L7Yp55009743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jul 2017 00:34:51 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:34:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:38 -0400
Message-ID: <629074372116cb38c8d6887305217e46d5e7921a.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 01/10] keybinder: add recipe 3.0
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
X-List-Received-Date: Fri, 21 Jul 2017 07:34:51 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-support/keybinder/keybinder_3.0.bb     | 26 ++++++++++++++++++++++
 meta-oe/licenses/X11                               | 23 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
 create mode 100644 meta-oe/licenses/X11

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
new file mode 100644
index 0000000..d6744a3
--- /dev/null
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "keybinder is a library for registering global key bindings, for gtk-based applications."
+HOMEPAGE = "https://github.com/engla/keybinder"
+LICENSE = "X11"
+SECTION = "devel/lib"
+DEPENDS = "gtk+3 gobject-introspection-native \
+           gtk+ \
+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1f18f9c6d8b4cfcc7d7804a243a4c0b4"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+SRCREV = "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
+PV = "3.0+git${SRCPV}"
+SRC_URI = "git://github.com/engla/keybinder.git;branch=keybinder-3.0 \
+"
+
+RDEPENDS_${PN} = "gtk+"
+
+inherit autotools gtk-doc gobject-introspection
+do_configure_prepend() {
+	touch ${S}/ChangeLog
+}
+
+SRC_DISTRIBUTE_LICENSES += "X11"
diff --git a/meta-oe/licenses/X11 b/meta-oe/licenses/X11
new file mode 100644
index 0000000..da3e406
--- /dev/null
+++ b/meta-oe/licenses/X11
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2008 Alex Graveley
+ * Copyright (C) 2010 Ulrik Sverdrup <ulrik.sverdrup@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
-- 
2.8.1


