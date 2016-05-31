Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0D69977175
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 19:36:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e3so275135wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 12:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4wtlC00T0ArObB90LSzQiMZnS0YPe/8UIcNl8KbsC2Q=;
	b=IZmW69joNpCbcObcKwbNBYcl+nyoAsmQY+CvN0p0UPw8J3C9qqQhyo+sjn8wh7f96q
	xVNzG3zpatJspawHp4/e+pmQ6Le08BnB3q6sDynxwIqJAbi5wzhrOnHWIh2DgogQCno1
	5ppxvEfdc1NdJ5dec27lIP2hbume2svwGdHC0w3wfLfjXBY95BIDOHOC0+Hmt63j41g0
	fu7ADWLndTZOKAAJYdqM6mNwK+Uq6l41t7k+aVr5IGD+WHQeKthvGPmmtHchRSry/4qW
	GQVaVfqSmDHbSxmFhztYyxVa74RH9HfYSqCE5veQdlXQ3xB0r3WhGOYlJyICVAemTxI1
	uGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4wtlC00T0ArObB90LSzQiMZnS0YPe/8UIcNl8KbsC2Q=;
	b=hdJBfLqNvsLgQSOxBwB+8z3BuumSrTzkhTuS6BH9agB5oMlYuA1rhS+5Hi3NaJ5IIU
	qQvX2Ku28G4ZGLs4SeswuASuRVrfcWSf9gXqaGQFeVZFTwYve2CxxAtSmiE+7+OrZg9O
	An4e3J4rdmhpAVhi20I1rVnDp/SvaEauB66Uy3PgMn8aX6Mvnptcxlc4/VozfrW09/8k
	R+cq7skzSbZhblrskFSaLP6g/Zmt0xOxO4pcAXgh4czLSXWZcXAqMyIP9abeFzYqiFiv
	cpdlJmA+5I8DugpFtbR1FwFuPaezkz1+GFtln0hjX/j/TX8/57IBizmgappnBvxfNRE0
	5JLQ==
X-Gm-Message-State: ALyK8tI3z638LV3lepXY6WFhSA8i6b32255aZdeGIomcCpxv+yeDIbOOMpdX+0Ytd0wBxw==
X-Received: by 10.28.26.145 with SMTP id a139mr18940666wma.55.1464723394412;
	Tue, 31 May 2016 12:36:34 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	x124sm30971462wmg.24.2016.05.31.12.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 May 2016 12:36:32 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2016 12:36:28 -0700
Message-Id: <1464723388-27569-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1464722120-6702-1-git-send-email-kergoth@gmail.com>
References: <1464722120-6702-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH v2] plymouth: allow disabling the dracut dep
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
X-List-Received-Date: Tue, 31 May 2016 19:36:36 -0000

From: Christopher Larson <chris_larson@mentor.com>

Add a 'initrd' PACKAGECONFIG to disable emission of the plymouth-initrd
package which includes initramfs files for use by dracut. Disabling this will
avoid the runtime dependency on dracut, which is useful if one doesn't need or
want dracut and doesn't want to pull in meta-initramfs.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index 9ca8502..de23dcd 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -24,29 +24,33 @@ EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-docum
                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
                 "
 
+PACKAGECONFIG ??= "pango initrd"
+PACKAGECONFIG_append_x86 = " drm"
+PACKAGECONFIG_append_x86-64 = " drm"
+
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
 PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
-
-PACKAGECONFIG ??= "pango"
+PACKAGECONFIG[initrd] = ",,,"
 
 LOGO ??= "${datadir}/plymouth/bizcom.png"
 
-PACKAGECONFIG_append_x86 = " drm"
-PACKAGECONFIG_append_x86-64 = " drm"
-
 inherit autotools pkgconfig systemd
 
-
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 644 ${B}/systemd-units/*.service ${D}${systemd_unitdir}/system
 	install -m 644 ${B}/systemd-units/systemd-ask-password-plymouth.path ${D}${systemd_unitdir}/system
 	# Remove /var/run from package as plymouth will populate it on startup
 	rm -fr "${D}${localstatedir}/run"
+
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
+		rm -rf "${D}${libexecdir}"
+	fi
 }
 
-PACKAGES =+ "${PN}-initrd ${PN}-set-default-theme"
+PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-initrd ', '', d)}"
+PACKAGES =+ "${PN}-set-default-theme"
 
 FILES_${PN}-initrd = "${libexecdir}/plymouth/*"
 FILES_${PN}-set-default-theme = "${sbindir}/plymouth-set-default-theme"
-- 
2.8.0


