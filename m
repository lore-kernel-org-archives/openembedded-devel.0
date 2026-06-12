Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF8ECD98CF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73405.1781278443082530219
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=REb7cpPG;
 spf=pass (domain: snapchat.com, ip: 209.85.128.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490be03d47bso11638965e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1781278441; x=1781883241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmvmamQAbbgHIf0CZYOklIcRuDKDAQ/eClVZa8zEkKc=;
        b=REb7cpPGzTG7RKK5bU8hM6kvaunr5fx5kRViNvY3LswbpswBch9gtRhdnP193mKeRd
         vC7rwXdBtve9mtDRVFLPtosKGYpeixNlpBtdl0/BUxC76CJbM8csYD+KQwUIZVC3G6uq
         IyGkGbcDScWu7mN7bbD5Up6/FjEDOY2SxH7jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278441; x=1781883241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GmvmamQAbbgHIf0CZYOklIcRuDKDAQ/eClVZa8zEkKc=;
        b=qjNUjlAuKllFjMhuKDbqXoBkNsDnu8eBF1bkEuULCWgwygr2pdCXCi/fakvfTGPHhv
         boNL1cAprovlRqxWM+VQ28QcpHYAYUYqTBNT4tMCUH6eq6El/XgsUAkzq4NFjN5yVmcE
         GZ2PVoljApe5vyiwlCWZRK7EpLmY2WftfbCbvySwkiWh5tTtNM6EI8zlzOmmqjTwhUgW
         w8PmUcDkJqe6cEQYf8sCnvy1wNFkbQ4A5EpqMxFKcq8nCUUcPWLIXegd103Pq6F9fi/I
         EnEf33MuIqPwqBBUfcJTa3ry0YqJmxK0yGWIxdz1z5Pl/QVaCYeKI6VZq7HTsy9zBw1P
         yj+Q==
X-Gm-Message-State: AOJu0Yy5oUU00xQeCLZaCWokCxJ1vqpGmjYNTEv9lxbd1NOdLFTDPPzT
	S4nqzC8uLqLBvY0GImEZGQLU/RL1jCaqeAFuWMdwYpfJWfnuIjoeA8wBQotyFstGhIidC1h619v
	kgdMXp4k=
X-Gm-Gg: Acq92OGtMXmmjKv7Zr5K/10+Zhx5Dgtg7PDkdsMEvbA8Y43fKEKpSzdFMPoscm5/ZX+
	zQt5WYHCewwEQHChfjGT9KulJAJSsxcpD+cGEDGtoUM9I5SzB6pe0/m3wBpKrOSR42GeY6Cua3J
	kybCR4ZTC90VVnLtY0a/bfaG3szofP6xHDCUhBsZd4/AMUDDWwF0+tcY4FnOxad7mXXLTPxjIe4
	n45y0CvEaAlBKePmkSTkdDlnLGonIgUkbuYxkaLa5mAFMIn+qsRHW/pWTnIOVYVUgNlx4cDOuRk
	QjyCDFcIBAs7/LfGzLFkLOWmjUZc8KTysoGM89GDamFl2ruNEJQvk9s7rymSz2bBEznVRKNMTPQ
	vAYlyETjEB7QA7swkWP8PMPJesLRsvCzErBZvPVExU4QhVHdgj4OuGfwarjFuycKOQRQXorz2Hq
	waUrX/7sVDZBEvx7ulkbDUVNdr/ijm31CpJIiz81jj7UTRb4DOpDpT4fM3pyiln6eth2E=
X-Received: by 2002:a7b:c310:0:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-490ec502182mr30937065e9.26.1781278438496;
        Fri, 12 Jun 2026 08:33:58 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f23fsm6790498f8f.9.2026.06.12.08.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:33:57 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Mihajlo Marinkovic <mmarinkovic@snap.com>
Subject: [meta-oe][PATCH 2/2] android-tools: upgrade 29.0.6.r14 -> 35.0.2
Date: Fri, 12 Jun 2026 17:33:39 +0200
Message-ID: <20260612153339.2514304-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612153339.2514304-1-ecordonnier@snap.com>
References: <20260612153339.2514304-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127542

From: Etienne Cordonnier <ecordonnier@snap.com>

Upgrade from 29.0.6.r14 to 35.0.2, switching to the Debian
android-platform-tools source package layout which ships Debian-maintained
make fragments and patch series under debian/system/.

The old recipe carried a hand-maintained patch stack on top of a
custom build system (rules_yocto.mk). The new recipe delegates to
Debian's make fragments and applies only the OE-specific patches needed
on top.

Notable upstream changes between 29.0.6 and 35.0.2 (see release notes at
https://developer.android.com/tools/releases/platform-tools):
- adb: libusb is now the default USB backend on Linux (35.0.0)
- adb: receive windowing for better throughput on high-latency links (33.0.3)
- adb: graceful USB interface release on shutdown (35.0.2)
- adb: wireless pairing and incremental APK installation support (30.0.0)
- adb: adb transport-id for safe scripted device waits (30.0.2)
- adb: fix shell exit code when device disconnects (35.0.0)
- fastboot: download speed improvements up to 980MB/s on SuperSpeed+ (35.0.0)

OE-specific changes:
- adbd now drops privileges to a dedicated "adb" system user (matching
  Android's production security model); use "adb root" to escalate
- adbd root/unroot/remount support added for non-Android targets
- android-gadget-setup updated to mount functionfs with uid/gid ownership
  so the unprivileged adbd can access the FunctionFS endpoints
- Depends on new android-libboringssl recipe for BoringSSL shared libraries
- android-tools-adbd.service uses Type=notify so systemd waits for adbd's
  sd_notify READY=1 before proceeding with ExecStartPost
- android-gadget-start now respects ANDROID_GADGET_UDC_DELAY (default 10s
  for non-systemd paths); the configfs drop-in sets it to 0 since adbd has
  already signalled readiness before ExecStartPost runs, eliminating the
  fixed delay on restart

Tested on Raspberry Pi 4B (MACHINE=raspberrypi4-64) with USB-C OTG port,
openembedded-core main branch, meta-openembedded master-next, kernel 6.12:
- adb devices: device enumerated as 18d1:d002
- adb shell: connection as unprivileged adb user
- adb root / adb unroot: privilege escalation and drop
- adb reboot: device reboot via adb
- adb forward: SSH tunnel through ADB verified
- oe-run-native android-tools-native adb / fastboot: native host tools build

Note: adbd only starts when /etc/usb-debugging-enabled exists on the target
(ConditionPathExists in the service file). This is intentional — ADB is
disabled by default for security. Create the file at image build time or
at runtime to enable it.

Requires kernel config for USB gadget support (e.g. via a .cfg fragment):
  CONFIG_USB_DWC2_DUAL_ROLE=y
  CONFIG_USB_GADGET=y
  CONFIG_USB_CONFIGFS=y
  CONFIG_USB_F_FS=y
  CONFIG_USB_CONFIGFS_F_FS=y

Requires in local.conf for RPi4:
  RPI_EXTRA_CONFIG = "dtoverlay=dwc2,dr_mode=peripheral"

AI-Generated: Uses GitHub Copilot (Claude Sonnet 4.6)

Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
Co-authored-by: Etienne Cordonnier <ecordonnier@snap.com>
Tested-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../10-adbd-configfs.conf                     |   3 +
 .../android-gadget-setup                      |   4 +-
 .../android-gadget-start                      |   9 +-
 .../0001-Fixes-for-yocto-build.patch          | 164 -----
 ...cktrace.mk-Link-against-staged-lib7z.patch |  38 +
 .../0001-liblp-fix-building-with-GCC-14.patch |  26 -
 ...difications-to-make-it-build-in-yoct.patch | 453 ------------
 .../0002-debian-makefiles-yocto-compat.patch  | 240 +++++++
 ...usbdevfs_urb-to-match-new-kernel-UAP.patch | 128 ----
 ...ability-and-thread-annotation-compat.patch |  34 +
 ...-adb-Fix-build-on-big-endian-systems.patch |  50 --
 ...t-super_flash_helper-include-climits.patch |  41 ++
 ...005-adb-Allow-adbd-to-be-run-as-root.patch |  25 -
 .../0005-adb-host-usb-compat.patch            |  34 +
 ...adbd-enable-root-and-remount-support.patch | 466 +++++++++++++
 ...Android-private-header-with-addition.patch |  36 +
 ...ility-fixes-for-usb_linux-and-sysdep.patch | 197 ++++++
 ...-libbase-include-stdint.h-in-hex.cpp.patch |  26 +
 ...d_notify-conditional-on-HAVE_SYSTEMD.patch |  54 ++
 .../android-tools/android-tools/adbd.mk       |  90 ---
 .../android-tools/android-tools-adbd.service  |   2 +-
 .../debian/Add-riscv64-support.patch          | 653 ------------------
 .../debian/Added-missing-headers.patch        |  46 --
 .../android-tools/debian/Nonnull.patch        |  22 -
 .../android-tools/debian/Vector-cast.patch    |  16 -
 .../debian/add-missing-headers.patch          |  43 --
 ...eb-adbd-adbd-allow-notifying-systemd.patch |  41 ++
 .../deb-adbd-adbd-allow-usb-on-linux.patch    |  28 +
 ...don-t-require-authorization-on-Linux.patch |  27 +
 ...-adbd-adbd-usb-drop-property-monitor.patch |  57 ++
 .../android-tools/debian/deb-dev-typos.patch  |  16 +
 .../debian/deb-gcc-Nullable.patch             |  14 +
 ...tdatomic.patch => deb-gcc-stdatomic.patch} |  44 +-
 ...eb-gcc-workaround__builtin_available.patch | 148 ++++
 .../deb-sys-Added-missing-headers.patch       |  15 +
 ...s-Drop-gki-dependency-from-mkbootimg.patch | 114 +++
 ...ys-Implement-const_iterator-operator.patch |  37 +
 .../debian/deb-sys-add-missing-headers.patch  |  13 +
 .../deb-sys-hard-code-build-number.patch      |  57 ++
 ...patch => deb-sys-libusb-header-path.patch} |  11 +-
 ...deb-sys-move-log-file-to-proper-dir.patch} |   9 +-
 .../debian/deb-sys-stub-out-fastdeploy.patch  |  99 +++
 ...b-sys-throw-exception-on-unknown-os.patch} |  13 +-
 .../debian/deb-sys-unwindstack-porting.patch  |  14 +
 .../20150704-CVE-2015-3239_dwarf_i.h.patch    |  15 -
 .../legacy_built-in_sync_functions.patch      |  28 -
 ...nd-fix-strchr-conformance-to-ISO-C23.patch |  27 -
 ...unreachable-macro-to-avoid-redefinit.patch |  42 --
 .../external/libunwind/user_pt_regs.patch     |  26 -
 .../debian/fix-attribute-issue-with-gcc.patch |  19 -
 .../debian/fix-build-on-non-x86.patch         |  26 -
 .../fix-gettid-exception-declaration.patch    |  26 -
 .../fix-standard-namespace-errors.patch       |  24 -
 .../debian/hard-code-build-number.patch       |  46 --
 .../debian/simg_dump-python3.patch            |  64 --
 .../debian/stub-out-fastdeploy.patch          |  95 ---
 .../system/core/Add-riscv64-support.patch     | 653 ------------------
 .../system/core/Added-missing-headers.patch   |  46 --
 .../debian/system/core/Nonnull.patch          |  22 -
 .../debian/system/core/Vector-cast.patch      |  16 -
 .../system/core/add-missing-headers.patch     |  43 --
 ...ope-write-macro-to-prevent-conflict-.patch |  52 --
 .../core/fix-attribute-issue-with-gcc.patch   |  19 -
 .../system/core/fix-build-on-non-x86.patch    |  26 -
 .../fix-gettid-exception-declaration.patch    |  26 -
 .../core/fix-standard-namespace-errors.patch  |  24 -
 .../system/core/hard-code-build-number.patch  |  46 --
 .../system/core/libusb-header-path.patch      |  18 -
 ...x-missing-fixed-width-integer-types-.patch |  38 -
 .../core/move-log-file-to-proper-dir.patch    |  20 -
 .../system/core/simg_dump-python3.patch       |  64 --
 .../debian/system/core/stdatomic.patch        |  66 --
 .../system/core/stub-out-fastdeploy.patch     |  95 ---
 .../throw-exception-on-unknown-os.patch       |  18 -
 .../android-tools/android-tools/remount       |   2 -
 .../android-tools/rules_yocto.mk              |   1 -
 .../android-tools/android-tools_29.0.6.r14.bb | 196 ------
 .../android-tools/android-tools_35.0.2.bb     | 237 +++++++
 78 files changed, 2136 insertions(+), 3687 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0001-libbacktrace.mk-Link-against-staged-lib7z.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0002-debian-makefiles-yocto-compat.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0003-gcc-nullability-and-thread-annotation-compat.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0004-fastboot-super_flash_helper-include-climits.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-host-usb-compat.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0006-adbd-enable-root-and-remount-support.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0007-libcutils-guard-Android-private-header-with-addition.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0008-adb-GCC-compatibility-fixes-for-usb_linux-and-sysdep.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0009-libbase-include-stdint.h-in-hex.cpp.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/Add-riscv64-support.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/Added-missing-headers.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/Nonnull.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/Vector-cast.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/add-missing-headers.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-allow-notifying-systemd.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-allow-usb-on-linux.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-don-t-require-authorization-on-Linux.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-usb-drop-property-monitor.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-dev-typos.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-Nullable.patch
 rename meta-oe/recipes-devtools/android-tools/android-tools/debian/{stdatomic.patch => deb-gcc-stdatomic.patch} (89%)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-workaround__builtin_available.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Added-missing-headers.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Drop-gki-dependency-from-mkbootimg.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Implement-const_iterator-operator.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-add-missing-headers.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-hard-code-build-number.patch
 rename meta-oe/recipes-devtools/android-tools/android-tools/debian/{libusb-header-path.patch => deb-sys-libusb-header-path.patch} (62%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/debian/{move-log-file-to-proper-dir.patch => deb-sys-move-log-file-to-proper-dir.patch} (77%)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-stub-out-fastdeploy.patch
 rename meta-oe/recipes-devtools/android-tools/android-tools/debian/{system/core/throw-exception-on-unknown-os.patch => deb-sys-throw-exception-on-unknown-os.patch} (64%)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-unwindstack-porting.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-build-on-non-x86.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/hard-code-build-number.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/simg_dump-python3.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/stub-out-fastdeploy.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Nonnull.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Vector-cast.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/add-missing-headers.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libusb-header-path.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stdatomic.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/remount
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
index ddf155a907..7971f319c3 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
@@ -1,4 +1,7 @@
 [Service]
+# adbd uses sd_notify to signal readiness; ExecStartPost runs only after
+# READY=1 is sent, so no delay is needed before activating the UDC.
+Environment=ANDROID_GADGET_UDC_DELAY=0
 ExecStartPre=/usr/bin/android-gadget-setup
 ExecStartPost=/usr/bin/android-gadget-start
 ExecStopPost=/usr/bin/android-gadget-cleanup
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
index 47e4edb9be..2744d1e98e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
@@ -35,4 +35,6 @@ echo "$conf" > configs/c.1/strings/0x409/configuration
 ln -s functions/ffs.usb0 configs/c.1
 
 mkdir -p /dev/usb-ffs/adb
-mount -t functionfs usb0 /dev/usb-ffs/adb
+ADB_UID=$(id -u adb)
+ADB_GID=$(id -g adb)
+mount -t functionfs usb0 /dev/usb-ffs/adb -o "uid=$ADB_UID,gid=$ADB_GID"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
index 76b5e29624..4ea688accb 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
@@ -2,7 +2,14 @@
 
 set -e
 
-sleep 10
+# Wait for adbd to open ep0 before activating the UDC. Without systemd
+# sd_notify synchronisation there is no other signal that adbd is ready, so
+# a fixed delay is used. When this script is invoked via ExecStartPost in a
+# Type=notify service, adbd has already sent READY=1 before this runs and
+# no delay is needed; set ANDROID_GADGET_UDC_DELAY=0 in that case (e.g. via
+# a systemd drop-in Environment= line).
+ANDROID_GADGET_UDC_DELAY="${ANDROID_GADGET_UDC_DELAY:-10}"
+sleep "$ANDROID_GADGET_UDC_DELAY"
 
 ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/usb_gadget/adb/UDC
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-Fixes-for-yocto-build.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
deleted file mode 100644
index 1d18d47ec3..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 5de85f8273c7284aa93e35c40f025d4d43d42df9 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Thu, 16 Mar 2023 18:59:35 +0100
-Subject: [PATCH] Fixes for yocto build
-
-Signed-off-by: JJ Robertson <jrobertson@snapchat.com>
-[rebased on version 29]
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
-
----
-Upstream-Status: Pending
-
- system/core/adb/daemon/file_sync_service.cpp | 4 ++--
- system/core/adb/daemon/framebuffer_service.h | 2 --
- system/core/adb/daemon/main.cpp              | 5 +++--
- system/core/adb/daemon/restart_service.h     | 2 --
- system/core/adb/daemon/services.cpp          | 6 ++----
- system/core/adb/daemon/shell_service.cpp     | 5 ++++-
- system/core/adb/types.h                      | 1 +
- 7 files changed, 12 insertions(+), 13 deletions(-)
-
-diff --git a/system/core/adb/daemon/file_sync_service.cpp b/system/core/adb/daemon/file_sync_service.cpp
-index d6af7087..92e7087a 100644
---- a/system/core/adb/daemon/file_sync_service.cpp
-+++ b/system/core/adb/daemon/file_sync_service.cpp
-@@ -111,7 +111,7 @@ static bool secure_mkdirs(const std::string& path) {
-         partial_path += path_component;
- 
-         if (should_use_fs_config(partial_path)) {
--            fs_config(partial_path.c_str(), 1, nullptr, &uid, &gid, &mode, &capabilities);
-+            // fs_config(partial_path.c_str(), 1, nullptr, &uid, &gid, &mode, &capabilities);
-         }
-         if (adb_mkdir(partial_path.c_str(), mode) == -1) {
-             if (errno != EEXIST) {
-@@ -469,7 +469,7 @@ static bool do_send(int s, const std::string& spec, std::vector<char>& buffer) {
-         uint64_t capabilities = 0;
-         if (should_use_fs_config(path)) {
-             unsigned int broken_api_hack = mode;
--            fs_config(path.c_str(), 0, nullptr, &uid, &gid, &broken_api_hack, &capabilities);
-+            // fs_config(path.c_str(), 0, nullptr, &uid, &gid, &broken_api_hack, &capabilities);
-             mode = broken_api_hack;
-         }
- 
-diff --git a/system/core/adb/daemon/framebuffer_service.h b/system/core/adb/daemon/framebuffer_service.h
-index bab44be3..264da597 100644
---- a/system/core/adb/daemon/framebuffer_service.h
-+++ b/system/core/adb/daemon/framebuffer_service.h
-@@ -18,6 +18,4 @@
- 
- #include "adb_unique_fd.h"
- 
--#if defined(__ANDROID__)
- void framebuffer_service(unique_fd fd);
--#endif
-diff --git a/system/core/adb/daemon/main.cpp b/system/core/adb/daemon/main.cpp
-index 3322574c..e807d13d 100644
---- a/system/core/adb/daemon/main.cpp
-+++ b/system/core/adb/daemon/main.cpp
-@@ -208,6 +208,9 @@ int adbd_main(int server_port) {
-     umask(0);
- 
-     signal(SIGPIPE, SIG_IGN);
-+    signal(SIGINT, SIG_DFL);
-+    signal(SIGQUIT, SIG_DFL);
-+
- 
- #if defined(__BIONIC__)
-     auto fdsan_level = android_fdsan_get_error_level();
-@@ -254,13 +257,11 @@ int adbd_main(int server_port) {
- 
-     bool is_usb = false;
- 
--#if defined(__ANDROID__)
-     if (access(USB_FFS_ADB_EP0, F_OK) == 0) {
-         // Listen on USB.
-         usb_init();
-         is_usb = true;
-     }
--#endif
- 
-     // If one of these properties is set, also listen on that port.
-     // If one of the properties isn't set and we couldn't listen on usb, listen
-diff --git a/system/core/adb/daemon/restart_service.h b/system/core/adb/daemon/restart_service.h
-index 19840bd5..7a97614b 100644
---- a/system/core/adb/daemon/restart_service.h
-+++ b/system/core/adb/daemon/restart_service.h
-@@ -18,9 +18,7 @@
- 
- #include "adb_unique_fd.h"
- 
--#if defined(__ANDROID__)
- void restart_root_service(unique_fd fd);
- void restart_unroot_service(unique_fd fd);
- void restart_tcp_service(unique_fd fd, int port);
- void restart_usb_service(unique_fd fd);
--#endif
-diff --git a/system/core/adb/daemon/services.cpp b/system/core/adb/daemon/services.cpp
-index 4ec90d27..d8541c23 100644
---- a/system/core/adb/daemon/services.cpp
-+++ b/system/core/adb/daemon/services.cpp
-@@ -156,7 +156,7 @@ static void spin_service(unique_fd fd) {
-     }
- #endif
-     // Fall through
--    std::string cmd = "/system/bin/reboot ";
-+    std::string cmd = "/sbin/reboot ";
-     cmd += name;
-     return StartSubprocess(cmd, nullptr, SubprocessType::kRaw, SubprocessProtocol::kNone);
- }
-@@ -265,11 +265,10 @@ unique_fd daemon_service_to_fd(std::string_view name, atransport* transport) {
-     }
- #endif
- 
--#if defined(__ANDROID__)
-     if (name.starts_with("framebuffer:")) {
-         return create_service_thread("fb", framebuffer_service);
-     } else if (android::base::ConsumePrefix(&name, "remount:")) {
--        std::string cmd = "/system/bin/remount ";
-+        std::string cmd = "/sbin/remount ";
-         cmd += name;
-         return StartSubprocess(cmd, nullptr, SubprocessType::kRaw, SubprocessProtocol::kNone);
-     } else if (android::base::ConsumePrefix(&name, "reboot:")) {
-@@ -303,7 +302,6 @@ unique_fd daemon_service_to_fd(std::string_view name, atransport* transport) {
-     } else if (name.starts_with("usb:")) {
-         return create_service_thread("usb", restart_usb_service);
-     }
--#endif
- 
-     if (android::base::ConsumePrefix(&name, "dev:")) {
-         return unique_fd{unix_open(name, O_RDWR | O_CLOEXEC)};
-diff --git a/system/core/adb/daemon/shell_service.cpp b/system/core/adb/daemon/shell_service.cpp
-index f62032d0..ebcfe18d 100644
---- a/system/core/adb/daemon/shell_service.cpp
-+++ b/system/core/adb/daemon/shell_service.cpp
-@@ -273,13 +273,16 @@ bool Subprocess::ForkAndExec(std::string* error) {
-         env["HOSTNAME"] = GetHostName();
-         env["LOGNAME"] = pw->pw_name;
-         env["SHELL"] = pw->pw_shell;
--        env["TMPDIR"] = "/data/local/tmp";
-         env["USER"] = pw->pw_name;
-     }
- 
-     if (!terminal_type_.empty()) {
-         env["TERM"] = terminal_type_;
-     }
-+    if (env.find("PS1") == env.end()) {
-+        env["PS1"] = "\\h:\\w\\$ ";
-+    }
-+
- 
-     std::vector<std::string> joined_env;
-     for (const auto& it : env) {
-diff --git a/system/core/adb/types.h b/system/core/adb/types.h
-index c619fffc..f8e0f521 100644
---- a/system/core/adb/types.h
-+++ b/system/core/adb/types.h
-@@ -22,6 +22,7 @@
- #include <memory>
- #include <utility>
- #include <vector>
-+#include <string.h>
- 
- #include <android-base/logging.h>
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-libbacktrace.mk-Link-against-staged-lib7z.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-libbacktrace.mk-Link-against-staged-lib7z.patch
new file mode 100644
index 0000000000..845e267c41
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0001-libbacktrace.mk-Link-against-staged-lib7z.patch
@@ -0,0 +1,38 @@
+From 1eab8bc4974c887c09d6b444c5198ec4c0932b36 Mon Sep 17 00:00:00 2001
+From: Mihajlo Marinkovic <mmarinkovic@snap.com>
+Date: Fri, 8 May 2026 12:10:00 +0000
+Subject: [PATCH] libbacktrace.mk: Link against staged lib7z
+
+In the Yocto target sysroot, p7zip installs `lib7z.so` under `/usr/lib`.
+The Debian make fragment hardcodes `/usr/lib/7zip` and links `-l:7z.so`,
+which does not exist in this environment and causes link failure.
+
+Use the standard sysroot library search path and link against `-l7z`
+instead.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
+---
+ debian/system/libbacktrace.mk | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/debian/system/libbacktrace.mk b/debian/system/libbacktrace.mk
+index b106c24..0f798d4 100644
+--- a/debian/system/libbacktrace.mk
++++ b/debian/system/libbacktrace.mk
+@@ -64,13 +64,11 @@ CPPFLAGS += \
+   -Isystem/unwinding/libunwindstack/include \
+ 
+ LDFLAGS += \
+-  -L/usr/lib/7zip \
+   -Ldebian/out/external \
+   -Ldebian/out/system \
+   -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-  -Wl,-rpath=/usr/lib/7zip \
+   -Wl,-soname,$(NAME).so.0 \
+-  -l:7z.so \
++  -l7z \
+   -lbase \
+   -llog \
+   -lpthread \
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
deleted file mode 100644
index ccd289c81b..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 9f4d839847666019cadf57aa34fd366801c11a44 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Date: Fri, 24 May 2024 14:13:35 +0300
-Subject: [PATCH] liblp: fix building with GCC 14
-
-Upstream-Status: Pending
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
----
- system/core/fs_mgr/liblp/utility.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/system/core/fs_mgr/liblp/utility.cpp b/system/core/fs_mgr/liblp/utility.cpp
-index 48c5c8318d99..0aa8023aa87d 100644
---- a/system/core/fs_mgr/liblp/utility.cpp
-+++ b/system/core/fs_mgr/liblp/utility.cpp
-@@ -24,6 +24,7 @@
- #include <sys/ioctl.h>
- #endif
- 
-+#include <algorithm>
- #include <map>
- #include <string>
- #include <vector>
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
deleted file mode 100644
index a35428b5b4..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
+++ /dev/null
@@ -1,453 +0,0 @@
-From 194513bababa9707ec54bc7119613a0d5eca9f79 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Fri, 17 Mar 2023 10:33:11 +0100
-Subject: [PATCH] android-tools: modifications to make it build in yocto
-
-- Fix relocation errors on aarch64, e.g.:
-"relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZTV19SparseFileBufSource' which may bind externally can not be used when making a shared object; recompile with -fPIC"
-
-- use ln -f to avoid error "File exists" on incremental builds
-
-- fix missing headers
-
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
-
-- fix warning: library search path "/usr/lib/p7zip" is unsafe for cross-compilation
-
-- fix error: include location "/usr/include/android" is unsafe for cross-compilation
-
-Upstream-Status: Pending
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- debian/development/etc1tool.mk                 |  1 -
- debian/external/boringssl/libcrypto.mk         |  1 +
- debian/libnativehelper/libnativehelper.mk      |  1 -
- debian/system/core/adb.mk                      |  1 -
- debian/system/core/append2simg.mk              |  2 +-
- debian/system/core/fastboot.mk                 |  3 +--
- debian/system/core/img2simg.mk                 |  2 +-
- debian/system/core/libbacktrace.mk             | 10 ++++------
- debian/system/core/libbase.mk                  |  5 +++--
- debian/system/core/libcutils.mk                |  5 +++--
- debian/system/core/liblog.mk                   |  3 ++-
- debian/system/core/libsparse.mk                |  5 +++--
- debian/system/core/libutils.mk                 |  4 ++--
- debian/system/core/libziparchive.mk            |  5 +++--
- debian/system/core/simg2img.mk                 |  2 +-
- debian/system/core/simg2simg.mk                |  2 +-
- debian/system/extras/libext4_utils.mk          |  1 -
- frameworks/native/libs/adbd_auth/adbd_auth.cpp |  2 ++
- system/core/adb/adb_listeners.cpp              | 12 ++++++------
- system/core/adb/transport_local.cpp            |  2 +-
- 20 files changed, 35 insertions(+), 34 deletions(-)
-
-diff --git a/debian/development/etc1tool.mk b/debian/development/etc1tool.mk
-index 2d787e98bb86..e03ac5f0048c 100644
---- a/debian/development/etc1tool.mk
-+++ b/debian/development/etc1tool.mk
-@@ -4,7 +4,6 @@ SOURCES = development/tools/etc1tool/etc1tool.cpp
- 
- CXXFLAGS += -std=gnu++2a
- CPPFLAGS += \
--  -I/usr/include/android \
-   -Idevelopment/include \
-   -Iframeworks/native/opengl/include \
- 
-diff --git a/debian/external/boringssl/libcrypto.mk b/debian/external/boringssl/libcrypto.mk
-index c0ea54f4..b3a77bfd 100644
---- a/debian/external/boringssl/libcrypto.mk
-+++ b/debian/external/boringssl/libcrypto.mk
-@@ -27,6 +27,7 @@ CPPFLAGS += \
-   -DBORINGSSL_IMPLEMENTATION \
-   -DBORINGSSL_SHARED_LIBRARY \
-   -DOPENSSL_SMALL \
-+  -DOPENSSL_NO_ASM \
-   -Iexternal/boringssl/src/crypto \
-   -Iexternal/boringssl/src/include \
- 
-diff --git a/debian/libnativehelper/libnativehelper.mk b/debian/libnativehelper/libnativehelper.mk
-index 7a0c94a6b7b5..880b2fdf9154 100644
---- a/debian/libnativehelper/libnativehelper.mk
-+++ b/debian/libnativehelper/libnativehelper.mk
-@@ -11,7 +11,6 @@ OBJECTS = $(SOURCES:.cpp=.o)
- 
- CXXFLAGS += -std=gnu++2a
- CPPFLAGS += \
--  -I/usr/include/android \
-   -Ilibnativehelper/header_only_include \
-   -Ilibnativehelper/include \
-   -Ilibnativehelper/include_jni \
-diff --git a/debian/system/core/adb.mk b/debian/system/core/adb.mk
-index 9769b68ab793..58c9a63bd225 100644
---- a/debian/system/core/adb.mk
-+++ b/debian/system/core/adb.mk
-@@ -19,7 +19,6 @@ CPPFLAGS += \
-   -D_GNU_SOURCE \
-   -DADB_HOST=1 \
-   -DADB_VERSION='"$(DEB_VERSION)"' \
--  -I/usr/include/android \
-   -Iexternal/boringssl/include \
-   -Isystem/core/adb \
-   -Isystem/core/base/include \
-@@ -28,7 +27,6 @@ CPPFLAGS += \
- LDFLAGS += \
-   -Ldebian/out/system/core \
-   -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
--  -fuse-ld=gold \
-   -lbase \
-   -lcutils \
-   -lpthread \
-diff --git a/debian/system/core/append2simg.mk b/debian/system/core/append2simg.mk
-index 1599bdb8..598c751d 100644
---- a/debian/system/core/append2simg.mk
-+++ b/debian/system/core/append2simg.mk
-@@ -11,7 +11,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN/../lib/android' \
-   -lbase \
-   -llog \
-   -lpthread \
-diff --git a/debian/system/core/fastboot.mk b/debian/system/core/fastboot.mk
-index d5c9a285..a59ba1a4 100644
---- a/debian/system/core/fastboot.mk
-+++ b/debian/system/core/fastboot.mk
-@@ -30,7 +30,6 @@ CXXFLAGS += -std=gnu++2a -fpermissive
- CPPFLAGS += \
-    -D_FILE_OFFSET_BITS=64 \
-    -DPLATFORM_TOOLS_VERSION='"$(PLATFORM_TOOLS_VERSION)"' \
--   -I/usr/include/android \
-    -Iexternal/boringssl/include \
-    -Iexternal/avb \
-    -Isystem/core/adb \
-@@ -49,8 +48,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
--  -fuse-ld=gold \
-+  -Wl,-rpath='$$ORIGIN/../lib/android' \
-   -lbase \
-   -lcutils \
-   -lpthread \
-diff --git a/debian/system/core/img2simg.mk b/debian/system/core/img2simg.mk
-index 11adf014..8baf5ba5 100644
---- a/debian/system/core/img2simg.mk
-+++ b/debian/system/core/img2simg.mk
-@@ -11,7 +11,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN/../lib/android' \
-   -lbase \
-   -llog \
-   -lpthread \
-diff --git a/debian/system/core/libbacktrace.mk b/debian/system/core/libbacktrace.mk
-index e3411d76..e7dd984c 100644
---- a/debian/system/core/libbacktrace.mk
-+++ b/debian/system/core/libbacktrace.mk
-@@ -1,4 +1,4 @@
--include /usr/share/dpkg/architecture.mk
-+include rules_yocto.mk
- 
- NAME = libbacktrace
- 
-@@ -81,12 +81,10 @@ CPPFLAGS += \
-   -Isystem/core/libunwindstack/include \
- 
- LDFLAGS += \
--  -L/usr/lib/p7zip \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/p7zip \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN' \
-   -Wl,-soname,$(NAME).so.0 \
--  -l:7z.so \
-+  -l7z \
-   -lbase \
-   -llog \
-   -lpthread \
-@@ -101,7 +99,7 @@ endif
- build: $(OBJECTS_CXX) $(OBJECTS_ASSEMBLY) debian/out/external/libunwind/libunwind.a
- 	mkdir -p debian/out/system/core
- 	$(CXX) $^ -o debian/out/system/core/$(NAME).so.0 $(LDFLAGS)
--	cd debian/out/system/core && ln -s $(NAME).so.0 $(NAME).so
-+	cd debian/out/system/core && ln -sf $(NAME).so.0 $(NAME).so
- 
- $(OBJECTS_CXX): %.o: %.cpp
- 	$(CXX) -c -o $@ $< $(CXXFLAGS) $(CPPFLAGS)
-diff --git a/debian/system/core/libbase.mk b/debian/system/core/libbase.mk
-index d2b074ba..8a90d6de 100644
---- a/debian/system/core/libbase.mk
-+++ b/debian/system/core/libbase.mk
-@@ -1,3 +1,4 @@
-+include rules_yocto.mk
- NAME = libbase
- 
- SOURCES = \
-@@ -30,7 +31,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN' \
-   -Wl,-soname,$(NAME).so.0 \
-   -llog \
-   -lpthread \
-@@ -44,7 +45,7 @@ endif
- 
- build: $(OBJECTS)
- 	$(CXX) $^ -o debian/out/system/core/$(NAME).so.0 $(LDFLAGS)
--	cd debian/out/system/core && ln -s $(NAME).so.0 $(NAME).so
-+	cd debian/out/system/core && ln -sf $(NAME).so.0 $(NAME).so
- 
- $(OBJECTS): %.o: %.cpp
- 	$(CXX) -c -o $@ $< $(CXXFLAGS) $(CPPFLAGS)
-diff --git a/debian/system/core/libcutils.mk b/debian/system/core/libcutils.mk
-index 9d928b56..c22b0965 100644
---- a/debian/system/core/libcutils.mk
-+++ b/debian/system/core/libcutils.mk
-@@ -1,3 +1,4 @@
-+include rules_yocto.mk
- NAME = libcutils
- 
- libcutils_nonwindows_sources = \
-@@ -47,7 +48,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN' \
-   -Wl,-soname,$(NAME).so.0 \
-   -lbase \
-   -llog \
-@@ -56,7 +57,7 @@ LDFLAGS += \
- 
- build: $(OBJECTS_C) $(OBJECTS_CXX)
- 	$(CXX) $^ -o debian/out/system/core/$(NAME).so.0 $(LDFLAGS)
--	cd debian/out/system/core && ln -s $(NAME).so.0 $(NAME).so
-+	cd debian/out/system/core && ln -sf $(NAME).so.0 $(NAME).so
- 
- $(OBJECTS_C): %.o: %.c
- 	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)
-diff --git a/debian/system/core/liblog.mk b/debian/system/core/liblog.mk
-index f8c3d7fe..34a07341 100644
---- a/debian/system/core/liblog.mk
-+++ b/debian/system/core/liblog.mk
-@@ -1,3 +1,4 @@
-+include rules_yocto.mk
- NAME = liblog
- 
- liblog_sources = \
-@@ -35,7 +36,7 @@ LDFLAGS += \
- build: $(OBJECTS)
- 	mkdir -p debian/out/system/core
- 	$(CXX) $^ -o debian/out/system/core/$(NAME).so.0 $(LDFLAGS)
--	cd debian/out/system/core && ln -s $(NAME).so.0 $(NAME).so
-+	cd debian/out/system/core && ln -sf $(NAME).so.0 $(NAME).so
- 
- $(OBJECTS): %.o: %.cpp
- 	$(CXX) -c -o $@ $< $(CXXFLAGS) $(CPPFLAGS)
-diff --git a/debian/system/core/libsparse.mk b/debian/system/core/libsparse.mk
-index c2b2694c..2da12b8e 100644
---- a/debian/system/core/libsparse.mk
-+++ b/debian/system/core/libsparse.mk
-@@ -1,3 +1,4 @@
-+include rules_yocto.mk
- NAME = libsparse
- 
- SOURCES = \
-@@ -19,7 +20,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN' \
-   -Wl,-soname,$(NAME).so.0 \
-   -lbase \
-   -lz \
-@@ -27,7 +28,7 @@ LDFLAGS += \
- 
- build: $(OBJECTS)
- 	$(CXX) $^ -o debian/out/system/core/$(NAME).so.0 $(LDFLAGS)
--	cd debian/out/system/core && ln -s $(NAME).so.0 $(NAME).so
-+	cd debian/out/system/core && ln -sf $(NAME).so.0 $(NAME).so
- 
- $(OBJECTS): %.o: %.cpp
- 	$(CXX) -c -o $@ $< $(CXXFLAGS) $(CPPFLAGS)
-diff --git a/debian/system/core/libutils.mk b/debian/system/core/libutils.mk
-index c37b1d2d..0c748c8b 100644
---- a/debian/system/core/libutils.mk
-+++ b/debian/system/core/libutils.mk
-@@ -1,4 +1,4 @@
--include /usr/share/dpkg/architecture.mk
-+include rules_yocto.mk
- 
- NAME = libutils
- 
-@@ -41,7 +41,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN' \
-   -Wl,-soname,$(NAME).so.0 \
-   -lbacktrace \
-   -lcutils \
-diff --git a/debian/system/core/libziparchive.mk b/debian/system/core/libziparchive.mk
-index 1b286b4e..1b7499be 100644
---- a/debian/system/core/libziparchive.mk
-+++ b/debian/system/core/libziparchive.mk
-@@ -1,3 +1,4 @@
-+include rules_yocto.mk
- NAME = libziparchive
- 
- SOURCES = \
-@@ -19,7 +20,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN' \
-   -Wl,-soname,$(NAME).so.0 \
-   -lbase \
-   -llog \
-@@ -29,7 +30,7 @@ LDFLAGS += \
- 
- build: $(OBJECTS)
- 	$(CXX) $^ -o debian/out/system/core/$(NAME).so.0 $(LDFLAGS)
--	cd debian/out/system/core && ln -s $(NAME).so.0 $(NAME).so
-+	cd debian/out/system/core && ln -sf $(NAME).so.0 $(NAME).so
- 
- $(OBJECTS): %.o: %.cc
- 	$(CXX) -c -o $@ $< $(CXXFLAGS) $(CPPFLAGS)
-diff --git a/debian/system/core/simg2img.mk b/debian/system/core/simg2img.mk
-index f6e3f59d..df4f44f3 100644
---- a/debian/system/core/simg2img.mk
-+++ b/debian/system/core/simg2img.mk
-@@ -13,7 +13,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN/../lib/android' \
-   -lbase \
-   -llog \
-   -lpthread \
-diff --git a/debian/system/core/simg2simg.mk b/debian/system/core/simg2simg.mk
-index ed53b04c..646ab030 100644
---- a/debian/system/core/simg2simg.mk
-+++ b/debian/system/core/simg2simg.mk
-@@ -13,7 +13,7 @@ CPPFLAGS += \
- 
- LDFLAGS += \
-   -Ldebian/out/system/core \
--  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
-+  -Wl,-rpath='$$ORIGIN/../lib/android' \
-   -lbase \
-   -llog \
-   -lpthread \
-diff --git a/debian/system/extras/libext4_utils.mk b/debian/system/extras/libext4_utils.mk
-index 264bb95ad36a..99125097c8e3 100644
---- a/debian/system/extras/libext4_utils.mk
-+++ b/debian/system/extras/libext4_utils.mk
-@@ -25,7 +25,6 @@ CPPFLAGS += \
-   -D_LARGEFILE64_SOURCE \
-   -DFEC_NO_KLOG \
-   -DSQUASHFS_NO_KLOG \
--  -I/usr/include/android \
-   -Isystem/core/base/include \
-   -Isystem/core/libcutils/include \
-   -Isystem/core/libsparse/include \
-diff --git a/frameworks/native/libs/adbd_auth/adbd_auth.cpp b/frameworks/native/libs/adbd_auth/adbd_auth.cpp
-index a9c23110..6ca334ba 100644
---- a/frameworks/native/libs/adbd_auth/adbd_auth.cpp
-+++ b/frameworks/native/libs/adbd_auth/adbd_auth.cpp
-@@ -23,8 +23,10 @@
- #include <sys/eventfd.h>
- #include <sys/uio.h>
- 
-+#include <atomic>
- #include <chrono>
- #include <deque>
-+#include <optional>
- #include <string>
- #include <string_view>
- #include <tuple>
-diff --git a/system/core/adb/adb_listeners.cpp b/system/core/adb/adb_listeners.cpp
-index 29909a55..440cdbd4 100644
---- a/system/core/adb/adb_listeners.cpp
-+++ b/system/core/adb/adb_listeners.cpp
-@@ -109,7 +109,7 @@ static void listener_event_func(int _fd, unsigned ev, void* _l)
- }
- 
- // Called as a transport disconnect function. |arg| is the raw alistener*.
--static void listener_disconnect(void* arg, atransport*) EXCLUDES(listener_list_mutex) {
-+static void listener_disconnect(void* arg, atransport*) {
-     std::lock_guard<std::mutex> lock(listener_list_mutex);
-     for (auto iter = listener_list.begin(); iter != listener_list.end(); ++iter) {
-         if (iter->get() == arg) {
-@@ -121,7 +121,7 @@ static void listener_disconnect(void* arg, atransport*) EXCLUDES(listener_list_m
- }
- 
- // Write the list of current listeners (network redirections) into a string.
--std::string format_listeners() EXCLUDES(listener_list_mutex) {
-+std::string format_listeners() {
-     std::lock_guard<std::mutex> lock(listener_list_mutex);
-     std::string result;
-     for (auto& l : listener_list) {
-@@ -140,7 +140,7 @@ std::string format_listeners() EXCLUDES(listener_list_mutex) {
- }
- 
- InstallStatus remove_listener(const char* local_name, atransport* transport)
--    EXCLUDES(listener_list_mutex) {
-+{
-     std::lock_guard<std::mutex> lock(listener_list_mutex);
-     for (auto iter = listener_list.begin(); iter != listener_list.end(); ++iter) {
-         if (local_name == (*iter)->local_name) {
-@@ -151,7 +151,7 @@ InstallStatus remove_listener(const char* local_name, atransport* transport)
-     return INSTALL_STATUS_LISTENER_NOT_FOUND;
- }
- 
--void remove_all_listeners() EXCLUDES(listener_list_mutex) {
-+void remove_all_listeners() {
-     std::lock_guard<std::mutex> lock(listener_list_mutex);
-     auto iter = listener_list.begin();
-     while (iter != listener_list.end()) {
-@@ -164,7 +164,7 @@ void remove_all_listeners() EXCLUDES(listener_list_mutex) {
-     }
- }
- 
--void close_smartsockets() EXCLUDES(listener_list_mutex) {
-+void close_smartsockets() {
-     std::lock_guard<std::mutex> lock(listener_list_mutex);
-     auto pred = [](const std::unique_ptr<alistener>& listener) {
-         return listener->local_name == "*smartsocket*";
-@@ -174,7 +174,7 @@ void close_smartsockets() EXCLUDES(listener_list_mutex) {
- 
- InstallStatus install_listener(const std::string& local_name, const char* connect_to,
-                                atransport* transport, int no_rebind, int* resolved_tcp_port,
--                               std::string* error) EXCLUDES(listener_list_mutex) {
-+                               std::string* error) {
-     std::lock_guard<std::mutex> lock(listener_list_mutex);
-     for (auto& l : listener_list) {
-         if (local_name == l->local_name) {
-diff --git a/system/core/adb/transport_local.cpp b/system/core/adb/transport_local.cpp
-index c7261860..5988ec4d 100644
---- a/system/core/adb/transport_local.cpp
-+++ b/system/core/adb/transport_local.cpp
-@@ -333,7 +333,7 @@ struct EmulatorConnection : public FdConnection {
- 
- /* Only call this function if you already hold local_transports_lock. */
- static atransport* find_emulator_transport_by_adb_port_locked(int adb_port)
--    REQUIRES(local_transports_lock) {
-+{
-     auto it = local_transports.find(adb_port);
-     if (it == local_transports.end()) {
-         return nullptr;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0002-debian-makefiles-yocto-compat.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0002-debian-makefiles-yocto-compat.patch
new file mode 100644
index 0000000000..a7c8dcf946
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0002-debian-makefiles-yocto-compat.patch
@@ -0,0 +1,240 @@
+From 14058ff506910f19c6e6a49e2bb081c398a7acf0 Mon Sep 17 00:00:00 2001
+From: Mihajlo Marinkovic <mmarinkovic@snap.com>
+Date: Sun, 10 May 2026 15:20:00 +0000
+Subject: [PATCH] debian makefiles: adapt for cross-compilation in Yocto
+
+The Debian make fragments hardcode several assumptions that only work on
+a Debian build host:
+ - include /usr/share/dpkg/architecture.mk (shells out to dpkg-architecture)
+ - /usr/include/android (host path, not sysroot)
+ - /usr/lib/$(DEB_HOST_MULTIARCH)/android (host rpath)
+ - -lcrypto / -lssl (links against system OpenSSL instead of BoringSSL)
+ - -Wexit-time-destructors (Clang-only, rejected by GCC)
+
+Replace each with its Yocto-compatible equivalent: use $(SYSROOT) for
+include paths, rpath relative to $ORIGIN for installed libraries, exact
+soname matching for the staged BoringSSL shared objects, and drop the
+Clang-only warning flag.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
+---
+ debian/system/adb.mk                  |  9 ++++-----
+ debian/system/adbd.mk                 | 10 ++++------
+ debian/system/extras/libext4_utils.mk |  4 ++--
+ debian/system/fastboot.mk             | 13 ++++++-------
+ debian/system/libadb.mk               |  3 +--
+ debian/system/libbacktrace.mk         |  2 +-
+ debian/system/libbase.mk              |  2 +-
+ debian/system/libcrypto_utils.mk      |  2 +-
+ debian/system/libcutils.mk            |  2 +-
+ debian/system/liblog.mk               |  1 +
+ debian/system/libutils.mk             |  3 +--
+ 11 files changed, 23 insertions(+), 28 deletions(-)
+
+diff --git a/debian/system/adb.mk b/debian/system/adb.mk
+index 89530b0..90a816f 100644
+--- a/debian/system/adb.mk
++++ b/debian/system/adb.mk
+@@ -82,22 +82,21 @@ CPPFLAGS += \
+   -Isystem/libbase/include \
+   -Isystem/libziparchive/include \
+   \
+-  -I/usr/include/android \
++  -I$(SYSROOT)/usr/include/android \
+ 
+ LDFLAGS += \
+   -Ldebian/out/system \
+-  -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++  -Wl,-rpath='$$ORIGIN/../lib/android' \
+   -lbase \
+   -lbrotlidec \
+   -lbrotlienc \
+-  -lcrypto \
++  -l:libcrypto.so.0 \
+   -lcutils \
+   -llog \
+   -llz4 \
+   -lprotobuf \
+   -lpthread \
+-  -lssl \
++  -l:libssl.so.0 \
+   -lusb-1.0 \
+   -lziparchive \
+   -lzstd \
+diff --git a/debian/system/adbd.mk b/debian/system/adbd.mk
+index 9d6abd7..73e49a4 100644
+--- a/debian/system/adbd.mk
++++ b/debian/system/adbd.mk
+@@ -81,23 +81,21 @@ CPPFLAGS += \
+   -Isystem/libbase/include \
+   -Isystem/logging/liblog/include \
+   \
+-  -I/usr/include/android \
++  -I$(SYSROOT)/usr/include/android \
+ 
+ LDFLAGS += \
+   -Ldebian/out/system \
+-  -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++  -Wl,-rpath='$$ORIGIN/../lib/android' \
+   -lbase \
+   -lbrotlidec \
+   -lbrotlienc \
+-  -lcrypto \
++  -l:libcrypto.so.0 \
+   -lcutils \
+   -llog \
+   -llz4 \
+   -lprotobuf \
+   -lresolv \
+-  -lssl \
+-  -lsystemd \
++  -l:libssl.so.0 \
+   -lzstd \
+   -pie \
+ 
+diff --git a/debian/system/extras/libext4_utils.mk b/debian/system/extras/libext4_utils.mk
+index 77455f4..5bfc950 100644
+--- a/debian/system/extras/libext4_utils.mk
++++ b/debian/system/extras/libext4_utils.mk
+@@ -26,8 +26,8 @@ CPPFLAGS += \
+   -D_LARGEFILE64_SOURCE \
+   -DFEC_NO_KLOG \
+   -DSQUASHFS_NO_KLOG \
+-  -I/usr/include/android \
+-  -I/usr/include/squashfuse \
++  -I$(SYSROOT)/usr/include/android \
++  -I$(SYSROOT)/usr/include/squashfuse \
+   -Isystem/core/libcutils/include \
+   -Isystem/core/libsparse/include \
+   -Isystem/extras/ext4_utils/include \
+diff --git a/debian/system/fastboot.mk b/debian/system/fastboot.mk
+index d68a99a..52f5d8b 100644
+--- a/debian/system/fastboot.mk
++++ b/debian/system/fastboot.mk
+@@ -56,16 +56,15 @@ CPPFLAGS += \
+   -Isystem/libziparchive/include \
+   -Isystem/tools/mkbootimg/include/bootimg \
+   \
+-  -I/usr/include/android \
++  -I$(SYSROOT)/usr/include/android \
+ 
+ LDFLAGS += \
+   -Ldebian/out/system \
+-  -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-  -lbase \
+-  -lcrypto \
+-  -lcutils \
+-  -llog \
++  -Wl,-rpath='$$ORIGIN/../lib/android' \
++  debian/out/system/libbase.so.0 \
++  -l:libcrypto.so.0 \
++  debian/out/system/libcutils.so.0 \
++  debian/out/system/liblog.so.0 \
+   -lpthread \
+   -lprotobuf \
+   -lsparse \
+diff --git a/debian/system/libadb.mk b/debian/system/libadb.mk
+index 52f2838..ebd52aa 100644
+--- a/debian/system/libadb.mk
++++ b/debian/system/libadb.mk
+@@ -73,7 +73,6 @@ SOURCES_CC = $(filter %.cc,$(SOURCES))
+ OBJECTS_CC = $(SOURCES_CC:.cc=.o)
+ 
+ CXXFLAGS += \
+-  -Wexit-time-destructors \
+   -Wno-non-virtual-dtor \
+   -Wno-unused-parameter \
+   -Wno-missing-field-initializers \
+@@ -96,7 +95,7 @@ CPPFLAGS += \
+   -Isystem/core/libcutils/include \
+   -Isystem/libbase/include \
+   \
+-  -I/usr/include/android \
++  -I$(SYSROOT)/usr/include/android \
+ 
+ debian/out/system/$(NAME).a: $(OBJECTS_CC) $(OBJECTS_CPP)
+ 	ar -rcs $@ $^
+diff --git a/debian/system/libbacktrace.mk b/debian/system/libbacktrace.mk
+index 0f798d4..f004061 100644
+--- a/debian/system/libbacktrace.mk
++++ b/debian/system/libbacktrace.mk
+@@ -1,4 +1,4 @@
+-include /usr/share/dpkg/architecture.mk
++DEB_HOST_MULTIARCH ?=
+ 
+ NAME = libbacktrace
+ 
+diff --git a/debian/system/libbase.mk b/debian/system/libbase.mk
+index f04d3f9..61f71c6 100644
+--- a/debian/system/libbase.mk
++++ b/debian/system/libbase.mk
+@@ -42,7 +42,7 @@ CPPFLAGS += \
+ 
+ LDFLAGS += \
+   -Ldebian/out/system \
+-  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++  -Wl,-rpath='$$ORIGIN' \
+   -Wl,-soname,$(NAME).so.0 \
+   -llog \
+   -lpthread \
+diff --git a/debian/system/libcrypto_utils.mk b/debian/system/libcrypto_utils.mk
+index 39fd8a7..82ae46c 100644
+--- a/debian/system/libcrypto_utils.mk
++++ b/debian/system/libcrypto_utils.mk
+@@ -7,7 +7,7 @@ CPPFLAGS += \
+   -Isystem/core/include \
+   -Isystem/core/libcrypto_utils/include \
+   \
+-  -I/usr/include/android \
++  -I$(SYSROOT)/usr/include/android \
+ 
+ debian/out/system/$(NAME).a: $(OBJECTS)
+ 	ar -rcs $@ $^
+diff --git a/debian/system/libcutils.mk b/debian/system/libcutils.mk
+index 596ebd8..ff9e911 100644
+--- a/debian/system/libcutils.mk
++++ b/debian/system/libcutils.mk
+@@ -50,7 +50,7 @@ CPPFLAGS += \
+ 
+ LDFLAGS += \
+   -Ldebian/out/system \
+-  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++  -Wl,-rpath='$$ORIGIN' \
+   -Wl,-soname,$(NAME).so.0 \
+   -lbase \
+   -llog \
+diff --git a/debian/system/liblog.mk b/debian/system/liblog.mk
+index b08a50c..091ccad 100644
+--- a/debian/system/liblog.mk
++++ b/debian/system/liblog.mk
+@@ -27,6 +27,7 @@ CPPFLAGS += \
+   -Isystem/logging/liblog/include \
+ 
+ LDFLAGS += \
++  -Wl,-rpath='$$ORIGIN' \
+   -Wl,-soname,$(NAME).so.0 \
+   -lpthread \
+   -shared
+diff --git a/debian/system/libutils.mk b/debian/system/libutils.mk
+index 6218c73..c7948e7 100644
+--- a/debian/system/libutils.mk
++++ b/debian/system/libutils.mk
+@@ -1,4 +1,3 @@
+-include /usr/share/dpkg/architecture.mk
+ 
+ NAME = libutils
+ 
+@@ -42,7 +41,7 @@ CPPFLAGS += \
+ 
+ LDFLAGS += \
+   -Ldebian/out/system \
+-  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++  -Wl,-rpath='$$ORIGIN' \
+   -Wl,-soname,$(NAME).so.0 \
+   -lbacktrace \
+   -lcutils \
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
deleted file mode 100644
index ea934f44d8..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 02b6b6977d80af4b9b806054fadb5a06cedf011d Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Tue, 14 Mar 2023 11:33:50 +0100
-Subject: [PATCH] Update usage of usbdevfs_urb to match new kernel UAPI
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Linux kernel API has been changed by commit 94dfc73e7cf4 ("treewide: uapi: Replace zero-length arrays with flexible-array members")
-where zero-length array iso_frame_desc in struct usbdevfs_urb was replaced with a proper flexible-array member.
-
-Current USB API usage causes a compilation error at Linux 6.0:
-
-In file included from /home/mae/.cache/kiss/proc/121205/build/android-tools/vendor/adb/client/usb_linux.cpp:28:
-/usr/include/linux/usbdevice_fs.h:134:41: error: flexible array member ‘usbdevfs_urb::iso_frame_desc’ not at end of ‘struct usb_handle’
-  134 |         struct usbdevfs_iso_packet_desc iso_frame_desc[];
-      |                                         ^~~~~~~~~~~~~~
-/home/mae/.cache/kiss/proc/121205/build/android-tools/vendor/adb/client/usb_linux.cpp:76:18: note: next member ‘usbdevfs_urb usb_handle::urb_out’ declared here
-   76 |     usbdevfs_urb urb_out;
-      |                  ^~~~~~~
-/home/mae/.cache/kiss/proc/121205/build/android-tools/vendor/adb/client/usb_linux.cpp:61:8: note: in the definition of ‘struct usb_handle’
-   61 | struct usb_handle {
-      |        ^~~~~~~~~~
-
-Fix it by using pointers to a struct with flexible-array members.
-Current fix works both with the old and the new API.
-
-See https://github.com/nmeum/android-tools/issues/74 for more context.
-
-Tested: built on Linux against kernel 5.19 and 6.0; 'adb shell' over USB
-cable
-Acked-by: Gustavo A. R. Silva gustavoars@kernel.org
-Change-Id: I7f0f7b35d9a3ab980d3520b541b60c7857a6b101
-Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
-
-[Backported on version 10]
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
-
----
-Upstream-Status: Pending
-
- system/core/adb/client/usb_linux.cpp | 24 ++++++++++++++----------
- 1 file changed, 14 insertions(+), 10 deletions(-)
-
-diff --git a/system/core/adb/client/usb_linux.cpp b/system/core/adb/client/usb_linux.cpp
-index 343e7b59..6a4479f3 100644
---- a/system/core/adb/client/usb_linux.cpp
-+++ b/system/core/adb/client/usb_linux.cpp
-@@ -71,8 +71,8 @@ struct usb_handle : public ::usb_handle {
-     unsigned zero_mask;
-     unsigned writeable = 1;
- 
--    usbdevfs_urb urb_in;
--    usbdevfs_urb urb_out;
-+    usbdevfs_urb *urb_in;
-+    usbdevfs_urb *urb_out;
- 
-     bool urb_in_busy = false;
-     bool urb_out_busy = false;
-@@ -305,7 +305,7 @@ static int usb_bulk_write(usb_handle* h, const void* data, int len) {
-     std::unique_lock<std::mutex> lock(h->mutex);
-     D("++ usb_bulk_write ++");
- 
--    usbdevfs_urb* urb = &h->urb_out;
-+    usbdevfs_urb* urb = h->urb_out;
-     memset(urb, 0, sizeof(*urb));
-     urb->type = USBDEVFS_URB_TYPE_BULK;
-     urb->endpoint = h->ep_out;
-@@ -344,7 +344,7 @@ static int usb_bulk_read(usb_handle* h, void* data, int len) {
-     std::unique_lock<std::mutex> lock(h->mutex);
-     D("++ usb_bulk_read ++");
- 
--    usbdevfs_urb* urb = &h->urb_in;
-+    usbdevfs_urb* urb = h->urb_in;
-     memset(urb, 0, sizeof(*urb));
-     urb->type = USBDEVFS_URB_TYPE_BULK;
-     urb->endpoint = h->ep_in;
-@@ -389,7 +389,7 @@ static int usb_bulk_read(usb_handle* h, void* data, int len) {
-         }
-         D("[ urb @%p status = %d, actual = %d ]", out, out->status, out->actual_length);
- 
--        if (out == &h->urb_in) {
-+        if (out == h->urb_in) {
-             D("[ reap urb - IN complete ]");
-             h->urb_in_busy = false;
-             if (urb->status != 0) {
-@@ -398,7 +398,7 @@ static int usb_bulk_read(usb_handle* h, void* data, int len) {
-             }
-             return urb->actual_length;
-         }
--        if (out == &h->urb_out) {
-+        if (out == h->urb_out) {
-             D("[ reap urb - OUT compelete ]");
-             h->urb_out_busy = false;
-             h->cv.notify_all();
-@@ -502,10 +502,10 @@ void usb_kick(usb_handle* h) {
-             ** but this ensures that a reader blocked on REAPURB
-             ** will get unblocked
-             */
--            ioctl(h->fd, USBDEVFS_DISCARDURB, &h->urb_in);
--            ioctl(h->fd, USBDEVFS_DISCARDURB, &h->urb_out);
--            h->urb_in.status = -ENODEV;
--            h->urb_out.status = -ENODEV;
-+            ioctl(h->fd, USBDEVFS_DISCARDURB, h->urb_in);
-+            ioctl(h->fd, USBDEVFS_DISCARDURB, h->urb_out);
-+            h->urb_in->status = -ENODEV;
-+            h->urb_out->status = -ENODEV;
-             h->urb_in_busy = false;
-             h->urb_out_busy = false;
-             h->cv.notify_all();
-@@ -521,6 +521,8 @@ int usb_close(usb_handle* h) {
- 
-     D("-- usb close %p (fd = %d) --", h, h->fd);
- 
-+    delete h->urb_in;
-+    delete h->urb_out;
-     delete h;
- 
-     return 0;
-@@ -556,6 +558,8 @@ static void register_device(const char* dev_name, const char* dev_path, unsigned
-     usb->ep_out = ep_out;
-     usb->zero_mask = zero_mask;
-     usb->max_packet_size = max_packet_size;
-+    usb->urb_in = new usbdevfs_urb;
-+    usb->urb_out = new usbdevfs_urb;
- 
-     // Initialize mark so we don't get garbage collected after the device scan.
-     usb->mark = true;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0003-gcc-nullability-and-thread-annotation-compat.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0003-gcc-nullability-and-thread-annotation-compat.patch
new file mode 100644
index 0000000000..c3cf572ebd
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0003-gcc-nullability-and-thread-annotation-compat.patch
@@ -0,0 +1,34 @@
+From 793ad99196c5b9cf2922689d993b8f798e87174c Mon Sep 17 00:00:00 2001
+From: Mihajlo Marinkovic <mmarinkovic@snap.com>
+Date: Sun, 10 May 2026 12:00:00 +0200
+Subject: [PATCH] GCC nullability and thread annotation compat
+
+GCC does not understand the Clang-only nullability markers used in adb,
+and it rejects function-definition attributes emitted by the thread
+annotation macros. The nullability markers are injected from the Yocto
+recipe flags, while thread annotation attributes are made Clang-only so
+the sources parse under Yocto's GCC toolchain.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
+---
+ system/libbase/include/android-base/thread_annotations.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/system/libbase/include/android-base/thread_annotations.h b/system/libbase/include/android-base/thread_annotations.h
+index 53fe6da..5523521 100644
+--- a/system/libbase/include/android-base/thread_annotations.h
++++ b/system/libbase/include/android-base/thread_annotations.h
+@@ -18,7 +18,11 @@
+ 
+ #include <mutex>
+ 
++#if defined(__clang__)
+ #define THREAD_ANNOTATION_ATTRIBUTE__(x) __attribute__((x))
++#else
++#define THREAD_ANNOTATION_ATTRIBUTE__(x)
++#endif
+ 
+ #define CAPABILITY(x) \
+       THREAD_ANNOTATION_ATTRIBUTE__(capability(x))
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
deleted file mode 100644
index c82423908f..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e4a29888cb52c1eafd3ab57a6e220b38147ecfbe Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Tue, 14 Mar 2023 13:39:23 +0100
-Subject: [PATCH] adb: Fix build on big endian systems
-
-The usb_linux_client.c file defines cpu_to_le16/32 by using the C
-library htole16/32 function calls. However, cpu_to_le16/32 are used
-when initializing structures, i.e in a context where a function call
-is not allowed.
-
-It works fine on little endian systems because htole16/32 are defined
-by the C library as no-ops. But on big-endian systems, they are
-actually doing something, which might involve calling a function,
-causing build failures.
-
-To solve this, we simply open-code cpu_to_le16/32 in a way that allows
-them to be used when initializing structures.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Forward-ported to version 29]
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
-
----
-Upstream-Status: Pending
-
- system/core/adb/daemon/usb_ffs.cpp | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/system/core/adb/daemon/usb_ffs.cpp b/system/core/adb/daemon/usb_ffs.cpp
-index b19fa5d5..ef2291ca 100644
---- a/system/core/adb/daemon/usb_ffs.cpp
-+++ b/system/core/adb/daemon/usb_ffs.cpp
-@@ -39,8 +39,15 @@
- 
- #define USB_EXT_PROP_UNICODE 1
- 
--#define cpu_to_le16(x) htole16(x)
--#define cpu_to_le32(x) htole32(x)
-+#if __BYTE_ORDER == __LITTLE_ENDIAN
-+# define cpu_to_le16(x) (x)
-+# define cpu_to_le32(x) (x)
-+#else
-+# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
-+# define cpu_to_le32(x) \
-+	((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
-+	 (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
-+#endif
- 
- // clang-format off
- struct func_desc {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0004-fastboot-super_flash_helper-include-climits.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0004-fastboot-super_flash_helper-include-climits.patch
new file mode 100644
index 0000000000..2b155e6a71
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0004-fastboot-super_flash_helper-include-climits.patch
@@ -0,0 +1,41 @@
+From fe7c2aa9a9032d11cb14ff7ab2a1a000237edaa3 Mon Sep 17 00:00:00 2001
+From: Mihajlo Marinkovic <mmarinkovic@snap.com>
+Date: Tue, 26 May 2026 17:41:00 +0200
+Subject: [PATCH] adb: include <climits> for missing integer constants
+
+GCC rejects builds where IOV_MAX (sysdeps/uio.h) or UINT_MAX
+(super_flash_helper.cpp) are used without the header that defines them.
+Add #include <climits> in both files.
+
+Upstream-Status: Inappropriate [OE-specific sysroot compat]
+
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ packages/modules/adb/sysdeps/uio.h          | 1 +
+ system/core/fastboot/super_flash_helper.cpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/packages/modules/adb/sysdeps/uio.h b/packages/modules/adb/sysdeps/uio.h
+index f3ace64..163b4a8 100644
+--- a/packages/modules/adb/sysdeps/uio.h
++++ b/packages/modules/adb/sysdeps/uio.h
+@@ -35,6 +35,7 @@ ssize_t adb_writev(borrowed_fd fd, const adb_iovec* iov, int iovcnt);
+ #else
+ 
+ #include <sys/uio.h>
++#include <climits>
+ using adb_iovec = struct iovec;
+ inline ssize_t adb_writev(borrowed_fd fd, const adb_iovec* iov, int iovcnt) {
+     return writev(fd.get(), iov, std::min(iovcnt, IOV_MAX));
+diff --git a/system/core/fastboot/super_flash_helper.cpp b/system/core/fastboot/super_flash_helper.cpp
+index b617ce8..8c1edde 100644
+--- a/system/core/fastboot/super_flash_helper.cpp
++++ b/system/core/fastboot/super_flash_helper.cpp
+@@ -16,6 +16,7 @@
+ 
+ #include "super_flash_helper.h"
+ 
++#include <climits>
+ #include <android-base/logging.h>
+ 
+ #include "util.h"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
deleted file mode 100644
index dfbdc2af66..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 4ef35041ba5c02df48c31f2382e7c3c4316ad936 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Tue, 14 Mar 2023 13:53:51 +0100
-Subject: [PATCH] adb: Allow adbd to be run as root
-
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
-
----
-Upstream-Status: Pending
-
- system/core/adb/daemon/main.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/system/core/adb/daemon/main.cpp b/system/core/adb/daemon/main.cpp
-index e807d13d..309663a2 100644
---- a/system/core/adb/daemon/main.cpp
-+++ b/system/core/adb/daemon/main.cpp
-@@ -75,6 +75,7 @@ static bool should_drop_capabilities_bounding_set() {
- }
- 
- static bool should_drop_privileges() {
-+    return true;
-     // "adb root" not allowed, always drop privileges.
-     if (!ALLOW_ADBD_ROOT && !is_device_unlocked()) return true;
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-host-usb-compat.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-host-usb-compat.patch
new file mode 100644
index 0000000000..6f396b7e9d
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-host-usb-compat.patch
@@ -0,0 +1,34 @@
+From da0746f90c80bb5621d01f35d505412cd26898e2 Mon Sep 17 00:00:00 2001
+From: Mihajlo Marinkovic <mmarinkovic@snap.com>
+Date: Thu, 21 May 2026 14:10:00 +0200
+Subject: [PATCH] adb: replace socket_get_local_port with inline getsockname
+
+The libcutils socket_get_local_port helper is not available in the native
+libcutils build. Replace the call with an inline getsockname implementation.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
+---
+ packages/modules/adb/sysdeps.h | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/packages/modules/adb/sysdeps.h b/packages/modules/adb/sysdeps.h
+index 99f6b74..9a99295 100644
+--- a/packages/modules/adb/sysdeps.h
++++ b/packages/modules/adb/sysdeps.h
+@@ -626,7 +626,13 @@ inline int adb_getsockname(borrowed_fd fd, struct sockaddr* sockaddr, socklen_t*
+ }
+ 
+ inline int adb_socket_get_local_port(borrowed_fd fd) {
+-    return socket_get_local_port(fd.get());
++    sockaddr_storage addr;
++    socklen_t addr_size = sizeof(addr);
++
++    if (getsockname(fd.get(), reinterpret_cast<sockaddr*>(&addr), &addr_size) == 0) {
++        return ntohs(reinterpret_cast<sockaddr_in*>(&addr)->sin_port);
++    }
++    return -1;
+ }
+ 
+ // Operate on a file descriptor returned from unix_open() or a well-known file
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0006-adbd-enable-root-and-remount-support.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0006-adbd-enable-root-and-remount-support.patch
new file mode 100644
index 0000000000..700e64f06d
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0006-adbd-enable-root-and-remount-support.patch
@@ -0,0 +1,466 @@
+From d247444cf5ef0c8ee2fcf207febe09f5101c2215 Mon Sep 17 00:00:00 2001
+From: Mihajlo Marinkovic <mmarinkovic@snap.com>
+Date: Fri, 29 May 2026 12:10:00 +0200
+Subject: [PATCH] adbd: enable root and remount support
+
+Enable root/unroot and remount support for the non-Android adbd build.
+
+Upstream-Status: Inappropriate [embedded Linux integration]
+
+Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
+---
+ debian/system/adbd.mk                         |  3 +
+ .../modules/adb/daemon/framebuffer_service.h  |  2 +-
+ packages/modules/adb/daemon/main.cpp          | 93 +++++++++++++++----
+ .../modules/adb/daemon/restart_service.cpp    | 40 +++++++-
+ packages/modules/adb/daemon/restart_service.h |  2 +-
+ packages/modules/adb/daemon/services.cpp      | 81 ++++++++++++++--
+ packages/modules/adb/sockets.cpp              | 20 +++-
+ packages/modules/adb/transport.cpp            |  1 -
+ 8 files changed, 204 insertions(+), 38 deletions(-)
+
+diff --git a/debian/system/adbd.mk b/debian/system/adbd.mk
+index 73e49a4..beb412e 100644
+--- a/debian/system/adbd.mk
++++ b/debian/system/adbd.mk
+@@ -17,6 +17,8 @@ ADBD_SRC_FILES = \
+   daemon/jdwp_service.cpp \
+   daemon/logging.cpp \
+   daemon/main.cpp \
++  daemon/framebuffer_service.cpp \
++  daemon/restart_service.cpp \
+   daemon/transport_local.cpp \
+   daemon/usb.cpp \
+   daemon/usb_ffs.cpp \
+@@ -64,6 +66,7 @@ CPPFLAGS += \
+   -DPLATFORM_TOOLS_VERSION='"$(PLATFORM_TOOLS_VERSION)"' \
+   -DADB_HOST=0 \
+   -DADB_VERSION='"$(DEB_VERSION)"' \
++  -DALLOW_ADBD_ROOT=1 \
+   -DANDROID_BASE_UNIQUE_FD_DISABLE_IMPLICIT_CONVERSION=1 \
+   -DPAGE_SIZE=4096 \
+   -Iframeworks/native/libs/adbd_auth/include/ \
+diff --git a/packages/modules/adb/daemon/framebuffer_service.h b/packages/modules/adb/daemon/framebuffer_service.h
+index bab44be..0a8c822 100644
+--- a/packages/modules/adb/daemon/framebuffer_service.h
++++ b/packages/modules/adb/daemon/framebuffer_service.h
+@@ -18,6 +18,6 @@
+ 
+ #include "adb_unique_fd.h"
+ 
+-#if defined(__ANDROID__)
++#if !defined(__ANDROID_RECOVERY__)
+ void framebuffer_service(unique_fd fd);
+ #endif
+diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
+index 83905d3..f177abf 100644
+--- a/packages/modules/adb/daemon/main.cpp
++++ b/packages/modules/adb/daemon/main.cpp
+@@ -19,11 +19,15 @@
+ #include "sysdeps.h"
+ 
+ #include <errno.h>
++#include <fcntl.h>
+ #include <getopt.h>
++#include <grp.h>
+ #include <malloc.h>
++#include <pwd.h>
+ #include <signal.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <sys/capability.h>
+ #include <sys/prctl.h>
+ 
+@@ -61,6 +65,13 @@
+ #include "daemon/mdns.h"
+ #include "daemon/watchdog.h"
+ 
++namespace {
++constexpr char kAdbRootStatePath[] = "/run/.adb.root";
++constexpr char kRootMagic[] = "#ROOT#";
++constexpr char kNoRootMagic[] = "#NOROOT#";
++constexpr size_t kRootMagicSize = sizeof(kRootMagic) - 1;
++}
++
+ #if defined(__ANDROID__)
+ static const char* root_seclabel = nullptr;
+ 
+@@ -75,24 +86,16 @@ static bool should_drop_privileges() {
+     //
+     // ro.secure:
+     //   Drop privileges by default. Set to 1 on userdebug and user builds.
+-    bool ro_secure = android::base::GetBoolProperty("ro.secure", true);
+-    bool ro_debuggable = __android_log_is_debuggable();
+-
+-    // Drop privileges if ro.secure is set...
+-    bool drop = ro_secure;
+-
+-    // ... except "adb root" lets you keep privileges in a debuggable build.
+-    std::string prop = android::base::GetProperty("service.adb.root", "");
+-    bool adb_root = (prop == "1");
+-    bool adb_unroot = (prop == "0");
+-    if (ro_debuggable && adb_root) {
+-        drop = false;
++    int f = unix_open(kAdbRootStatePath, O_RDONLY | O_CLOEXEC);
++    if (f < 0) {
++        return true;
+     }
+-    // ... and "adb unroot" lets you explicitly drop privileges.
+-    if (adb_unroot) {
+-        drop = true;
++    char buf[kRootMagicSize];
++    bool drop = true;
++    if (unix_read(f, buf, sizeof(buf)) != -1 && !strncmp(buf, kRootMagic, kRootMagicSize)) {
++        drop = false;
+     }
+-
++    unix_close(f);
+     return drop;
+ }
+ 
+@@ -122,6 +125,17 @@ static void drop_privileges(int server_port) {
+     // Don't listen on a port (default 5037) if running in secure mode.
+     // Don't run as root if running in secure mode.
+     if (should_drop_privileges()) {
++        int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_CLOEXEC, 0666);
++        if (f >= 0) {
++            if (fchmod(f, 0666) == -1) {
++                PLOG(ERROR) << "failed to set root state permissions";
++            }
++            if (unix_write(f, kNoRootMagic, sizeof(kNoRootMagic) - 1) == -1) {
++                PLOG(ERROR) << "failed to initialize root state";
++            }
++            unix_close(f);
++        }
++
+         const bool should_drop_caps = !__android_log_is_debuggable();
+ 
+         if (should_drop_caps) {
+@@ -182,6 +196,51 @@ static void drop_privileges(int server_port) {
+ }
+ #endif
+ 
++#if !defined(__ANDROID__)
++static bool should_drop_privileges() {
++    int f = unix_open(kAdbRootStatePath, O_RDONLY | O_CLOEXEC);
++    if (f < 0) {
++        return true;
++    }
++    char buf[kRootMagicSize];
++    bool drop = true;
++    if (unix_read(f, buf, sizeof(buf)) != -1 && !strncmp(buf, kRootMagic, kRootMagicSize)) {
++        drop = false;
++    }
++    unix_close(f);
++    return drop;
++}
++
++static void drop_privileges(int) {
++    if (!should_drop_privileges()) {
++        return;
++    }
++    int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_CLOEXEC, 0666);
++    if (f >= 0) {
++        if (fchmod(f, 0666) == -1) {
++            PLOG(ERROR) << "failed to set root state permissions";
++        }
++        if (unix_write(f, kNoRootMagic, sizeof(kNoRootMagic) - 1) == -1) {
++            PLOG(ERROR) << "failed to initialize root state";
++        }
++        unix_close(f);
++    }
++    passwd* adb_user = getpwnam("adb");
++    if (adb_user == nullptr) {
++        PLOG(FATAL) << "getpwnam(adb) failed";
++    }
++    if (initgroups(adb_user->pw_name, adb_user->pw_gid) != 0) {
++        PLOG(FATAL) << "initgroups(adb) failed";
++    }
++    if (setgid(adb_user->pw_gid) != 0) {
++        PLOG(FATAL) << "setgid(adb) failed";
++    }
++    if (setuid(adb_user->pw_uid) != 0) {
++        PLOG(FATAL) << "setuid(adb) failed";
++    }
++}
++#endif
++
+ static void setup_adb(const std::vector<std::string>& addrs) {
+ #if defined(__ANDROID__)
+     // Get the first valid port from addrs and setup mDNS.
+@@ -242,9 +301,7 @@ int adbd_main(int server_port) {
+           " unchanged.\n");
+     }
+ 
+-#if defined(__ANDROID__)
+     drop_privileges(server_port);
+-#endif
+ 
+ #if defined(__ANDROID__)
+     // A thread gets spawned as a side-effect of initializing the watchdog, so it needs to happen
+diff --git a/packages/modules/adb/daemon/restart_service.cpp b/packages/modules/adb/daemon/restart_service.cpp
+index 16d2627..fcba9c8 100644
+--- a/packages/modules/adb/daemon/restart_service.cpp
++++ b/packages/modules/adb/daemon/restart_service.cpp
+@@ -18,6 +18,9 @@
+ 
+ #include "sysdeps.h"
+ 
++#include <errno.h>
++#include <fcntl.h>
++#include <string.h>
+ #include <unistd.h>
+ 
+ #include <android-base/logging.h>
+@@ -28,6 +31,26 @@
+ #include "adb_io.h"
+ #include "adb_unique_fd.h"
+ 
++namespace {
++constexpr char kAdbRootStatePath[] = "/run/.adb.root";
++constexpr char kRootMagic[] = "#ROOT#";
++constexpr char kNoRootMagic[] = "#NOROOT#";
++constexpr size_t kRootMagicSize = sizeof(kRootMagic) - 1;
++
++bool write_root_state(const char* value, size_t size) {
++    int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_TRUNC | O_CLOEXEC, 0666);
++    if (f < 0) {
++        return false;
++    }
++    bool ok = unix_write(f, value, size) == static_cast<int>(size);
++    if (ok) {
++        ok = fsync(f) == 0;
++    }
++    unix_close(f);
++    return ok;
++}
++}
++
+ void restart_root_service(unique_fd fd) {
+     if (getuid() == 0) {
+         WriteFdExactly(fd.get(), "adbd is already running as root\n");
+@@ -38,9 +61,15 @@ void restart_root_service(unique_fd fd) {
+         return;
+     }
+ 
+-    LOG(INFO) << "adbd restarting as root";
+-    android::base::SetProperty("service.adb.root", "1");
+-    WriteFdExactly(fd.get(), "restarting adbd as root\n");
++    for (int retry = 5; retry-- > 0;) {
++        if (write_root_state(kRootMagic, kRootMagicSize)) {
++            LOG(INFO) << "adbd restarting as root";
++            WriteFdExactly(fd.get(), "restarting adbd as root\n");
++            return;
++        }
++        usleep(100000);
++    }
++    WriteFdExactly(fd.get(), "failed to switch adbd to root\n");
+ }
+ 
+ void restart_unroot_service(unique_fd fd) {
+@@ -49,8 +78,11 @@ void restart_unroot_service(unique_fd fd) {
+         return;
+     }
+ 
++    if (!write_root_state(kNoRootMagic, sizeof(kNoRootMagic) - 1)) {
++        PLOG(ERROR) << "failed to write root state";
++        return;
++    }
+     LOG(INFO) << "adbd restarting as nonroot";
+-    android::base::SetProperty("service.adb.root", "0");
+     WriteFdExactly(fd.get(), "restarting adbd as non root\n");
+ }
+ 
+diff --git a/packages/modules/adb/daemon/restart_service.h b/packages/modules/adb/daemon/restart_service.h
+index 19840bd..2d239db 100644
+--- a/packages/modules/adb/daemon/restart_service.h
++++ b/packages/modules/adb/daemon/restart_service.h
+@@ -18,7 +18,7 @@
+ 
+ #include "adb_unique_fd.h"
+ 
+-#if defined(__ANDROID__)
++#if !defined(__ANDROID_RECOVERY__)
+ void restart_root_service(unique_fd fd);
+ void restart_unroot_service(unique_fd fd);
+ void restart_tcp_service(unique_fd fd, int port);
+diff --git a/packages/modules/adb/daemon/services.cpp b/packages/modules/adb/daemon/services.cpp
+index 5090441..1b27314 100644
+--- a/packages/modules/adb/daemon/services.cpp
++++ b/packages/modules/adb/daemon/services.cpp
+@@ -19,12 +19,18 @@
+ #include "sysdeps.h"
+ 
+ #include <errno.h>
++#include <fcntl.h>
++#include <linux/fs.h>
++#include <linux/reboot.h>
++#include <mntent.h>
+ #include <netdb.h>
+ #include <netinet/in.h>
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/mount.h>
++#include <sys/syscall.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+@@ -40,7 +46,6 @@
+ #include <android-base/stringprintf.h>
+ #include <android-base/strings.h>
+ #include <android-base/unique_fd.h>
+-#include <cutils/android_reboot.h>
+ #include <cutils/sockets.h>
+ #include <log/log_properties.h>
+ 
+@@ -143,6 +148,60 @@ static void spin_service(unique_fd fd) {
+     WriteFdExactly(fd.get(), "spinning\n");
+ }
+ 
++static std::string find_mount(std::string_view dir) {
++    std::unique_ptr<FILE, int (*)(FILE*)> fp(setmntent("/proc/mounts", "r"), endmntent);
++    if (!fp) {
++        return {};
++    }
++    while (mntent* entry = getmntent(fp.get())) {
++        if (dir == entry->mnt_dir) {
++            return entry->mnt_fsname;
++        }
++    }
++    return {};
++}
++
++static bool make_block_device_writable(const std::string& dev) {
++    android::base::unique_fd fd(unix_open(dev.c_str(), O_RDONLY | O_CLOEXEC));
++    if (fd == -1) {
++        return false;
++    }
++    int off = 0;
++    return ioctl(fd.get(), BLKROSET, &off) != -1;
++}
++
++static bool remount_partition(unique_fd& fd, std::string_view dir) {
++    std::string mount_point(dir);
++    if (!directory_exists(mount_point)) {
++        return true;
++    }
++    std::string dev = find_mount(dir);
++    if (dev.empty()) {
++        WriteFdFmt(fd.get(), "remount of %.*s failed; mount not found\n",
++                   static_cast<int>(dir.size()), dir.data());
++        return false;
++    }
++    if (!make_block_device_writable(dev)) {
++        WriteFdFmt(fd.get(), "remount of %.*s failed; couldn't make block device %s writable: %s\n",
++                   static_cast<int>(dir.size()), dir.data(), dev.c_str(), strerror(errno));
++        return false;
++    }
++    if (mount(dev.c_str(), mount_point.c_str(), "none", MS_REMOUNT, nullptr) == -1) {
++        WriteFdFmt(fd.get(), "remount of %.*s failed: %s\n", static_cast<int>(dir.size()), dir.data(), strerror(errno));
++        return false;
++    }
++    return true;
++}
++
++static void remount_service(unique_fd fd) {
++    if (getuid() != 0) {
++        WriteFdExactly(fd.get(), "Not running as root. Try \"adb root\" first.\n");
++        return;
++    }
++    bool success = remount_partition(fd, "/");
++    WriteFdExactly(fd.get(), success ? "remount succeeded\n" : "remount failed\n");
++}
++
+ [[maybe_unused]] static unique_fd reboot_device(const std::string& name) {
+ #if defined(__ANDROID_RECOVERY__)
+     if (!__android_log_is_debuggable()) {
+@@ -157,10 +216,16 @@ static void spin_service(unique_fd fd) {
+         return create_service_thread("reboot", reboot_service);
+     }
+ #endif
+-    // Fall through
+-    std::string cmd = "/system/bin/reboot ";
+-    cmd += name;
+-    return StartSubprocess(cmd, nullptr, SubprocessType::kRaw, SubprocessProtocol::kNone);
++    auto reboot_service = [name](unique_fd fd) {
++        sync();
++        if (syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
++                    LINUX_REBOOT_CMD_RESTART2, "adb") != 0) {
++            WriteFdFmt(fd.get(), "reboot (%s) failed: %s\n", name.c_str(), strerror(errno));
++            return;
++        }
++        while (true) pause();
++    };
++    return create_service_thread("reboot", reboot_service);
+ }
+ 
+ struct ServiceSocket : public asocket {
+@@ -281,13 +346,11 @@ unique_fd daemon_service_to_fd(std::string_view name, atransport* transport) {
+     }
+ #endif
+ 
+-#if defined(__ANDROID__)
++#if !defined(__ANDROID_RECOVERY__)
+     if (name.starts_with("framebuffer:")) {
+         return create_service_thread("fb", framebuffer_service);
+     } else if (android::base::ConsumePrefix(&name, "remount:")) {
+-        std::string cmd = "/system/bin/remount ";
+-        cmd += name;
+-        return StartSubprocess(cmd, nullptr, SubprocessType::kRaw, SubprocessProtocol::kNone);
++        return create_service_thread("remount", remount_service);
+     } else if (android::base::ConsumePrefix(&name, "reboot:")) {
+         return reboot_device(std::string(name));
+     } else if (name.starts_with("root:")) {
+diff --git a/packages/modules/adb/sockets.cpp b/packages/modules/adb/sockets.cpp
+index f766f7e..8aa1e2b 100644
+--- a/packages/modules/adb/sockets.cpp
++++ b/packages/modules/adb/sockets.cpp
+@@ -337,7 +337,7 @@ static void local_socket_destroy(asocket* s) {
+ 
+     if (exit_on_close) {
+         D("local_socket_destroy: exiting");
+-        exit(0);
++        exit(exit_on_close - 1);
+     }
+ }
+ 
+@@ -473,9 +473,21 @@ asocket* create_local_service_socket(std::string_view name, atransport* transpor
+     LOG(VERBOSE) << "LS(" << s->id << "): bound to '" << name << "' via " << fd_value;
+ 
+ #if !ADB_HOST
+-    if ((name.starts_with("root:") && getuid() != 0 && __android_log_is_debuggable()) ||
+-        (name.starts_with("unroot:") && getuid() == 0) || name.starts_with("usb:") ||
+-        name.starts_with("tcpip:")) {
++    bool exit_on_close = false;
++#if defined(__ANDROID__)
++    exit_on_close = (name.starts_with("root:") && getuid() != 0 &&
++                     __android_log_is_debuggable()) ||
++                    (name.starts_with("unroot:") && getuid() == 0);
++#else
++    exit_on_close = (name.starts_with("root:") && getuid() != 0) ||
++                    (name.starts_with("unroot:") && getuid() == 0);
++#endif
++    // exit_on_close == 2: exit(1) — triggers Restart=on-failure (root/unroot)
++    // exit_on_close == 1: exit(0) — clean exit (usb/tcpip)
++    if (exit_on_close) {
++        D("LS(%d): enabling exit_on_close", s->id);
++        s->exit_on_close = 2;
++    } else if (name.starts_with("usb:") || name.starts_with("tcpip:")) {
+         D("LS(%d): enabling exit_on_close", s->id);
+         s->exit_on_close = 1;
+     }
+diff --git a/packages/modules/adb/transport.cpp b/packages/modules/adb/transport.cpp
+index b99e8bc..b89f495 100644
+--- a/packages/modules/adb/transport.cpp
++++ b/packages/modules/adb/transport.cpp
+@@ -1200,7 +1200,6 @@ const FeatureSet& supported_features() {
+             kFeatureAbb,
+             kFeatureFixedPushSymlinkTimestamp,
+             kFeatureAbbExec,
+-            kFeatureRemountShell,
+             kFeatureTrackApp,
+             kFeatureSendRecv2,
+             kFeatureSendRecv2Brotli,
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0007-libcutils-guard-Android-private-header-with-addition.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0007-libcutils-guard-Android-private-header-with-addition.patch
new file mode 100644
index 0000000000..aa5ffc2825
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0007-libcutils-guard-Android-private-header-with-addition.patch
@@ -0,0 +1,36 @@
+From 35e41ab351e03abcd2709f136c57df7bc4855532 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Wed, 10 Jun 2026 00:00:00 +0000
+Subject: [PATCH] libcutils: guard Android-private header with additional
+ __has_include check
+
+The properties.cpp file uses __has_include(<sys/system_properties.h>) to
+conditionally compile the Android bionic property system implementation.
+However, some Linux host environments (e.g. those with Android SDK headers
+installed in /usr/local/include) have sys/system_properties.h without the
+accompanying private header sys/_system_properties.h.
+
+Guard both the public and private header inclusion to prevent a fatal error
+on such hosts.
+
+Upstream-Status: Inappropriate [OE-specific, guards against host header contamination]
+
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ system/core/libcutils/properties.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/system/core/libcutils/properties.cpp b/system/core/libcutils/properties.cpp
+index 03f0496..fd0f6c3 100644
+--- a/system/core/libcutils/properties.cpp
++++ b/system/core/libcutils/properties.cpp
+@@ -91,7 +91,8 @@ int property_get(const char* key, char* value, const char* default_value) {
+     return len;
+ }
+ 
+-#if __has_include(<sys/system_properties.h>)
++#if __has_include(<sys/system_properties.h>) && \
++    __has_include(<sys/_system_properties.h>)
+ 
+ #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
+ #include <sys/_system_properties.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0008-adb-GCC-compatibility-fixes-for-usb_linux-and-sysdep.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0008-adb-GCC-compatibility-fixes-for-usb_linux-and-sysdep.patch
new file mode 100644
index 0000000000..ae7de97e49
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0008-adb-GCC-compatibility-fixes-for-usb_linux-and-sysdep.patch
@@ -0,0 +1,197 @@
+From 67a400310c07fad8f9ecc0058203942237ab6325 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Wed, 10 Jun 2026 00:00:00 +0000
+Subject: [PATCH] adb: GCC compatibility fixes for usb_linux, sysdeps, and adbd
+
+GCC-specific issues when building adb/adbd with GCC instead of Clang:
+
+1. usb_linux.cpp embeds usbdevfs_urb (which ends in a flexible array member
+   iso_frame_desc[]) in a non-last position inside struct usb_handle. GCC
+   rejects this as a hard error. Introduce usbdevfs_urb_bulk, a copy of the
+   struct without the FAM, for use in embedding contexts.
+
+2. sysdeps.h uses #define write/pwrite to redirect callers to adb_write/
+   adb_pwrite. GCC's newer abseil in the native sysroot calls ostream::write()
+   which gets incorrectly macro-expanded. Replace the #define redirects with
+   #pragma GCC poison.
+
+3. adbd.mk links -lprotobuf but with protobuf 6.x the abseil log helpers are
+   no longer pulled in transitively. Add -labsl_log_internal_message and
+   -labsl_log_internal_check_op explicitly.
+
+Upstream-Status: Inappropriate [OE-specific, GCC compat]
+
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ debian/system/adb.mk                      |  2 ++
+ debian/system/adbd.mk                     |  2 ++
+ packages/modules/adb/client/usb_linux.cpp | 44 ++++++++++++++++-------
+ packages/modules/adb/sysdeps.h            | 11 ++----
+ 4 files changed, 37 insertions(+), 22 deletions(-)
+
+diff --git a/debian/system/adb.mk b/debian/system/adb.mk
+index 90a816f..6c9b4ce 100644
+--- a/debian/system/adb.mk
++++ b/debian/system/adb.mk
+@@ -95,6 +95,8 @@ LDFLAGS += \
+   -llog \
+   -llz4 \
+   -lprotobuf \
++  -labsl_log_internal_message \
++  -labsl_log_internal_check_op \
+   -lpthread \
+   -l:libssl.so.0 \
+   -lusb-1.0 \
+diff --git a/debian/system/adbd.mk b/debian/system/adbd.mk
+index beb412e..e755f20 100644
+--- a/debian/system/adbd.mk
++++ b/debian/system/adbd.mk
+@@ -97,6 +97,8 @@ LDFLAGS += \
+   -llog \
+   -llz4 \
+   -lprotobuf \
++  -labsl_log_internal_message \
++  -labsl_log_internal_check_op \
+   -lresolv \
+   -l:libssl.so.0 \
+   -lzstd \
+diff --git a/packages/modules/adb/client/usb_linux.cpp b/packages/modules/adb/client/usb_linux.cpp
+index 96d7a8a..ecc1035 100644
+--- a/packages/modules/adb/client/usb_linux.cpp
++++ b/packages/modules/adb/client/usb_linux.cpp
+@@ -57,6 +57,27 @@ using namespace std::literals;
+ /* usb scan debugging is waaaay too verbose */
+ #define DBGX(x...)
+ 
++// usbdevfs_urb embeds a flexible array member iso_frame_desc[]. Embedding this
++// struct in another struct in a non-last position is a hard GCC error. Since
++// ADB only uses bulk endpoints (never ISO), define a wrapper type without the
++// FAM to use for struct embedding.
++struct usbdevfs_urb_bulk {
++    unsigned char type;
++    unsigned char endpoint;
++    int status;
++    unsigned int flags;
++    void* buffer;
++    int buffer_length;
++    int actual_length;
++    int start_frame;
++    union { int number_of_packets; unsigned int stream_id; };
++    int error_count;
++    unsigned int signr;
++    void* usercontext;
++};
++static_assert(sizeof(usbdevfs_urb_bulk) == sizeof(usbdevfs_urb),
++              "usbdevfs_urb_bulk size mismatch");
++
+ struct usb_handle {
+     ~usb_handle() {
+         if (fd != -1) unix_close(fd);
+@@ -74,11 +95,8 @@ struct usb_handle {
+     // The usbdevfs_urb structure ends in a variable length array of
+     // usbdevfs_iso_packet_desc. Since none of the usb calls ever attempt
+     // to fill in those values, ignore this warning.
+-#pragma clang diagnostic push
+-#pragma clang diagnostic ignored "-Wgnu-variable-sized-type-not-at-end"
+-    usbdevfs_urb urb_in;
+-    usbdevfs_urb urb_out;
+-#pragma clang diagnostic pop
++    usbdevfs_urb_bulk urb_in;
++    usbdevfs_urb_bulk urb_out;
+ 
+     bool urb_in_busy = false;
+     bool urb_out_busy = false;
+@@ -316,7 +334,7 @@ static int usb_bulk_write(usb_handle* h, const void* data, int len) {
+     std::unique_lock<std::mutex> lock(h->mutex);
+     D("++ usb_bulk_write ++");
+ 
+-    usbdevfs_urb* urb = &h->urb_out;
++    usbdevfs_urb_bulk* urb = &h->urb_out;
+     memset(urb, 0, sizeof(*urb));
+     urb->type = USBDEVFS_URB_TYPE_BULK;
+     urb->endpoint = h->ep_out;
+@@ -329,7 +347,7 @@ static int usb_bulk_write(usb_handle* h, const void* data, int len) {
+         return -1;
+     }
+ 
+-    if (TEMP_FAILURE_RETRY(ioctl(h->fd, USBDEVFS_SUBMITURB, urb)) == -1) {
++    if (TEMP_FAILURE_RETRY(ioctl(h->fd, USBDEVFS_SUBMITURB, reinterpret_cast<usbdevfs_urb*>(urb))) == -1) {
+         return -1;
+     }
+ 
+@@ -355,7 +373,7 @@ static int usb_bulk_read(usb_handle* h, void* data, int len) {
+     std::unique_lock<std::mutex> lock(h->mutex);
+     D("++ usb_bulk_read ++");
+ 
+-    usbdevfs_urb* urb = &h->urb_in;
++    usbdevfs_urb_bulk* urb = &h->urb_in;
+     memset(urb, 0, sizeof(*urb));
+     urb->type = USBDEVFS_URB_TYPE_BULK;
+     urb->endpoint = h->ep_in;
+@@ -368,7 +386,7 @@ static int usb_bulk_read(usb_handle* h, void* data, int len) {
+         return -1;
+     }
+ 
+-    if (TEMP_FAILURE_RETRY(ioctl(h->fd, USBDEVFS_SUBMITURB, urb)) == -1) {
++    if (TEMP_FAILURE_RETRY(ioctl(h->fd, USBDEVFS_SUBMITURB, reinterpret_cast<usbdevfs_urb*>(urb))) == -1) {
+         return -1;
+     }
+ 
+@@ -400,7 +418,7 @@ static int usb_bulk_read(usb_handle* h, void* data, int len) {
+         }
+         D("[ urb @%p status = %d, actual = %d ]", out, out->status, out->actual_length);
+ 
+-        if (out == &h->urb_in) {
++        if (out == reinterpret_cast<usbdevfs_urb*>(&h->urb_in)) {
+             D("[ reap urb - IN complete ]");
+             h->urb_in_busy = false;
+             if (urb->status != 0) {
+@@ -409,7 +427,7 @@ static int usb_bulk_read(usb_handle* h, void* data, int len) {
+             }
+             return urb->actual_length;
+         }
+-        if (out == &h->urb_out) {
++        if (out == reinterpret_cast<usbdevfs_urb*>(&h->urb_out)) {
+             D("[ reap urb - OUT compelete ]");
+             h->urb_out_busy = false;
+             h->cv.notify_all();
+@@ -513,8 +531,8 @@ void usb_kick(usb_handle* h) {
+             ** but this ensures that a reader blocked on REAPURB
+             ** will get unblocked
+             */
+-            ioctl(h->fd, USBDEVFS_DISCARDURB, &h->urb_in);
+-            ioctl(h->fd, USBDEVFS_DISCARDURB, &h->urb_out);
++            ioctl(h->fd, USBDEVFS_DISCARDURB, reinterpret_cast<usbdevfs_urb*>(&h->urb_in));
++            ioctl(h->fd, USBDEVFS_DISCARDURB, reinterpret_cast<usbdevfs_urb*>(&h->urb_out));
+             h->urb_in.status = -ENODEV;
+             h->urb_out.status = -ENODEV;
+             h->urb_in_busy = false;
+diff --git a/packages/modules/adb/sysdeps.h b/packages/modules/adb/sysdeps.h
+index 9a99295..b364a47 100644
+--- a/packages/modules/adb/sysdeps.h
++++ b/packages/modules/adb/sysdeps.h
+@@ -141,11 +141,7 @@ static inline int unix_read(borrowed_fd fd, void* buf, size_t len) {
+ static inline int unix_write(borrowed_fd fd, const void* buf, size_t len) {
+     return write(fd.get(), buf, len);
+ }
+-#undef   write
+-#define  write  ___xxx_write
+-
+-#undef pwrite
+-#define pwrite ___xxx_pwrite
++// (write and pwrite macros omitted: incompatible with GCC/abseil compat)
+ 
+ // See the comments for the !defined(_WIN32) version of unix_lseek().
+ static inline int unix_lseek(borrowed_fd fd, int pos, int where) {
+@@ -549,10 +545,7 @@ static inline int adb_pwrite(int fd, const void* buf, size_t len, off64_t offset
+ #endif
+ }
+ 
+-#undef   write
+-#define  write  ___xxx_write
+-#undef pwrite
+-#define pwrite ___xxx_pwrite
++// (write and pwrite macros omitted: incompatible with GCC/abseil compat)
+ 
+ static inline int64_t adb_lseek(borrowed_fd fd, int64_t pos, int where) {
+ #if defined(__APPLE__)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0009-libbase-include-stdint.h-in-hex.cpp.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0009-libbase-include-stdint.h-in-hex.cpp.patch
new file mode 100644
index 0000000000..179f97363f
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0009-libbase-include-stdint.h-in-hex.cpp.patch
@@ -0,0 +1,26 @@
+From 164b4261fd5abd851a432c7d56280b1b1adc7f2b Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Wed, 10 Jun 2026 00:00:00 +0000
+Subject: [PATCH] libbase: include stdint.h in hex.cpp
+
+hex.cpp uses uint8_t but neither the file nor its transitive headers
+always pull in <stdint.h> on every sysroot.  Add an explicit include.
+
+Upstream-Status: Inappropriate [OE-specific sysroot compat]
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ system/libbase/hex.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/system/libbase/hex.cpp b/system/libbase/hex.cpp
+index a4b7715..857ff29 100644
+--- a/system/libbase/hex.cpp
++++ b/system/libbase/hex.cpp
+@@ -15,6 +15,7 @@
+  */
+ 
+ #include "android-base/hex.h"
++#include <stdint.h>
+ 
+ #include "android-base/logging.h"
+ 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch
new file mode 100644
index 0000000000..a8c16a41d4
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch
@@ -0,0 +1,54 @@
+From 8874be8b9a3906c5720d75320b176b51523b6c15 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Fri, 12 Jun 2026 15:54:47 +0200
+Subject: [PATCH] adbd: make systemd sd_notify conditional on HAVE_SYSTEMD
+
+Guard the sd-daemon.h include and sd_notify() call behind HAVE_SYSTEMD
+instead of __linux__, so the feature is opt-in via a recipe PACKAGECONFIG.
+Add a corresponding ifeq block in debian/system/adbd.mk to pass
+-DHAVE_SYSTEMD and -lsystemd only when the flag is set.
+
+Upstream-Status: Inappropriate [OE-specific]
+---
+ debian/system/adbd.mk                | 5 +++++
+ packages/modules/adb/daemon/main.cpp | 4 ++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/debian/system/adbd.mk b/debian/system/adbd.mk
+index e755f20..a3f88f1 100644
+--- a/debian/system/adbd.mk
++++ b/debian/system/adbd.mk
+@@ -104,6 +104,11 @@ LDFLAGS += \
+   -lzstd \
+   -pie \
+ 
++ifeq ($(HAVE_SYSTEMD),1)
++LDFLAGS += -lsystemd
++CPPFLAGS += -DHAVE_SYSTEMD
++endif
++
+ STATIC_LIBS = \
+   debian/out/system/libadb.a \
+   debian/out/system/libcrypto_utils.a \
+diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
+index f177abf..789c25b 100644
+--- a/packages/modules/adb/daemon/main.cpp
++++ b/packages/modules/adb/daemon/main.cpp
+@@ -49,7 +49,7 @@
+ #include "selinux/android.h"
+ #endif
+ 
+-#if defined(__linux__)
++#if defined(HAVE_SYSTEMD)
+ #include <systemd/sd-daemon.h>
+ #endif
+ 
+@@ -365,7 +365,7 @@ int adbd_main(int server_port) {
+     init_jdwp();
+     D("adbd_main(): post init_jdwp()");
+ 
+-#if defined(__linux__)
++#if defined(HAVE_SYSTEMD)
+     sd_notify(1, "READY=1");
+ #endif
+ 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
deleted file mode 100644
index 709a166887..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
+++ /dev/null
@@ -1,90 +0,0 @@
-include rules_yocto.mk
-NAME = adbd
-
-SOURCES = \
-	adb/adbconnection/adbconnection_server.cpp \
-	adb/daemon/auth.cpp \
-	adb/daemon/file_sync_service.cpp \
-	adb/daemon/framebuffer_service.cpp \
-	adb/daemon/jdwp_service.cpp \
-	adb/daemon/main.cpp \
-	adb/daemon/restart_service.cpp \
-	adb/daemon/services.cpp \
-	adb/daemon/shell_service.cpp \
-	adb/daemon/usb_ffs.cpp \
-	adb/daemon/usb_legacy.cpp \
-	adb/daemon/usb.cpp \
-	adb/shell_service_protocol.cpp \
-	adb/adb.cpp \
-	adb/adb_io.cpp \
-	adb/adb_listeners.cpp \
-	adb/adb_trace.cpp \
-	adb/adb_unique_fd.cpp \
-	adb/adb_utils.cpp \
-	adb/fdevent/fdevent.cpp \
-	adb/fdevent/fdevent_epoll.cpp \
-	adb/services.cpp \
-	adb/sockets.cpp \
-	adb/socket_spec.cpp \
-	adb/sysdeps/errno.cpp \
-	adb/sysdeps/posix/network.cpp \
-	adb/sysdeps_unix.cpp \
-	adb/transport.cpp \
-	adb/transport_fd.cpp \
-	adb/transport_local.cpp \
-	adb/transport_usb.cpp \
-	adb/types.cpp \
-	diagnose_usb/diagnose_usb.cpp \
-	libasyncio/AsyncIO.cpp \
-
-HEADERS = \
-        adb/daemon/file_sync_service.h \
-        adb/daemon/framebuffer_service.h \
-        adb/daemon/restart_service.h \
-        adb/daemon/shell_service.h
-
-SOURCES := $(foreach source, $(SOURCES), system/core/$(source))
-HEADERS := $(foreach header, $(HEADERS), system/core/$(header))
-
-SOURCES += \
-    frameworks/native/libs/adbd_auth/adbd_auth.cpp
-
-CXXFLAGS += -std=gnu++20
-CPPFLAGS += -Isystem/coreinclude -Isystem/core/adb -Isystem/core/base/include  -Idebian/out/system/core -Isystem/tools/mkbootimg/include/bootimg -Isystem/core/fs_mgr/include \
-	    -Isystem/core/fs_mgr/include_fstab \
-            -DADB_VERSION='"$(DEB_VERSION)"' -D_GNU_SOURCE
-LDFLAGS += -Wl,-rpath='$$ORIGIN/../lib/android' -Wl,-rpath-link='$$ORIGIN/../lib/android' \
-           -lpthread -Ldebian/out/system/core -Ldebian/out/external/boringssl -lbase -lcrypto_utils -l:libcrypto.a -lcutils -llog -lresolv
-
-PAGE_SIZE ?= 4096
-
-CXXFLAGS += -UADB_HOST
-CXXFLAGS +=	-DADB_HOST=0
-CXXFLAGS += -DALLOW_ADBD_DISABLE_VERITY
-CXXFLAGS += -DALLOW_ADBD_NO_AUTH
-CXXFLAGS += -DPLATFORM_TOOLS_VERSION='"28.0.2"' 
-CXXFLAGS += -Isystem/core/diagnose_usb/include 
-CXXFLAGS += -Isystem/core/adb/daemon/include
-CXXFLAGS += -Isystem/core/adb/adbconnection/include
-CXXFLAGS += -Isystem/core/libasyncio/include
-CXXFLAGS += -Isystem/core/libcutils/include
-CXXFLAGS += -Isystem/core/libcrypto_utils/include
-CXXFLAGS += -Isystem/core/liblog/include/
-CXXFLAGS += -Isystem/core/libutils/include
-CXXFLAGS += -Iframeworks/native/libs/adbd_auth/include
-CXXFLAGS += -Wno-c++11-narrowing 
-CXXFLAGS += -DPAGE_SIZE=$(PAGE_SIZE)
-
-
-# -latomic should be the last library specified
-# https://github.com/android/ndk/issues/589
-ifneq ($(filter armel mipsel,$(DEB_HOST_ARCH)),)
-  LDFLAGS += -latomic
-endif
-
-build: $(SOURCES) $(HEADERS)
-	mkdir --parents debian/out/system/core
-	$(CXX) $(SOURCES) -o debian/out/system/core/adbd $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
-
-clean:
-	$(RM) debian/out/system/core/adbd
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
index b6661f2e39..7c16b5cea2 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
@@ -4,7 +4,7 @@ ConditionPathExists=/etc/usb-debugging-enabled
 Before=android-system.service
 
 [Service]
-Type=simple
+Type=notify
 Restart=on-failure
 ExecStartPre=-/usr/bin/android-gadget-setup adb
 ExecStart=/usr/bin/adbd
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/Add-riscv64-support.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/Add-riscv64-support.patch
deleted file mode 100644
index 9fd0fa792c..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/Add-riscv64-support.patch
+++ /dev/null
@@ -1,653 +0,0 @@
-From: Guo Ren <guoren@linux.alibaba.com>
-Date: Wed, 29 Jun 2022 16:46:46 +0800
-Subject: Add riscv64 support
-
-This patch contains the dwarf unwind support for 64bit risc-v.
-
-    * DwarfCfa.cpp (cfa_def_cfa_register): setup register if CFA_REG is
-    not setup for riscv64
-    * Elf.cpp (GetRelPc): convert offset to virtual address for riscv64.
-    * ElfInterface.cpp (GetVirtAddrFromOffset): New for riscv64.
-    * RegsRiscv64.cpp (StepIfSignalHandler): Fix signal frame check.
-    libunwindstack/include/unwindstack/
-    * ElfInterface.h (GetVirtAddrFromOffset): New for riscv64.
-    libunwindstack/tests/
-    * DwarfCfaTest.cpp (cfa_def_cfa_register): ok for riscv64.
-    * RegsStepIfSignalHandlerTest.cpp (riscv64_step_if_signal_handler): Fix
-    testcase for riscv64
-
-Test: Builds.
-Test: All unit tests pass.
-
-Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
-Signed-off-by: Lifang Xia <lifang_xia@linux.alibaba.com>
-Signed-off-by: Mao Han <han_mao@linux.alibaba.com>
-Change-Id: Ib21ddf23cc83f332af202df7bffcaceec16063e0
----
-Upstream-Status: Pending
-
- system/core/libunwindstack/Android.bp              |   1 +
- system/core/libunwindstack/Elf.cpp                 |   2 +
- system/core/libunwindstack/Regs.cpp                |  10 ++
- system/core/libunwindstack/RegsRiscv64.cpp         | 156 +++++++++++++++++++++
- .../core/libunwindstack/include/unwindstack/Elf.h  |   5 +
- .../include/unwindstack/MachineRiscv64.h           |  59 ++++++++
- .../include/unwindstack/RegsGetLocal.h             |  43 ++++++
- .../include/unwindstack/RegsRiscv64.h              |  59 ++++++++
- .../include/unwindstack/UcontextRiscv64.h          |  80 +++++++++++
- .../include/unwindstack/UserRiscv64.h              |  37 +++++
- system/core/libunwindstack/tools/unwind.cpp        |   3 +
- .../core/libunwindstack/tools/unwind_symbols.cpp   |   3 +
- 12 files changed, 458 insertions(+)
- create mode 100644 system/core/libunwindstack/RegsRiscv64.cpp
- create mode 100644 system/core/libunwindstack/include/unwindstack/MachineRiscv64.h
- create mode 100644 system/core/libunwindstack/include/unwindstack/RegsRiscv64.h
- create mode 100644 system/core/libunwindstack/include/unwindstack/UcontextRiscv64.h
- create mode 100644 system/core/libunwindstack/include/unwindstack/UserRiscv64.h
-
-diff --git a/system/core/libunwindstack/Android.bp b/system/core/libunwindstack/Android.bp
-index 3695f72..f1f9c68 100644
---- a/system/core/libunwindstack/Android.bp
-+++ b/system/core/libunwindstack/Android.bp
-@@ -70,6 +70,7 @@ cc_library {
-         "RegsArm64.cpp",
-         "RegsX86.cpp",
-         "RegsX86_64.cpp",
-+        "RegsRiscv64.cpp",
-         "RegsMips.cpp",
-         "RegsMips64.cpp",
-         "Unwinder.cpp",
-diff --git a/system/core/libunwindstack/Elf.cpp b/system/core/libunwindstack/Elf.cpp
-index f01b092..3c2088b 100644
---- a/system/core/libunwindstack/Elf.cpp
-+++ b/system/core/libunwindstack/Elf.cpp
-@@ -290,6 +290,8 @@ ElfInterface* Elf::CreateInterfaceFromMemory(Memory* memory) {
-       arch_ = ARCH_X86_64;
-     } else if (e_machine == EM_MIPS) {
-       arch_ = ARCH_MIPS64;
-+    } else if (e_machine == EM_RISCV) {
-+      arch_ = ARCH_RISCV64;
-     } else {
-       // Unsupported.
-       ALOGI("64 bit elf that is neither aarch64 nor x86_64 nor mips64: e_machine = %d\n",
-diff --git a/system/core/libunwindstack/Regs.cpp b/system/core/libunwindstack/Regs.cpp
-index c7dec52..447a554 100644
---- a/system/core/libunwindstack/Regs.cpp
-+++ b/system/core/libunwindstack/Regs.cpp
-@@ -27,12 +27,14 @@
- #include <unwindstack/RegsArm64.h>
- #include <unwindstack/RegsMips.h>
- #include <unwindstack/RegsMips64.h>
-+#include <unwindstack/RegsRiscv64.h>
- #include <unwindstack/RegsX86.h>
- #include <unwindstack/RegsX86_64.h>
- #include <unwindstack/UserArm.h>
- #include <unwindstack/UserArm64.h>
- #include <unwindstack/UserMips.h>
- #include <unwindstack/UserMips64.h>
-+#include <unwindstack/UserRiscv64.h>
- #include <unwindstack/UserX86.h>
- #include <unwindstack/UserX86_64.h>
- 
-@@ -67,6 +69,8 @@ Regs* Regs::RemoteGet(pid_t pid) {
-     return RegsMips::Read(buffer.data());
-   case sizeof(mips64_user_regs):
-     return RegsMips64::Read(buffer.data());
-+  case sizeof(riscv64_user_regs):
-+    return RegsRiscv64::Read(buffer.data());
-   }
-   return nullptr;
- }
-@@ -85,6 +89,8 @@ Regs* Regs::CreateFromUcontext(ArchEnum arch, void* ucontext) {
-       return RegsMips::CreateFromUcontext(ucontext);
-     case ARCH_MIPS64:
-       return RegsMips64::CreateFromUcontext(ucontext);
-+    case ARCH_RISCV64:
-+      return RegsRiscv64::CreateFromUcontext(ucontext);
-     case ARCH_UNKNOWN:
-     default:
-       return nullptr;
-@@ -104,6 +110,8 @@ ArchEnum Regs::CurrentArch() {
-   return ARCH_MIPS;
- #elif defined(__mips__) && defined(__LP64__)
-   return ARCH_MIPS64;
-+#elif defined(__riscv)
-+  return ARCH_RISCV64;
- #else
-   abort();
- #endif
-@@ -123,6 +131,8 @@ Regs* Regs::CreateFromLocal() {
-   regs = new RegsMips();
- #elif defined(__mips__) && defined(__LP64__)
-   regs = new RegsMips64();
-+#elif defined(__riscv)
-+  regs = new RegsRiscv64();
- #else
-   abort();
- #endif
-diff --git a/system/core/libunwindstack/RegsRiscv64.cpp b/system/core/libunwindstack/RegsRiscv64.cpp
-new file mode 100644
-index 0000000..887762a
---- /dev/null
-+++ b/system/core/libunwindstack/RegsRiscv64.cpp
-@@ -0,0 +1,156 @@
-+/*
-+ * Copyright (C) 2022 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#include <stdint.h>
-+#include <string.h>
-+
-+#include <functional>
-+
-+#include <unwindstack/Elf.h>
-+#include <unwindstack/MachineRiscv64.h>
-+#include <unwindstack/MapInfo.h>
-+#include <unwindstack/Memory.h>
-+#include <unwindstack/RegsRiscv64.h>
-+#include <unwindstack/UcontextRiscv64.h>
-+#include <unwindstack/UserRiscv64.h>
-+
-+namespace unwindstack {
-+
-+RegsRiscv64::RegsRiscv64()
-+    : RegsImpl<uint64_t>(RISCV64_REG_MAX, Location(LOCATION_REGISTER, RISCV64_REG_RA)) {}
-+
-+ArchEnum RegsRiscv64::Arch() {
-+  return ARCH_RISCV64;
-+}
-+
-+uint64_t RegsRiscv64::pc() {
-+  return regs_[RISCV64_REG_PC];
-+}
-+
-+uint64_t RegsRiscv64::sp() {
-+  return regs_[RISCV64_REG_SP];
-+}
-+
-+void RegsRiscv64::set_pc(uint64_t pc) {
-+  regs_[RISCV64_REG_PC] = pc;
-+}
-+
-+void RegsRiscv64::set_sp(uint64_t sp) {
-+  regs_[RISCV64_REG_SP] = sp;
-+}
-+
-+uint64_t RegsRiscv64::GetPcAdjustment(uint64_t rel_pc, Elf*) {
-+  if (rel_pc < 8) {
-+    return 0;
-+  }
-+  // For now, just assume no compact branches
-+  return 8;
-+}
-+
-+bool RegsRiscv64::SetPcFromReturnAddress(Memory*) {
-+  uint64_t ra = regs_[RISCV64_REG_RA];
-+  if (regs_[RISCV64_REG_PC] == ra) {
-+    return false;
-+  }
-+
-+  regs_[RISCV64_REG_PC] = ra;
-+  return true;
-+}
-+
-+void RegsRiscv64::IterateRegisters(std::function<void(const char*, uint64_t)> fn) {
-+  fn("pc", regs_[RISCV64_REG_PC]);
-+  fn("ra", regs_[RISCV64_REG_RA]);
-+  fn("sp", regs_[RISCV64_REG_SP]);
-+  fn("gp", regs_[RISCV64_REG_GP]);
-+  fn("tp", regs_[RISCV64_REG_TP]);
-+  fn("t0", regs_[RISCV64_REG_T0]);
-+  fn("t1", regs_[RISCV64_REG_T1]);
-+  fn("t2", regs_[RISCV64_REG_T2]);
-+  fn("t3", regs_[RISCV64_REG_T3]);
-+  fn("t4", regs_[RISCV64_REG_T4]);
-+  fn("t5", regs_[RISCV64_REG_T5]);
-+  fn("t6", regs_[RISCV64_REG_T6]);
-+  fn("s0", regs_[RISCV64_REG_S0]);
-+  fn("s1", regs_[RISCV64_REG_S1]);
-+  fn("s2", regs_[RISCV64_REG_S2]);
-+  fn("s3", regs_[RISCV64_REG_S3]);
-+  fn("s4", regs_[RISCV64_REG_S4]);
-+  fn("s5", regs_[RISCV64_REG_S5]);
-+  fn("s6", regs_[RISCV64_REG_S6]);
-+  fn("s7", regs_[RISCV64_REG_S7]);
-+  fn("s8", regs_[RISCV64_REG_S8]);
-+  fn("s9", regs_[RISCV64_REG_S9]);
-+  fn("s10", regs_[RISCV64_REG_S10]);
-+  fn("s11", regs_[RISCV64_REG_S11]);
-+  fn("a0", regs_[RISCV64_REG_A0]);
-+  fn("a1", regs_[RISCV64_REG_A1]);
-+  fn("a2", regs_[RISCV64_REG_A2]);
-+  fn("a3", regs_[RISCV64_REG_A3]);
-+  fn("a4", regs_[RISCV64_REG_A4]);
-+  fn("a5", regs_[RISCV64_REG_A5]);
-+  fn("a6", regs_[RISCV64_REG_A6]);
-+  fn("a7", regs_[RISCV64_REG_A7]);
-+}
-+
-+Regs* RegsRiscv64::Read(void* remote_data) {
-+  riscv64_user_regs* user = reinterpret_cast<riscv64_user_regs*>(remote_data);
-+
-+  RegsRiscv64* regs = new RegsRiscv64();
-+  memcpy(regs->RawData(), &user->regs[0], RISCV64_REG_MAX * sizeof(uint64_t));
-+  // uint64_t* reg_data = reinterpret_cast<uint64_t*>(regs->RawData());
-+  return regs;
-+}
-+
-+Regs* RegsRiscv64::CreateFromUcontext(void* ucontext) {
-+  riscv64_ucontext_t* riscv64_ucontext = reinterpret_cast<riscv64_ucontext_t*>(ucontext);
-+
-+  RegsRiscv64* regs = new RegsRiscv64();
-+  memcpy(regs->RawData(), &riscv64_ucontext->uc_mcontext.__gregs[0],
-+         RISCV64_REG_MAX * sizeof(uint64_t));
-+  return regs;
-+}
-+
-+bool RegsRiscv64::StepIfSignalHandler(uint64_t elf_offset, Elf* elf, Memory* process_memory) {
-+  uint64_t data;
-+  Memory* elf_memory = elf->memory();
-+  // Read from elf memory since it is usually more expensive to read from
-+  // process memory.
-+  if (!elf_memory->ReadFully(elf_offset, &data, sizeof(data))) {
-+    return false;
-+  }
-+  // Look for the kernel sigreturn function.
-+  // __kernel_rt_sigreturn:
-+  // li a7, __NR_rt_sigreturn
-+  // scall
-+
-+  const uint8_t li_scall[] = {0x93, 0x08, 0xb0, 0x08, 0x73, 0x00, 0x00, 0x00};
-+  if (memcmp(&data, &li_scall, 8) != 0) {
-+    return false;
-+  }
-+
-+  // SP + sizeof(siginfo_t) + uc_mcontext offset + PC offset.
-+  if (!process_memory->ReadFully(regs_[RISCV64_REG_SP] + 0x80 + 0xb0 + 0x00, regs_.data(),
-+                                 sizeof(uint64_t) * (RISCV64_REG_MAX))) {
-+    return false;
-+  }
-+  return true;
-+}
-+
-+Regs* RegsRiscv64::Clone() {
-+  return new RegsRiscv64(*this);
-+}
-+
-+}  // namespace unwindstack
-diff --git a/system/core/libunwindstack/include/unwindstack/Elf.h b/system/core/libunwindstack/include/unwindstack/Elf.h
-index 472ed92..88fa0ff 100644
---- a/system/core/libunwindstack/include/unwindstack/Elf.h
-+++ b/system/core/libunwindstack/include/unwindstack/Elf.h
-@@ -32,6 +32,10 @@
- #define EM_AARCH64 183
- #endif
- 
-+#if !defined(EM_RISCV)
-+#define EM_RISCV 243
-+#endif
-+
- namespace unwindstack {
- 
- // Forward declaration.
-@@ -46,6 +50,7 @@ enum ArchEnum : uint8_t {
-   ARCH_X86_64,
-   ARCH_MIPS,
-   ARCH_MIPS64,
-+  ARCH_RISCV64,
- };
- 
- class Elf {
-diff --git a/system/core/libunwindstack/include/unwindstack/MachineRiscv64.h b/system/core/libunwindstack/include/unwindstack/MachineRiscv64.h
-new file mode 100644
-index 0000000..397e680
---- /dev/null
-+++ b/system/core/libunwindstack/include/unwindstack/MachineRiscv64.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (C) 2022 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#pragma once
-+
-+#include <stdint.h>
-+
-+namespace unwindstack {
-+
-+enum Riscv64Reg : uint16_t {
-+  RISCV64_REG_PC,
-+  RISCV64_REG_RA,
-+  RISCV64_REG_SP,
-+  RISCV64_REG_GP,
-+  RISCV64_REG_TP,
-+  RISCV64_REG_T0,
-+  RISCV64_REG_T1,
-+  RISCV64_REG_T2,
-+  RISCV64_REG_S0,
-+  RISCV64_REG_S1,
-+  RISCV64_REG_A0,
-+  RISCV64_REG_A1,
-+  RISCV64_REG_A2,
-+  RISCV64_REG_A3,
-+  RISCV64_REG_A4,
-+  RISCV64_REG_A5,
-+  RISCV64_REG_A6,
-+  RISCV64_REG_A7,
-+  RISCV64_REG_S2,
-+  RISCV64_REG_S3,
-+  RISCV64_REG_S4,
-+  RISCV64_REG_S5,
-+  RISCV64_REG_S6,
-+  RISCV64_REG_S7,
-+  RISCV64_REG_S8,
-+  RISCV64_REG_S9,
-+  RISCV64_REG_S10,
-+  RISCV64_REG_S11,
-+  RISCV64_REG_T3,
-+  RISCV64_REG_T4,
-+  RISCV64_REG_T5,
-+  RISCV64_REG_T6,
-+  RISCV64_REG_MAX,
-+};
-+
-+}  // namespace unwindstack
-diff --git a/system/core/libunwindstack/include/unwindstack/RegsGetLocal.h b/system/core/libunwindstack/include/unwindstack/RegsGetLocal.h
-index f0b5e3a..698eba2 100644
---- a/system/core/libunwindstack/include/unwindstack/RegsGetLocal.h
-+++ b/system/core/libunwindstack/include/unwindstack/RegsGetLocal.h
-@@ -81,6 +81,49 @@ inline __attribute__((__always_inline__)) void AsmGetRegs(void* reg_data) {
-       : "x12", "x13", "memory");
- }
- 
-+#elif defined(__riscv)
-+
-+inline __attribute__((__always_inline__)) void AsmGetRegs(void* reg_data) {
-+  asm volatile(
-+      "1:\n"
-+      "sd ra, 8(%[base])\n"
-+      "sd sp, 16(%[base])\n"
-+      "sd gp, 24(%[base])\n"
-+      "sd tp, 32(%[base])\n"
-+      "sd t0, 40(%[base])\n"
-+      "sd t1, 48(%[base])\n"
-+      "sd t2, 56(%[base])\n"
-+      "sd s0, 64(%[base])\n"
-+      "sd s1, 72(%[base])\n"
-+      "sd a0, 80(%[base])\n"
-+      "sd a1, 88(%[base])\n"
-+      "sd a2, 96(%[base])\n"
-+      "sd a3, 104(%[base])\n"
-+      "sd a4, 112(%[base])\n"
-+      "sd a5, 120(%[base])\n"
-+      "sd a6, 128(%[base])\n"
-+      "sd a7, 136(%[base])\n"
-+      "sd s2, 144(%[base])\n"
-+      "sd s3, 152(%[base])\n"
-+      "sd s4, 160(%[base])\n"
-+      "sd s5, 168(%[base])\n"
-+      "sd s6, 176(%[base])\n"
-+      "sd s7, 184(%[base])\n"
-+      "sd s8, 192(%[base])\n"
-+      "sd s9, 200(%[base])\n"
-+      "sd s10, 208(%[base])\n"
-+      "sd s11, 216(%[base])\n"
-+      "sd t3, 224(%[base])\n"
-+      "sd t4, 232(%[base])\n"
-+      "sd t5, 240(%[base])\n"
-+      "sd t6, 248(%[base])\n"
-+      "la t1, 1b\n"
-+      "sd t1, 0(%[base])\n"
-+      : [base] "+r"(reg_data)
-+      :
-+      : "t1", "memory");
-+}
-+
- #elif defined(__i386__) || defined(__x86_64__) || defined(__mips__)
- 
- extern "C" void AsmGetRegs(void* regs);
-diff --git a/system/core/libunwindstack/include/unwindstack/RegsRiscv64.h b/system/core/libunwindstack/include/unwindstack/RegsRiscv64.h
-new file mode 100644
-index 0000000..eb09397
---- /dev/null
-+++ b/system/core/libunwindstack/include/unwindstack/RegsRiscv64.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (C) 2022 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#pragma once
-+
-+#include <stdint.h>
-+
-+#include <functional>
-+
-+#include <unwindstack/Elf.h>
-+#include <unwindstack/Regs.h>
-+
-+namespace unwindstack {
-+
-+// Forward declarations.
-+class Memory;
-+
-+class RegsRiscv64 : public RegsImpl<uint64_t> {
-+ public:
-+  RegsRiscv64();
-+  virtual ~RegsRiscv64() = default;
-+
-+  ArchEnum Arch() override final;
-+
-+  uint64_t GetPcAdjustment(uint64_t rel_pc, Elf* elf) override;
-+
-+  bool SetPcFromReturnAddress(Memory* process_memory) override;
-+
-+  bool StepIfSignalHandler(uint64_t elf_offset, Elf* elf, Memory* process_memory) override;
-+
-+  void IterateRegisters(std::function<void(const char*, uint64_t)>) override final;
-+
-+  uint64_t pc() override;
-+  uint64_t sp() override;
-+
-+  void set_pc(uint64_t pc) override;
-+  void set_sp(uint64_t sp) override;
-+
-+  Regs* Clone() override final;
-+
-+  static Regs* Read(void* data);
-+
-+  static Regs* CreateFromUcontext(void* ucontext);
-+};
-+
-+}  // namespace unwindstack
-diff --git a/system/core/libunwindstack/include/unwindstack/UcontextRiscv64.h b/system/core/libunwindstack/include/unwindstack/UcontextRiscv64.h
-new file mode 100644
-index 0000000..c6c82b1
---- /dev/null
-+++ b/system/core/libunwindstack/include/unwindstack/UcontextRiscv64.h
-@@ -0,0 +1,80 @@
-+/*
-+ * Copyright (C) 2014 The Android Open Source Project
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ *  * Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ *  * Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in
-+ *    the documentation and/or other materials provided with the
-+ *    distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
-+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
-+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
-+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
-+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
-+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-+ * SUCH DAMAGE.
-+ */
-+
-+#pragma once
-+
-+#include <sys/cdefs.h>
-+
-+typedef uint64_t __riscv_mc_gp_state[32];  // unsigned long
-+
-+struct __riscv_mc_f_ext_state {
-+  uint32_t __f[32];
-+  uint32_t __fcsr;
-+};
-+
-+struct __riscv_mc_d_ext_state {
-+  uint64_t __f[32];
-+  uint32_t __fcsr;
-+};
-+
-+struct __riscv_mc_q_ext_state {
-+  uint64_t __f[64] __attribute__((__aligned__(16)));
-+  uint32_t __fcsr;
-+  uint32_t __reserved[3];
-+};
-+
-+union __riscv_mc_fp_state {
-+  struct __riscv_mc_f_ext_state __f;
-+  struct __riscv_mc_d_ext_state __d;
-+  struct __riscv_mc_q_ext_state __q;
-+};
-+
-+struct __riscv_stack_t {
-+  uint64_t ss_sp;
-+  int32_t ss_flags;
-+  uint64_t ss_size;
-+};
-+
-+struct riscv64_sigset_t {
-+  uint64_t sig;  // unsigned long
-+};
-+
-+struct riscv64_mcontext_t {
-+  __riscv_mc_gp_state __gregs;
-+  union __riscv_mc_fp_state __fpregs;
-+};
-+
-+struct riscv64_ucontext_t {
-+  uint64_t uc_flags;  // unsigned long
-+  struct riscv64_ucontext_t* uc_link;
-+  __riscv_stack_t uc_stack;
-+  riscv64_sigset_t uc_sigmask;
-+  /* The kernel adds extra padding here to allow sigset_t to grow. */
-+  int8_t __padding[128 - sizeof(riscv64_sigset_t)];  // char
-+  riscv64_mcontext_t uc_mcontext;
-+};
-diff --git a/system/core/libunwindstack/include/unwindstack/UserRiscv64.h b/system/core/libunwindstack/include/unwindstack/UserRiscv64.h
-new file mode 100644
-index 0000000..1e91228
---- /dev/null
-+++ b/system/core/libunwindstack/include/unwindstack/UserRiscv64.h
-@@ -0,0 +1,37 @@
-+/*
-+ * Copyright (C) 2016 The Android Open Source Project
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ *  * Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ *  * Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in
-+ *    the documentation and/or other materials provided with the
-+ *    distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
-+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
-+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
-+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
-+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
-+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-+ * SUCH DAMAGE.
-+ */
-+
-+#pragma once
-+
-+namespace unwindstack {
-+
-+struct riscv64_user_regs {
-+  uint64_t regs[32];
-+};
-+
-+}  // namespace unwindstack
-diff --git a/system/core/libunwindstack/tools/unwind.cpp b/system/core/libunwindstack/tools/unwind.cpp
-index 1812e50..ae20891 100644
---- a/system/core/libunwindstack/tools/unwind.cpp
-+++ b/system/core/libunwindstack/tools/unwind.cpp
-@@ -83,6 +83,9 @@ void DoUnwind(pid_t pid) {
-     case unwindstack::ARCH_MIPS64:
-       printf("mips64");
-       break;
-+    case unwindstack::ARCH_RISCV64:
-+      printf("riscv64");
-+      break;
-     default:
-       printf("unknown\n");
-       return;
-diff --git a/system/core/libunwindstack/tools/unwind_symbols.cpp b/system/core/libunwindstack/tools/unwind_symbols.cpp
-index 8df2284..976db56 100644
---- a/system/core/libunwindstack/tools/unwind_symbols.cpp
-+++ b/system/core/libunwindstack/tools/unwind_symbols.cpp
-@@ -77,6 +77,9 @@ int main(int argc, char** argv) {
-     case EM_AARCH64:
-       printf("ABI: arm64\n");
-       break;
-+    case EM_RISCV:
-+      printf("ABI: riscv64\n");
-+      break;
-     case EM_386:
-       printf("ABI: x86\n");
-       break;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/Added-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/Added-missing-headers.patch
deleted file mode 100644
index d827d7d3c2..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/Added-missing-headers.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-Description: Added missing headers causing compile errors
-Author: Umang Parmar <umangjparmar@gmail.com>
-Forwarded: not-needed
-
---- a/system/core/adb/sysdeps/posix/network.cpp
-+++ b/system/core/adb/sysdeps/posix/network.cpp
-@@ -22,6 +22,7 @@
- #include <sys/socket.h>
- 
- #include <string>
-+#include <cstring>
- 
- #include <android-base/logging.h>
- #include <android-base/stringprintf.h>
---- a/system/core/base/file.cpp
-+++ b/system/core/base/file.cpp
-@@ -26,6 +26,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <cstring>
- 
- #include <memory>
- #include <mutex>
---- a/system/core/libbacktrace/BacktraceMap.cpp
-+++ b/system/core/libbacktrace/BacktraceMap.cpp
-@@ -21,6 +21,7 @@
- #include <stdint.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <algorithm>
- 
- #include <log/log.h>
- 
---- a/system/core/libbacktrace/UnwindStackMap.cpp
-+++ b/system/core/libbacktrace/UnwindStackMap.cpp
-@@ -20,6 +20,7 @@
- 
- #include <string>
- #include <vector>
-+#include <algorithm>
- 
- #include <backtrace/BacktraceMap.h>
- #include <unwindstack/Elf.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/Nonnull.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/Nonnull.patch
deleted file mode 100644
index 54bd52c61a..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/Nonnull.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-Description: Bring Clang's _Nonnull keyword to GCC
-Author: Kai-Chung Yan
-Forwarded: not-needed
---- a/system/core/adb/sysdeps.h
-+++ b/system/core/adb/sysdeps.h
-@@ -40,11 +40,12 @@
- #include "sysdeps/network.h"
- #include "sysdeps/stat.h"
- 
-+#define _Nonnull
-+#define _Nullable
-+
- #ifdef _WIN32
- 
- // Clang-only nullability specifiers
--#define _Nonnull
--#define _Nullable
- 
- #include <ctype.h>
- #include <direct.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/Vector-cast.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/Vector-cast.patch
deleted file mode 100644
index b2881e0213..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/Vector-cast.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Description: Fix the weird error by GCC7 that fails to match the correct parent method.
-Author: Kai-Chung Yan
-Forwarded: not-needed
---- a/system/core/libutils/include/utils/Vector.h
-+++ b/system/core/libutils/include/utils/Vector.h
-@@ -256,7 +256,7 @@
- 
- template<class TYPE> inline
- const Vector<TYPE>& Vector<TYPE>::operator = (const Vector<TYPE>& rhs) const {
--    VectorImpl::operator = (static_cast<const VectorImpl&>(rhs));
-+    VectorImpl::operator = (rhs);
-     return *this;
- }
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/add-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/add-missing-headers.patch
deleted file mode 100644
index 681d2c6553..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/add-missing-headers.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Pending
-
-Forwarded: not-needed
---- a/system/core/fs_mgr/liblp/reader.cpp
-+++ b/system/core/fs_mgr/liblp/reader.cpp
-@@ -22,6 +22,7 @@
- #include <unistd.h>
- 
- #include <functional>
-+#include <cstring>
- 
- #include <android-base/file.h>
- #include <android-base/unique_fd.h>
---- a/system/core/fs_mgr/liblp/writer.cpp
-+++ b/system/core/fs_mgr/liblp/writer.cpp
-@@ -21,6 +21,7 @@
- #include <unistd.h>
- 
- #include <string>
-+#include <cstring>
- 
- #include <android-base/file.h>
- #include <android-base/unique_fd.h>
---- a/system/core/liblog/logger_write.cpp
-+++ b/system/core/liblog/logger_write.cpp
-@@ -27,6 +27,7 @@
- #include <android/set_abort_message.h>
- #endif
- 
-+#include <mutex>
- #include <shared_mutex>
- 
- #include <android-base/errno_restorer.h>
---- a/system/core/libziparchive/zip_archive_stream_entry.cc
-+++ b/system/core/libziparchive/zip_archive_stream_entry.cc
-@@ -23,6 +23,7 @@
- #include <sys/types.h>
- #include <unistd.h>
- 
-+#include <limits>
- #include <memory>
- #include <vector>
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-allow-notifying-systemd.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-allow-notifying-systemd.patch
new file mode 100644
index 0000000000..a5caf39c80
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-allow-notifying-systemd.patch
@@ -0,0 +1,41 @@
+From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
+Date: Fri, 30 Sep 2022 16:54:02 +0200
+Subject: adb: daemon: allow notifying systemd when ready
+
+When using `systemd` on Linux, we should allow `adbd` to notify
+`systemd` once it has started and configured its USB/network interface.
+This allows us to (for example) wait for the daemon to bind to the
+FunctionFS endpoints, then activate the USB gadget.
+
+Forwarded: https://android-review.googlesource.com/c/platform/packages/modules/adb/+/2238429
+Upstream-Status: Inappropriate [Debian-specific]
+---
+ packages/modules/adb/daemon/main.cpp | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
+index d1b999b..deba593 100644
+--- a/packages/modules/adb/daemon/main.cpp
++++ b/packages/modules/adb/daemon/main.cpp
+@@ -49,6 +49,10 @@
+ #include "selinux/android.h"
+ #endif
+ 
++#if defined(__linux__)
++#include <systemd/sd-daemon.h>
++#endif
++
+ #include "adb.h"
+ #include "adb_auth.h"
+ #include "adb_listeners.h"
+@@ -302,6 +306,10 @@ int adbd_main(int server_port) {
+     init_jdwp();
+     D("adbd_main(): post init_jdwp()");
+ 
++#if defined(__linux__)
++    sd_notify(1, "READY=1");
++#endif
++
+     D("Event loop starting");
+     fdevent_loop();
+ 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-allow-usb-on-linux.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-allow-usb-on-linux.patch
new file mode 100644
index 0000000000..76e2427fc2
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-allow-usb-on-linux.patch
@@ -0,0 +1,28 @@
+From: Julien Massot <julien.massot@collabora.com>
+Date: Mon, 5 Sep 2022 16:00:12 +0200
+Subject: adb: daemon: allow binding to USB on Linux systems
+
+Linux systems are also capable of using FunctionFS for USB gadget
+configurations. This requires creating a specific gadget configuration
+using ConfigFS (including an `ffs.adb` function) and mounting
+FunctionFS to `/dev/usb-ffs/adb`.
+
+Forwarded: https://android-review.googlesource.com/c/platform/packages/modules/adb/+/2238428
+Upstream-Status: Inappropriate [Debian-specific]
+---
+ packages/modules/adb/daemon/main.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
+index 188272a..6c949c1 100644
+--- a/packages/modules/adb/daemon/main.cpp
++++ b/packages/modules/adb/daemon/main.cpp
+@@ -251,7 +251,7 @@ int adbd_main(int server_port) {
+ 
+     bool is_usb = false;
+ 
+-#if defined(__ANDROID__)
++#if defined(__linux__)
+     if (access(USB_FFS_ADB_EP0, F_OK) == 0) {
+         // Listen on USB.
+         usb_init();
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-don-t-require-authorization-on-Linux.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-don-t-require-authorization-on-Linux.patch
new file mode 100644
index 0000000000..5d3ed124bc
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-don-t-require-authorization-on-Linux.patch
@@ -0,0 +1,27 @@
+From 2427e520751b13a6e0a409f427f1ec9b23e63447 Mon Sep 17 00:00:00 2001
+From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
+Date: Wed, 3 May 2023 18:36:06 +0200
+Subject: [PATCH] adb: daemon: don't require authorization on Linux
+
+Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
+Upstream-Status: Inappropriate [Debian-specific]
+---
+ packages/modules/adb/daemon/main.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
+index 188272ae3..02a57f4e2 100644
+--- a/packages/modules/adb/daemon/main.cpp
++++ b/packages/modules/adb/daemon/main.cpp
+@@ -224,6 +224,8 @@ int adbd_main(int server_port) {
+         auth_required = android::base::GetBoolProperty("ro.adb.secure", false);
+ #endif
+     }
++#else
++    auth_required = false;
+ #endif
+ 
+     // Our external storage path may be different than apps, since
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-usb-drop-property-monitor.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-usb-drop-property-monitor.patch
new file mode 100644
index 0000000000..0f1d3f7a6f
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-adbd-adbd-usb-drop-property-monitor.patch
@@ -0,0 +1,57 @@
+From ba56ee6f092601932f9146eeb4f8b057da157be2 Mon Sep 17 00:00:00 2001
+From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
+Date: Tue, 2 May 2023 17:16:22 +0200
+Subject: [PATCH] adb: daemon: usb: drop property monitor
+
+This is an Android-only feature not available on Linux.
+Upstream-Status: Inappropriate [Debian-specific]
+---
+ packages/modules/adb/daemon/usb.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/packages/modules/adb/daemon/usb.cpp b/packages/modules/adb/daemon/usb.cpp
+index ec22f6661..e904a7629 100644
+--- a/packages/modules/adb/daemon/usb.cpp
++++ b/packages/modules/adb/daemon/usb.cpp
+@@ -48,7 +48,9 @@
+ 
+ #include "adb_unique_fd.h"
+ #include "adb_utils.h"
++#if defined(__ANDROID__)
+ #include "daemon/property_monitor.h"
++#endif
+ #include "daemon/usb_ffs.h"
+ #include "sysdeps/chrono.h"
+ #include "transfer_id.h"
+@@ -744,6 +746,7 @@ struct UsbFfsConnection : public Connection {
+ static void usb_ffs_open_thread() {
+     adb_thread_setname("usb ffs open");
+ 
++#if defined(__ANDROID__)
+     // When the device is acting as a USB host, we'll be unable to bind to the USB gadget on kernels
+     // that don't carry a downstream patch to enable that behavior.
+     //
+@@ -757,6 +760,7 @@ static void usb_ffs_open_thread() {
+         // Return false (i.e. break out of PropertyMonitor::Run) when the property != 1.
+         return android::base::ParseBool(value) == android::base::ParseBoolResult::kTrue;
+     });
++#endif
+ 
+     while (true) {
+         unique_fd control;
+@@ -767,11 +771,13 @@ static void usb_ffs_open_thread() {
+             continue;
+         }
+ 
++#if defined(__ANDROID__)
+         if (android::base::GetBoolProperty(kPropertyUsbDisabled, false)) {
+             LOG(INFO) << "pausing USB due to " << kPropertyUsbDisabled;
+             prop_mon.Run();
+             LOG(INFO) << "resuming USB";
+         }
++#endif
+ 
+         atransport* transport = new atransport();
+         transport->serial = "UsbFfs";
+-- 
+2.39.2
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-dev-typos.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-dev-typos.patch
new file mode 100644
index 0000000000..2ac7d66bd4
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-dev-typos.patch
@@ -0,0 +1,16 @@
+Description: Fix typos
+Author: Kai-Chung Yan (殷啟聰)
+Last-Update: 2016-10-01
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/development/tools/etc1tool/etc1tool.cpp
++++ b/development/tools/etc1tool/etc1tool.cpp
+@@ -56,7 +56,7 @@
+             "\t\t                             image to difffile. (Only valid when encoding).\n");
+     fprintf(stderr,
+             "\tIf outfile is not specified, an outfile path is constructed from infile,\n");
+-    fprintf(stderr, "\twith the apropriate suffix (.pkm or .png).\n");
++    fprintf(stderr, "\twith the appropriate suffix (.pkm or .png).\n");
+     exit(1);
+ }
+ 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-Nullable.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-Nullable.patch
new file mode 100644
index 0000000000..e9a9a91bfb
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-Nullable.patch
@@ -0,0 +1,14 @@
+Description: Bring Clang's _Nullable keyword to GCC
+ This patch is for gcc only, no need for clang.
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/libnativehelper/file_descriptor_jni.c
++++ b/libnativehelper/file_descriptor_jni.c
+@@ -22,6 +22,7 @@
+ #include "ALog-priv.h"
+ 
+ #include "JniConstants.h"
++#define _Nullable
+ 
+ static void EnsureArgumentIsFileDescriptor(JNIEnv* env, jobject instance) {
+     ALOG_ALWAYS_FATAL_IF(instance == NULL, "FileDescriptor is NULL");
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/stdatomic.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-stdatomic.patch
similarity index 89%
rename from meta-oe/recipes-devtools/android-tools/android-tools/debian/stdatomic.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-stdatomic.patch
index e11f3cc783..ed670eacf4 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/stdatomic.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-stdatomic.patch
@@ -1,27 +1,12 @@
-Upstream-Status: Pending
-
 Description: Fix incompatibility between <stdatomic.h> and <atomic>
  This 2 headers combined will cause errors for both GCC and Clang. This patch
  makes sure only one of them is present at any time.
+ .
+ This patch is for gcc only, no need for clang.
 Bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60932
 Bug: https://reviews.llvm.org/D45470
---- a/system/core/libcutils/include/cutils/trace.h
-+++ b/system/core/libcutils/include/cutils/trace.h
-@@ -18,7 +18,14 @@
- #define _LIBS_CUTILS_TRACE_H
- 
- #include <inttypes.h>
-+#ifdef __cplusplus
-+#include <atomic>
-+using std::atomic_bool;
-+using std::atomic_load_explicit;
-+using std::memory_order_acquire;
-+#else
- #include <stdatomic.h>
-+#endif
- #include <stdbool.h>
- #include <stdint.h>
- #include <stdio.h>
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
 --- a/system/core/libcutils/include/cutils/atomic.h
 +++ b/system/core/libcutils/include/cutils/atomic.h
 @@ -19,7 +19,23 @@
@@ -48,8 +33,25 @@ Bug: https://reviews.llvm.org/D45470
  
  #ifndef ANDROID_ATOMIC_INLINE
  #define ANDROID_ATOMIC_INLINE static inline
---- a/system/core/liblog/logger.h
-+++ b/system/core/liblog/logger.h
+--- a/system/core/libcutils/include/cutils/trace.h
++++ b/system/core/libcutils/include/cutils/trace.h
+@@ -18,7 +18,14 @@
+ #define _LIBS_CUTILS_TRACE_H
+ 
+ #include <inttypes.h>
++#ifdef __cplusplus
++#include <atomic>
++using std::atomic_bool;
++using std::atomic_load_explicit;
++using std::memory_order_acquire;
++#else
+ #include <stdatomic.h>
++#endif
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
+--- a/system/logging/liblog/logger.h
++++ b/system/logging/liblog/logger.h
 @@ -16,7 +16,13 @@
  
  #pragma once
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-workaround__builtin_available.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-workaround__builtin_available.patch
new file mode 100644
index 0000000000..60ca08cc24
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-gcc-workaround__builtin_available.patch
@@ -0,0 +1,148 @@
+Description: Workaround Clang's __builtin_available keyword
+ This patch is for gcc only, no need for clang.
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/system/libbase/logging.cpp
++++ b/system/libbase/logging.cpp
+@@ -209,8 +209,9 @@ static std::recursive_mutex& TagLock() {
+ static std::string* gDefaultTag;
+ 
+ void SetDefaultTag(const std::string& tag) {
+-  if (__builtin_available(android 30, *)) {
++//  if (__builtin_available(android 30, *)) {
+     __android_log_set_default_tag(tag.c_str());
++#if 0
+   } else {
+     std::lock_guard<std::recursive_mutex> lock(TagLock());
+     if (gDefaultTag != nullptr) {
+@@ -221,6 +222,7 @@ void SetDefaultTag(const std::string& tag) {
+       gDefaultTag = new std::string(tag);
+     }
+   }
++#endif
+ }
+ 
+ static bool gInitialized = false;
+@@ -314,13 +316,15 @@ static void LogdLogChunk(LogId id, LogSeverity severity, const char* tag, const
+   int32_t lg_id = LogIdTolog_id_t(id);
+   int32_t priority = LogSeverityToPriority(severity);
+ 
+-  if (__builtin_available(android 30, *)) {
++//  if (__builtin_available(android 30, *)) {
+     __android_log_message log_message = {sizeof(__android_log_message),     lg_id, priority, tag,
+                                          static_cast<const char*>(nullptr), 0,     message};
+     __android_log_logd_logger(&log_message);
++#if 0
+   } else {
+     __android_log_buf_print(lg_id, priority, tag, "%s", message);
+   }
++#endif
+ }
+ 
+ LogdLogger::LogdLogger(LogId default_log_id) : default_log_id_(default_log_id) {}
+@@ -396,7 +400,7 @@ LogFunction SetLogger(LogFunction&& logger) {
+   LogFunction old_logger = std::move(Logger());
+   Logger() = std::move(logger);
+ 
+-  if (__builtin_available(android 30, *)) {
++//  if (__builtin_available(android 30, *)) {
+     __android_log_set_logger([](const struct __android_log_message* log_message) {
+       auto log_id = log_id_tToLogId(log_message->buffer_id);
+       auto severity = PriorityToLogSeverity(log_message->priority);
+@@ -404,7 +408,7 @@ LogFunction SetLogger(LogFunction&& logger) {
+       Logger()(log_id, severity, log_message->tag, log_message->file, log_message->line,
+                log_message->message);
+     });
+-  }
++//  }
+   return old_logger;
+ }
+ 
+@@ -412,9 +416,9 @@ AbortFunction SetAborter(AbortFunction&& aborter) {
+   AbortFunction old_aborter = std::move(Aborter());
+   Aborter() = std::move(aborter);
+ 
+-  if (__builtin_available(android 30, *)) {
++//  if (__builtin_available(android 30, *)) {
+     __android_log_set_aborter([](const char* abort_message) { Aborter()(abort_message); });
+-  }
++//  }
+   return old_aborter;
+ }
+ 
+@@ -500,11 +504,13 @@ LogMessage::~LogMessage() {
+ 
+   // Abort if necessary.
+   if (data_->GetSeverity() == FATAL) {
+-    if (__builtin_available(android 30, *)) {
++//    if (__builtin_available(android 30, *)) {
+       __android_log_call_aborter(msg.c_str());
++#if 0
+     } else {
+       Aborter()(msg.c_str());
+     }
++#endif
+   }
+ }
+ 
+@@ -515,10 +521,11 @@ std::ostream& LogMessage::stream() {
+ void LogMessage::LogLine(const char* file, unsigned int line, LogSeverity severity, const char* tag,
+                          const char* message) {
+   int32_t priority = LogSeverityToPriority(severity);
+-  if (__builtin_available(android 30, *)) {
++//  if (__builtin_available(android 30, *)) {
+     __android_log_message log_message = {
+         sizeof(__android_log_message), LOG_ID_DEFAULT, priority, tag, file, line, message};
+     __android_log_write_log_message(&log_message);
++#if 0
+   } else {
+     if (tag == nullptr) {
+       std::lock_guard<std::recursive_mutex> lock(TagLock());
+@@ -531,37 +538,44 @@ void LogMessage::LogLine(const char* file, unsigned int line, LogSeverity severi
+       Logger()(DEFAULT, severity, tag, file, line, message);
+     }
+   }
++#endif
+ }
+ 
+ LogSeverity GetMinimumLogSeverity() {
+-  if (__builtin_available(android 30, *)) {
++//  if (__builtin_available(android 30, *)) {
+     return PriorityToLogSeverity(__android_log_get_minimum_priority());
++#if 0
+   } else {
+     return gMinimumLogSeverity;
+   }
++#endif
+ }
+ 
+ bool ShouldLog(LogSeverity severity, const char* tag) {
+   // Even though we're not using the R liblog functions in this function, if we're running on Q,
+   // we need to fall back to using gMinimumLogSeverity, since __android_log_is_loggable() will not
+   // take into consideration the value from SetMinimumLogSeverity().
+-  if (__builtin_available(android 30, *)) {
++//  if (__builtin_available(android 30, *)) {
+     int32_t priority = LogSeverityToPriority(severity);
+     return __android_log_is_loggable(priority, tag, ANDROID_LOG_INFO);
++#if 0
+   } else {
+     return severity >= gMinimumLogSeverity;
+   }
++#endif
+ }
+ 
+ LogSeverity SetMinimumLogSeverity(LogSeverity new_severity) {
+-  if (__builtin_available(android 30, *)) {
++//  if (__builtin_available(android 30, *)) {
+     int32_t priority = LogSeverityToPriority(new_severity);
+     return PriorityToLogSeverity(__android_log_set_minimum_priority(priority));
++#if 0
+   } else {
+     LogSeverity old_severity = gMinimumLogSeverity;
+     gMinimumLogSeverity = new_severity;
+     return old_severity;
+   }
++#endif
+ }
+ 
+ ScopedLogSeverity::ScopedLogSeverity(LogSeverity new_severity) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Added-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Added-missing-headers.patch
new file mode 100644
index 0000000000..38ff305870
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Added-missing-headers.patch
@@ -0,0 +1,15 @@
+Description: Added missing headers causing compile errors
+Author: Umang Parmar <umangjparmar@gmail.com>
+Forwarded: not-needed
+
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/packages/modules/adb/pairing_connection/pairing_server.cpp
++++ b/packages/modules/adb/pairing_connection/pairing_server.cpp
+@@ -20,6 +20,7 @@
+ #include <sys/eventfd.h>
+ 
+ #include <atomic>
++#include <condition_variable>
+ #include <deque>
+ #include <iomanip>
+ #include <mutex>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Drop-gki-dependency-from-mkbootimg.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Drop-gki-dependency-from-mkbootimg.patch
new file mode 100644
index 0000000000..6b940df707
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Drop-gki-dependency-from-mkbootimg.patch
@@ -0,0 +1,114 @@
+Description: Drop gki dependency from mkbootimg
+ `mkbootimg` is currently unusable due to a missing `gki` python
+ module. This module is only needed for signing GKI boot images, which
+ is deprecated as the argument group description implies.
+ This patch disables this (deprecated) signature feature entirely as
+ it's unlikely Debian users will actually need it.
+Author: Arnaud Ferraris <aferraris@debian.org>
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/system/tools/mkbootimg/mkbootimg.py
++++ b/system/tools/mkbootimg/mkbootimg.py
+@@ -28,8 +28,6 @@ import os
+ import re
+ import tempfile
+ 
+-from gki.generate_gki_certificate import generate_gki_certificate
+-
+ # Constant and structure definition is in
+ # system/tools/mkbootimg/include/bootimg/bootimg.h
+ BOOT_MAGIC = 'ANDROID!'
+@@ -105,12 +103,6 @@ def get_recovery_dtbo_offset(args):
+     return dtbo_offset
+ 
+ 
+-def should_add_legacy_gki_boot_signature(args):
+-    if args.gki_signing_key and args.gki_signing_algorithm:
+-        return True
+-    return False
+-
+-
+ def write_header_v3_and_above(args):
+     if args.header_version > 3:
+         boot_header_size = BOOT_IMAGE_HEADER_V4_SIZE
+@@ -134,8 +126,6 @@ def write_header_v3_and_above(args):
+     if args.header_version >= 4:
+         # The signature used to verify boot image v4.
+         boot_signature_size = 0
+-        if should_add_legacy_gki_boot_signature(args):
+-            boot_signature_size = BOOT_IMAGE_V4_SIGNATURE_SIZE
+         args.output.write(pack('I', boot_signature_size))
+     pad_file(args.output, BOOT_IMAGE_HEADER_V3_PAGESIZE)
+ 
+@@ -549,19 +539,6 @@ def parse_cmdline():
+     parser.add_argument('--vendor_bootconfig', type=FileType('rb'),
+                         help='path to the vendor bootconfig file')
+ 
+-    gki_2_0_signing_args = parser.add_argument_group(
+-        '[DEPRECATED] GKI 2.0 signing arguments')
+-    gki_2_0_signing_args.add_argument(
+-        '--gki_signing_algorithm', help='GKI signing algorithm to use')
+-    gki_2_0_signing_args.add_argument(
+-        '--gki_signing_key', help='path to RSA private key file')
+-    gki_2_0_signing_args.add_argument(
+-        '--gki_signing_signature_args', default='',
+-        help='other hash arguments passed to avbtool')
+-    gki_2_0_signing_args.add_argument(
+-        '--gki_signing_avbtool_path', default='avbtool',
+-        help='path to avbtool for boot signature generation')
+-
+     args, extra_args = parser.parse_known_args()
+     if args.vendor_boot is not None and args.header_version > 3:
+         extra_args = parse_vendor_ramdisk_args(args, extra_args)
+@@ -577,42 +554,6 @@ def parse_cmdline():
+     return args
+ 
+ 
+-def add_boot_image_signature(args, pagesize):
+-    """Adds the boot image signature.
+-
+-    Note that the signature will only be verified in VTS to ensure a
+-    generic boot.img is used. It will not be used by the device
+-    bootloader at boot time. The bootloader should only verify
+-    the boot vbmeta at the end of the boot partition (or in the top-level
+-    vbmeta partition) via the Android Verified Boot process, when the
+-    device boots.
+-    """
+-    # Flush the buffer for signature calculation.
+-    args.output.flush()
+-
+-    # Outputs the signed vbmeta to a separate file, then append to boot.img
+-    # as the boot signature.
+-    with tempfile.TemporaryDirectory() as temp_out_dir:
+-        boot_signature_output = os.path.join(temp_out_dir, 'boot_signature')
+-        generate_gki_certificate(
+-            image=args.output.name, avbtool=args.gki_signing_avbtool_path,
+-            name='boot', algorithm=args.gki_signing_algorithm,
+-            key=args.gki_signing_key, salt='d00df00d',
+-            additional_avb_args=args.gki_signing_signature_args.split(),
+-            output=boot_signature_output,
+-        )
+-        with open(boot_signature_output, 'rb') as boot_signature:
+-            boot_signature_bytes = boot_signature.read()
+-            if len(boot_signature_bytes) > BOOT_IMAGE_V4_SIGNATURE_SIZE:
+-                raise ValueError(
+-                    f'boot sigature size is > {BOOT_IMAGE_V4_SIGNATURE_SIZE}')
+-            boot_signature_bytes += b'\x00' * (
+-                BOOT_IMAGE_V4_SIGNATURE_SIZE - len(boot_signature_bytes))
+-            assert len(boot_signature_bytes) == BOOT_IMAGE_V4_SIGNATURE_SIZE
+-            args.output.write(boot_signature_bytes)
+-            pad_file(args.output, pagesize)
+-
+-
+ def write_data(args, pagesize):
+     write_padded_file(args.output, args.kernel, pagesize)
+     write_padded_file(args.output, args.ramdisk, pagesize)
+@@ -622,8 +563,6 @@ def write_data(args, pagesize):
+         write_padded_file(args.output, args.recovery_dtbo, pagesize)
+     if args.header_version == 2:
+         write_padded_file(args.output, args.dtb, pagesize)
+-    if args.header_version >= 4 and should_add_legacy_gki_boot_signature(args):
+-        add_boot_image_signature(args, pagesize)
+ 
+ 
+ def write_vendor_boot_data(args):
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Implement-const_iterator-operator.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Implement-const_iterator-operator.patch
new file mode 100644
index 0000000000..4679edd537
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-Implement-const_iterator-operator.patch
@@ -0,0 +1,37 @@
+Description: Implement const_iterator::operator--
+Forwarded: not-needed
+
+Needed for
+android-platform-frameworks-base/libs/androidfw/LoadedArsc.cpp
+when compiling against libstdc++.
+Upstream-Status: Inappropriate [Debian-specific]
+---
+--- a/system/incremental_delivery/incfs/util/include/util/map_ptr.h
++++ b/system/incremental_delivery/incfs/util/include/util/map_ptr.h
+@@ -180,6 +180,11 @@ public:
+             return *this;
+         }
+ 
++        const const_iterator& operator--() {
++            safe_ptr_--;
++            return *this;
++        }
++
+         const_iterator& operator+=(int n) {
+             safe_ptr_ = safe_ptr_ + n;
+             return *this;
+@@ -321,6 +326,14 @@ public:
+         return temp;
+     }
+ 
++    template <typename T1 = T, NotVoid<T1> = 0>
++    const map_ptr<T1> operator--(int) {
++        map_ptr<T1> temp = *this;
++        LIBINCFS_MAP_PTR_DEBUG_CODE(verified_ = false);
++        --ptr_;
++        return temp;
++    }
++
+     template <typename S, typename T1 = T, NotVoid<T1> = 0>
+     map_ptr<T1> operator+(const S n) const {
+         return map_ptr<T1>(map_, ptr_ + n, verified_block_);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-add-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-add-missing-headers.patch
new file mode 100644
index 0000000000..b0bac72320
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-add-missing-headers.patch
@@ -0,0 +1,13 @@
+Description: add missing headers
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/system/core/fastboot/fastboot_driver_interface.h
++++ b/system/core/fastboot/fastboot_driver_interface.h
+@@ -17,6 +17,7 @@
+ 
+ #include <string>
+ 
++#include <stdint.h>
+ #include "android-base/unique_fd.h"
+ 
+ class Transport;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-hard-code-build-number.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-hard-code-build-number.patch
new file mode 100644
index 0000000000..7555ba6406
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-hard-code-build-number.patch
@@ -0,0 +1,57 @@
+Description: just hard code rather than deal with circular deps
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/packages/modules/adb/adb.cpp
++++ b/packages/modules/adb/adb.cpp
+@@ -47,9 +47,6 @@
+ #include <android-base/utf8.h>
+ #include <diagnose_usb.h>
+ 
+-#include <build/version.h>
+-#include <platform_tools_version.h>
+-
+ #include "adb_auth.h"
+ #include "adb_io.h"
+ #include "adb_listeners.h"
+@@ -100,7 +97,7 @@
+             "Installed as %s\n"
+             "Running on %s\n",
+             ADB_VERSION_MAJOR, ADB_VERSION_MINOR, ADB_SERVER_VERSION, PLATFORM_TOOLS_VERSION,
+-            android::build::GetBuildNumber().c_str(), android::base::GetExecutablePath().c_str(),
++            "debian", android::base::GetExecutablePath().c_str(),
+             GetOSVersion().c_str());
+ }
+ 
+@@ -1339,7 +1339,7 @@ HostRequestResult handle_host_request(std::string_view service, TransportType ty
+         status.set_mdns_backend_forced(getenv("ADB_MDNS_OPENSCREEN") != nullptr);
+ 
+         status.set_version(std::string(PLATFORM_TOOLS_VERSION));
+-        status.set_build(android::build::GetBuildNumber());
++        status.set_build("debian");
+         status.set_executable_absolute_path(android::base::GetExecutablePath());
+         status.set_log_absolute_path(GetLogFilePath());
+         status.set_os(GetOSVersion());
+--- a/system/core/fastboot/fastboot.cpp
++++ b/system/core/fastboot/fastboot.cpp
+@@ -64,11 +64,9 @@
+ #include <android-base/stringprintf.h>
+ #include <android-base/strings.h>
+ #include <android-base/unique_fd.h>
+-#include <build/version.h>
+ #include <libavb/libavb.h>
+ #include <liblp/liblp.h>
+ #include <liblp/super_layout_builder.h>
+-#include <platform_tools_version.h>
+ #include <sparse/sparse.h>
+ #include <ziparchive/zip_archive.h>
+ 
+@@ -1962,8 +1960,7 @@
+                 setvbuf(stdout, nullptr, _IONBF, 0);
+                 setvbuf(stderr, nullptr, _IONBF, 0);
+             } else if (name == "version") {
+-                fprintf(stdout, "fastboot version %s-%s\n", PLATFORM_TOOLS_VERSION,
+-                        android::build::GetBuildNumber().c_str());
++                fprintf(stdout, "fastboot version %s-%s\n", PLATFORM_TOOLS_VERSION, "debian");
+                 fprintf(stdout, "Installed as %s\n", android::base::GetExecutablePath().c_str());
+                 return 0;
+             } else {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/libusb-header-path.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-libusb-header-path.patch
similarity index 62%
rename from meta-oe/recipes-devtools/android-tools/android-tools/debian/libusb-header-path.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-libusb-header-path.patch
index 122bd70e7d..9a15ec1a19 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/libusb-header-path.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-libusb-header-path.patch
@@ -1,15 +1,14 @@
-Upstream-Status: Pending
-
 Description: libusb.h comes from different location
 Author: Umang Parmar <umangjparmar@gmail.com>
 Forwarded: not-needed
 Last-Update: 2018-05-26
 
---- a/system/core/adb/client/usb_libusb.cpp
-+++ b/system/core/adb/client/usb_libusb.cpp
-@@ -30,7 +30,7 @@
- #include <thread>
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/packages/modules/adb/client/usb_libusb.cpp
++++ b/packages/modules/adb/client/usb_libusb.cpp
+@@ -36,7 +36,7 @@
  #include <unordered_map>
+ #include <vector>
  
 -#include <libusb/libusb.h>
 +#include <libusb-1.0/libusb.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-move-log-file-to-proper-dir.patch
similarity index 77%
rename from meta-oe/recipes-devtools/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-move-log-file-to-proper-dir.patch
index e8494ab433..201ec62bca 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-move-log-file-to-proper-dir.patch
@@ -1,12 +1,11 @@
-Upstream-Status: Pending
-
 Description: Update log file directory.
 Author: Umang Parmar <umangjparmar@gmail.com>
 Last Updated: 2018-05-17
 
---- a/system/core/adb/adb_utils.cpp
-+++ b/system/core/adb/adb_utils.cpp
-@@ -339,6 +339,11 @@
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/packages/modules/adb/adb_utils.cpp
++++ b/packages/modules/adb/adb_utils.cpp
+@@ -343,6 +343,11 @@
  
      return temp_path_utf8 + log_name;
  #else
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-stub-out-fastdeploy.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-stub-out-fastdeploy.patch
new file mode 100644
index 0000000000..fb16cff79a
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-stub-out-fastdeploy.patch
@@ -0,0 +1,99 @@
+Description: Defer packaging fastdeploy with adb for 29.x.x tags.
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/packages/modules/adb/client/adb_install.cpp
++++ b/packages/modules/adb/client/adb_install.cpp
+@@ -185,14 +185,6 @@
+     }
+ 
+     if (use_fastdeploy) {
+-        auto metadata = extract_metadata(file);
+-        if (metadata.has_value()) {
+-            // pass all but 1st (command) and last (apk path) parameters through to pm for
+-            // session creation
+-            std::vector<const char*> pm_args{argv + 1, argv + argc - 1};
+-            auto patchFd = install_patch(pm_args.size(), pm_args.data());
+-            return stream_patch(file, std::move(metadata.value()), std::move(patchFd));
+-        }
+     }
+ 
+     struct stat sb;
+@@ -280,16 +272,6 @@
+     argv[last_apk] = apk_dest.c_str(); /* destination name, not source location */
+ 
+     if (use_fastdeploy) {
+-        auto metadata = extract_metadata(apk_file[0]);
+-        if (metadata.has_value()) {
+-            auto patchFd = apply_patch_on_device(apk_dest.c_str());
+-            int status = stream_patch(apk_file[0], std::move(metadata.value()), std::move(patchFd));
+-
+-            result = pm_command(argc, argv);
+-            delete_device_file(apk_dest);
+-
+-            return status;
+-        }
+     }
+ 
+     if (do_sync_push(apk_file, apk_dest.c_str(), false, CompressionType::Any, false, false)) {
+@@ -457,7 +439,6 @@
+         std::vector<const char*> argv, bool* use_fastdeploy,
+         FastDeploy_AgentUpdateStrategy* agent_update_strategy) {
+     *use_fastdeploy = false;
+-    *agent_update_strategy = FastDeploy_AgentUpdateDifferentVersion;
+ 
+     std::vector<const char*> passthrough;
+     for (auto&& arg : argv) {
+@@ -466,11 +447,8 @@
+         } else if (arg == "--no-fastdeploy"sv) {
+             *use_fastdeploy = false;
+         } else if (arg == "--force-agent"sv) {
+-            *agent_update_strategy = FastDeploy_AgentUpdateAlways;
+         } else if (arg == "--date-check-agent"sv) {
+-            *agent_update_strategy = FastDeploy_AgentUpdateNewerTimeStamp;
+         } else if (arg == "--version-check-agent"sv) {
+-            *agent_update_strategy = FastDeploy_AgentUpdateDifferentVersion;
+         } else {
+             passthrough.push_back(arg);
+         }
+@@ -484,12 +462,11 @@
+     bool incremental_wait = false;
+ 
+     bool use_fastdeploy = false;
+-    FastDeploy_AgentUpdateStrategy agent_update_strategy = FastDeploy_AgentUpdateDifferentVersion;
+ 
+     auto unused_argv = parse_install_mode({argv, argv + argc}, &install_mode, &incremental_request,
+                                           &incremental_wait);
+     auto passthrough_argv =
+-            parse_fast_deploy_mode(std::move(unused_argv), &use_fastdeploy, &agent_update_strategy);
++            parse_fast_deploy_mode(std::move(unused_argv), &use_fastdeploy, nullptr);
+ 
+     auto [primary_mode, fallback_mode] =
+             calculate_install_mode(install_mode, use_fastdeploy, incremental_request);
+@@ -499,14 +476,11 @@
+         error_exit("Attempting to use streaming install on unsupported device");
+     }
+ 
+-    if (use_fastdeploy && get_device_api_level() < kFastDeployMinApi) {
+-        fprintf(stderr,
+-                "Fast Deploy is only compatible with devices of API version %d or higher, "
+-                "ignoring.\n",
+-                kFastDeployMinApi);
++    if (use_fastdeploy) {
++        printf("Fast Deploy is unavailable in this build of adb, "
++               "ignoring.\n");
+         use_fastdeploy = false;
+     }
+-    fastdeploy_set_agent_update_strategy(agent_update_strategy);
+ 
+     if (passthrough_argv.size() < 2) {
+         error_exit("install requires an apk argument");
+--- a/packages/modules/adb/client/commandline.cpp
++++ b/packages/modules/adb/client/commandline.cpp
+@@ -63,7 +63,6 @@
+ #include "bugreport.h"
+ #include "client/file_sync_client.h"
+ #include "commandline.h"
+-#include "fastdeploy.h"
+ #include "incremental_server.h"
+ #include "services.h"
+ #include "shell_protocol.h"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-throw-exception-on-unknown-os.patch
similarity index 64%
rename from meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-throw-exception-on-unknown-os.patch
index 70e732131f..2e254e0d46 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-throw-exception-on-unknown-os.patch
@@ -1,14 +1,13 @@
-Upstream-Status: Pending
-
 Description: Turn #error into exceptions
  So the library can be built on non-Linux platforms too, although can't
  guarauntee its functionality regarding that piece of code.
 Forwarded: not-needed
---- a/system/core/base/file.cpp
-+++ b/system/core/base/file.cpp
-@@ -422,7 +422,8 @@
-   path[PATH_MAX - 1] = 0;
-   return path;
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/system/libbase/file.cpp
++++ b/system/libbase/file.cpp
+@@ -461,7 +461,8 @@
+ #elif defined(__EMSCRIPTEN__)
+   abort();
  #else
 -#error unknown OS
 +#include <stdexcept>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-unwindstack-porting.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-unwindstack-porting.patch
new file mode 100644
index 0000000000..8bcfa8fe27
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/debian/deb-sys-unwindstack-porting.patch
@@ -0,0 +1,14 @@
+Description: unwindstack porting
+Forwarded: not-needed
+Upstream-Status: Inappropriate [Debian-specific]
+--- a/system/unwinding/libunwindstack/include/unwindstack/RegsGetLocal.h
++++ b/system/unwinding/libunwindstack/include/unwindstack/RegsGetLocal.h
+@@ -123,7 +123,7 @@
+       : "t1", "memory");
+ }
+ 
+-#elif defined(__i386__) || defined(__x86_64__)
++#else
+ 
+ // Do not change this, some libraries depend on this function existing on
+ // these architectures.
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
deleted file mode 100644
index e8e216161e..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Description: Off-by-one error in the dwarf_to_unw_regnum function in include/dwarf_i.h in
-libunwind 1.1 allows local users to have unspecified impact via invalid dwarf opcodes.
---- a/external/libunwind/include/dwarf_i.h
-+++ b/external/libunwind/include/dwarf_i.h
-@@ -20,7 +20,7 @@
- extern const uint8_t dwarf_to_unw_regnum_map[DWARF_REGNUM_MAP_LENGTH];
- /* REG is evaluated multiple times; it better be side-effects free!  */
- # define dwarf_to_unw_regnum(reg)					  \
--  (((reg) <= DWARF_REGNUM_MAP_LENGTH) ? dwarf_to_unw_regnum_map[reg] : 0)
-+  (((reg) < DWARF_REGNUM_MAP_LENGTH) ? dwarf_to_unw_regnum_map[reg] : 0)
- #endif
- 
- #ifdef UNW_LOCAL_ONLY
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
deleted file mode 100644
index a04a887c68..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Description: Replace the legacy __sync built-in functions with __atomic ones
- libunwind uses the built-in __sync_* functions which are deprecated by GCC and
- should be replaced by __atomic_* ones. See the official manuals [1].
- .
- The legacy __sync functions do not require to specify the memory order but
- __atomic ones do, so we choose the strongest one: __ATOMIC_SEQ_CST.
- .
- We do this because __sync_fetch_and_add() is not supported on armel.
- .
- [1]: https://gcc.gnu.org/onlinedocs/gcc/_005f_005fsync-Builtins.html
-Author: Kai-Chung Yan ()
-Last-Update: 2016-10-04
-Forwarded: not-needed
---- a/external/libunwind/include/libunwind_i.h
-+++ b/external/libunwind/include/libunwind_i.h
-@@ -155,8 +155,8 @@ cmpxchg_ptr (void *addr, void *old, void
-   u.vp = addr;
-   return __sync_bool_compare_and_swap(u.vlp, (long) old, (long) new);
- }
--# define fetch_and_add1(_ptr)		__sync_fetch_and_add(_ptr, 1)
--# define fetch_and_add(_ptr, value)	__sync_fetch_and_add(_ptr, value)
-+# define fetch_and_add1(_ptr) __atomic_fetch_add(_ptr, 1, __ATOMIC_SEQ_CST)
-+# define fetch_and_add(_ptr, value) __atomic_fetch_add(_ptr, value, __ATOMIC_SEQ_CST)
- # define HAVE_CMPXCHG
- # define HAVE_FETCH_AND_ADD
- #endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
deleted file mode 100644
index 4da65ea285..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d91f5324f809c3a5b0343927716e4b99bc31db53 Mon Sep 17 00:00:00 2001
-From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
-Date: Fri, 13 Mar 2026 18:57:36 +0530
-Subject: [PATCH] libunwind: fix strchr() conformance to ISO C23
-
-Fix uses of strchr() to conform to ISO C23, supported since glibc-2.43
-
-Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
-Upstream-Status: Pending
----
- external/libunwind/src/dwarf/Gfind_proc_info-lsb.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c b/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
-index 77ed3d09..37eadf52 100644
---- a/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
-+++ b/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
-@@ -248,7 +248,8 @@ load_debug_frame (const char *file, char **buf, size_t *bufsize,
- 
-   if (*buf == NULL && linkbuf != NULL && memchr (linkbuf, 0, linksize) != NULL)
-     {
--      char *newname, *basedir, *p;
-+      char *newname, *basedir;
-+      const char *p;
-       static const char *debugdir = "/usr/lib/debug";
-       int ret;
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
deleted file mode 100644
index 1e0f15ddf0..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e64495a109eefaf87235729f4dd79fc9121c16a6 Mon Sep 17 00:00:00 2001
-From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
-Date: Mon, 27 Oct 2025 19:39:05 +0530
-Subject: [PATCH] libunwind: guard unreachable() macro to avoid redefinition
- with stddef.h
-
-The build fails due to a macro redefinition conflict for `unreachable()`.
-GCC 15.2.0 defines `unreachable()` in `stddef.h`, and `libunwind_i.h` also
-defines it based on the presence of `HAVE__BUILTIN_UNREACHABLE`. This causes
-a redefinition error when building with `-Werror`.
-
-Added a guard around the `unreachable()` macro definition in `libunwind_i.h`
-to ensure it is only defined if not already present.
-
-Upstream-Status: Pending
-
-Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
----
- external/libunwind/include/libunwind_i.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/external/libunwind/include/libunwind_i.h b/external/libunwind/include/libunwind_i.h
-index c06912a6..59a462df 100644
---- a/external/libunwind/include/libunwind_i.h
-+++ b/external/libunwind/include/libunwind_i.h
-@@ -88,11 +88,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
- # endif
- #endif
- 
-+#if !defined(unreachable)
- #if defined(HAVE__BUILTIN_UNREACHABLE)
- # define unreachable() __builtin_unreachable()
- #else
- # define unreachable() do { } while (1)
- #endif
-+#endif
- 
- #ifdef DEBUG
- # define UNW_DEBUG	1
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
deleted file mode 100644
index 35df944d1c..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-Author: Kai-Chung Yan <seamlikok@gmail.com>
-Last-Update: 2016-08-24
-Description: Manual definition of struct user_pt_regs
- On ARM64, libunwind uses struct user_pt_regs which is not defined in
- anywhere, which causes FTBFS.
-Forwarded: not-needed
---- a/external/libunwind/src/ptrace/_UPT_access_reg.c
-+++ b/external/libunwind/src/ptrace/_UPT_access_reg.c
-@@ -26,6 +26,15 @@ WITH THE SOFTWARE OR THE USE OR OTHER DE
- 
- #include "_UPT_internal.h"
- 
-+#if defined(__aarch64__)
-+  struct user_pt_regs {
-+    __u64		regs[31];
-+    __u64		sp;
-+    __u64		pc;
-+    __u64		pstate;
-+  };
-+#endif
-+
- #if UNW_TARGET_IA64
- # include <elf.h>
- # ifdef HAVE_ASM_PTRACE_OFFSETS_H
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
deleted file mode 100644
index 441031f536..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Pending
-
-Description: remove clang-ism
-Forwarded: not-needed
-
---- a/system/core/base/include/android-base/logging.h
-+++ b/system/core/base/include/android-base/logging.h
-@@ -451,10 +451,7 @@
- //       -Wno-user-defined-warnings to CPPFLAGS.
- #pragma clang diagnostic push
- #pragma clang diagnostic ignored "-Wgcc-compat"
--#define OSTREAM_STRING_POINTER_USAGE_WARNING \
--    __attribute__((diagnose_if(true, "Unexpected logging of string pointer", "warning")))
--inline OSTREAM_STRING_POINTER_USAGE_WARNING
--std::ostream& operator<<(std::ostream& stream, const std::string* string_pointer) {
-+inline std::ostream& operator<<(std::ostream& stream, const std::string* string_pointer) {
-   return stream << static_cast<const void*>(string_pointer);
- }
- #pragma clang diagnostic pop
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-build-on-non-x86.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-build-on-non-x86.patch
deleted file mode 100644
index b1caa60c4a..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-build-on-non-x86.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-Description: non-x86 arches do not have PAGE_SIZE
-Forwarded: not-needed
---- a/system/core/base/cmsg.cpp
-+++ b/system/core/base/cmsg.cpp
-@@ -33,7 +33,8 @@
-                                  const std::vector<int>& fds) {
-   size_t cmsg_space = CMSG_SPACE(sizeof(int) * fds.size());
-   size_t cmsg_len = CMSG_LEN(sizeof(int) * fds.size());
--  if (cmsg_space >= PAGE_SIZE) {
-+  size_t pagesize = static_cast<size_t>(sysconf(_SC_PAGE_SIZE));
-+  if (cmsg_space >= pagesize) {
-     errno = ENOMEM;
-     return -1;
-   }
-@@ -75,7 +76,8 @@
-   fds->clear();
- 
-   size_t cmsg_space = CMSG_SPACE(sizeof(int) * max_fds);
--  if (cmsg_space >= PAGE_SIZE) {
-+  size_t pagesize = static_cast<size_t>(sysconf(_SC_PAGE_SIZE));
-+  if (cmsg_space >= pagesize) {
-     errno = ENOMEM;
-     return -1;
-   }
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
deleted file mode 100644
index 5f24d0b4a0..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-Description: get libcutils building
-Forwarded: not-needed
---- a/system/core/libcutils/include/cutils/threads.h
-+++ b/system/core/libcutils/include/cutils/threads.h
-@@ -33,7 +33,7 @@
- // Deprecated: use android::base::GetThreadId instead, which doesn't truncate on Mac/Windows.
- //
- 
--extern pid_t gettid();
-+extern pid_t gettid(void) __THROW;
- 
- //
- // Deprecated: use `_Thread_local` in C or `thread_local` in C++.
---- a/system/core/libcutils/threads.cpp
-+++ b/system/core/libcutils/threads.cpp
-@@ -33,7 +33,7 @@
- 
- // No definition needed for Android because we'll just pick up bionic's copy.
- #ifndef __ANDROID__
--pid_t gettid() {
-+pid_t gettid(void) __THROW {
- #if defined(__APPLE__)
-   uint64_t tid;
-   pthread_threadid_np(NULL, &tid);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-standard-namespace-errors.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
deleted file mode 100644
index 4380308f13..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-Description: Add missing 'std::' scope identifiers.
-Forwarded: not-needed
---- a/system/core/libunwindstack/include/unwindstack/DwarfMemory.h
-+++ b/system/core/libunwindstack/include/unwindstack/DwarfMemory.h
-@@ -29,7 +29,7 @@
-   DwarfMemory(Memory* memory) : memory_(memory) {}
-   virtual ~DwarfMemory() = default;
- 
--  bool ReadBytes(void* dst, size_t num_bytes);
-+  bool ReadBytes(void* dst, std::size_t num_bytes);
- 
-   template <typename SignedType>
-   bool ReadSigned(uint64_t* value);
-@@ -39,7 +39,7 @@
-   bool ReadSLEB128(int64_t* value);
- 
-   template <typename AddressType>
--  size_t GetEncodedSize(uint8_t encoding);
-+  std::size_t GetEncodedSize(uint8_t encoding);
- 
-   bool AdjustEncodedValue(uint8_t encoding, uint64_t* value);
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/hard-code-build-number.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/hard-code-build-number.patch
deleted file mode 100644
index 4d7323bd2f..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/hard-code-build-number.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-Description: just hard code rather than deal with circular deps
-Forwarded: not-needed
---- a/system/core/adb/adb.cpp
-+++ b/system/core/adb/adb.cpp
-@@ -44,8 +44,6 @@
- #include <android-base/parsenetaddress.h>
- #include <android-base/stringprintf.h>
- #include <android-base/strings.h>
--#include <build/version.h>
--#include <platform_tools_version.h>
- 
- #include "adb_auth.h"
- #include "adb_io.h"
-@@ -69,7 +67,7 @@
-         "Version %s-%s\n"
-         "Installed as %s\n",
-         ADB_VERSION_MAJOR, ADB_VERSION_MINOR, ADB_SERVER_VERSION,
--        PLATFORM_TOOLS_VERSION, android::build::GetBuildNumber().c_str(),
-+        PLATFORM_TOOLS_VERSION, "debian",
-         android::base::GetExecutablePath().c_str());
- }
- 
---- a/system/core/fastboot/fastboot.cpp
-+++ b/system/core/fastboot/fastboot.cpp
-@@ -59,10 +59,8 @@
- #include <android-base/stringprintf.h>
- #include <android-base/strings.h>
- #include <android-base/unique_fd.h>
--#include <build/version.h>
- #include <libavb/libavb.h>
- #include <liblp/liblp.h>
--#include <platform_tools_version.h>
- #include <sparse/sparse.h>
- #include <ziparchive/zip_archive.h>
- 
-@@ -1680,7 +1678,7 @@
-                 setvbuf(stdout, nullptr, _IONBF, 0);
-                 setvbuf(stderr, nullptr, _IONBF, 0);
-             } else if (name == "version") {
--                fprintf(stdout, "fastboot version %s-%s\n", PLATFORM_TOOLS_VERSION, android::build::GetBuildNumber().c_str());
-+                fprintf(stdout, "fastboot version %s-%s\n", PLATFORM_TOOLS_VERSION, "debian");
-                 fprintf(stdout, "Installed as %s\n", android::base::GetExecutablePath().c_str());
-                 return 0;
- #if !defined(_WIN32)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/simg_dump-python3.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/simg_dump-python3.patch
deleted file mode 100644
index 6664dc2aa5..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/simg_dump-python3.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Description: Port simg_dump to Python 3.
-Author: Antonio Russo <antonio.e.russo@gmail.com>
-Forwarded: not-needed
-Last-Update: 2019-01-05
-Origin: https://bugs.debian.org/945646
-
----
-Upstream-Status: Pending
-
-Index: android-platform-tools/system/core/libsparse/simg_dump.py
-===================================================================
---- android-platform-tools.orig/system/core/libsparse/simg_dump.py
-+++ android-platform-tools/system/core/libsparse/simg_dump.py
-@@ -1,4 +1,4 @@
--#! /usr/bin/env python
-+#! /usr/bin/env python3
- 
- # Copyright (C) 2012 The Android Open Source Project
- #
-@@ -14,7 +14,7 @@
- # See the License for the specific language governing permissions and
- # limitations under the License.
- 
--from __future__ import print_function
-+
- import csv
- import getopt
- import hashlib
-@@ -47,7 +47,7 @@ def main():
-     opts, args = getopt.getopt(sys.argv[1:],
-                                "vsc:",
-                                ["verbose", "showhash", "csvfile"])
--  except getopt.GetoptError, e:
-+  except getopt.GetoptError as e:
-     print(e)
-     usage(me)
-   for o, a in opts:
-@@ -66,7 +66,7 @@ def main():
-     usage(me)
- 
-   if csvfilename:
--    csvfile = open(csvfilename, "wb")
-+    csvfile = open(csvfilename, "w", newline='')
-     csvwriter = csv.writer(csvfile)
- 
-   output = verbose or csvfilename or showhash
-@@ -121,7 +121,7 @@ def main():
-                           "output offset", "output blocks", "type", "hash"])
- 
-     offset = 0
--    for i in xrange(1, total_chunks + 1):
-+    for i in range(1, total_chunks + 1):
-       header_bin = FH.read(12)
-       header = struct.unpack("<2H2I", header_bin)
-       chunk_type = header[0]
-@@ -160,7 +160,7 @@ def main():
-           if showhash:
-             h = hashlib.sha1()
-             data = fill_bin * (blk_sz / 4);
--            for block in xrange(chunk_sz):
-+            for block in range(chunk_sz):
-               h.update(data)
-             curhash = h.hexdigest()
-       elif chunk_type == 0xCAC3:
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/stub-out-fastdeploy.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/stub-out-fastdeploy.patch
deleted file mode 100644
index d86ef230f7..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/stub-out-fastdeploy.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-Upstream-Status: Pending
-
-Description: Defer packaging fastdeploy with adb for 29.x.x tags.
-Forwarded: not-needed
---- a/system/core/adb/client/commandline.cpp
-+++ b/system/core/adb/client/commandline.cpp
-@@ -59,7 +59,6 @@
- #include "bugreport.h"
- #include "client/file_sync_client.h"
- #include "commandline.h"
--#include "fastdeploy.h"
- #include "services.h"
- #include "shell_protocol.h"
- #include "sysdeps/chrono.h"
---- a/system/core/adb/client/adb_install.cpp
-+++ b/system/core/adb/client/adb_install.cpp
-@@ -35,7 +35,6 @@
- #include "adb_utils.h"
- #include "client/file_sync_client.h"
- #include "commandline.h"
--#include "fastdeploy.h"
- 
- static constexpr int kFastDeployMinApi = 24;
- 
-@@ -167,14 +166,6 @@
-     }
- 
-     if (use_fastdeploy) {
--        auto metadata = extract_metadata(file);
--        if (metadata.has_value()) {
--            // pass all but 1st (command) and last (apk path) parameters through to pm for
--            // session creation
--            std::vector<const char*> pm_args{argv + 1, argv + argc - 1};
--            auto patchFd = install_patch(pm_args.size(), pm_args.data());
--            return stream_patch(file, std::move(metadata.value()), std::move(patchFd));
--        }
-     }
- 
-     struct stat sb;
-@@ -267,16 +258,6 @@
-     argv[last_apk] = apk_dest.c_str(); /* destination name, not source location */
- 
-     if (use_fastdeploy) {
--        auto metadata = extract_metadata(apk_file[0]);
--        if (metadata.has_value()) {
--            auto patchFd = apply_patch_on_device(apk_dest.c_str());
--            int status = stream_patch(apk_file[0], std::move(metadata.value()), std::move(patchFd));
--
--            result = pm_command(argc, argv);
--            delete_device_file(apk_dest);
--
--            return status;
--        }
-     }
- 
-     if (do_sync_push(apk_file, apk_dest.c_str(), false)) {
-@@ -292,7 +273,6 @@
-     InstallMode installMode = INSTALL_DEFAULT;
-     bool use_fastdeploy = false;
-     bool is_reinstall = false;
--    FastDeploy_AgentUpdateStrategy agent_update_strategy = FastDeploy_AgentUpdateDifferentVersion;
- 
-     for (int i = 1; i < argc; i++) {
-         if (!strcmp(argv[i], "--streaming")) {
-@@ -313,13 +293,10 @@
-             use_fastdeploy = false;
-         } else if (!strcmp(argv[i], "--force-agent")) {
-             processedArgIndicies.push_back(i);
--            agent_update_strategy = FastDeploy_AgentUpdateAlways;
-         } else if (!strcmp(argv[i], "--date-check-agent")) {
-             processedArgIndicies.push_back(i);
--            agent_update_strategy = FastDeploy_AgentUpdateNewerTimeStamp;
-         } else if (!strcmp(argv[i], "--version-check-agent")) {
-             processedArgIndicies.push_back(i);
--            agent_update_strategy = FastDeploy_AgentUpdateDifferentVersion;
-         }
-     }
- 
-@@ -331,13 +308,11 @@
-         error_exit("Attempting to use streaming install on unsupported device");
-     }
- 
--    if (use_fastdeploy && get_device_api_level() < kFastDeployMinApi) {
--        printf("Fast Deploy is only compatible with devices of API version %d or higher, "
--               "ignoring.\n",
--               kFastDeployMinApi);
-+    if (use_fastdeploy) {
-+        printf("Fast Deploy is unavailable in this build of adb, "
-+               "ignoring.\n");
-         use_fastdeploy = false;
-     }
--    fastdeploy_set_agent_update_strategy(agent_update_strategy);
- 
-     std::vector<const char*> passthrough_argv;
-     for (int i = 0; i < argc; i++) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
deleted file mode 100644
index 9fd0fa792c..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
+++ /dev/null
@@ -1,653 +0,0 @@
-From: Guo Ren <guoren@linux.alibaba.com>
-Date: Wed, 29 Jun 2022 16:46:46 +0800
-Subject: Add riscv64 support
-
-This patch contains the dwarf unwind support for 64bit risc-v.
-
-    * DwarfCfa.cpp (cfa_def_cfa_register): setup register if CFA_REG is
-    not setup for riscv64
-    * Elf.cpp (GetRelPc): convert offset to virtual address for riscv64.
-    * ElfInterface.cpp (GetVirtAddrFromOffset): New for riscv64.
-    * RegsRiscv64.cpp (StepIfSignalHandler): Fix signal frame check.
-    libunwindstack/include/unwindstack/
-    * ElfInterface.h (GetVirtAddrFromOffset): New for riscv64.
-    libunwindstack/tests/
-    * DwarfCfaTest.cpp (cfa_def_cfa_register): ok for riscv64.
-    * RegsStepIfSignalHandlerTest.cpp (riscv64_step_if_signal_handler): Fix
-    testcase for riscv64
-
-Test: Builds.
-Test: All unit tests pass.
-
-Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
-Signed-off-by: Lifang Xia <lifang_xia@linux.alibaba.com>
-Signed-off-by: Mao Han <han_mao@linux.alibaba.com>
-Change-Id: Ib21ddf23cc83f332af202df7bffcaceec16063e0
----
-Upstream-Status: Pending
-
- system/core/libunwindstack/Android.bp              |   1 +
- system/core/libunwindstack/Elf.cpp                 |   2 +
- system/core/libunwindstack/Regs.cpp                |  10 ++
- system/core/libunwindstack/RegsRiscv64.cpp         | 156 +++++++++++++++++++++
- .../core/libunwindstack/include/unwindstack/Elf.h  |   5 +
- .../include/unwindstack/MachineRiscv64.h           |  59 ++++++++
- .../include/unwindstack/RegsGetLocal.h             |  43 ++++++
- .../include/unwindstack/RegsRiscv64.h              |  59 ++++++++
- .../include/unwindstack/UcontextRiscv64.h          |  80 +++++++++++
- .../include/unwindstack/UserRiscv64.h              |  37 +++++
- system/core/libunwindstack/tools/unwind.cpp        |   3 +
- .../core/libunwindstack/tools/unwind_symbols.cpp   |   3 +
- 12 files changed, 458 insertions(+)
- create mode 100644 system/core/libunwindstack/RegsRiscv64.cpp
- create mode 100644 system/core/libunwindstack/include/unwindstack/MachineRiscv64.h
- create mode 100644 system/core/libunwindstack/include/unwindstack/RegsRiscv64.h
- create mode 100644 system/core/libunwindstack/include/unwindstack/UcontextRiscv64.h
- create mode 100644 system/core/libunwindstack/include/unwindstack/UserRiscv64.h
-
-diff --git a/system/core/libunwindstack/Android.bp b/system/core/libunwindstack/Android.bp
-index 3695f72..f1f9c68 100644
---- a/system/core/libunwindstack/Android.bp
-+++ b/system/core/libunwindstack/Android.bp
-@@ -70,6 +70,7 @@ cc_library {
-         "RegsArm64.cpp",
-         "RegsX86.cpp",
-         "RegsX86_64.cpp",
-+        "RegsRiscv64.cpp",
-         "RegsMips.cpp",
-         "RegsMips64.cpp",
-         "Unwinder.cpp",
-diff --git a/system/core/libunwindstack/Elf.cpp b/system/core/libunwindstack/Elf.cpp
-index f01b092..3c2088b 100644
---- a/system/core/libunwindstack/Elf.cpp
-+++ b/system/core/libunwindstack/Elf.cpp
-@@ -290,6 +290,8 @@ ElfInterface* Elf::CreateInterfaceFromMemory(Memory* memory) {
-       arch_ = ARCH_X86_64;
-     } else if (e_machine == EM_MIPS) {
-       arch_ = ARCH_MIPS64;
-+    } else if (e_machine == EM_RISCV) {
-+      arch_ = ARCH_RISCV64;
-     } else {
-       // Unsupported.
-       ALOGI("64 bit elf that is neither aarch64 nor x86_64 nor mips64: e_machine = %d\n",
-diff --git a/system/core/libunwindstack/Regs.cpp b/system/core/libunwindstack/Regs.cpp
-index c7dec52..447a554 100644
---- a/system/core/libunwindstack/Regs.cpp
-+++ b/system/core/libunwindstack/Regs.cpp
-@@ -27,12 +27,14 @@
- #include <unwindstack/RegsArm64.h>
- #include <unwindstack/RegsMips.h>
- #include <unwindstack/RegsMips64.h>
-+#include <unwindstack/RegsRiscv64.h>
- #include <unwindstack/RegsX86.h>
- #include <unwindstack/RegsX86_64.h>
- #include <unwindstack/UserArm.h>
- #include <unwindstack/UserArm64.h>
- #include <unwindstack/UserMips.h>
- #include <unwindstack/UserMips64.h>
-+#include <unwindstack/UserRiscv64.h>
- #include <unwindstack/UserX86.h>
- #include <unwindstack/UserX86_64.h>
- 
-@@ -67,6 +69,8 @@ Regs* Regs::RemoteGet(pid_t pid) {
-     return RegsMips::Read(buffer.data());
-   case sizeof(mips64_user_regs):
-     return RegsMips64::Read(buffer.data());
-+  case sizeof(riscv64_user_regs):
-+    return RegsRiscv64::Read(buffer.data());
-   }
-   return nullptr;
- }
-@@ -85,6 +89,8 @@ Regs* Regs::CreateFromUcontext(ArchEnum arch, void* ucontext) {
-       return RegsMips::CreateFromUcontext(ucontext);
-     case ARCH_MIPS64:
-       return RegsMips64::CreateFromUcontext(ucontext);
-+    case ARCH_RISCV64:
-+      return RegsRiscv64::CreateFromUcontext(ucontext);
-     case ARCH_UNKNOWN:
-     default:
-       return nullptr;
-@@ -104,6 +110,8 @@ ArchEnum Regs::CurrentArch() {
-   return ARCH_MIPS;
- #elif defined(__mips__) && defined(__LP64__)
-   return ARCH_MIPS64;
-+#elif defined(__riscv)
-+  return ARCH_RISCV64;
- #else
-   abort();
- #endif
-@@ -123,6 +131,8 @@ Regs* Regs::CreateFromLocal() {
-   regs = new RegsMips();
- #elif defined(__mips__) && defined(__LP64__)
-   regs = new RegsMips64();
-+#elif defined(__riscv)
-+  regs = new RegsRiscv64();
- #else
-   abort();
- #endif
-diff --git a/system/core/libunwindstack/RegsRiscv64.cpp b/system/core/libunwindstack/RegsRiscv64.cpp
-new file mode 100644
-index 0000000..887762a
---- /dev/null
-+++ b/system/core/libunwindstack/RegsRiscv64.cpp
-@@ -0,0 +1,156 @@
-+/*
-+ * Copyright (C) 2022 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#include <stdint.h>
-+#include <string.h>
-+
-+#include <functional>
-+
-+#include <unwindstack/Elf.h>
-+#include <unwindstack/MachineRiscv64.h>
-+#include <unwindstack/MapInfo.h>
-+#include <unwindstack/Memory.h>
-+#include <unwindstack/RegsRiscv64.h>
-+#include <unwindstack/UcontextRiscv64.h>
-+#include <unwindstack/UserRiscv64.h>
-+
-+namespace unwindstack {
-+
-+RegsRiscv64::RegsRiscv64()
-+    : RegsImpl<uint64_t>(RISCV64_REG_MAX, Location(LOCATION_REGISTER, RISCV64_REG_RA)) {}
-+
-+ArchEnum RegsRiscv64::Arch() {
-+  return ARCH_RISCV64;
-+}
-+
-+uint64_t RegsRiscv64::pc() {
-+  return regs_[RISCV64_REG_PC];
-+}
-+
-+uint64_t RegsRiscv64::sp() {
-+  return regs_[RISCV64_REG_SP];
-+}
-+
-+void RegsRiscv64::set_pc(uint64_t pc) {
-+  regs_[RISCV64_REG_PC] = pc;
-+}
-+
-+void RegsRiscv64::set_sp(uint64_t sp) {
-+  regs_[RISCV64_REG_SP] = sp;
-+}
-+
-+uint64_t RegsRiscv64::GetPcAdjustment(uint64_t rel_pc, Elf*) {
-+  if (rel_pc < 8) {
-+    return 0;
-+  }
-+  // For now, just assume no compact branches
-+  return 8;
-+}
-+
-+bool RegsRiscv64::SetPcFromReturnAddress(Memory*) {
-+  uint64_t ra = regs_[RISCV64_REG_RA];
-+  if (regs_[RISCV64_REG_PC] == ra) {
-+    return false;
-+  }
-+
-+  regs_[RISCV64_REG_PC] = ra;
-+  return true;
-+}
-+
-+void RegsRiscv64::IterateRegisters(std::function<void(const char*, uint64_t)> fn) {
-+  fn("pc", regs_[RISCV64_REG_PC]);
-+  fn("ra", regs_[RISCV64_REG_RA]);
-+  fn("sp", regs_[RISCV64_REG_SP]);
-+  fn("gp", regs_[RISCV64_REG_GP]);
-+  fn("tp", regs_[RISCV64_REG_TP]);
-+  fn("t0", regs_[RISCV64_REG_T0]);
-+  fn("t1", regs_[RISCV64_REG_T1]);
-+  fn("t2", regs_[RISCV64_REG_T2]);
-+  fn("t3", regs_[RISCV64_REG_T3]);
-+  fn("t4", regs_[RISCV64_REG_T4]);
-+  fn("t5", regs_[RISCV64_REG_T5]);
-+  fn("t6", regs_[RISCV64_REG_T6]);
-+  fn("s0", regs_[RISCV64_REG_S0]);
-+  fn("s1", regs_[RISCV64_REG_S1]);
-+  fn("s2", regs_[RISCV64_REG_S2]);
-+  fn("s3", regs_[RISCV64_REG_S3]);
-+  fn("s4", regs_[RISCV64_REG_S4]);
-+  fn("s5", regs_[RISCV64_REG_S5]);
-+  fn("s6", regs_[RISCV64_REG_S6]);
-+  fn("s7", regs_[RISCV64_REG_S7]);
-+  fn("s8", regs_[RISCV64_REG_S8]);
-+  fn("s9", regs_[RISCV64_REG_S9]);
-+  fn("s10", regs_[RISCV64_REG_S10]);
-+  fn("s11", regs_[RISCV64_REG_S11]);
-+  fn("a0", regs_[RISCV64_REG_A0]);
-+  fn("a1", regs_[RISCV64_REG_A1]);
-+  fn("a2", regs_[RISCV64_REG_A2]);
-+  fn("a3", regs_[RISCV64_REG_A3]);
-+  fn("a4", regs_[RISCV64_REG_A4]);
-+  fn("a5", regs_[RISCV64_REG_A5]);
-+  fn("a6", regs_[RISCV64_REG_A6]);
-+  fn("a7", regs_[RISCV64_REG_A7]);
-+}
-+
-+Regs* RegsRiscv64::Read(void* remote_data) {
-+  riscv64_user_regs* user = reinterpret_cast<riscv64_user_regs*>(remote_data);
-+
-+  RegsRiscv64* regs = new RegsRiscv64();
-+  memcpy(regs->RawData(), &user->regs[0], RISCV64_REG_MAX * sizeof(uint64_t));
-+  // uint64_t* reg_data = reinterpret_cast<uint64_t*>(regs->RawData());
-+  return regs;
-+}
-+
-+Regs* RegsRiscv64::CreateFromUcontext(void* ucontext) {
-+  riscv64_ucontext_t* riscv64_ucontext = reinterpret_cast<riscv64_ucontext_t*>(ucontext);
-+
-+  RegsRiscv64* regs = new RegsRiscv64();
-+  memcpy(regs->RawData(), &riscv64_ucontext->uc_mcontext.__gregs[0],
-+         RISCV64_REG_MAX * sizeof(uint64_t));
-+  return regs;
-+}
-+
-+bool RegsRiscv64::StepIfSignalHandler(uint64_t elf_offset, Elf* elf, Memory* process_memory) {
-+  uint64_t data;
-+  Memory* elf_memory = elf->memory();
-+  // Read from elf memory since it is usually more expensive to read from
-+  // process memory.
-+  if (!elf_memory->ReadFully(elf_offset, &data, sizeof(data))) {
-+    return false;
-+  }
-+  // Look for the kernel sigreturn function.
-+  // __kernel_rt_sigreturn:
-+  // li a7, __NR_rt_sigreturn
-+  // scall
-+
-+  const uint8_t li_scall[] = {0x93, 0x08, 0xb0, 0x08, 0x73, 0x00, 0x00, 0x00};
-+  if (memcmp(&data, &li_scall, 8) != 0) {
-+    return false;
-+  }
-+
-+  // SP + sizeof(siginfo_t) + uc_mcontext offset + PC offset.
-+  if (!process_memory->ReadFully(regs_[RISCV64_REG_SP] + 0x80 + 0xb0 + 0x00, regs_.data(),
-+                                 sizeof(uint64_t) * (RISCV64_REG_MAX))) {
-+    return false;
-+  }
-+  return true;
-+}
-+
-+Regs* RegsRiscv64::Clone() {
-+  return new RegsRiscv64(*this);
-+}
-+
-+}  // namespace unwindstack
-diff --git a/system/core/libunwindstack/include/unwindstack/Elf.h b/system/core/libunwindstack/include/unwindstack/Elf.h
-index 472ed92..88fa0ff 100644
---- a/system/core/libunwindstack/include/unwindstack/Elf.h
-+++ b/system/core/libunwindstack/include/unwindstack/Elf.h
-@@ -32,6 +32,10 @@
- #define EM_AARCH64 183
- #endif
- 
-+#if !defined(EM_RISCV)
-+#define EM_RISCV 243
-+#endif
-+
- namespace unwindstack {
- 
- // Forward declaration.
-@@ -46,6 +50,7 @@ enum ArchEnum : uint8_t {
-   ARCH_X86_64,
-   ARCH_MIPS,
-   ARCH_MIPS64,
-+  ARCH_RISCV64,
- };
- 
- class Elf {
-diff --git a/system/core/libunwindstack/include/unwindstack/MachineRiscv64.h b/system/core/libunwindstack/include/unwindstack/MachineRiscv64.h
-new file mode 100644
-index 0000000..397e680
---- /dev/null
-+++ b/system/core/libunwindstack/include/unwindstack/MachineRiscv64.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (C) 2022 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#pragma once
-+
-+#include <stdint.h>
-+
-+namespace unwindstack {
-+
-+enum Riscv64Reg : uint16_t {
-+  RISCV64_REG_PC,
-+  RISCV64_REG_RA,
-+  RISCV64_REG_SP,
-+  RISCV64_REG_GP,
-+  RISCV64_REG_TP,
-+  RISCV64_REG_T0,
-+  RISCV64_REG_T1,
-+  RISCV64_REG_T2,
-+  RISCV64_REG_S0,
-+  RISCV64_REG_S1,
-+  RISCV64_REG_A0,
-+  RISCV64_REG_A1,
-+  RISCV64_REG_A2,
-+  RISCV64_REG_A3,
-+  RISCV64_REG_A4,
-+  RISCV64_REG_A5,
-+  RISCV64_REG_A6,
-+  RISCV64_REG_A7,
-+  RISCV64_REG_S2,
-+  RISCV64_REG_S3,
-+  RISCV64_REG_S4,
-+  RISCV64_REG_S5,
-+  RISCV64_REG_S6,
-+  RISCV64_REG_S7,
-+  RISCV64_REG_S8,
-+  RISCV64_REG_S9,
-+  RISCV64_REG_S10,
-+  RISCV64_REG_S11,
-+  RISCV64_REG_T3,
-+  RISCV64_REG_T4,
-+  RISCV64_REG_T5,
-+  RISCV64_REG_T6,
-+  RISCV64_REG_MAX,
-+};
-+
-+}  // namespace unwindstack
-diff --git a/system/core/libunwindstack/include/unwindstack/RegsGetLocal.h b/system/core/libunwindstack/include/unwindstack/RegsGetLocal.h
-index f0b5e3a..698eba2 100644
---- a/system/core/libunwindstack/include/unwindstack/RegsGetLocal.h
-+++ b/system/core/libunwindstack/include/unwindstack/RegsGetLocal.h
-@@ -81,6 +81,49 @@ inline __attribute__((__always_inline__)) void AsmGetRegs(void* reg_data) {
-       : "x12", "x13", "memory");
- }
- 
-+#elif defined(__riscv)
-+
-+inline __attribute__((__always_inline__)) void AsmGetRegs(void* reg_data) {
-+  asm volatile(
-+      "1:\n"
-+      "sd ra, 8(%[base])\n"
-+      "sd sp, 16(%[base])\n"
-+      "sd gp, 24(%[base])\n"
-+      "sd tp, 32(%[base])\n"
-+      "sd t0, 40(%[base])\n"
-+      "sd t1, 48(%[base])\n"
-+      "sd t2, 56(%[base])\n"
-+      "sd s0, 64(%[base])\n"
-+      "sd s1, 72(%[base])\n"
-+      "sd a0, 80(%[base])\n"
-+      "sd a1, 88(%[base])\n"
-+      "sd a2, 96(%[base])\n"
-+      "sd a3, 104(%[base])\n"
-+      "sd a4, 112(%[base])\n"
-+      "sd a5, 120(%[base])\n"
-+      "sd a6, 128(%[base])\n"
-+      "sd a7, 136(%[base])\n"
-+      "sd s2, 144(%[base])\n"
-+      "sd s3, 152(%[base])\n"
-+      "sd s4, 160(%[base])\n"
-+      "sd s5, 168(%[base])\n"
-+      "sd s6, 176(%[base])\n"
-+      "sd s7, 184(%[base])\n"
-+      "sd s8, 192(%[base])\n"
-+      "sd s9, 200(%[base])\n"
-+      "sd s10, 208(%[base])\n"
-+      "sd s11, 216(%[base])\n"
-+      "sd t3, 224(%[base])\n"
-+      "sd t4, 232(%[base])\n"
-+      "sd t5, 240(%[base])\n"
-+      "sd t6, 248(%[base])\n"
-+      "la t1, 1b\n"
-+      "sd t1, 0(%[base])\n"
-+      : [base] "+r"(reg_data)
-+      :
-+      : "t1", "memory");
-+}
-+
- #elif defined(__i386__) || defined(__x86_64__) || defined(__mips__)
- 
- extern "C" void AsmGetRegs(void* regs);
-diff --git a/system/core/libunwindstack/include/unwindstack/RegsRiscv64.h b/system/core/libunwindstack/include/unwindstack/RegsRiscv64.h
-new file mode 100644
-index 0000000..eb09397
---- /dev/null
-+++ b/system/core/libunwindstack/include/unwindstack/RegsRiscv64.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (C) 2022 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#pragma once
-+
-+#include <stdint.h>
-+
-+#include <functional>
-+
-+#include <unwindstack/Elf.h>
-+#include <unwindstack/Regs.h>
-+
-+namespace unwindstack {
-+
-+// Forward declarations.
-+class Memory;
-+
-+class RegsRiscv64 : public RegsImpl<uint64_t> {
-+ public:
-+  RegsRiscv64();
-+  virtual ~RegsRiscv64() = default;
-+
-+  ArchEnum Arch() override final;
-+
-+  uint64_t GetPcAdjustment(uint64_t rel_pc, Elf* elf) override;
-+
-+  bool SetPcFromReturnAddress(Memory* process_memory) override;
-+
-+  bool StepIfSignalHandler(uint64_t elf_offset, Elf* elf, Memory* process_memory) override;
-+
-+  void IterateRegisters(std::function<void(const char*, uint64_t)>) override final;
-+
-+  uint64_t pc() override;
-+  uint64_t sp() override;
-+
-+  void set_pc(uint64_t pc) override;
-+  void set_sp(uint64_t sp) override;
-+
-+  Regs* Clone() override final;
-+
-+  static Regs* Read(void* data);
-+
-+  static Regs* CreateFromUcontext(void* ucontext);
-+};
-+
-+}  // namespace unwindstack
-diff --git a/system/core/libunwindstack/include/unwindstack/UcontextRiscv64.h b/system/core/libunwindstack/include/unwindstack/UcontextRiscv64.h
-new file mode 100644
-index 0000000..c6c82b1
---- /dev/null
-+++ b/system/core/libunwindstack/include/unwindstack/UcontextRiscv64.h
-@@ -0,0 +1,80 @@
-+/*
-+ * Copyright (C) 2014 The Android Open Source Project
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ *  * Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ *  * Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in
-+ *    the documentation and/or other materials provided with the
-+ *    distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
-+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
-+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
-+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
-+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
-+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-+ * SUCH DAMAGE.
-+ */
-+
-+#pragma once
-+
-+#include <sys/cdefs.h>
-+
-+typedef uint64_t __riscv_mc_gp_state[32];  // unsigned long
-+
-+struct __riscv_mc_f_ext_state {
-+  uint32_t __f[32];
-+  uint32_t __fcsr;
-+};
-+
-+struct __riscv_mc_d_ext_state {
-+  uint64_t __f[32];
-+  uint32_t __fcsr;
-+};
-+
-+struct __riscv_mc_q_ext_state {
-+  uint64_t __f[64] __attribute__((__aligned__(16)));
-+  uint32_t __fcsr;
-+  uint32_t __reserved[3];
-+};
-+
-+union __riscv_mc_fp_state {
-+  struct __riscv_mc_f_ext_state __f;
-+  struct __riscv_mc_d_ext_state __d;
-+  struct __riscv_mc_q_ext_state __q;
-+};
-+
-+struct __riscv_stack_t {
-+  uint64_t ss_sp;
-+  int32_t ss_flags;
-+  uint64_t ss_size;
-+};
-+
-+struct riscv64_sigset_t {
-+  uint64_t sig;  // unsigned long
-+};
-+
-+struct riscv64_mcontext_t {
-+  __riscv_mc_gp_state __gregs;
-+  union __riscv_mc_fp_state __fpregs;
-+};
-+
-+struct riscv64_ucontext_t {
-+  uint64_t uc_flags;  // unsigned long
-+  struct riscv64_ucontext_t* uc_link;
-+  __riscv_stack_t uc_stack;
-+  riscv64_sigset_t uc_sigmask;
-+  /* The kernel adds extra padding here to allow sigset_t to grow. */
-+  int8_t __padding[128 - sizeof(riscv64_sigset_t)];  // char
-+  riscv64_mcontext_t uc_mcontext;
-+};
-diff --git a/system/core/libunwindstack/include/unwindstack/UserRiscv64.h b/system/core/libunwindstack/include/unwindstack/UserRiscv64.h
-new file mode 100644
-index 0000000..1e91228
---- /dev/null
-+++ b/system/core/libunwindstack/include/unwindstack/UserRiscv64.h
-@@ -0,0 +1,37 @@
-+/*
-+ * Copyright (C) 2016 The Android Open Source Project
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ *  * Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ *  * Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in
-+ *    the documentation and/or other materials provided with the
-+ *    distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
-+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
-+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
-+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
-+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
-+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-+ * SUCH DAMAGE.
-+ */
-+
-+#pragma once
-+
-+namespace unwindstack {
-+
-+struct riscv64_user_regs {
-+  uint64_t regs[32];
-+};
-+
-+}  // namespace unwindstack
-diff --git a/system/core/libunwindstack/tools/unwind.cpp b/system/core/libunwindstack/tools/unwind.cpp
-index 1812e50..ae20891 100644
---- a/system/core/libunwindstack/tools/unwind.cpp
-+++ b/system/core/libunwindstack/tools/unwind.cpp
-@@ -83,6 +83,9 @@ void DoUnwind(pid_t pid) {
-     case unwindstack::ARCH_MIPS64:
-       printf("mips64");
-       break;
-+    case unwindstack::ARCH_RISCV64:
-+      printf("riscv64");
-+      break;
-     default:
-       printf("unknown\n");
-       return;
-diff --git a/system/core/libunwindstack/tools/unwind_symbols.cpp b/system/core/libunwindstack/tools/unwind_symbols.cpp
-index 8df2284..976db56 100644
---- a/system/core/libunwindstack/tools/unwind_symbols.cpp
-+++ b/system/core/libunwindstack/tools/unwind_symbols.cpp
-@@ -77,6 +77,9 @@ int main(int argc, char** argv) {
-     case EM_AARCH64:
-       printf("ABI: arm64\n");
-       break;
-+    case EM_RISCV:
-+      printf("ABI: riscv64\n");
-+      break;
-     case EM_386:
-       printf("ABI: x86\n");
-       break;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Added-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
deleted file mode 100644
index d827d7d3c2..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-Description: Added missing headers causing compile errors
-Author: Umang Parmar <umangjparmar@gmail.com>
-Forwarded: not-needed
-
---- a/system/core/adb/sysdeps/posix/network.cpp
-+++ b/system/core/adb/sysdeps/posix/network.cpp
-@@ -22,6 +22,7 @@
- #include <sys/socket.h>
- 
- #include <string>
-+#include <cstring>
- 
- #include <android-base/logging.h>
- #include <android-base/stringprintf.h>
---- a/system/core/base/file.cpp
-+++ b/system/core/base/file.cpp
-@@ -26,6 +26,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <cstring>
- 
- #include <memory>
- #include <mutex>
---- a/system/core/libbacktrace/BacktraceMap.cpp
-+++ b/system/core/libbacktrace/BacktraceMap.cpp
-@@ -21,6 +21,7 @@
- #include <stdint.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <algorithm>
- 
- #include <log/log.h>
- 
---- a/system/core/libbacktrace/UnwindStackMap.cpp
-+++ b/system/core/libbacktrace/UnwindStackMap.cpp
-@@ -20,6 +20,7 @@
- 
- #include <string>
- #include <vector>
-+#include <algorithm>
- 
- #include <backtrace/BacktraceMap.h>
- #include <unwindstack/Elf.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Nonnull.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Nonnull.patch
deleted file mode 100644
index 54bd52c61a..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Nonnull.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-Description: Bring Clang's _Nonnull keyword to GCC
-Author: Kai-Chung Yan
-Forwarded: not-needed
---- a/system/core/adb/sysdeps.h
-+++ b/system/core/adb/sysdeps.h
-@@ -40,11 +40,12 @@
- #include "sysdeps/network.h"
- #include "sysdeps/stat.h"
- 
-+#define _Nonnull
-+#define _Nullable
-+
- #ifdef _WIN32
- 
- // Clang-only nullability specifiers
--#define _Nonnull
--#define _Nullable
- 
- #include <ctype.h>
- #include <direct.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Vector-cast.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Vector-cast.patch
deleted file mode 100644
index b2881e0213..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Vector-cast.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Description: Fix the weird error by GCC7 that fails to match the correct parent method.
-Author: Kai-Chung Yan
-Forwarded: not-needed
---- a/system/core/libutils/include/utils/Vector.h
-+++ b/system/core/libutils/include/utils/Vector.h
-@@ -256,7 +256,7 @@
- 
- template<class TYPE> inline
- const Vector<TYPE>& Vector<TYPE>::operator = (const Vector<TYPE>& rhs) const {
--    VectorImpl::operator = (static_cast<const VectorImpl&>(rhs));
-+    VectorImpl::operator = (rhs);
-     return *this;
- }
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/add-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/add-missing-headers.patch
deleted file mode 100644
index 681d2c6553..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/add-missing-headers.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Pending
-
-Forwarded: not-needed
---- a/system/core/fs_mgr/liblp/reader.cpp
-+++ b/system/core/fs_mgr/liblp/reader.cpp
-@@ -22,6 +22,7 @@
- #include <unistd.h>
- 
- #include <functional>
-+#include <cstring>
- 
- #include <android-base/file.h>
- #include <android-base/unique_fd.h>
---- a/system/core/fs_mgr/liblp/writer.cpp
-+++ b/system/core/fs_mgr/liblp/writer.cpp
-@@ -21,6 +21,7 @@
- #include <unistd.h>
- 
- #include <string>
-+#include <cstring>
- 
- #include <android-base/file.h>
- #include <android-base/unique_fd.h>
---- a/system/core/liblog/logger_write.cpp
-+++ b/system/core/liblog/logger_write.cpp
-@@ -27,6 +27,7 @@
- #include <android/set_abort_message.h>
- #endif
- 
-+#include <mutex>
- #include <shared_mutex>
- 
- #include <android-base/errno_restorer.h>
---- a/system/core/libziparchive/zip_archive_stream_entry.cc
-+++ b/system/core/libziparchive/zip_archive_stream_entry.cc
-@@ -23,6 +23,7 @@
- #include <sys/types.h>
- #include <unistd.h>
- 
-+#include <limits>
- #include <memory>
- #include <vector>
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
deleted file mode 100644
index 61032944d8..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 72b53f2d5c6e1b462a288cef3d84dd302fe603d6 Mon Sep 17 00:00:00 2001
-From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
-Date: Wed, 29 Oct 2025 11:58:20 +0530
-Subject: [PATCH] android-tools: scope 'write' macro to prevent conflict with
- std::basic_ostream::write
-
-The build fails with a compiler error due to a macro redefinition of 'write'
-to '___xxx_write'. This macro substitution interferes with the standard C++
-library's definition of std::basic_ostream::write, leading to a mismatch
-between function declarations and definitions in <ostream.tcc>.
-
-Wrap the `#undef write` and `#define write ___xxx_write` directives with
-`#if defined(__ANDROID__)` to ensure they are only applied when building
-for
-Android.
-
-Upstream-Status: Pending
-
-Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
----
- system/core/adb/sysdeps.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/system/core/adb/sysdeps.h b/system/core/adb/sysdeps.h
-index a4827b8a..ff51d574 100644
---- a/system/core/adb/sysdeps.h
-+++ b/system/core/adb/sysdeps.h
-@@ -127,8 +127,10 @@ static __inline__ int unix_read(borrowed_fd fd, void* buf, size_t len) {
- static __inline__ int unix_write(borrowed_fd fd, const void* buf, size_t len) {
-     return write(fd.get(), buf, len);
- }
-+#if defined(__ANDROID__)
- #undef   write
- #define  write  ___xxx_write
-+#endif
- 
- #undef pwrite
- #define pwrite ___xxx_pwrite
-@@ -463,8 +465,10 @@ static __inline__ int adb_pwrite(int fd, const void* buf, size_t len, off64_t of
- #endif
- }
- 
-+#if defined(__ANDROID__)
- #undef   write
- #define  write  ___xxx_write
-+#endif
- #undef pwrite
- #define pwrite ___xxx_pwrite
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
deleted file mode 100644
index 441031f536..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Pending
-
-Description: remove clang-ism
-Forwarded: not-needed
-
---- a/system/core/base/include/android-base/logging.h
-+++ b/system/core/base/include/android-base/logging.h
-@@ -451,10 +451,7 @@
- //       -Wno-user-defined-warnings to CPPFLAGS.
- #pragma clang diagnostic push
- #pragma clang diagnostic ignored "-Wgcc-compat"
--#define OSTREAM_STRING_POINTER_USAGE_WARNING \
--    __attribute__((diagnose_if(true, "Unexpected logging of string pointer", "warning")))
--inline OSTREAM_STRING_POINTER_USAGE_WARNING
--std::ostream& operator<<(std::ostream& stream, const std::string* string_pointer) {
-+inline std::ostream& operator<<(std::ostream& stream, const std::string* string_pointer) {
-   return stream << static_cast<const void*>(string_pointer);
- }
- #pragma clang diagnostic pop
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
deleted file mode 100644
index b1caa60c4a..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-Description: non-x86 arches do not have PAGE_SIZE
-Forwarded: not-needed
---- a/system/core/base/cmsg.cpp
-+++ b/system/core/base/cmsg.cpp
-@@ -33,7 +33,8 @@
-                                  const std::vector<int>& fds) {
-   size_t cmsg_space = CMSG_SPACE(sizeof(int) * fds.size());
-   size_t cmsg_len = CMSG_LEN(sizeof(int) * fds.size());
--  if (cmsg_space >= PAGE_SIZE) {
-+  size_t pagesize = static_cast<size_t>(sysconf(_SC_PAGE_SIZE));
-+  if (cmsg_space >= pagesize) {
-     errno = ENOMEM;
-     return -1;
-   }
-@@ -75,7 +76,8 @@
-   fds->clear();
- 
-   size_t cmsg_space = CMSG_SPACE(sizeof(int) * max_fds);
--  if (cmsg_space >= PAGE_SIZE) {
-+  size_t pagesize = static_cast<size_t>(sysconf(_SC_PAGE_SIZE));
-+  if (cmsg_space >= pagesize) {
-     errno = ENOMEM;
-     return -1;
-   }
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
deleted file mode 100644
index 5f24d0b4a0..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-Description: get libcutils building
-Forwarded: not-needed
---- a/system/core/libcutils/include/cutils/threads.h
-+++ b/system/core/libcutils/include/cutils/threads.h
-@@ -33,7 +33,7 @@
- // Deprecated: use android::base::GetThreadId instead, which doesn't truncate on Mac/Windows.
- //
- 
--extern pid_t gettid();
-+extern pid_t gettid(void) __THROW;
- 
- //
- // Deprecated: use `_Thread_local` in C or `thread_local` in C++.
---- a/system/core/libcutils/threads.cpp
-+++ b/system/core/libcutils/threads.cpp
-@@ -33,7 +33,7 @@
- 
- // No definition needed for Android because we'll just pick up bionic's copy.
- #ifndef __ANDROID__
--pid_t gettid() {
-+pid_t gettid(void) __THROW {
- #if defined(__APPLE__)
-   uint64_t tid;
-   pthread_threadid_np(NULL, &tid);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
deleted file mode 100644
index 4380308f13..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-Description: Add missing 'std::' scope identifiers.
-Forwarded: not-needed
---- a/system/core/libunwindstack/include/unwindstack/DwarfMemory.h
-+++ b/system/core/libunwindstack/include/unwindstack/DwarfMemory.h
-@@ -29,7 +29,7 @@
-   DwarfMemory(Memory* memory) : memory_(memory) {}
-   virtual ~DwarfMemory() = default;
- 
--  bool ReadBytes(void* dst, size_t num_bytes);
-+  bool ReadBytes(void* dst, std::size_t num_bytes);
- 
-   template <typename SignedType>
-   bool ReadSigned(uint64_t* value);
-@@ -39,7 +39,7 @@
-   bool ReadSLEB128(int64_t* value);
- 
-   template <typename AddressType>
--  size_t GetEncodedSize(uint8_t encoding);
-+  std::size_t GetEncodedSize(uint8_t encoding);
- 
-   bool AdjustEncodedValue(uint8_t encoding, uint64_t* value);
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/hard-code-build-number.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
deleted file mode 100644
index 4d7323bd2f..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-Description: just hard code rather than deal with circular deps
-Forwarded: not-needed
---- a/system/core/adb/adb.cpp
-+++ b/system/core/adb/adb.cpp
-@@ -44,8 +44,6 @@
- #include <android-base/parsenetaddress.h>
- #include <android-base/stringprintf.h>
- #include <android-base/strings.h>
--#include <build/version.h>
--#include <platform_tools_version.h>
- 
- #include "adb_auth.h"
- #include "adb_io.h"
-@@ -69,7 +67,7 @@
-         "Version %s-%s\n"
-         "Installed as %s\n",
-         ADB_VERSION_MAJOR, ADB_VERSION_MINOR, ADB_SERVER_VERSION,
--        PLATFORM_TOOLS_VERSION, android::build::GetBuildNumber().c_str(),
-+        PLATFORM_TOOLS_VERSION, "debian",
-         android::base::GetExecutablePath().c_str());
- }
- 
---- a/system/core/fastboot/fastboot.cpp
-+++ b/system/core/fastboot/fastboot.cpp
-@@ -59,10 +59,8 @@
- #include <android-base/stringprintf.h>
- #include <android-base/strings.h>
- #include <android-base/unique_fd.h>
--#include <build/version.h>
- #include <libavb/libavb.h>
- #include <liblp/liblp.h>
--#include <platform_tools_version.h>
- #include <sparse/sparse.h>
- #include <ziparchive/zip_archive.h>
- 
-@@ -1680,7 +1678,7 @@
-                 setvbuf(stdout, nullptr, _IONBF, 0);
-                 setvbuf(stderr, nullptr, _IONBF, 0);
-             } else if (name == "version") {
--                fprintf(stdout, "fastboot version %s-%s\n", PLATFORM_TOOLS_VERSION, android::build::GetBuildNumber().c_str());
-+                fprintf(stdout, "fastboot version %s-%s\n", PLATFORM_TOOLS_VERSION, "debian");
-                 fprintf(stdout, "Installed as %s\n", android::base::GetExecutablePath().c_str());
-                 return 0;
- #if !defined(_WIN32)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libusb-header-path.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libusb-header-path.patch
deleted file mode 100644
index 122bd70e7d..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libusb-header-path.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-Description: libusb.h comes from different location
-Author: Umang Parmar <umangjparmar@gmail.com>
-Forwarded: not-needed
-Last-Update: 2018-05-26
-
---- a/system/core/adb/client/usb_libusb.cpp
-+++ b/system/core/adb/client/usb_libusb.cpp
-@@ -30,7 +30,7 @@
- #include <thread>
- #include <unordered_map>
- 
--#include <libusb/libusb.h>
-+#include <libusb-1.0/libusb.h>
- 
- #include <android-base/file.h>
- #include <android-base/logging.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
deleted file mode 100644
index 0b5087f283..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From f6874a2f7de30b6eeefb2d509b895c58b93da8f7 Mon Sep 17 00:00:00 2001
-From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
-Date: Wed, 29 Oct 2025 09:38:17 +0530
-Subject: [PATCH] libziparchive: fix missing fixed-width integer types in
- zip_writer.h
-
-Compilation fails due to undefined types 'uint16_t' and 'uint32_t' in
-zip_writer.h. These types are used in struct members but are not recognized
-because the required header <cstdint> is not included. This results in
-errors such as:
-  error: 'uint16_t' does not name a type
-  error: 'uint32_t' does not name a type
-
-Added '#include <cstdint>' to zip_writer.h to ensure fixed-width integer
-types are properly defined.
-
-Upstream-Status: Pending
-
-Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
----
- system/core/libziparchive/include/ziparchive/zip_writer.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/system/core/libziparchive/include/ziparchive/zip_writer.h b/system/core/libziparchive/include/ziparchive/zip_writer.h
-index d68683df..7a05e349 100644
---- a/system/core/libziparchive/include/ziparchive/zip_writer.h
-+++ b/system/core/libziparchive/include/ziparchive/zip_writer.h
-@@ -18,6 +18,7 @@
- 
- #include <cstdio>
- #include <ctime>
-+#include <cstdint>
- 
- #include <gtest/gtest_prod.h>
- #include <memory>
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
deleted file mode 100644
index e8494ab433..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-Description: Update log file directory.
-Author: Umang Parmar <umangjparmar@gmail.com>
-Last Updated: 2018-05-17
-
---- a/system/core/adb/adb_utils.cpp
-+++ b/system/core/adb/adb_utils.cpp
-@@ -339,6 +339,11 @@
- 
-     return temp_path_utf8 + log_name;
- #else
-+    std::string log_dir = android::base::StringPrintf("/run/user/%u/adb.log", getuid());
-+    struct stat st = {0};
-+    if (stat(log_dir.c_str(), &st) == 0) {
-+      return log_dir;
-+    }
-     const char* tmp_dir = getenv("TMPDIR");
-     if (tmp_dir == nullptr) tmp_dir = "/tmp";
-     return android::base::StringPrintf("%s/adb.%u.log", tmp_dir, getuid());
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/simg_dump-python3.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
deleted file mode 100644
index 6664dc2aa5..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Description: Port simg_dump to Python 3.
-Author: Antonio Russo <antonio.e.russo@gmail.com>
-Forwarded: not-needed
-Last-Update: 2019-01-05
-Origin: https://bugs.debian.org/945646
-
----
-Upstream-Status: Pending
-
-Index: android-platform-tools/system/core/libsparse/simg_dump.py
-===================================================================
---- android-platform-tools.orig/system/core/libsparse/simg_dump.py
-+++ android-platform-tools/system/core/libsparse/simg_dump.py
-@@ -1,4 +1,4 @@
--#! /usr/bin/env python
-+#! /usr/bin/env python3
- 
- # Copyright (C) 2012 The Android Open Source Project
- #
-@@ -14,7 +14,7 @@
- # See the License for the specific language governing permissions and
- # limitations under the License.
- 
--from __future__ import print_function
-+
- import csv
- import getopt
- import hashlib
-@@ -47,7 +47,7 @@ def main():
-     opts, args = getopt.getopt(sys.argv[1:],
-                                "vsc:",
-                                ["verbose", "showhash", "csvfile"])
--  except getopt.GetoptError, e:
-+  except getopt.GetoptError as e:
-     print(e)
-     usage(me)
-   for o, a in opts:
-@@ -66,7 +66,7 @@ def main():
-     usage(me)
- 
-   if csvfilename:
--    csvfile = open(csvfilename, "wb")
-+    csvfile = open(csvfilename, "w", newline='')
-     csvwriter = csv.writer(csvfile)
- 
-   output = verbose or csvfilename or showhash
-@@ -121,7 +121,7 @@ def main():
-                           "output offset", "output blocks", "type", "hash"])
- 
-     offset = 0
--    for i in xrange(1, total_chunks + 1):
-+    for i in range(1, total_chunks + 1):
-       header_bin = FH.read(12)
-       header = struct.unpack("<2H2I", header_bin)
-       chunk_type = header[0]
-@@ -160,7 +160,7 @@ def main():
-           if showhash:
-             h = hashlib.sha1()
-             data = fill_bin * (blk_sz / 4);
--            for block in xrange(chunk_sz):
-+            for block in range(chunk_sz):
-               h.update(data)
-             curhash = h.hexdigest()
-       elif chunk_type == 0xCAC3:
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stdatomic.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stdatomic.patch
deleted file mode 100644
index e11f3cc783..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stdatomic.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Upstream-Status: Pending
-
-Description: Fix incompatibility between <stdatomic.h> and <atomic>
- This 2 headers combined will cause errors for both GCC and Clang. This patch
- makes sure only one of them is present at any time.
-Bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60932
-Bug: https://reviews.llvm.org/D45470
---- a/system/core/libcutils/include/cutils/trace.h
-+++ b/system/core/libcutils/include/cutils/trace.h
-@@ -18,7 +18,14 @@
- #define _LIBS_CUTILS_TRACE_H
- 
- #include <inttypes.h>
-+#ifdef __cplusplus
-+#include <atomic>
-+using std::atomic_bool;
-+using std::atomic_load_explicit;
-+using std::memory_order_acquire;
-+#else
- #include <stdatomic.h>
-+#endif
- #include <stdbool.h>
- #include <stdint.h>
- #include <stdio.h>
---- a/system/core/libcutils/include/cutils/atomic.h
-+++ b/system/core/libcutils/include/cutils/atomic.h
-@@ -19,7 +19,23 @@
- 
- #include <stdint.h>
- #include <sys/types.h>
-+#ifdef __cplusplus
-+#include <atomic>
-+using std::atomic_compare_exchange_strong_explicit;
-+using std::atomic_fetch_add_explicit;
-+using std::atomic_fetch_or_explicit;
-+using std::atomic_fetch_sub_explicit;
-+using std::atomic_int_least32_t;
-+using std::atomic_load_explicit;
-+using std::atomic_store_explicit;
-+using std::atomic_thread_fence;
-+using std::memory_order::memory_order_acquire;
-+using std::memory_order::memory_order_relaxed;
-+using std::memory_order::memory_order_release;
-+using std::memory_order::memory_order_seq_cst;
-+#else
- #include <stdatomic.h>
-+#endif
- 
- #ifndef ANDROID_ATOMIC_INLINE
- #define ANDROID_ATOMIC_INLINE static inline
---- a/system/core/liblog/logger.h
-+++ b/system/core/liblog/logger.h
-@@ -16,7 +16,13 @@
- 
- #pragma once
- 
-+#ifdef __cplusplus
-+#include <atomic>
-+using std::atomic_int;
-+using std::atomic_uintptr_t;
-+#else
- #include <stdatomic.h>
-+#endif
- #include <sys/cdefs.h>
- 
- #include <log/log.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
deleted file mode 100644
index d86ef230f7..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-Upstream-Status: Pending
-
-Description: Defer packaging fastdeploy with adb for 29.x.x tags.
-Forwarded: not-needed
---- a/system/core/adb/client/commandline.cpp
-+++ b/system/core/adb/client/commandline.cpp
-@@ -59,7 +59,6 @@
- #include "bugreport.h"
- #include "client/file_sync_client.h"
- #include "commandline.h"
--#include "fastdeploy.h"
- #include "services.h"
- #include "shell_protocol.h"
- #include "sysdeps/chrono.h"
---- a/system/core/adb/client/adb_install.cpp
-+++ b/system/core/adb/client/adb_install.cpp
-@@ -35,7 +35,6 @@
- #include "adb_utils.h"
- #include "client/file_sync_client.h"
- #include "commandline.h"
--#include "fastdeploy.h"
- 
- static constexpr int kFastDeployMinApi = 24;
- 
-@@ -167,14 +166,6 @@
-     }
- 
-     if (use_fastdeploy) {
--        auto metadata = extract_metadata(file);
--        if (metadata.has_value()) {
--            // pass all but 1st (command) and last (apk path) parameters through to pm for
--            // session creation
--            std::vector<const char*> pm_args{argv + 1, argv + argc - 1};
--            auto patchFd = install_patch(pm_args.size(), pm_args.data());
--            return stream_patch(file, std::move(metadata.value()), std::move(patchFd));
--        }
-     }
- 
-     struct stat sb;
-@@ -267,16 +258,6 @@
-     argv[last_apk] = apk_dest.c_str(); /* destination name, not source location */
- 
-     if (use_fastdeploy) {
--        auto metadata = extract_metadata(apk_file[0]);
--        if (metadata.has_value()) {
--            auto patchFd = apply_patch_on_device(apk_dest.c_str());
--            int status = stream_patch(apk_file[0], std::move(metadata.value()), std::move(patchFd));
--
--            result = pm_command(argc, argv);
--            delete_device_file(apk_dest);
--
--            return status;
--        }
-     }
- 
-     if (do_sync_push(apk_file, apk_dest.c_str(), false)) {
-@@ -292,7 +273,6 @@
-     InstallMode installMode = INSTALL_DEFAULT;
-     bool use_fastdeploy = false;
-     bool is_reinstall = false;
--    FastDeploy_AgentUpdateStrategy agent_update_strategy = FastDeploy_AgentUpdateDifferentVersion;
- 
-     for (int i = 1; i < argc; i++) {
-         if (!strcmp(argv[i], "--streaming")) {
-@@ -313,13 +293,10 @@
-             use_fastdeploy = false;
-         } else if (!strcmp(argv[i], "--force-agent")) {
-             processedArgIndicies.push_back(i);
--            agent_update_strategy = FastDeploy_AgentUpdateAlways;
-         } else if (!strcmp(argv[i], "--date-check-agent")) {
-             processedArgIndicies.push_back(i);
--            agent_update_strategy = FastDeploy_AgentUpdateNewerTimeStamp;
-         } else if (!strcmp(argv[i], "--version-check-agent")) {
-             processedArgIndicies.push_back(i);
--            agent_update_strategy = FastDeploy_AgentUpdateDifferentVersion;
-         }
-     }
- 
-@@ -331,13 +308,11 @@
-         error_exit("Attempting to use streaming install on unsupported device");
-     }
- 
--    if (use_fastdeploy && get_device_api_level() < kFastDeployMinApi) {
--        printf("Fast Deploy is only compatible with devices of API version %d or higher, "
--               "ignoring.\n",
--               kFastDeployMinApi);
-+    if (use_fastdeploy) {
-+        printf("Fast Deploy is unavailable in this build of adb, "
-+               "ignoring.\n");
-         use_fastdeploy = false;
-     }
--    fastdeploy_set_agent_update_strategy(agent_update_strategy);
- 
-     std::vector<const char*> passthrough_argv;
-     for (int i = 0; i < argc; i++) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
deleted file mode 100644
index 70e732131f..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-Description: Turn #error into exceptions
- So the library can be built on non-Linux platforms too, although can't
- guarauntee its functionality regarding that piece of code.
-Forwarded: not-needed
---- a/system/core/base/file.cpp
-+++ b/system/core/base/file.cpp
-@@ -422,7 +422,8 @@
-   path[PATH_MAX - 1] = 0;
-   return path;
- #else
--#error unknown OS
-+#include <stdexcept>
-+  throw std::runtime_error(std::string("Unknown OS!"));
- #endif
- }
- 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remount b/meta-oe/recipes-devtools/android-tools/android-tools/remount
deleted file mode 100644
index 751c3501ef..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/remount
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-mount -o remount,rw /
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk b/meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
deleted file mode 100644
index 2c808d3c1e..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
+++ /dev/null
@@ -1 +0,0 @@
-CPPFLAGS += -fPIC
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
deleted file mode 100644
index b3a3f78254..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
+++ /dev/null
@@ -1,196 +0,0 @@
-DESCRIPTION = "Various utilities from Android"
-SECTION = "console/utils"
-LICENSE = "Apache-2.0 & GPL-2.0-only & BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM = " \
-    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
-    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
-    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
-    file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
-"
-DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools 7zip googletest"
-
-SRCREV_core = "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
-
-SRC_URI = " \
-    git://salsa.debian.org/android-tools-team/android-platform-tools;name=core;protocol=https;branch=master \
-"
-
-# Patches copied from android-platform-tools/debian/patches
-# and applied in the order defined by the file debian/patches/series
-SRC_URI += " \
-    file://debian/external/libunwind/user_pt_regs.patch \
-    file://debian/external/libunwind/legacy_built-in_sync_functions.patch \
-    file://debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch \
-    file://debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch \
-    file://debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch \
-    \
-    file://debian/system/core/move-log-file-to-proper-dir.patch \
-    file://debian/system/core/Added-missing-headers.patch \
-    file://debian/system/core/libusb-header-path.patch \
-    file://debian/system/core/stdatomic.patch \
-    file://debian/system/core/Nonnull.patch \
-    file://debian/system/core/Vector-cast.patch \
-    file://debian/system/core/throw-exception-on-unknown-os.patch \
-    file://debian/system/core/simg_dump-python3.patch \
-    file://debian/system/core/fix-attribute-issue-with-gcc.patch \
-    file://debian/system/core/fix-gettid-exception-declaration.patch \
-    file://debian/system/core/fix-build-on-non-x86.patch \
-    file://debian/system/core/add-missing-headers.patch \
-    file://debian/system/core/hard-code-build-number.patch \
-    file://debian/system/core/stub-out-fastdeploy.patch \
-    file://debian/system/core/fix-standard-namespace-errors.patch \
-    file://debian/system/core/Add-riscv64-support.patch \
-    file://debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch \
-    file://debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch \
-    \
-"
-
-# patches which don't come from debian
-SRC_URI += " \
-    file://rules_yocto.mk;subdir=${BB_GIT_DEFAULT_DESTSUFFIX} \
-    file://android-tools-adbd.service \
-    file://adbd.mk;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/debian/system/core \
-    file://remount \
-    file://0001-Fixes-for-yocto-build.patch \
-    file://0002-android-tools-modifications-to-make-it-build-in-yoct.patch \
-    file://0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch \
-    file://0004-adb-Fix-build-on-big-endian-systems.patch \
-    file://0005-adb-Allow-adbd-to-be-run-as-root.patch \
-    file://0001-liblp-fix-building-with-GCC-14.patch \
-"
-
-B = "${WORKDIR}/${BPN}"
-
-# http://errors.yoctoproject.org/Errors/Details/1debian881/
-ARM_INSTRUCTION_SET:armv4 = "arm"
-ARM_INSTRUCTION_SET:armv5 = "arm"
-
-COMPATIBLE_HOST:powerpc = "(null)"
-COMPATIBLE_HOST:powerpc64 = "(null)"
-COMPATIBLE_HOST:powerpc64le = "(null)"
-
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}-adbd"
-SYSTEMD_SERVICE:${PN}-adbd = "android-tools-adbd.service"
-
-# Find libbsd headers during native builds
-CC:append:class-native = " -I${STAGING_INCDIR}"
-CC:append:class-nativesdk = " -I${STAGING_INCDIR}"
-
-PREREQUISITE_core = "liblog libbase libsparse liblog libcutils"
-TOOLS_TO_BUILD = "libcrypto_utils libadb libziparchive fastboot adb img2simg simg2img libbacktrace"
-TOOLS_TO_BUILD:append:class-target = " adbd"
-
-do_compile() {
-
-    case "${HOST_ARCH}" in
-      arm)
-        export android_arch=linux-arm
-        cpu=arm
-        deb_host_arch=arm
-      ;;
-      aarch64)
-        export android_arch=linux-arm64
-        cpu=arm64
-        deb_host_arch=arm64
-      ;;
-      riscv64)
-        export android_arch=linux-riscv64
-      ;;
-      mips|mipsel)
-        export android_arch=linux-mips
-        cpu=mips
-        deb_host_arch=mips
-      ;;
-      mips64|mips64el)
-        export android_arch=linux-mips64
-        cpu=mips64
-        deb_host_arch=mips64
-      ;;
-      powerpc|powerpc64)
-        export android_arch=linux-ppc
-      ;;
-      i586|i686|x86_64)
-        export android_arch=linux-x86
-        cpu=x86_64
-        deb_host_arch=amd64
-      ;;
-    esac
-
-    export SRCDIR=${S}
-
-    oe_runmake -f ${S}/debian/external/boringssl/libcrypto.mk -C ${S}
-    oe_runmake -f ${S}/debian/external/libunwind/libunwind.mk -C ${S} CPU=${cpu}
-
-    for tool in ${PREREQUISITE_core}; do
-      oe_runmake -f ${S}/debian/system/core/${tool}.mk -C ${S}
-    done
-
-    for i in `find ${S}/debian/system/extras/ -name "*.mk"`; do
-        oe_runmake -f $i -C ${S}
-    done
-
-    for tool in ${TOOLS_TO_BUILD}; do
-        if [ "$tool" = "libbacktrace" ]; then
-            oe_runmake -f ${S}/debian/system/core/${tool}.mk -C ${S} DEB_HOST_ARCH=${deb_host_arch}
-        else
-            oe_runmake -f ${S}/debian/system/core/${tool}.mk -C ${S}
-        fi
-    done
-
-}
-
-do_install() {
-    install -d ${D}${base_sbindir}
-    install -m 0755 ${UNPACKDIR}/remount -D ${D}${base_sbindir}/remount
-
-    for tool in img2simg simg2img fastboot adbd; do
-        if echo ${TOOLS_TO_BUILD} | grep -q "$tool" ; then
-            install -D -p -m0755 ${S}/debian/out/system/core/$tool ${D}${bindir}/$tool
-        fi
-    done
-
-    # grep adb also matches adbd, so handle adb separately from other tools
-    if echo ${TOOLS_TO_BUILD} | grep -q "adb " ; then
-        install -d ${D}${bindir}
-        install -m0755 ${S}/debian/out/system/core/adb ${D}${bindir}
-    fi
-
-    # Outside the if statement to avoid errors during do_package
-    install -D -p -m0644 ${UNPACKDIR}/android-tools-adbd.service \
-      ${D}${systemd_unitdir}/system/android-tools-adbd.service
-
-    install -d  ${D}${libdir}/android/
-    install -m0755 ${S}/debian/out/system/core/*.so.* ${D}${libdir}/android/
-    if echo ${TOOLS_TO_BUILD} | grep -q "mkbootimg" ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
-    fi
-}
-
-PACKAGES =+ "${PN}-fstools ${PN}-adbd"
-
-RDEPENDS:${BPN} = "${BPN}-conf 7zip"
-
-FILES:${PN}-adbd = "\
-    ${bindir}/adbd \
-    ${systemd_unitdir}/system/android-tools-adbd.service \
-"
-
-FILES:${PN}-fstools = "\
-    ${bindir}/ext2simg \
-    ${bindir}/ext4fixup \
-    ${bindir}/img2simg \
-    ${bindir}/make_ext4fs \
-    ${bindir}/simg2img \
-    ${bindir}/simg2simg \
-    ${bindir}/simg_dump \
-    ${bindir}/mkuserimg \
-"
-FILES:${PN} += "${libdir}/android ${libdir}/android/*"
-
-BBCLASSEXTEND = "native"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
-PACKAGECONFIG[selinux] = ",,libselinux"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
new file mode 100644
index 0000000000..3a277cd4b5
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -0,0 +1,237 @@
+DESCRIPTION = "Various utilities from Android"
+SECTION = "console/utils"
+LICENSE = "Apache-2.0 & GPL-2.0-only & BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
+    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
+    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
+    file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
+"
+
+DEPENDS = " \
+    android-libboringssl \
+    brotli \
+    libcap \
+    7zip \
+    protobuf \
+    protobuf-native \
+    libusb \
+    squashfs-tools \
+    zlib \
+"
+
+# The debian/ patches are copied from android-platform-tools/debian/patches and
+# applied in the order defined by debian/patches/series. Listing them as
+# first-class SRC_URI entries (rather than running quilt inside do_patch) makes
+# the recipe work correctly with devtool.
+SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/android-platform-tools_35.0.2.orig.tar.xz;name=orig;subdir=android-platform-tools-${PV} \
+           https://deb.debian.org/debian/pool/main/a/android-platform-tools/android-platform-tools_35.0.2-1~exp6.debian.tar.xz;name=debian;subdir=android-platform-tools-${PV} \
+           file://android-tools-adbd.service \
+           file://debian/deb-gcc-stdatomic.patch \
+           file://debian/deb-gcc-workaround__builtin_available.patch \
+           file://debian/deb-gcc-Nullable.patch \
+           file://debian/deb-sys-unwindstack-porting.patch \
+           file://debian/deb-sys-move-log-file-to-proper-dir.patch \
+           file://debian/deb-sys-Added-missing-headers.patch \
+           file://debian/deb-sys-libusb-header-path.patch \
+           file://debian/deb-sys-throw-exception-on-unknown-os.patch \
+           file://debian/deb-sys-hard-code-build-number.patch \
+           file://debian/deb-sys-stub-out-fastdeploy.patch \
+           file://debian/deb-sys-Implement-const_iterator-operator.patch \
+           file://debian/deb-sys-Drop-gki-dependency-from-mkbootimg.patch \
+           file://debian/deb-sys-add-missing-headers.patch \
+           file://debian/deb-dev-typos.patch \
+           file://debian/deb-adbd-adbd-allow-usb-on-linux.patch \
+           file://debian/deb-adbd-adbd-allow-notifying-systemd.patch \
+           file://debian/deb-adbd-adbd-usb-drop-property-monitor.patch \
+           file://debian/deb-adbd-adbd-don-t-require-authorization-on-Linux.patch \
+           file://0001-libbacktrace.mk-Link-against-staged-lib7z.patch \
+           file://0002-debian-makefiles-yocto-compat.patch \
+           file://0003-gcc-nullability-and-thread-annotation-compat.patch \
+           file://0004-fastboot-super_flash_helper-include-climits.patch \
+           file://0005-adb-host-usb-compat.patch \
+           file://0006-adbd-enable-root-and-remount-support.patch \
+           file://0007-libcutils-guard-Android-private-header-with-addition.patch \
+           file://0008-adb-GCC-compatibility-fixes-for-usb_linux-and-sysdep.patch \
+           file://0009-libbase-include-stdint.h-in-hex.cpp.patch \
+           file://0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch \
+           "
+
+SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"
+SRC_URI[orig.sha256sum] = "ec1d317608db3328bfbddf7152c8d7f185c7c87b2175081416344434546a43da"
+SRC_URI[debian.md5sum] = "1de890bd272da9e8cd35bc9579802f1f"
+SRC_URI[debian.sha256sum] = "f03a89b82ea8dfbe3cb77d5326eedf0d15984f5896885e8c5df64cf421819579"
+
+S = "${UNPACKDIR}/android-platform-tools-${PV}"
+B = "${UNPACKDIR}/${BPN}"
+
+# http://errors.yoctoproject.org/Errors/Details/1debian881/
+ARM_INSTRUCTION_SET:armv4 = "arm"
+ARM_INSTRUCTION_SET:armv5 = "arm"
+
+COMPATIBLE_HOST:powerpc = "(null)"
+COMPATIBLE_HOST:powerpc64 = "(null)"
+COMPATIBLE_HOST:powerpc64le = "(null)"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-adbd"
+SYSTEMD_SERVICE:${PN}-adbd = "android-tools-adbd.service"
+
+CFLAGS:append = " -fPIC -std=gnu2x"
+CXXFLAGS:append = " -fPIC -std=gnu++20 -D_Nonnull= -D_Nullable= -I${STAGING_INCDIR}/boringssl"
+LDFLAGS:append = " -fPIC -L${STAGING_LIBDIR}/android"
+
+
+CC:append:class-native = " -I${STAGING_INCDIR}"
+CC:append:class-nativesdk = " -I${STAGING_INCDIR}"
+
+PREREQUISITE_core = ""
+PREREQUISITE_core:class-target = "liblog libbase libcutils libcrypto_utils libadb"
+PREREQUISITE_core:class-native = "liblog libbase libcutils libziparchive libsparse libcrypto_utils libadb"
+
+TOOLS_TO_BUILD = ""
+TOOLS_TO_BUILD:class-target = "adbd"
+TOOLS_TO_BUILD:class-native = "adb fastboot img2simg simg2img"
+
+BUILD_SYSROOT = "${RECIPE_SYSROOT}"
+BUILD_SYSROOT:class-native = "${RECIPE_SYSROOT_NATIVE}"
+
+do_compile() {
+    case "${HOST_ARCH}" in
+    arm)
+        export android_arch=linux-arm
+        cpu=arm
+        deb_host_arch=arm
+        ;;
+    aarch64)
+        export android_arch=linux-arm64
+        cpu=arm64
+        deb_host_arch=arm64
+        ;;
+    riscv64)
+        export android_arch=linux-riscv64
+        cpu=riscv64
+        deb_host_arch=riscv64
+        ;;
+    mips|mipsel)
+        export android_arch=linux-mips
+        cpu=mips
+        deb_host_arch=mips
+        ;;
+    mips64|mips64el)
+        export android_arch=linux-mips64
+        cpu=mips64
+        deb_host_arch=mips64
+        ;;
+    powerpc|powerpc64)
+        export android_arch=linux-ppc
+        cpu=ppc
+        deb_host_arch=ppc64
+        ;;
+    i586|i686)
+        export android_arch=linux-x86
+        cpu=x86
+        deb_host_arch=i386
+        ;;
+    x86_64)
+        export android_arch=linux-x86
+        cpu=x86_64
+        deb_host_arch=amd64
+        ;;
+    *)
+        bbfatal "Unsupported HOST_ARCH=${HOST_ARCH}"
+        ;;
+    esac
+
+    export SRCDIR=${S}
+    export DEB_HOST_ARCH=${deb_host_arch}
+    export DEB_HOST_MULTIARCH=
+    export SYSROOT=${BUILD_SYSROOT}
+
+    if echo " ${TOOLS_TO_BUILD} " | grep -Eq " (adb|fastboot) "; then
+        # Native host tools should use the host system's ELF interpreter, not
+        # Yocto's uninative loader under /workdir.
+        export LDFLAGS="$(printf '%s\n' "${LDFLAGS}" | \
+            sed -E 's@-Wl,--dynamic-linker=[^[:space:]]+@@g; s@[[:space:]]+@ @g; s@^[[:space:]]+@@; s@[[:space:]]+$@@')"
+    fi
+
+    # Debian's make fragments expect generated protobuf sources to already be
+    # present under packages/modules/adb/proto, but the orig tarball only ships
+    # the .proto inputs.
+    for proto in adb_host adb_known_hosts app_processes key_type pairing; do
+        ${STAGING_BINDIR_NATIVE}/protoc \
+            --proto_path=${S}/packages/modules/adb/proto \
+            --cpp_out=${S}/packages/modules/adb/proto \
+            ${S}/packages/modules/adb/proto/${proto}.proto
+    done
+
+    if [ -d ${S}/packages/modules/adb/fastdeploy/proto ]; then
+        for proto in ${S}/packages/modules/adb/fastdeploy/proto/*.proto; do
+            [ -e "$proto" ] || continue
+            ${STAGING_BINDIR_NATIVE}/protoc \
+                --proto_path=${S}/packages/modules/adb \
+                --cpp_out=${S}/packages/modules/adb \
+                "$proto"
+        done
+    fi
+
+    # Debian's make fragments write archives and binaries under debian/out/*
+    # but do not consistently create parent directories before invoking ar.
+    install -d ${S}/debian/out/system/extras
+
+    # Debian replaces Android's Soong build system with hand-written GNU make
+    # fragments under debian/system/ and debian/external/.
+    for tool in ${PREREQUISITE_core}; do
+        oe_runmake -f ${S}/debian/system/${tool}.mk -C ${S}
+    done
+
+    if echo " ${TOOLS_TO_BUILD} " | grep -q " fastboot "; then
+        # Debian's fastboot.mk links against the ext4_utils static archive from
+        # debian/out/system/extras, so build that helper archive first.
+        oe_runmake -f ${S}/debian/system/extras/libext4_utils.mk -C ${S}
+    fi
+
+    for tool in ${TOOLS_TO_BUILD}; do
+        oe_runmake -f ${S}/debian/system/${tool}.mk -C ${S} \
+            ${@'HAVE_SYSTEMD=1' if bb.utils.contains('PACKAGECONFIG', 'systemd', True, False, d) else ''}
+    done
+}
+
+do_install() {
+    for tool in ${TOOLS_TO_BUILD}; do
+        install -D -p -m0755 ${S}/debian/out/system/${tool} ${D}${bindir}/${tool}
+    done
+
+    if echo " ${TOOLS_TO_BUILD} " | grep -q " adbd "; then
+        install -D -p -m0644 ${UNPACKDIR}/android-tools-adbd.service \
+          ${D}${systemd_unitdir}/system/android-tools-adbd.service
+    fi
+
+    install -d ${D}${libdir}/android/
+    install -m0755 ${S}/debian/out/system/lib*.so.* ${D}${libdir}/android/
+}
+
+PACKAGES =+ "${PN}-adbd"
+RDEPENDS:${PN}:class-target = "android-tools-conf-configfs 7zip android-libboringssl"
+RDEPENDS:${PN}-adbd += "${PN}"
+PRIVATE_LIBS:${PN} = "liblog.so.0 libbase.so.0 libcutils.so.0"
+
+inherit useradd
+USERADD_PACKAGES = "${PN}-adbd"
+USERADD_PARAM:${PN}-adbd = "--system --no-create-home --shell /bin/false --user-group adb"
+
+FILES:${PN} += " \
+    ${libdir}/android \
+    ${libdir}/android/* \
+"
+
+FILES:${PN}-adbd = " \
+    ${bindir}/adbd \
+    ${systemd_unitdir}/system/android-tools-adbd.service \
+"
+
+BBCLASSEXTEND = "native"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = ",,systemd"
-- 
2.43.0


