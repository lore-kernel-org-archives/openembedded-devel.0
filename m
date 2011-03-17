Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q0AsN-0000ST-Kp for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 11:56:20 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 5E0B52C400D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:54:29 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
Date: Thu, 17 Mar 2011 11:54:23 +0100
To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Message-Id: <201103171154.23397.pgsellmann@portner-elektronik.at>
Subject: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Thu, 17 Mar 2011 10:56:20 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mark some files in ${sysconfdir} as configuration files so they are not blindly overwritten when upgrading

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
---
 recipes/base-files/base-files_3.0.14.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index acd12a4..6495d45 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Miscellaneous files for the base system."
 SECTION = "base"
 PRIORITY = "required"
-PR = "r100"
+PR = "r101"
 LICENSE = "GPL"
 
 SRC_URI = " \
@@ -95,7 +95,7 @@ do_install () {
 	fi
 
         if [ "${DISTRO}" != "micro" -a "${DISTRO}" != "micro-uclibc" ]; then
-                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
+                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
 
                 if [ -n "${DISTRO_NAME}" ]; then
         		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
@@ -181,7 +181,8 @@ PACKAGE_ARCH_rt3000 = "rt3000"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
+CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname ${sysconfdir}/motd \
+    ${sysconfdir}/profile ${sysconfdir}/nsswitch.conf ${sysconfdir}/host.conf"
 CONFFILES_${PN}_micro = ""
 CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
 CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
-- 
1.7.2.3



