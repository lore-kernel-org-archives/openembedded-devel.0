Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B93FF60721
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:49 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869309"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:47 +0200
Message-Id: <c46becdf635353f71feac77c76a4f0c6c1a0c193.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 31/38] upower: fix gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:49 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-support/upower/upower_0.9.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/recipes-support/upower/upower_0.9.14.bb
index 8cf8e43..dddaa9b 100644
--- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
+++ b/meta-oe/recipes-support/upower/upower_0.9.14.bb
@@ -4,13 +4,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
 PR = "r2"
 
-DEPENDS = "libusb1 libgudev glib-2.0 dbus-glib polkit gobject-introspection-stub"
+DEPENDS = "libusb1 libgudev glib-2.0 dbus-glib polkit"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "18803f82102d56aac90949d1e4251645"
 SRC_URI[sha256sum] = "81eb44c0453b264a737d32f763a31d5b1776f050a47d5be85fc5e9caf874a4c5"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext gobject-introspection
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
-- 
2.7.0


