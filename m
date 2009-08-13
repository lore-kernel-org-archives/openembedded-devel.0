Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1Mbc3Z-0001K1-3R
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 17:17:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 17A6D53A8DF;
	Thu, 13 Aug 2009 11:01:00 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13434-07-3; Thu, 13 Aug 2009 11:01:00 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id C416F53A938; Thu, 13 Aug 2009 11:00:51 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 8F29E53A977;
	Thu, 13 Aug 2009 11:00:47 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 9AC6941A96; Thu, 13 Aug 2009 11:00:47 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 11:00:40 -0400
Message-Id: <1250175641-4869-3-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1250175641-4869-2-git-send-email-msmith@cbnco.com>
References: <1250175641-4869-1-git-send-email-msmith@cbnco.com>
	<1250175641-4869-2-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 3/4] udev 141: fix packaging on x86_64
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
X-List-Received-Date: Thu, 13 Aug 2009 15:17:33 -0000

udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
is ${prefix}/lib64. This means some paths need to be hardcoded to "/lib"
instead of "${base_libdir}".

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/udev/udev_141.bb |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 3f42564..13b3808 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 # Untested
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r11"
+PR = "r12"
 
 # needed for init.d script
 RDEPENDS_${PN} += "udev-utils"
@@ -51,8 +51,10 @@ RPROVIDES_${PN} = "hotplug"
 FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
 FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 
-FILES_${PN} += "${libdir}/udev/* ${base_libdir}/udev/*"
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
+# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
+# is ${prefix}/lib64
+FILES_${PN} += "/lib/udev/* /lib/udev/*"
+FILES_${PN}-dbg += "/lib/udev/.debug"
 
 do_install () {
 	install -d ${D}${usrsbindir} \
@@ -64,8 +66,11 @@ do_install () {
 	install -d ${D}${sysconfdir}/default
 	install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/udev
 
-	mv ${D}${base_libdir}/udev/rules.d ${D}${sysconfdir}/udev/
-	ln -sf ${sysconfdir}/udev/rules.d ${D}${base_libdir}/udev/
+	# Move udev rules from $(udev_prefix)/lib to /etc.
+	# This is hardcoded to $(udev_prefix)/lib/udev/rules.d in the
+	# Makefile, even if libdir is lib64.
+	mv ${D}/lib/udev/rules.d ${D}${sysconfdir}/udev/
+	ln -sf ${sysconfdir}/udev/rules.d ${D}/lib/udev/
 
  	cp ${S}/rules/rules.d/* ${D}${sysconfdir}/udev/rules.d/
 	cp ${S}/rules/packages/* ${D}${sysconfdir}/udev/rules.d/
-- 
1.6.3



