Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6CE6CBD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 12:52:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0KCqQia017143
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 04:52:26 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 20 Jan 2014 04:52:26 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Jan 2014 20:52:35 +0800
Message-ID: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-networking] [PATCH] traceroute: filter-out patches dir
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
X-List-Received-Date: Mon, 20 Jan 2014 12:52:27 -0000
Content-Type: text/plain

The $(subdirs) contains all the dirs under the ${B}, and this one:

do_unpack[cleandirs] = "${S}/patches"

will create a "patches" dir, then there will be compile errors, filter
out the patches will fix the problem.

Note: poky doesn't have this problem since it separates the ${S} and
${B}

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../filter-out-the-patches-from-subdirs.patch      | 47 ++++++++++++++++++++++
 .../traceroute/traceroute_2.0.18.bb                |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-support/traceroute/traceroute/filter-out-the-patches-from-subdirs.patch

diff --git a/meta-networking/recipes-support/traceroute/traceroute/filter-out-the-patches-from-subdirs.patch b/meta-networking/recipes-support/traceroute/traceroute/filter-out-the-patches-from-subdirs.patch
new file mode 100644
index 0000000..2c030b5
--- /dev/null
+++ b/meta-networking/recipes-support/traceroute/traceroute/filter-out-the-patches-from-subdirs.patch
@@ -0,0 +1,47 @@
+From e273e0ebc753645555909bcc4874c72458b17891 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 17 Jan 2014 03:17:44 -0500
+Subject: [PATCH] Make.rules: filter-out the patches from subdirs
+
+The $(subdirs) contains all the dirs under the ${B}, and this one:
+
+do_unpack[cleandirs] = "${S}/patches"
+
+will create a "patches" dir, then there will be compile errors, filter
+out the patches will fix the problem.
+
+Note: poky doesn't have this problem since it separates the ${S} and
+${B}
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Make.rules |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index b077cd5..0bfce2d 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -97,7 +97,7 @@ endif
+ subdirs := $(filter-out $(SKIPDIRS), $(subdirs))
+ endif
+ 
+-install install-%: subdirs := $(filter-out $(SKIPINSTALL), $(subdirs))
++install install-%: subdirs := $(filter-out $(SKIPINSTALL) patches, $(subdirs))
+ 
+ 
+ override MAKE += srcdir=$(srcdir) subdirs="$(subdirs)" shared=$(shared)
+@@ -106,7 +106,7 @@ override MAKE += srcdir=$(srcdir) subdirs="$(subdirs)" shared=$(shared)
+ INCLUDEDIRS := $(filter $(INCLUDEDIRS), $(subdirs))
+ LIBDIRS := $(filter $(LIBDIRS), $(subdirs))
+ MODDIRS := $(filter $(MODDIRS), $(subdirs))
+-EXEDIRS := $(filter-out $(INCLUDEDIRS) $(LIBDIRS) $(MODDIRS), $(subdirs))
++EXEDIRS := $(filter-out $(INCLUDEDIRS) $(LIBDIRS) $(MODDIRS) patches, $(subdirs))
+ MODUSERS := $(filter $(MODUSERS), $(subdirs))
+ SBINUSERS := $(filter $(SBINUSERS), $(subdirs))
+ 
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
index e6718db..31c16aa 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
@@ -16,6 +16,7 @@ PR = "r1"
 inherit update-alternatives
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2.0.18/traceroute-2.0.18.tar.gz \
+           file://filter-out-the-patches-from-subdirs.patch \
 "
 
 SRC_URI[md5sum] = "b7254149b7f081cce07f4b9e065ba5ef"
-- 
1.8.3.1


