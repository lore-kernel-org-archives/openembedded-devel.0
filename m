Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5D34D709F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 16:13:09 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so4523449wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EK1DK8TtnqxuDJJVCQEp1FzDYJs2WPB2j/n6mq3TYX8=;
	b=KIin6QatDzmNJD0PCYfeI11/lzfe4mcydCqRAF04bh9q7HGkote6LXoGNmREk0ToVU
	cCrM5isgeIHsRn/0Z6GASxL2DJowogu+c4d3s3Ard0YZKyf2F85wIJz/6qy8wpu1xlGv
	echbw5KwwTT5x76oRih3hEEyWTzglbxPvrmebEQsdc4K5xB8kKC2ExdQbadV8qb70o+g
	94kzIbklMJG8tndNgfG7E9gFieKFqBxfSJ+sEzPQAoH65O6rQYFN250eXSbCEEH1mL3N
	lvmboV9K0ylgciJFnijpFBA5sA6gQHawICGyFg+NFtiFR/onUFcPP9OGXkTHZUSWeOsy
	puBQ==
X-Received: by 10.194.142.148 with SMTP id rw20mr54633572wjb.69.1407773589961; 
	Mon, 11 Aug 2014 09:13:09 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 20sm2589822wjt.42.2014.08.11.09.13.08
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 09:13:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Aug 2014 09:12:25 -0700
Message-Id: <935fb3584a8ce5533fc369a181c7feb088356cfa.1407773390.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH v2 4/5] dnsmasq: look for lua.pc, not lua5.1.pc
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
X-List-Received-Date: Mon, 11 Aug 2014 16:13:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../recipes-support/dnsmasq/dnsmasq/lua.patch            | 16 ++++++++++++++++
 .../dnsmasq/{files => dnsmasq}/parallel-make.patch       |  0
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb  |  5 ++++-
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
 rename meta-networking/recipes-support/dnsmasq/{files => dnsmasq}/parallel-make.patch (100%)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
new file mode 100644
index 0000000..aac7b97
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -0,0 +1,16 @@
+Upstream-status: Inappropriate [OE specific]
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+--- dnsmasq-2.68.orig/Makefile	2014-08-11 09:05:17.000000000 -0700
++++ dnsmasq-2.68/Makefile	2014-08-11 09:05:51.930648617 -0700
+@@ -57,8 +57,8 @@
+ idn_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_CONFIG) --libs libidn` 
+ ct_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
+ ct_libs =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
+-lua_cflags =  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua5.1` 
+-lua_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.1` 
++lua_cflags =  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`
++lua_libs =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`
+ sunos_libs =  `if uname | grep SunOS >/dev/null 2>&1; then echo -lsocket -lnsl -lposix4; fi`
+ version =     -DVERSION='\"`$(top)/bld/get-version $(top)`\"'
+ 
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


