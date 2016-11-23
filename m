Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 74E0E71A89
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:13:47 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f82so25663726wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 06:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jdillraFHa4FxysjiBC439O7/wAr7XVp8gOY2hlbh3c=;
	b=iNoEGfv+5cyMAuIOs2Rf+9f1rDa2MITAaInQZFRXxv6VXBxC7lXPaa9O5tCWccV7j0
	ZNdSaIf90C59jE242aqcmdcClS9ewbqmGG8szW+jIBWfZRlWuigMMMDPXLsslt2oy0MU
	6DQYm+LW0pIiQu993LGNYfdpT5rlXweUMgB1UVznbR10VxGQJ8pubIuo1gn86dTX4nJL
	CqTnJRWfxGfZ2FBN/4tGYdb4Hhpy/JF8xyNnaKQiZLYYPgA0MI86Uzl1UR7IBTLkRZdF
	VddpTWD2rGaSODyvKrY8gb7TlmCO4/HOuNdpiQRbuj8GIfA2OEUDtOg+WzpsU3V8m9ST
	7ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jdillraFHa4FxysjiBC439O7/wAr7XVp8gOY2hlbh3c=;
	b=aSNKVUAEoyP14LyOeoUpdGEu46UdcyelfcLxfEoMop4RSNzie1Q3iiB3jKIHlvENLl
	6DurB0SqDvSVQJFxcSGRf9rE2Mw1nWxyCKZ3spIRMN5khMRX4FOO68dy03S6wxFGYGVL
	qBKggA4KvGiUtSeIQerdGtd3NbErukiaXQzpRzzGPx5WqsMX7zSw4z4xr9YKoVXmCpoQ
	QbfPPsiKJxiKNeB0ArDuTEokhiH9EKNaP2gFkYY0zNycSomUi0teqOTxfj+nKRwAHnLe
	nfqNoUeWXd5UqYETrpwhMLTGAFPE0tAMZCzcRgL/Q5CsHEokGB2CNWHqyWquXU6PvgNR
	K7jA==
X-Gm-Message-State: AKaTC03wEPGgs63ZNtNwnmbTIO6tihLuGXgxeAI0ZrUXepruP4/G9gxKE/74xwMJQfwCr3L8
X-Received: by 10.28.94.76 with SMTP id s73mr7997725wmb.107.1479910428728;
	Wed, 23 Nov 2016 06:13:48 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	cl10sm36665099wjb.4.2016.11.23.06.13.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Nov 2016 06:13:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 14:13:39 +0000
Message-Id: <1479910421-28750-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1479910421-28750-1-git-send-email-ross.burton@intel.com>
References: <1479910421-28750-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] meta-oe: add explicit dependencies on gnome-common
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
X-List-Received-Date: Wed, 23 Nov 2016 14:13:48 -0000

gnome-common is deprecated and gnomebase.bbclass will soon stop depending on it,
so add gnome-common to DEPENDS for the recipes that still use it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb | 3 +--
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb          | 2 +-
 meta-oe/recipes-gnome/vte9/vte9.inc                        | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
index 77416d4..e490ae5 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
@@ -8,7 +8,7 @@ inherit autotools pkgconfig gnomebase distutils-base gobject-introspection
 PYTHON_BASEVERSION = "2.7"
 PYTHON_PN = "python"
 
-DEPENDS += "python glib-2.0"
+DEPENDS += "gnome-common-native python glib-2.0"
 
 SRCNAME="pygobject"
 SRC_URI = " \
@@ -31,4 +31,3 @@ do_install_append() {
     # Remove files that clash with python3-pygobject; their content is same
     rm ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig/pygobject-3.0.pc
 }
-
diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 772babf..1d5ae95 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -20,6 +20,6 @@ LIC_FILES_CHKSUM = "\
 file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 EXTRA_OECONF = " --disable-static --disable-rebuilds"
-DEPENDS += "gtk+ glib-2.0 ruby-native intltool-native"
+DEPENDS += "gtk+ glib-2.0 ruby-native intltool-native gnome-common-native"
 
 inherit autotools pkgconfig gettext
diff --git a/meta-oe/recipes-gnome/vte9/vte9.inc b/meta-oe/recipes-gnome/vte9/vte9.inc
index 6a5c63c..206c430 100644
--- a/meta-oe/recipes-gnome/vte9/vte9.inc
+++ b/meta-oe/recipes-gnome/vte9/vte9.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "LGPLv2.0"
-DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
+DEPENDS = " glib-2.0 gtk+ intltool-native gnome-common-native ncurses"
 RDEPENDS_libvte = "vte-termcap"
 
 # help gnomebase get the SRC_URI correct
@@ -16,4 +16,3 @@ EXTRA_OECONF = "--disable-python"
 PACKAGES =+ "libvte9 vte9-termcap"
 FILES_libvte9 = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
 FILES_vte9-termcap = "${datadir}/vte/termcap-0.0"
-
-- 
2.8.1


