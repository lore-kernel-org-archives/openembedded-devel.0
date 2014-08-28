Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-08.prod.phx3.secureserver.net
	(p3plsmtpa06-08.prod.phx3.secureserver.net [173.201.192.109])
	by mail.openembedded.org (Postfix) with ESMTP id 7640A617B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:42:35 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa06-08.prod.phx3.secureserver.net with 
	id kHia1o00K1mTNtu01Hib3r; Thu, 28 Aug 2014 10:42:36 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Aug 2014 12:42:16 -0500
Message-Id: <1409247737-20963-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1409227581-20888-5-git-send-email-pab@pabigot.com>
References: <1409227581-20888-5-git-send-email-pab@pabigot.com>
Subject: [meta-oe][PATCH v2] gpsd: add deterministic support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 17:42:46 -0000

gpsd enables low-precision PPS (pulse-per-second) support by default,
but only includes the high-precision kernel API capabilities if
sys/timepps.h is also detected.  Under Linux the pps-tools package
installs this header.  Remove the feature non-determinism and increase
gpsd capabilities by adding an explicit dependency.

See: http://www.catb.org/gpsd/gpsd-time-service-howto.html#_enabling_pps

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
V2: replace PACKAGECONFIG with DEPENDS to remove nondeterminism

 meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
index d12c7a8..6d3adc1 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-replacement-native"
+DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-replacement-native pps-tools"
 PROVIDES = "virtual/gpsd"
 
 EXTRANATIVEPATH += "chrpath-native"
-- 
1.8.5.5


