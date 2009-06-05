Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MCZAS-0003AU-63
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 15:09:08 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MCZ1a-0008PW-LE
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 13:59:58 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MCZ1a-0007JX-Gk
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 13:59:58 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 05 Jun 2009 13:59:58 +0100
Message-Id: <1244206798.2611.160.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: [patch] micro: eliminate some further bloat
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
X-List-Received-Date: Fri, 05 Jun 2009 13:09:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Almost the entire contents of the base-files package is unnecessary in a
micro-type environment, some of it (e.g. /usr/games) laughably so.  The
standard fstab is only really useful for mounting /proc, and it turns
out that a single-line patch to sysvinit allows this to be dispensed
with as well.

p.

--

diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index cc475f3..98dd00d 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Miscellaneous files for the base system."
 SECTION = "base"
 PRIORITY = "required"
-PR = "r86"
+PR = "r87"
 LICENSE = "GPL"
 
 SRC_URI = " \
@@ -45,6 +45,14 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
 	   /mnt /media /media/card /media/cf /media/net /media/ram \
 	   /media/union /media/realroot /media/hdd \
 	   /media/mmc1"
+
+dirs755_micro = "/dev /proc ${sysconfdir}"
+dirs2775_micro = ""
+dirs1777_micro = "/tmp"
+
+media = "card cf net ram"
+media_micro = ""
+
 volatiles = "cache run log lock tmp"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
 	     ${sysconfdir}/inputrc ${sysconfdir}/issue /${sysconfdir}/issue.net \
@@ -71,9 +79,11 @@ do_install () {
 		install -m 2755 -d ${D}$d
 	done
 	for d in ${volatiles}; do
-		ln -sf volatile/$d ${D}/${localstatedir}/$d
+                if [ -d ${D}${localstatedir}/volatile/$d ]; then
+                        ln -sf volatile/$d ${D}/${localstatedir}/$d
+                fi
 	done
-	for d in card cf net ram; do
+	for d in ${media}; do
 		ln -sf /media/$d ${D}/mnt/$d
 	done
 
@@ -83,40 +93,42 @@ do_install () {
 		echo ${hostname} > ${D}${sysconfdir}/hostname
 	fi
 
-        install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
-
-        if [ -n "${DISTRO_NAME}" ]; then
-		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
-		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
-		if [ -n "${DISTRO_VERSION}" ]; then
-			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
-			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
-		fi
-		echo "\n \l" >> ${D}${sysconfdir}/issue
-		echo >> ${D}${sysconfdir}/issue
-		echo "%h"    >> ${D}${sysconfdir}/issue.net
-		echo >> ${D}${sysconfdir}/issue.net
-	else
- 	       install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
- 	       install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}/issue.net
- 	fi
-
-	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
-	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
-	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
-	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
-	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
-	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
-	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
-	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
-	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
-	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
-
-	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3 GFDL-1.2; do
-		install -m 0644 ${WORKDIR}/licenses/$license ${D}${datadir}/common-licenses/
-	done
+        if [ "${DISTRO}" != "micro" ]; then
+                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
+
+                if [ -n "${DISTRO_NAME}" ]; then
+        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
+        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
+        		if [ -n "${DISTRO_VERSION}" ]; then
+        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
+        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
+        		fi
+        		echo "\n \l" >> ${D}${sysconfdir}/issue
+        		echo >> ${D}${sysconfdir}/issue
+        		echo "%h"    >> ${D}${sysconfdir}/issue.net
+        		echo >> ${D}${sysconfdir}/issue.net
+        	else
+ 	                install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
+                        install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}/issue.net
+                fi
+
+                install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
+        	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
+        	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
+        	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
+        	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
+        	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
+        	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
+        	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
+        	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3 GFDL-1.2; do
+	        	install -m 0644 ${WORKDIR}/licenses/$license ${D}${datadir}/common-licenses/
+        	done
+
+	        ln -sf /proc/mounts ${D}${sysconfdir}/mtab
+        	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
+        fi
 
-	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
+	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
 }
 
 
@@ -156,6 +168,7 @@ PACKAGE_ARCH_rt3000 = "rt3000"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
+CONFFILES_${PN}_micro = ""
 CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
 CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
 
diff --git a/recipes/sysvinit/sysvinit/rcS b/recipes/sysvinit/sysvinit/rcS
index e7a7e61..e1c8b57 100755
--- a/recipes/sysvinit/sysvinit/rcS
+++ b/recipes/sysvinit/sysvinit/rcS
@@ -14,7 +14,7 @@ export PATH runlevel prevlevel
 
 #	Make sure proc is mounted
 #
-[ -d "/proc/1" ] || mount /proc
+[ -d "/proc/1" ] || mount proc /proc -t proc
 
 #
 #	See if system needs to be setup. This is ONLY meant to
diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
index e65391a..cc7b913 100644
--- a/recipes/sysvinit/sysvinit_2.86.bb
+++ b/recipes/sysvinit/sysvinit_2.86.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "System-V like init."
 SECTION = "base"
 LICENSE = "GPL"
 HOMEPAGE = "http://freshmeat.net/projects/sysvinit/"
-PR = "r53"
+PR = "r54"
 
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.




