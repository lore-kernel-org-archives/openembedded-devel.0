Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5704.1794974923591039500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FKyDYqyp;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-381f65e4e4bso996999eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974923; x=1795579723; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1d7nUBjoS/V4HTzLUKxaTUOHE2UtiLghnPZuxxYfIzM=;
        b=FKyDYqypcNHOepaDJ8DyTMqY/imHkOMHPkVM+MvBr1YtOgYYh+LhwbJ7oBhZJ5/nMn
         uRHzdTTgvOnY4FyP2bwT0GbN7hsAM734HmnGitk2U570rI2zolbSkcnqXAq+pPQYGabQ
         cuK/B0mP/UV4g/mHLt3RXueqRVz9MjzdZy29KSSPITNg9Y2aNL4LSQl5914gdMoZXvZ3
         NKcpZrXUHsmgzvVtT8sbj1kE+4ofDDbJsTqvIMcKLiyZo7Lz+qRbYX/Oz7Gj0mpAZwRt
         /qeydWJbkmBDhUJWKKCQ7EnUPcGLjA8Ki+x2X6L4D8BNNuOsVKCZi/z/dp0eQtqeKbmN
         HGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974923; x=1795579723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1d7nUBjoS/V4HTzLUKxaTUOHE2UtiLghnPZuxxYfIzM=;
        b=rPcWVfG4UUcvTPkgWhWAWiFDxdQxKzNeIadAryQBx//DVa1Qiccenu7NwFK+5H02iN
         HTZ3UOWZ1EVnyFMe8jpIzmZPh2+hZQtuLwVui7qfrYS1wRMidoOzTCttB50aykPR7PpL
         67vHx1DEGZeYhtI5IusQwPUBc4T6i+i8q0z7Co1vEyj/gtIJaZyHXHD962wEwKFZ81gG
         RI4t+OonA4eCz+1eKG/lAfVlTgQlwZy13ANQzxKifnWwQtFbHFoYoiqOwc7WWp7bsv+0
         4wm3IGZnEvZWPdwu4wCWtbyv2qKl9n08+oU68xWnduOfBqO3o7h5+IuHTOshC9T6d3yj
         fFHg==
X-Gm-Message-State: APuU4Z9sUVqykfX8CpR6qgkfISS1hkkmiOPf5QIgUFt3+IfzVZZZtCe2
	Fd4O49vXt5t4YnKHI0FA+dNyfP0yAG2Uxx6l/045M2PMIW+72IwueNdDWi8HEHUX
X-Gm-Gg: AZFdTZe0VzVKX/dHLV9ZDHzhlYY/tGKP5cYVPPMPjWryAEV0fH/lW+Z+bgnrGVOJ5aN
	dNJeWSkGNJ2eYZ0J2NAY9UTCYbIcr61jjcRxCMudKfEpvr1LKzuepmceI6h6CDoXSOlq+AK+V1w
	n4PvyRMMok5OZE23wuBByPDocq+z1fLIy0LUv2239GLiXBRYcFkwO4ZfOBHxmqdcheI0Tb25Im/
	+7DO46BwVJ00LzAxlp7PWUF8pEAuNIWfUQsmOjIG8kPMtbubH/1n9XpspvKgWCRe9SNLlSbmwIC
	uVcwocZqaK99Srn5A+l3lTje1dXCaQf7CVYniq3uKws/UPDvKnXYXe2wTphnzkIebSfzDbZJVDk
	ati5aQ8XDV0o7KI8zk4djJpP51a3DQcOUcUz966yGB7Ly34Tp4bGL8F24cRyfJe15edTX8N0Kyj
	RGxfT81kOyUkWXvi5xtHLlbKDYfNVqcMDOmtThzr9iCHEYZTyWNGVbQVEioR3OfsMEKgJN0D1HN
	YIimvUs0rxLNByS4BqrSHfMUihafutABh1o6TYiUl2A6kvT9bpKVGYkHNCkyVWm+S4lbNJhh91N
	m8IBvIxv8LECsCt3mhO8SLaoUXtWCdPbPP7Ozn6eFJRwE6AXypLawESi0O4GngyIZwTQdBH1EPa
	xi9jcQCYtrU5c5hzNFTxQpgl0HsiI0cOx9JpPW3J2NduPmtI/4NHa1o8yvWHDcxLXIRqStOwYW2
	KfGXJyhKR6iF8lahKh3wy4ZwdQubyCTLHxUIw7JVwnJt2vffErk0swq6pewFcRLAmpjI19Rzmo7
	sPHuwR9gjmXKeCsMqvfQMeJV63S93v6HNk7R2cfEKuQA96xbnHK8pC2agapjfvS/LCtkQns3n9q
	FNWw
X-Received: by 2002:a05:7301:430c:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3827fe781bdmr1418787eec.11.1794974922224;
        Tue, 17 Nov 2026 20:08:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm2695251eec.19.2026.11.17.20.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:08:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][PATCH 4/8] *.patch: Add missing Upstream-Status references and reasons
Date: Tue, 17 Nov 2026 20:08:26 -0800
Message-ID: <20261118040831.2284885-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
References: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132619
Content-Type: text/plain; charset="utf-8"

Fill in bare Upstream-Status tags with verified references, per the
recipe style guide:

- Backport: add the upstream commit URL; each was matched against the
  patch diff (libsdl CVE fixes, gnome-bluetooth3, gnome-screenshot,
  NetworkManager-fortisslvpn, bridge-utils, canutils, tipcutils,
  libsigrokdecode, smartmontools, sblim-sfcc, phoronix-test-suite,
  kconfig-frontends, eject).
- Submitted: add the PR or mailing list URL (poke, unclutter-xfixes,
  collectd, python3-pynetlinux, python3-twofish), or switch to Backport
  where the fix has since been merged upstream (fuse, mtd-utils, rdate,
  openhpi). Where no submission could be found, use Pending.
- Inappropriate: add the reason, or use Pending where the change is a
  generic fix upstream could take (terminus-font, python3-pyfanotify).
- opencv 0008 and eject-timeout are distro patches (Debian, Fedora), not
  upstream backports; mark them Inappropriate.
- mdns: Apple does not accept external contributions; use Denied instead
  of a malformed Inactive-Upstream.
- openjpeg CVE-2023-39327 has an open upstream PR; mark it Submitted.
- ssmtp upstream has been revived, so it is not Inactive-Upstream.
- xsp: use the lastrelease: form.
- Join references that were wrapped onto the line after the tag, and
  move the rdate tag above the '---' separator.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-filesystems/recipes-support/fuse/files/aarch64.patch      | 2 +-
 .../0001-build-Fix-build-for-newer-versions-of-meson.patch     | 2 +-
 .../0001-meson-remove-extraneous-positional-argument.patch     | 2 +-
 .../clutter/clutter-1.0/install-examples.patch                 | 2 +-
 ...004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch | 2 +-
 .../networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch  | 2 +-
 .../networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch  | 2 +-
 .../rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch  | 3 +--
 .../files/openhpi-fix-function-saHpiSensorThresholds.patch     | 3 +--
 .../openhpi/files/openhpi-invalide-session.patch               | 2 +-
 .../mdns/mdns/0001-Fix-build-with-gcc-15.patch                 | 2 +-
 .../mdns/mdns/0001-dns-sd-Include-missing-headers.patch        | 2 +-
 ...-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch | 2 +-
 .../mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch     | 2 +-
 .../mdns/0004-make-Separate-TLS-targets-from-libraries.patch   | 2 +-
 .../mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch   | 2 +-
 ...-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch | 2 +-
 .../bridge-utils/bridge-utils/0004-cleanup-includes.patch      | 3 +--
 ...0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch | 2 +-
 .../0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch | 2 +-
 .../0003-tests-Makefile-install-static-4G-edge-testcases.patch | 2 +-
 ...004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch | 2 +-
 .../phoronix-test-suite/files/CVE-2022-40704.patch             | 2 +-
 ...-Makefile-ensure-frontends-exits-before-writing-into-.patch | 2 +-
 .../recipes-devtools/poke/poke/0001-fix-format-security.patch  | 2 +-
 ...-unattended-upgrade-Remove-distro_info-usage-to-check.patch | 2 +-
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automake.patch   | 2 +-
 ...-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch | 3 +--
 ...1-Fix-incompatible-pointer-type-error-with-gcc-option.patch | 3 +--
 meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch | 2 +-
 ...001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch | 2 +-
 .../0001-canutils-candump-Add-error-frame-s-handling.patch     | 2 +-
 ...-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch | 2 +-
 .../configure.in-Fix-string-argument-syntax.patch              | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch  | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch  | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch  | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch  | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch  | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch  | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch  | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch  | 2 +-
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch  | 2 +-
 .../libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch           | 2 +-
 .../recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch    | 2 +-
 .../terminus-font/use-no-name-option-for-gzip.patch            | 2 +-
 .../unclutter-xfixes/0001-build-use-autotools.patch            | 2 +-
 ...-fix-incompatible-pointer-types-build-error-in-gcc-15.patch | 2 +-
 meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch   | 2 +-
 meta-oe/recipes-support/eject/eject/eject-timeout.patch        | 2 +-
 .../freerdp/0002-Do-not-install-tools-a-CMake-targets.patch    | 2 +-
 .../lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch       | 2 +-
 .../opencv/0008-Do-not-embed-build-directory-in-binaries.patch | 2 +-
 .../telepathy/telepathy-python3-0.15.19/parallel_make.patch    | 2 +-
 .../0001-Avoid-do_configure-requires-check-error.patch         | 2 +-
 .../python/python3-ninja/no-scikit-build.patch                 | 2 +-
 .../0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch  | 2 +-
 .../0001-setup.py-switch-to-setuptools.patch                   | 3 +--
 .../python3-twofish/0002-setup.py-switch-to-setuptools.patch   | 3 +--
 .../recipes-webadmin/webmin/files/disable-version-check.patch  | 2 +-
 60 files changed, 60 insertions(+), 67 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/files/aarch64.patch b/meta-filesystems/recipes-support/fuse/files/aarch64.patch
index 050d1146a9..4c14a8f827 100644
--- a/meta-filesystems/recipes-support/fuse/files/aarch64.patch
+++ b/meta-filesystems/recipes-support/fuse/files/aarch64.patch
@@ -3,7 +3,7 @@ fuse: add aarch64 support
 u64/u32 is not defined in sys/types.h, include linux/types.h like
 the kernel version of fuse.h does. Patch sent to upstream mailing list.

-Upstream-Status: Submitted
+Upstream-Status: Backport [https://github.com/libfuse/libfuse/commit/914871b20a901e3e1e981c92bc42b1c93b7ab81b]
 Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3/0001-build-Fix-build-for-newer-versions-of-meson.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3/0001-build-Fix-build-for-newer-versions-of-meson.patch
index 16c87b6a63..073d939fce 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3/0001-build-Fix-build-for-newer-versions-of-meson.patch
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3/0001-build-Fix-build-for-newer-versions-of-meson.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] build: Fix build for newer versions of meson

 sendto/meson.build:24:5: ERROR: Function does not take positional arguments.

-Upstream-Status: Backport
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-bluetooth/-/commit/755fd758f866d3a3f7ca482942beee749f13a91e]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  sendto/meson.build | 1 -
diff --git a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot/0001-meson-remove-extraneous-positional-argument.patch b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot/0001-meson-remove-extraneous-positional-argument.patch
index c80fda63a3..bcac180564 100644
--- a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot/0001-meson-remove-extraneous-positional-argument.patch
+++ b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot/0001-meson-remove-extraneous-positional-argument.patch
@@ -8,7 +8,7 @@ Subject: [PATCH] meson: remove extraneous positional argument

 Closes #186

-Upstream-Status: Backport
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-screenshot/-/commit/b60dad3c2536c17bd201f74ad8e40eb74385ed9f]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  data/meson.build | 2 --
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0/install-examples.patch b/meta-gnome/recipes-graphics/clutter/clutter-1.0/install-examples.patch
index ce9ab3a248..ef033f6f2e 100644
--- a/meta-gnome/recipes-graphics/clutter/clutter-1.0/install-examples.patch
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0/install-examples.patch
@@ -1,7 +1,7 @@
 Install the examples to $libdir/clutter/.

 Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [OE specific: install examples for ${PN}-examples]

 Index: clutter-1.26.2/examples/Makefile.am
 ===================================================================
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
index 2844a5020c..31de84c800 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
@@ -11,7 +11,7 @@ Add guard around features.h to fix missing include (here first error):
            ^~~~~~~~~~~~
  compilation terminated

-Upstream-Status: Submitted
+Upstream-Status: Backport [https://git.infraroot.at/mtd-utils.git/commit/?id=73b8c2e23412c9dc306ac251c6bf9ab6b8aaffeb]

 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
index 2e84a334f0..bbdc2ab6e8 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
@@ -7,7 +7,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit

-Upstream-Status: Backport
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn/-/commit/084ef529c5fb816927ca54866f66b340265aa9f6]
 Signed-off-by: Eivind Næss <eivnaes@yahoo.com>
 ---
  Makefile.am                                   |  5 +-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
index 6ac8f2b643..4a932374de 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit

-Upstream-Status: Backport
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn/-/commit/8773f772d39f8eee6edc1fd2e5437c754ed41e1e]
 Signed-off-by: Eivind Næss <eivnaes@yahoo.com>
 ---
  configure.ac | 6 +-----
diff --git a/meta-networking/recipes-connectivity/rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch b/meta-networking/recipes-connectivity/rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch
index 2f6518984d..fb0d8803f5 100644
--- a/meta-networking/recipes-connectivity/rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch
+++ b/meta-networking/recipes-connectivity/rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch
@@ -8,10 +8,9 @@ Fixes
 rdate.c:85:41: error: format not a string literal and no format arguments [-Werror=format-security]
 |    syslog(is_error?LOG_WARNING:LOG_INFO, buf);

+Upstream-Status: Backport [https://github.com/njh/rdate/commit/37e3c1b36848fc73bc4dd87b51be7cc7e91f0702]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Submitted
-
  src/rdate.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
index b2771c0c92..01abbe1a9c 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
@@ -8,8 +8,7 @@ TH.IsSupported == SAHPI_TRUE. So we should pass &tmp but not
 SensorThresholds as the argument to OH_CALL_ABI. Otherwise the TH will
 be set even if TH.IsSupported == SAHPI_FALSE.

-Upstream-Status: Submitted
-[https://github.com/open-hpi/openhpi/pull/2744/commits/77a78bb1ada56e55c5ba6d7a5987c214705bf035]
+Upstream-Status: Backport [https://github.com/open-hpi/openhpi/commit/77a78bb1ada56e55c5ba6d7a5987c214705bf035]

 Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch
index d03c97e186..c401afd07c 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Submitted
+Upstream-Status: Pending

 Package saftest run a test case to pass invalid session id to function
 saHpiResourceIdGet that expect return SA_ERR_HPI_INVALID_SESSION. But the check
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
index c232685a15..2b6ccb65fb 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
@@ -11,7 +11,7 @@ In file included from ../mDNSCore/mDNS.c:76:
 ../mDNSShared/CommonServices.h:856:13: note: 'bool' is a keyword with '-std=c23' onwards
 ../mDNSShared/CommonServices.h:856:1: warning: useless type name in empty declaration

-Upstream-Status: Pending (An owner of this repository has limited the ability to open a pull request to users that are collaborators on this repository.)
+Upstream-Status: Denied [upstream does not accept external contributions]

 Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
 ---
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
index c9929db4ca..cc102eda59 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] dns-sd: Include missing headers

 Fixes build on Musl

-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Upstream-Status: Denied [upstream does not accept external contributions]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  mDNSPosix/nss_mdns.c | 3 +++
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch
index a561fd232f..08a6942c15 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch
@@ -3,7 +3,7 @@ From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Thu, 30 Apr 2026 08:21:19 +0100
 Subject: [PATCH] mDNSPosix: Rework mbedtls for compatibility with mbedtls4

-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Upstream-Status: Denied [upstream does not accept external contributions]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/mbedtls.c | 21 +++++----------------
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
index 5f91e91b1d..1db08dfaf9 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
@@ -3,7 +3,7 @@ From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:12 +0000
 Subject: [PATCH] make: Set libdns_sd.so soname correctly

-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Upstream-Status: Denied [upstream does not accept external contributions]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/Makefile | 2 +-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
index b6697f0ba6..d7e9251a2f 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] make: Separate TLS targets from libraries
 There are dependencies on TLSOBJS, which fails when `-lmbedtls` is
 listed as a dependency, so separate it out.

-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Upstream-Status: Denied [upstream does not accept external contributions]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/Makefile | 14 ++++++++------
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index b8929ea439..bbbca279b8 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -3,7 +3,7 @@ From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 22:49:49 +0000
 Subject: [PATCH] mDNSCore: Fix broken debug parameter

-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Upstream-Status: Denied [upstream does not accept external contributions]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSCore/mDNS.c | 2 +-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch b/meta-networking/recipes-protocols/mdns/mdns/0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch
index 7a47ddd789..947f269ee2 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch
@@ -3,7 +3,7 @@ From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Sat, 21 Mar 2026 20:12:39 +0000
 Subject: [PATCH] mDNSShared: Make Apple Wireless Direct Link depend on macOS

-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Upstream-Status: Denied [upstream does not accept external contributions]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSShared/uds_daemon.c | 4 ++++
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-cleanup-includes.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-cleanup-includes.patch
index eb5c53d9ed..9123f8d50e 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-cleanup-includes.patch
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-cleanup-includes.patch
@@ -7,8 +7,7 @@ Use IWYU to only include necessary headers.
 Should resolve build issues for distros that need limits.h
 to find PATH_MAX.

-Upstream-Status: Backport
-[https://git.kernel.org/pub/scm/network/bridge/bridge-utils.git/commit/?h=main&id=1763c5b7f8f72d651d62337029c3bdfb269491e4]
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/bridge/bridge-utils.git/commit/?id=1763c5b7f8f72d651d62337029c3bdfb269491e4]

 Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch b/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
index 4a1d97ef94..cde2ec4681 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
@@ -25,7 +25,7 @@ warning/error is gone. Only the handler() signature hunk from the
 original patch is still needed; the call-site hunk has been dropped
 since it no longer applies and is unnecessary.

-Upstream-Status: Inactive-Upstream [This package has been orphaned https://bugs.debian.org/925056]
+Upstream-Status: Pending
 Signed-off-by: mark.yang <mark.yang@lge.com>
 ---
  ssmtp.c | 2 +-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
index a889d018f8..cee6255e1d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit

-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [OE specific: uses DEBUG_PREFIX_MAP exported by the recipe]

 Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
 ---
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-tests-Makefile-install-static-4G-edge-testcases.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-tests-Makefile-install-static-4G-edge-testcases.patch
index 98cdf2f51c..eafa4c3fe5 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-tests-Makefile-install-static-4G-edge-testcases.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-tests-Makefile-install-static-4G-edge-testcases.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] tests/Makefile: install static 4G edge testcases

 TESTS_64 is empty, install will fail due to missing file operand

-Upstream-Status: Submitted
+Upstream-Status: Pending

 Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
index 6b010365a0..403f71c6ab 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] run_test.py: not use hard coded path ../obj/hugeadm
 Hard coded path makes the script impossible to run out of source tree.
 After 'make install', we can use hugeadm utility under DESTDIR.

-Upstream-Status: Submitted
+Upstream-Status: Pending

 Signed-off-by: Ting Liu <b28495@freescale.com>

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch b/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
index 8b6405b4ad..a7cda7a830 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] phoromatic: Explicitly check both $_GET abd $_POST in

 Fixes: https://github.com/phoronix-test-suite/phoronix-test-suite/issues/650#issuecomment-1193116678

-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/phoronix-test-suite/phoronix-test-suite/commit/d3880d9d3ba795138444da83f1153c3c3ac27640]
 CVE: CVE-2022-40704

 Reference to upstream patch:
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Makefile-ensure-frontends-exits-before-writing-into-.patch b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Makefile-ensure-frontends-exits-before-writing-into-.patch
index a5263c6f8d..5a8948cf24 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Makefile-ensure-frontends-exits-before-writing-into-.patch
+++ b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Makefile-ensure-frontends-exits-before-writing-into-.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Makefile: ensure frontends/ exits before writing into it
 As previously, if GCC dependencies are not being written and the build is out of
 tree then frontends/ won't exist so we need to create it.

-Upstream-Status: Backport
+Upstream-Status: Backport [https://gitlab.com/ymorin/kconfig-frontends/-/commit/780b0b8e48551ba49b011caeeb09101a09c14a61]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 (cherry picked from commit f7986375129d1ada7dc6abeeec5b9d00ef6f7149)
diff --git a/meta-oe/recipes-devtools/poke/poke/0001-fix-format-security.patch b/meta-oe/recipes-devtools/poke/poke/0001-fix-format-security.patch
index 6b2d290d9f..5f8109280d 100644
--- a/meta-oe/recipes-devtools/poke/poke/0001-fix-format-security.patch
+++ b/meta-oe/recipes-devtools/poke/poke/0001-fix-format-security.patch
@@ -3,7 +3,7 @@ From: Wang Mingyu <wangmy@fujitsu.com>
 Date: Thu, 20 Aug 2026 10:24:56 +0000
 Subject: [PATCH] fix format security

-Upstream-Status: Submitted
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/poke-devel/2026-08/msg00037.html]

 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
index 317d0dfe4a..1ad092c66a 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
+++ b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
@@ -15,7 +15,7 @@ remove it because needs support into python3-distro-info [1].

 Signed-off-by: Aníbal Limón <anibal@rzerosystems.com>

-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [OE specific: python3-distro-info is not available]
 ---
 diff --git a/unattended-upgrade b/unattended-upgrade
 index b72e59e..8ff0c1c 100755
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automake.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automake.patch
index f309cd4890..e4633c87de 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automake.patch
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automake.patch
@@ -1,6 +1,6 @@
 This doesn't use automake so don't turn it on, as autoreconf will refuse to work.

-Upstream-Status: Submitted
+Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>

 diff --git i/stable/configure.in w/stable/configure.in
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
index 7948788f97..9dae9d9bb5 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
@@ -13,8 +13,7 @@ will be removed." [-Werror,-W#warnings]
 [1]
 https://sourceware.org/git/?p=glibc.git;a=commit;h=744e829637162bb7d5029632aacf341c64b86990

-Upstream-Status: Submitted
-[https://github.com/collectd/collectd/pull/3234]
+Upstream-Status: Submitted [https://github.com/collectd/collectd/pull/3234]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/processes.c | 2 +-
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
index 5e8f4fa0d5..b068157254 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
@@ -32,8 +32,7 @@ Subject: Fix incompatible pointer type error with gcc option
 |    82 |     printf( "invokeMethod() rc=%d, msg=%s\n",
 |       |                                        ^~

-Upstream-Status: Backport
-[https://github.com/kkaempf/sblim-sfcc/commit/881fccbaf19e26cbef3da1bebe2b42b3a9de1147#diff-ad9eeee99837ead0f29c70cd5f3956178dc3d51bd79618affd53d72a31404d5f]
+Upstream-Status: Backport [https://github.com/kkaempf/sblim-sfcc/commit/55b4a9b7fbf05b4004d2efe034c996850ffc06fd https://github.com/kkaempf/sblim-sfcc/commit/881fccbaf19e26cbef3da1bebe2b42b3a9de1147]

 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch b/meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch
index f7115a1cb3..d0811c07f4 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch
@@ -3,7 +3,7 @@ From: =?utf8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
 Date: Tue, 4 Aug 2020 09:19:44 +0200
 Subject: [PATCH] configure.ac: Add support for Python 3.9.

-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/sigrokproject/libsigrokdecode/commit/9b0ad5177bd692f7556a4756bdbd2da81d9c34ce]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
index a6b03db72f..917cbb0306 100644
--- a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
+++ b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] smartmontools: Improve reproducibility
 Backport changes added to master smartmontools.
 https://github.com/smartmontools/smartmontools/commit/24838916b4c0e91f5c897d44fcdeedb22848f684

-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/smartmontools/smartmontools/commit/24838916b4c0e91f5c897d44fcdeedb22848f684]
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>

 ---
diff --git a/meta-oe/recipes-extended/socketcan/canutils/0001-canutils-candump-Add-error-frame-s-handling.patch b/meta-oe/recipes-extended/socketcan/canutils/0001-canutils-candump-Add-error-frame-s-handling.patch
index fcc38e0617..d8a8148a2b 100644
--- a/meta-oe/recipes-extended/socketcan/canutils/0001-canutils-candump-Add-error-frame-s-handling.patch
+++ b/meta-oe/recipes-extended/socketcan/canutils/0001-canutils-candump-Add-error-frame-s-handling.patch
@@ -18,7 +18,7 @@ http://git.pengutronix.de/?p=tools/canutils.git
 Signed-off-by: AnilKumar Ch <anilkumar@ti.com>
 Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
 ---
-Upstream-Status: Backport
+Upstream-Status: Backport [https://git.pengutronix.de/cgit/tools/canutils/commit/?id=bab595e38295dcafcfc17a011d3d51f2df1618e6]

  src/candump.c | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch
index 39f899cf1b..cc0ef42967 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch
@@ -16,7 +16,7 @@ sysctl_rmem_max) in kernel.

 Signed-off-by: He Zhe <zhe.he@windriver.com>

-Upstream-Status: Backport
+Upstream-Status: Backport [https://sourceforge.net/p/tipc/tipcutils/ci/4e4c8c7a1cca2125e2bf2a67cbab0bdbd78fdb86/]

 Signed-off-by: Li Zhou <li.zhou@windriver.com>
 ---
diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch b/meta-oe/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
index 0717ea6f88..5c7aa9523b 100644
--- a/meta-oe/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
+++ b/meta-oe/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
@@ -3,7 +3,7 @@ From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Sat, 26 Jul 2014 16:57:46 -0300
 Subject: [PATCH] configure.in: Fix string argument syntax

-Upstream-Status: Submitted
+Upstream-Status: Pending

 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch
index c41c2de0f3..d883d3d3a6 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch
@@ -40,7 +40,7 @@ https://bugzilla.libsdl.org/show_bug.cgi?id=4495
 Signed-off-by: Petr Písař <ppisar@redhat.com>

 CVE: CVE-2019-7572
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/1ead4913fc2314a0ce5de06f29a20a8b0b0a5557 https://github.com/libsdl-org/SDL-1.2/commit/f22cbe4a3a2cd87392eec69bdcf2b4bd68b4507b]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r faf9abbcfb5f -r a8afedbcaea0 src/audio/SDL_wave.c
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch
index 9fd53da29b..644a39dda6 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch
@@ -16,7 +16,7 @@ https://bugzilla.libsdl.org/show_bug.cgi?id=4496
 Signed-off-by: Petr Písař <ppisar@redhat.com>

 CVE: CVE-2019-7574
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/76871a1c52dc74b8ba2357b9d68c34d765ea9db3]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r 388987dff7bf -r a6e3d2f5183e src/audio/SDL_wave.c
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch
index a3e8416d0e..26f73f7cd5 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch
@@ -18,7 +18,7 @@ CVE-2019-7575
 Signed-off-by: Petr Písař <ppisar@redhat.com>

 CVE: CVE-2019-7575
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/c68e0003d2f2b4e50bb1c4412af40c32f0b6396e]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r fcbecae42795 -r a936f9bd3e38 src/audio/SDL_wave.c
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch
index d9a505217b..cd373a0c7d 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch
@@ -18,7 +18,7 @@ Signed-off-by: Petr Písař <ppisar@redhat.com>

 CVE: CVE-2019-7573
 CVE: CVE-2019-7576
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/9e69d60b0b724e44637b3e9101758fb385114b69]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r a8afedbcaea0 -r fcbecae42795 src/audio/SDL_wave.c
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
index 63680b8b7f..f46067056f 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
@@ -44,7 +44,7 @@ Reproducer: https://bugzilla.libsdl.org/show_bug.cgi?id=4492
 Signed-off-by: Petr Písař <ppisar@redhat.com>

 CVE: CVE-2019-7577
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/82e503c2e026a8eee64e199c2648c296d924a5ab https://github.com/libsdl-org/SDL-1.2/commit/68f914a78ef09a4d2db43e0c7c2848a6b7c03655]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 Refresh CVE-2019-7577.patch as it can't be applyed when using PATCHTOOL = "patch".
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch
index 7028890333..2903ac1515 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch
@@ -15,7 +15,7 @@ https://bugzilla.libsdl.org/show_bug.cgi?id=4494
 Signed-off-by: Petr Písař <ppisar@redhat.com>

 CVE: CVE-2019-7578
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/c4a9f0080f928f40e826c49b2e8c057ec7843c2f]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r e52413f52586 -r 388987dff7bf src/audio/SDL_wave.c
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch
index 78af1b061d..6a0e6c6a14 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch
@@ -25,7 +25,7 @@ https://bugzilla.libsdl.org/show_bug.cgi?id=4498
 Signed-off-by: Petr Písař <ppisar@redhat.com>

 CVE: CVE-2019-7635
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/32c57bf53b18dafb7298d6e9113632728e8fe1ba]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r a936f9bd3e38 -r f1f5878be5db src/video/SDL_bmp.c
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
index c95338e61a..aa1d47d82c 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
@@ -30,7 +30,7 @@ https://bugzilla.libsdl.org/show_bug.cgi?id=4497
 Signed-off-by: Petr Písař <ppisar@redhat.com>

 CVE: CVE-2019-7637
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/40d97bfe0e3dae1d6e5a91a46af1f15e8f967bc8]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r 4646533663ae -r 9b0e5c555c0f src/video/SDL_pixels.c
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch
index dab9aaeb2b..88d816de94 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch
@@ -19,7 +19,7 @@ SDL_LoadBMP_RW() function passes biBitCount as a color depth to SDL_CreateRGBSur

 CVE: CVE-2019-7638
 CVE: CVE-2019-7636
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/3c6f20586bb4ba074c73bb3e06d7123e57d4a226]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r 8586f153eede -r 19d8c3b9c251 src/video/SDL_bmp.c
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
index f98b927522..82abff4745 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
@@ -1,6 +1,6 @@
 libX11-1.5.99.901 has changed prototype of _XData32

-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/5d79977ec7a6b58afa6e4817035aaaba186f7e9f]
 <http://bugzilla.libsdl.org/show_bug.cgi?id=1769>

 Signed-off-by: Saul Wold <sgw@linux.intel.com>
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
index 05e504a18e..fde64081ef 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
@@ -10,7 +10,7 @@ https://build.opensuse.org/projects/openSUSE:Factory/packages/openjpeg2/files/op

 Upstream seems to unresponsive to this vulnerability.

-Upstream-Status: Inactive-Upstream [inactive, when it comes to CVEs]
+Upstream-Status: Submitted [https://github.com/uclouvain/openjpeg/pull/1616]

 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-option-for-gzip.patch b/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-option-for-gzip.patch
index 97213c07da..766c2ed677 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-option-for-gzip.patch
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-option-for-gzip.patch
@@ -9,7 +9,7 @@ Adding the -n option to gzip while compressing the archive does
 not save the original time stamp by default hence making
 reproducible build.

-Upstream-Status: Inappropriate
+Upstream-Status: Pending

 Signed-off-by: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
 Index: terminus-font-4.49.1/Makefile
diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
index 0c9fe62b1f..38538be563 100644
--- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
+++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
@@ -7,7 +7,7 @@ This removes the hand-crafted Makefile in favor of standardized autotools
 build configuration. This is done to allow for easy cross-compilation of
 this project.

-Upstream-Status: Submitted
+Upstream-Status: Submitted [https://github.com/Airblader/unclutter-xfixes/pull/51]

 Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 ---
diff --git a/meta-oe/recipes-multimedia/xsp/xsp/0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch b/meta-oe/recipes-multimedia/xsp/xsp/0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch
index ffb1089423..611644f377 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp/0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch
+++ b/meta-oe/recipes-multimedia/xsp/xsp/0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch
@@ -19,7 +19,7 @@ In file included from ../Xsp/Xsp.c:6:
       |         ^~~~~~~~~~~~~~~
       |         XCloseDisplay

-Upstream-Status: Inactive-Upstream [seems to be unmaintained]
+Upstream-Status: Inactive-Upstream [lastrelease: 2005-05-17]
 Signed-off-by: mark.yang <mark.yang@lge.com>
 ---
  Xsp.c | 2 +-
diff --git a/meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch b/meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch
index a16c4b1ceb..178aea489a 100644
--- a/meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch
+++ b/meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch
@@ -1,6 +1,6 @@
 Kept to help with spaces in the mount path

-Upstream-Status: Backport
+Upstream-Status: Backport [eject CVS eject.c rev 1.11, via https://src.fedoraproject.org/rpms/eject/blob/3c2c0d449ce805931e752d160518dd48309a1bdd/f/eject-2.1.5-spaces.patch]

 Linux mangles spaces in mount points by changing them to an octal string
 of '\040'.  So lets scan the mount point and fix it up by replacing all
diff --git a/meta-oe/recipes-support/eject/eject/eject-timeout.patch b/meta-oe/recipes-support/eject/eject/eject-timeout.patch
index 4511e17069..7c303efef0 100644
--- a/meta-oe/recipes-support/eject/eject/eject-timeout.patch
+++ b/meta-oe/recipes-support/eject/eject/eject-timeout.patch
@@ -1,6 +1,6 @@
 allow a longer timeout

-Upstream-Status: Backport
+Upstream-Status: Inappropriate [upstream eject is dead, superseded by util-linux eject; taken from Fedora]

 Signed-off-by: Morgan Little <morgan.little@windriver.com>

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0002-Do-not-install-tools-a-CMake-targets.patch b/meta-oe/recipes-support/freerdp/freerdp/0002-Do-not-install-tools-a-CMake-targets.patch
index 2e5e6a4240..f7603170dd 100644
--- a/meta-oe/recipes-support/freerdp/freerdp/0002-Do-not-install-tools-a-CMake-targets.patch
+++ b/meta-oe/recipes-support/freerdp/freerdp/0002-Do-not-install-tools-a-CMake-targets.patch
@@ -7,7 +7,7 @@ The cli tools are installed manually and thus are missing in the sysroot
 folder. Do not export their targets because they do not exist and make
 CMake fail when searching for the library.

-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [OE specific: CLI tools are not staged in the sysroot]
 Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
 ---
  winpr/tools/hash-cli/CMakeLists.txt     | 2 +-
diff --git a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
index c97cd7a86c..d7e10da6cb 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
@@ -3,7 +3,7 @@ From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 Date: Mon, 26 Nov 2018 14:53:09 +0800
 Subject: [PATCH] Avoid bashisms in init scripts

-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [OE specific: avoid runtime dependency on bash]

 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

diff --git a/meta-oe/recipes-support/opencv/opencv/0008-Do-not-embed-build-directory-in-binaries.patch b/meta-oe/recipes-support/opencv/opencv/0008-Do-not-embed-build-directory-in-binaries.patch
index 8fda857080..415a73adaa 100644
--- a/meta-oe/recipes-support/opencv/opencv/0008-Do-not-embed-build-directory-in-binaries.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0008-Do-not-embed-build-directory-in-binaries.patch
@@ -5,7 +5,7 @@ Subject: Do not embed build directory in binaries
 This makes the opencv core module build reproducibly.

 https://salsa.debian.org/science-team/opencv/-/raw/master/debian/patches/0008-Do-not-embed-build-directory-in-binaries.patch
-Upstream-Status: Backport
+Upstream-Status: Inappropriate [Debian reproducibility patch, drops build-tree data lookup; not upstream]
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
 ---
  modules/core/CMakeLists.txt                   | 10 ------
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/parallel_make.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/parallel_make.patch
index 248824606e..71220eaee6 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/parallel_make.patch
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/parallel_make.patch
@@ -5,7 +5,7 @@ src/_generated directory that tasks are based on.

 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>

-Upstream-Status: Submitted
+Upstream-Status: Pending
 (However it seems that this project is out of maintanence.)

 diff -ruN telepathy-python-0.15.19-orig/src/Makefile.am telepathy-python-0.15.19/src/Makefile.am
diff --git a/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch b/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
index 0fbbee8b43..2b5866eef6 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
+++ b/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
@@ -9,7 +9,7 @@ so fix it to avoid following error.
 | ERROR Missing dependencies:
 |       setuptools<80,>=77

-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [OE specific: relax setuptools upper bound]

 Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch b/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
index 4dfbb2675a..a80b95bd76 100644
--- a/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
+++ b/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
@@ -1,7 +1,7 @@
 We don't need to build ninja so there's no need to use scikit-build-core,
 as we just need the python module with its one ninja() function.

-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [OE specific: ninja binary comes from the ninja recipe]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>

diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch b/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
index 4c279bbcda..8117f6ec92 100644
--- a/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] ext: define FNM_EXTMATCH if not already defined

 On musl this constant is not defined. Define it locally if not present.

-Upstream-Status: Inappropriate
+Upstream-Status: Pending

 Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux/0001-setup.py-switch-to-setuptools.patch b/meta-python/recipes-devtools/python/python3-pynetlinux/0001-setup.py-switch-to-setuptools.patch
index 35bc4a6bd1..669998aad2 100644
--- a/meta-python/recipes-devtools/python/python3-pynetlinux/0001-setup.py-switch-to-setuptools.patch
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux/0001-setup.py-switch-to-setuptools.patch
@@ -9,8 +9,7 @@ removal in Python 3.12.
 Switch from 'distutils.core' to 'setuptools'. This also allows for the
 'wheel' binary archive format to be built with 'setup.py bdist_wheel'.

-Upstream-Status: Submitted
-[https://github.com/rlisagor/pynetlinux/pull/12]
+Upstream-Status: Submitted [https://github.com/rlisagor/pynetlinux/pull/12]

 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-twofish/0002-setup.py-switch-to-setuptools.patch b/meta-python/recipes-devtools/python/python3-twofish/0002-setup.py-switch-to-setuptools.patch
index 99e5c6c517..60dce34160 100644
--- a/meta-python/recipes-devtools/python/python3-twofish/0002-setup.py-switch-to-setuptools.patch
+++ b/meta-python/recipes-devtools/python/python3-twofish/0002-setup.py-switch-to-setuptools.patch
@@ -3,8 +3,7 @@ From: Tim Orling <tim.orling@konsulko.com>
 Date: Sun, 27 Feb 2022 11:02:36 -0800
 Subject: [PATCH] setup.py: switch to setuptools

-Upstream-Status: Submitted
-[https://github.com/keybase/python-twofish/pull/9]
+Upstream-Status: Submitted [https://github.com/keybase/python-twofish/pull/9]

 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 ---
diff --git a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
index 3315aa579b..3122786bdf 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
@@ -3,7 +3,7 @@ Disable OS version check in status screen
 The code is not able to accurately detect the correct distro/version at
 the moment.

-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [OE specific: webmin OS detection does not know OE distros]

 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

