Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07638E7848C
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 20:55:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127781.1766609721018904457
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 12:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0Q/CrL7;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb2314f52so3527221f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766609719; x=1767214519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/d8S1JLSZJFlVBfe/5a61KWHdva050iguUs4OuMizw=;
        b=V0Q/CrL7VXMEydhbUNYav+x4vV/r0GymqIpoIbOokdAKHzIGCdoLCUPizELTMWaXMM
         u1S0LnrTib1yvQ53uSCWFsKF+n+6m1MAfBk5nDew86MiCL8pK6C4vIvetugaLpXEUTxt
         PKf8v5fpZKNtIeQHDqiyb9gYq3C+DB3Od08GjXERMTaBWiWGZCuN3WyxSVBpitrWPhXD
         eK+vFNAWFehRWmC0sMwecardAs3W8nuyMk2nLFOvkreNM0H7uO462WUdBDsyYpOWmkr+
         2cGtz7JrmwiXe8uRAPgQ6wn+Jc1LeGllpMp7QDRN6AU1TiaG4Aj+zVGQ0z3gUdVxMDMc
         dRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766609719; x=1767214519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/d8S1JLSZJFlVBfe/5a61KWHdva050iguUs4OuMizw=;
        b=DeRIM7QhSohuXn2ggp/rCgDXS+be7YmzJHhSD6HHeYX7XJfLvdEVfM0x/M3C8fxwAF
         8YjiEDEs+aDNwNZ03uqGk8IxsOpatE1XkF5BJ+x5B6a3prdZ9Byp2V0w5+rKtQwbOkw4
         6oDdo5q9REq54NrZ7DHc3Yc9RS9TEDImBqh/PomND7JggspUiZKiLRGJbPv2rjeb8eFW
         P8t0kLGZZEHazbhbCyIexU8Nd7iiWKZcsnoxcbPKRpEn21qrUslqzSBOqI+gizhB8c+l
         LUhBxGJ/SfBSHrX57SGZhaX1KZtOExTI81oMB4JT48Z3vsv+9Snm004tw2SFv3elJV/d
         gMyA==
X-Gm-Message-State: AOJu0YxE3WUOnqTJGEHCyofD31k0G68TAMxZ6t/ipmUhtfCVvSQfi6e1
	vKER3rzVdqbTvOmFMj5Yu3yZzwkTtg3gPDzGE8vg6ZyxT0D9RJ/swBG78q6g5A==
X-Gm-Gg: AY/fxX6q3bVDlKzNcHJ4zQz41tetBKJuJBEYzdJhemyHP134+ilIzYEZyDY8NdfGGXZ
	pGaBGF8ngczR9faa/HD/kjWPeGjRDaKn7/qtizj80wAdPtRlSW6jNV3a0H4D6iZ1oUib3G/EPei
	y1sD+fKQuITJwgobxG+LD9kp+D2c29afOSyiroBC9vWWweSopx/01AEYHB4sD5VkFTP4BlAXH3i
	2oGX/D+k0CI4GPFOo91uxwaLVCdjrJuu6UoaThpM5HUUaGM+IIbJqnW9Te5F0fTzgXBKpz1Gspx
	ZJa8XcmOU+h9bcQ6Z7SnJ1iFXbrf7DFmO2NpkXlkQ3vGKLHDdg8sz6MZ/GSBV5z5QfuVa+TS8Hv
	aVdfT8djlGLGCDt6tpVVIHnND0LvYk9vCQIpf/VzhRgG+5HpbM7S4OTNlEgq6AJJbOJhQNcLN3h
	N+uqEc6VMrsPICANTeLHE=
X-Google-Smtp-Source: AGHT+IFDCT4cIOFT7cJL7wQb3mnFqhKRKZqYaVgVogQvLL4em+yQhtc5MNivrcW/CcslLR6o5ES1MA==
X-Received: by 2002:a05:600c:828d:b0:477:73cc:82c2 with SMTP id 5b1f17b1804b1-47d1954a14dmr189861185e9.9.1766609718754;
        Wed, 24 Dec 2025 12:55:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aea77bsm140679535e9.17.2025.12.24.12.55.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 12:55:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH v2 2/2] wireplumber: add ptest support
Date: Wed, 24 Dec 2025 21:55:16 +0100
Message-ID: <20251224205516.2850233-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224205516.2850233-1-skandigraun@gmail.com>
References: <20251224205516.2850233-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 20:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122904

Execution takes <10s.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-24T19:17
BEGIN: /usr/lib/wireplumber/ptest
PASS: ./wp/test-spa-json
PASS: ./wp/test-spa-pod
PASS: ./wp/test-spa-type
PASS: ./wp/test-properties
PASS: ./wp/test-core
PASS: ./wp/test-session-item
PASS: ./wp/test-json-utils
PASS: ./wp/test-events
PASS: ./wp/test-conf
PASS: ./wp/test-transition
PASS: ./wp/test-object-interest
PASS: ./wp/test-metadata
PASS: ./wp/test-object-manager
PASS: ./wp/test-factory
PASS: ./wp/test-settings
PASS: ./wp/test-proxy
PASS: ./wp/test-state
PASS: ./wp/test-component-loader
PASS: 00-test-linking-non-default-device-node.lua
PASS: 01-test-linking-non-default-device-node-capture.lua
PASS: 02-test-linking-default-device-node.lua
PASS: 03-test-linking-default-device-node-capture.lua
PASS: 04-test-linking-defined-device-node-target-object-string.lua
PASS: 05-test-linking-defined-device-node-target-object-int.lua
PASS: 06-test-linking-defined-device-node-target-object-name.lua
PASS: 07-test-linking-defined-device-node-target-object-string-capture.lua
PASS: 08-test-linking-defined-device-node-target-object-int-capture.lua
PASS: 09-test-linking-defined-device-node-target-object-name-capture.lua
PASS: 10-test-linking-defined-device-node-node-target.lua
PASS: 11-test-linking-defined-device-node-node-target-capture.lua
PASS: 12-test-linking-defined-device-node-target-node-metadata.lua
PASS: 13-test-linking-defined-device-node-target-node-metadata-capture.lua
PASS: 14-test-linking-defined-device-node-target-object-metadata.lua
PASS: 15-test-linking-defined-device-node-target-object-metadata-capture.lua
PASS: 16-test-linking-defined-device-node-target-object-int-metadata.lua
PASS: 17-test-linking-defined-device-node-target-object-int-metadata-capture.lua
PASS: 00-test-default-nodes-initial-metadata-update.lua
/usr/lib/wireplumber/ptest
PASS: pod.lua
PASS: json.lua
PASS: json-utils.lua
PASS: monitor-rules.lua
PASS: require.lua
PASS: async-activation.lua
PASS: settings.lua
PASS: event-hooks.lua
PASS: properties.lua
/usr/lib/wireplumber/ptest
PASS: ./wplua/test-wplua
PASS: ./modules/test-file-monitor
PASS: ./modules/test-si-node
PASS: ./modules/test-si-standard-link
PASS: ./modules/test-dbus-connection
PASS: ./modules/test-si-audio-adapter
PASS: ./modules/test-reserve-device
DURATION: 1
END: /usr/lib/wireplumber/ptest
2025-12-24T19:17
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: rebased on the updated patch that upgraded wireplumber to 0.5.13

 .../ptest-packagelists-meta-multimedia.inc    |  3 +-
 .../wireplumber/files/run-ptest               | 55 +++++++++++++++++++
 .../wireplumber/wireplumber_0.5.13.bb         | 33 ++++++++++-
 3 files changed, 88 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index ba511b9ed5..0b1b4afba8 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -12,7 +12,8 @@ PTESTS_FAST_META_MULTIMEDIA = "\
     gupnp-av \
     gupnp-igd \
     libmediaart-2.0 \
-    libopenmpt\
+    libopenmpt \
+    wireplumber \
 "
 
 PTESTS_SLOW_META_MULTIMEDIA = "\
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest b/meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest
new file mode 100644
index 0000000000..a3682bd2b0
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest
@@ -0,0 +1,55 @@
+#!/bin/sh
+RET=0
+
+export HOME=/invalid
+export XDG_RUNTIME_DIR=/invalid
+export PIPEWIRE_RUNTIME_DIR=/tmp
+export XDG_CONFIG_HOME=$(pwd)/.config
+export XDG_STATE_HOME=$(pwd)/.local/state
+export FILE_MONITOR_DIR=$(pwd)/.local/file_monitor
+export WIREPLUMBER_MODULE_DIR=/usr/lib/wireplumber-0.5
+export G_TEST_SRCDIR=/usr/lib/wireplumber/ptest/data
+
+run_scripted_test(){
+    test_dir=$(dirname $1)
+    cd $test_dir
+    while read line; do
+        arg1=$(echo $line | cut -f1 -d" ")
+        arg2=$(echo $line | cut -f2 -d" ")
+        if ./script-tester $arg1 scripts/$arg2 > $arg2.out 2>&1; then
+            echo PASS: $arg2
+        else
+            echo FAIL: $arg2
+            RET=1
+        fi
+    done < ./ptest-list
+    cd -
+}
+
+run_regular_test(){
+  if ./$1 > $1.out 2>&1; then
+    echo PASS: $1
+  else
+    echo FAIL: $1
+    RET=1
+  fi
+}
+
+run_test(){
+    case $1 in
+      *run-ptest)
+        ;;
+      *script-tester)
+        run_scripted_test $1
+        ;;
+      *)
+        run_regular_test $1
+        ;;
+    esac
+}
+
+
+for t in $(find . -type f -executable); do
+    run_test $t
+done
+exit $RET
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
index b497d51e96..abd54515ca 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
@@ -13,11 +13,12 @@ DEPENDS = "glib-2.0 glib-2.0-native lua pipewire \
 SRCREV = "84429b47943d789389fbde17c06b82efb197d04e"
 SRC_URI = " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https;tag=${PV} \
+    file://run-ptest \
     file://90-OE-disable-session-dbus-dependent-features.lua \
 "
 
 
-inherit meson pkgconfig gobject-introspection systemd bash-completion
+inherit meson pkgconfig gobject-introspection systemd bash-completion ptest
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
@@ -31,11 +32,11 @@ EXTRA_OEMESON += " \
     -Delogind=disabled \
     -Dsystemd-system-unit-dir=${systemd_system_unitdir} \
     -Dsystemd-user-unit-dir=${systemd_user_unitdir} \
-    -Dtests=false \
 "
 
 PACKAGECONFIG ??= " dbus \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)} \
 "
 
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
@@ -45,6 +46,7 @@ PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=true,-Dsystemd
 # currently lacks the feature of enabling user services.
 PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=true,-Dsystemd-user-service=false,systemd"
 PACKAGECONFIG[dbus] = ""
+PACKAGECONFIG[test] = "-Dtests=true,-Dtests=false"
 
 PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
 PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends "
@@ -57,6 +59,30 @@ do_install:append() {
     fi
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/data/config
+    cd ${B}/tests
+    find . -maxdepth 2 -type f -executable -exec install -D {} ${D}${PTEST_PATH}/{} \;
+
+    install -m 644 ${S}/tests/wp/component-loader.conf ${D}${PTEST_PATH}/data/
+    cp -r ${S}/tests/scripts/scripts ${D}${PTEST_PATH}/scripts/
+    cp -r ${S}/tests/wplua/scripts ${D}${PTEST_PATH}/wplua/
+    cp -r ${S}/tests/wp/conf ${D}${PTEST_PATH}/data
+    cp -r ${S}/tests/wp/settings ${D}${PTEST_PATH}/data
+    install -m 644 ${S}/src/config/wireplumber.conf ${D}${PTEST_PATH}/data/config/
+    install -Dm 644 ${S}/tests/wplua/scripts/lib/testlib.lua ${D}${datadir}/wireplumber/scripts/lib/testlib.lua
+    install -Dm 644 ${S}/tests/scripts/scripts/lib/test-utils.lua ${D}${datadir}/wireplumber/scripts/lib/test-utils.lua
+
+    # this is not a test
+    rm -rf ${D}${PTEST_PATH}/examples
+
+    # Beside regular bianry executables, this package comes with lua tests also
+    # which need to be executed with specific parameters. Take the parameters
+    # from the meson.build files, and read them from run-ptest script.
+    grep args ${S}/tests/wplua/meson.build   | cut -d[ -f2 | cut -d] -f1 | tr -d ",'" > ${D}${PTEST_PATH}/wplua/ptest-list
+    grep args ${S}/tests/scripts/meson.build | cut -d[ -f2 | cut -d] -f1 | tr -d ",'" > ${D}${PTEST_PATH}/scripts/ptest-list
+}
+
 python split_dynamic_packages () {
     # Create packages for each WirePlumber module.
     wp_module_libdir = d.expand('${libdir}/${WP_MODULE_SUBDIR}')
@@ -142,3 +168,6 @@ FILES:${PN}-scripts += "${datadir}/wireplumber/scripts/*"
 # Dynamic packages (see set_dynamic_metapkg_rdepends).
 FILES:${PN}-modules = ""
 RRECOMMENDS:${PN}-modules += "${PN}-modules-meta"
+
+FILES:${PN}-ptest += "${datadir}/wireplumber/scripts/lib/test-utils.lua ${datadir}/wireplumber/scripts/testlib.lua"
+RDEPENDS:${PN}-ptest += "pipewire-modules-protocol-native ${PN}-scripts"

