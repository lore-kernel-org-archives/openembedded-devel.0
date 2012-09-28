Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1THUFU-0001Ma-FA
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 08:40:32 +0200
Received: by weyt44 with SMTP id t44so1122867wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2012 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=0cqD914aIN3fmyau0pG6w3ylwuM9WUg0N1iZyHmf3+A=;
	b=oh2eAiqhAY08hcjTWHTwBO3akP95P5rCuEiBHCvYYYRrVBRtP0MPYPKqBFg5bZbXHJ
	xX/vGYjlAH/mebkF2p0Uz0HYUpZrtPLTsI7UudjrFdC4DQZTz/NcstuSmCexc715XXMh
	RiWxVq/zftnTNDE1dUFdSAYn0R1r08+tvpHTcogLKzaxudgUCRMuLvcyJY6Rlmud7XOB
	R56yiuGaWW4AgXct+HupP6HfJIRn9D06Znhxh8I0g8c20yblnqnASzZyu5QqFsC1jBNN
	9YBhA8r4oOwFnrbpiHY6v7MnhfWh87WcDQdpe23ruec9nZ58hVqatQG5XSSPFu1uB/6Q
	3Quw==
Received: by 10.216.204.139 with SMTP id h11mr2935651weo.128.1348813659753;
	Thu, 27 Sep 2012 23:27:39 -0700 (PDT)
Received: from localhost.localdomain (p5B0A31AA.dip.t-dialin.net.
	[91.10.49.170])
	by mx.google.com with ESMTPS id cu1sm35004550wib.6.2012.09.27.23.27.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 23:27:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Sep 2012 08:35:49 +0200
Message-Id: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe, meta-xfce 1/3] glade3: initial add 3.8.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 06:40:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...gnome-doc-utils.make-sysrooted-pkg-config.patch |   51 ++++++++++++++++++++
 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb     |   19 +++++++
 2 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/glade/files/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
 create mode 100644 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb

diff --git a/meta-oe/recipes-devtools/glade/files/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch b/meta-oe/recipes-devtools/glade/files/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
new file mode 100644
index 0000000..1b24c39
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/files/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
@@ -0,0 +1,51 @@
+From aed002cd9ff9e8f972120fbac33b4a65aba952e1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 25 Sep 2012 10:28:33 +0200
+Subject: [PATCH] gnome-doc-utils.make: sysrooted pkg-config
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+same approach as used used in gnome-disk-utility:
+
+In cross environment we have to prepend the sysroot to the path found by
+pkgconfig since the path returned from pkgconfig does not have sysroot prefixed
+it ends up using the files from host system. Now usually people have gnome installed
+so the build succeeds but if you dont have gnome installed on build host then
+it wont find the files on host system and packages using gnome-doc-utils wont
+compile.
+
+This should work ok with non sysrooted builds too since in those cases PKG_CONFIG_SYSROOT_DIR
+will be empty
+
+Upstream-Status: pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ gnome-doc-utils.make |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/gnome-doc-utils.make b/gnome-doc-utils.make
+index 42d9df3..f71bbfa 100644
+--- a/gnome-doc-utils.make
++++ b/gnome-doc-utils.make
+@@ -133,11 +133,11 @@ _DOC_ABS_SRCDIR = @abs_srcdir@
+ _xml2po ?= `which xml2po`
+ _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
+ 
+-_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
+-_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
+-_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
+-_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
+-_ids ?= $(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
++_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
++_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
++_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
++_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
++_ids ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
+ 
+ if ENABLE_SK
+ _ENABLE_SK = true
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
new file mode 100644
index 0000000..8cd6a0e
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Glade - A User Interface Designer"
+HOMEPAGE = "http://www.gnu.org/software/gnash"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
+                    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
+DEPENDS = "gtk+ gnome-doc-utils-native"
+
+inherit autotools pkgconfig pythonnative
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
+           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch"
+SRC_URI[md5sum] = "b5da0ce717b2dc710e93a10b97c0f9ce"
+SRC_URI[sha256sum] = "f180a5018eee6e3fe574854cb025af897dd9962b01d17d5752e626876d388b19"
+
+EXTRA_OECONF += "--disable-scrollkeeper"
+
+FILES_${PN} += "${datadir}/icons"
+FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
+FILES_${PN}-dev += "${libdir}/glade3/modules/*.la"
-- 
1.7.4.4



