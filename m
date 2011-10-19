Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RGYGt-0004AX-F6
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 17:41:37 +0200
Received: by ggnj1 with SMTP id j1so300899ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ebDSf589RXB6NLQCoP+I+ui04hEWeLynXg14bo1YVWs=;
	b=C4FVoOSSCoeHJcAtZuzHeWH83Fe6gQciVgf70yabKTYXkQPUEAu4s1RLV/iY4pyLK4
	3NbaC+chozjtD+m0OYPFXRPxJIjO8cfS6YmhM7Yq1+rkS9K8I6ksAeS2mvz+BIvb9zZ3
	EuP4z+oa8baSp/YBHgI5q0syQ7GeMSp932Uqg=
Received: by 10.236.139.133 with SMTP id c5mr10628718yhj.62.1319038544216;
	Wed, 19 Oct 2011 08:35:44 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m37sm16823371anq.11.2011.10.19.08.35.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 08:35:43 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Oct 2011 15:35:32 +0000
Message-Id: <790990daa702e1ca0c4688b0c45d2fd95c4ed0eb.1319038482.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319038482.git.otavio@ossystems.com.br>
References: <cover.1319038482.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319038482.git.otavio@ossystems.com.br>
References: <cover.1319038482.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] udev: udev-systemd refactory
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
X-List-Received-Date: Wed, 19 Oct 2011 15:41:37 -0000

---
 meta-oe/recipes-core/udev/udev_173.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index 56ebb77..e4e634a 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
-PR = "r1"
+PR = "r2"
 
 # version specific SRC_URI
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
@@ -61,7 +61,8 @@ INITSCRIPT_PARAMS = "start 04 S ."
 
 PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
 
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
+FILES_${PN}-systemd = "${base_libdir}/systemd"
+RDEPENDS_${PN}-systemd += "udev"
 
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libgudev = "${base_libdir}/libgudev*.so.*"
@@ -82,9 +83,6 @@ FILES_${PN}-dbg += "/lib/udev/.debug"
 FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
 RDEPENDS_${PN}-consolekit += "consolekit"
 
-# Package up systemd files
-FILES_${PN} += "${base_libdir}/systemd"
-
 do_install () {
 	install -d ${D}${usrsbindir} \
 		   ${D}${sbindir}
-- 
1.7.2.5



