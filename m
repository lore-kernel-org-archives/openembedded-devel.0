Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id D97FC701A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 04:25:44 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id y13so2366324pdi.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3xVcNx68xEc6u9aqe/SfVa5ZLGYLOmmi2BP+sZMsRRI=;
	b=BgJvjZdiyBGmBKgITyT5gQhoKVOrB6JMLT/eG11SHCts0DdNl5qQksBSclgirVs3QS
	Qy+YMS79TSLKBoMKEV98mV35IpxmINnA28K3IG6ADt603iJAblyAsEbnfRD7nLLhyjsh
	aktTZN+H0Z4EjdWjqkpzSvyb5wPrCRuOf4s5/yTFcY3YNAVdwRWXEZqGkB1rbQVlEHli
	soo5eJwhgX6Z2ceIDcI1pV46dQw7yIcLHE45yUxgdYHkPGgkSWErlKz6mvvm4BuxVdkr
	JcDDWqDyUyw9p7b10cJL6cJ5MsfjXvhOtCJJJ+6063BDYn7+QKreq8kPuMJFPGDbvUH+
	gJbQ==
X-Gm-Message-State: ALoCoQl2fLs+cz6Zr8Ljiu6ni/poFrerAJW2GuYLCDWf4q0NJOvz6ArTZeyKirnZn7wa9cS0tuP6
X-Received: by 10.66.102.102 with SMTP id fn6mr34526468pab.6.1405571145823;
	Wed, 16 Jul 2014 21:25:45 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ec10sm5129698pad.33.2014.07.16.21.25.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Jul 2014 21:25:44 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jul 2014 21:25:38 -0700
Message-Id: <1405571138-20939-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] wireshark: Add recipe 1.12.0-rc2
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
X-List-Received-Date: Thu, 17 Jul 2014 04:25:52 -0000

Inital wireshark support on gtk
README with additional info

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-networking/recipes-support/wireshark/README   | 37 ++++++++++++++++++++++
 .../wireshark/wireshark_1.12.0-rc2.bb              | 37 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)
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
index 0000000..156a067
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
@@ -0,0 +1,37 @@
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
+PACKAGECONFIG ??= "gnutls gcrypt"
+PACKAGECONFIG += " ${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "gtk2 graphics", "", d)}"
+PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
+
+PACKAGECONFIG[gtk2] = "--with-gtk2=yes,--with-gtk2=no, gtk+"
+PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no, gnutls"
+PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes,--with-gcrypt=no, libgcrypt"
+
+EXTRA_OECONF = "--with-gtk3=no --with-qt=no --enable-usr-local=no -enable-tshark"
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


