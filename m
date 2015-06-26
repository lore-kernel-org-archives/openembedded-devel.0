Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 34F5C601E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:23:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97782680"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2015 16:27:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5Q8Lx4c009258
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 16:21:59 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Jun 2015 16:23:37 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jun 2015 16:23:29 +0800
Message-ID: <1435307010-34957-8-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435307010-34957-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1435307010-34957-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH 7/8] sblim-cmpi-devel: add new recipe
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
X-List-Received-Date: Fri, 26 Jun 2015 08:23:38 -0000
Content-Type: text/plain

sblim-cmpi-devel is dependence of openlmi.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../sblim-cmpi-devel-2.0.3-docdir.patch                | 17 +++++++++++++++++
 .../sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb         | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel/sblim-cmpi-devel-2.0.3-docdir.patch
 create mode 100644 meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb

diff --git a/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel/sblim-cmpi-devel-2.0.3-docdir.patch b/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel/sblim-cmpi-devel-2.0.3-docdir.patch
new file mode 100644
index 0000000..58940c1
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel/sblim-cmpi-devel-2.0.3-docdir.patch
@@ -0,0 +1,17 @@
+Port from Fedora20
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
+diff -up sblim-cmpi-devel-2.0.3/Makefile.in.orig sblim-cmpi-devel-2.0.3/Makefile.in
+--- sblim-cmpi-devel-2.0.3/Makefile.in.orig	2012-07-31 06:11:51.000000000 +0200
++++ sblim-cmpi-devel-2.0.3/Makefile.in	2013-08-07 18:28:09.600712807 +0200
+@@ -221,7 +221,7 @@ build_vendor = @build_vendor@
+ builddir = @builddir@
+ datadir = @datadir@
+ datarootdir = @datarootdir@
+-docdir = $(datadir)/doc/$(PACKAGE)-$(VERSION)
++docdir = $(datadir)/doc/$(PACKAGE)
+ dvidir = @dvidir@
+ exec_prefix = @exec_prefix@
+ host = @host@
diff --git a/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb b/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
new file mode 100644
index 0000000..0e5fc7b
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "SBLIM CMPI Provider Development Support"
+DESCRIPTION = "\
+This packages provides the C and C++ CMPI header files needed by provider \
+developers and can be used standalone. If used for C++ provider development \
+it is also necessary to have tog-pegasus-devel installed."
+HOMEPAGE = "http://sblim.wiki.sourceforge.net/"
+LICENSE = "EPL-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f63d3a4e701129e869e89d7dcac8982"
+SECTION = "Development/Libraries"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sblim/${BP}.tar.bz2 \
+           file://sblim-cmpi-devel-2.0.3-docdir.patch"
+SRC_URI[md5sum] = "b934616f88a848f17ca3cf1b9e792cbf"
+SRC_URI[sha256sum] = "1671cabff6b922b6fde897673d9fdafd56c9310f82a7eacc0547d596b9cdfea6"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.2


