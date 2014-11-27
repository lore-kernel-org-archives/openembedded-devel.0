Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 426FB72366
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:19:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44073990"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Nov 2014 17:16:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAR9JJdZ007253
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:19:19 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 27 Nov 2014 17:19:45 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Nov 2014 17:19:22 +0800
Message-ID: <1417079962-3455-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1416473941-23508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1416473941-23508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH v3] tiptop: Add new recipe
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
X-List-Received-Date: Thu, 27 Nov 2014 09:19:42 -0000
Content-Type: text/plain

Tiptop is a performance monitoring tool for Linux. It provides a
dynamic real-time view of the tasks running in the system. Tiptop
is very similar to the top utility, but most of the information
displayed comes from hardware counters.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/tiptop/tiptop_2.2.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-extended/tiptop/tiptop_2.2.bb

diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
new file mode 100644
index 0000000..126976c
--- /dev/null
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Hardware performance monitoring counters"
+HOMEPAGE = "http://tiptop.gforge.inria.fr/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "ncurses libxml2"
+
+SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz"
+SRC_URI[md5sum] = "74255a29acf44569db021b080ad3e3f7"
+SRC_URI[sha256sum] = "965cb99b16cb59df78363d83b62877ce8501b0aac1116a86bed8a16aa96b171d"
+
+inherit autotools-brokensep
+EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
+COMPATIBLE_HOST = "(i.86|x86_64|arm|powerpc).*-linux"
+
+do_configure_prepend () {
+    # Two bugs in configure.ac when cross-compiling.
+    # 1. The path of libxml2. Specify it in EXTRA_OECONF.
+    # 2. hw's value on other platforms. Replace it if the target is 
+    #    not i*86/x86_64.
+    if ( echo "${TARGET_ARCH}" | grep -q -e 'i.86' -e 'x86_64' ); then
+        sed -i 's= -I/usr/include/libxml2=='    ${S}/configure.ac
+    else
+        sed -i 's/hw=`uname -m`/hw="unknown"/'  ${S}/configure.ac
+        sed -i 's= -I/usr/include/libxml2=='    ${S}/configure.ac
+    fi
+}
-- 
1.8.3.1


