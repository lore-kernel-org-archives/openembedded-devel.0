Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2BF70A8C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 01:03:48 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so8906232pdj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 18:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=45LHh8NkbiYEPCTWsl1LqzzfBO6FojM8uVwavc/3/tI=;
	b=pDxm42solKPNcJhEiMvDf54ing8cu45BzldodqEbJLbonG8Ty1HM6uBgwEyxRKj/pI
	509m3/lzW+sQ0D4wPUZNO/2j9MkImDVfOjjr1hAHFOr3+c+Jcqn2f8TaifPEmvlQYPtN
	0vtweu3RH11iT54a2bICE9t6xranCU68Hj0e6ACbsP6EWXXaePI+Ruoa6qwdO4Z9mMv2
	cMg7aJTEIYYWI3WbqkMHEgaL+HSYhtbpY5uzZHMZZvODELvMN6YB4e0hwGLy0n9zZpyh
	DSxPNmOfpDQUTU5dJ1MJ0wjj3kLY6Lnp6QhHmWEB3KROq7mebV+pU0HbquwmKaBJQX0z
	LqCw==
X-Received: by 10.70.43.206 with SMTP id y14mr33041985pdl.11.1407632630304;
	Sat, 09 Aug 2014 18:03:50 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id fu13sm150134pdb.81.2014.08.09.18.03.48
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 18:03:49 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:01:14 -0700
Message-Id: <6e15db17e2bc86a399105e3b71c03562db9ebee9.1407632366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 4/5] dnsmasq: look for lua.pc, not lua5.1.pc
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
X-List-Received-Date: Sun, 10 Aug 2014 01:03:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch | 15 +++++++++++++++
 .../dnsmasq/{files => dnsmasq}/parallel-make.patch        |  0
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb   |  5 ++++-
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
 rename meta-networking/recipes-support/dnsmasq/{files => dnsmasq}/parallel-make.patch (100%)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
new file mode 100644
index 0000000..63dd71a
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -0,0 +1,15 @@
+Upstream-status: Inappropriate [OE specific]
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+--- dnsmasq-2.68.orig/Makefile
++++ dnsmasq-2.68/Makefile
+@@ -57,8 +57,8 @@ idn_cflags =  `echo $(COPTS) | $(top)/bl
+ idn_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_CONFIG) --libs libidn`
+ ct_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
+ ct_libs =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
+-lua_cflags =  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua5.1`
+-lua_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.1`
++lua_cflags =  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`
++lua_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`
+ sunos_libs =  `if uname | grep SunOS >/dev/null 2>&1; then echo -lsocket -lnsl -lposix4; fi`
+ version =     -DVERSION='\"`$(top)/bld/get-version $(top)`\"'
diff --git a/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
similarity index 100%
rename from meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
rename to meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
index 6caa92a..61b94a0 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
@@ -1,6 +1,9 @@
 require dnsmasq.inc
 
-SRC_URI += "file://parallel-make.patch"
+SRC_URI += "\
+    file://parallel-make.patch \
+    file://lua.patch \
+"
 
 SRC_URI[dnsmasq-2.68.md5sum] = "6f8351ca0901f248efdb81532778d2ef"
 SRC_URI[dnsmasq-2.68.sha256sum] = "402019d61f53f1ccc04cc6218719fd3b158ea3fca9a83ab55471f981a2097c2f"
-- 
1.8.3.4


