Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id CDAD071DD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 18:18:39 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A9gKwlxH0phF6o1I0ip+cxJ1GYnF86YWxBRYc798d?=
	=?us-ascii?q?s5kLTJ7zoMywAkXT6L1XgUPTWs2DsrQf2raQ7f2rADVYqb+681k6OKRWUBEEjc?=
	=?us-ascii?q?hE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRo?=
	=?us-ascii?q?LerpBIHSk9631+ev8JHPfglEnjSwbLd9IRmsrAjctsYajZZ/Jqot1xDEvmZGd+?=
	=?us-ascii?q?NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG4p6sLrswLD?=
	=?us-ascii?q?TRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Uims4qt3VBPljj?=
	=?us-ascii?q?oMOjgk+2/Vl8NwlrpWrhK/qRJizYDaY4abO/Vica3SZt4aWWlMU9xNWyFbHo+x?=
	=?us-ascii?q?bY0CBPcBM+ZCqIn9okMDox+kCgawA+Pg0ThIjWLq0K0gyeshHhzG3Ao9EN0QrX?=
	=?us-ascii?q?/ats/yNL0MXuG00aLFyjfDYOlM2Tjn54jIbxYhruySUr9rcMrRxlMgFwfEjlqK?=
	=?us-ascii?q?s4DqIzSV1uEUvmWd8uFuVvqvhnYjpg1suDSj29ogh4vTio8Rzl3I7zh1zYY1KN?=
	=?us-ascii?q?C+VUV1e8SrEIFKuCGfL4Z2R8QiTHx2tysi0b0GvIK7fDANyJQ62x7Tc/yHfJaM?=
	=?us-ascii?q?4hLkTOuRLy13hHRkebK+gRa971KsyuzzVsau1FZKrzBKnsPQuXAK0hzf8smHSv?=
	=?us-ascii?q?1j8Ue9wTuC0x3f5vtZLUwpl6fXMZosz7oqmpYOsUnOHjf6mEDsg6+XckUk9PKo?=
	=?us-ascii?q?6+PiYrj+pJ+TLZV0hRvxMqQznMywHPo3PxMPX2iU4+u80Lzj8lfjTLpWif02l7?=
	=?us-ascii?q?HVsIrGKsQDuq65HwhV354k6xanETim1soXnXwcI11bZR2IkpbmNEzXLP/lE/i/?=
	=?us-ascii?q?nUqjkDNwyvDCP73hGYnNLmPZnLfmZbZy9UhcxxQ2zd9E+Z1bF6wOL+zuVUPrs9?=
	=?us-ascii?q?zYFBA5ORSuw+n7ENV9yp8eWWWXD6+eLKPdq0GI5uMoI+SXY48Voy39Kvg+5/7y?=
	=?us-ascii?q?k3A5nEQdcbO10psQbXC0BO9pI1/KKUbr19AZHGEHuwAzQODnhBiOXCBeY162Xr?=
	=?us-ascii?q?kg/Xc8EI+gAILJS4yhjbDH2z20TbNMYWUTKFmHFn3vP6yeUvgRbi6favfgiDEW?=
	=?us-ascii?q?HeyjQpUo2gyouALSyrVuKuvdvCYfsMSwh5BO++TPmERqpnRPBMOH3jTVQg=3D?=
	=?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CgBgCn1JBY/5tjdVtdHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgyhhgQmDVop7pDmEHBoQhXiCN0MUAQEBAQEBAQEBAQFhKIIzGYI?=
	=?us-ascii?q?dASkPAUYsAwECAwImAlEhiXIBCawXgiWLMgEBAQcCJoELhUCMBzqCXwWJA5JUh?=
	=?us-ascii?q?meLFwKQdpJ/NiGBS4VBgUk/NQEBiCgBAQE?=
X-IPAS-Result: =?us-ascii?q?A2CgBgCn1JBY/5tjdVtdHAEBBAEBCgEBFwEBBAEBCgEBgyh?=
	=?us-ascii?q?hgQmDVop7pDmEHBoQhXiCN0MUAQEBAQEBAQEBAQFhKIIzGYIdASkPAUYsAwECA?=
	=?us-ascii?q?wImAlEhiXIBCawXgiWLMgEBAQcCJoELhUCMBzqCXwWJA5JUhmeLFwKQdpJ/NiG?=
	=?us-ascii?q?BS4VBgUk/NQEBiCgBAQE?=
X-IronPort-AV: E=Sophos;i="5.33,315,1477954800"; d="scan'208";a="234696618"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 31 Jan 2017 19:18:27 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYd0d-00025r-Vg; Tue, 31 Jan 2017 19:18:28 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cYd0b-0007yR-Mu; Tue, 31 Jan 2017 19:18:25 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2017 19:18:16 +0100
Message-Id: <1485886696-23616-1-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [meta-browser][PATCH] Split patch 'Remove hard coded values for CC and CXX' in two versions
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
X-List-Received-Date: Tue, 31 Jan 2017 18:18:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chromium and chromium-wayland recipes cannot share this patch any
more due to diverging code bases. We create a new version of the
patch only for chromium-wayland and revert the existing patch to
its previous state.

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


