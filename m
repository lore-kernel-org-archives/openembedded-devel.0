Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6740C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.26002.1651346305749082631
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k5/3sbda;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1181697pjv.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cB7r6yUje2e/QyU1aYACt27RlS73y5Jf/fbeZfddoXE=;
        b=k5/3sbdaM9ll238oasUyJtffM6nD8Lz/13ZXV3dp8W8RrwdTBBckjuaz2El4hAVpbF
         qMUGEKeEjICv17ZSnh19mcyxfAXz+jHdkX+GDWBbn3MpnEWTfU7sCXWqWh/8+7Hs0acz
         edLRWzlwxXMqrNGWWJTYEpJxm+lTAJLNT7tmtdgKfX3KdcIdxi7Ow8hR7T5TcBeuXVyO
         sT4MmAdEebsUHwyeB1beJmYoDBQmjYEd/Ec/bXRcGgLQF68KmM1tl2kE0+9aC1BtudrY
         L1FOsqk1wWzjRSfWHk16eBxUNQ+mFwmJqMYgurnaXXEkY5dKO94sH4AHTj91COaJI2Br
         QWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cB7r6yUje2e/QyU1aYACt27RlS73y5Jf/fbeZfddoXE=;
        b=V8myvu06oPTIAEw/tpOBLfB1N+jM747XNs80l/gVLej6sW2xs96IrD+TeTAUXr7801
         wLORYzcWNwmKY7tpOMps9UUNfsW2vJgyyCEuIMTpubsxJWv5JV82x4KFGWd/o6RU2Bq0
         HRwnw5qGEdj6sGeYvNBV3MWZmD8Lzw1Q/inzU2oOWfkzwaBDB/nrsTC2GH8FsUmxaYhz
         QPP0rHmJrapjQDunYk3/yhnwsex5g4pwZzCTMxwiYePaZ6x3+18aWhElqDKsqZWvD4Dw
         oRS6aExDpIBsVPRHQAxoJ9PHj8dDnRjXjUwet9z/W7I86FqHFISjqIEGObcH+Z0zF/rK
         Tdzw==
X-Gm-Message-State: AOAM530N1gODBQZczE/MyP9fXly++GvrgxyoXVvw4EVjxGVwRTt+qSTc
	Jpmj/4jY0mGGxSl90/+i7MFUXJKLtSrWtQ==
X-Google-Smtp-Source: 
 ABdhPJzR8jzd7v7LVqr7utYXGd4E+CPQjnxzn0leYjFzSYpBSOCoM8Wx1rsdhP2ySDmWQayRxTon0w==
X-Received: by 2002:a17:902:e891:b0:15e:9c42:af2f with SMTP id
 w17-20020a170902e89100b0015e9c42af2fmr223914plg.71.1651346304540;
        Sat, 30 Apr 2022 12:18:24 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 00/39] Patch review
Date: Sat, 30 Apr 2022 12:17:40 -0700
Message-Id: <cover.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96867

Please have comments back my Tuesday

The following changes since commit 7e05822fe85a77ea7e9fdfa61f300334ed76e294:

  meta-openemnedded: Add myself as kirkstone maintainer (2022-04-23 06:50:42 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Carlos Rafael Giani (1):
  pipewire: Upgrade to version 0.3.50

Khem Raj (23):
  crash: Fix build for mips target
  tcsh: Do not install symlinks into /bin with usrmerge
  arno-iptables-firewall: Do not use bitbake variable inside S
  fluentbit: Fix build with usrmerge distro feature
  tomoyo-tools: Define SBINDIR
  tomoyo-tools: Drop md5sum
  dietsplash: specify install rootdir
  linux-atm: Add knob to root prefix
  ufw: Fix build with usrmerge distro feature
  klibc: Recognise --dyld-prefix clang option
  mozjs: Use vendored icu on ppc/clang
  boinc-client: Do not overwrite same file when using usrmerge
  pam-ssh-agent-auth: Use specific versions of BSD licenses
  fwupd: Enable build with musl
  lirc: install systemd units only when using systemd distro feature
  fluentbit: Disable systemd support when systemd distro feature is
    disabled
  gtksourceview5: Allow wayland or x11
  gtkmm3: Allow wayland or x11 in distro features
  gparted: Allow wayland or x11 distro features
  lirc: Delete systemd unit files on non systemd distros
  atkmm: Allow build with wayland
  pangomm: Allow building with wayland
  boinc-client: Make script install not depend on host install paths

Mingli Yu (2):
  crash: Upgrade to 8.0.0
  makedumpfile: Upgrade to 1.7.1

Robert Yang (1):
  libldb: Fix installed-vs-shipped and rebuild error

Willy Tu (1):
  absil-cpp: Update SRC_URI to to the latest google internal sync

wangmy (11):
  evince: upgrade 42.1 -> 42.2
  gspell: upgrade 1.9.1 -> 1.10.0
  gtksourceview5: upgrade 5.4.0 -> 5.4.1
  libadwaita: upgrade 1.1.0 -> 1.1.1
  nautilus: upgrade 42.0 -> 42.1.1
  htpdate: upgrade 1.3.3 -> 1.3.4
  hexedit: upgrade 1.5 -> 1.6
  lsscsi: upgrade 0.31 -> 0.32
  libencode-perl: upgrade 3.16 -> 3.17
  libextutils-cppguess-perl: upgrade 0.23 -> 0.26
  libtest-harness-perl: upgrade 3.42 -> 3.44

 .../recipes-extended/gparted/gparted_1.4.0.bb |  3 +-
 .../evince/{evince_42.1.bb => evince_42.2.bb} |  2 +-
 .../{gspell_1.9.1.bb => gspell_1.10.0.bb}     |  2 +-
 ...view5_5.4.0.bb => gtksourceview5_5.4.1.bb} |  4 +-
 ...ibadwaita_1.1.0.bb => libadwaita_1.1.1.bb} |  2 +-
 .../{nautilus_42.0.bb => nautilus_42.1.1.bb}  |  2 +-
 .../klcc-cross-accept-clang-options.patch     |  5 +-
 ...-to-enable-disable-legacy-RTKit-modu.patch | 44 -----------
 ...{pipewire_0.3.49.bb => pipewire_0.3.50.bb} |  6 +-
 .../recipes-connectivity/ufw/ufw_0.36.1.bb    |  7 ++
 .../arno-iptables-firewall_2.1.1.bb           |  2 +-
 .../{htpdate_1.3.3.bb => htpdate_1.3.4.bb}    |  2 +-
 .../recipes-support/libldb/libldb_2.3.3.bb    | 11 +++
 .../linux-atm/0001-make-Add-PREFIX-knob.patch | 31 ++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  7 +-
 .../recipes-connectivity/lirc/lirc_0.10.1.bb  | 13 +--
 meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb      |  2 -
 .../lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} |  3 +-
 .../abseil-cpp/abseil-ppc-fixes.patch         | 20 ++---
 .../abseil-cpp/abseil-cpp_git.bb              |  4 +-
 ...Do-not-check-for-files-on-build-host.patch | 52 ++++++++++++
 .../boinc/boinc-client_7.18.1.bb              | 17 ++--
 ...nit-install-location-with-SYSTEM_DIR.patch | 28 +++++++
 .../cross-build-init-system-detection.patch   |  4 +-
 .../fluentbit/fluentbit_1.3.5.bb              |  4 +-
 .../{hexedit_1.5.bb => hexedit_1.6.bb}        |  2 +-
 .../recipes-extended/mozjs/mozjs-91_91.8.0.bb |  2 +
 .../pam/pam-ssh-agent-auth_0.10.3.bb          |  2 +-
 .../recipes-gnome/atk/atkmm-2.36_2.36.1.bb    |  2 +-
 meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb     |  2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb   |  2 +-
 .../dietsplash/dietsplash_git.bb              |  2 +-
 .../recipes-graphics/pango/pangomm_2.46.2.bb  |  3 +-
 ...error-unknown-type-name-gdb_fpregset.patch | 36 ---------
 ...tect-the-sysroot-s-glibc-header-file.patch | 33 --------
 ...unrecognized-gcc-option-m32-for-mips.patch | 33 --------
 ...im-arange-fix-extern-inline-handling.patch | 79 -------------------
 ...m-ppc-drop-LIBS-from-psim-dependency.patch | 37 ---------
 .../crash/{crash_7.3.0.bb => crash_8.0.0.bb}  | 13 +--
 ...makedumpfile-replace-hardcode-CFLAGS.patch | 53 ++++++-------
 ...umpfile_1.7.0.bb => makedumpfile_1.7.1.bb} |  8 +-
 .../tomoyo-tools/tomoyo-tools_2.5.0.bb        |  3 +-
 meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb   |  6 +-
 ...de-perl_3.16.bb => libencode-perl_3.17.bb} |  2 +-
 ...3.bb => libextutils-cppguess-perl_0.26.bb} |  2 +-
 ...l_3.42.bb => libtest-harness-perl_3.44.bb} |  5 +-
 46 files changed, 231 insertions(+), 373 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_42.1.bb => evince_42.2.bb} (92%)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.9.1.bb => gspell_1.10.0.bb} (76%)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.0.bb => gtksourceview5_5.4.1.bb} (85%)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.0.bb => libadwaita_1.1.1.bb} (86%)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.0.bb => nautilus_42.1.1.bb} (92%)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.49.bb => pipewire_0.3.50.bb} (98%)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.3.3.bb => htpdate_1.3.4.bb} (92%)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} (70%)
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/0001-scripts-Do-not-check-for-files-on-build-host.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
 rename meta-oe/recipes-extended/hexedit/{hexedit_1.5.bb => hexedit_1.6.bb} (90%)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
 rename meta-oe/recipes-kernel/crash/{crash_7.3.0.bb => crash_8.0.0.bb} (87%)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.0.bb => makedumpfile_1.7.1.bb} (85%)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.16.bb => libencode-perl_3.17.bb} (97%)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.23.bb => libextutils-cppguess-perl_0.26.bb} (92%)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.42.bb => libtest-harness-perl_3.44.bb} (95%)

-- 
2.25.1


