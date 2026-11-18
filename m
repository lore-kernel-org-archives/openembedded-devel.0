Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5703.1794974921840542647
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CA4ltNCl;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382f4710a17so290535eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974921; x=1795579721; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AlUtSxNwhwDUhs1kdRWL40N74Pe9N5+G2gOaV2wv6yo=;
        b=CA4ltNClc0szx3+/9eAvnZYjKGnmWuBlC74bhjmvvtmLm2tjxpz9g12KGw2zF6m9M4
         RKEtPnAcUVkiXmE7ojhAY8ZcX/yX/6tdJfpqxis7FgWJIocgRqpYSdl+QHLqZ/TvLfYC
         YLTeodlEXDtijXWgBL+zVAJXmzKsTZENb/FgaT3uMb+Sn0nxHkijwnpdi7UAg3pbnBaA
         hQL3W1VqSQmWf8XXWUaJ43hnRiiXWJXWSZY2k3dPlXLK2hVWJntBLLvbAFwmtvOLUIGg
         n0FGWztyD7G+pZ3+Ux1zBnLtbKvIvrFu0OOIUrY979jX0ineiJDzYAlLdj06j8m7EQGS
         82og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974921; x=1795579721;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AlUtSxNwhwDUhs1kdRWL40N74Pe9N5+G2gOaV2wv6yo=;
        b=dVqkr9E4yKMB0G7YDU2Smv0TID0+Rs0UVnI9G+NT5g90EMRfCoBYYXWG6BAvurNYCy
         W23TaIJs1wQkJViAT9gTNdNYixMJOQsuAQNdT4sZzTq+d7q/2pBX4ZOljWyshSMNIaoK
         bduyrnlx/GpmJigRV3mYeCxWrXgvbnB3X3iGymtOg+/2T5pgYoo2fkStsXbYGeufsDEZ
         YozlvWxqF3lj+iZHwEgrNLwgxVVCNClZn7wkTrntf0NHw/d0Ijy6kxjbgrWSLnCrUKaD
         DO7eHk1QvsE41dvLPlAD/BXKdTTiOdotHXp+nAdSCdI4EmApEw3EesQuWtg6JdYpLDhf
         494w==
X-Gm-Message-State: APuU4Z/7ZMyUEVEIdxiBd9t65nqhElZl6uX8JTFkFVQ4azq2/fhJ0hs+
	7ZhFVRN3XOYbw3Q859CmF7ScnDZG1PzOPvUPIirxfoLLmkEWBQwr67fULSwzquGr
X-Gm-Gg: AZFdTZeumdB1F7jiFZycc9PjY8i4Y744rbpH9nwaGuSep8huBqyvE5jyMavZqs8MJ93
	HqnrnaFcjl+KKrGBsFi7NVFy7M4kCcOQEeLeJviva8HMc2aFkE8Aeg3fVxQ1Pm3aIrymGKxdPwj
	sTICcpGUk0szhMTUfdaviUFjHZQKf7gDxnoJAsPJxk/Y7a4icUdpmZIR30JfJW2MxDAqs7UiTsN
	I4siEdYsT+0jpTfyDJ4g3kp/nibW8zaMGChJnaq1Q70uva8HMO/agq7N+HRwJ/TnQA062zNlxXN
	l71J9RHDvjPFAOboAJLtiNwmk1sq55DiokTlF7OpbHq4uFkTGSbsa9JNz+i19oNVpKl0hFuPK3z
	sXhbutmEJVQ+m2OhdUAZKjBAi8wxKPSFkf99ZPjSmtOCKvkHPeccINmTMqZzHFrRUipxXBVe0is
	SsF5zG6QcDXPhZG4xw+G3o0LIzdPWXWtLpmFJ9UHUOKQhjzC/xmajJlIW1HD6FksgapG7rd+Qvp
	aYVx57ZbRMiRZWxNaZsecW9rbRr0roYsLRA5L7MZPsuv9LYxO45eXvNkS6Z3QPkfLRM3SdvaI6a
	PcBpoNBX0/bgRjLoGywUfPUlVkUQ3rqemFckuCBm+AOPb18NUEc0RQ3zVmHKLBUYRWuKLjWNQFQ
	OmMNL4/XZiAnlJWzs3dbRKEb6ShjzCYB8eBGNbsYbryR0HSY2F3nEPxqDoAANme+inquHcjoTEm
	8JAsy1GkkjPoMAchrG6sXWC4X5s4Sh3zQ+HYLmEl7bqtBH8KAJpO5cwwZ1zLJEDsXZ6pHOf4dmZ
	+CW6z2hnDPtRb8xpQEBe+LIVE7oRH73SwfgL2+2rAwkqAO3Ahg12iQhNAuXsVIx2qdmYD0xNOJ9
	3C4s
X-Received: by 2002:a05:7300:cf96:b0:381:17f:2735 with SMTP id 5a478bee46e88-38281523ee1mr1634162eec.27.1794974920567;
        Tue, 17 Nov 2026 20:08:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm2695251eec.19.2026.11.17.20.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:08:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][PATCH 3/8] *.patch: Fix malformed Upstream-Status tags
Date: Tue, 17 Nov 2026 20:08:25 -0800
Message-ID: <20261118040831.2284885-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
References: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132618
Content-Type: text/plain; charset="utf-8"

Bring Upstream-Status lines in line with the recipe style guide:

- Put Inappropriate reasons in brackets instead of parentheses or
  free text after the tag.
- Use the 'lastcommit:'/'lastrelease:' form for Inactive-Upstream.
- Mark patches that link an upstream pull request or mailing list post
  as Submitted rather than Pending.
- Mark patches described as OE or cross-build specific as Inappropriate
  rather than Pending.
- Drop meaningless qualifiers ('Pending [Unknown]', 'Submitted [Pending]')
  and duplicate Upstream-Status lines in the audiofile patches.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../files/0001-Use-DESTDIR-in-install-Makefile-rule.patch       | 2 +-
 .../files/0002-interface-remove-C-reserved-keyword.patch        | 2 +-
 .../files/0003-Fix-missing-shared-object-LDFLAGS.patch          | 2 +-
 .../recipes-connectivity/ez-ipupdate/files/wformat.patch        | 2 +-
 .../recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch       | 2 +-
 .../tftp-hpa/files/add-error-check-for-disk-filled-up.patch     | 2 +-
 .../libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch  | 2 +-
 .../recipes-support/netperf/files/netserver_permissions.patch   | 2 +-
 .../recipes-support/tunctl/tunctl/makefile-add-ldflags.patch    | 2 +-
 .../Makefile-Fix-sysinfo-generation-in-parallel-build.patch     | 2 +-
 .../nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch         | 2 +-
 .../flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch     | 2 +-
 .../mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch | 2 +-
 .../0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch | 2 +-
 .../uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch              | 2 +-
 .../wxwidgets/0004-don-not-append-system-name-to-lib-name.patch | 2 +-
 .../audiofile/files/0001-fix-negative-shift-constants.patch     | 1 -
 .../audiofile/files/0002-fix-build-on-gcc6.patch                | 1 -
 ...1-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch | 2 +-
 meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch      | 2 +-
 meta-oe/recipes-test/cunit/files/fixup-install-docdir.patch     | 2 +-
 ...0001-Skip-march-guessing-for-external-cross-toolchains.patch | 2 +-
 .../0001-pyproject.toml-Include-subpackages.patch               | 2 +-
 .../0001-oletools-olevba.py-Fix-deprecation-warnings.patch      | 2 +-
 .../0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch | 2 +-
 ...1-make-direction-attribute-conforming-to-introspect.dt.patch | 2 +-
 .../python3-pydbus/0002-Support-asynchronous-calls-58.patch     | 2 +-
 ...3-Support-transformation-between-D-Bus-errors-and-exce.patch | 2 +-
 .../0001-Adjust-test-expectations-for-ptest.patch               | 2 +-
 .../0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch     | 2 +-
 ...01-test_log-wait-for-subscriptions-instead-of-sleeping.patch | 2 +-
 .../python/python3-uvicorn/0002-ptest-skip-test_headers.patch   | 2 +-
 .../python3-wxgtk4/add-back-option-build-base.patch             | 2 +-
 .../python3-wxgtk4/not-overwrite-cflags-cxxflags.patch          | 2 +-
 .../python3-wxgtk4/wxgtk-fixup-build-scripts.patch              | 2 +-
 .../0009-support-apxs.in-force-destdir-to-be-empty-string.patch | 2 +-
 36 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-Use-DESTDIR-in-install-Makefile-rule.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-Use-DESTDIR-in-install-Makefile-rule.patch
index 7b0830034c..ba47e85003 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-Use-DESTDIR-in-install-Makefile-rule.patch
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-Use-DESTDIR-in-install-Makefile-rule.patch
@@ -7,7 +7,7 @@ This change allows to perform installations in a sysroot folder, which is requir
 the recipes inheriting yocto autotool class, and is an autotool standard:
 make install DESTDIR=~/mysysroot

-Upstream-Status: Inappropriate (the upstream project is dead)
+Upstream-Status: Inappropriate [the upstream project is dead]

 Signed-off-by: Etienne Cordonnier <etienne.cordonnier@streamunlimited.com>
 ---
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-interface-remove-C-reserved-keyword.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-interface-remove-C-reserved-keyword.patch
index a5600a1c3a..6b9ef599a1 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-interface-remove-C-reserved-keyword.patch
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-interface-remove-C-reserved-keyword.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] interface: remove C++ reserved keyword
 Because "private" was used in cdda_interface.h, this header file could not be
 compiled in C++.

-Upstream-Status: Inappropriate (the upstream project is dead)
+Upstream-Status: Inappropriate [the upstream project is dead]

 Signed-off-by: Etienne Cordonnier <etienne.cordonnier@streamunlimited.com>
 ---
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0003-Fix-missing-shared-object-LDFLAGS.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0003-Fix-missing-shared-object-LDFLAGS.patch
index 5298a3dcf2..512aaa000d 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/files/0003-Fix-missing-shared-object-LDFLAGS.patch
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0003-Fix-missing-shared-object-LDFLAGS.patch
@@ -3,7 +3,7 @@ From: Carlos Rafael Giani <dv@pseudoterminal.org>
 Date: Sat, 10 Sep 2016 21:15:18 +0200
 Subject: [PATCH] Fix missing shared object LDFLAGS

-Upstream-Status: Inappropriate (the upstream project is dead)
+Upstream-Status: Inappropriate [the upstream project is dead]

 Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
 ---
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
index 7463e3c535..4fb8218495 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
@@ -3,7 +3,7 @@ This patch is used by Gentoo to mitigate CVE-2004-0980:
 https://bugs.gentoo.org/69658

 CVE: CVE-2004-0980
-Upstream-Status: Inactive-Upstream [last commit: 2002]
+Upstream-Status: Inactive-Upstream [lastcommit: 2002]

 Index: ez-ipupdate-3.0.11b7/ez-ipupdate.c
 ===================================================================
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
index 68f972fc51..5686a9b50c 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
@@ -6,7 +6,7 @@ Taken from Fedora
 https://src.fedoraproject.org/rpms/openhpi/c/be77f5484b0206f8946a85b29424ea10bf863063

 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending [Unknown]
+Upstream-Status: Pending

 diff -up openhpi-3.6.1/ssl/Makefile.am.than openhpi-3.6.1/ssl/Makefile.am
 --- openhpi-3.6.1/ssl/Makefile.am.than	2017-02-21 12:21:12.114814698 -0500
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
index 0f324a3265..004a3e2492 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
@@ -7,7 +7,7 @@ Add error check when the write-buffer is finally flushed to the file,
 the caller can detect if the disk filled up (or had an i/o error) and
 return a NOSAPCE nak to the other side.

-Upstream-Status: Pending [Sent to http://www.syslinux.org/archives/2013-August/020765.html]
+Upstream-Status: Submitted [http://www.syslinux.org/archives/2013-August/020765.html]

 Signed-off-by: Ming Liu <ming.liu@windriver.com>
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
index abeca6579c..601c871844 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] configure.ac: Add serial-tests
 ptest needs buildtest-TESTS and runtest-TESTS targets.
 serial-tests is required to generate those targets.

-Upstream-Status: Inappropriate (default automake behavior incompatible with ptest)
+Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]

 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
diff --git a/meta-networking/recipes-support/netperf/files/netserver_permissions.patch b/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
index 55316363e0..525254c470 100644
--- a/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
+++ b/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] netserver: don't change permissions on /dev/null
 the (now default) suppress_debug=1 changes permissions on /dev/null
 to 0644. Don't do this.

-Upstream-Status: Pending [https://github.com/HewlettPackard/netperf/pull/27/commits/78c9ae7d9a6735575bc72dd28a19b2bc3a251981]
+Upstream-Status: Submitted [https://github.com/HewlettPackard/netperf/pull/27]
 Signed-off-by: Ashish Sharma <asharma@mvista.com>

 ---
diff --git a/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch b/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
index 45fbb68b70..816e3bfbb6 100644
--- a/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
+++ b/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
@@ -1,6 +1,6 @@
 Add LDFLAGS variable to Makefile, make sure the extra linker flags can be passed.

-Upstream-Status: Inactive-Upstream [last change: 2013-03-22]
+Upstream-Status: Inactive-Upstream [lastcommit: 2013-03-22]

 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch
index b5f60b1c87..86b9ab16bc 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch
@@ -41,7 +41,7 @@ Should fix random build failures like this one:
 NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Failed

 [1] https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00004.html
-Upstream-Status: Inactive-Upstream [lastrelease 2003, no vcs]
+Upstream-Status: Inactive-Upstream [lastrelease: 2003, no vcs]
 Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
 ---
  Makefile | 6 ++----
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch
index c6a37c3e56..5221298ae0 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch
@@ -3,7 +3,7 @@ From: Daniel Klauer <daniel.klauer@gin.de>
 Date: Fri, 6 Feb 2026 17:14:53 +0100
 Subject: [PATCH] sysinfo.sh: Fix typo in rm command

-Upstream-Status: Inactive-Upstream [lastrelease 2003, no vcs]
+Upstream-Status: Inactive-Upstream [lastrelease: 2003, no vcs]
 Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
 ---
  sysinfo.sh | 2 +-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
index c79384dd5b..302bd30f55 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] meson: Add options pciutils, ftdi, usb
 The options have been dropped in favor of an array option called programmer.
 Since this doesn't integrate well into yocto add back the old options.

-Upstream-Status: Inappropriate Just to fix yocto build system
+Upstream-Status: Inappropriate [OE build system specific]

 Change-Id: Ib697b9f7cc7fc553cfdeb75ae9d49a367badd286
 Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
diff --git a/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch b/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
index 088124391c..9a57be5716 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
+++ b/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
@@ -11,7 +11,7 @@ the protobuf 4.22x is using c++14 as default, this caused the mosh cannot compil
 | | ^~~~~~~~~~~~~~~~~~~~~~
 ....

-Upstream-Status: Pending [https://github.com/mobile-shell/mosh/pull/1266]
+Upstream-Status: Submitted [https://github.com/mobile-shell/mosh/pull/1266]

 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch
index ef0c12722f..7b87c50d56 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch
@@ -14,7 +14,7 @@ CMake Error at CMakeLists.txt:21 (cmake_policy):
   behavior or use an older version of CMake that still supports the old
   behavior.  Run cmake --help-policy CMP0042 for more information.

-Upstream-Status: Inactive-Upstream [2022-01-12]
+Upstream-Status: Inactive-Upstream [lastcommit: 2022-01-12]
 Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
 ---
  CMakeLists.txt | 5 -----
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch
index e9c80fa3af..2ac927c313 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch
@@ -8,7 +8,7 @@ When building with OpenSSL 1.1 and newer, use the new built-in
  structs having been made opaque.
 Bug-Debian: https://bugs.debian.org/828589

-Upstream-Status: Pending [Unknown]
+Upstream-Status: Pending

 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
index 5ef944edfa..4a1b3b0402 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
@@ -7,7 +7,7 @@ It appends system name to library names for cross compile. For example, the
 library name is libwx_baseu-3.1-Linux.so rather than libwx_baseu-3.1.so. It is
 not appropriate for oe.

-Upstream-Status: Pending [oe specific]
+Upstream-Status: Inappropriate [oe specific]

 Signed-off-by: Kai Kang <kai.kang@windriver.com>

diff --git a/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch b/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
index b4a2398c5a..72bef3b705 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
@@ -14,7 +14,6 @@ Upstream-Status: Pending

 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
-Upstream-Status: Pending

  libaudiofile/modules/SimpleModule.h | 2 +-
  test/FloatToInt.cpp                 | 2 +-
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch b/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
index 1b05ad1d40..44536a3c8c 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
@@ -14,7 +14,6 @@ Upstream-Status: Pending

 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
-Upstream-Status: Pending

  test/NeXT.cpp | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
diff --git a/meta-oe/recipes-support/cpulimit/cpulimit/0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch b/meta-oe/recipes-support/cpulimit/cpulimit/0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
index 50d0342ec7..a7d896a6ec 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit/0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
+++ b/meta-oe/recipes-support/cpulimit/cpulimit/0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Remove sys/sysctl.h and add missing libgen.h include
 - sys/sysctl.h has been deprecated and should be removed
 - Adds missing libgen.h include when calling basename()

-Upstream-Status: Inactive-Upstream [2015]
+Upstream-Status: Inactive-Upstream [lastcommit: 2015]
 Signed-off-by: Portia <stephensportia@gmail.com>
 ---
  src/cpulimit.c      | 1 -
diff --git a/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch b/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
index fd8faaf1fe..9bca3121b8 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
@@ -9,7 +9,7 @@ dependencies. Deal with them in the package config setting in the recipe.
 Remove $(DESTDIR) from install destination that it is not suitable for oe. And
 no generate python cache files too.

-Upstream-Status: Pending [oe specific]
+Upstream-Status: Inappropriate [oe specific]

 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
diff --git a/meta-oe/recipes-test/cunit/files/fixup-install-docdir.patch b/meta-oe/recipes-test/cunit/files/fixup-install-docdir.patch
index c328227318..10ea326cf6 100644
--- a/meta-oe/recipes-test/cunit/files/fixup-install-docdir.patch
+++ b/meta-oe/recipes-test/cunit/files/fixup-install-docdir.patch
@@ -6,7 +6,7 @@ The default configuration macros for CUnit install the documentation and
 header files in locations not consistent with the OE filesystem layout.
 So here we specify new locations which are consistent with OE filesystems.

-Upstream-Status: Inappropriate - configuration for OE build environment
+Upstream-Status: Inappropriate [configuration for OE build environment]

 Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
 Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
diff --git a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
index a5e1b0928b..a3e02f7b6c 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
+++ b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
@@ -8,7 +8,7 @@ toolchain (Yocto/OpenEmbedded, Buildroot, ...). These already
 inject the correct target. Avoid issues such as an unknown value
 'x86-64-v2' for '-march' when cross compiling for ARM machine.

-Upstream-Status: Pending [https://github.com/crossbario/autobahn-python/pull/1934]
+Upstream-Status: Submitted [https://github.com/crossbario/autobahn-python/pull/1934]

 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-dominate/0001-pyproject.toml-Include-subpackages.patch b/meta-python/recipes-devtools/python/python3-dominate/0001-pyproject.toml-Include-subpackages.patch
index 0c364a9dd5..39b2e5263a 100644
--- a/meta-python/recipes-devtools/python/python3-dominate/0001-pyproject.toml-Include-subpackages.patch
+++ b/meta-python/recipes-devtools/python/python3-dominate/0001-pyproject.toml-Include-subpackages.patch
@@ -10,7 +10,7 @@ setup with ptest-runner python3-dominate:

 E   ModuleNotFoundError: No module named 'dominate.community'

-Upstream-Status: Pending [https://github.com/Knio/dominate/pull/246]
+Upstream-Status: Submitted [https://github.com/Knio/dominate/pull/246]

 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-oletools/0001-oletools-olevba.py-Fix-deprecation-warnings.patch b/meta-python/recipes-devtools/python/python3-oletools/0001-oletools-olevba.py-Fix-deprecation-warnings.patch
index fe97a4b9a2..a5d74828ac 100644
--- a/meta-python/recipes-devtools/python/python3-oletools/0001-oletools-olevba.py-Fix-deprecation-warnings.patch
+++ b/meta-python/recipes-devtools/python/python3-oletools/0001-oletools-olevba.py-Fix-deprecation-warnings.patch
@@ -16,7 +16,7 @@ PyparsingDeprecationWarning: 'initChars' argument is deprecated, use 'init_chars
 PyparsingDeprecationWarning: 'infixNotation' deprecated - use 'infix_notation'
 PyparsingDeprecationWarning: 'scanString' deprecated - use 'scan_string'

-Upstream-Status: Pending [https://github.com/decalage2/oletools/pull/888]
+Upstream-Status: Submitted [https://github.com/decalage2/oletools/pull/888]

 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-oletools/0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch b/meta-python/recipes-devtools/python/python3-oletools/0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch
index dd8fe026fd..4c5e6bf841 100644
--- a/meta-python/recipes-devtools/python/python3-oletools/0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch
+++ b/meta-python/recipes-devtools/python/python3-oletools/0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch
@@ -7,7 +7,7 @@ Fall back to the installed oletools location for the directory with
 source code if the sibling "oletools" dir doesn't exist (e.g.
 packaged/ptest installs).

-Upstream-Status: Pending [https://github.com/decalage2/oletools/pull/889]
+Upstream-Status: Submitted [https://github.com/decalage2/oletools/pull/889]

 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch b/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch
index 1bd17986e6..94eb0c747a 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0001-make-direction-attribute-conforming-to-introspect.dt.patch
@@ -14,7 +14,7 @@ in the DTD(*1), direction attribute is defined as following:

 Adapted from Fedora [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]

-Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit 05/6/2018)
+Upstream-Status: Inactive-Upstream [lastrelease: 2016-12-18, lastcommit: 2018-05-06]

 Signed-off-by: Derek Straka <derek@asterius.io>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchronous-calls-58.patch b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchronous-calls-58.patch
index b3c57edade..d6eeff70c2 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchronous-calls-58.patch
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-asynchronous-calls-58.patch
@@ -18,7 +18,7 @@ proxy.Method(a, b, callback=func, callback_args=(x, y))

 Adapted from Fedora [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]

-Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit 05/6/2018)
+Upstream-Status: Inactive-Upstream [lastrelease: 2016-12-18, lastcommit: 2018-05-06]

 Signed-off-by: Derek Straka <derek@asterius.io>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch
index a1b8a6c38c..0fec816211 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0003-Support-transformation-between-D-Bus-errors-and-exce.patch
@@ -9,7 +9,7 @@ method and recreated after return from the remote call.

 Adapted from Fedora [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]

-Upstream-Status: Inactive-Upstream (Last release 12/18/2016; Last commit 05/6/2018)
+Upstream-Status: Inactive-Upstream [lastrelease: 2016-12-18, lastcommit: 2018-05-06]

 Signed-off-by: Derek Straka <derek@asterius.io>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
index b98b776136..7099719054 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Adjust test expectations for ptest
 Because of the way we install ptests, some first party imports
 became third party. Reflect that in the test case.

-Upstream-Status: Inappropriate (embedded specific)
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
 ---
  tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
diff --git a/meta-python/recipes-devtools/python/python3-pyppmd/0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch b/meta-python/recipes-devtools/python/python3-pyppmd/0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch
index a31ac621d6..236aef82d3 100644
--- a/meta-python/recipes-devtools/python/python3-pyppmd/0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch
+++ b/meta-python/recipes-devtools/python/python3-pyppmd/0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch
@@ -17,7 +17,7 @@ testdata2.ppmd in small chunks.

 This work was sponsored by GOVCERT.LU.

-Upstream-Status: Pending [https://github.com/miurahr/pyppmd/pull/131/]
+Upstream-Status: Submitted [https://github.com/miurahr/pyppmd/pull/131]

 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch b/meta-python/recipes-devtools/python/python3-pyzmq/0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch
index 6ee1a1b91f..76b8063075 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq/0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch
+++ b/meta-python/recipes-devtools/python/python3-pyzmq/0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch
@@ -19,7 +19,7 @@ Use XPUB sockets where the test creates the socket and wait for the
 subscription messages before publishing, and remove leftover handlers
 in tearDown.

-Upstream-Status: Submitted [Pending]
+Upstream-Status: Pending

 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn/0002-ptest-skip-test_headers.patch b/meta-python/recipes-devtools/python/python3-uvicorn/0002-ptest-skip-test_headers.patch
index 931f682106..fbff010977 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn/0002-ptest-skip-test_headers.patch
+++ b/meta-python/recipes-devtools/python/python3-uvicorn/0002-ptest-skip-test_headers.patch
@@ -35,7 +35,7 @@ target. Skipped to match this recipe's existing precedent in
 0001-ptest-disable-failing-tests.patch, which also skips fully
 parametrized tests based on only some combinations failing.

-Upstream-Status: Inappropriate (embedded specific)
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  tests/protocols/test_websocket.py |   19 +++++++++++++++++++
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
index 2622df24e2..672b5c7864 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
@@ -3,7 +3,7 @@ From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 30 Mar 2022 17:39:33 +0800
 Subject: [PATCH] Add back default user options for cross build.

-Upstream-Status: Pending [oe specific]
+Upstream-Status: Inappropriate [oe specific]

 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
index 3dc4cb1e79..e6001b6edb 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
@@ -8,7 +8,7 @@ Subject: [PATCH] Not overwrite CFLAGS and CXXFLAGS. It also avoid buildpaths
   /usr/lib64/python3.11/site-packages/wx/.debug/_xml.cpython-311-aarch64-linux-gnu.so
   in package python3-wxgtk4-dbg contains reference to TMPDIR [buildpaths]

-Upstream-Status: Pending [oe specific]
+Upstream-Status: Inappropriate [oe specific]

 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
index 09497133b0..ed919c5ea6 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
@@ -9,7 +9,7 @@ Subject: [PATCH] Fix issues in build scripts:
 * do not override self.install_lib with self.install_platlib which causes
   package issue when multilib is enabled.

-Upstream-Status: Pending [cross build specific]
+Upstream-Status: Inappropriate [cross build specific]

 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch b/meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
index d1f9bb0f43..8c2cd99377 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
@@ -16,7 +16,7 @@ line 213.
 Ensure that it is always the empty string so that apache-websocket
 is able to find the required config files.

-Upstream-Status: Inappropriate (embedded-specific)
+Upstream-Status: Inappropriate [embedded specific]

 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
