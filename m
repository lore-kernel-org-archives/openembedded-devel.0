Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4yXl-0005FB-Eh
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 18:51:25 +0100
Received: by ghbz2 with SMTP id z2so2309687ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:42:49 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.197.103 as permitted sender) client-ip=10.236.197.103; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.197.103 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.197.103])
	by 10.236.197.103 with SMTP id s67mr36140571yhn.5.1331055769291
	(num_hops = 1); Tue, 06 Mar 2012 09:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=QtaWvs9RtsgD4lOvYA6sEL7lya9xdugfKlEbTmiiQto=;
	b=JUNk385hpmI82thUl1OVILKh8G4x18AE3sx2LL8MYN/1b1LlbGlUAq7hNXk6+B5tLL
	lG2WTxg+96aASMs1UUbOXHi/lwcifK62pUlWjY9G9lQTljZVrDwIncp05AZGFEU5KVq8
	wRGkAlPVy8ds+w8a/MCqGZigk8gBjJg1xntePFxPDOjMsQc7ItuwWm0mmCpWixnBFyks
	HHmbbzD6VFtdckAQMHcZuGgEG8dM1gWDWu799rfisPB3HEhO81A3VPJDeBG4V0SBYT7z
	kaTn5MyBeBYx3+uD5JT8XJHqDSQlhoOWqWvMijaQbhiwgIe41ZJ9cdO7FZZk9O0e27Q5
	lyJA==
Received: by 10.236.197.103 with SMTP id s67mr28700742yhn.5.1331055769238;
	Tue, 06 Mar 2012 09:42:49 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id v26sm50765044yhk.1.2012.03.06.09.42.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 09:42:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 17:42:39 +0000
Message-Id: <c4f88151e3c636375023c71822f0c2ff75c2b760.1331055666.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331055665.git.otavio@ossystems.com.br>
References: <cover.1331055665.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331055665.git.otavio@ossystems.com.br>
References: <cover.1331055665.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/1] systemd-compat-units: rename service to run postinst scripts
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
X-List-Received-Date: Tue, 06 Mar 2012 17:51:25 -0000

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



