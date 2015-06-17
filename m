Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EE21A60097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:58:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97190623"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jun 2015 16:02:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5H7uZUt016511
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:56:35 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Jun 2015 15:58:24 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jun 2015 15:49:11 +0800
Message-ID: <1434527353-47017-6-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH v2 5/7] libtevent: add new recipe
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
X-List-Received-Date: Wed, 17 Jun 2015 07:58:10 -0000
Content-Type: text/plain

libtevent is required by samba4

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../libtevent/do-not-check-xsltproc-manpages.patch | 16 ++++++++++++
 .../recipes-support/libtevent/libtevent_0.9.21.bb  | 30 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtevent/libtevent/do-not-check-xsltproc-manpages.patch
 create mode 100644 meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb

diff --git a/meta-oe/recipes-support/libtevent/libtevent/do-not-check-xsltproc-manpages.patch b/meta-oe/recipes-support/libtevent/libtevent/do-not-check-xsltproc-manpages.patch
new file mode 100644
index 0000000..1ce4dda
--- /dev/null
+++ b/meta-oe/recipes-support/libtevent/libtevent/do-not-check-xsltproc-manpages.patch
@@ -0,0 +1,16 @@
+Don't check manpages for xsltproc.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp tevent-0.9.21.orig/lib/talloc/wscript tevent-0.9.21/lib/talloc/wscript
+--- tevent-0.9.21.orig/lib/talloc/wscript	2013-09-08 21:24:14.000000000 +0900
++++ tevent-0.9.21/lib/talloc/wscript	2015-04-24 16:28:04.085000230 +0900
+@@ -55,7 +55,7 @@ def configure(conf):
+     if conf.env.standalone_talloc:
+         conf.env.TALLOC_COMPAT1 = Options.options.TALLOC_COMPAT1
+ 
+-    conf.CHECK_XSLTPROC_MANPAGES()
++    conf.find_program('xsltproc', var='XSLTPROC')
+ 
+     if not conf.env.disable_python:
+         # also disable if we don't have the python libs installed
diff --git a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
new file mode 100644
index 0000000..5c7c560
--- /dev/null
+++ b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
+HOMEPAGE = "http://tevent.samba.org"
+SECTION = "libs"
+LICENSE = "LGPLv3+"
+
+DEPENDS += "talloc"
+RDEPENDS_${PN} += "libtalloc"
+RDEPENDS_python-tevent = "python"
+
+SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b"
+
+SRC_URI[md5sum] = "3d5a76c0a1b5f724842d785fd055633f"
+SRC_URI[sha256sum] = "f2be7463573dab2d8210cb57fe7e7e2aeb323274cbdc865a6e29ddcfb977f0f4"
+
+inherit waf-samba
+
+S = "${WORKDIR}/tevent-${PV}"
+
+EXTRA_OECONF += "--disable-rpath \
+                 --bundled-libraries=NONE \
+                 --builtin-libraries=replace \
+                 --with-libiconv=${STAGING_DIR_HOST}${prefix}\
+                 --without-gettext \
+                "
+
+PACKAGES += "python-tevent python-tevent-dbg"
+
+FILES_python-tevent = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES_python-tevent-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug"
-- 
1.9.1


