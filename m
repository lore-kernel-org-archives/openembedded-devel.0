Return-Path: <jaragunde@igalia.com>
X-Greylist: delayed 587 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Jan 2017 18:21:37 UTC
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id D830C7199F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 18:21:37 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AJo1XQBJ9HjXsvSIlytmcpTZWNBhigK39O0sv0rFi?=
	=?us-ascii?q?tYgXKvz5rarrMEGX3/hxlliBBdydsKMYzbOL+Pm4CSQp2tWoiDg6aptCVhsI24?=
	=?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
	=?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9GiTe5br5+Ngi6oAXeusULnYdvKbs6xwfUrHdPZ+?=
	=?us-ascii?q?lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2465MvwtRne?=
	=?us-ascii?q?VgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVzmu87tnRRn1gy?=
	=?us-ascii?q?oBKjU38nzYitZogaxbvhyvuhJxzY3Tbo6aKPVwcbjQfc8ZSGdbQspcTTBND4G6?=
	=?us-ascii?q?YoASD+QBJ+FYr4zlqlUKtxSxGQ6sC/joyjRVmnL2x7c10+s8EQHAwQMvAc8Fvm?=
	=?us-ascii?q?7Oq9XvKqgTUP2+wa7KzTrZdfNZwzj96JXOch88v/6BRrNwccXLxkkrFgPKlE+c?=
	=?us-ascii?q?ppDiPzOQz+kAtXWQ4eRnVeKqkWEnqgdxryCgxsctlonJhp8VxUve+Splx4Y1IN?=
	=?us-ascii?q?u1Q1N4b968CJZdszyWO5FrTs8/QWxkoiI3x7kctZKmfCUHyJIqzAPFZfOdaYiH?=
	=?us-ascii?q?+BfjWf6UITd/mX1qZqqyhw238Ui80u38UdS00EpSoipFjNbMsncN2gTd6sedTP?=
	=?us-ascii?q?t8/0ah2TCR2AzJ6+FELlo7la7aK5E72LI/ip0TsUHbEi/3nkX5krOWe10g9+S1?=
	=?us-ascii?q?8ejrf6jqq52GO4JwjgzyKLkil8y/DOggNwgBRWmb+eCy1L35+k35Ra1Hjv8sna?=
	=?us-ascii?q?nDqp/aKtkbpqikDABLyYsj6hm/AC2i0NQZh3YLNk5KeBWCj4TxIVHBPOj4Deuj?=
	=?us-ascii?q?g1SriDprwOjGMaPnAprTK3jMi6nucqtg5EFC1QU/1M1Q6IxKCr4fJPL+QUvxtN?=
	=?us-ascii?q?3DDh8lKAy42eHnCM1j2YMYR22PB7SWP73PvlCV+O0gPvOAZIgPuDbyM/Il/eLh?=
	=?us-ascii?q?jWclmV8BeqmkxYUYaGq5Hvt6OEiWf2fsgtQbEWgUpAUyVvDliFqHUTRLfXa9Q7?=
	=?us-ascii?q?o85i0nCIKhFYrMW56igLqA3CegBZBZeH1GClOWEXj2bYqIQesDaCWXIsV5iDwL?=
	=?us-ascii?q?SaChS5M91RGprAL6zKZnIfDK+i0ZspLuz9915/bIlRAy7jx0E9qS02SWT21ugm?=
	=?us-ascii?q?wIQDo20LpkrkxnmR+/1v1/m/FeGNlZ6v9FXwt/OZPCwuhSD9HpRhmHec+ETluj?=
	=?us-ascii?q?SNiqDTw9CNUrzIwgeUF4TverhRfJ2GKDGbYairqHCdQMc7jRzTClJc9nwnnb0q?=
	=?us-ascii?q?Usp1gpS89OPCutgasppFubPJLAj0jMz/XiTq8bxiOYrGo=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DhAQBFOm1Y/5tjdVteHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgw0BAQEBAR9fgQyNV3KkJoJCgg+CCBoMhXyBWD8UAQEBAQEBAQE?=
	=?us-ascii?q?BAQFiKIIzGIJHDwFGNQImAnKIdAEJr0WCJYoqMoELhTqJc4IACy6CXgWbCYZWi?=
	=?us-ascii?q?msCgkWOEkiReB84hXaBRz00AQGIMAEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2DhAQBFOm1Y/5tjdVteHAEBBAEBCgEBFwEBBAEBCgEBgw0?=
	=?us-ascii?q?BAQEBAR9fgQyNV3KkJoJCgg+CCBoMhXyBWD8UAQEBAQEBAQEBAQFiKIIzGIJHD?=
	=?us-ascii?q?wFGNQImAnKIdAEJr0WCJYoqMoELhTqJc4IACy6CXgWbCYZWimsCgkWOEkiReB8?=
	=?us-ascii?q?4hXaBRz00AQGIMAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,459,1477954800"; d="scan'208";a="96000759"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 04 Jan 2017 19:11:49 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cOq2P-00078p-Pk; Wed, 04 Jan 2017 19:11:49 +0100
Received: from fanzine.local.igalia.com ([192.168.10.13]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cOq2N-0005HI-FV; Wed, 04 Jan 2017 19:11:47 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jan 2017 19:11:32 +0100
Message-Id: <1483553494-5687-1-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: denis@eukrea.com, otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH 1/3] chromium-wayland: always enable CHROMIUM_ENABLE_WAYLAND flag
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
X-List-Received-Date: Wed, 04 Jan 2017 18:21:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It makes no sense to trigger a build of chromium-wayland and not
enable CHROMIUM_ENABLE_WAYLAND, so we are doing it directly in the
recipe now.

Now we know the value of the flag beforehand, we are allowed to
remove some conditionals. Additionally, we check if Wayland is
available before building.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
index bbba147..0db8f7d 100644
--- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
+++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
@@ -1,3 +1,5 @@
+CHROMIUM_ENABLE_WAYLAND = "1"
+
 include chromium-browser.inc
 
 DEPENDS += "wayland libxkbcommon"
@@ -21,15 +23,14 @@ SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f6
 OZONE_WAYLAND_GIT_BRANCH = "Milestone-SouthSister"
 OZONE_WAYLAND_GIT_SRCREV = "c605505044af3345a276abbd7c29fd53db1dea40"
 
-SRC_URI += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch', '', d)}"
+SRC_URI += "git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
 
 # Component build is unsupported in ozone-wayland for Chromium 48
 python() {
-    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
-        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
-            bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
-    else:
-        raise bb.parse.SkipPackage("CHROMIUM_ENABLE_WAYLAND isn't enabled")
+    if not bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d):
+        raise bb.parse.SkipPackage("Wayland is not available")
+    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
+        bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
 }
 
 CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
-- 
2.7.4


