Return-Path: <>
Received: from mail-we0-f176.google.com (unknown [74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 01FED6AE84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 22:58:10 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q59so5525516wes.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 15:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HB5K8yIiOoPf3cMB/yIiVIOZI5ZR2T7PW+bi+1wkcnQ=;
	b=0IOS2KDZqAeRRSBrrDit+hpkr3J5MMYRJpPXDhOanb6ykyXEro5dKxef8r4wuFUXn4
	Qs0uhKpTjAL4X4zvYFUIngf6PkTwKMztEcRoJrep8Ma9kIK1fvbFhsLR8WfK8Zz+XAa6
	s4zhiBNiS5anFFc6RIsD5mGL0h1ytbTCpBy2GmJhAbdbWJXgptYktAqpkI5Jgdqrv4V8
	fcWWvNfYErgDWpYXFRmH7zrUZjDTPFFkTtNaucod0ydVGPYceF17mkW2qXn+/jVEvlNJ
	1nOR6weBEEofGGyLNLojXduGhnumV0bcCxYncBZtJ/62HI048xj7bUhxSjuIV+njgJN+
	fHtA==
X-Received: by 10.194.61.193 with SMTP id s1mr7283610wjr.36.1400884350844;
	Fri, 23 May 2014 15:32:30 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host53-12-dynamic.21-79-r.retail.telecomitalia.it. [79.21.12.53])
	by mx.google.com with ESMTPSA id kr6sm5790072wjb.16.2014.05.23.15.32.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 May 2014 15:32:30 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
X-Google-Original-From: Andrea Adami <andrea.adami@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 May 2014 00:32:15 +0200
Message-Id: <1400884336-30326-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH 1/2 Resend] mininit: initial commit of v. 1.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 May 2014 22:58:14 -0000

From: Andrea Adami <andrea.adami@gmail.com>

See https://github.com/pcercuei/mininit

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/mininit/mininit_git.bb | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 recipes-bsp/mininit/mininit_git.bb

diff --git a/recipes-bsp/mininit/mininit_git.bb b/recipes-bsp/mininit/mininit_git.bb
new file mode 100644
index 0000000..a0439ae
--- /dev/null
+++ b/recipes-bsp/mininit/mininit_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "mininit for romfs/squashfs loop images"
+DESCRIPTION = "mininit is a linux-as-bootloader implementation based on losetup."
+HOMEPAGE = "https://github.com/pcercuei/mininit"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://init.c;md5=305bd83abb9a5aac95d48b5efbc11d58"
+SRCREV = "51eaefcaea52a5dbc1addd21ba93154aa9c97d66"
+PV = "1.1.0"
+
+SRC_URI = "git://github.com/pcercuei/mininit.git"
+SRC_URI[md5sum] = "62509644735a4e599e3ed0229f283faa"
+SRC_URI[sha256sum] = "4d747b16c33ac64a7923a179947d5581b4e309b73a3c89824056e9c4f0749f18"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+        oe_runmake mininit
+}
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 0755 mininit ${D}${bindir}/
+        install -d ${D}/dev
+        install -d ${D}/boot
+        install -d ${D}/root
+        install -d ${D}/proc
+        install -d ${D}/sys
+}
+
+FILES_${PN} += " ${bindir}/mininit /init /dev /boot /root /proc /sys"
+
+pkg_postinst_${PN} () {
+        ln -sf ${bindir}/mininit $D/init
+}
+
+BBCLASSEXTEND = "klibc"
+
+COMPATIBLE_MACHINE = "(akita|c7x0|collie|gcw0|h1940|h3600|hx4700|poodle|spitz|tosa)"
-- 
1.9.1


