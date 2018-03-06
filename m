Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7B878A02
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 22:58:50 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id l200so123671ywb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 14:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u0pQA8i+wBa74ffQLqhFhefiXTZORN8RmAN0UHW/Xbo=;
	b=Lqe+VJRuRaGcDMiJZaqRVM8UgkYsXT643PbojP7ldMIbj6xk12jM/QTbDk2y3BRZn2
	CRmFVGDvZavP+9NqysLtm++/YNQk8XSmj7J03quXEbKhLvD1eUpaASczJrrEJakVeSTL
	rdBbTh0L6SsZYgY4mqskD9176eR3V/rSWZ0IyNG9IRQs8xE2G7uIiDq5M7eeDUzt+YL3
	s4Lw0UdjJfNAfuSP687xPkcNy1ButpYO3mJAqWzBCIx+VIrwFKuAHrbnlL5JfGhmfPKH
	37071MlS+OQeim95+IeRU5h+n1v4L2n1E50Vt95Q/7+DJEj+Ne5cPXK5n8UqEIwOx0if
	6WDw==
X-Gm-Message-State: AElRT7H40QTJLRqTWhPEtWIZ9V6zO41kVLZw0dwWEjQCEcD7CS3qjO8v
	BBegH5LblsEbTrzZM2Xek+2z
X-Google-Smtp-Source: AG47ELsBtozPJNyVC10eTw8UiXOktM2c4lNL6TinDx0AXuruoEblp9j0pj7UhY2fpES8AYNbLbNAnA==
X-Received: by 10.129.226.12 with SMTP id p12mr2024049ywl.324.1520377131656;
	Tue, 06 Mar 2018 14:58:51 -0800 (PST)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	l27sm5089848ywa.36.2018.03.06.14.58.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 14:58:50 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 17:58:47 -0500
Message-Id: <1520377127-21639-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-oe][PATCH] openbox: Improve handling of openbox-session / gnome-openbox-session
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
X-List-Received-Date: Tue, 06 Mar 2018 22:58:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without providing an alternative for x-session-manager we cannot drop
openbox into the standard x11 images and have openbox take over as the
session manager.  Add openbox-session to ${PN}-core as well as an
ALTERNATIVE line for it.  Set the priority based on how other session
managers do this.  As we also have openbox-gnome-session move this from
the full package and in to ${PN}-gnome.

Cc: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index b354ae7a1b74..c35a0c72385b 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -16,9 +16,11 @@ inherit autotools gettext update-alternatives pkgconfig distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-ALTERNATIVE_${PN}-core = "x-window-manager"
+ALTERNATIVE_${PN}-core = "x-window-manager x-session-manager"
 ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/openbox"
 ALTERNATIVE_PRIORITY[x-window-manager] = "10"
+ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/openbox-session"
+ALTERNATIVE_PRIORITY[x-session-manager] = "100"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[imlib2] = "--enable-imlib2,--disable-imlib2,imlib2"
@@ -38,7 +40,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks"
-FILES_${PN}-core = "${bindir}/openbox ${libdir}/*${SOLIBS}"
+FILES_${PN}-core = "${bindir}/openbox ${bindir}/openbox-session ${libdir}/*${SOLIBS}"
 
 FILES_${PN}-lxde += "${datadir}/lxde/ \
                      ${datadir}/lxpanel \
@@ -46,6 +48,7 @@ FILES_${PN}-lxde += "${datadir}/lxde/ \
                      ${datadir}/icons"
 
 FILES_${PN}-gnome += " \
+    ${bindir}/openbox-gnome-session \
     ${datadir}/gnome \
     ${datadir}/gnome-session \
 "
-- 
2.7.4


