Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id BA2096E5FB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 12:17:16 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AtBRiMhwR7WwjxPTXCy+O+j09IxM/srCxBDY+r6Qd?=
	=?us-ascii?q?2uofIJqq85mqBkHD//Il1AaPBtSHrawVwLGL+4nbGkU4qa6bt34DdJEeHzQksu?=
	=?us-ascii?q?4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPERvjKwV1?=
	=?us-ascii?q?Ov71GonPhMiryuy+4ZPebgFHiTanYL5/KBq6oAvRu8ILnYZsN6E9xwfTrHBVYe?=
	=?us-ascii?q?pW32RoJVySnxb4+Mi9+YNo/jpTtfw86cNOSL32cKskQ7NWCjQmKH0169bwtRbf?=
	=?us-ascii?q?VwuP52ATXXsQnxFVHgXK9hD6XpP2sivnqupw3TSRMMPqQbwoXzmp8qFmQwLqhi?=
	=?us-ascii?q?gaLT406GHZhNJtgqxVoxyvoBNwzJLbboyOKPpzfbnQcc8ASGZdXMtcUTFKDIOm?=
	=?us-ascii?q?b4sICuoMJeJWoJPhqFsJthS+AhSnCf/1yjBSiX/2wKs63Pk/HgrbxgInBcgOv2?=
	=?us-ascii?q?rVrd7oM6oSU/q6zLPSwjXMcvNW3yry55bTfxAgrvGDR7ZwccvLxkU1CwzFiVCQ?=
	=?us-ascii?q?pJXjMjiI2OoNtG2b4PBhVeKpk2MotwFxoiKoxscpi4nJm4cVxkrD9SVjz4Y4I8?=
	=?us-ascii?q?CzRk1jYdO8FJZcqjuWO5ZrTs4gWW1lvCI3xqcbtZO7fCUHzoksyQTFZPydaYeI?=
	=?us-ascii?q?5wruVOOWIThlmn1oYKm/hxOu8Ui4ze38S9W03E5KriVbltnMsWgA1xLJ5ciBS/?=
	=?us-ascii?q?p9/0Gh1iiV2wDS5eFLO0Q0lavBJJI73rEwkZ8TvVzCHi/whkr2kLebe0E59uSy?=
	=?us-ascii?q?9ujrf7frqoWYOoJwkA3yL6Qjl8ynDeQ9KAcOXmyb+eqm1L3k+E30WLdKgecskq?=
	=?us-ascii?q?bDv5DaOMIbqbOnDAJO04Yj5AywDzOn0NsCh3UIMFVFeBefg4jzJ17OOOz4Deu4?=
	=?us-ascii?q?g1m0lzdr3+7JPrv/DZXINXfMjqrucqtj5EFB0QY80M5Q54xKBbEFO//zXk7xtM?=
	=?us-ascii?q?fEDh8iKQC0xP7nB8t71owAXGKAGbGWP77PvlCW++0jOe6MZJUauDzlMfgq++bu?=
	=?us-ascii?q?jWMlmV8aZaSp2ocXZ2qmHvRnJEWUen3sgswaEWYKpQo+UPLliFiZUTJJe3myWK?=
	=?us-ascii?q?c86isgB4K8Xs//QdWqmLGH0SKxE5Faa2wDBl2SHHPAc4SfR+xKbzqfJMJkmDEI?=
	=?us-ascii?q?WbWtDYg72kKArgj/nphuJe3e/WUxr5vsyd556qXrFAs/53QgDc2H2m6QSW15tm?=
	=?us-ascii?q?IHTjs31eZ0pkkrmQTL6rRxn/ENTY8b3PhOSApvbZM=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CFBQC5IpNY/5tjdVtdHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgyhhgQmDV4p6pD6EHBoQhXiCTEIVAQEBAQEBAQEBAQFhKIIzGYI?=
	=?us-ascii?q?dASkPAUYwAgMCJgJRIYl1AQmtEIIliy8BAQEBBgEBAQEkgQuFQIwIOoJfBYkWh?=
	=?us-ascii?q?2aKYYZoix+CTo40kwc1IoFLhUqBST81AQGJAQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2CFBQC5IpNY/5tjdVtdHAEBBAEBCgEBFwEBBAEBCgEBgyh?=
	=?us-ascii?q?hgQmDV4p6pD6EHBoQhXiCTEIVAQEBAQEBAQEBAQFhKIIzGYIdASkPAUYwAgMCJ?=
	=?us-ascii?q?gJRIYl1AQmtEIIliy8BAQEBBgEBAQEkgQuFQIwIOoJfBYkWh2aKYYZoix+CTo4?=
	=?us-ascii?q?0kwc1IoFLhUqBST81AQGJAQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,324,1477954800"; d="scan'208";a="106428423"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 02 Feb 2017 13:17:13 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cZGK9-0004mw-8N; Thu, 02 Feb 2017 13:17:13 +0100
Received: from fanzine.local.igalia.com ([192.168.10.13]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cZGK3-0005PK-0h; Thu, 02 Feb 2017 13:17:07 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2017 13:17:04 +0100
Message-Id: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [meta-browser][PATCH] chromium-wayland: fix compilation problem on non-X11 builds
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
X-List-Received-Date: Thu, 02 Feb 2017 12:17:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Certain build configurations enable a code path that includes
keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
environments because of a missing patch that is present upstream.

This commit adds the missing patch from
https://codereview.chromium.org/2239833003

There are two versions of the patch in the code review URL above.
The first version fixes the problem both under the gyp and GN build
systems. That patch was rejected because gyp is considered deprecated
upstream. The second version fixes the problem only on GN and it was
merged upstream. We are picking the first version because our recipes
still use gyp to build.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
 .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch

diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
index a75918b..ef913a7 100644
--- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
+++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
@@ -13,6 +13,7 @@ SRC_URI += "\
         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium-wayland/remove-Werror.patch \
         file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
+        file://chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch \
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
 "
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
new file mode 100644
index 0000000..976ece9
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
@@ -0,0 +1,51 @@
+From: jbriance <jbriance@cisco.com>
+Subject: keycodes: Fix non-X11 build when use_xkbcommon=1
+
+Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even if
+use_xkbcommon=1 is set because USE_XKBCOMMON is not defined, leading
+to the following compilation error in this case:
+
+  In file included from ../../ui/events/keycodes/keyboard_code_conversion_xkb.h:12:0,
+                   from ../../ui/events/keycodes/keyboard_code_conversion_xkb.cc:5:
+  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error: X11/X.h: No such file or directory
+
+BUG=none
+
+Review-Url: https://codereview.chromium.org/2239833003
+--
+
+Index: ui/events/keycodes/BUILD.gn
+diff --git a/ui/events/keycodes/BUILD.gn b/ui/events/keycodes/BUILD.gn
+index 4f2d47c2497d321332c79d0dd4e9007b50c319c7..716c7ed17cc8049ea65b95a5062e7c6e0adc6e48 100644
+--- a/ui/events/keycodes/BUILD.gn
++++ b/ui/events/keycodes/BUILD.gn
+@@ -17,6 +17,10 @@ source_set("xkb") {
+     "//base",
+     "//ui/events:dom_keycode_converter",
+   ]
++
++  if (use_xkbcommon) {
++    defines = [ "USE_XKBCOMMON" ]
++  }
+ }
+ 
+ if (use_x11 || ozone_platform_x11) {
+Index: ui/events/keycodes/events_keycodes.gyp
+diff --git a/ui/events/keycodes/events_keycodes.gyp b/ui/events/keycodes/events_keycodes.gyp
+index b0796b4e2ead8bffe88fb01ed136814be505d967..248e961bad2ad3996ca99624b6c489c7835f6241 100644
+--- a/ui/events/keycodes/events_keycodes.gyp
++++ b/ui/events/keycodes/events_keycodes.gyp
+@@ -21,6 +21,13 @@
+         'scoped_xkb.h',
+         'xkb_keysym.h',
+       ],
++      'conditions': [
++        ['use_xkbcommon==1', {
++          'defines': [
++            'USE_XKBCOMMON',
++          ],
++        }],
++      ],
+     },
+   ],
+   'conditions': [
-- 
2.7.4


