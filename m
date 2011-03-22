Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q1zcl-0002sf-Vu for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 12:19:44 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 54354130062
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 12:17:54 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 12:17:53 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<1300725546.2228.88.camel@phil-desktop>
	<201103211919.11954.pgsellmann@portner-elektronik.at>
In-Reply-To: <201103211919.11954.pgsellmann@portner-elektronik.at>
MIME-Version: 1.0
Message-Id: <201103221217.53713.pgsellmann@portner-elektronik.at>
Subject: [PATCH v3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Tue, 22 Mar 2011 11:19:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Mark some files in ${sysconfdir} as configuration files so they are not blindly overwritten when upgrading
Adjust conffiles variable to be usable as default in CONFFILES
Distros nylon,slugos inherit and amend default set of conffiles
Distro micro has very few configuration files

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
---
 recipes/base-files/base-files_3.0.14.bb |   21 +++++++++++----------
 1 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index 0aa27f4..6d64699 100644
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
+CONFFILES_${PN} = "${conffiles}"
+CONFFILES_${PN}_micro = "${sysconfdir}/hostname ${sysconfdir}/nsswitch.conf"
+CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf ${conffiles}"
+CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf ${conffiles}"
 
-- 
1.7.2.3



