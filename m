Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 444137E41B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:22 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 15so4497657wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bJ0AjVyOlkSnX3rU7TAdP2qgH43Qh9KTi8dsmSdbXa4=;
	b=CoSaHf6qCY/rMJCmc1kP9cLEfWE95FT+MlG3w7908YfPxpLmcl/GrABCE9wEnMg9ax
	aJmsntflPEcu5gDHkl7CWw6yY/jyRYAjGCMPPXHs2Y/DEVSgzgS2WvwdAJKcKxxTk5g+
	/T6O5Y351wQSN3QnfCq6Cec3q0c+tJY2RgsKZ2lejKR6TrABDAViRFHbSDsdFEClOtfF
	wlePEPqmUmmJ6+oDeNS6lSbe8aEP9DR6ioCx+h+gEkJULbtoGjie9Fix6z/hLI//HWRr
	WFfu5jwn1lrSrWPT2/JvYS3UHpT7If2FVapF2FXjrCnUMZvzYTPPLntsKnRNqx4pHJ4x
	f4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bJ0AjVyOlkSnX3rU7TAdP2qgH43Qh9KTi8dsmSdbXa4=;
	b=QJcBTTJB8QZgDm1iQ8lJ1T1DN4Q7/OWoYWte8Ep+fLNUXwyA0pSnU8U6tTkApdXC7r
	fSOAybsTjNBACfHXzxITLOXDxgvciRquPKsTcW0EvvpMgLIb75Z+SpppiY49qR1pMOFk
	ZaQm+0MVdERgx/xm/FCTSQcgprWmKShwqktcrI1CL3XbXPx3MT5jIjz+/Q2EOirfV+Eu
	WDO6UdoeHtoHKVSyUtC3erbeCFF+a3vK2GwNjo1Hkb7JyneEk7LcXbDfNjN1dkkKmKwa
	85mJ8esN0O0lHHl8bBWtgsqOx2Ue5nOMw5splXMzFSp3OpmBax5tOq6dlOil/Gna4flo
	Ebbw==
X-Gm-Message-State: APjAAAW3mBCJCCA2SsfufSglRrf5lazK4oiah6gRK2asUOC7clruU5JJ
	PR4Z52qpuZNGo8Vhtfda/VbIFlLfnkQ=
X-Google-Smtp-Source: APXvYqyzXNWsupIT87t0TJ9G+sngH22sIXpgDTCXr3xihJecE8g72PHWQkoesl0DR2PVgr3azCGamw==
X-Received: by 2002:a05:600c:22cc:: with SMTP id
	12mr2960118wmg.141.1558594162850; 
	Wed, 22 May 2019 23:49:22 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:35 +0200
Message-Id: <20190523064859.24336-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/41] network-manager-applet: cleanup
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
X-List-Received-Date: Thu, 23 May 2019 06:49:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* remove unnecessary dependencies gconf/intltool-native
* gobject-introspection builds fine for musl

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../network-manager-applet_1.8.20.bb                | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
index 45f552a88..d8246e96c 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
@@ -2,10 +2,7 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
-           gconf iso-codes nss \
-           intltool-native \
-"
+DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib iso-codes nss"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit distro_features_check gnomebase gsettings gtk-doc gtk-icon-cache gobject-introspection
@@ -23,9 +20,6 @@ PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-# gobject-introspection related
-GI_DATA_ENABLED_libc-musl = "False"
-
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/src/libnma/.libs:${B}/src/libnm-gtk/.libs"
 }
@@ -38,8 +32,3 @@ FILES_${PN} += " \
     ${datadir}/libnma/wifi.ui \
     ${datadir}/metainfo \
 "
-
-# musl builds generate gir files which otherwise go un-packaged
-FILES_${PN}-dev += " \
-    ${datadir}/gir-1.0 \
-"
-- 
2.20.1


