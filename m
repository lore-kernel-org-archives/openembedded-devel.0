Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TdnZN-0001m1-16
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 20:45:17 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so11938332obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YJIjiuxwStl6Jh2J4Qd9ZTHuC1IpOsUMlOLRZ8DGVQE=;
	b=UaqNX3Zu9DYJ5Hnz5Ewc2pLw74pP5TDcVCpJ27e5wqaDIuYCbuRDPLONZRcOAfkTQ3
	YqhjoR08qOUeOq5dpCUd5xkLnpTP3/X9ofFMZu0rcMIxXglWmqlKYapGTShAEQEnUEuG
	fO12fyz+KbCvpLwgbogX1kBkkZ6/z9V6ea0jUVP/FPn2rlnJjbGNF+NiLG9NV544Uzt2
	bWiL+sSPjiuU7pd7GVR5PvmjbJafBCWdVqHqEdgodmeXEsFFiMXcRC1c5VF44DQmwmoL
	5jSRnanS758y1yDQzOQj5MNqwj3ARvT27xurypD0HF1w0oVk5xWiFk3FjrK0ZqqaTJaZ
	z3gg==
Received: by 10.182.8.10 with SMTP id n10mr5293748oba.19.1354131061928;
	Wed, 28 Nov 2012 11:31:01 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h2sm19267644obn.11.2012.11.28.11.30.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 11:31:01 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:30:37 -0200
Message-Id: <1354131040-9077-3-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 3/6] openbox: separate package for configuration files (openbox-config)
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
X-List-Received-Date: Wed, 28 Nov 2012 19:45:17 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index 3f6d767..a2c5a66 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://icculus.org/openbox/releases/openbox-${PV}.tar.gz"
 SRC_URI[md5sum] = "00441b53cf14c03566c8e82643544ff9"
 SRC_URI[sha256sum] = "6fa90016530b3aa6102e254079461977439398531fb23e7ec076ff2c140fea0a"
 
+PR = "1"
+
 inherit autotools gettext update-alternatives
 
 ALTERNATIVE_PATH = "${bindir}/openbox"
@@ -18,7 +20,7 @@ ALTERNATIVE_PRIORITY = "10"
 
 EXTRA_OECONF += "--with-plugins=none"
 
-PACKAGES =+ "${PN}-core ${PN}-lxde ${PN}-gnome"
+PACKAGES =+ "${PN}-core ${PN}-lxde ${PN}-gnome ${PN}-config"
 
 PACKAGES_DYNAMIC += "^${PN}-theme-.*"
 
@@ -28,7 +30,7 @@ python populate_packages_prepend() {
     do_split_packages(d, theme_dir, '(.*)', theme_name, '${PN} theme for %s', extra_depends='', allow_dirs=True)
 }
 
-RDEPENDS_${PN} += "${PN}-core"
+RDEPENDS_${PN} += "${PN}-core ${PN}-config"
 FILES_${PN}-core = "${bindir}/openbox ${libdir}/*${SOLIBS}"
 
 FILES_${PN}-lxde += "${datadir}/lxde/ \
@@ -37,3 +39,5 @@ FILES_${PN}-lxde += "${datadir}/lxde/ \
                      ${datadir}/icons"
 
 FILES_${PN}-gnome += "${datadir}/gnome/"
+
+FILES_${PN}-config += "${sysconfdir}"
-- 
1.7.2.5



