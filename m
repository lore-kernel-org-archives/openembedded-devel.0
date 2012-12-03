Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfYis-0006mv-Pz
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 17:18:22 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so2539248obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 08:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=L5RJSY8oOPVvdkW/gQ8edV8YiyWziEgn4VaIf0jKQNU=;
	b=reEBTa4Eqv1ffRgbgGmHwlcLlwSgRW0oeCt/D8JzFd2poMgBccGcmSEQVq4GyN5xIH
	eNoJAKfl/NH3Olj27BWM/toIVbKfaGCKdXHVVDmLlZsLI8L0/Oqr1ea7jfTM0bhSn7U6
	MiYBmuL/11eDrG9UwAEf1nJZYN51+LJhw0Z40AtjD8IdpE/qyyl+OtxiHEFLQFofoWoK
	McVu2BqWxVWDGROZ33cR9bdCoHe5vxyAMLTz/q/lAESBGPPXgVHWGF/FHY7pyxtyOJS8
	xVAM/gs3IdSfMU7f2adegGQ2fr63Y9iHNkWQAZr0KWN85aUrEgZUC/Aaj7rgxz7tyRGL
	MWpg==
Received: by 10.60.24.161 with SMTP id v1mr8351151oef.115.1354550643487;
	Mon, 03 Dec 2012 08:04:03 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.69])
	by mx.google.com with ESMTPS id el2sm13739774obc.9.2012.12.03.08.04.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 08:04:02 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 14:03:23 -0200
Message-Id: <1354550606-10377-3-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
References: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCHv2 3/6] openbox: separate package for configuration files (openbox-config)
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
X-List-Received-Date: Mon, 03 Dec 2012 16:18:23 -0000

Change-Id: I528392100854fb73c2a14973fd1bfa9c94e836a7
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



