Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBSTw-0000c9-R0
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 17:06:53 +0100
Received: by mail-pb0-f50.google.com with SMTP id up1so1787644pbc.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2013 07:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=zR3BcDmrcGBJl/XoVlE1zNKcmGmuHFPBOfLLbv6I8IA=;
	b=l5/tYMzUQ+N/Zc14xO6H+mUr1E+/d6h3ytZ08tqHM99th8VoNFaZHC2eRDc4nw+7qp
	uHcUpmmVZMooTRCFm7kA4Aey2uf582M059umuEQei8O6Py/oUD3S6QyxGGzxiusj/SDl
	b0P0gkQJC/M8b7X6klW3J+fGEGCvFp+jBBamsblKJ6d3Ps9aaaVx/Nh6qNl2VJ1ODhCn
	DWCMcG4Q3JWzNxo9znN3y8ldJ+CjuI5KdjesNWtjcG2pjJyYOrLDR235YjoP0uHMqkwq
	zl4toILJah80mbOSs0rtwGsDjLVQwditc1Nc/mg/l1b9o+vGWC9EtoshJ9l0bKMpz6KJ
	SMKw==
X-Received: by 10.67.2.5 with SMTP id bk5mr19131589pad.126.1362153024541;
	Fri, 01 Mar 2013 07:50:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm1369677pbt.39.2013.03.01.07.50.20
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 07:50:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Mar 2013 16:50:15 +0100
Message-Id: <1362153015-733-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH][meta-oe] gpsd: fix udev rules file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 16:06:56 -0000

systemd-udevd[41]: unknown key 'SYSFS{idVendor}' in /etc/udev/rules.d/60-gpsd.rules:43
systemd-udevd[41]: invalid rule '/etc/udev/rules.d/60-gpsd.rules:43'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules | 2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules b/meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules
index c01db06..61143b8 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules
@@ -40,7 +40,7 @@ ATTR{idVendor}=="1546", ATTR{idProduct}=="01a5", SYMLINK="gps%n", RUN+="/lib/ude
 # FTDI FT232
 ATTR{idVendor}=="0403", ATTR{idProduct}=="6001", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
 # u-blox 4
-SYSFS{idVendor}=="1546", SYSFS{idProduct}=="01a4", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+ATTR{idVendor}=="1546", ATTR{idProduct}=="01a4", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
 
 ACTION=="remove", RUN+="/lib/udev/gpsd.hotplug.wrapper"
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index 105dbf6..e98d795 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/gpsd"
 
 EXTRANATIVEPATH += "chrpath-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
-- 
1.8.1.4



