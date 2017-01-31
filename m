Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 56F7671D9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 18:30:34 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3Au5LIYRXShViYahZEyTTqT3eTD1fV8LGtZVwlr6E/?=
	=?us-ascii?q?grcLSJyIuqrYbBOHt8tkgFKBZ4jH8fUM07OQ6PG8HzJdqs/Y6zgrS99lb1c9k8?=
	=?us-ascii?q?IYnggtUoauKHbQC7rUVRE8B9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUhrwOhBo?=
	=?us-ascii?q?KevrB4Xck9q41/yo+53Ufg5EmCexbal8IRiyogjdrMgbjIttJqos1xfErGZDdv?=
	=?us-ascii?q?hLy29vOV+dhQv36N2q/J5k/SRQuvYh+NBFXK7nYak2TqFWASo/PWwt68LlqRfM?=
	=?us-ascii?q?TQ2U5nsBSWoWiQZHAxLE7B7hQJj8tDbxu/dn1ymbOc32Sq00WSin4qx2RhLklD?=
	=?us-ascii?q?sLOjgk+2zRl8d+jr9UoAi5qhJ/3YDafY+bOvl5cKzSYdwUSnFMXtpSWiFbHo+x?=
	=?us-ascii?q?dZcDAugHMO1Fr4f9vVwOrR6mCAeoHuzg1jhIiWTx3aYnz+khCxvJ3AM9H9IIrX?=
	=?us-ascii?q?vbssj+Or0IVuCv0qbJzCjIYvRU2Tjn8ojHaB8hoeyKXb1tb8Xc0kgvFwzfgVWU?=
	=?us-ascii?q?qIzqJSmZ2fgKs2ie9udtU/+khW0/qwxppjWj290ghpTUio8X0FzJ8SF0zJwoKd?=
	=?us-ascii?q?C4SEN2Z8OvHoFKuCGALYR2R9svQ2RvuCkn1LILoYW7fC0WyJQ/wB7fduCHf5CI?=
	=?us-ascii?q?4h39UOaRJi91hHx/d7K5hhey8E6gxfPmWsm131ZFtC5FktjWuXwXyxPT7c2HRu?=
	=?us-ascii?q?N8/kenxzmPyxje5+VZLUwuiKbXNpwszqQ0m5cXq0jPAy/7lUXugK+TbEok++yo?=
	=?us-ascii?q?6+r9YrXho5+RL410hRvkMqs0lcy/HOI4PRUQUGWA+OS826fs/Un4QLpQlPE5jq?=
	=?us-ascii?q?7ZsJXCKcQBuqG5GxNV0pok6xunCDemyMoXnX8ZI1JAYx2IkZXmNEzQL//lFPuw?=
	=?us-ascii?q?nkqjkCl1yPDCJbDhBpTNLmPfkLf6Z7p97FZcxxQ1zd9B4pJbEa8OL+/uVUDvqd?=
	=?us-ascii?q?PUFBg5Mxa7w+z/EtVyypseWX6TAq+eKK7StkOI6fgxI+mNY48YozH9K+M+5//u?=
	=?us-ascii?q?ln85hUESfayy3ZcNdH+4GfFmL1+Cbnr20Z89FjINpgc4QenghVGOXDIWa3usUq?=
	=?us-ascii?q?YU4jAgFJngCp/OQI2oirGN0Cq3WJpMaTNoEFeJRFXhfIKOXL8lciudP8ltn3Q8?=
	=?us-ascii?q?1KKsWcd11xi0vQDnzbZqBuvb8ykZvNTo090jtL6brg076TEhV5fV6GqKVWwhxm?=
	=?us-ascii?q?4=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CgBgAT15BY/5tjdVtdHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgyhhgQmDVop7pDmEHBoQhXiCN0MUAQEBAQEBAQEBAQFhKIIzGYI?=
	=?us-ascii?q?dASkPAUYsAwECAwImAlEhiXIBCawjgiWLMgEBCAImgQuFQIwHOoJfBYkDklSGZ?=
	=?us-ascii?q?4sXApB2kn82IYFLhUGBST81AQGIKAEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2CgBgAT15BY/5tjdVtdHAEBBAEBCgEBFwEBBAEBCgEBgyh?=
	=?us-ascii?q?hgQmDVop7pDmEHBoQhXiCN0MUAQEBAQEBAQEBAQFhKIIzGYIdASkPAUYsAwECA?=
	=?us-ascii?q?wImAlEhiXIBCawjgiWLMgEBCAImgQuFQIwHOoJfBYkDklSGZ4sXApB2kn82IYF?=
	=?us-ascii?q?LhUGBST81AQGIKAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,315,1477954800"; d="scan'208";a="234700494"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 31 Jan 2017 19:30:33 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYdCL-0002Hw-Ia; Tue, 31 Jan 2017 19:30:33 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cYdCJ-00032b-E1; Tue, 31 Jan 2017 19:30:31 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2017 19:30:24 +0100
Message-Id: <1485887424-1814-1-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [meta-browser][PATCH v2] chromium: split patch 'Remove hard coded values for CC and CXX'
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
X-List-Received-Date: Tue, 31 Jan 2017 18:30:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chromium and chromium-wayland recipes cannot share this patch any
more due to diverging code bases. We create a new version of the
patch only for chromium-wayland and revert the existing patch to
its previous state to be used by chromium recipe.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 .../chromium/chromium-wayland_53.0.2785.143.bb     |  2 +-
 .../Remove-hard-coded-values-for-CC-and-CXX.patch  | 42 ++++++++++++++++++++++
 ...3-Remove-hard-coded-values-for-CC-and-CXX.patch | 11 +++---
 3 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch

diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
index c8aea27..a75918b 100644
--- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
+++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
@@ -6,9 +6,9 @@ DEPENDS += "wayland libxkbcommon"
 
 SRC_URI += "\
         file://chromium-wayland/add_missing_stat_h_include.patch \
-        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
         file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
         file://0005-Override-root-filesystem-access-restriction.patch \
+        file://chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch \
 	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium-wayland/remove-Werror.patch \
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch
new file mode 100644
index 0000000..63de68a
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -0,0 +1,42 @@
+From 518135b0cd6878e91e5fcf489f3185740ec307c0 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 12 Oct 2014 19:31:47 +0200
+Subject: [PATCH] Remove hard coded values for CC and CXX
+
+In spite of what the comment says, the environment variables do *not*
+override the variables; "which which arm-linux-gnueabihf-gcc" etc. are
+always called. To undo this, remove the change.
+
+Upstream-Status: Pending
+
+The default values cannot be overriden without the patch; upstream
+might be interested in this.
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ build/common.gypi | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/build/common.gypi b/build/common.gypi
+index 7ec5ae2..11e8d1d 100644
+--- a/build/common.gypi
++++ b/build/common.gypi
+@@ -6027,16 +6027,6 @@
+         ['CXX.host', '<(host_cxx)'],
+       ],
+     }],
+-    ['OS=="linux" and target_arch=="arm" and host_arch!="arm" and chromeos==0 and clang==0', {
+-      # Set default ARM cross tools on linux.  These can be overridden
+-      # using CC,CXX,CC.host and CXX.host environment variables.
+-      'make_global_settings': [
+-        ['CC', '<!(which arm-linux-gnueabihf-gcc)'],
+-        ['CXX', '<!(which arm-linux-gnueabihf-g++)'],
+-        ['CC.host', '<(host_cc)'],
+-        ['CXX.host', '<(host_cxx)'],
+-      ],
+-    }],
+     ['use_goma==1', {
+       'make_global_settings': [
+        ['CC_wrapper', '<(gomadir)/gomacc'],
+-- 
+2.1.4
diff --git a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
index 63de68a..7bc8d14 100644
--- a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
+++ b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -21,7 +21,7 @@ diff --git a/build/common.gypi b/build/common.gypi
 index 7ec5ae2..11e8d1d 100644
 --- a/build/common.gypi
 +++ b/build/common.gypi
-@@ -6027,16 +6027,6 @@
+@@ -6047,16 +6047,6 @@
          ['CXX.host', '<(host_cxx)'],
        ],
      }],
@@ -35,8 +35,9 @@ index 7ec5ae2..11e8d1d 100644
 -        ['CXX.host', '<(host_cxx)'],
 -      ],
 -    }],
-     ['use_goma==1', {
-       'make_global_settings': [
-        ['CC_wrapper', '<(gomadir)/gomacc'],
+     # TODO(yyanagisawa): supports GENERATOR==make
+     #  make generator doesn't support CC_wrapper without CC
+     #  in make_global_settings yet.
 -- 
-2.1.4
+1.9.1
+
-- 
2.7.4


