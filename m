Return-Path: <wei.tee.ng@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2909571AB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 06:20:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 May 2017 23:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,343,1491289200"; d="scan'208";a="1147805462"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2017 23:20:02 -0700
From: wei.tee.ng@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 May 2017 16:09:06 -0700
Message-Id: <1494803346-189821-1-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] dbus-daemon-proxy: inherit pkgconfig and unblacklist
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
X-List-Received-Date: Mon, 15 May 2017 06:20:01 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

The pkgconfig is not found in recipes specific sysroot. Therefore
inherit pkgconfig is added to fix it.

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index a953ebc..b216410 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -11,6 +11,8 @@ ASNEEDED_pn-dbus-daemon-proxy = ""
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


