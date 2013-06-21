Return-Path: <holger+oe@freyther.de>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id D1179605F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2013 08:50:59 +0000 (UTC)
Received: from sangmingze-mail.local (91-65-247-193-dynip.superkabel.de
	[91.65.247.193])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 2904A1DC04;
	Fri, 21 Jun 2013 08:50:48 +0000 (UTC)
Received: from localhost.lan ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>)
	id 1Upx3Y-0007Ls-Lp; Fri, 21 Jun 2013 10:50:56 +0200
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jun 2013 10:50:54 +0200
Message-Id: <1371804654-27124-1-git-send-email-holger+oe@freyther.de>
X-Mailer: git-send-email 1.7.10.4
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>,
	Holger Hans Peter Freyther <zecke@selfish.org>
Subject: [meta-oe][PATCH] gpsd: Mark the configuration file as a CONFFILES
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
X-List-Received-Date: Fri, 21 Jun 2013 08:51:00 -0000

From: Holger Hans Peter Freyther <holger@moiji-mobile.com>

Mark the file in /etc/default/gpsd as a CONFFILES of the gpsd-conf
package.

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index 99f019b..b0d5a79 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/gpsd"
 
 EXTRANATIVEPATH += "chrpath-native"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
     file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
@@ -116,6 +116,7 @@ FILES_libgps = "${libdir}/libgps.so.*"
 
 DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts"
 FILES_gpsd-conf = "${sysconfdir}"
+CONFFILES_gpsd-conf = "${sysconfdir}/default/gpsd.default"
 
 DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
 FILES_gpsd-gpsctl = "${bindir}/gpsctl"
-- 
1.7.10.4


