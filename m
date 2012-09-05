Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9Mle-0007h6-Hr
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 23:04:10 +0200
Received: by wgbds1 with SMTP id ds1so4011275wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 13:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/6lNV6E+YHOMTb5YnPWqa58pjAfdoMeDqifnYQkRFzc=;
	b=Ctod2f/H8zw9e7ke/9skqxJcuU5SOCyNJAEKDf1tlqzlfjqIggSjfrWWP5f1nqlw78
	pp9gxRZULbkVBMWDTN4SWkoyO/U6Nc1Rq1IATYrVMocwc/xUczrEkWTOvchVgTrOxij0
	J4m1Z/PDKRGlzp+Ne2BYGwgyezaA7CaYEehOBYNWgKmT2QjOckdcV11Kfkoa2EfAer/G
	ONwldxwwA47PFUrDe0C+cc+QQQnJKlkT+mFydRrEnQxm+i3rfT1F1ITv984h7033Dp73
	lcZLZe7sqZXT3i2A2f46UPTUUP6R1nCCp6FjiU3e+s9IDNxaUr3GwNvgpgoHep3DnDGq
	jtiA==
Received: by 10.216.207.167 with SMTP id n39mr15307717weo.23.1346878307040;
	Wed, 05 Sep 2012 13:51:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv8sm454550wib.0.2012.09.05.13.51.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 13:51:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 22:52:14 +0200
Message-Id: <1346878334-31980-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][PATCH] foxtrotgps: upgrade to 1.1.1 and fix build with new automake
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
X-List-Received-Date: Wed, 05 Sep 2012 21:04:10 -0000

* It was failing like this
  | automake: warnings are treated as errors
  | automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
  | autoreconf: automake failed with exit status: 1
  after automake was upgraded to 1.12.3
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029108.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../foxtrotgps/{foxtrotgps_1.1.0.bb => foxtrotgps_1.1.1.bb}       | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/foxtrotgps/{foxtrotgps_1.1.0.bb => foxtrotgps_1.1.1.bb} (69%)

diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.0.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
similarity index 69%
rename from meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.0.bb
rename to meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index 2580abc..4572b8f 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.0.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -7,9 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ gconf libglade sqlite3 libexif gpsd"
 
 SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz"
-SRC_URI[md5sum] = "1585d332ae546a0f84e8327ac21b27b9"
-SRC_URI[sha256sum] = "2d0d66d3e6d3c6ca1c8e5d82129182a49691b9622067b7c5edf82d808ebf1a77"
+SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
+SRC_URI[sha256sum] = "ae9706285510554cc0813ac92522e0d1672b0ddb065307bfacfcff3c328f6adb"
 
 inherit autotools pkgconfig perlnative
 
+do_configure_prepend() {
+  mv ${S}/configure.in ${S}/configure.ac
+}
+
 RRECOMMENDS_${PN} = "gpsd"
-- 
1.7.12



