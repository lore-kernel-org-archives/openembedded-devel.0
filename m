Return-Path: <wei.tee.ng@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 05A366E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 02:26:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 19:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="1172508467"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2017 19:26:16 -0700
From: wei.tee.ng@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 May 2017 12:15:23 -0700
Message-Id: <1495394123-59799-1-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] dbus-daemon-proxy: inherit pkgconfig, unblacklist and set package version
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
X-List-Received-Date: Mon, 22 May 2017 02:26:17 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

The pkgconfig is not found in recipes specific sysroot. Therefore
inherit pkgconfig is added to fix it. Package version is updated
to avoid package dbus-daemon-proxy-dbg went backwards which would
break package feeds.

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index a953ebc..4571b44 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -4,13 +4,15 @@ LIC_FILES_CHKSUM = "file://dbus-daemon-proxy.c;endline=19;md5=41df6d21fe1c97d6a1
 DEPENDS = "dbus dbus-glib"
 SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
 PV = "0.0.0+gitr${SRCPV}"
-PR = "r1"
+PR = "r1.59"
 
 ASNEEDED_pn-dbus-daemon-proxy = ""
 
 SRC_URI = "git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy"
 S = "${WORKDIR}/git"
 
+inherit pkgconfig
+
 do_compile() {
     ${CC} ${LDFLAGS} `pkg-config --cflags --libs dbus-glib-1` -o dbus-daemon-proxy dbus-daemon-proxy.c
 }
@@ -19,6 +21,3 @@ do_install() {
     install -d ${D}${bindir}
     install -m 0755 dbus-daemon-proxy ${D}${bindir}
 }
-
-
-PNBLACKLIST[dbus-daemon-proxy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130613/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.7.4


