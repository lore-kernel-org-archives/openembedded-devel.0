Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 466AE74B83
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:39:43 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id 31-v6so8802941plc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OFLJiQ4c5xFOkqv1UR4xtGBdByqbheMMbZyHA3Vf3E4=;
	b=VOEiOXXC0GidDLS8BdlRCn1FalpWuBUUbRcCWhGbAX6drrSMpT2d83ZdDlVWiDVnFG
	hoXwqubjxSj/BYeZxQwcL9Fh1n0g0UHKc2Zz9fhFJMxu3yqk5eJ8timxaiaKp6OONK+Z
	lEQ/8r/d7M+KUjU1RCLVDbnuhh59kTKVQ2VV15Zt8f06Vso2ZmH9A5Zkg28D9Si5Qgbe
	jkBs97TIUMeFlRwQE5YZvJcvN+lpqnRU49ZPDZTMMwzUgAxMQg4AavP9OWe/K7SkDUPy
	cdIuc79Pyb05G0a5sdhdWNuy0U+QJqpsDddAcwJqetWLiIcDqmBBjkiKW6TclgIn6e7h
	drOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OFLJiQ4c5xFOkqv1UR4xtGBdByqbheMMbZyHA3Vf3E4=;
	b=WRrs68M7IzgMCxyBi5DmD8avmGUFiSCRY/hu/93LWKRU7VyPQAITmbXLvYUxweD6ti
	7uYec2ZHHh1jZMYmgP+gw/RRT062d1P5mxHrmDTcf3MkEh0StLZU1X6mJlOuzceKfxS8
	RNnAnlPS58OcjU0fw3NlzA/XxR2G2VnYDmV51JEiCqaWsgNbDJVRTKYSssomcYhbpTs6
	uQ7Eg+kL/X1gKCHQqZpyB1i1q2LmaVVRyvU9RItRvON/Z2oUzBsjwbsh9eujYWQ7VPvj
	wdk63tnZjm2RMjfDILPfMrFmcW5ZDwbWt0UATI8o/orVQoYfGlQ8BiLdNIN5Tqcrl595
	8iFA==
X-Gm-Message-State: ALKqPwf34aDnlMnDgfLqqZa8dFf/52FBgWqHHWb39mVOnJuH6m8/XnKQ
	SC/ld7lzxvb8k0kWTEsgsCs=
X-Google-Smtp-Source: ADUXVKKy8Wy76QXuP8gY1rd/lJTQWcBgTj3CJqzGYsSO9k6DnFKQcLeZ6805hmDZwl8GZ3XXtdrINg==
X-Received: by 2002:a17:902:1347:: with SMTP id
	r7-v6mr19682061ple.62.1528079984524; 
	Sun, 03 Jun 2018 19:39:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm12069697pfk.42.2018.06.03.19.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:39:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:39:32 -0700
Message-Id: <a9c2ab5e7527c2ccdb9fc375a9bf3b1faa57bb57.1528079821.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528079821.git.akuster808@gmail.com>
References: <cover.1528079821.git.akuster808@gmail.com>
Subject: [PATCH 2/6] dnsmasq: upgrade to 2.78
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
X-List-Received-Date: Mon, 04 Jun 2018 02:39:43 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.7.4


