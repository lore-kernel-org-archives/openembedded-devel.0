Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3D90475A2C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:35:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97692322"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jun 2015 16:39:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5O8XxH9023291
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 16:33:59 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 24 Jun 2015 16:35:58 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Jun 2015 16:26:34 +0800
Message-ID: <1435134394-15393-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-ruby][PATCH] imsettings: fix build error.
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
X-List-Received-Date: Wed, 24 Jun 2015 08:35:37 -0000
Content-Type: text/plain

multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf, otherwise
a configure error as follow will be caught.

  aclocal: error: non-option arguments are not accepted: '\'.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 ...OCAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 21 +++++++++++++++++++++
 .../recipes-extended/imsettings/imsettings_1.6.8.bb |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch

diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
new file mode 100644
index 0000000..9e31847
--- /dev/null
+++ b/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
@@ -0,0 +1,21 @@
+multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
+It will cause configure error as follow.
+
+  aclocal: error: non-option arguments are not accepted: '\'.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp imsettings-1.6.8.orig/Makefile.am imsettings-1.6.8/Makefile.am
+--- imsettings-1.6.8.orig/Makefile.am	2013-02-08 11:33:59.000000000 +0900
++++ imsettings-1.6.8/Makefile.am	2015-06-24 14:15:32.070000007 +0900
+@@ -1,9 +1,7 @@
+ NULL =
+ SUBDIRS = data imsettings imsettings-daemon backends utils po tests docs
+ 
+-ACLOCAL_AMFLAGS =			\
+-	-I m4macros			\
+-	$(NULL)
++ACLOCAL_AMFLAGS = -I m4macros $(NULL)
+ 
+ CONFIGURE_DEPENDENCIES =		\
+ 	requires			\
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
index 91443d7..64a229b 100644
--- a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
+++ b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
@@ -10,7 +10,8 @@ SECTION = "Applications/System"
 inherit autotools gtk-doc
 
 SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
-           file://gtk-is-required-by-notify.patch"
+           file://gtk-is-required-by-notify.patch \
+           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
 
 SRC_URI[md5sum] = "c31429f1d60e36d7f811f871c75b6c41"
 SRC_URI[sha256sum] = "2620ffbf9a6dc842dbf994b4773d4fe355eb77076ccf33f726ba63f16c0d08ba"
-- 
1.9.1


