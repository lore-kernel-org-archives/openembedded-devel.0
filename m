Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q1edv-0000ey-UM for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 13:55:32 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 7FA3B130091
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 13:53:41 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2011 13:53:40 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<20110321093020.GB3798@jama.jama.net>
	<201103211236.39719.pgsellmann@portner-elektronik.at>
In-Reply-To: <201103211236.39719.pgsellmann@portner-elektronik.at>
MIME-Version: 1.0
Message-Id: <201103211353.40761.pgsellmann@portner-elektronik.at>
Subject: [PATCH v2] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 12:55:32 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Mark some files in ${sysconfdir} as configuration files so they are not blindly overwritten when upgrading
Adjust conffiles variable to be usable as default in CONFFILES
Images nylon,slugo inherit and amend default set of conffiles
Image micro has very few configuration files

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
---
 recipes/base-files/base-files_3.0.14.bb |   21 +++++++++++----------
 1 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index 0aa27f4..65cab03 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Miscellaneous files for the base system."
 SECTION = "base"
 PRIORITY = "required"
-PR = "r102"
+PR = "r103"
+
 LICENSE = "GPL"
 
 SRC_URI = " \
@@ -55,10 +56,10 @@ media = "card cf net ram"
 media_micro = ""
 
 volatiles = "cache run log lock tmp"
-conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
-	     ${sysconfdir}/inputrc ${sysconfdir}/issue /${sysconfdir}/issue.net \
-	     ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
-	     ${sysconfdir}/default"
+conffiles = "${sysconfdir}/fstab ${sysconfdir}/host.conf ${sysconfdir}/hostname \
+            ${sysconfdir}/inputrc ${sysconfdir}/issue /${sysconfdir}/issue.net \
+            ${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
+            "
 
 #
 # set standard hostname, might be a candidate for a DISTRO variable? :M:
@@ -95,7 +96,7 @@ do_install () {
 	fi
 
         if [ "${DISTRO}" != "micro" -a "${DISTRO}" != "micro-uclibc" ]; then
-                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
+                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
 
                 if [ -n "${DISTRO_NAME}" ]; then
         		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
@@ -181,8 +182,8 @@ PACKAGE_ARCH_rt3000 = "rt3000"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
-CONFFILES_${PN}_micro = ""
-CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
-CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
+CONFFILES_${PN} = ${conffiles}
+CONFFILES_${PN}_micro = "${sysconfdir}/hostname ${sysconfdir}/nsswitch.conf"
+CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf" + ${conffiles}
+CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf" + ${conffiles}
 
-- 
1.7.2.3




