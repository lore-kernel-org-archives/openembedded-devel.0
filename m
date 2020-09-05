Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3036.1599324967745099980
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gYIfIk+o;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 17so6317500pfw.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxYDh+e/3ZGvmZIrCU1sHRDGC02su6ScWCsiAgPvxiU=;
        b=gYIfIk+ou8jTC7Js615k9wgJL50RIbZTnk1Hcv++0xVZ3+xtsQ1KfLdmS0hHkyw0Jo
         ykc/LRSGlYjjQApHjCCpEnZ7JBivHWW1bl2nyYDDwVDjSGR+TtMgossTr1zhEbefCff0
         9Dp+1xQTGtKjZo+J2BR4hMTqJ9IhI2IJ5sCv7rZvoNq2tYlbXnPsxOAzOyVdfCOg1Ccb
         fCpbqi5+s+nhybG0WGCK05RuE/mXzjo5Rk1PKE5sXdNSeC4bXdAx1q/wcARekHILTJBx
         fayf5ct0kJRszVOk0ftKeYv3MaNZzsuGUMW2+B9xAdMatjfu/OVjCMGxBfXy1kMb1Zp7
         IpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxYDh+e/3ZGvmZIrCU1sHRDGC02su6ScWCsiAgPvxiU=;
        b=eYMBKVmubYRImbhCLwlwrOsTnugxGvxAA3Pljy7KtY5wBItF2awab0/jpP+NV2wtee
         9ytJURVq9Jnz71KQusYwZC48RjGGQz01PLbjbKsmF1EjFemGxm7/4ijENMod70nGN8A1
         UTOjrfX3+mMjdC57ITsN2cMjEWgca/eBpRI5n96Dd60Gux/H40/Y+BUX2ETQ+cIXfM8k
         JrmpMFvzau/s2gWTZgWqzNOI45flXyyb8TGA/5j76Vdg84aDVM75F7n/e7f5QEGN5HTF
         lwC54GgyIAPT+5mczfJyTj8AVyGO7zYzrYwVA9BjolX/V0U6NympbDI8/uUCMwzi2BS7
         9SNw==
X-Gm-Message-State: AOAM533t63mhykBql9jbFYWxbFgEhdEtOMcbxFHxYHCDLta7nh6DecWz
	94Bg/no4vcEGBDsgJ8XrQrpnXVyJjpM=
X-Google-Smtp-Source: ABdhPJyA5I1JXkpb5cQbvRMLdikYdbFoDaOhWDE0AMcQp7iOVrTVbmIkZB/5+oNhB1MFfrQXelVbqw==
X-Received: by 2002:a65:408c:: with SMTP id t12mr11923062pgp.204.1599324966644;
        Sat, 05 Sep 2020 09:56:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:06 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/20] Patch review Sept 5
Date: Sat,  5 Sep 2020 09:55:43 -0700
Message-Id: <cover.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here is the next set of dunfell changes.
Please review and have feedback by Monday.


The following changes since commit 654ad8bea49f142d20b2b96c0dd44810a6be233a:

  jsoncpp: add PE do to revert to older PV (2020-07-18 07:24:39 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Adrian Bunk (1):
  gnome-settings-daemon: Remove duplicate outdated SRC_URI hashes

Alistair Francis (1):
  python3-obd: Add missing setuptools RDEPENDS

Andreas Müller (1):
  exiv2: upgrade 0.27.1 -> 0.27.3

Armin Kuster (3):
  vlc: fix loop initial declarations are only allowed in C99 mode
  babl-native: fix build issue
  gnome-settings-daemon: Backport 3.36 fix for building without wayland

Changqing Li (1):
  radvd: add /etc/radvd.conf

Julius Hemanth Pitti (1):
  netkit-telnetd: Fix buffer overflow in netoprintf

Kai Kang (2):
  lvm2: remove service template from SYSTEMD_SERVICE
  rdist: fix parallel build

Khem Raj (2):
  samba: Fix conflicts with nss.h from glibc
  flashrom: Fix build failure with glibc 2.32

Leon Anavi (1):
  python3-pandas: Upgrade 1.0.3 -> 1.0.5

Martin Jansa (1):
  lcov: fix lcov-native build

Mingli Yu (2):
  freeradius: fix the existed certificate error
  freeradius: fix the occasional verification failure

Ovidiu Panait (1):
  net-snmp: Fix CVE-2020-15861 and CVE-2020-15862

Ryan Rowe (1):
  python3-pint: add setuptools and packaging to RDEPENDS

Yi Zhao (1):
  samba: upgrade 4.10.15 -> 4.10.17

Yue Tao (1):
  lua: Security Advisory - lua - CVE-2020-15888

 meta-gnome/recipes-gimp/babl/babl_0.1.74.bb   |   2 +
 ...gins-wacom-Fix-build-without-WAYLAND.patch |  27 ++
 .../gnome-settings-daemon_3.34.2.bb           |   5 +-
 .../recipes-multimedia/vlc/vlc_3.0.9.2.bb     |   2 +-
 ...file-fix-the-existed-certificate-err.patch |  55 +++
 ...file-fix-the-occasional-verification.patch | 135 +++++++
 .../freeradius/freeradius_3.0.20.bb           |   2 +
 .../rdist-6.1.5-fix-parallel-build.patch      |  31 ++
 .../recipes-connectivity/rdist/rdist_6.1.5.bb |   1 +
 ....c-Avoid-nss-function-conflicts-with.patch |  96 +++++
 .../0001-util-Simplify-input-validation.patch |  59 +++
 ...n-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch |  79 ++++
 ...larger-buffer-if-getpwuid_r-returns-.patch |  50 +++
 .../{samba_4.10.15.bb => samba_4.10.17.bb}    |   8 +-
 .../recipes-daemons/radvd/files/radvd.conf    |  18 +
 .../recipes-daemons/radvd/radvd.inc           |   5 +-
 ....c-Fix-buffer-overflow-in-netoprintf.patch |  56 +++
 .../netkit-telnet/netkit-telnet_0.17.bb       |   1 +
 .../net-snmp/CVE-2020-15861-0001.patch        | 164 ++++++++
 .../net-snmp/CVE-2020-15861-0002.patch        |  44 +++
 .../net-snmp/CVE-2020-15861-0003.patch        |  40 ++
 .../net-snmp/CVE-2020-15861-0004.patch        |  33 ++
 .../net-snmp/CVE-2020-15861-0005.patch        | 349 ++++++++++++++++++
 .../net-snmp/net-snmp/CVE-2020-15862.patch    |  87 +++++
 .../net-snmp/net-snmp_5.8.bb                  |   6 +
 ...or-last-line-only-from-preprocessed-.patch |  57 +++
 meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  |   1 +
 .../lua/lua/CVE-2020-15888.patch              |  45 +++
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb     |   1 +
 ...-protection-only-if-compiler-arch-su.patch |  40 ++
 .../{exiv2_0.27.1.bb => exiv2_0.27.3.bb}      |   7 +-
 meta-oe/recipes-support/lcov/lcov_1.14.bb     |   7 +-
 meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb  |   8 +-
 .../recipes-devtools/python/python-pint.inc   |   5 +
 .../python/python3-obd_0.7.1.bb               |   2 +-
 ...andas_1.0.3.bb => python3-pandas_1.0.5.bb} |   4 +-
 36 files changed, 1516 insertions(+), 16 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-plugins-wacom-Fix-build-without-WAYLAND.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.15.bb => samba_4.10.17.bb} (96%)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/radvd.conf
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0001.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0002.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0003.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0004.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0005.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15862.patch
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
 rename meta-oe/recipes-support/exiv2/{exiv2_0.27.1.bb => exiv2_0.27.3.bb} (52%)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.0.3.bb => python3-pandas_1.0.5.bb} (81%)

-- 
2.17.1

