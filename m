Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tyl30-0002cQ-BS
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 16:18:31 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so207443dak.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 07:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=8xTWL7StcNl2Q7aRoywzbL8t8rVZPGaXGhnjolwjwC0=;
	b=JH/MQWepAosfbLxlwqeAhEMLLwgdQZUvw+oF87nfkcZvIP/gRdGgYQESQ15CsorjzR
	oNrinOKbehovxYS8ytHuuahSMieI/k0dqi0AdhAPTzDEkEZhJAC6+37qEfq0Am8is46J
	vAtjTuaYt/FFe+ob5MhGg9SaQYckxyfNEEs9KDIG837L1B5Hbj3+yEWUjO9jt+bcv1Fp
	/m2+UTIhgwfVdt0dKB2EOAz4C+d0GOHAxxOml6QaxAYaqpACJ7cuqxqFGrP0RCJDik9p
	HZeFPlR3s2AEq23iZnSpvhuAEGotV4qCXMDITvGmYa67im70FvqU5h2fp2m0+0yzbPtv
	AjoA==
X-Received: by 10.68.219.71 with SMTP id pm7mr14720963pbc.82.1359126175225;
	Fri, 25 Jan 2013 07:02:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ho4sm805123pbc.54.2013.01.25.07.02.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 07:02:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 16:02:47 +0100
Message-Id: <1359126167-30599-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH][meta-systemd] meta-systemd: remove wpa-supplicant bbappend
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
X-List-Received-Date: Fri, 25 Jan 2013 15:18:32 -0000

* oe-core now has wpa-supplicant 2.0, but also installs wpa_supplicant.service to PN
* feel free to add new bbappend with only systemd inherit and updated SYSTEMD_PACKAGES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant_2.0.bbappend            | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
deleted file mode 100644
index 7a3e906..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "wpa_supplicant.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-do_install_append () {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
-}
-
-# systemd.bbclass does not catch all multiple-instance-service-files
-FILES_${PN}-systemd += "${systemd_unitdir}/system/"
-- 
1.8.1.1



