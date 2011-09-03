Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qzvbh-0005RH-OD
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 21:10:21 +0200
Received: by bkbzu17 with SMTP id zu17so3354733bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2011 12:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6RLt+QV8/H/JaQavDSQndzQ9mc0u1GjtQSamfdaQGrQ=;
	b=SZNfi0/6izLo0d/zFprsD+g/48ouveO2xDbD0v4mFEU0r/K6cKLLowTzI9cYQbmU3W
	fI6WyGTVwJWZtSE3zgGmcNkG444MBX44zR8WTuhuWK4YZDP1+/KHjL/fNJI+dB5+lUM2
	xID/ISAWrjnRLFl4wfP/M2i0lyISKRqxYeirg=
Received: by 10.204.135.1 with SMTP id l1mr1286726bkt.270.1315076723693;
	Sat, 03 Sep 2011 12:05:23 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id k23sm657019bkd.6.2011.09.03.12.05.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 12:05:22 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Sep 2011 23:05:16 +0400
Message-Id: <1315076717-10236-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [RESEND][meta-oe 1/2] gnome-disk-utility: disable scrollkeeper
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
X-List-Received-Date: Sat, 03 Sep 2011 19:10:21 -0000

scrollkeeper isn't packaged neither in oe.dev, nor in any oe-core based
layer. Disable scrollkeeper in gnome-disk-utils.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../gnome-disk-utility/disable-scrollkeeper.patch  |   27 ++++++++++++++++++++
 .../gnome-disk-utility_2.32.0.bb                   |    6 ++++
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/disable-scrollkeeper.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/disable-scrollkeeper.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/disable-scrollkeeper.patch
new file mode 100644
index 0000000..f36942d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/disable-scrollkeeper.patch
@@ -0,0 +1,27 @@
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Subject: Disable scrollkeeper-config not found message
+Upstream-Status: Not-Applicable
+
+If scrollkeeper-config isn't found, configure fails with an error.
+Fix that by commenting out the check.
+
+Signed-Off-By: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+
+Index: gnome-disk-utility-2.32.0/configure.ac
+===================================================================
+--- gnome-disk-utility-2.32.0.orig/configure.ac	2010-09-15 19:07:25.000000000 +0400
++++ gnome-disk-utility-2.32.0/configure.ac	2011-08-20 01:29:48.000000000 +0400
+@@ -188,9 +188,9 @@
+ # *************
+
+ AC_PATH_PROG(SCROLLKEEPER_CONFIG, scrollkeeper-config,no)
+-if test x$SCROLLKEEPER_CONFIG = xno; then
+-  AC_MSG_ERROR(Couldn't find scrollkeeper-config, please install the scrollkeeper package)
+-fi
++dnl if test x$SCROLLKEEPER_CONFIG = xno; then
++dnl  AC_MSG_ERROR([Couldn't find scrollkeeper-config, please install the scrollkeeper package])
++dnl fi
+
+ # ********************
+ # Internationalization
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index e8069e9..f7945c5 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -9,5 +9,11 @@ inherit gnome
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
 SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d962652f4de6a98"
 
+SRC_URI += "\
+     file://disable-scrollkeeper.patch \
+     "
+
+EXTRA_OECONF += "--disable-scrollkeeper"
+
 PACKAGES =+ "${PN}-nautilus-extension"
 FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
-- 
1.7.2.5



