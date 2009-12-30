Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NPtkX-0001xk-0L
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:17:48 +0100
Received: by pwi18 with SMTP id 18so7227980pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 00:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=i8pl/QwqXgtZgB/xsfAQDnuCdiSZi7EuJU2D7AlOe2c=;
	b=g26LhrYD+xW99oniLHOoNPXWTc98CD4p2lWUg4FZ3qTG+d4y00UTfWhy6LqPmbR4xR
	RWbDoT40NreSE5MYgAa3hfwVZJsIiEdsVjrvK2Tk9NDwiiPr6zB6RLewQY63RJ0odlM6
	DdtDbPkQaVlBh+QDh+WoizUY2ksGEALkVLd4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Io8YASPIpZRXKHmfAXQy1/0ll175/L3VaYoEGyS1bUPTefzauuFo1ngCPVVleQRcn/
	+4jcarjMDMS8fzZhf4A7yPzCqOk7rRRmRP1G/YUloESsP9cHE5mWoZ92YUik/jq/M3Eg
	HHXWZK7HAII6JS40ZVYtrUwAYouHJfVJ6tgbY=
Received: by 10.140.57.15 with SMTP id f15mr2448948rva.106.1262160945931;
	Wed, 30 Dec 2009 00:15:45 -0800 (PST)
Received: from localhost ([123.54.101.56])
	by mx.google.com with ESMTPS id 23sm13341817pzk.12.2009.12.30.00.15.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Dec 2009 00:15:45 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2009 16:15:36 +0800
Message-Id: <1262160936-28480-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 08:17:48 -0000

1. Remove the *_micro variable overridding;
2. Remove the micro/micro-uclibc specific installation decision, which causes the installation of base-file failed when DISTRO=micro/micro-uclibc.
---
 recipes/base-files/base-files_3.0.14.bb |   70 ++++++++++++++-----------------
 1 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index 483aef7..61bb71e 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -46,12 +46,7 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
 	   /media/union /media/realroot /media/hdd \
 	   /media/mmc1"
 
-dirs755_micro = "/dev /proc /sys ${sysconfdir}"
-dirs2775_micro = ""
-dirs1777_micro = "/tmp"
-
 media = "card cf net ram"
-media_micro = ""
 
 volatiles = "cache run log lock tmp"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
@@ -93,40 +88,38 @@ do_install () {
 		echo ${hostname} > ${D}${sysconfdir}/hostname
 	fi
 
-        if [ "${DISTRO}" != "micro" -a "${DISTRO}" != "micro-uclibc" ]; then
-                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
-
-                if [ -n "${DISTRO_NAME}" ]; then
-        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
-        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
-        		if [ -n "${DISTRO_VERSION}" ]; then
-        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
-        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
-        		fi
-        		echo "\n \l" >> ${D}${sysconfdir}/issue
-        		echo >> ${D}${sysconfdir}/issue
-        		echo "%h"    >> ${D}${sysconfdir}/issue.net
-        		echo >> ${D}${sysconfdir}/issue.net
-        	else
- 	                install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
-                        install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}/issue.net
-                fi
+	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
+
+	if [ -n "${DISTRO_NAME}" ]; then
+		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
+		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
+		if [ -n "${DISTRO_VERSION}" ]; then
+			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
+			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
+		fi
+		echo "\n \l" >> ${D}${sysconfdir}/issue
+		echo >> ${D}${sysconfdir}/issue
+		echo "%h"    >> ${D}${sysconfdir}/issue.net
+		echo >> ${D}${sysconfdir}/issue.net
+	else
+		install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
+		install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}/issue.net
+	fi
+
+	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
+	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
+	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
+	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
+	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
+	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
+	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
+	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
+	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3 GFDL-1.2; do
+		install -m 0644 ${WORKDIR}/licenses/$license ${D}${datadir}/common-licenses/
+	done
 
-                install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
-        	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
-        	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
-        	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
-        	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
-        	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
-        	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
-        	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
-        	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3 GFDL-1.2; do
-	        	install -m 0644 ${WORKDIR}/licenses/$license ${D}${datadir}/common-licenses/
-        	done
-
-	        ln -sf /proc/mounts ${D}${sysconfdir}/mtab
-        	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
-        fi
+	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
+	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 
 	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
 }
@@ -168,7 +161,6 @@ PACKAGE_ARCH_rt3000 = "rt3000"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
-CONFFILES_${PN}_micro = ""
 CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
 CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
 
-- 
1.5.4.3



