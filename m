Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUlNE-0006rM-81
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 23:03:20 +0200
Received: by wibhm14 with SMTP id hm14so1048863wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=w4LLSSfKB4zEpkzM8Hh/P9LL/VP/nlt7vIg6BeKQqjA=;
	b=DUT2LtY/139tqTVsy/iaLXh3r5FqPGBxuV2yg95YagIQziifwai5bHucxjaerChCqc
	3Wj3IYtZM1IfcH/MsBAqJGX+wHIkPEEPw9pQzZoVMs6qD+Ra2mCHQwWoXfLPudsbXQi5
	Ec69bFDazOjJGsWYnof8KTorFR3K8+jGoxpoGtkPCpzUL1y0C3csIJvC7ZuGuSBySi3S
	YdmuAdAHoLGsH3f0XB/vDMXOxnpzd5BtYY16rV4yeM2/oeGHMwTpXnuPN7QzQgdvDkaB
	Q9V+r3kZww4l9XN/zsguAF4Ltv6Bl7wdHmffEdRcfhxJ6Xk38hDhIp6uSYhCikIpNFB4
	z4HQ==
Received: by 10.180.107.99 with SMTP id hb3mr15353910wib.0.1337201584952;
	Wed, 16 May 2012 13:53:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm12845725wib.2.2012.05.16.13.53.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 13:53:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2012 22:53:00 +0200
Message-Id: <1337201580-25725-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][RFC] libnl: upgrade to 3.2.9 and fix upgrade path
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
X-List-Received-Date: Wed, 16 May 2012 21:03:20 -0000

* COPYING change is only formal from
  http://git.infradead.org/users/tgr/libnl.git/commitdiff/c857625be074a7b9ef6adbcdde986a0b23aae901

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libnl/{libnl_3.2.3.bb => libnl_3.2.9.bb}       |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/libnl/{libnl_3.2.3.bb => libnl_3.2.9.bb} (74%)

diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb b/meta-oe/recipes-support/libnl/libnl_3.2.9.bb
similarity index 74%
rename from meta-oe/recipes-support/libnl/libnl_3.2.3.bb
rename to meta-oe/recipes-support/libnl/libnl_3.2.9.bb
index 38d34bf..11b901c 100644
--- a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
+++ b/meta-oe/recipes-support/libnl/libnl_3.2.9.bb
@@ -5,14 +5,14 @@ SECTION = "libs/network"
 PE = "1"
 
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "dbbb44801e833cf9ca4fdc943f2a58ee"
-SRC_URI[sha256sum] = "69f4a360350ea61f2c988f947c251995c04093c74743eae9eeffba85846ef007"
+SRC_URI[md5sum] = "c13adec0239b266207fff07d79e5ce9e"
+SRC_URI[sha256sum] = "9f23e9460bd9bb7fbe09af5eb281e4a43a26fa245ea864ed5e28fe4e8118af63"
 
 inherit autotools pkgconfig
 
@@ -32,6 +32,8 @@ do_install_append() {
 FILES_${PN} = "${libdir}/libnl-3.so.* \
                ${libdir}/libnl.so.* \
                ${sysconfdir}"
+RREPLACES_${PN} = "libnl2"
+RCONFLICTS_${PN} = "libnl2"
 FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
 FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
                     ${libdir}/libnl/cli/*/*.la"
@@ -44,5 +46,7 @@ FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
 FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
 FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
 FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
-                     ${libdir}/libnl-genl.so.*"
-
+                     ${libdir}/libnl-genl.so.* \
+                     ${sbindir}/genl-ctrl-list"
+RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
+RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
1.7.8.6



