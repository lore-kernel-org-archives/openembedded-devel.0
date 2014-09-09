Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31ECD6B7CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 07:12:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s896vLdW005231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 00:12:35 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Sep 2014 00:11:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 15:11:20 +0800
Message-ID: <1410246680-19344-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] dnsmasq: uprev it to 2.71
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
X-List-Received-Date: Tue, 09 Sep 2014 07:12:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Update lua.patch

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-support/dnsmasq/dnsmasq/lua.patch      |   21 ++++++++++----------
 .../recipes-support/dnsmasq/dnsmasq_2.68.bb        |    9 ---------
 .../recipes-support/dnsmasq/dnsmasq_2.71.bb        |    9 +++++++++
 3 files changed, 19 insertions(+), 20 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
index aac7b97..06d15fe 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -1,16 +1,15 @@
 Upstream-status: Inappropriate [OE specific]
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
 --- dnsmasq-2.68.orig/Makefile	2014-08-11 09:05:17.000000000 -0700
 +++ dnsmasq-2.68/Makefile	2014-08-11 09:05:51.930648617 -0700
 @@ -57,8 +57,8 @@
- idn_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_CONFIG) --libs libidn` 
- ct_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
- ct_libs =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
--lua_cflags =  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua5.1` 
--lua_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.1` 
-+lua_cflags =  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`
-+lua_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`
- sunos_libs =  `if uname | grep SunOS >/dev/null 2>&1; then echo -lsocket -lnsl -lposix4; fi`
- version =     -DVERSION='\"`$(top)/bld/get-version $(top)`\"'
- 
+ idn_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_CONFIG) --libs libidn` 
+ ct_cflags =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
+ ct_libs =       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
+-lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua5.1` 
+-lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.1` 
++lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua` 
++lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua` 
+ nettle_cflags = `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --cflags nettle hogweed`
+ nettle_libs =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --libs nettle hogweed`
+ gmp_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --copy -lgmp`
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
deleted file mode 100644
index 61b94a0..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI += "\
-    file://parallel-make.patch \
-    file://lua.patch \
-"
-
-SRC_URI[dnsmasq-2.68.md5sum] = "6f8351ca0901f248efdb81532778d2ef"
-SRC_URI[dnsmasq-2.68.sha256sum] = "402019d61f53f1ccc04cc6218719fd3b158ea3fca9a83ab55471f981a2097c2f"
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb
new file mode 100644
index 0000000..48d9bbf
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb
@@ -0,0 +1,9 @@
+require dnsmasq.inc
+
+SRC_URI += "\
+    file://parallel-make.patch \
+    file://lua.patch \
+"
+
+SRC_URI[dnsmasq-2.71.md5sum] = "15a68f7f6cc0119e843f67d2f79598f1"
+SRC_URI[dnsmasq-2.71.sha256sum] = "7d8c64f66a396442e01b639df3ea6b4e02ba88cbe206c80be8de68b6841634c4"
-- 
1.7.10.4


