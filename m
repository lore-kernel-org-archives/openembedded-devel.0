Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4D86011A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Mar 2019 23:47:28 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v16so2422645ljg.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Mar 2019 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=24P15C7CRsjE8k1umY0wDRJmtYhb7ZB4NYhn4u2j54Y=;
	b=UMiYl1IdDfLpEVwVt7S/JOHmiLiVdaPnJEhlqaErGC42HcOcMWLaTXycF+NjJoSwB1
	TFbX3uEnKy9BQkXxOL1Rm+/rVno6Q8kFh1oBKJF723MMWQaSYmj1QuTlvtgv2EshABTp
	0+lV//9aN012ThWi5PQXaMW53CMJMbWvqkBmx635hxmKa6MkJKZsaCrImVLlemucAmKz
	aEjdJXDUpc51nv2aVxXfqzO9fW+xBOIadT9f3p1j/tavt+awpQ0UUr3HnTg2xSCX9Tqr
	zxpOWQvZuJWVhCJYkZR6EfQ21EOhO7h9Hqz35WyaCNhszW+iuIrgcFuqyrQdcBAOTyl+
	DKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=24P15C7CRsjE8k1umY0wDRJmtYhb7ZB4NYhn4u2j54Y=;
	b=A2EPNlJz4AvH8MU7N6c5D0wn97w9tY8n3fmdt9+iZVntjFBpdxKFwGiGCgi1zK176N
	riCahxa+r6J92ziupJNn+skgko4exOBcXecpWsL9h2jyly/edlLGj226KeesaafrRM7O
	UasbRZmhZDEm+lqrT/qVJ4qkEJQxRwFfgmRQaIopEeJjJ0jx1rBn8VOVHaI5XBfUlj+j
	tWxzX+AwVxLpgmDDI33rAFnEI5ARbNYjzHoaz/2BBGxcAQdFq1ekRTaYmv6ppRL/GGpt
	ddszpmZ0abH0tzi3PovHEs61mbAe2YUyAWfegNBx4zmVqpOv9GFHW4QljjyKhD/DpS5I
	GGaA==
X-Gm-Message-State: APjAAAVgZN8f6Y0qa0yTlXytM6TywggbJAREFPywkSJgte2xkYkvF0el
	itYPKpUpnwc3QqXGRtc0zI1prxyXzsc=
X-Google-Smtp-Source: APXvYqyG+fVqIgtnfYThaStzgr/WKIEIOHIfvlIYx7KjNmpNA6bho0qdxdkhtQlQr16Bb3Pnl8CW+A==
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr15300886ljj.30.1552261648130; 
	Sun, 10 Mar 2019 16:47:28 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d77sm553241lfe.47.2019.03.10.16.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 16:47:27 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Mar 2019 00:47:22 +0100
Message-Id: <20190310234722.19640-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH v3] wireshark: upgrade to 3.0.0
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
X-List-Received-Date: Sun, 10 Mar 2019 23:47:28 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-Add-libm-to-link-for-fmod-API.patch  | 29 -------------------
 .../wireshark/wireshark_3.0.0.bb              | 13 +--------
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch

diff --git a/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch b/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
deleted file mode 100644
index e65ef9b10..000000000
--- a/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1a6a5d2bcb1adec9ba138c2ebee7bbc994620aff Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Jun 2018 23:23:44 -0700
-Subject: [PATCH] Add libm to link for fmod() API
-
-fixes
-ld: CMakeFiles/tshark.dir/ui/cli/tap-comparestat.c.o: undefined reference to symbol 'fmod@@GLIBC_2.2.5'
-| /mnt/a/oe/build/tmp/work/core2-64-bec-linux/wireshark/1_2.6.1-r0/recipe-sysroot/lib/libm.so.6: error adding symbols: DSO missing from command line
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7950e85..acee140 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2494,6 +2494,7 @@ if(BUILD_tshark)
- 		${LIBEPAN_LIBS}
- 		${APPLE_CORE_FOUNDATION_LIBRARY}
- 		${APPLE_SYSTEM_CONFIGURATION_LIBRARY}
-+		m
- 	)
- 	set(tshark_FILES
- 		capture_opts.c
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
index d940a4567..dc55e3de0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native git"
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native"
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
@@ -21,11 +21,7 @@ inherit cmake pkgconfig python3native perlnative upstream-version-is-even
 
 ARM_INSTRUCTION_SET = "arm"
 
-# Options: gtk+, gtk+3 and qt5
-GTK = "gtk+3"
-
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
-PACKAGECONFIG_append_class-target = " ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "", d)}"
 
 PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
 
@@ -34,8 +30,6 @@ PACKAGECONFIG[libpcap] = "-DENABLE_PCAP=ON,-DENABLE_PCAP=OFF -DENABLE_PCAP_NG_DE
 PACKAGECONFIG[libsmi] = "-DENABLE_SMI=ON,-DENABLE_SMI=OFF,libsmi"
 PACKAGECONFIG[libnl] = ",,libnl"
 PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
-PACKAGECONFIG[gtk+] = "-DENABLE_GTK=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK=OFF, gtk+"
-PACKAGECONFIG[gtk+3] = "-DENABLE_GTK3=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK3=OFF, gtk+3"
 PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
 PACKAGECONFIG[ssl] = ",,openssl"
 PACKAGECONFIG[krb5] = "-DENABLE_KRB5=ON,-DENABLE_KRB5=OFF, krb5"
@@ -77,16 +71,11 @@ do_install_append_class-target() {
 }
 
 PACKAGE_BEFORE_PN += "tshark"
-PACKAGE_BEFORE_PN += "${PN}-gtk"
 
 FILES_tshark = "${bindir}/tshark ${mandir}/man1/tshark.*"
-FILES_${PN}-gtk = "${bindir}/wireshark-gtk ${datadir}/icons ${datadir}/appdata \
-                   ${datadir}/applications ${datadir}/wireshark ${datadir}/mime \
-                   ${mandir}/man1/wireshark.* "
 
 FILES_${PN} += "${datadir}*"
 
 RDEPENDS_tshark = "wireshark"
-RDEPENDS_${PN}-gtk = "${@bb.utils.contains("DISTRO_FEATURES", "x11", "${GTK}", "", d)} wireshark"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


