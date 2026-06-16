Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D0ACD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 21:15:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156434.1781621992447089983
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 07:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ibQDD8de;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dpZDwOyu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxeDG3408502
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 14:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+Wm1fIZp3Pl/rteXdWirL06QxPgm6bd5uqb
	MmBbo2dU=; b=ibQDD8de+9CYzDXEB5Oi6gAPYYXAgb6EYyMQQI2rxjv1a5pthac
	P1meDCNK9Fwl3Jx4w4eV01swisQwzKBjsLEFoEt9xXNxA00Ey4gcPDBKNTDCLUv6
	fs2r8fQuhs0c0c5jV9Tc/CRKHMHoyslWA4OvdYpk7dhisrN0BJp77XdASDPR7H46
	XUZ8bTvAx93yJzwT2YqW37+fCpyfpjnIJOAKjYIR6Ffjsw/0CoE6awavb4Ym+wdl
	E0Fw+iqSxp9bTi7krypcWQOeF8RrkIEh3z6Qncn0IZki9euamG5npNS7u/zzgqlX
	Vd88fQIsurTsz4CG7xyCVTOp4KLAeA5RsEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253hy0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 14:55:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91565f8c589so799720385a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781621742; x=1782226542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Wm1fIZp3Pl/rteXdWirL06QxPgm6bd5uqbMmBbo2dU=;
        b=dpZDwOyujGuZxf7q8zGoaq75Z4KdAywOOs8BvdJ7AXpgH4d1R3oKFXcb9iQgmS20AI
         SZhC9wmyIpu2KuRjg6g/zO/o+sn4T4mk0JnRu+H1XQfs5k+HW3ucVr5A4TPVnsN3pyfZ
         s2gFd+s4vJdLiz+5nuzBEXI8zbivLKcIq4Mik8Cvdr47haKfJ+7JsA9X/mmxvOtIEQEC
         XrDffWpBxzmFahtzaZ6PQ8Ot8Hhm3dKL/a4IixTbrPFFw1iOhFEDtQIg/YfCKrOHbtMr
         N64hR+Fyy8MfF+77oMGf+FLqi+2iT0XiWMdTKPXf3RkL7YDIl5/OzddfT+amfOhhNef2
         x2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781621742; x=1782226542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wm1fIZp3Pl/rteXdWirL06QxPgm6bd5uqbMmBbo2dU=;
        b=bI3GuN6wINCWbVv0o4SO221QG5LZXOfH1M7XYaBOT5APUoE+Q5KX+GCOTyVmW/OYyN
         63oJaJg5uTqdTzcaY1lxumK+DWsML1tcSnYiMi9FIOQnHmA3n35mcMBNpOJdnB7T+9z7
         P1e66eiRRHr1WN7QF9SpyR55ER40aKgmscjUJP+29qBqsbKnle4dmvLhBblH31t6qxcS
         BTXxWgd39/fFs9cfoUnduZY5Bgrd2qzns/UWcmo/Z81idZ0pq5xAXmYDfe/pqh6uS+51
         BDzfp0SSViG4eVK+nURECe04uEyHdxj+pMBkyxWWdX+TzpADnOMJZtWOdkpTkBIKqWKq
         J0bg==
X-Forwarded-Encrypted: i=1; AFNElJ9f4RGspsfuTJ4uQkObQ9Qc/0ydlIFd3fvcOZmm5lOByu2ryCRZQLFHVovjo8RDAB9S0I0uY8W5fqGvdoslCTlA6Mw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQG56X9KOMm1RpmUGlwHr9WpSfJrAdXx904U78aicVAFILBZel
	4vu1c2UePy1cu7H1Zj6KHRu5wS+g5ZpP2twor14ksz7/058h/9r3PH0fiNTMVspGsjXwbQacpuX
	SI0+Ar9rMUBe5cgd2IqCG02zbRL7+nSFxUjhSWHt4iNSUyCFDIKeRuYLaU5D3d2lqZeZ97IeBr0
	+67PsLuGUj
X-Gm-Gg: Acq92OHaUhHxZTyOwQNQSJuEFQv1j67cTvo1/ds1NqakYdeEu4uSm+1COcWSJOFBxNS
	8MQxZY+RMifmRbmqvIyScLvaCwKquu6pkP0U9IXAnOKtW0PePakGyAAMXKnvj3U7v6M8SwsOC3+
	bL7Mk9xO/7dgwGF9U9rN1uRZSHWdLCs+rX6PXhsqrNbeQktldD1ZYbSOCWCin/3vMyuHjq+Vmvo
	2l6RrR6/t9WCQwcA3ZLjBlJLtZ3pSiA5Ok+vrkVCybOsSE2QnNjdl92JYXEjHn7PV0zBOVYSH7Z
	TKFGumFoa/4YoBh6OAXFsWw8aEw5N41SyFLZGMVrTwFM00fwkHJm4exaonobBO1SXwx8FWXR1LS
	vynNz6KjeTI3rNZLSUO/Xyt4lerBwKLXzQBtXPhf3tpvGDHWzSA==
X-Received: by 2002:a05:620a:25cd:b0:915:4c9b:4120 with SMTP id af79cd13be357-91c2f8a532fmr558350785a.37.1781621741841;
        Tue, 16 Jun 2026 07:55:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25cd:b0:915:4c9b:4120 with SMTP id af79cd13be357-91c2f8a532fmr558344385a.37.1781621741236;
        Tue, 16 Jun 2026 07:55:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:cbbd:82b7:e325:35a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c5266sm51794658f8f.29.2026.06.16.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:55:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libgpiod: update to v2.3
Date: Tue, 16 Jun 2026 16:55:35 +0200
Message-ID: <20260616145535.83608-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-GUID: j5NnVWlIFgk52Gxbx--ry_ntl6cV4T5N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE1MiBTYWx0ZWRfX7DWzVOvnZ+qv
 hAGzt6PvZzmsr0w2DY9/Qbvi8j2lZa8MV+dg3KqJ9jM1I9Yn7C2HN8a/64GLI2daIqNTKfuU2MB
 gau5ydYR9YhU+1sPGUy2ohwQgYtgkAg=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a3163ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=UXIAUNObAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wQmtsGU7Y2IGWka4dwgA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE1MiBTYWx0ZWRfX3Vv6L49F+na5
 9j/xPMISH6ZIRdhelEPU7MbbWlcty8G4KUvFw+yOEdntNOxbSZoahCY0CdkYP2NPUzaYBKwAmc9
 /Ao5b+wMbcn9cbMexTQ99OuXJ0CFUkkisIji9N+MI7h2xjhbjY1NubPiHy511KS+y9e+HRK+iqS
 ogDsJLGL07jQp7BGBflMp4YHEeqzjwYUsxoJE0wwMRawdhga38hUg2PXmnNFIIo1zCQ20fJq4Hj
 DJCjuzQz9cQ0xOd+pNGgAaP/YRTTiYM744omlsmrr6DajHYhBxMyhbqvH8AqUm4Ep6/DJNjuaWL
 m/jDw1gBN3y/937xU/B8jCitpc/84d7cauRhhF6Ctq4lEkZGUTyHndH/3AacTVn7o++eD+MWhIA
 63eu2cQcHo9eg7I9nn7mLBY2wDOPbVLU9LTNrr8s54m9TV4+gFn+7g6SLt+UUwq6Iv9sepU4yN/
 +jfFDD7y3qOG6CvoUag==
X-Proofpoint-ORIG-GUID: j5NnVWlIFgk52Gxbx--ry_ntl6cV4T5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160152
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 21:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127625

Starting with this release, libgpiod now uses meson so the updates to
the recipe are quite extensive. There's a new shared library:
libgpiotools, that exports symbols previously only accessible to
gpio-tools that allow users to build their own high-level programs while
reusing the code doing GPIO line & chip lookup. While at it: move
libgpiodbus into its own package as well.

Full changelog:

New features:
- replace autotools with meson & ninja as the build system
- provide libgpiotools: a new shared library exposing a public API for
  line name lookup and other high-level helpers previously only available
  internally to gpio-tools
- add initial-state option to gpiomon to display line states before
  waiting for events
- provide comprehensive sphinx-based documentation for all components:
  core C API, C++ bindings, Python bindings, GLib bindings, D-Bus API,
  gpio-tools, and libgpiotools
- extend libgpiosim with new routines allowing to use the new functionality
  provided in more recent versions of the gpio-sim module in the kernel

Improvements:
- make tests work with newer coreutils by removing cases checking tools'
  behavior on SIGINT which stopped working due to changes in behavior of the
  timeout tool
- decouple the libgpiod core C library API version from the global libgpiod
  project version as the former is now quite stable and no longer changes
  with every release
- extend libgpiosim self-tests

Bug fixes:
- allow modifying settings for existing offsets in a full line-config
- fix signed/unsigned type mismatch in gpiod_line_request_get_value()
- add explicit NUL-termination after strncpy() calls in core library
- fix consumer string in line_info stream operator in C++ bindings
- use get_mapped_value() for all enum mappings in line_info in C++ bindings
- move g_tree_remove() out of g_assert() in gpiodbus_id_free() to avoid
  resource exhaustion when assertions are disabled
- return 0 when zero events are requested in edge-event API
- fix gpionotify watching lines on the wrong chip
- reject trailing garbage in parse_period() in gpio-tools
- store interactive sleep period in a long long in gpioset to avoid overflow
- use gpiod_line_settings_free() to release settings in line-config
- fix buffer over-read bugs when translating uAPI structs to library types
- fix variable and argument types where necessary
- sanitize values returned by the kernel to avoid potential buffer overflows
- fix memory leaks in gpio-tools
- add missing return value checks in gpio-tools
- fix period parsing in gpio-tools
- use correct loop counter in error path in gpio-manager
- don't try to export the same chip object twice in gpio-manager on duplicate
  uevents
- use the "add"/"remove" uevents when watching for GPIO chips in the system as
  the "bind"/"unbind" pair is only emitted by linux for controllers which don't
  have a firmware node attached
- don't allow clearing hogs on active devices in tests
- don't install uneeded files
- fix a pkgconfig check in configure
- fix a return type check in test harness
- don't implicity unquote unnamed lines in gpioinfo
- remove useless variable in reconfigure example
- don't let struct line_config balloon out of control and trigger an OOM
- drop python3-config check from configure.ac
- fix potential PyDict_Next() crash in python bindings
- disable the GPIO simulator before releasing it in C++, rust and python
  bindings tests
- fix the way we wait for simulated chips to appear in D-Bus command-line
  client tests
- make read_edge_events lifetimes more explicit in rust bindings
- make waiting for info events more reliable in GLib bindings tests
- defer removal of bank entries when device is not disabled in libgpiosim
- add missing LineInfo import to __init__.py in python bindings

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 19 +-----
 .../libgpiod/libgpiod_1.6.5.bb                | 18 ++++-
 .../{libgpiod_2.2.4.bb => libgpiod_2.3.bb}    | 68 ++++++++++++-------
 3 files changed, 63 insertions(+), 42 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.4.bb => libgpiod_2.3.bb} (61%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index 63ffdc2466..7559a2c336 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -2,27 +2,19 @@ SUMMARY = "C library and tools for interacting with the linux GPIO character dev
 HOMEPAGE = "https://libgpiod.readthedocs.io/"
 RECIPE_MAINTAINER = "Bartosz Golaszewski <brgl@bgdev.pl>"
 
-inherit autotools pkgconfig ptest
+inherit pkgconfig ptest
 
 SRC_URI += " \
     https://www.kernel.org/pub/software/libs/libgpiod/libgpiod-${PV}.tar.xz \
     file://run-ptest \
 "
 
-PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
-
 # Enable cxx bindings by default.
 PACKAGECONFIG ?= " \
     cxx \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
 "
 
-# Always build tools - they don't have any additional
-# requirements over the library.
-EXTRA_OECONF = "--enable-tools"
-
-DEPENDS += "autoconf-archive-native"
-
 PACKAGES =+ "${PN}-tools libgpiodcxx"
 FILES:${PN}-tools += " \
     ${bindir}/gpiodetect \
@@ -44,13 +36,4 @@ do_install:append() {
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests/
-
-    # These are the core C library tests
-    install -m 0755 ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
-
-    # Tools are always built so let's always install them for ptest even if
-    # we're not selecting libgpiod-tools.
-    for tool in ${FILES:${PN}-tools}; do
-        install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
-    done
 }
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
index 583648a6a3..45af4f8bb0 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -9,9 +9,16 @@ SRC_URI[sha256sum] = "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619d
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-1.x:"
 
-inherit python3native
+inherit autotools python3native
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3targetconfig', '', d)}
 
+# Always build tools - they don't have any additional
+# requirements over the library.
+EXTRA_OECONF = "--enable-tools"
+
+DEPENDS += "autoconf-archive-native"
+
+PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
@@ -35,6 +42,15 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest:append() {
+    # These are the core C library tests
+    install -m 0755 ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
+
+    # Tools are always built so let's always install them for ptest even if
+    # we're not selecting libgpiod-tools.
+    for tool in ${FILES:${PN}-tools}; do
+        install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
+    done
+
     install -m 0755 ${S}/tools/gpio-tools-test ${D}${PTEST_PATH}/tests/
     install -m 0755 ${S}/tools/gpio-tools-test.bats ${D}${PTEST_PATH}/tests/
 
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.bb
similarity index 61%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.3.bb
index e6de4b0313..6ff2bf29d3 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.bb
@@ -1,6 +1,6 @@
 require libgpiod.inc
 
-inherit systemd update-rc.d useradd gobject-introspection
+inherit meson systemd update-rc.d useradd gobject-introspection
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 LIC_FILES_CHKSUM = " \
@@ -15,20 +15,36 @@ SRC_URI += " \
     file://gpio-manager.init \
 "
 
-SRC_URI[sha256sum] = "13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592"
+SRC_URI[sha256sum] = "cb71db463aec2604ac520c95bf04eff1839d86bdc9a2dfd67ef879fbb10426ea"
+
+# Always build tools - they don't have any additional
+# requirements over the library.
+EXTRA_OEMESON = "-Dtools=enabled"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
-    --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-glib --enable-gpioset-interactive --enable-dbus, \
-    --disable-tests, \
+    -Dtests=enabled -Dtools=enabled -Dbindings-cxx=enabled -Dbindings-glib=enabled -Dgpioset-interactive=enabled -Ddbus=enabled, \
+    -Dtests=disabled, \
     kmod util-linux glib-2.0 catch2 libedit glib-2.0-native libgudev, \
     bash ${VIRTUAL-RUNTIME_dbus} glib-2.0-utils libgpiod-manager-cfg shunit2 \
 "
-PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
-PACKAGECONFIG[glib] = "--enable-bindings-glib,--disable-bindings-glib,glib-2.0 glib-2.0-native"
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,glib-2.0 glib-2.0-native libgudev,${VIRTUAL-RUNTIME_dbus}"
-
-PACKAGES =+ "${PN}-gpiosim ${PN}-glib ${PN}-manager ${PN}-manager-cfg ${PN}-cli"
+PACKAGECONFIG[cxx] = "-Dbindings-cxx=enabled,-Dbindings-cxx=disabled"
+PACKAGECONFIG[gpioset-interactive] = "-D=gpioset-interactive=enabled,-Dgpioset-interactive=disabled,libedit"
+PACKAGECONFIG[glib] = "-Dbindings-glib=enabled,-Dbindings-glib=disabled,glib-2.0 glib-2.0-native"
+PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,glib-2.0 glib-2.0-native libgudev,${VIRTUAL-RUNTIME_dbus}"
+
+GIR_MESON_ENABLE_FLAG = "enabled"
+GIR_MESON_DISABLE_FLAG = "disabled"
+
+PACKAGES =+ " \
+    ${PN}-gpiosim \
+    ${PN}-glib \
+    ${PN}-manager \
+    ${PN}-manager-cfg \
+    ${PN}-cli \
+    libgpiotools \
+    libgpiodbus \
+"
 FILES:${PN}-tools += "${bindir}/gpionotify"
 FILES:${PN}-gpiosim += "${libdir}/libgpiosim.so.*"
 FILES:${PN}-gpiosim-dev += "${includedir}/gpiosim.h"
@@ -38,7 +54,6 @@ FILES:${PN}-glib += " \
 "
 FILES:${PN}-manager += " \
     ${bindir}/gpio-manager \
-    ${libdir}/libgpiodbus.so.* \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_system_unitdir}/gpio-manager.service', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/init.d/gpio-manager', '', d)} \
 "
@@ -48,9 +63,16 @@ FILES:${PN}-manager-cfg += " \
     ${nonarch_base_libdir}/udev/rules.d/90-gpio.rules \
 "
 FILES:${PN}-cli += "${bindir}/gpiocli"
+FILES:libgpiotools += "${libdir}/libgpiotools.so.*"
+FILES:libgpiodbus += "${libdir}/libgpiodbus.so.*"
 
-RDEPENDS:${PN}-manager += "${VIRTUAL-RUNTIME_dbus} ${PN}-manager-cfg"
-RDEPENDS:${PN}-cli += "${PN}-manager"
+RDEPENDS:${PN}-manager += " \
+    ${VIRTUAL-RUNTIME_dbus} \
+    ${PN}-manager-cfg \
+    libgpiodbus \
+"
+RDEPENDS:${PN}-cli += "${PN}-manager libgpiodbus"
+RDEPENDS:${PN}-tools += "libgpiotools"
 
 SYSTEMD_PACKAGES = "${PN}-manager"
 
@@ -60,12 +82,12 @@ python __anonymous() {
     pn = d.getVar("PN")
 
     if "systemd" in distro_features and "dbus" in packageconfig:
-        d.appendVar("EXTRA_OECONF", " --enable-systemd")
+        d.appendVar("EXTRA_OEMESON", " -Dsystemd=enabled")
         # We need to set it conditionally or else the systemd class will look
         # for the file that we don't install with systemd support disabled.
         d.setVar("SYSTEMD_SERVICE:{}-manager".format(pn), "gpio-manager.service")
     else:
-        d.appendVar("EXTRA_OECONF", " --disable-systemd")
+        d.appendVar("EXTRA_OECONF", " -Dsystemd=disabled")
 
     # Disable gobject introspection set by the bbclass if we don't want it.
     if not any(cfg in ["glib", "dbus", "ptest"] for cfg in packageconfig):
@@ -86,10 +108,6 @@ RDEPENDS:${PN}-ptest += " \
 RRECOMMENDS:${PN}-gpiosim += "kernel-module-gpio-sim kernel-module-configfs"
 INSANE_SKIP:${PN}-ptest += "buildpaths"
 
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/lib/.libs"
-}
-
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
@@ -98,13 +116,17 @@ do_install:append() {
 }
 
 do_install_ptest:append() {
-    install -m 0755 ${B}/bindings/cxx/tests/.libs/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/gpiod-test ${D}${PTEST_PATH}/tests/
+    for tool in ${FILES:${PN}-tools}; do
+        install ${B}/tools/$(basename $tool) ${D}${PTEST_PATH}/tests/
+    done
+    install -m 0755 ${B}/bindings/cxx/tests/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
     install -m 0755 ${S}/tools/gpio-tools-test.bash ${D}${PTEST_PATH}/tests/
     install -m 0644 ${S}/tests/scripts/gpiod-bash-test-helper.inc ${D}${PTEST_PATH}/tests/
     install -m 0644 ${S}/tests/gpiosim/gpiosim.h ${D}${includedir}/gpiosim.h
-    install -m 0755 ${B}/bindings/glib/tests/.libs/gpiod-glib-test ${D}${PTEST_PATH}/tests/
-    install -m 0755 ${B}/dbus/tests/.libs/gpiodbus-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/bindings/glib/tests/gpiod-glib-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/dbus/tests/gpiodbus-test ${D}${PTEST_PATH}/tests/
     install -m 0755 ${S}/dbus/client/gpiocli-test.bash ${D}${PTEST_PATH}/tests/
-    install -m 0755 ${B}/dbus/manager/.libs/gpio-manager ${D}${PTEST_PATH}/tests/
-    install -m 0755 ${B}/dbus/client/.libs/gpiocli ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/dbus/manager/gpio-manager ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/dbus/client/gpiocli ${D}${PTEST_PATH}/tests/
 }
-- 
2.47.3


