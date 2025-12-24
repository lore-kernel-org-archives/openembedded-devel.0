Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F71BE78484
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:25:35 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126347.1766604328527626380
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0nJFbvX;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so4914595e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604327; x=1767209127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxP/qXVHSFiIHZvviz7pEBKl16BeDrehYhyEuNX+09Q=;
        b=F0nJFbvXOXzNe1iiSpNH5nkDZuFUnGI3Qnz9+hqcmzbugRhChmUxl7Zjbkeg8xblim
         1USml6A5u0c3H9shguvQq7m4jfBtlEKk4oiMd4Y7XoUekivxq2DpfXY/B0xpG902/IC8
         NmPVZOJu1ib942ON27o1LeXkulK8xRLoYRClX1+unHqrwLbMFATaMiWeHGDx/M08vC/I
         EnTS2W9nJD3Iz7AV9iR7FCM8e231O5TQk/NwVcOC3UL86tWoEbyGLoUjj8JZ+uPJX24e
         0t7/zygy5RJwUH/OwuPEHQP+J9ByIKZLHRn7D4zpIV5uzeYsvDAM8rNMWiYWRYYkRh3x
         TcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604327; x=1767209127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MxP/qXVHSFiIHZvviz7pEBKl16BeDrehYhyEuNX+09Q=;
        b=uyv4eloBOJk1JNdLpfAiW2zpUWnRgEYvo+duc3r/eShYKhpRyOkGSTyjMzDpUzyXR3
         JpoNdi3sGDs2tTT12cuAS6hyG6uipJyTkx86vnuDjAZecmPpuUzLV8FBZ097RA0OZU4M
         RmHefaQveLMbpXTPj+AMw5Cy8yWo9piLDD9KwcX4IT6CH+w/UncPpbbY52By4mt5HcRF
         ikCLTZDZ4DgJ/mzZ9KVgCbPdRilI3qh8K1hIUITY9hVZbfk9DTC9xpDmb80GvnqUe6qI
         EnBf4KDhq31ISEBlk65EC28cgUIdw/Y+UFNF/uYTIG4GOThFBLEpvorv5SWNkIUeaqZn
         UZAw==
X-Gm-Message-State: AOJu0YxKVr9ZGa9m513Ca4NYPSQSZQab8NRkWpKcPGd8gleTzOqlOaRC
	owgw0TbWvcB4RAw/JWQXMSdWeQYzfDoyU6t+uFqnY+YUHKHOyZ+W+QRTHDskhw==
X-Gm-Gg: AY/fxX6gBKq4qofzQaQrLMCsb26OW6n+dr0evDVHFHgHilHGhMp6RCG1lYgLJWhrXcf
	1gJekjcxG2HVzxweru8UBF1Rnr8UXGYE8197cds4HAnWcxQ874y1rpyMptKI4gQROTIafFeSmvE
	kdI52sDEUGDI0oQwU6HhECsneLPqzuHiNGjFbClpm77v75eg4sa85dcRKl7sK30oTUeK50k2u0A
	W4kuumA+n412O9Z6Z83tc+zHboAuKhSrRtKykP7KsKB927cFIpBNjBRKLJfQMAAS+SVgLgVh46c
	qi5MUX1C3Rn9mYrnhlpwHak+MQfRPQUN9U5Lojfc85w5ZN9p4zGLRK2oymHtfW6b8c8FUHKv/sT
	3jKMa/Fxq2YOl4cu08+YTO29dumYMagY4NePvx5kkMCoggsjMsMnH/vbYJlf83+4Uc+CcVkIOvJ
	EYmhdsAV2O
X-Google-Smtp-Source: AGHT+IFIJi8phkPerYu2i9G46X2YkTTh05MdX3i5sRW8g1k4usUUZFZzDsy/l15fwUcYBzMQNMkNYA==
X-Received: by 2002:a05:600c:310e:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47d1956eb70mr197232065e9.1.1766604324910;
        Wed, 24 Dec 2025 11:25:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm36782038f8f.17.2025.12.24.11.25.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:25:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 6/6] wireplumber: add ptest support
Date: Wed, 24 Dec 2025 20:25:19 +0100
Message-ID: <20251224192519.2630037-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224192519.2630037-1-skandigraun@gmail.com>
References: <20251224192519.2630037-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122891

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
 .../ptest-packagelists-meta-multimedia.inc    |  1 +
 .../wireplumber/files/run-ptest               | 55 +++++++++++++++++++
 .../wireplumber/wireplumber_0.5.13.bb         | 33 ++++++++++-
 3 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index ba511b9ed5..792982572b 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -13,6 +13,7 @@ PTESTS_FAST_META_MULTIMEDIA = "\
     gupnp-igd \
     libmediaart-2.0 \
     libopenmpt\
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
index 334861b6db..4f91ffd3a8 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
@@ -13,11 +13,12 @@ DEPENDS = "glib-2.0 glib-2.0-native lua pipewire \
 SRCREV = "84429b47943d789389fbde17c06b82efb197d04e"
 SRC_URI = " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https;tag=${PV} \
+    file://run-ptest \
     file://90-OE-disable-session-dbus-dependent-features.lua \
 "
 
 
-inherit meson pkgconfig gobject-introspection systemd
+inherit meson pkgconfig gobject-introspection systemd ptest
 
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
@@ -145,3 +171,6 @@ FILES:${PN}-scripts += "${datadir}/wireplumber/scripts/*"
 FILES:${PN}-modules = ""
 RRECOMMENDS:${PN}-modules += "${PN}-modules-meta"
 RDEPENDS:${PN}-bash-completion = "bash bash-completion"
+
+FILES:${PN}-ptest += "${datadir}/wireplumber/scripts/lib/test-utils.lua ${datadir}/wireplumber/scripts/testlib.lua"
+RDEPENDS:${PN}-ptest += "pipewire-modules-protocol-native ${PN}-scripts"

