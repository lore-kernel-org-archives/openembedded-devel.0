Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 702506FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 12:06:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 06 Jul 2017 05:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="1191404338"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2017 05:06:47 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 41109580562;
	Thu,  6 Jul 2017 05:06:46 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jul 2017 15:06:36 +0300
Message-Id: <1499342796-14669-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] gnome-common: Add recipe (from oe-core)
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
X-List-Received-Date: Thu, 06 Jul 2017 12:06:47 -0000

gnome-common is deprecated upstream (it's just a collection of
m4 macros so that's not a huge issue) and more importantly
is soon not used in oe-core.

There are 6 recipes in meta-oe and 22 in meta-gnome that DEPEND on
gnome-common: Move gnome-common unchanged to meta-oe.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

There is a hack still in autoconf-archive where some m4 files are
removed because they conflict with ones in gnome-common: A follow-up
patch is ready to remove those hacks but the correct order is this:
 1 add gnome-common to meta-oe
 2 remove gnome-common from oe-core
 3 remove hacks from meta-oe

This should prevent anything breaking on the way. So I'll send the
other patch as soon as the oe-core changes are done.

Thanks,
 Jussi


 .../gnome-common/gnome-common_3.18.0.bb              | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb

diff --git a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
new file mode 100644
index 0000000..06f3bb3
--- /dev/null
+++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Common macros for building GNOME applications"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SECTION = "x11/gnome"
+inherit gnomebase allarch
+
+SRC_URI[archive.md5sum] = "933258d9c23e218eb6eec9cc1951b053"
+SRC_URI[archive.sha256sum] = "22569e370ae755e04527b76328befc4c73b62bfd4a572499fde116b8318af8cf"
+
+EXTRA_AUTORECONF = ""
+DEPENDS = ""
+
+FILES_${PN} += "${datadir}/aclocal"
+FILES_${PN}-dev = ""
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


