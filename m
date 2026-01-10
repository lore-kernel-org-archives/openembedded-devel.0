Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D018CD277E2
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 11:52:03 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7367.1768045917632774932
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 03:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout06.t-online.de (Postfix) with SMTP id 5169689C
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 12:51:55 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.238.199]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1veXVa-3tWzOj0; Sat, 10 Jan 2026 12:51:54 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] btop: update 1.4.5 -> 1.4.6
Date: Sat, 10 Jan 2026 12:51:48 +0100
Message-ID: <20260110115148.9069-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768045914-A37D7C6F-32E64C54/0/0 CLEAN NORMAL
X-TOI-MSGID: f98a18f6-fe55-49cd-b53b-b27946d0dbf5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 11:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123325

Add 'googletest-native' dependency to fix:
| CMake Warning at /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64=
-poky-linux/btop/1.4.6/recipe-sysroot-native/usr/share/cmake-4.2/Modules/=
FetchContent.cmake:2121 (message):
|   FETCHCONTENT_FULLY_DISCONNECTED is set to true, which requires the so=
urce
|   directory for dependency googletest to already be populated.  This
|   generally means it must not be set to true the first time CMake is ru=
n in a
|   build directory.  The following source directory should already be
|   populated, but it doesn't exist:
|
|     /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/b=
top/1.4.6/build/_deps/googletest-src
|
|   Policy CMP0170 controls enforcement of this requirement.
| Call Stack (most recent call first):
|   /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/bto=
p/1.4.6/recipe-sysroot-native/usr/share/cmake-4.2/Modules/FetchContent.cm=
ake:2394 (__FetchContent_Populate)
|   tests/CMakeLists.txt:10 (FetchContent_MakeAvailable)
|
|
| -- Configuring done (1.0s)
| CMake Error at tests/CMakeLists.txt:14 (target_link_libraries):
|   Target "libbtop_test" links to:
|
|     GTest::gtest_main
|
|   but the target was not found.  Possible reasons include:
|
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.

v1.4.6

References | Description | Author(s)
--- | --- | ---
1272 | Skip 'H' and 'HX' suffix in AMD cpu name trimming | @ramdomPTM
1268 | feature: add process renice functionality | @goddamnparticle
1285 | Revert "Use /sys/dev/block/MAJOR:MINOR instead of /sys/block/NAME =
for disk I/O" #1270 | @deckstose
1277 | feat: Introduce cpu frequency display modes | @emiliopedrollo
1282 | Fix CPU frequency detection for LoongArch CPUs | @Twopic2
1275 | fix arrow keys that send 'O' instead of '[' | @vandabbin
1251 | OpenBSD: battery: add support for watthour and watts sensors | @sh=
trophic
1208 | Add Gotham theme | @jrebs
1291 | Fix macOS deadlocks and race conditions in collector threads #1292=
 | @kuzmeech
1296 | fix: btop crash on arm cpu | @emiliopedrollo @zenofile
984 | Added ability to set which gpu vendors to enable | @thedustinmiller
1274 | added tree toggle of expand/collapse for children of process | @ir=
abrine
1300 | Use right key codes to match f1 and f2 keys | @vandabbin
1305 | Handle missing SMC gracefully on macOS | @achille
1309 | Fix redraw in proc list when changing sort order | @vandabbin
1304 | Fix load average and GPU watts leaking past box border | @vandabbi=
n
1220 | feat: respect effective cpus from cgroup | @deckstose
1218 | feat: display container engine | @deckstose
1315 | feat: raise cpp standard to c++23 | @deckstose
d0cbaf7 | Add configuration toggle for terminal synchronization | @aristo=
cratos
1306 | Implement feat Process list pausing | @vandabbin
1322 | flip name, command, and user sorting | @vandabbin
1334 | fix tty theme for pause banner | @vandabbin
1325 | test: add test harness with ctest | @deckstose
1339 | fix: skip first argument of argv | @AlvaroParker
1357 | feat: add --themes-dir flag | @adeci
1359 | fix: don't over-/underflow when parsing --update argument | @yingh=
ao-w
1362 | fix segfault on musl systems | @v1cont
1363 | Pass only static duration strings to Config::set in Config::apply_=
preset | @yinghao-w
1366 | fix: cpu per-thread totals not reaching 100% | @Tom94
1367 | Fix: Align boxes when Cpu bottom and Gpu on | @yinghao-w
1372 | Minor fixes and improvements for NetBSD | @fraggerfox
1377 | Fixed GPU rendering | @TheSovietPancakes
1379 | Fix: Always collect GPU data when cpu_graph_lower =3D "Auto" | @yi=
nghao-w
1393 | Fix: humanized units shortening | @yinghao-w
1401 | Feat: add mouse dragging of scrollbar | @yinghao-w
1399 | feat: add cli option to dump default config | @deckstose
e969f43 | Added "save_config_on_exit" option to configuration | @aristocr=
atos

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/btop/{btop_1.4.5.bb =3D> btop_1.4.6.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/btop/{btop_1.4.5.bb =3D> btop_1.4.6.bb} (=
90%)

diff --git a/meta-oe/recipes-support/btop/btop_1.4.5.bb b/meta-oe/recipes=
-support/btop/btop_1.4.6.bb
similarity index 90%
rename from meta-oe/recipes-support/btop/btop_1.4.5.bb
rename to meta-oe/recipes-support/btop/btop_1.4.6.bb
index 0455da384b..eb2b69dba9 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.5.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.6.bb
@@ -6,8 +6,9 @@ SECTION =3D "console/utils"
=20
 SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bra=
nch=3Dmain;tag=3Dv${PV} \
            "
-SRCREV =3D "a1099d075fa914452366b28c67ff171e21a1f02e"
+SRCREV =3D "975e3951daa7d3114112d2cd4ee689cf5ee38745"
=20
+DEPENDS =3D "googletest-native"
=20
 inherit cmake
=20
--=20
2.52.0


