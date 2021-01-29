Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.7183.1611909396393239767
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,384,1602518400"; 
   d="scan'208";a="103978862"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jan 2021 16:36:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3A58E4CE6D71
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 16:36:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 Jan 2021 16:36:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] dnsmasq: upgrade 2.82 -> 2.84
Date: Sat, 30 Jan 2021 04:36:16 +0800
Message-ID: <1611952576-3423-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3A58E4CE6D71.A407C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Refresh the following patch:
lua.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-support/dnsmasq/dnsmasq/lua.patch            | 9 +++++----
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb  | 8 --------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb  | 8 ++++++++
 3 files changed, 13 insertions(+), 12 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
index 1bf0f75c1..be2bb42fc 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -14,7 +14,7 @@ diff --git a/Makefile b/Makefile
 index 73ea23e..ed3eeb9 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -59,8 +59,8 @@ idn2_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFI
+@@ -60,8 +60,8 @@ idn2_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFI
  idn2_libs =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFIG) --libs libidn2`
  ct_cflags =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
  ct_libs =       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
@@ -22,9 +22,10 @@ index 73ea23e..ed3eeb9 100644
 -lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.2` 
 +lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`
 +lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`
- nettle_cflags = `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --cflags nettle hogweed`
- nettle_libs =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --libs nettle hogweed`
- gmp_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC NO_GMP --copy -lgmp`
+ nettle_cflags = `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC     $(PKG_CONFIG) --cflags 'nettle hogweed' \
+                                                         HAVE_CRYPTOHASH $(PKG_CONFIG) --cflags nettle \
+                                                         HAVE_NETTLEHASH $(PKG_CONFIG) --cflags nettle`
+
 -- 
 2.9.5
 
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
deleted file mode 100644
index 4ca1f3cc9..000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.82.md5sum] = "3c710dee3edba510ed11a6e3d9e0d9cb"
-SRC_URI[dnsmasq-2.82.sha256sum] = "62f33bfac1a1b4a5dab8461b4664e414f7d6ced1d2cf141e9cdf9c3c2a424f65"
-SRC_URI += "\
-    file://lua.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
new file mode 100644
index 000000000..3dd9154f3
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.84.md5sum] = "6bf24b5bcf9293db2941fbdb545c1133"
+SRC_URI[dnsmasq-2.84.sha256sum] = "4caf385376f34fae5c55244a1f870dcf6f90e037bb7c4487210933dc497f9c36"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.25.1



