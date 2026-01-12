Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ECDCF45C2
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 18:23:55 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39731.1768242228116666158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 10:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vg6KIZkL;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-646b8d2431dso5714080d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768242227; x=1768847027; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7xkwjvz2Vki8PVhM5RT+Ao9tKvFoz26DetJ61HYq3Bs=;
        b=Vg6KIZkLEtrkNRsFCYNW4BK51CZ0H8MaO1wgwKhFY/kXlRAMZoDbyRgtEWQ6MhT/nh
         IGyhDBEBU1ny7TNqX3exBUKGSuLJP1QDks+5jnSbHiDSM0HCktdDjWdwz+ECOtoSrvNJ
         emQi3WGIKuJMoETjL4UMJN2K6/CLrAauPV9ilJQwTgTgtKaF7g+4xhMEM7W7aPyWcJ3J
         4CJda5f0QOrwoYs5VUIchkP6yvQKUcz/hNZS2mEj69RreVaVx0htgKzsSovyf7y59lrO
         uvpoJ5c/JtjDLapaahjxUT0uPQPziDfo/oZlySG/NgpvUBHv5hLeSTuTVuMRbMu1sTUD
         tHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242227; x=1768847027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xkwjvz2Vki8PVhM5RT+Ao9tKvFoz26DetJ61HYq3Bs=;
        b=BD1iNWwCQM4kcpr1PyCj9Y7rWRyv7Y9BV+hZ2M+MheLypMo5wdkUvmbAfn+C7cldmw
         GAiOCcMRySyn2kw4CLvzdFYZghLX9RzE2Liyh9IOlMxb5HKAa3iS3pJeBKiu7kVglQFt
         Ddp+NJHjs3eYUl3wgzThH7375gxFenP0yRUuH3lP9OSJ7Q0gi1QIThrtAPsQsSOgudr2
         cSFcR/ReND1sYC+ugAptv8/eB0lTMDf1UK+5Wdyz56XyYPcizhV+kVWcisfM9CMW4YeL
         y2cH588V1APk54s7Ug55r0f97LOAoV3Ly4EDMCOdKjUvb9inpxBk/mmuUDVNMJ8sISnh
         5OvA==
X-Gm-Message-State: AOJu0Yz3lprrysbrGANYa0SsQE63NRV1jZdGYWZcUBq1nufS+bzV0OCO
	xay5m+cmJ104iqFDQ2SNepgb2/zuVeGINgE3YZhX3Wfd7iV/w4+zRZe6UcRxOxzO3ZJYZPT2NOA
	K+GYMlTltjRE+xWcKWX9t9CaW3hDh3D4=
X-Gm-Gg: AY/fxX6TCFdzC/n3UVKUhVHO5KpTVyzXGQenX+v8TlhXOtHNIteK5RO0V43gAQ/mIFb
	iBkrUse/NXOb1Zv9QENDIqkk78XWEi7iEPYsojh5q5rrU0dBUmLbf/WCEtdvaC5hUcifvjwaWhP
	JiCUSnlGqidgVcO0t3KcpdFRRWN0EeqQlQ74bIgQ4iUfh22/vjtpcBWMyfIL+MVBScVJ6SUOG2+
	wzCMVGSA7mGthkB1KSi6lpBHteZHvGL9JaFssDAr7rZhuo+NYba3vtdI8jle5oPNHYZ4lStB9pc
	sxTogncf1yz1p5jthcCUg2RHe3twAr/jDd2tj1zxmG1KxVWHr7lJt6lNkP9hUJmXAgSefw8vG2S
	3hl5zntqRLIzRQ9kbPcMl8NrANlVVqP6sPvbmjdrebNxeLA==
X-Google-Smtp-Source: AGHT+IHx7PcQbUBoTbSsQ4cS1MFt1h6w3tNWkPbtg6CTS4losZaq52zZc3DmO4fRTIduONNZiGHfAgIpLzCuWoSvkPE=
X-Received: by 2002:a05:690e:1208:b0:63f:b952:dfef with SMTP id
 956f58d0204a3-647169b13dfmr15366732d50.0.1768242227124; Mon, 12 Jan 2026
 10:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20260110115148.9069-1-f_l_k@t-online.de>
In-Reply-To: <20260110115148.9069-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jan 2026 10:23:19 -0800
X-Gm-Features: AZwV_QjzKBfw6tbalLIQaR1D7YBWVJY-lTC80-a8h0iqKYS2GHsRlOy9rol1tgU
Message-ID: <CAMKF1soYoKRdX8bpQ5GK62DmXxyjEw7c3Acgob=xys6okTWOjg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] btop: update 1.4.5 -> 1.4.6
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d31e95064834f99b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 18:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123388

--000000000000d31e95064834f99b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

adding native gtest dep is causing build problems with clang/lld as it now
finds the native version instead of target version.

| riscv64-yoe-linux-ld.lld: error:
/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/recipe-=
sysroot-native/usr/lib/libgtest_main.a(gtest_main.cc.o)
is incompatible with elf64-littleriscv
| riscv64-yoe-linux-ld.lld: error:
/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/recipe-=
sysroot-native/usr/lib/libgtest.a(gtest-all.cc.o)
is incompatible with elf64-littleriscv
| riscv64-yoe-linux-clang++: error: linker command failed with exit code 1
(use -v to see invocation)
| ninja: build stopped: subcommand failed.
| WARNING:
/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/temp/ru=
n.do_compile.1934:154
exit 1 from 'eval ${DESTDIR:+DESTDIR=3D${DESTDIR} } cmake --build
'/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/build'
"$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
|       #1: cmake_runcmake_build,
/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/temp/ru=
n.do_compile.1934,
line 154
|       #2: cmake_do_compile,
/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/temp/ru=
n.do_compile.1934,
line 148
|       #3: do_compile,
/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/temp/ru=
n.do_compile.1934,
line 143
|       #4: main,
/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/temp/ru=
n.do_compile.1934,
line 167



On Sat, Jan 10, 2026 at 3:51=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Add 'googletest-native' dependency to fix:
> | CMake Warning at
> /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/btop/1.=
4.6/recipe-sysroot-native/usr/share/cmake-4.2/Modules/FetchContent.cmake:21=
21
> (message):
> |   FETCHCONTENT_FULLY_DISCONNECTED is set to true, which requires the
> source
> |   directory for dependency googletest to already be populated.  This
> |   generally means it must not be set to true the first time CMake is ru=
n
> in a
> |   build directory.  The following source directory should already be
> |   populated, but it doesn't exist:
> |
> |
>  /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/btop/1=
.4.6/build/_deps/googletest-src
> |
> |   Policy CMP0170 controls enforcement of this requirement.
> | Call Stack (most recent call first):
> |
>  /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/btop/1=
.4.6/recipe-sysroot-native/usr/share/cmake-4.2/Modules/FetchContent.cmake:2=
394
> (__FetchContent_Populate)
> |   tests/CMakeLists.txt:10 (FetchContent_MakeAvailable)
> |
> |
> | -- Configuring done (1.0s)
> | CMake Error at tests/CMakeLists.txt:14 (target_link_libraries):
> |   Target "libbtop_test" links to:
> |
> |     GTest::gtest_main
> |
> |   but the target was not found.  Possible reasons include:
> |
> |     * There is a typo in the target name.
> |     * A find_package call is missing for an IMPORTED target.
> |     * An ALIAS target is missing.
>
> v1.4.6
>
> References | Description | Author(s)
> --- | --- | ---
> 1272 | Skip 'H' and 'HX' suffix in AMD cpu name trimming | @ramdomPTM
> 1268 | feature: add process renice functionality | @goddamnparticle
> 1285 | Revert "Use /sys/dev/block/MAJOR:MINOR instead of /sys/block/NAME
> for disk I/O" #1270 | @deckstose
> 1277 | feat: Introduce cpu frequency display modes | @emiliopedrollo
> 1282 | Fix CPU frequency detection for LoongArch CPUs | @Twopic2
> 1275 | fix arrow keys that send 'O' instead of '[' | @vandabbin
> 1251 | OpenBSD: battery: add support for watthour and watts sensors |
> @shtrophic
> 1208 | Add Gotham theme | @jrebs
> 1291 | Fix macOS deadlocks and race conditions in collector threads #1292
> | @kuzmeech
> 1296 | fix: btop crash on arm cpu | @emiliopedrollo @zenofile
> 984 | Added ability to set which gpu vendors to enable | @thedustinmiller
> 1274 | added tree toggle of expand/collapse for children of process |
> @irabrine
> 1300 | Use right key codes to match f1 and f2 keys | @vandabbin
> 1305 | Handle missing SMC gracefully on macOS | @achille
> 1309 | Fix redraw in proc list when changing sort order | @vandabbin
> 1304 | Fix load average and GPU watts leaking past box border | @vandabbi=
n
> 1220 | feat: respect effective cpus from cgroup | @deckstose
> 1218 | feat: display container engine | @deckstose
> 1315 | feat: raise cpp standard to c++23 | @deckstose
> d0cbaf7 | Add configuration toggle for terminal synchronization |
> @aristocratos
> 1306 | Implement feat Process list pausing | @vandabbin
> 1322 | flip name, command, and user sorting | @vandabbin
> 1334 | fix tty theme for pause banner | @vandabbin
> 1325 | test: add test harness with ctest | @deckstose
> 1339 | fix: skip first argument of argv | @AlvaroParker
> 1357 | feat: add --themes-dir flag | @adeci
> 1359 | fix: don't over-/underflow when parsing --update argument |
> @yinghao-w
> 1362 | fix segfault on musl systems | @v1cont
> 1363 | Pass only static duration strings to Config::set in
> Config::apply_preset | @yinghao-w
> 1366 | fix: cpu per-thread totals not reaching 100% | @Tom94
> 1367 | Fix: Align boxes when Cpu bottom and Gpu on | @yinghao-w
> 1372 | Minor fixes and improvements for NetBSD | @fraggerfox
> 1377 | Fixed GPU rendering | @TheSovietPancakes
> 1379 | Fix: Always collect GPU data when cpu_graph_lower =3D "Auto" |
> @yinghao-w
> 1393 | Fix: humanized units shortening | @yinghao-w
> 1401 | Feat: add mouse dragging of scrollbar | @yinghao-w
> 1399 | feat: add cli option to dump default config | @deckstose
> e969f43 | Added "save_config_on_exit" option to configuration |
> @aristocratos
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-support/btop/{btop_1.4.5.bb =3D> btop_1.4.6.bb} | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/btop/{btop_1.4.5.bb =3D> btop_1.4.6.bb}
> (90%)
>
> diff --git a/meta-oe/recipes-support/btop/btop_1.4.5.bb
> b/meta-oe/recipes-support/btop/btop_1.4.6.bb
> similarity index 90%
> rename from meta-oe/recipes-support/btop/btop_1.4.5.bb
> rename to meta-oe/recipes-support/btop/btop_1.4.6.bb
> index 0455da384b..eb2b69dba9 100644
> --- a/meta-oe/recipes-support/btop/btop_1.4.5.bb
> +++ b/meta-oe/recipes-support/btop/btop_1.4.6.bb
> @@ -6,8 +6,9 @@ SECTION =3D "console/utils"
>
>  SRC_URI =3D "git://
> github.com/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${=
PV}
> <http://github.com/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain;t=
ag=3Dv$%7BPV%7D>
> \
>             "
> -SRCREV =3D "a1099d075fa914452366b28c67ff171e21a1f02e"
> +SRCREV =3D "975e3951daa7d3114112d2cd4ee689cf5ee38745"
>
> +DEPENDS =3D "googletest-native"
>
>  inherit cmake
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123325):
> https://lists.openembedded.org/g/openembedded-devel/message/123325
> Mute This Topic: https://lists.openembedded.org/mt/117189895/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d31e95064834f99b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">adding native gtest dep is causing build problems with cla=
ng/lld as it now finds the native version instead of target version.<div><b=
r></div><div>| riscv64-yoe-linux-ld.lld: error: /mnt/b/yoe/master/build/tmp=
/work/riscv64imafdc-yoe-linux/btop/1.4.6/recipe-sysroot-native/usr/lib/libg=
test_main.a(gtest_main.cc.o) is incompatible with elf64-littleriscv<br>| ri=
scv64-yoe-linux-ld.lld: error: /mnt/b/yoe/master/build/tmp/work/riscv64imaf=
dc-yoe-linux/btop/1.4.6/recipe-sysroot-native/usr/lib/libgtest.a(gtest-all.=
cc.o) is incompatible with elf64-littleriscv<br>| riscv64-yoe-linux-clang++=
: error: linker command failed with exit code 1 (use -v to see invocation)<=
br>| ninja: build stopped: subcommand failed.<br>| WARNING: /mnt/b/yoe/mast=
er/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/temp/run.do_compile.19=
34:154 exit 1 from &#39;eval ${DESTDIR:+DESTDIR=3D${DESTDIR} } cmake --buil=
d &#39;/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/=
build&#39; &quot;$@&quot; -- ${EXTRA_OECMAKE_BUILD}&#39;<br>| WARNING: Back=
trace (BB generated script):<br>| =C2=A0 =C2=A0 =C2=A0 #1: cmake_runcmake_b=
uild, /mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/t=
emp/run.do_compile.1934, line 154<br>| =C2=A0 =C2=A0 =C2=A0 #2: cmake_do_co=
mpile, /mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/=
temp/run.do_compile.1934, line 148<br>| =C2=A0 =C2=A0 =C2=A0 #3: do_compile=
, /mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/temp/=
run.do_compile.1934, line 143<br>| =C2=A0 =C2=A0 =C2=A0 #4: main, /mnt/b/yo=
e/master/build/tmp/work/riscv64imafdc-yoe-linux/btop/1.4.6/temp/run.do_comp=
ile.1934, line 167</div><div><br></div><div><br></div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sat, Jan 10, 2026 at 3:51=E2=80=AFAM Markus Volk via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"=
mailto:t-online.de@lists.openembedded.org">t-online.de@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Add &#39;googletest-native&#39; dependency to fix:<br>
| CMake Warning at /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-p=
oky-linux/btop/1.4.6/recipe-sysroot-native/usr/share/cmake-4.2/Modules/Fetc=
hContent.cmake:2121 (message):<br>
|=C2=A0 =C2=A0FETCHCONTENT_FULLY_DISCONNECTED is set to true, which require=
s the source<br>
|=C2=A0 =C2=A0directory for dependency googletest to already be populated.=
=C2=A0 This<br>
|=C2=A0 =C2=A0generally means it must not be set to true the first time CMa=
ke is run in a<br>
|=C2=A0 =C2=A0build directory.=C2=A0 The following source directory should =
already be<br>
|=C2=A0 =C2=A0populated, but it doesn&#39;t exist:<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0/home/flk/bitbake-builds/poky/build/tmp/work/corei7-64=
-poky-linux/btop/1.4.6/build/_deps/googletest-src<br>
|<br>
|=C2=A0 =C2=A0Policy CMP0170 controls enforcement of this requirement.<br>
| Call Stack (most recent call first):<br>
|=C2=A0 =C2=A0/home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-l=
inux/btop/1.4.6/recipe-sysroot-native/usr/share/cmake-4.2/Modules/FetchCont=
ent.cmake:2394 (__FetchContent_Populate)<br>
|=C2=A0 =C2=A0tests/CMakeLists.txt:10 (FetchContent_MakeAvailable)<br>
|<br>
|<br>
| -- Configuring done (1.0s)<br>
| CMake Error at tests/CMakeLists.txt:14 (target_link_libraries):<br>
|=C2=A0 =C2=A0Target &quot;libbtop_test&quot; links to:<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0GTest::gtest_main<br>
|<br>
|=C2=A0 =C2=A0but the target was not found.=C2=A0 Possible reasons include:=
<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0* There is a typo in the target name.<br>
|=C2=A0 =C2=A0 =C2=A0* A find_package call is missing for an IMPORTED targe=
t.<br>
|=C2=A0 =C2=A0 =C2=A0* An ALIAS target is missing.<br>
<br>
v1.4.6<br>
<br>
References | Description | Author(s)<br>
--- | --- | ---<br>
1272 | Skip &#39;H&#39; and &#39;HX&#39; suffix in AMD cpu name trimming | =
@ramdomPTM<br>
1268 | feature: add process renice functionality | @goddamnparticle<br>
1285 | Revert &quot;Use /sys/dev/block/MAJOR:MINOR instead of /sys/block/NA=
ME for disk I/O&quot; #1270 | @deckstose<br>
1277 | feat: Introduce cpu frequency display modes | @emiliopedrollo<br>
1282 | Fix CPU frequency detection for LoongArch CPUs | @Twopic2<br>
1275 | fix arrow keys that send &#39;O&#39; instead of &#39;[&#39; | @vanda=
bbin<br>
1251 | OpenBSD: battery: add support for watthour and watts sensors | @shtr=
ophic<br>
1208 | Add Gotham theme | @jrebs<br>
1291 | Fix macOS deadlocks and race conditions in collector threads #1292 |=
 @kuzmeech<br>
1296 | fix: btop crash on arm cpu | @emiliopedrollo @zenofile<br>
984 | Added ability to set which gpu vendors to enable | @thedustinmiller<b=
r>
1274 | added tree toggle of expand/collapse for children of process | @irab=
rine<br>
1300 | Use right key codes to match f1 and f2 keys | @vandabbin<br>
1305 | Handle missing SMC gracefully on macOS | @achille<br>
1309 | Fix redraw in proc list when changing sort order | @vandabbin<br>
1304 | Fix load average and GPU watts leaking past box border | @vandabbin<=
br>
1220 | feat: respect effective cpus from cgroup | @deckstose<br>
1218 | feat: display container engine | @deckstose<br>
1315 | feat: raise cpp standard to c++23 | @deckstose<br>
d0cbaf7 | Add configuration toggle for terminal synchronization | @aristocr=
atos<br>
1306 | Implement feat Process list pausing | @vandabbin<br>
1322 | flip name, command, and user sorting | @vandabbin<br>
1334 | fix tty theme for pause banner | @vandabbin<br>
1325 | test: add test harness with ctest | @deckstose<br>
1339 | fix: skip first argument of argv | @AlvaroParker<br>
1357 | feat: add --themes-dir flag | @adeci<br>
1359 | fix: don&#39;t over-/underflow when parsing --update argument | @yin=
ghao-w<br>
1362 | fix segfault on musl systems | @v1cont<br>
1363 | Pass only static duration strings to Config::set in Config::apply_pr=
eset | @yinghao-w<br>
1366 | fix: cpu per-thread totals not reaching 100% | @Tom94<br>
1367 | Fix: Align boxes when Cpu bottom and Gpu on | @yinghao-w<br>
1372 | Minor fixes and improvements for NetBSD | @fraggerfox<br>
1377 | Fixed GPU rendering | @TheSovietPancakes<br>
1379 | Fix: Always collect GPU data when cpu_graph_lower =3D &quot;Auto&quo=
t; | @yinghao-w<br>
1393 | Fix: humanized units shortening | @yinghao-w<br>
1401 | Feat: add mouse dragging of scrollbar | @yinghao-w<br>
1399 | feat: add cli option to dump default config | @deckstose<br>
e969f43 | Added &quot;save_config_on_exit&quot; option to configuration | @=
aristocratos<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/btop/{<a href=3D"http://btop_1.4.5.bb" rel=3D=
"noreferrer" target=3D"_blank">btop_1.4.5.bb</a> =3D&gt; <a href=3D"http://=
btop_1.4.6.bb" rel=3D"noreferrer" target=3D"_blank">btop_1.4.6.bb</a>} | 3 =
++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-support/btop/{<a href=3D"http://btop_1.4.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">btop_1.4.5.bb</a> =3D&gt; <a href=3D"=
http://btop_1.4.6.bb" rel=3D"noreferrer" target=3D"_blank">btop_1.4.6.bb</a=
>} (90%)<br>
<br>
diff --git a/meta-oe/recipes-support/btop/<a href=3D"http://btop_1.4.5.bb" =
rel=3D"noreferrer" target=3D"_blank">btop_1.4.5.bb</a> b/meta-oe/recipes-su=
pport/btop/<a href=3D"http://btop_1.4.6.bb" rel=3D"noreferrer" target=3D"_b=
lank">btop_1.4.6.bb</a><br>
similarity index 90%<br>
rename from meta-oe/recipes-support/btop/<a href=3D"http://btop_1.4.5.bb" r=
el=3D"noreferrer" target=3D"_blank">btop_1.4.5.bb</a><br>
rename to meta-oe/recipes-support/btop/<a href=3D"http://btop_1.4.6.bb" rel=
=3D"noreferrer" target=3D"_blank">btop_1.4.6.bb</a><br>
index 0455da384b..eb2b69dba9 100644<br>
--- a/meta-oe/recipes-support/btop/<a href=3D"http://btop_1.4.5.bb" rel=3D"=
noreferrer" target=3D"_blank">btop_1.4.5.bb</a><br>
+++ b/meta-oe/recipes-support/btop/<a href=3D"http://btop_1.4.6.bb" rel=3D"=
noreferrer" target=3D"_blank">btop_1.4.6.bb</a><br>
@@ -6,8 +6,9 @@ SECTION =3D &quot;console/utils&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/aristocratos/bto=
p.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/aristocratos/btop.git;protocol=3Dhttps;branch=
=3Dmain;tag=3Dv${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;a1099d075fa914452366b28c67ff171e21a1f02e&quot;<br>
+SRCREV =3D &quot;975e3951daa7d3114112d2cd4ee689cf5ee38745&quot;<br>
<br>
+DEPENDS =3D &quot;googletest-native&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123325): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123325" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123325</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117189895/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117189895/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d31e95064834f99b--

