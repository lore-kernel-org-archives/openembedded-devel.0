Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id F0EEE70200
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 20:21:35 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq14so8396475pab.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 13:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HxRAUMfSmP5ctA7m1cnoIPvq4IG+CGV44bH2eQPzf/Q=;
	b=GLWcbd9Fo7VUZQQNleAUeOZ4Taz/Uyv5HsQ3sMbZKqdgVBk+W1ipYU4ukRM8B8+Zy3
	9WpeYYrpKP5aWGWxekUzuuoNqxYtkXsG4rrE6sn7oiI0jSTUbwzjVeAtmdH9joJdSf62
	CNQI5v3kksB9u0ywMKDwmSLCImri5j2eE+0iTgcpB78Hq7giN5DmIxuJhmjNAsXLv1bp
	1c2pBp/t1s97Bz0UcORoPCnZ9BLn1WwyCPTKk7YBjqaJpmfbHvlGLg9GksA/SST0eyCf
	0/9WfQNoj37dgOW1OXBk0fChGE1VgDDYkhOWshtlFzwm5jndqTSPTDMK8HsA3OGwzVJ/
	hQrw==
X-Gm-Message-State: ALoCoQmbYItgAL9V7AFYC8PU/c1uSLF8vjA5X8llXarDeItvNHixHlKEbRPTthQGBKAnW/gmhmXJ
X-Received: by 10.68.93.65 with SMTP id cs1mr9575834pbb.52.1405887696681;
	Sun, 20 Jul 2014 13:21:36 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id kh7sm49451354pad.8.2014.07.20.13.21.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 20 Jul 2014 13:21:35 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 13:21:25 -0700
Message-Id: <1405887685-12673-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] v2] wireshark: Add recipe 1.12.0-rc2
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
X-List-Received-Date: Sun, 20 Jul 2014 20:21:38 -0000

Inital wireshark support on gtk+
Added gtk3.
Cleaned up PACKAGECONFIG options
README with additional info

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-networking/recipes-support/wireshark/README   | 37 +++++++++++++++++++
 .../wireshark/wireshark_1.12.0-rc2.bb              | 42 ++++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/README
 create mode 100644 meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb

diff --git a/meta-networking/recipes-support/wireshark/README b/meta-networking/recipes-support/wireshark/README
new file mode 100644
index 0000000..0e0c526
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/README
@@ -0,0 +1,37 @@
+#
+Wireshark - Notes
+
+URL: http://www.wireshark.org/
+User Guide: http://www.wireshark.org/docs/wsug_html_chunked/
+Secruity advisories: http://www.wireshark.org/security/
+
+Wireshark is slowly moving away from gtk and towards QT as their graphical stack.
+Currently gtk is supported with this release and I plan on integrating QT. 
+
+
+
+Adding the wireshark to your build
+========================================
+
+via local.conf
+IMAGE_INSTALL_append = " wireshark"
+
+Adding the wireshark to your graphical build
+========================================
+via local.conf
+EXTRA_IMAGE_FEATURES += "x11-base"
+
+or use the "core-image-x11"
+
+
+Maintenance
+-----------
+
+Send patches, comments or questions to openembedded-devel@lists.openembedded.org
+
+When sending single patches, please using something like:
+'git send-email -1 --to  openembedded-devel@lists.openembedded.org --cc akuster@mvista.com --subject-prefix=meta-security][PATCH'
+
+Maintainer:    Armin Kuster <akuster@mvista.com>
+
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
new file mode 100644
index 0000000..6860419
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "wireshark - a popular network protocol analyzer"
+HOMEPAGE = "http://www.wireshark.org"
+SECTION = "network"
+LICENSE = "GPL-2.0"
+
+DEPENDS = "perl-native libpcap pcre expat glib-2.0 libsmi"
+
+inherit autotools
+
+ARM_INSTRUCTION_SET = "arm"
+
+# Works with either gtk+ or gtk3.
+WHICH_GTK = "gtk3"
+
+PACKAGECONFIG ??= "gnutls gcrypt"
+PACKAGECONFIG += " ${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "${WHICH_GTK}  graphics", "", d)}"
+
+PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
+
+PACKAGECONFIG[gtk2] = "--with-gtk2=yes, --with-gtk2=no, gtk+"
+PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
+PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
+PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
+PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
+
+EXTRA_OECONF = "--with-qt=no --enable-usr-local=no -enable-tshark"
+
+LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
+SRC_URI = "http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2 "
+    
+SRC_URI[md5sum] = "dc1149073066a29f91116c168558262e"
+SRC_URI[sha256sum]= "31009bb450126e9b12808267419f31016d14e6fde7b5e39c85ad37459908cffb"
+
+do_configure_prepend() {
+    # force to use fallback 
+    sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
+}
+
+ALLOW_EMPTY_${PN} = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
-- 
1.9.1


