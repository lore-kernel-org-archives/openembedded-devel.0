Return-Path: <pab@pabigot.com>
X-Greylist: delayed 434 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Aug 2014 12:13:42 UTC
Received: from p3plsmtpa12-08.prod.phx3.secureserver.net
	(p3plsmtpa12-08.prod.phx3.secureserver.net [68.178.252.237])
	by mail.openembedded.org (Postfix) with ESMTP id F091B65D34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:13:42 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa12-08.prod.phx3.secureserver.net with 
	id kC6Q1o0081mTNtu01C6WDu; Thu, 28 Aug 2014 05:06:30 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Aug 2014 07:06:20 -0500
Message-Id: <1409227581-20888-5-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1409227581-20888-1-git-send-email-pab@pabigot.com>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
Subject: [meta-oe][PATCH 4/5] gpsd: add optional support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 12:13:43 -0000

gpsd by default builds with PPS (pulse-per-second) support, but without
kernel support to capture the edge of the pulse the accuracy is only
+/-5us.  Under Linux the pps-tools package installs the header required
for the user-level API to the RFC 2783 KPPS interface.  If gpsd detects
this header, it will use the API to improve accuracy to +/-1us.

See: http://www.catb.org/gpsd/gpsd-time-service-howto.html#_enabling_pps

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
index d12c7a8..1c2d9eb 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
@@ -20,6 +20,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "fc5b03aae38b9b5b6880b31924d0ace3"
 SRC_URI[sha256sum] = "706fc2c1cf3dfbf87c941f543381bccc9c4dc9f8240eec407dcbf2f70b854320"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[kpps] = ",,pps-tools"
+
 inherit scons update-rc.d python-dir pythonnative systemd
 
 INITSCRIPT_NAME = "gpsd"
-- 
1.8.5.5


