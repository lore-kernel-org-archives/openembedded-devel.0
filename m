Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62gk-0002aW-N5
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 17:29:06 +0100
Received: by ggcy3 with SMTP id y3so904405ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=QtaWvs9RtsgD4lOvYA6sEL7lya9xdugfKlEbTmiiQto=;
	b=L5VSkFN0KE0UbPgMeJ4pqKLFRXkWe0CRLz90JjVyFxCDLK5oDkxdxUVa4HmnzJ4nu5
	aokoNWn8BVLKR8zrqSBUh/2Hma+t6N6Ydpxg8KDU6fi8meI8HVyjyxsisYLsoiGN9Pls
	yrgC7Oq/9hXq1dIJvUUxB4ZoWdO4RJE+0i9QAWtX5VHiVwEA4jKZ3MQu46hrQ4+RMC+q
	j+ENUeXPtvEr3rqsajbmN5ui9ZJCXrO+I85k45+IG56fUIffQZ+EwUJbEcSknHW30t81
	58lkG+78NsQx3UWQBtqz/uhaFSYyOj1YZkYyr9tpRRo4D/5qXWrthkh4rbFvyt03vNFE
	NqbA==
Received: by 10.101.135.32 with SMTP id m32mr920340ann.84.1331310026963;
	Fri, 09 Mar 2012 08:20:26 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id v26sm15023935yhk.1.2012.03.09.08.20.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:20:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:20:15 +0000
Message-Id: <c236b1ab3a2bc48dc7419fac6fedc032a36f12e7.1331309928.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331309928.git.otavio@ossystems.com.br>
References: <cover.1331309928.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331309928.git.otavio@ossystems.com.br>
References: <cover.1331309928.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/3] systemd-compat-units: rename service to run postinst scripts
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
X-List-Received-Date: Fri, 09 Mar 2012 16:29:06 -0000

OE-Core uses run-postinsts script to trigger package configuration on
first boot so the service ought to be named the same, for consistency.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-core/systemd/systemd-compat-units.bb   |    8 ++++----
 .../{opkg.service => run-postinsts.service}        |    6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-core/systemd/systemd-compat-units/{opkg.service => run-postinsts.service} (64%)

diff --git a/meta-oe/recipes-core/systemd/systemd-compat-units.bb b/meta-oe/recipes-core/systemd/systemd-compat-units.bb
index 9b60bbc..2cbce67 100644
--- a/meta-oe/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta-oe/recipes-core/systemd/systemd-compat-units.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Units to make systemd work better with existing sysvinit scripts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r14"
+PR = "r15"
 
 inherit allarch
 
@@ -12,9 +12,9 @@ SRC_URI = "file://*.service"
 do_install() {
 	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
 	install -d ${D}${base_libdir}/systemd/system/sysinit.target.wants/
-	install -m 0644 ${WORKDIR}/opkg.service ${D}${base_libdir}/systemd/system
-	ln -sf ../opkg.service ${D}${base_libdir}/systemd/system/basic.target.wants/
-	ln -sf ../opkg.service ${D}${base_libdir}/systemd/system/sysinit.target.wants/
+	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${base_libdir}/systemd/system
+	ln -sf ../run-postinsts.service ${D}${base_libdir}/systemd/system/basic.target.wants/
+	ln -sf ../run-postinsts.service ${D}${base_libdir}/systemd/system/sysinit.target.wants/
 
 	install -m 0644 ${WORKDIR}/machineid.service ${D}${base_libdir}/systemd/system
 	ln -sf ../machineid.service ${D}${base_libdir}/systemd/system/sysinit.target.wants/
diff --git a/meta-oe/recipes-core/systemd/systemd-compat-units/opkg.service b/meta-oe/recipes-core/systemd/systemd-compat-units/run-postinsts.service
similarity index 64%
rename from meta-oe/recipes-core/systemd/systemd-compat-units/opkg.service
rename to meta-oe/recipes-core/systemd/systemd-compat-units/run-postinsts.service
index 36cedf2..879a251 100644
--- a/meta-oe/recipes-core/systemd/systemd-compat-units/opkg.service
+++ b/meta-oe/recipes-core/systemd/systemd-compat-units/run-postinsts.service
@@ -1,12 +1,12 @@
 [Unit]
-Description=Opkg first boot configure
+Description=Run pending postinsts
 DefaultDependencies=no
-ConditionPathExists=|/etc/rcS.d/S98configure
+ConditionPathExists=|/etc/rcS.d/S98run-postinsts
 After=remount-rootfs.service
 Before=sysinit.target
 
 [Service]
-ExecStart=/etc/rcS.d/S98configure
+ExecStart=/etc/rcS.d/S98run-postinsts
 RemainAfterExit=No
 Type=oneshot
 StandardOutput=syslog
-- 
1.7.2.5



