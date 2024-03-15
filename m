Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94693C54E66
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 05:37:38 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.13959.1710481053296387882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 22:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=adYxqUj2;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5684073ab38so3149673a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710481052; x=1711085852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jSHVrPddBaa1Bt3sEWmPdEOpMEb6IlipAH+Ghvok/s=;
        b=adYxqUj2UDnDIzA+Ngbg4RXvU2M6qZImqnquYZy7tRzAhqOfW1TJBThHDjc1RqPgCj
         DYxxJl5HxGhRHQRwu342YJsDibgc8tL2S3XbF6+RiuJ74Sckadj/n1iHQiGYiNuQS59e
         nSqKG+SsCrDJbozp8r0F2p0xyeXouGFRP+YMO3Wkmt2V3ExUPF49kwB5aMNS3R+gHcWn
         Zl2Uh+WUXvYLlw2RC24q4T8tCTtPdbLloEDytz1M+ZZNCZw33gcm7X//Sxll3/sMoWGE
         xfdiZ+ADXUJRBIdykZ0KCodKTaUzJBgXZduovhta1OObmyA5q/0H25SntNDTGSwRhhnX
         JZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710481052; x=1711085852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jSHVrPddBaa1Bt3sEWmPdEOpMEb6IlipAH+Ghvok/s=;
        b=rBDyx4pfhDORq3k8tMp+IJcwOyuviY3jzwciSzRgqnOBC9X07h2sNLjBfvfOcI26Iv
         ePuVHULksd2ipZ+eGAsq8rvt6gMq9pv5oTNgTNxxHAfnoJI643SCO29moPtMw06hEQ7e
         SrsLbQ6Z+FoUvBywigmHviShJCGHL6CacPsJqIpEk4xcQyjz63z62YkqUHIVifVz6/hv
         NQ/Y0nJmEoJ/hBDDgI0/gK6OsS82EakLC/6W8Fcdzwl8MCBaAnusY7ECurRH5Cn9bPBd
         oH+qshiNVgEyrwwyfqOPHEAM++WNm7W2eYuibE9GbfKEbclMvavCXKJIXW3eFZ6catSv
         H6Ug==
X-Gm-Message-State: AOJu0Ywe2g42f/oHBxsXxexnp7zi8Kqn0geS2My+aiuc35lMNMPgJTPU
	dQJBHRdVAL8wvhx5xb+2qkGC2PMXilNh8MRpC161YGZCE2DflvMxyd5gODxJ
X-Google-Smtp-Source: AGHT+IG1ut8kYfwRZBwyBX1VhWTpg4bcMANWPl7wWUlXzDBcok+wJImVcMaP8f27LBEvaKKj1enqwA==
X-Received: by 2002:a05:6402:248b:b0:567:1947:d53f with SMTP id q11-20020a056402248b00b005671947d53fmr4565309eda.9.1710481050953;
        Thu, 14 Mar 2024 22:37:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dn16-20020a05640222f000b005645961ad39sm1374493edb.47.2024.03.14.22.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 22:37:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] recipes: Drop remaining PR values from recipes
Date: Fri, 15 Mar 2024 06:37:21 +0100
Message-ID: <20240315053721.5782-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109333

* as oe-core did in:
  https://git.openembedded.org/openembedded-core/commit/?id=d4c346e8ab

* when people are have to maintain own PRs for recipes in oe-core, they
  might add them for meta-oe recipes at the same time when upgrading
  to next LTS

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-graphics/packagegroups/packagegroup-core-clutter.bb  | 1 -
 meta-networking/recipes-protocols/frr/frr_9.1.bb                 | 1 -
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb      | 1 -
 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb       | 1 -
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb           | 1 -
 .../dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb | 1 -
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb              | 1 -
 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb             | 1 -
 meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb             | 1 -
 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb               | 1 -
 meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb                 | 1 -
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb               | 1 -
 meta-oe/recipes-core/meta/distro-feed-configs.bb                 | 1 -
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb         | 1 -
 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb          | 1 -
 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb     | 1 -
 meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb                       | 1 -
 .../recipes-devtools/packagegroups/packagegroup-sdk-target.bb    | 1 -
 meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb      | 1 -
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb                | 1 -
 meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb | 1 -
 meta-oe/recipes-extended/zram/zram_0.2.bb                        | 1 -
 meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb            | 1 -
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb                 | 1 -
 .../packagegroups/packagegroup-fonts-truetype.bb                 | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb  | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb            | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb              | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb           | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb       | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb         | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb              | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb      | 1 -
 .../recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb    | 1 -
 meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.2.bb    | 1 -
 meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb   | 1 -
 meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb       | 1 -
 meta-oe/recipes-kernel/crash/crash_8.0.4.bb                      | 1 -
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb                | 1 -
 meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb        | 1 -
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb              | 1 -
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb                 | 1 -
 meta-oe/recipes-support/eject/eject_2.1.5.bb                     | 1 -
 meta-oe/recipes-support/fbset/fbset-modes.bb                     | 1 -
 meta-oe/recipes-support/fbset/fbset_2.1.bb                       | 1 -
 meta-oe/recipes-support/gpm/gpm_git.bb                           | 1 -
 meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb            | 1 -
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb           | 1 -
 meta-oe/recipes-support/p910nd/p910nd_0.97.bb                    | 1 -
 meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb | 1 -
 .../recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb  | 1 -
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb   | 1 -
 .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb     | 1 -
 53 files changed, 53 deletions(-)

diff --git a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index d4df611639..a3c274240a 100644
--- a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Clutter package groups"
 
-PR = "r6"
 
 # clutter-1.0 gets debian renamed to libclutter-1.0-0
 # clutter-gtk-1.0 gets debian renamed to libclutter-gtk-1.0-0
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index 0926f84214..8ea917afaa 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -9,7 +9,6 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"
 
-PR = "r1"
 
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://frr.pam \
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index c19f7d847f..4dfdb8fc21 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -4,7 +4,6 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
-PR = "r11"
 
 SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/OLD/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index c53d1b8052..61f6b79dd7 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
                     file://zeroconf.c;beginline=1;endline=13;md5=a5bada96e1e34b08eb7446b28e2630b2"
 SECTION = "net"
 
-PR = "r1"
 
 SRC_URI = "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-${PV}.tar.gz \
            file://compilefix.patch \
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index 54a4ea0b33..fd36aadd7e 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -2,7 +2,6 @@ require netcat.inc
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
            file://obsolete_autoconf_macros.patch \
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb
index 7ad6a32782..d4ab31a9b1 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Combined nanopb package"
 PV = "1.0"
-PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 03018bb526..57f73eedc7 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -10,7 +10,6 @@ inherit autotools-brokensep update-alternatives
 DEPENDS += "libtirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 
-PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://lmbench-run \
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index 5efddfcc93..0769715f45 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-PR = "r1"
 
 SRC_URI = "\
     http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${BP}.tar.gz \
diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
index 1304ba9e03..cb62ee46af 100644
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/emagii/cpufrequtils.git;branch=master;protocol=https
 
 EXTRA_OEMAKE:append = " ${@['', 'NLS=false']['${USE_NLS}' == 'no']} "
 
-PR = "r5"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 52e9b136c8..2a736716db 100644
--- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "udev sysfsutils flex-native bison-native"
 RDEPENDS:${PN} = "udev module-init-tools"
 
-PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz \
            file://makefile_fix.patch \
diff --git a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
index 9b72ffefe4..61be5b2dcc 100644
--- a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Touchscreen calibration data"
 SECTION = "base"
-PR = "r11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b5fcfc87fb615860d398b5e38685edf"
 
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index 424d31a535..cbe82d42e7 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://dbus-daemon-proxy.c;endline=19;md5=41df6d21fe1c97d6a1
 DEPENDS = "dbus dbus-glib"
 SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
 PV = "0.0.0+git"
-PR = "r1.59"
 
 SRC_URI = "git://github.com/alban/dbus-daemon-proxy;branch=master;protocol=https \
            file://0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch \
diff --git a/meta-oe/recipes-core/meta/distro-feed-configs.bb b/meta-oe/recipes-core/meta/distro-feed-configs.bb
index a87de45832..fd6053c57e 100644
--- a/meta-oe/recipes-core/meta/distro-feed-configs.bb
+++ b/meta-oe/recipes-core/meta/distro-feed-configs.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Configuration files for online package repositories aka feeds"
-PR = "r6"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 422b4d49df..324406c1ed 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -3,7 +3,6 @@
 
 SUMMARY = "Basic task to get a device online"
 
-PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index 7e2873cf66..f6ddb1a352 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Basic task to get a device booting"
 
-PR = "r58"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 00b87bbd8b..247cc4266f 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -4,7 +4,6 @@ SECTION = "libs"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a92e76ec2c5167ca2e"
 
-PR = "r1"
 PROVIDES = "virtual/libintl"
 
 SRC_URI = " \
diff --git a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
index 24eae28501..7322916499 100644
--- a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
+++ b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
@@ -1,6 +1,5 @@
 require ${PN}.inc
 
-PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "05e2ceeac4bc85fbe40de8b4b22d9ab3"
 SRC_URI[sha256sum] = "dafb6cdca524c628df832b6dd0bf8fabceb103248edb21762c02d3068fca4503"
diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index 441ab2ec95..4a0383e0a1 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Packages required for a target (on-device) SDK"
 
-PR = "r1"
 
 inherit packagegroup
 
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
index 78640934a3..69e80ac0c8 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
@@ -12,7 +12,6 @@ SRCREV = "b8fcc89b74c9128a13b07cc15a0ce25dca0cd97e"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-PR = "r1"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_LIBLIST"
 CVE_STATUS_LIBLIST[status] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 955dd5154b..93b58057ce 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -5,7 +5,6 @@ SECTION = "libs"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r3"
 
 DEPENDS:class-native = "freetype-native libpng-native jpeg-native"
 DEPENDS = "freetype libpng jpeg expat gtk+"
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 54bc1b21f1..6a99e8d29b 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_
 SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
 SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
 
-PR = "r1"
 
 S = "${WORKDIR}/tools"
 
diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
index 97db34134e..b4b3a27b2b 100644
--- a/meta-oe/recipes-extended/zram/zram_0.2.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
@@ -8,7 +8,6 @@ RDEPENDS:${PN} = "kmod \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux','util-linux-swaponoff',d)}"
 RRECOMMENDS:${PN} = "kernel-module-zram"
 
-PR = "r3"
 
 SRC_URI = " \
            file://init \
diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index 2c28fde347..bd94b9ad51 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 # Really, no depends besides a C library
 
 PV = "0.3"
-PR = "r1"
 
 SRCREV = "ef2e1a390e768e21e6a6268977580ee129a96633"
 SRC_URI = "git://github.com/lucasdemarchi/dietsplash.git;branch=master;protocol=https \
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index a817d3834a..4fc4679f7f 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -10,7 +10,6 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
-PR = "r3"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://libsdl-1.2.15-xdata32.patch \
diff --git a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
index 0af6ac006e..1cc2cdf76b 100644
--- a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
+++ b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
@@ -3,7 +3,6 @@ SECTION = "fonts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r2"
 
 inherit packagegroup
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 05ece8b748..ea734182de 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -4,7 +4,6 @@ LICENSE = "Arphic-Public-License"
 LIC_FILES_CHKSUM = "file://license/english/ARPHICPL.TXT;md5=4555ed88e9a72fc9562af379d07c3350"
 
 RPROVIDES:${PN} = "virtual-chinese-font"
-PR = "r6"
 
 FONT_PACKAGES = "${PN}"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 919dad82e7..43a387b818 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -13,7 +13,6 @@ RDEPENDS:${PN}-serif = "${PN}-common"
 RDEPENDS:${PN}-serif-condensed = "${PN}-common"
 RDEPENDS:${PN}-mathtexgyre = "${PN}-common"
 RDEPENDS:${PN}-common = ""
-PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \
            file://30-dejavu-aliases.conf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index f223664905..cc9213ec5b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -6,7 +6,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.txt;md5=83544262a86f1f1ec761e75897df92bc"
 SRCREV = "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
 PV = "0.1+git"
-PR = "r3"
 
 SRC_URI = "git://github.com/android/platform_frameworks_base.git;branch=master;protocol=https"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index eb13b47b56..2439766ad5 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -6,7 +6,6 @@ LICENSE = "OFL-1.0"
 LICENSE_URL = "http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=OFL"
 LIC_FILES_CHKSUM = "file://OFL;md5=33a5bf7b98a9c0ae87430760ba762295 \
 "
-PR = "r8"
 
 SRC_URI = "https://archive.debian.org/debian/pool/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz "
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
index e361ce9f64..8a75fe38bd 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
@@ -4,7 +4,6 @@ SUMMARY = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://../COPYRIGHT.TXT;md5=70d34478e38b1ad9995079f9921f9ef7"
-PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
index fdcfe0421b..6d7ba11e73 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://License.txt;md5=5b171c5100029d884fcea21d9a2b7543 \
 "
 
-PR = "r7"
 
 SRC_URI = "http://fedorahosted.org/liberation-fonts/export/807b6dfd069b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
 S = "${WORKDIR}/liberation-fonts-${PV}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index a048075fc4..a3babe90a5 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -6,7 +6,6 @@ LICENSE = "${BPN}"
 LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
                     file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
 "
-PR = "r4"
 SRC_URI = "http://downloads.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index c7229df1b1..a4ad91fc77 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -8,7 +8,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
 
 RPROVIDES:${PN} = "virtual-japanese-font"
-PR = "r9"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
 S = "${WORKDIR}/sazanami-20040629"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index e81515f85e..d118769cc8 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -4,7 +4,6 @@ SUMMARY = "Ubuntu Font Family - TTF Version"
 HOMEPAGE = "http://font.ubuntu.com"
 LICENSE = "UFL"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=325a1a9029112a2405e743c7f816427b"
-PR = "r1"
 
 SHA1SUM = "0cef8205"
 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.2.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.2.bb
index 54a6476def..7a12272491 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.2.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.2.bb
@@ -1,6 +1,5 @@
 require recipes-graphics/xorg-driver/xorg-driver-input.inc
 SUMMARY = "X.Org X server -- void input driver"
-PR = "r22"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
 
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 574d259bdf..3f577bfa05 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -2,7 +2,6 @@ SUMMARY = "Common X11 scripts and support files"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r9"
 
 # we are using a gpe-style Makefile
 inherit features_check gpe
diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb
index 04be12602c..54883cef38 100644
--- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb
@@ -6,7 +6,6 @@ BPN = "crash"
 
 require crash.inc
 
-PR = "${INC_PR}.0"
 
 DEPENDS = "\
     nativesdk-ncurses \
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.4.bb b/meta-oe/recipes-kernel/crash/crash_8.0.4.bb
index cc46ab9ea7..1af90978e0 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.4.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.4.bb
@@ -1,6 +1,5 @@
 require crash.inc
 
-PR = "${INC_PR}.0"
 
 BBCLASSEXTEND = "native cross"
 
diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index a7d645f59f..379c7e1b63 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -4,7 +4,6 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "zlib"
 
-PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
            ${DEBIAN_MIRROR}/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-16.2.debian.tar.xz;name=patch;subdir=${BP} \
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 2f7edfb75c..850918d319 100644
--- a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
 SECTION = "libs"
 DEPENDS = "zlib gperf-native"
-PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
            file://addpkgconfig.patch \
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 5b089a0b33..d0171f3b99 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
     file://version.h;beginline=1;endline=8;md5=aa07311dd39288d4349f28e1de516454"
 SECTION = "libs"
 DEPENDS = "libid3tag"
-PR = "r3"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
     file://no-force-mem.patch \
diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index 10176634bd..3069528301 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -7,7 +7,6 @@ SRC_URI = "git://git.ideasonboard.org/yavta.git;branch=master \
 SRCREV = "65f740aa1758531fd810339bc1b7d1d33666e28a"
 
 PV = "0.0"
-PR = "r2"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index 33b31a2b1e..dd5489e7db 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -18,7 +18,6 @@ SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e
 
 S = "${WORKDIR}/${BPN}"
 
-PR = "r1"
 
 do_compile:prepend() {
     # PO subdir must be in build directory
diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recipes-support/fbset/fbset-modes.bb
index 034c2871a9..aa5f631c38 100644
--- a/meta-oe/recipes-support/fbset/fbset-modes.bb
+++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PV = "0.1.0"
-PR = "r6"
 
 SRC_URI = "file://fb.modes"
 S = "${WORKDIR}"
diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index 9870ee7379..690fee0df3 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://fbset.c;endline=19;md5=bf326f82cdfcac391af208f019c560
 RRECOMMENDS:${PN} = "fbset-modes"
 DEPENDS = "bison-native flex-native"
 
-PR = "r4"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/f/fbset/fbset_2.1.orig.tar.gz \
            file://makefile.patch \
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index cbb51d3477..31503e9c62 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -8,7 +8,6 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
 PV = "1.99.7+git${SRCREV}"
-PR = "r2"
 SRCREV = "e82d1a653ca94aa4ed12441424da6ce780b1e530"
 
 DEPENDS = "ncurses bison-native"
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index e9d30977fe..b204ea4dd6 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -2,7 +2,6 @@ SUMMARY = "Hard disk temperature monitor daemon"
 SECTION = "console/network"
 LICENSE = "GPL-2.0-or-later"
 
-PR = "r1"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://hddtemp-no-nls-support.patch \
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 138df9f300..6fbdd071e8 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -6,7 +6,6 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://readme.txt;md5=f8f366f3370dda889f60faa7db162cf4"
 SECTION = "libs"
 
-PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
            file://enforce-use-stl.patch \
diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
index cd7f79ea60..c6a3079ea2 100644
--- a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
@@ -4,7 +4,6 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3d82780e8917b360cbee7b9ec3e40734"
 
-PR = "r2"
 
 # v0.97
 SRCREV = "57ebc07ad8723ea4106090536c58c7f7160743e2"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index 3be2e9275c..538fa30d3f 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -20,7 +20,6 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "87ce2971662efd0b69a81bb4dc9ea76c"
 SRC_URI[sha256sum] = "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75c5a6df"
 
-PR = "r1"
 
 UPSTREAM_CHECK_REGEX = "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"
 UPSTREAM_CHECK_URI = "https://metacpan.org/release/${SRCNAME}"
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
index f5e2f67b35..31f6ae37fc 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-python/telepathy-
            file://remove_duplicate_install.patch \
            file://telepathy-python_fix_for_automake_1.12.patch"
 
-PR = "r6"
 
 S = "${WORKDIR}/telepathy-python-${PV}"
 
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index c56af6f382..c4b7b34cec 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -1,6 +1,5 @@
 SUMMARY = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
-PR = "r5"
 
 # librsvg-gtk gets debian renamed to librsvg-2-gtk
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 711059c8c4..f2e04f7932 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -1,7 +1,6 @@
 SUMMARY = "All packages for full XFCE installation"
 SECTION = "x11/wm"
 
-PR = "r10"
 
 inherit packagegroup features_check
 
-- 
2.44.0


