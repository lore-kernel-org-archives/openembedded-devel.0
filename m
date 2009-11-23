Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCeHb-00057U-Mh
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 20:09:10 +0100
Received: by yxe5 with SMTP id 5so2605667yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 11:07:39 -0800 (PST)
Received: by 10.101.183.22 with SMTP id k22mr3841203anp.107.1259003259064;
	Mon, 23 Nov 2009 11:07:39 -0800 (PST)
Received: from localhost.localdomain ([200.184.118.130])
	by mx.google.com with ESMTPS id 9sm1339297ywe.41.2009.11.23.11.07.36
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Nov 2009 11:07:37 -0800 (PST)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 16:01:13 -0300
Message-Id: <1259002873-10408-1-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: koen@openembedded.org
Subject: [PATCH] udev-141: avoid using full path when linking udev rules.d
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
X-List-Received-Date: Mon, 23 Nov 2009 19:09:10 -0000

When it's directly linked to ${sysconfdir}/udev/rules.d dpkg will fail when
unpacking Network Manager, as it'll try to extract files over this directory
and the link will be pointing to the main host files.

Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
---
 recipes/udev/udev_141.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index b54b059..1ebfccb 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 # Untested
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r15"
+PR = "r16"
 
 # needed for init.d script
 RDEPENDS_${PN} += "udev-utils"
@@ -70,7 +70,7 @@ do_install () {
 	# This is hardcoded to $(udev_prefix)/lib/udev/rules.d in the
 	# Makefile, even if libdir is lib64.
 	mv ${D}/lib/udev/rules.d ${D}${sysconfdir}/udev/
-	ln -sf ${sysconfdir}/udev/rules.d ${D}/lib/udev/
+	ln -sf ../../${sysconfdir}/udev/rules.d ${D}/lib/udev/
 
  	cp ${S}/rules/rules.d/* ${D}${sysconfdir}/udev/rules.d/
 	cp ${S}/rules/packages/* ${D}${sysconfdir}/udev/rules.d/
-- 
1.6.5



