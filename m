Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF49703EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 11:09:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jul 2014 04:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,637,1400050800"; d="scan'208";a="571082371"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.67.153])
	by orsmga002.jf.intel.com with ESMTP; 10 Jul 2014 04:09:38 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jul 2014 14:09:35 +0300
Message-Id: <1404990575-2064-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1404990575-2064-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1404990575-2064-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [meta-oe][PATCH v2 2/2] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Thu, 10 Jul 2014 11:09:44 -0000

Use the latest version of usb-modeswitch (2.2.0) and
usb-modeswitch-data (20140529). The data package depends
on new usb-modeswitch version so upgrade both of them at
the same time.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 ...odeswitch-data_20130807.bb => usb-modeswitch-data_20140529.bb} | 8 ++++----
 .../{usb-modeswitch_2.0.1.bb => usb-modeswitch_2.2.0.bb}          | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20130807.bb => usb-modeswitch-data_20140529.bb} (52%)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.0.1.bb => usb-modeswitch_2.2.0.bb} (68%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
similarity index 52%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
index e33f296..a265411 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
@@ -4,14 +4,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit allarch
 
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.tar.bz2"
-SRC_URI[md5sum] = "91feff51deba6e48e78506b8f4db2274"
-SRC_URI[sha256sum] = "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5d94a4d35651699eb"
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI[md5sum] = "dff94177781298aaf0b3c2a3c3dea6b2"
+SRC_URI[sha256sum] = "53889157937109e04dafe897c098ec94f3f44f9c0c83fc6ec8417aa9a587e536"
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-RDEPENDS_${PN} = "usb-modeswitch"
+RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
 FILES_${PN} += "${base_libdir}/udev/rules.d/ \
                 ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
similarity index 68%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
index 61caa84..5e95bb9 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libusb1"
 
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${PV}.tar.bz2"
-SRC_URI[md5sum] = "e48d4419d0574d342bb183f7465556d0"
-SRC_URI[sha256sum] = "4706c9cfe825263e189f55730ea3d1d8634aeb15645a1098532e946e770f7f95"
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI[md5sum] = "f323fe700edd6ea404c40934ddf32b22"
+SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5991f7680eb908a3a"
 
 EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
 
-- 
1.8.3.1


