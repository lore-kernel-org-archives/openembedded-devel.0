Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id E72CE7C3C0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Mar 2019 14:18:56 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id f2so387465edy.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Mar 2019 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0AD6oPCxVRiJ8fP0p3Y3+QyPK8AgCbT/CbI6YCoFIhE=;
	b=p7Dtc6RGqYzUXFwUFhAHWApOJRnaXs6fOWmaYWbNUlbR6zpqHOpb8yWEAI+ne2ISa9
	qY73FnhOMll6XNja8RHKDXcL6HsJGBTnzKcHpkhgeIqGKLzg6xRytimbR45LQML+6saI
	JUKoK0MRfb1w7P66mlhrKmnUTzsW5/L5ZHhytBBvoWQLfXVK+PpL9D3kMrMGP8DzEd4+
	s0RfBNo2aeTeVK+YE3md66VPVRR/rj8YNOXvTiKpshSasmJ9/ufED5qvosfsXHjbG2xN
	tpftBrRLFHR8kfG8NsvZrm4OhgokDYcxoL1VoL5wN4QYoBATXelAJCvv6s2v3hCf5f8N
	7utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0AD6oPCxVRiJ8fP0p3Y3+QyPK8AgCbT/CbI6YCoFIhE=;
	b=dMbIRf+EWYfQIIOougjx29t9BaJqHE50P/Jp71TDl/v5Qemai6siJp6FlU6dAJnuTn
	24vmrcoG94TJ02hPTJ9LcnUTCFsJDsv5LNhdo1WrTYTqtL2RE8/SsoKM3sYN/YcgGk9e
	f4MCadhMTDqycbhqHIoePpwI7j1HG5Qi5gcaagFC0U0JEenxiXn/VT/iplDv5hbLCcS9
	rpKUUQaqL4Wkf3iFHyO6sJ48ibnwZa6n/g86BrwFS2YCAcUka1HAbtWZCd33j6vRoagQ
	9o2zfEQKJKXX9vkk4YIIebpc3bOjBapMXlC0XBcyXG/zec6in2XR37UUbvDUgw2KDTfS
	HVpA==
X-Gm-Message-State: APjAAAUZyj0foYZTESh48bkfhJLBl0R0UH2fl34E9Vx+lAAF4S2CXDYJ
	9DQQCpsiKl/gfV5zmldQRspXaohaL6o=
X-Google-Smtp-Source: APXvYqxf6YDftsyYmNOoElERPpX12ZS5ClV7uvM3pH7fc5MxC19fe0GpgO1HzVSD7edLMK7fIfn0Bw==
X-Received: by 2002:a17:906:3450:: with SMTP id
	d16mr15337696ejb.51.1552141136957; 
	Sat, 09 Mar 2019 06:18:56 -0800 (PST)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	t25sm1944764ejr.30.2019.03.09.06.18.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Mar 2019 06:18:56 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Mar 2019 15:17:26 +0100
Message-Id: <20190309141726.9429-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH v2] wireshark: upgrade to 3.0.0
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
X-List-Received-Date: Sat, 09 Mar 2019 14:18:57 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-Add-libm-to-link-for-fmod-API.patch  | 29 -------------------
 ...{wireshark_2.6.6.bb => wireshark_3.0.0.bb} | 21 +++-----------
 2 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.6.bb => wireshark_3.0.0.bb} (71%)

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
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
similarity index 71%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
index 4699f6798..dc55e3de0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
@@ -8,26 +8,20 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
-           file://0001-Add-libm-to-link-for-fmod-API.patch \
-          "
+SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "b30ba5b9b48ed2ff91c0ce357d33b46b"
-SRC_URI[sha256sum] = "487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863"
+SRC_URI[md5sum] = "258d62ac7434d126dc497303c8f7961b"
+SRC_URI[sha256sum] = "bc4f30f5b2e94f3a696fef9de44673cdf402db90aac5299966da647f708f009e"
 
 PE = "1"
 
-inherit cmake pkgconfig pythonnative perlnative upstream-version-is-even
+inherit cmake pkgconfig python3native perlnative upstream-version-is-even
 
 ARM_INSTRUCTION_SET = "arm"
 
-# Options: gtk+, gtk+3 and qt5
-GTK = "gtk+3"
-
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
-PACKAGECONFIG_append_class-target = " ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "", d)}"
 
 PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
 
@@ -36,8 +30,6 @@ PACKAGECONFIG[libpcap] = "-DENABLE_PCAP=ON,-DENABLE_PCAP=OFF -DENABLE_PCAP_NG_DE
 PACKAGECONFIG[libsmi] = "-DENABLE_SMI=ON,-DENABLE_SMI=OFF,libsmi"
 PACKAGECONFIG[libnl] = ",,libnl"
 PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
-PACKAGECONFIG[gtk+] = "-DENABLE_GTK=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK=OFF, gtk+"
-PACKAGECONFIG[gtk+3] = "-DENABLE_GTK3=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK3=OFF, gtk+3"
 PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
 PACKAGECONFIG[ssl] = ",,openssl"
 PACKAGECONFIG[krb5] = "-DENABLE_KRB5=ON,-DENABLE_KRB5=OFF, krb5"
@@ -79,16 +71,11 @@ do_install_append_class-target() {
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


