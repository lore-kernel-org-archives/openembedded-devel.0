Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9644.1794997416288309311
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 02:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=au+hVpiE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso6879405e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 02:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794997414; x=1795602214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqGL5c2q0uTIvJv03VmRXfa0hSj/DVo4waLZs15gXnk=;
        b=au+hVpiE8xh7wXOGPCOhG6oaK+dpgRQQgI0l1jaVj4Xx1wLEvO+tahH38wkEC6JPUi
         VzxaVMBw/Zq0Tykf737FSGlpO8OH4HCp9w9AxdUjseq0R8cLvJDn2lJ2fBPXbiyoDYb+
         aPoGGT4f/lSd4nFdxSjXugr0Gx+AUszh8rlp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997414; x=1795602214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqGL5c2q0uTIvJv03VmRXfa0hSj/DVo4waLZs15gXnk=;
        b=c2vFOeRfKJjtGYUxj3pSs1oV1FrKYig3V3OMDxoNodz9F5chZX5hfSII4ftAuETsuD
         vwUYc8uxKZuV5mVgxxUp3yK4vB/3JBdonLqtgah0X0YaGGcW3JvGG223MgB0mhKaee0G
         QyMiCTx+3tnNkC2ewsCPVUOMROZepLf3F50TgfzoJ+5fyUhIu3AOpskoQNEo+yeVMPXv
         lYo/aGe4UEG1bJ8YD6Jfbso6qijMD2smf4xDkQ0XXrZhWcoZmAaSN8qmNf9qyT8sH6E9
         RF5tzVIFB0iw505NQdpiMOVrNlg1JpkEMSZqfeNJbZsaF2ThZkcUr/HuHwIiLXkeYuOR
         Og7w==
X-Gm-Message-State: APuU4Z9q7awLwdfG3RRWNNsgy+XK3+FUceJo5wgfho1AxtnOw705osPL
	8CUfqLxaSSh1ktc8xGkfWFDl2mxMwJFEpk6Cnpiq8pekiBT9jYm/43OVv0C8LHA6MqVB+COqz45
	upI+c
X-Gm-Gg: AYBFou28C0nZILqJ2bDN8WzjAPPxAecg0+OXckaijPbKjHr79U7aKUjtRYTuUwiCW4U
	Tl04B9uome2u+XyZdhoqzgZSb6ZE5ZuJQ9mhVmcSGc+5/iXCz5iGniYws9uGzhVmIEFm2BI4HD2
	xxBtgt7Xgoo9Es6ahScqxrTgnR6sFL8h/jJUUQflAvoHEGpY2GIAEMGY1ghF0u/QhW5/sP3O141
	GMlLOVuoS6mxFjvMBGM9DquNEtsBVAaznWnbwGh3nk/FXNP9+sqRxo0gxwU+W+WLXMMZJLxFNiX
	zH+tJU1lgldv0+Go1oiFJyNqRJqhHMOAWio88BKmtztPl2ywD/ZhMe/i2o9RIVnNl2dPRBzq/Ox
	LaYpdKtij0Vo/vaXVZ40ZIaYWZ5IzLtzMRGA3WOVGF3GrF/Elqng2h3Nt+746XqOgudCVxe7XuG
	XEtjSHnvPOd17+nrt/65Rv923TuYYp+WQrAJ8vdbal8fTNxYRKN4bjB/t38i51/j3Y2hMckcIU8
	fosTrudYQ+dSKBnz7D7wQv5STVpemATwVhYE1byjnJIYbw5jW0vrVfgKBAaSsp54q6y+FfpDAnp
	cWPb0SwbnElBIW/b7UHLiIMhY3ofQ8kMd4w+ddZIWT14M7LRWeOI9DnHJ2ryshp7t2ovvC5vOpM
	mhbBJ6oSG/ZPG6+NrH3hHNc7c05wyq7SvEuj1UlBzfMyAxTHeInKLTFU=
X-Received: by 2002:a05:600d:9:b0:4bb:8143:e182 with SMTP id 5b1f17b1804b1-4bb8143e1dfmr3065195e9.5.1794997412974;
        Wed, 18 Nov 2026 02:23:32 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm132674095e9.11.2026.11.18.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:23:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] layers: Migrate to new layer format
Date: Wed, 18 Nov 2026 12:23:29 +0200
Message-ID: <20261118102329.44335-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 10:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132636
Content-Type: text/plain; charset="utf-8"

Bitbake no longer uses collections, priorities, BBPATH, BBFILES or
BBFILES_DYNAMIC from layer.conf. Layers now set LAYERNAME, and
BBPATH/BBFILES are derived from LAYERDEPENDS. Follow the oe-core
and meta-yocto migration.

Rename the layers with a common "meta-oe" prefix, as described in
the bitbake commit introducing the new format (bitbake 9e93f530b,
"cooker: Change layer.conf handling to new approach"):

  The layer names are going to change. Some examples:

  "core" -> "oe-core"
  "openembedded-layer" -> "meta-oe"
  "networking-layer" -> meta-oe-networking"
  "virtualization-layer" -> "meta-virtualization"

  The idea is to have a consistent base prefix for combined repos
  so that the repo can be identified from the name (e.g. in a list
  of dependencies), and drop unneeded "-layer" suffix, make "core"
  clearer from other "core" things.

Depend on "oe-core" instead of "core" and update
LAYERSERIES_COMPAT to garburn.

Move dynamic-layers/<collection> to dynamic-recipes/<layername>,
which bitbake now picks up automatically when the named layer is
present.

Overrides are not evaluated in layer.conf anymore, so move the
meta-oe NON_MULTILIB_RECIPES settings to conf/layervars.conf,
which applies to the layer's own recipes. All affected recipes
are in meta-oe.

Only a few variable prefixes now pass from layer.conf to the global
configuration, others trigger a warning. Move the
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES lists to
conf/distro/include/test_reproducible_vars.inc, which the oe-core
reproducible selftest includes via include_all, and LICENSE_PATH
to conf/layervars.conf. The custom licenses are only used by
recipes from the same layer. Drop DEFAULT_TEST_SUITES for
meta-oe-ptest-image, as no such image exists and PTESTTESTSUITE is
not defined anywhere.

Fixes:

ERROR: Layer is not compatible with the core layer which only
supports these series: garburn (layer is compatible with blacksail)

AI-Generated: Uses Claude Code
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../distro/include/test_reproducible_vars.inc |   5 +
 meta-filesystems/conf/layer.conf              |  28 +--
 .../gpiod-sysfs-proxy.init.in                 |   0
 .../gpiod-sysfs-proxy/run-ptest.in            |   0
 .../gpiod-sysfs-proxy_1.0.2.bb                |   0
 .../distro/include/test_reproducible_vars.inc |  13 ++
 meta-gnome/conf/layer.conf                    |  42 +---
 ...Drop-the-libcanberra-gtk3-dependency.patch |   0
 ...s-drop-the-unused-gdk-gdkx.h-include.patch |   0
 .../gnome-disk-utility_46.1.bb                |   0
 .../gnome-remote-desktop_51.0.bb              |   0
 .../gnome-boxes/gnome-boxes_50.0.bb           |   0
 meta-initramfs/conf/layer.conf                |  22 +-
 .../distro/include/test_reproducible_vars.inc |  15 ++
 meta-multimedia/conf/layer.conf               |  50 +----
 meta-multimedia/conf/layervars.conf           |   3 +
 .../distro/include/test_reproducible_vars.inc |  40 ++++
 meta-networking/conf/layer.conf               |  64 +-----
 meta-networking/conf/layervars.conf           |   3 +
 .../firewalld/files/firewalld.init            |   0
 .../firewalld/files/run-ptest                 |   0
 .../firewalld/firewalld_2.5.2.bb              |   0
 .../system-config-printer_1.5.18.bb           |   0
 .../distro/include/test_reproducible_vars.inc | 135 ++++++++++++
 meta-oe/conf/layer.conf                       | 194 +-----------------
 meta-oe/conf/layervars.conf                   |   9 +
 .../packagegroup-meta-oe.bbappend             |   0
 .../openbox/openbox-xdgmenu/7_6.diff          |   0
 .../openbox-xdgmenu/fix-menu-generation.patch |   0
 .../openbox-xdgmenu/port-gnome-menus3.patch   |   0
 .../openbox/openbox-xdgmenu_0.3.bb            |   0
 .../packagegroup-meta-oe.bbappend             |   0
 ...ed-const-qualifiers-in-char-pointer-.patch |   0
 ...necessary-recursion-in-vfs_mkparents.patch |   0
 .../recipes-graphics/taisei/taisei_1.4.4.bb   |   0
 .../packagegroup-meta-oe.bbappend             |   0
 .../packagegroup-meta-oe.bbappend             |   0
 .../recipes-support/rasdaemon/files/init      |   0
 .../rasdaemon/files/rasdaemon.service         |   0
 .../rasdaemon/rasdaemon_0.8.5.bb              |   0
 ...rator-Use-own-generic-htobe-template.patch |   0
 .../recipes-bsp/rwmem/rwmem_2.0.bb            |   0
 ...ld-on-32bit-arches-with-64bit-time_t.patch |   0
 ...ot-clobber-PYTHONPATH-from-build-env.patch |   0
 .../lirc/lirc/0001-Unbolt-ubuntu-hack.patch   |   0
 .../lirc/0001-mplay-Fix-build-with-musl.patch |   0
 .../lirc/lirc/fix_build_errors.patch          |   0
 .../lirc/lirc/lirc.tmpfiles                   |   0
 .../lirc/lirc/lirc_options.conf               |   0
 .../recipes-connectivity/lirc/lirc/lircd.conf |   0
 .../recipes-connectivity/lirc/lirc/lircd.init |   0
 .../lirc/lirc/lircd.service                   |   0
 .../lirc/lirc/lircexec.init                   |   0
 .../recipes-connectivity/lirc/lirc_0.10.2.bb  |   0
 ...-t-fail-if-GLOB_BRACE-is-not-defined.patch |   0
 .../0001-meson.build-do-not-use-Werror.patch  |   0
 .../netplan/netplan_1.2.2.bb                  |   0
 .../thingsboard-gateway.service               |   0
 .../thingsboard-gateway_3.8.6.bb              |   0
 .../packagegroup-meta-oe.bbappend             |   0
 .../mongodb/0001-Fix-build-on-32bit.patch     |   0
 ...0001-Fix-compilation-with-fno-common.patch |   0
 ...01-Fix-type-mismatch-on-32bit-arches.patch |   0
 ...hLib20U1-Check-for-__DEFINED_wchar_t.patch |   0
 ...rror_r-implementation-glibc-specific.patch |   0
 ...upport-deprecated-resolver-functions.patch |   0
 ...e-build-settings-from-environment-va.patch |   0
 ...y-binary_function-base-classes-are-d.patch |   0
 ...-control-use-of-gnu_get_libc_version.patch |   0
 ...001-Use-long-long-instead-of-int64_t.patch |   0
 ...stead-of-pkg_resources-for-version-p.patch |   0
 ...ic_cast-size_t-to-maxMemoryUsageByte.patch |   0
 ...1-apply-msvc-workaround-for-clang-16.patch |   0
 ...sio-Dont-use-experimental-with-clang.patch |   0
 .../0001-include-needed-c-header.patch        |   0
 ...econfig.py-python-3.12-compatibility.patch |   0
 ...just-the-cache-alignment-assumptions.patch |   0
 ...-stacktrace-Define-ARCH_BITS-for-x86.patch |   0
 .../0001-wiredtiger-Avoid-using-off64_t.patch |   0
 ...ion-for-the-macro-__ELF_NATIVE_CLASS.patch |   0
 .../0002-Fix-default-stack-size-to-256K.patch |   0
 ...call-to-CheckLibWithHeader-as-a-keyw.patch |   0
 .../mongodb/0003-Fix-unknown-prefix-env.patch |   0
 .../0003-boost-Fix-build-with-clang-23.patch  |   0
 .../0004-ssl-Fix-build-with-OpenSSL-4.patch   |   0
 ...4-wiredtiger-Disable-strtouq-on-musl.patch |   0
 ...ove-the-Node-swap-function-in-Biggie.patch |   0
 .../recipes-dbs/mongodb/mongodb/1296.patch    |   0
 .../mongodb/mongodb/arm64-support.patch       |   0
 .../mongodb/disable_runtime_check.patch       |   0
 .../mongodb/mongodb/oe-buildinfo.vars         |   0
 .../mongodb/mongodb/ppc64_ARCH_BITS.patch     |   0
 .../recipes-dbs/mongodb/mongodb_git.bb        |   0
 ...ists.txt-override-the-PY_CMD_ESCAPED.patch |   0
 ...gh-extra-headers-to-allow-libbpf-to-.patch |   0
 ...ix-MCContext-constructor-for-LLVM-23.patch |   0
 ...verriding-the-runtime-location-of-te.patch |   0
 .../recipes-devtools/bcc/bcc/ptest_wrapper.sh |   0
 .../recipes-devtools/bcc/bcc/run-ptest        |   0
 .../recipes-devtools/bcc/bcc_0.37.0.bb        |   0
 .../boot-time-analysis-tools_0.7.2.bb         |   0
 ...BPF.cmake-introduce-DEBUG_PREFIX_MAP.patch |   0
 ...ker-flags-and-sysroot-to-raw-compile.patch |   0
 ...make-link-data-source-binary-without.patch |   0
 ...lderBPF-Fix-HasTerminator-on-LLVM-23.patch |   0
 ...5-CMakeLists-Add-support-for-LLVM-23.patch |   0
 ...d-build-paths-in-split-DWARF-test-pr.patch |   0
 ...-define-_GNU_SOURCE-for-pthread_setn.patch |   0
 .../bpftrace/bpftrace/run-ptest               |   0
 .../bpftrace/bpftrace_0.26.1.bb               |   0
 .../nanopb/nanopb-generator_0.4.93.bb         |   0
 .../nanopb/nanopb-runtime_0.4.93.bb           |   0
 .../recipes-devtools/nanopb/nanopb.bb         |   0
 .../recipes-devtools/nanopb/nanopb.inc        |   0
 .../recipes-extended/lcdproc/lcdproc_git.bb   |   0
 .../recipes-multimedia/kmsxx/kmsxx_git.bb     |   0
 .../recipes-support/nvmetcli/nvmetcli_0.8.bb  |   0
 ...ix-support-for-source-option-python3.patch |   0
 .../recipes-support/smem/smem_1.5.bb          |   0
 .../distro/include/test_reproducible_vars.inc |  10 +
 meta-perl/conf/layer.conf                     |  29 +--
 .../distro/include/test_reproducible_vars.inc |   4 +
 meta-python/conf/layer.conf                   |  24 +--
 meta-python/conf/layervars.conf               |   3 +
 .../distro/include/test_reproducible_vars.inc |   7 +
 meta-webserver/conf/layer.conf                |  30 +--
 meta-webserver/conf/layervars.conf            |   3 +
 .../distro/include/test_reproducible_vars.inc |   7 +
 meta-xfce/conf/layer.conf                     |  30 +--
 129 files changed, 298 insertions(+), 472 deletions(-)
 create mode 100644 meta-filesystems/conf/distro/include/test_reproducible_vars.inc
 rename meta-filesystems/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in (100%)
 rename meta-filesystems/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in (100%)
 rename meta-filesystems/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb (100%)
 create mode 100644 meta-gnome/conf/distro/include/test_reproducible_vars.inc
 rename meta-gnome/{dynamic-layers/meta-multimedia => dynamic-recipes/meta-oe-multimedia}/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch (100%)
 rename meta-gnome/{dynamic-layers/meta-multimedia => dynamic-recipes/meta-oe-multimedia}/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch (100%)
 rename meta-gnome/{dynamic-layers/meta-multimedia => dynamic-recipes/meta-oe-multimedia}/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb (100%)
 rename meta-gnome/{dynamic-layers => dynamic-recipes}/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_51.0.bb (100%)
 rename meta-gnome/{dynamic-layers => dynamic-recipes}/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_50.0.bb (100%)
 create mode 100644 meta-multimedia/conf/distro/include/test_reproducible_vars.inc
 create mode 100644 meta-multimedia/conf/layervars.conf
 create mode 100644 meta-networking/conf/distro/include/test_reproducible_vars.inc
 create mode 100644 meta-networking/conf/layervars.conf
 rename meta-networking/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/firewalld/files/firewalld.init (100%)
 rename meta-networking/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/firewalld/files/run-ptest (100%)
 rename meta-networking/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/firewalld/firewalld_2.5.2.bb (100%)
 rename meta-networking/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb (100%)
 create mode 100644 meta-oe/conf/distro/include/test_reproducible_vars.inc
 create mode 100644 meta-oe/conf/layervars.conf
 rename meta-oe/{dynamic-layers/gnome-layer => dynamic-recipes/meta-oe-gnome}/recipes-core/packagegroups/packagegroup-meta-oe.bbappend (100%)
 rename meta-oe/{dynamic-layers/gnome-layer => dynamic-recipes/meta-oe-gnome}/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff (100%)
 rename meta-oe/{dynamic-layers/gnome-layer => dynamic-recipes/meta-oe-gnome}/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch (100%)
 rename meta-oe/{dynamic-layers/gnome-layer => dynamic-recipes/meta-oe-gnome}/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch (100%)
 rename meta-oe/{dynamic-layers/gnome-layer => dynamic-recipes/meta-oe-gnome}/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb (100%)
 rename meta-oe/{dynamic-layers/multimedia-layer => dynamic-recipes/meta-oe-multimedia}/recipes-core/packagegroups/packagegroup-meta-oe.bbappend (100%)
 rename meta-oe/{dynamic-layers/multimedia-layer => dynamic-recipes/meta-oe-multimedia}/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch (100%)
 rename meta-oe/{dynamic-layers/multimedia-layer => dynamic-recipes/meta-oe-multimedia}/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch (100%)
 rename meta-oe/{dynamic-layers/multimedia-layer => dynamic-recipes/meta-oe-multimedia}/recipes-graphics/taisei/taisei_1.4.4.bb (100%)
 rename meta-oe/{dynamic-layers/networking-layer => dynamic-recipes/meta-oe-networking}/recipes-core/packagegroups/packagegroup-meta-oe.bbappend (100%)
 rename meta-oe/{dynamic-layers/perl-layer => dynamic-recipes/meta-oe-perl}/recipes-core/packagegroups/packagegroup-meta-oe.bbappend (100%)
 rename meta-oe/{dynamic-layers/perl-layer => dynamic-recipes/meta-oe-perl}/recipes-support/rasdaemon/files/init (100%)
 rename meta-oe/{dynamic-layers/perl-layer => dynamic-recipes/meta-oe-perl}/recipes-support/rasdaemon/files/rasdaemon.service (100%)
 rename meta-oe/{dynamic-layers/perl-layer => dynamic-recipes/meta-oe-perl}/recipes-support/rasdaemon/rasdaemon_0.8.5.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-bsp/rwmem/rwmem_2.0.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/fix_build_errors.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/lirc.tmpfiles (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/lirc_options.conf (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/lircd.conf (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/lircd.init (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/lircd.service (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc/lircexec.init (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/lirc/lirc_0.10.2.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/netplan/netplan_1.2.2.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.6.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-core/packagegroups/packagegroup-meta-oe.bbappend (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/1296.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/arm64-support.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-dbs/mongodb/mongodb_git.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bcc/bcc/ptest_wrapper.sh (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bcc/bcc/run-ptest (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bcc/bcc_0.37.0.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.2.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace/run-ptest (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/bpftrace/bpftrace_0.26.1.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/nanopb/nanopb-generator_0.4.93.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/nanopb/nanopb-runtime_0.4.93.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/nanopb/nanopb.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-devtools/nanopb/nanopb.inc (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-extended/lcdproc/lcdproc_git.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-multimedia/kmsxx/kmsxx_git.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-support/nvmetcli/nvmetcli_0.8.bb (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch (100%)
 rename meta-oe/{dynamic-layers/meta-python => dynamic-recipes/meta-oe-python}/recipes-support/smem/smem_1.5.bb (100%)
 create mode 100644 meta-perl/conf/distro/include/test_reproducible_vars.inc
 create mode 100644 meta-python/conf/distro/include/test_reproducible_vars.inc
 create mode 100644 meta-python/conf/layervars.conf
 create mode 100644 meta-webserver/conf/distro/include/test_reproducible_vars.inc
 create mode 100644 meta-webserver/conf/layervars.conf
 create mode 100644 meta-xfce/conf/distro/include/test_reproducible_vars.inc

diff --git a/meta-filesystems/conf/distro/include/test_reproducible_vars.inc b/meta-filesystems/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..5feaa6629e
--- /dev/null
+++ b/meta-filesystems/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,5 @@
+# List of known non-reproducible package of the meta-filesystems layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    e2tools-ptest \
+"
diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 578357fbd1..10aabc11c1 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -1,28 +1,8 @@
-# We have a conf and classes directory, add to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have recipes-* directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
-	${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "filesystems-layer"
-BBFILE_PATTERN_filesystems-layer = "^${LAYERDIR}/"
-BBFILE_PRIORITY_filesystems-layer = "5"
+LAYERNAME = "meta-oe-filesystems"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_filesystems-layer = "1"
-
-LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
-
-LAYERSERIES_COMPAT_filesystems-layer = "blacksail"
-
-BBFILES_DYNAMIC += " \
-    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
-"
+LAYERVERSION = "1"
 
-# List of known non-reproducible package of the meta-filesystems layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    e2tools-ptest \
-"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core meta-oe meta-oe-networking"
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in b/meta-filesystems/dynamic-recipes/meta-oe-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
similarity index 100%
rename from meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
rename to meta-filesystems/dynamic-recipes/meta-oe-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in b/meta-filesystems/dynamic-recipes/meta-oe-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in
similarity index 100%
rename from meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in
rename to meta-filesystems/dynamic-recipes/meta-oe-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb b/meta-filesystems/dynamic-recipes/meta-oe-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
similarity index 100%
rename from meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
rename to meta-filesystems/dynamic-recipes/meta-oe-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
diff --git a/meta-gnome/conf/distro/include/test_reproducible_vars.inc b/meta-gnome/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..17172e4548
--- /dev/null
+++ b/meta-gnome/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,13 @@
+# List of known non-reproducible package of the meta-gnome layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    geary \
+    geary-dbg \
+    gegl-dev \
+    gimp \
+    gimp-dbg \
+    gnome-terminal-src \
+    grilo-src \
+    gtk-vnc-src \
+    ibus \
+"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 1f5103d30e..4230f61987 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -1,46 +1,16 @@
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "gnome-layer"
-BBFILE_PATTERN_gnome-layer := "^${LAYERDIR}/"
-BBFILE_PRIORITY_gnome-layer = "5"
-
-# auto-pack gnome help files
-IMAGE_LINGUAS_COMPLEMENTARY:append = " ${@bb.utils.contains('DISTRO_FEATURES','helpfiles','*-help-%s','',d)}"
+LAYERNAME = "meta-oe-gnome"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_gnome-layer = "1"
+LAYERVERSION = "1"
 
-LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core meta-oe meta-oe-networking meta-oe-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "blacksail"
+# auto-pack gnome help files
+IMAGE_LINGUAS_COMPLEMENTARY:append = " ${@bb.utils.contains('DISTRO_FEATURES','helpfiles','*-help-%s','',d)}"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
   faenza-icon-theme->gtk+3 \
 "
-
-BBFILES_DYNAMIC += " \
-    virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bb \
-    virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
-    security:${LAYERDIR}/dynamic-layers/meta-security/*/*/*.bb \
-    multimedia-layer:${LAYERDIR}/dynamic-layers/meta-multimedia/*/*/*.bb \
-"
-
-# List of known non-reproducible package of the meta-gnome layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    geary \
-    geary-dbg \
-    gegl-dev \
-    gimp \
-    gimp-dbg \
-    gnome-terminal-src \
-    grilo-src \
-    gtk-vnc-src \
-    ibus \
-"
diff --git a/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch b/meta-gnome/dynamic-recipes/meta-oe-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch
similarity index 100%
rename from meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch
rename to meta-gnome/dynamic-recipes/meta-oe-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch
diff --git a/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch b/meta-gnome/dynamic-recipes/meta-oe-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch
similarity index 100%
rename from meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch
rename to meta-gnome/dynamic-recipes/meta-oe-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch
diff --git a/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb b/meta-gnome/dynamic-recipes/meta-oe-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
similarity index 100%
rename from meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
rename to meta-gnome/dynamic-recipes/meta-oe-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_51.0.bb b/meta-gnome/dynamic-recipes/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_51.0.bb
similarity index 100%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_51.0.bb
rename to meta-gnome/dynamic-recipes/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_51.0.bb
diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_50.0.bb b/meta-gnome/dynamic-recipes/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_50.0.bb
similarity index 100%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_50.0.bb
rename to meta-gnome/dynamic-recipes/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_50.0.bb
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 957f636b1d..fca26b2000 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -1,22 +1,6 @@
-# Layer configuration for meta-initramfs layer
-
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "meta-initramfs"
-BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
-
-# Define the priority for recipes (.bb files) from this layer,
-# choosing carefully how this layer interacts with all of the
-# other layers.
-
-BBFILE_PRIORITY_meta-initramfs = "5"
-LAYERDEPENDS_meta-initramfs = "core"
-
-LAYERSERIES_COMPAT_meta-initramfs = "blacksail"
+LAYERNAME = "meta-oe-initramfs"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/distro/include/test_reproducible_vars.inc b/meta-multimedia/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..fe4edd4f83
--- /dev/null
+++ b/meta-multimedia/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,15 @@
+# List of known non-reproducible package of the meta-multimedia layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    crossguid \
+    libcamera \
+    libcamera-dbg \
+    libcamera-src \
+    libgssdp-1.6-src \
+    libgupnp-1.6-src \
+    libsquish-staticdev \
+    oscam \
+    oscam-dbg \
+    oscam-src \
+    rtmpdump-staticdev \
+"
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 73c0172a33..ec64b97a13 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -1,50 +1,8 @@
-# It really depends on order of the layers appearing in BBLAYERS
-# variable in toplevel bblayers.conf file, where bitbake will search
-# for .inc files and others where bitbake uses BBPATH since it will
-# search the directories from first to last as specified in BBPATH
-# Therefore if you want a given layer to be considered high priority
-# for the .inc and .conf etc. then consider it adding at the beginning
-# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
-# the recipe contention so the order of directories in BBFILES does
-# not matter.
-
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "multimedia-layer"
-BBFILE_PATTERN_multimedia-layer := "^${LAYERDIR}/"
-
-LICENSE_PATH += "${LAYERDIR}/licenses"
-
-# Define the priority for recipes (.bb files) from this layer,
-# choosing carefully how this layer interacts with all of the
-# other layers.
-
-BBFILE_PRIORITY_multimedia-layer = "5"
+LAYERNAME = "meta-oe-multimedia"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_multimedia-layer = "1"
-
-LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
-
-LAYERSERIES_COMPAT_multimedia-layer = "blacksail"
+LAYERVERSION = "1"
 
-# List of known non-reproducible package of the meta-multimedia layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    crossguid \
-    libcamera \
-    libcamera-dbg \
-    libcamera-src \
-    libgssdp-1.6-src \
-    libgupnp-1.6-src \
-    libsquish-staticdev \
-    oscam \
-    oscam-dbg \
-    oscam-src \
-    rtmpdump-staticdev \
-"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core meta-oe meta-oe-python"
diff --git a/meta-multimedia/conf/layervars.conf b/meta-multimedia/conf/layervars.conf
new file mode 100644
index 0000000000..9269e0637d
--- /dev/null
+++ b/meta-multimedia/conf/layervars.conf
@@ -0,0 +1,3 @@
+# Variables applied to recipes from this layer only.
+
+LICENSE_PATH += "${LAYERDIR_meta-oe-multimedia}/licenses"
diff --git a/meta-networking/conf/distro/include/test_reproducible_vars.inc b/meta-networking/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..cd59c16f6d
--- /dev/null
+++ b/meta-networking/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,40 @@
+# List of known non-reproducible package of the meta-networking layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    babeld \
+    babeld-dbg \
+    dhcp-relay-staticdev \
+    ettercap-src \
+    freediameter \
+    freeradius \
+    htpdate-doc \
+    libbearssl-staticdev \
+    libmosquitto1 \
+    libowfat-staticdev \
+    libruli-staticdev \
+    mosquitto \
+    ncftp \
+    ncp \
+    ncp-dbg \
+    ndisc6-dbg \
+    ndisc6-misc \
+    ndisc6-ndisc6 \
+    ndisc6-rdisc6 \
+    ndisc6-rdnssd \
+    ndisc6-rltraceroute6 \
+    netsniff-ng-doc \
+    ntopng \
+    ntopng-dbg \
+    ntpsec-src \
+    openl2tp \
+    opensaf \
+    phytool \
+    phytool-dbg \
+    postfix-cfg \
+    rp-pppoe \
+    traceroute \
+    traceroute-dbg \
+    udpcast-doc \
+    unbound-doc \
+    znc \
+"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 24071b1e6d..184a455a4c 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -1,70 +1,14 @@
-# We have a conf and classes directory, add to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a packages directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
-            ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "networking-layer"
-BBFILE_PATTERN_networking-layer := "^${LAYERDIR}/"
-BBFILE_PRIORITY_networking-layer = "5"
+LAYERNAME = "meta-oe-networking"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_networking-layer = "1"
-
-LAYERDEPENDS_networking-layer = "core meta-python openembedded-layer"
-
-LAYERSERIES_COMPAT_networking-layer = "blacksail"
+LAYERVERSION = "1"
 
-LICENSE_PATH += "${LAYERDIR}/licenses"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core meta-oe-python meta-oe"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   wireguard-tools->wireguard-module \
   mdio-tools->mdio-netlink \
   ot-br-posix->ipset \
 "
-BBFILES_DYNAMIC += " \
-    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
-"
-
-# List of known non-reproducible package of the meta-networking layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    babeld \
-    babeld-dbg \
-    dhcp-relay-staticdev \
-    ettercap-src \
-    freediameter \
-    freeradius \
-    htpdate-doc \
-    libbearssl-staticdev \
-    libmosquitto1 \
-    libowfat-staticdev \
-    libruli-staticdev \
-    mosquitto \
-    ncftp \
-    ncp \
-    ncp-dbg \
-    ndisc6-dbg \
-    ndisc6-misc \
-    ndisc6-ndisc6 \
-    ndisc6-rdisc6 \
-    ndisc6-rdnssd \
-    ndisc6-rltraceroute6 \
-    netsniff-ng-doc \
-    ntopng \
-    ntopng-dbg \
-    ntpsec-src \
-    openl2tp \
-    opensaf \
-    phytool \
-    phytool-dbg \
-    postfix-cfg \
-    rp-pppoe \
-    traceroute \
-    traceroute-dbg \
-    udpcast-doc \
-    unbound-doc \
-    znc \
-"
diff --git a/meta-networking/conf/layervars.conf b/meta-networking/conf/layervars.conf
new file mode 100644
index 0000000000..af0f015756
--- /dev/null
+++ b/meta-networking/conf/layervars.conf
@@ -0,0 +1,3 @@
+# Variables applied to recipes from this layer only.
+
+LICENSE_PATH += "${LAYERDIR_meta-oe-networking}/licenses"
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/firewalld.init b/meta-networking/dynamic-recipes/meta-oe-python/recipes-connectivity/firewalld/files/firewalld.init
similarity index 100%
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/firewalld.init
rename to meta-networking/dynamic-recipes/meta-oe-python/recipes-connectivity/firewalld/files/firewalld.init
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/run-ptest b/meta-networking/dynamic-recipes/meta-oe-python/recipes-connectivity/firewalld/files/run-ptest
similarity index 100%
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/run-ptest
rename to meta-networking/dynamic-recipes/meta-oe-python/recipes-connectivity/firewalld/files/run-ptest
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.2.bb b/meta-networking/dynamic-recipes/meta-oe-python/recipes-connectivity/firewalld/firewalld_2.5.2.bb
similarity index 100%
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.2.bb
rename to meta-networking/dynamic-recipes/meta-oe-python/recipes-connectivity/firewalld/firewalld_2.5.2.bb
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynamic-recipes/meta-oe-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
similarity index 100%
rename from meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
rename to meta-networking/dynamic-recipes/meta-oe-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
diff --git a/meta-oe/conf/distro/include/test_reproducible_vars.inc b/meta-oe/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..f2f5a19df0
--- /dev/null
+++ b/meta-oe/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,135 @@
+# List of known non-reproducible package of the meta-oe layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    apitrace \
+    apitrace-dbg \
+    asio-dbg \
+    asio-ptest \
+    asio-src \
+    cpuid-doc \
+    dhrystone \
+    dhrystone-dbg \
+    dhrystone-dev \
+    dhrystone-src \
+    directfb \
+    directfb-dbg \
+    edid-decode \
+    edid-decode-dbg \
+    editorconfig-core-c-dev \
+    etcd-cpp-apiv3-dev \
+    evemu-tools-python \
+    fbgrab-doc \
+    fluentbit-src \
+    fsverity-utils-dbg \
+    fsverity-utils-staticdev \
+    fvwm-dbg \
+    fvwm-doc \
+    fvwm-extra \
+    fwupd-dbg \
+    fwupd-ptest \
+    gcab-src \
+    gosu \
+    gosu-dbg \
+    gosu-dev \
+    gosu-staticdev \
+    gphoto2 \
+    gphoto2-dbg \
+    hddtemp-locale-de \
+    hdf5 \
+    hdf5-dbg \
+    hdf5-src \
+    hdf5-staticdev \
+    hplip-dbg \
+    hplip-filter \
+    hplip-src \
+    iotop \
+    iotop-dbg \
+    ipmiutil \
+    ipmiutil-dbg \
+    ipmiutil-dev \
+    jpnevulator-doc \
+    jsonrpc-dev \
+    kpatch-build \
+    kpatch-doc \
+    ldns \
+    libass9 \
+    libass-dbg \
+    libbotan-3-7 \
+    libbotan-3-bin \
+    libbotan-3-dbg \
+    libbotan-3-dev \
+    libck-doc \
+    libdbus-cxx-dev \
+    libforms \
+    libfsverity0 \
+    libiio-src \
+    libjcat-dbg \
+    libjcat-ptest \
+    librelp-dbg \
+    librelp-ptest \
+    libsdl2-compat \
+    libsdl2-compat-dbg \
+    libsource-highlight5 \
+    libsource-highlight-dbg \
+    libsource-highlight-dev \
+    libsource-highlight-src \
+    libvncserver-dev \
+    libwebsockets-testapps \
+    libwmf \
+    libyui-ncurses-dbg \
+    libyui-ncurses-dev \
+    lmbench-staticdev \
+    log4cpp \
+    lprng \
+    lprng-dbg \
+    lshw \
+    lshw-locale-fr \
+    mce-test \
+    mime-support-doc \
+    minifi-cpp \
+    minifi-cpp-dbg \
+    minifi-cpp-src \
+    mpv \
+    mpv-dbg \
+    nana \
+    nbench-byte \
+    nbench-byte-dbg \
+    nbench-byte-src \
+    nspr-staticdev \
+    obconf-locale-es \
+    pcp \
+    pcp-dev \
+    pcp-doc \
+    pcp-src \
+    perfetto \
+    perfetto-dbg \
+    pidgin \
+    pidgin-dbg \
+    pim435-staticdev \
+    poco-ptest \
+    postgresql-server-dev \
+    qcbor-staticdev \
+    qperf-doc \
+    sharutils \
+    sharutils-dbg \
+    smemstat-doc \
+    soci-dev \
+    switchtec-user \
+    switchtec-user-dbg \
+    switchtec-user-staticdev \
+    thin-provisioning-tools-dev \
+    toybox-inittab \
+    toybox-inittab-dbg \
+    toybox-inittab-dev \
+    transmission-dbg \
+    transmission-gtk \
+    transmission-src \
+    vulkan-cts \
+    vulkan-cts-dbg \
+    waylandpp-dev \
+    yasm-src \
+    zlog-staticdev \
+    zsh \
+    zsh-dbg \
+    zsh-src \
+"
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 8318d3dbf0..6b96f9ba6e 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -1,54 +1,11 @@
-# It really depends on order of the layers appearing in BBLAYERS
-# variable in toplevel bblayers.conf file, where bitbake will search
-# for .inc files and others where bitbake uses BBPATH since it will
-# search the directories from first to last as specified in BBPATH
-# Therefore if you want a given layer to be considered high priority
-# for the .inc and .conf etc. then consider it adding at the beginning
-# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
-# the recipe contention so the order of directories in BBFILES does
-# not matter.
-
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "openembedded-layer"
-BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
-
-# Define the priority for recipes (.bb files) from this layer,
-# choosing carefully how this layer interacts with all of the
-# other layers.
-
-BBFILE_PRIORITY_openembedded-layer = "5"
-
-# only activates content when identified layers are present,
-# to ensure yocto compatibility check pass
-BBFILES_DYNAMIC += " \
-    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
-    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bbappend \
-    multimedia-layer:${LAYERDIR}/dynamic-layers/multimedia-layer/recipes-*/*/*.bb \
-    multimedia-layer:${LAYERDIR}/dynamic-layers/multimedia-layer/recipes-*/*/*.bbappend \
-    networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bb \
-    networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bbappend \
-    gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/recipes-*/*/*.bb \
-    gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/recipes-*/*/*.bbappend \
-    perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
-    perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bbappend \
-    selinux:${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bb \
-    selinux:${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bbappend \
-"
+LAYERNAME = "meta-oe"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_openembedded-layer = "1"
+LAYERVERSION = "1"
 
-LAYERDEPENDS_openembedded-layer = "core"
-
-LAYERSERIES_COMPAT_openembedded-layer = "blacksail"
-
-LICENSE_PATH += "${LAYERDIR}/licenses"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core"
 
 PREFERRED_RPROVIDER_libdevmapper = "lvm2"
 PREFERRED_RPROVIDER_libdevmapper-native = "lvm2-native"
@@ -119,146 +76,3 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   source-han-sans-tw-fonts->fontconfig \
   source-code-pro-fonts->fontconfig \
 "
-
-DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
-
-NON_MULTILIB_RECIPES:append = " crash pahole libbpf bpftrace bpftool bcc"
-
-NON_MULTILIB_RECIPES:remove:x86 = "libbpf"
-NON_MULTILIB_RECIPES:remove:x86-64 = "libbpf"
-
-# List of known non-reproducible package of the meta-oe layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    apitrace \
-    apitrace-dbg \
-    asio-dbg \
-    asio-ptest \
-    asio-src \
-    cpuid-doc \
-    dhrystone \
-    dhrystone-dbg \
-    dhrystone-dev \
-    dhrystone-src \
-    directfb \
-    directfb-dbg \
-    edid-decode \
-    edid-decode-dbg \
-    editorconfig-core-c-dev \
-    etcd-cpp-apiv3-dev \
-    evemu-tools-python \
-    fbgrab-doc \
-    fluentbit-src \
-    fsverity-utils-dbg \
-    fsverity-utils-staticdev \
-    fvwm-dbg \
-    fvwm-doc \
-    fvwm-extra \
-    fwupd-dbg \
-    fwupd-ptest \
-    gcab-src \
-    gosu \
-    gosu-dbg \
-    gosu-dev \
-    gosu-staticdev \
-    gphoto2 \
-    gphoto2-dbg \
-    hddtemp-locale-de \
-    hdf5 \
-    hdf5-dbg \
-    hdf5-src \
-    hdf5-staticdev \
-    hplip-dbg \
-    hplip-filter \
-    hplip-src \
-    iotop \
-    iotop-dbg \
-    ipmiutil \
-    ipmiutil-dbg \
-    ipmiutil-dev \
-    jpnevulator-doc \
-    jsonrpc-dev \
-    kpatch-build \
-    kpatch-doc \
-    ldns \
-    libass9 \
-    libass-dbg \
-    libbotan-3-7 \
-    libbotan-3-bin \
-    libbotan-3-dbg \
-    libbotan-3-dev \
-    libck-doc \
-    libdbus-cxx-dev \
-    libforms \
-    libfsverity0 \
-    libiio-src \
-    libjcat-dbg \
-    libjcat-ptest \
-    librelp-dbg \
-    librelp-ptest \
-    libsdl2-compat \
-    libsdl2-compat-dbg \
-    libsource-highlight5 \
-    libsource-highlight-dbg \
-    libsource-highlight-dev \
-    libsource-highlight-src \
-    libvncserver-dev \
-    libwebsockets-testapps \
-    libwmf \
-    libyui-ncurses-dbg \
-    libyui-ncurses-dev \
-    lmbench-staticdev \
-    log4cpp \
-    lprng \
-    lprng-dbg \
-    lshw \
-    lshw-locale-fr \
-    mce-test \
-    mime-support-doc \
-    minifi-cpp \
-    minifi-cpp-dbg \
-    minifi-cpp-src \
-    mpv \
-    mpv-dbg \
-    nana \
-    nbench-byte \
-    nbench-byte-dbg \
-    nbench-byte-src \
-    nspr-staticdev \
-    obconf-locale-es \
-    pcp \
-    pcp-dev \
-    pcp-doc \
-    pcp-src \
-    perfetto \
-    perfetto-dbg \
-    pidgin \
-    pidgin-dbg \
-    pim435-staticdev \
-    poco-ptest \
-    postgresql-server-dev \
-    qcbor-staticdev \
-    qperf-doc \
-    sharutils \
-    sharutils-dbg \
-    smemstat-doc \
-    soci-dev \
-    switchtec-user \
-    switchtec-user-dbg \
-    switchtec-user-staticdev \
-    thin-provisioning-tools-dev \
-    toybox-inittab \
-    toybox-inittab-dbg \
-    toybox-inittab-dev \
-    transmission-dbg \
-    transmission-gtk \
-    transmission-src \
-    vulkan-cts \
-    vulkan-cts-dbg \
-    waylandpp-dev \
-    yasm-src \
-    zlog-staticdev \
-    zsh \
-    zsh-dbg \
-    zsh-src \
-"
diff --git a/meta-oe/conf/layervars.conf b/meta-oe/conf/layervars.conf
new file mode 100644
index 0000000000..0ee55455e1
--- /dev/null
+++ b/meta-oe/conf/layervars.conf
@@ -0,0 +1,9 @@
+# Variables applied to recipes from this layer only.
+# Overrides are not evaluated in layer.conf, so these live here.
+
+NON_MULTILIB_RECIPES:append = " crash pahole libbpf bpftrace bpftool bcc"
+
+NON_MULTILIB_RECIPES:remove:x86 = "libbpf"
+NON_MULTILIB_RECIPES:remove:x86-64 = "libbpf"
+
+LICENSE_PATH += "${LAYERDIR_meta-oe}/licenses"
diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-recipes/meta-oe-gnome/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
similarity index 100%
rename from meta-oe/dynamic-layers/gnome-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
rename to meta-oe/dynamic-recipes/meta-oe-gnome/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff b/meta-oe/dynamic-recipes/meta-oe-gnome/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
similarity index 100%
rename from meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
rename to meta-oe/dynamic-recipes/meta-oe-gnome/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch b/meta-oe/dynamic-recipes/meta-oe-gnome/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
similarity index 100%
rename from meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
rename to meta-oe/dynamic-recipes/meta-oe-gnome/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch b/meta-oe/dynamic-recipes/meta-oe-gnome/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
similarity index 100%
rename from meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
rename to meta-oe/dynamic-recipes/meta-oe-gnome/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb b/meta-oe/dynamic-recipes/meta-oe-gnome/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
similarity index 100%
rename from meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
rename to meta-oe/dynamic-recipes/meta-oe-gnome/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-recipes/meta-oe-multimedia/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
similarity index 100%
rename from meta-oe/dynamic-layers/multimedia-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
rename to meta-oe/dynamic-recipes/meta-oe-multimedia/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch b/meta-oe/dynamic-recipes/meta-oe-multimedia/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
similarity index 100%
rename from meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
rename to meta-oe/dynamic-recipes/meta-oe-multimedia/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch b/meta-oe/dynamic-recipes/meta-oe-multimedia/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
similarity index 100%
rename from meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
rename to meta-oe/dynamic-recipes/meta-oe-multimedia/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb b/meta-oe/dynamic-recipes/meta-oe-multimedia/recipes-graphics/taisei/taisei_1.4.4.bb
similarity index 100%
rename from meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
rename to meta-oe/dynamic-recipes/meta-oe-multimedia/recipes-graphics/taisei/taisei_1.4.4.bb
diff --git a/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-recipes/meta-oe-networking/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
similarity index 100%
rename from meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
rename to meta-oe/dynamic-recipes/meta-oe-networking/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-recipes/meta-oe-perl/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
similarity index 100%
rename from meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
rename to meta-oe/dynamic-recipes/meta-oe-perl/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/init b/meta-oe/dynamic-recipes/meta-oe-perl/recipes-support/rasdaemon/files/init
similarity index 100%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/init
rename to meta-oe/dynamic-recipes/meta-oe-perl/recipes-support/rasdaemon/files/init
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service b/meta-oe/dynamic-recipes/meta-oe-perl/recipes-support/rasdaemon/files/rasdaemon.service
similarity index 100%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service
rename to meta-oe/dynamic-recipes/meta-oe-perl/recipes-support/rasdaemon/files/rasdaemon.service
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb b/meta-oe/dynamic-recipes/meta-oe-perl/recipes-support/rasdaemon/rasdaemon_0.8.5.bb
similarity index 100%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb
rename to meta-oe/dynamic-recipes/meta-oe-perl/recipes-support/rasdaemon/rasdaemon_0.8.5.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-bsp/rwmem/rwmem_2.0.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-bsp/rwmem/rwmem_2.0.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lirc.tmpfiles b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lirc.tmpfiles
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lirc.tmpfiles
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lirc.tmpfiles
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lirc_options.conf b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lirc_options.conf
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lirc_options.conf
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lirc_options.conf
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.conf b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lircd.conf
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.conf
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lircd.conf
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.init b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lircd.init
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.init
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lircd.init
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.service b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lircd.service
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.service
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lircd.service
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircexec.init b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lircexec.init
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircexec.init
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc/lircexec.init
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc_0.10.2.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/lirc/lirc_0.10.2.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.2.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/netplan/netplan_1.2.2.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.2.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/netplan/netplan_1.2.2.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.6.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.6.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.6.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.6.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-recipes/meta-oe-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/1296.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/1296.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb_git.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-dbs/mongodb/mongodb_git.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/ptest_wrapper.sh b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/ptest_wrapper.sh
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/ptest_wrapper.sh
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/ptest_wrapper.sh
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/run-ptest b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/run-ptest
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/run-ptest
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc/run-ptest
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc_0.37.0.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bcc/bcc_0.37.0.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.2.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.2.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.2.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.2.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/run-ptest b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/run-ptest
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/run-ptest
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace/run-ptest
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.93.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/nanopb/nanopb-generator_0.4.93.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.93.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/nanopb/nanopb-generator_0.4.93.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.93.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/nanopb/nanopb-runtime_0.4.93.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.93.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/nanopb/nanopb-runtime_0.4.93.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/nanopb/nanopb.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/nanopb/nanopb.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc b/meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/nanopb/nanopb.inc
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-devtools/nanopb/nanopb.inc
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-extended/lcdproc/lcdproc_git.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-extended/lcdproc/lcdproc_git.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-multimedia/kmsxx/kmsxx_git.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-multimedia/kmsxx/kmsxx_git.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch b/meta-oe/dynamic-recipes/meta-oe-python/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb b/meta-oe/dynamic-recipes/meta-oe-python/recipes-support/smem/smem_1.5.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
rename to meta-oe/dynamic-recipes/meta-oe-python/recipes-support/smem/smem_1.5.bb
diff --git a/meta-perl/conf/distro/include/test_reproducible_vars.inc b/meta-perl/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..8bc2cdf961
--- /dev/null
+++ b/meta-perl/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,10 @@
+# List of known non-reproducible package of the meta-perl layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    libencode-perl-src \
+    libhtml-tree-perl \
+    libhtml-tree-perl-doc \
+    libmodule-build-tiny-perl \
+    po4a \
+    po4a-doc \
+"
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index e4292adcda..6a04dc5d2e 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -1,29 +1,8 @@
-# We have a conf and classes directory, add to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have recipes-* directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
-	${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "perl-layer"
-BBFILE_PATTERN_perl-layer := "^${LAYERDIR}/"
-BBFILE_PRIORITY_perl-layer = "5"
+LAYERNAME = "meta-oe-perl"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_perl-layer = "1"
-
-LAYERDEPENDS_perl-layer = "core openembedded-layer"
-
-LAYERSERIES_COMPAT_perl-layer = "blacksail"
+LAYERVERSION = "1"
 
-# List of known non-reproducible package of the meta-perl layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    libencode-perl-src \
-    libhtml-tree-perl \
-    libhtml-tree-perl-doc \
-    libmodule-build-tiny-perl \
-    po4a \
-    po4a-doc \
-"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core meta-oe"
diff --git a/meta-python/conf/distro/include/test_reproducible_vars.inc b/meta-python/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..5276639ad6
--- /dev/null
+++ b/meta-python/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,4 @@
+# List of known non-reproducible package of the meta-python layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 8cc8d40696..55e1238449 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -1,24 +1,8 @@
-# We might have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have recipes directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "meta-python"
-BBFILE_PATTERN_meta-python := "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-python = "5"
+LAYERNAME = "meta-oe-python"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_meta-python = "1"
-
-LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
-
-LAYERSERIES_COMPAT_meta-python = "blacksail"
-
-LICENSE_PATH += "${LAYERDIR}/licenses"
+LAYERVERSION = "1"
 
-# List of known non-reproducible package of the meta-python layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core (>= 12) meta-oe"
diff --git a/meta-python/conf/layervars.conf b/meta-python/conf/layervars.conf
new file mode 100644
index 0000000000..098781a18e
--- /dev/null
+++ b/meta-python/conf/layervars.conf
@@ -0,0 +1,3 @@
+# Variables applied to recipes from this layer only.
+
+LICENSE_PATH += "${LAYERDIR_meta-oe-python}/licenses"
diff --git a/meta-webserver/conf/distro/include/test_reproducible_vars.inc b/meta-webserver/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..6d722b1e7c
--- /dev/null
+++ b/meta-webserver/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,7 @@
+# List of known non-reproducible package of the meta-webserver layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    netdata \
+    netdata-dbg \
+    php-phar \
+"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index c46f42a468..e1a064b035 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -1,35 +1,13 @@
-# Layer configuration for meta-webserver layer
-# Copyright 2012 Intel Corporation
-
-# We have a conf and classes directory, add to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have various recipe-* directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "webserver"
-BBFILE_PATTERN_webserver := "^${LAYERDIR}/"
-BBFILE_PRIORITY_webserver = "5"
+LAYERNAME = "meta-oe-webserver"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_webserver = "1"
-
-LAYERDEPENDS_webserver = "core openembedded-layer networking-layer"
+LAYERVERSION = "1"
 
-LAYERSERIES_COMPAT_webserver = "blacksail"
-
-LICENSE_PATH += "${LAYERDIR}/licenses"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core meta-oe meta-oe-networking"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phpmyadmin->bash \
   phpmyadmin->php \
 "
-
-# List of known non-reproducible package of the meta-webserver layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    netdata \
-    netdata-dbg \
-    php-phar \
-"
diff --git a/meta-webserver/conf/layervars.conf b/meta-webserver/conf/layervars.conf
new file mode 100644
index 0000000000..b721e91adc
--- /dev/null
+++ b/meta-webserver/conf/layervars.conf
@@ -0,0 +1,3 @@
+# Variables applied to recipes from this layer only.
+
+LICENSE_PATH += "${LAYERDIR_meta-oe-webserver}/licenses"
diff --git a/meta-xfce/conf/distro/include/test_reproducible_vars.inc b/meta-xfce/conf/distro/include/test_reproducible_vars.inc
new file mode 100644
index 0000000000..8651342f7c
--- /dev/null
+++ b/meta-xfce/conf/distro/include/test_reproducible_vars.inc
@@ -0,0 +1,7 @@
+# List of known non-reproducible package of the meta-xfce layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    catfish \
+    libsamba-util0 \
+    samba-dbg \
+"
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 866d1e6f02..b7fc63573c 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -1,25 +1,11 @@
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "xfce-layer"
-BBFILE_PATTERN_xfce-layer := "^${LAYERDIR}/"
-BBFILE_PRIORITY_xfce-layer = "5"
+LAYERNAME = "meta-oe-xfce"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_xfce-layer = "1"
-
-LAYERDEPENDS_xfce-layer = "core"
-LAYERDEPENDS_xfce-layer += "openembedded-layer"
-LAYERDEPENDS_xfce-layer += "gnome-layer"
-LAYERDEPENDS_xfce-layer += "multimedia-layer"
-LAYERDEPENDS_xfce-layer += "meta-python"
-LAYERDEPENDS_xfce-layer += "networking-layer"
+LAYERVERSION = "1"
 
-LAYERSERIES_COMPAT_xfce-layer = "blacksail"
+LAYERSERIES_COMPAT = "garburn"
+LAYERDEPENDS = "oe-core meta-oe meta-oe-gnome meta-oe-multimedia meta-oe-python meta-oe-networking"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
@@ -27,11 +13,3 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   rodent-icon-theme->gdk-pixbuf \
   rodent-icon-theme->gtk+3 \
 "
-
-# List of known non-reproducible package of the meta-xfce layer
-# Please keep this list sorted
-OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    catfish \
-    libsamba-util0 \
-    samba-dbg \
-"
-- 
2.47.3

