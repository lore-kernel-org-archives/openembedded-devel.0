Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (unknown [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id CCE0B6FB99
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 12:04:53 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id m15so11082052wgh.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 05:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rFfpkhuYWKNTYas3uj1yFy5yPOAcjGQoYMxtVpb5UaU=;
	b=i0G8AFoLoS6jFxRGfHD9BA70FShuozJzuttakio431BOA+T0r1JPVbyjLvSimkjJqA
	+tE15AKU5Iy+D6C8sSnBiQCVKUZEzduZfGYr5czwoefC2n3YW1WXdGV9ZMM53xMqSnsy
	eP0cgyLznVNaFXnl9D9dEakNKsh3Y12zkyd/cTUBbvb888tUhlpyVBHHZ1J3R8zbo1TD
	1E/zpxDRoUPQIvOPt92VhuL13e8JcTTinciTXerphzZWi0P8mJMiJCrSntTd555op4Xz
	eg0Y3AUYVgl7xeuGvycXDL2rU0VEZ2SddUrEViNi/bbYJ6SBJoeGaxp085UIuYU5C5pI
	pAcw==
X-Gm-Message-State: ALoCoQkcJoWIht4D17tmn+QqCTEqLXyqiGpBVwfZAcL/cDe6eEcFOKTrCYc/neKwaj3k3S1ur2c+
X-Received: by 10.194.184.179 with SMTP id ev19mr50137207wjc.85.1401278206565; 
	Wed, 28 May 2014 04:56:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bj2sm16345631wib.3.2014.05.28.04.56.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 04:56:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 12:56:23 +0100
Message-Id: <0124c6edfd85eba465f188d08a03a56e7e189e1a.1401277810.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
Subject: [PATCH 1/4] readline: add missing STRUCT_DIRENT_D_* symbols to config.h.in
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
X-List-Received-Date: Wed, 28 May 2014 12:04:56 -0000

readline maintains config.h.in by hand but several symbols are incorrect.  Fix
these so that the test results are reflected in config.h.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../readline-6.3/config-dirent-symbols.patch       |   34 ++++++++++++++++++++
 meta/recipes-core/readline/readline.inc            |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch

diff --git a/meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch b/meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
new file mode 100644
index 0000000..cfff03c
--- /dev/null
+++ b/meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
@@ -0,0 +1,34 @@
+Fix the names of the STRUCT_DIRENT_D symbols to match the names used by both
+configure and the source code.
+
+Upstream-Status: Submitted (http://lists.gnu.org/archive/html/bug-readline/2014-05/msg00008.html)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From e48656811550774892fd4e0f4b3c7d418422da52 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 27 May 2014 22:32:31 +0100
+Subject: [PATCH] config.h.in: fix names of STRUCT_DIRENT_D symbols
+
+---
+ config.h.in |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/config.h.in b/config.h.in
+index a67e43e..a42acc5 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -244,9 +244,9 @@
+ 
+ #undef HAVE_GETPW_DECLS
+ 
+-#undef STRUCT_DIRENT_HAS_D_INO
++#undef HAVE_STRUCT_DIRENT_D_INO
+ 
+-#undef STRUCT_DIRENT_HAS_D_FILENO
++#undef HAVE_STRUCT_DIRENT_D_FILENO
+ 
+ #undef HAVE_BSD_SIGNALS
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 9d78aa9..c33e91a 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -13,6 +13,7 @@ DEPENDS += "ncurses"
 
 SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
            file://configure-fix.patch \
+           file://config-dirent-symbols.patch \
            file://norpath.patch \
            file://acinclude.m4"
 
-- 
1.7.10.4


