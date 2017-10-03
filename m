Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0842477B39
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:58:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 02 Oct 2017 18:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,472,1500966000"; d="scan'208";a="906072786"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2017 18:58:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 14:58:03 +1300
Message-Id: <5286c04f07048d6547bc53ed6e4745905b4061d6.1506995850.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1506995850.git.paul.eggleton@linux.intel.com>
References: <cover.1506995850.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/1] dnsmasq: upgrade to 2.78
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
X-List-Received-Date: Tue, 03 Oct 2017 01:58:35 -0000

This update fixes a number of bugs including the following
vulnerabilities:

  CVE-2017-13704
  CVE-2017-14491
  CVE-2017-14492
  CVE-2017-14493
  CVE-2017-14494
  CVE-2017-14495
  CVE-2017-14496

Further details can be found in the changelog here:

  http://www.thekelleys.org.uk/dnsmasq/CHANGELOG

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/dnsmasq/dnsmasq/lua.patch         | 19 ++++++++++---------
 .../recipes-support/dnsmasq/dnsmasq_2.76.bb           |  8 --------
 .../recipes-support/dnsmasq/dnsmasq_2.78.bb           |  8 ++++++++
 3 files changed, 18 insertions(+), 17 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
index 918c0b6..0991dd8 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -1,29 +1,30 @@
-From 1e5be0a0bcf85913d63408030dec038d360a5fa6 Mon Sep 17 00:00:00 2001
+From be1b3d2d0f1608cba5efee73d6aac5ad0709041b Mon Sep 17 00:00:00 2001
 From: Joe MacDonald <joe_macdonald@mentor.com>
 Date: Tue, 9 Sep 2014 10:24:58 -0400
 Subject: [PATCH] Upstream-status: Inappropriate [OE specific]
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 ---
- Makefile |    4 ++--
+ Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index fc38393..a79f8bf 100644
+index 73ea23e..ed3eeb9 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -57,8 +57,8 @@ idn_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_CONFIG) -
- idn_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_CONFIG) --libs libidn` 
+@@ -59,8 +59,8 @@ idn2_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFI
+ idn2_libs =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFIG) --libs libidn2`
  ct_cflags =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
  ct_libs =       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
--lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua5.1` 
--lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.1` 
+-lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua5.2` 
+-lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.2` 
 +lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`
 +lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`
  nettle_cflags = `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --cflags nettle hogweed`
  nettle_libs =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --libs nettle hogweed`
- gmp_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --copy -lgmp`
+ gmp_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC NO_GMP --copy -lgmp`
 -- 
-1.7.9.5
+2.9.5
 
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
deleted file mode 100644
index 41573d9..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI += "\
-    file://lua.patch \
-"
-
-SRC_URI[dnsmasq-2.76.md5sum] = "6610f8233ca89b15a1bb47c788ffb84f"
-SRC_URI[dnsmasq-2.76.sha256sum] = "777c4762d2fee3738a0380401f2d087b47faa41db2317c60660d69ad10a76c32"
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
new file mode 100644
index 0000000..4d1dc6e
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI += "\
+    file://lua.patch \
+"
+
+SRC_URI[dnsmasq-2.78.md5sum] = "3bb97f264c73853f802bf70610150788"
+SRC_URI[dnsmasq-2.78.sha256sum] = "c92e5d78aa6353354d02aabf74590d08980bb1385d8a00b80ef9bc80430aa1dc"
-- 
2.9.5


