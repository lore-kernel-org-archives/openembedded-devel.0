Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1F855731C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:49:09 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v188so32764796wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AzICgnKdM2QqkYemLbO5B+/2h3isS4TQDFJLRAwJKg4=;
	b=iYjTIvtKVwQKu0Xt7jbEbtx8f8MCjN7wIeCbCCTPJueVn8Hf2OpO1BVtpTEYOIADTX
	VAnjim1qg17Kc5v16x7UP9Uj8imjTzaNa4flKfGoCHP2wmKrexgBf7UT2M6qxCZAUuXk
	hwvWdgFPCFQR2bkHk0QCLCjtbS13659ufCF9GPwIjqck+mpCv1fEvlccKI3wn12C+bYK
	M7MRFwx0uYddlohAQanNwZLgvqUU12JJ86eYP0Nfthzytz+Z0ZRwSm2+G8X6LfrzRQ/0
	1Ef0wZOks6PNvnGW5yizr/PB+UMLRNWilUIhhG+v5FAxDnKAoTsJRxtj46dWZHGsjEpd
	wsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AzICgnKdM2QqkYemLbO5B+/2h3isS4TQDFJLRAwJKg4=;
	b=b8sBuAnhVs/AYyv+m2m8XcN9vcfbCTELQpMZ6bwj+DHJHxzxtPLaKh2skBTxdKPVCL
	kdRLMOTzuW4/nqYde8CGEYCgyv29dWO+1nT+K9C55Y7sLcnD/xfJ6rUadOYOuGMim+jX
	GQufwBrsnx+fdNCUeVYW6omLAQxDr85Fg1LAcX924MS/RStMKu+xkfWBjw5ynCL/Jy2j
	7HhlBa70B4+QU1dbv6rDKVIbffEayCkgBIEL4xlV8IDhzhuNHQnq7FC4vMY+Te6BgqfK
	SvtebtMlw5xfDKDfuGnY3c2b0ZWd9KZynCnzI1Vqb94ke4DZozCbuOUJ8qJ+1rz7oDrm
	uU7Q==
X-Gm-Message-State: AOPr4FV1jzoSRGJv17Dhxp12Q1BNSWZAC7xAdnPXZumlQ553f72y0wD/77FPz3Njc5mqiTb8
X-Received: by 10.28.215.197 with SMTP id o188mr3091548wmg.14.1461354550285;
	Fri, 22 Apr 2016 12:49:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4875842wmf.8.2016.04.22.12.49.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:49:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 20:48:55 +0100
Message-Id: <1461354536-23240-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
References: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 7/8] meta-gnome: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Fri, 22 Apr 2016 19:49:10 -0000

base_contains() is a compatibility wrapper and may warn in the future, so
replace all instances with bb.utils.contains().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb        | 4 ++--
 meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb        | 2 +-
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb             | 2 +-
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb                | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 6fdb434..f8f5ddd 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -17,10 +17,10 @@ inherit autotools gnome gtk-doc pkgconfig gsettings
 
 SRC_URI += "file://egg-asn1x.patch"
 
-DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
+DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
 
-EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
+EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
 
 SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
 SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index 000db35..c6fb75b 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -24,6 +24,6 @@ do_configure_append() {
     done    
 }
 
-RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-ck-connector', '', d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-ck-connector', '', d)}"
 FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${datadir}/gnome ${libdir}/gnome-session/helpers"
 FILES_${PN}-dbg += "${libexecdir}/gnome-session/helpers/.debug"
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index f8ece37..393eb25 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -16,7 +16,7 @@ SRCREV = "0160f6725cfb872e017f3958f108792c3b882872"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio glib-2.0 libcanberra"
 PACKAGECONFIG[smartcard] = "--enable-smartcard-support,--disable-smartcard-support,nss"
 
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 48132ff..f9b02b1 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -31,7 +31,7 @@ SRC_URI[archive.md5sum] = "a05fab03eeef10a47dd156b758982f2e"
 SRC_URI[archive.sha256sum] = "62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa"
 GNOME_COMPRESS_TYPE="bz2"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[fam] = "--enable-fam,--disable-fam,gamin"
 
-- 
2.8.0.rc3


