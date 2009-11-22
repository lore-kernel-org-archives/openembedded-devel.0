Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NC3lV-00009W-4x
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 05:09:36 +0100
Received: by bwz9 with SMTP id 9so4130934bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 20:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1LOMg0QCRF80ZVID3nEqEiuJnTPg8BJfTjrRx1dDs9c=;
	b=fJSw7AWSTanDaDCfZsGdeuGXrYBErxhbFpWegHPWHCe8gjGU9U3Qaru5r14CuQkmiU
	kwXvzpTC0sriiweoCpgFWFpoZ2Fu5fhHzIfM9Qo78J23X7/Um22R5A/Pv3hcC4LvBRzJ
	zKnNVavQHpkH5lVjQfIMEq2IiUbPYWwLlxta4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HIZ4tL+NTTiLorbLKs2XVkq6l6es3qY2E7z2pprc61DOlhQJArzhQagnRixnr9D9KI
	ap8ku+4O8nu1mZ+bLsGmdkt8Cr+DSt6mm0L6cf9geJxZBlVtIrhkqb0i1lzGsGH/iTPi
	QBXV5S2943bID0ZzerCN59eW9T8xzU1FXDnTQ=
Received: by 10.204.33.193 with SMTP id i1mr3241654bkd.75.1258862886257;
	Sat, 21 Nov 2009 20:08:06 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm987188fxm.1.2009.11.21.20.08.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 21 Nov 2009 20:08:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2009 05:08:00 +0100
Message-Id: <1258862880-17496-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.3
In-Reply-To: <1258862880-17496-1-git-send-email-Martin.Jansa@gmail.com>
References: <1258862880-17496-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] kernel.bbclass: deploy both stripped and non-stripped modules in tgz
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
X-List-Received-Date: Sun, 22 Nov 2009 04:09:36 -0000

* Change name of old modules*.tgz file to modules*-dbg.tgz
* Run do_strip_modules in PKGDEST for every package and then in PKGD,
  from where .tgz will be created, just because I haven't found where
  do_strip_modules can be hooked, to be run only in PKGD before files
  are copied to PKGDEST, or are they moved directly from source?
* After do_strip_modules create modules*.tgz with stripped modules
---
 classes/kernel.bbclass       |    2 +-
 classes/module_strip.bbclass |   26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 637805e..335957d 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -528,7 +528,7 @@ do_deploy() {
 	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 
 	if [ -d "${D}/lib" ]; then
-		fakeroot tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${D} lib
+		fakeroot tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}-dbg.tgz -C ${D} lib
 	fi
 
 	cd ${DEPLOY_DIR_IMAGE}
diff --git a/classes/module_strip.bbclass b/classes/module_strip.bbclass
index 1740919..d69acc0 100644
--- a/classes/module_strip.bbclass
+++ b/classes/module_strip.bbclass
@@ -13,14 +13,36 @@ do_strip_modules () {
 					if ! [ -d "$module"  ] ; then
 						${STRIP} -v -g $module
 					fi
-				done	
-#				NM="${CROSS_DIR}/bin/${HOST_PREFIX}nm" OBJCOPY="${CROSS_DIR}/bin/${HOST_PREFIX}objcopy" strip_module $modules
+				done
+#			      NM="${CROSS_DIR}/bin/${HOST_PREFIX}nm" OBJCOPY="${CROSS_DIR}/bin/${HOST_PREFIX}objcopy" strip_module $modules
 			fi
 		fi
 	done
+	if test -e ${PKGD}/lib/modules; then
+		if [ "${KERNEL_MAJOR_VERSION}" == "2.6" ]; then
+			modules="`find ${PKGD}/lib/modules -name \*.ko`"
+		else
+			modules="`find ${PKGD}/lib/modules -name \*.o`"
+		fi
+		if [ -n "$modules" ]; then
+			for module in $modules ; do
+				if ! [ -d "$module"  ] ; then
+					${STRIP} -v -g $module
+				fi
+			done	
+#			NM="${CROSS_DIR}/bin/${HOST_PREFIX}nm" OBJCOPY="${CROSS_DIR}/bin/${HOST_PREFIX}objcopy" strip_module $modules
+		fi
+	fi
+}
+
+do_deploy_stripped_modules () {
+	if [ -d "${PKGD}/lib" ]; then
+		fakeroot tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${PKGD} lib
+	fi
 }
 
 python do_package_append () {
 	if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, 1) != '1'):
 		bb.build.exec_func('do_strip_modules', d)
+		bb.build.exec_func('do_deploy_stripped_modules', d)
 }
-- 
1.6.5.3



