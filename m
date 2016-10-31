Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E33571AAB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c17so20256438wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=A/1jLLWHwCcp41XyrarTlswk3G/4yNTynkl82WMWyG8=;
	b=c79hJGVojNvoPAHW524C3/bdTYi7yHO9xugbqnvW6TRhtV1TzDxhh7mnKUQO3lByf8
	1759Owaa3An52fM1f51JN+lMMCkCot8hb9rUWh7rAQoDNHh8FjQfHI18y6Z8qKeXPWLb
	tJ7hiyIENwS8D44Q9cs31GBlLhYPJUHK/sG44vJGRdP83fiag/MZuylZdGDLLPtPY851
	tgsGDFEQKVP3/tXn3hK8ldZbHqMPOeWEqzLucsYG9EtVFwypKXzcZcwXI21obCVquvx7
	jnu5XG1ogAhjrLLS3G/V96/NVE4IkaShiIZSz0vbD4SH64CvX/GOeipeXX2YAdn/+5F6
	guGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A/1jLLWHwCcp41XyrarTlswk3G/4yNTynkl82WMWyG8=;
	b=XV5BZ6TvqB+XvEIn+5cf/pJZ5/opPvjUrO7DGtANxbMrsQwLoSMOsn3YDzeQ+fY7iW
	5LT1cOVPEbBbPEOhVRizVZOrssIBHkLhnTr987Srj86xdZ9sIBx9oQtQVxDSF1W+pUti
	EPjRsV9fZoM0/1KoeYBUawKucrEkyCC2LheBFTFdCMo3ea/ZNo0tcnNoss9g+UtXmRLI
	r2ozjA035jdc5awPHtEqfGL8sRX1aRAwRaSDb5aS1Tx9b5l6wg58+T7B4Id2JdGAgjTN
	MwWZVyoA2xcN/u1qHxWlEt9n7MJz/FEiCe5s/rtkKfwcy8gt47ytLbfQJI0m0LeYk9uj
	dpnA==
X-Gm-Message-State: ABUngvevsbF4By5bGnjyK7khFJ63obW+ZrjrBU/UHilanMduYe66E1uafsFwqO65RX9etg==
X-Received: by 10.194.56.69 with SMTP id y5mr23936750wjp.4.1477951867655;
	Mon, 31 Oct 2016 15:11:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:39 +0100
Message-Id: <1477951849-32149-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] gnome-menus3: unblacklist and cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Oct 2016 22:11:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* old gnome-menus is broken so there is no conflict
* we should prefer newer version
* menulibre (part of this series) requires gnome-menus3
* gnome-menus3-python was empty

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb | 9 +--------
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb  | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
index bf55197..544bbc1 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
@@ -4,10 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
-# e.g. sysroots/qemux86-64/usr/share/desktop-directories/X-GNOME-Other.directory
-
-DEPENDS = "python libxml2 gconf popt gtk+3"
+DEPENDS = "python libxml2 gconf popt gtk+3 intltool-native"
 
 inherit gnomebase pkgconfig python-dir pythonnative gobject-introspection
 
@@ -19,8 +16,4 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "6db025e79e2b69f39fc7aa0753f43081"
 SRC_URI[sha256sum] = "46950aba274c1ad58234374fa9b235258650737307f3bc396af48eb983668a71"
 
-PACKAGES += "${PN}-python"
 FILES_${PN} += "${datadir}/desktop-directories/"
-FILES_${PN}-python = "${libdir}/python*"
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
-                    ${PYTHON_SITEPACKAGES_DIR}/.debug"
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index 4189518..2f55141 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -27,4 +27,4 @@ FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
                     ${PYTHON_SITEPACKAGES_DIR}/.debug"
 
 # http://errors.yoctoproject.org/Errors/Details/81001/
-PNBLACKLIST[gnome-menus] ?= "BROKEN: fails to build because of python"
+PNBLACKLIST[gnome-menus] ?= "BROKEN: fails to build because of python + conflicts with gnome-menu3"
-- 
2.5.5


