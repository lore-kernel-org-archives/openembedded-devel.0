Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D568510A62FC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:41:23 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49111.1774536076429911429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CGhmbFyX;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ea73e7b60so1105568d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774536075; cv=none;
        d=google.com; s=arc-20240605;
        b=lpKr2JpibcaLc90ts2SMSJzuHz8IuWOqc7SfyCqHzLjURMcdhaYxQiuos9AzxojjCD
         UsnLlvHozy9YHriiTJigsizKMeJ30Yy285hvvw4s5Xr43pgIsGzuZ80EFqijifynEZMd
         zPekfG7EM75lNabiLx/g5F2oU/mctu0bPUiYJsCCY0Il2rWlVJYyamnv3oNSx2ikURLt
         yBKCed6ZKsrEKo5CpXRm5Li30/5fzxcIqhHXOL6CJqx6Q0b7WZ09/6Sa3OlOiaGIm7Qh
         Nht+alrkPVDE50gLSuFtyO9CBS5Xf2jkVSAFs6fQ3hwX2eHnu5Ufxt9z9cyRqzVzFXZR
         X0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=88UhCBap22GaKhdyGk+YeT3PCy9+s4x0B6xBG6SPilo=;
        fh=qbMClzqv/L3XrYacWmhkdJHRtSy+aeTqvul4PKkyMpc=;
        b=GOG7XzcKvy+KRuSr+ZMNEhteawGIkWi6dDA5PqV5ZzIs5TY6acEDVgexxZOxd4SyM8
         EDluD+q3C2TRJsEU4C+qwLm0GZ7IIZiK76Sd6BZMafBKYF6RRvLFPaYJ5qYElDpFMCi+
         jLVnQaKnvGsZVx7MQReEFFXMPx3gUqPWOwP4KLmqx0VK9Ln5rqLJG5KAJlKueCTP9yob
         8kUcZMNNIczHxWY7sEOn5k0ZZwEV3oOnsFPfRX1tgOBgJfYb96xJI4tB91LCyWOux37z
         jMQKp5Q/UgKxpBRBnhIKv4NUHApiAfKyV73juIfiCzYNeJ9lUxtRmUfZYOiKV30bKvV2
         CtLg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774536075; x=1775140875; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=88UhCBap22GaKhdyGk+YeT3PCy9+s4x0B6xBG6SPilo=;
        b=CGhmbFyXWSWLnYdO4ZKO6VYZPlCZgU/saaDOmul0FBWp92AyDu6x3H5Kc9PZkomaKx
         A8p9QH5BmutJwaCwnd+TUYFaIXc6X+9DKVWj0gDvYB/3CB9SGaHzlMe1aVK8vlr5tQ5J
         0hZNzR+xkFZH8UxiP1SLYvLuGVccvbYUaKZkdfIDipwowkQzNFaWjXepqSnS7EFiCUDJ
         99qddtMSrYjlZ899f+NFirFbmg0bwqpnmfoASLfBFYHlsse8eAeWxpiCakJ6dLALHmFx
         U/DwE69RfWuEfXFR1MxfNNQ6NIXqf+evFeRZMUFNUBVkY2g+0XjOgeSZ0fk+26o0t09B
         vX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536075; x=1775140875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88UhCBap22GaKhdyGk+YeT3PCy9+s4x0B6xBG6SPilo=;
        b=j0QDqi2R8z2eWQMOB1J57n14/VRlzkUFGy1PYFqO+2LLMRboOybbZsgXU+SL0+BQu5
         HAh1yk787T4rQkFaIdgf8SNKLSwQzyb5ecGfVZnNPPRm35FqF7Vt4yFwptZWOOYwz7yo
         U+Gqzj7GEYvEgmoIhlOHRr8Koe032CGFtshLfym8njVsWzfW+94x4hO0MTLAN4XjqXTV
         KQawKOEdv2DMOzJ+G+odg0arBylc1HZcSOfiS4hjhufa9bTChyUNm2fEqqDdc2Z+4II5
         vGayICAUb5ktVSjUxLkvr0Qw5F1FXaULYG/z/6FvkNWbdDMjtLX1xW2dJVQMc2XHQlEK
         Knhw==
X-Gm-Message-State: AOJu0YwE69bHe2Myrkqucl5uk7w69xyPw1xLVsJVp3fi3MVbZO60hSg3
	+fGLw86TuBaW6rk6UMqnoF3XJzTDxnrjW1O1s7wEy6eB4XNthPQvVyiACeZrcqUzBnZ/6O67fmz
	TkO1ibaiOlTvTV74/9v+vPGYEfE8ASon75pUL
X-Gm-Gg: ATEYQzyetklHyVo84NXlwjYk+um/Tff9ulYLR8J1poInOc9Dc+Fybdo8oiCpqUNtbNP
	aktKvrHp6VrT3zvlXC6RTzEkdGDkrFaKqYxRU6TLegjWsS8UAOIkRGw2Jw8u+dYawBilv2oitcs
	t8DQh2WCfUZpslHVgKKIqmplxa7biR5C2dIyBcWzp163e6I4sUUnkIXa1qtvgH55KmekLt8AwYG
	F6A67J9YjOxso6Ld6uDPvhIkQaN3G9ytyah9HVh4Q93lJpwEZWj04OnvUzTXp74Ik512CIvUOtt
	chxVHuh1QbiTiaLYFfz/koN2X1MhCWcnrR7pKR8Ua05XaDqihTA0T6dZr8XIl7jhwQWJjYRyiTC
	O9APndRwVfWXLwUgmpO85djHB
X-Received: by 2002:a05:690e:1441:b0:64a:e142:a097 with SMTP id
 956f58d0204a3-64ee608420emr7556689d50.24.1774536075216; Thu, 26 Mar 2026
 07:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260326083418.195075-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20260326083418.195075-1-haixiao.yan.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2026 07:40:47 -0700
X-Gm-Features: AQROBzB9lg9UiXM0W3PKPyxUg5Nx-9MUDrNlvCjEfZs2NzaV1gseISPkmaI4BOE
Message-ID: <CAMKF1sr1PaLVAKRJNm9Evk-GYnQq4Z0Gw5uDeQwC8gO1fCmqOA@mail.gmail.com>
Subject: Re: [oe] [PATCH] openvpn: upgrade 2.6.17 -> 2.7.0
To: Haixiao.Yan.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000678b9c064dee602f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125738

--000000000000678b9c064dee602f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase it on latest master and resend. I see that you have ptest fix
which is good to apply on top of original update which now is in master.

On Thu, Mar 26, 2026 at 1:34=E2=80=AFAM Yan, Haixiao (CN) via lists.openemb=
edded.org
<Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> Fix ptest:
> The openvpn 2.7.0 upgrade refactored
> tests/unit_tests/openvpn/Makefile.am, changing how test_binaries is
> defined. This caused autoreconf to generate Makefiles where
> buildtest-TESTS and runtest-TESTS no longer have rule bodies, breaking
> the existing ptest recipe which relied on these targets for compilation
> and execution. The fix replaces these internal automake targets with
> stable interfaces: check-am for compilation and direct binary execution
> on target.
>
> Release notes:
>
> https://community.openvpn.net/ReleaseHistory#openvpn-270-released-11-febr=
uary-2026
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>  ...-test-execution-when-cross-compiling.patch | 34 ++++++++++++++++++
>  .../recipes-support/openvpn/openvpn/run-ptest | 16 +++++++--
>  .../{openvpn_2.6.17.bb =3D> openvpn_2.7.0.bb}   | 35 +++++++++++--------
>  3 files changed, 68 insertions(+), 17 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-exec=
ution-when-cross-compiling.patch
>  rename meta-networking/recipes-support/openvpn/{openvpn_2.6.17.bb =3D>
> openvpn_2.7.0.bb} (80%)
>
> diff --git
> a/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-ex=
ecution-when-cross-compiling.patch
> b/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-ex=
ecution-when-cross-compiling.patch
> new file mode 100644
> index 000000000000..f8f2d2907f2c
> --- /dev/null
> +++
> b/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-ex=
ecution-when-cross-compiling.patch
> @@ -0,0 +1,34 @@
> +From 93f7f6ca0c916427d28610d3e263fa556587532d Mon Sep 17 00:00:00 2001
> +From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +Date: Thu, 26 Mar 2026 13:43:50 +0800
> +Subject: [PATCH] tests: skip test execution when cross-compiling
> +
> +The auth-pam unit test Makefile.am unconditionally assigns the TESTS
> variable,
> +causing test execution to fail during cross-compilation because the targ=
et
> +binaries are not executable on the build host.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +---
> + tests/unit_tests/plugins/auth-pam/Makefile.am | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tests/unit_tests/plugins/auth-pam/Makefile.am
> b/tests/unit_tests/plugins/auth-pam/Makefile.am
> +index ba32013ac920..7da299ccde92 100644
> +--- a/tests/unit_tests/plugins/auth-pam/Makefile.am
> ++++ b/tests/unit_tests/plugins/auth-pam/Makefile.am
> +@@ -4,8 +4,10 @@ AM_TESTSUITE_SUMMARY_HEADER =3D ' for $(PACKAGE_STRING)
> auth_pam Plugin Unit-Tests
> +
> + if ENABLE_PLUGIN_AUTH_PAM
> + check_PROGRAMS =3D auth_pam_testdriver
> ++if !CROSS_COMPILING
> + TESTS =3D $(check_PROGRAMS)
> + endif
> ++endif
> +
> + auth_pam_testdriver_SOURCES =3D test_search_and_replace.c
> $(top_srcdir)/src/plugins/auth-pam/utils.h
> $(top_srcdir)/src/plugins/auth-pam/utils.c
> + auth_pam_testdriver_CFLAGS  =3D @TEST_CFLAGS@
> -I$(top_srcdir)/src/plugins/auth-pam
> +--
> +2.43.0
> +
> diff --git a/meta-networking/recipes-support/openvpn/openvpn/run-ptest
> b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
> index 19f66b5c565e..b0f5699e57dd 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn/run-ptest
> +++ b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
> @@ -1,8 +1,20 @@
>  #!/bin/sh
>
> -find ./ -name Makefile | while read -r x; do
> -    make -C "$(dirname "${x}")" -k runtest-TESTS | sed \
> +# Run unit tests directly
> +find ./ -name "*testdriver" -type f -executable | while read -r t; do
> +    dir=3D$(dirname "${t}")
> +    srcdir=3D"${dir}" "${t}" 2>&1 | sed \
>          -e 's/^\(\[       OK \].*\)$/PASS: \1/' \
>          -e 's/^\(\[  FAILED  \].*\)$/FAIL: \1/' \
>          -e 's/^\(\[  SKIPPED \].*\)$/SKIP: \1/'
>  done
> +
> +# Run crypto loopback integration test
> +if [ -f ./t_lpback.sh ]; then
> +    sh ./t_lpback.sh 2>&1
> +    if [ $? -eq 0 ]; then
> +        echo "PASS: t_lpback"
> +    else
> +        echo "FAIL: t_lpback"
> +    fi
> +fi
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
> b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> similarity index 80%
> rename from meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
> rename to meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> index c454a9327647..0cbe4641cd6c 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> @@ -2,20 +2,21 @@ SUMMARY =3D "A full-featured SSL VPN solution via tun
> device."
>  HOMEPAGE =3D "https://openvpn.net/"
>  SECTION =3D "net"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89196bacc47ed37a5b242a535661a=
049"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D924af2c382c415a0a68d0d9e7b483=
d23"
>  DEPENDS =3D "lzo lz4 openssl libcap-ng
> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}
> ${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)} "
>
>  inherit autotools systemd update-rc.d pkgconfig ptest
>
>  SRC_URI =3D "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz=
 \
>
> file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
> +
>  file://0001-tests-skip-test-execution-when-cross-compiling.patch \
>             file://openvpn \
>             file://run-ptest \
>            "
>
>  UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-downloads"
>
> -SRC_URI[sha256sum] =3D
> "4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370"
> +SRC_URI[sha256sum] =3D
> "2f0e10eb272be61e8fb25fe1cfa20875ff30ac857ef1418000c02290bd6dfa45"
>
>  CVE_STATUS[CVE-2020-27569] =3D "not-applicable-config: Applies only
> Aviatrix OpenVPN client, not openvpn"
>
> @@ -46,7 +47,8 @@ PACKAGECONFIG[iproute2] =3D
> "--enable-iproute2,,iproute2,iproute2-ip"
>  PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x"
>
> -RDEPENDS:${PN}-ptest:append =3D " make bash"
> +RDEPENDS:${PN}:append =3D " bash"
> +RDEPENDS:${PN}-ptest:append =3D " bash"
>
>  do_install:append() {
>      install -d ${D}/${sysconfdir}/init.d
> @@ -70,21 +72,21 @@ do_install:append() {
>  }
>
>  do_compile_ptest () {
> -    for x in `find ${B}/tests/unit_tests -name Makefile -exec grep -l
> buildtest-TESTS {} \;`; do
> +    for x in `find ${B}/tests/unit_tests -name Makefile -exec grep -l
> check_PROGRAMS {} \;`; do
>          dir=3D`dirname ${x}`
>          case $dir in
>              *example*)
>                  echo "Skipping directory: $dir"
>                  ;;
>              *)
> -                oe_runmake -C ${dir} buildtest-TESTS
> +                oe_runmake -C ${dir} check-am
>                  ;;
>          esac
>      done
>  }
>
>  do_install_ptest() {
> -    for x in $(find ${B}/tests/unit_tests -name Makefile -exec grep -l
> buildtest-TESTS {} \;); do
> +    for x in $(find ${B}/tests/unit_tests -name Makefile -exec grep -l
> check_PROGRAMS {} \;); do
>          dir=3D$(dirname ${x})
>
>          if [[ "$dir" =3D=3D *example* ]]; then
> @@ -93,21 +95,23 @@ do_install_ptest() {
>
>          target_dir=3D"${D}/${PTEST_PATH}/unit_tests/$(basename ${dir})"
>          mkdir -p ${target_dir}
> -        cp -f ${dir}/Makefile ${target_dir}/
> -        sed -i "s/^Makefile:/MM:/g" ${target_dir}/Makefile
> -        sed -i 's/^#TESTS =3D $(am__EXEEXT_4)/TESTS =3D $(am__EXEEXT_4)/=
'
> ${target_dir}/Makefile
>
> -        for testfile in $(find ${dir} -name "*testdriver"); do
> +        for testfile in $(find ${dir} -name "*testdriver" -type f
> -executable); do
>              cp -rf ${testfile} ${target_dir}/
>          done
>      done
> -    sed -i 's|find ./|find ${PTEST_PATH}|g' ${D}${PTEST_PATH}/run-ptest
> +
> +    # Install test input data files needed by user_pass and misc tests
> +    cp -rf ${S}/tests/unit_tests/openvpn/input
> ${D}/${PTEST_PATH}/unit_tests/openvpn/
> +
> +    # Install COPYRIGHT.GPL needed by test_list
> +    # test_list references srcdir/../../../COPYRIGHT.GPL
> +    # srcdir=3D./unit_tests/openvpn -> resolves to ../COPYRIGHT.GPL from
> ptest cwd
> +    # which is ${libdir}/openvpn/COPYRIGHT.GPL
> +    cp -f ${S}/COPYRIGHT.GPL ${D}/${libdir}/openvpn/
> +
>      sed -i 's|${top_builddir}/src/openvpn|${sbindir}|g'
> ${S}/tests/t_lpback.sh
>      cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
> -    cp -f ${B}/tests/Makefile ${D}/${PTEST_PATH}
> -    sed -i "s/^Makefile:/MM:/g" ${D}/${PTEST_PATH}/Makefile
> -    sed -i "s/^test_scripts =3D t_client.sh t_lpback.sh
> t_cltsrv.sh/test_scripts =3D t_lpback.sh/g" ${D}/${PTEST_PATH}/Makefile
> -
>  }
>
>  PACKAGES =3D+ " ${PN}-sample "
> @@ -115,6 +119,7 @@ PACKAGES =3D+ " ${PN}-sample "
>  RRECOMMENDS:${PN} =3D "kernel-module-tun"
>
>  FILES:${PN}-dbg +=3D "${libdir}/openvpn/plugins/.debug"
> +FILES:${PN}-ptest +=3D "${libdir}/openvpn/COPYRIGHT.GPL"
>  FILES:${PN} +=3D "${systemd_system_unitdir}/openvpn-server@.service \
>                  ${systemd_system_unitdir}/openvpn-client@.service \
>                  ${nonarch_libdir}/tmpfiles.d \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125638):
> https://lists.openembedded.org/g/openembedded-devel/message/125638
> Mute This Topic: https://lists.openembedded.org/mt/118514973/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000678b9c064dee602f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase it on latest master and resend. I see that y=
ou have ptest fix which is good to apply on top of original update which no=
w is in master.</div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26, 2026 at 1:34=E2=80=AFA=
M Yan, Haixiao (CN) via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;<a href=3D"http://Haixiao.Yan.CN">Haixiao.Yan.CN</a>=
=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@=
windriver.com" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
<br>
Fix ptest:<br>
The openvpn 2.7.0 upgrade refactored<br>
tests/unit_tests/openvpn/Makefile.am, changing how test_binaries is<br>
defined. This caused autoreconf to generate Makefiles where<br>
buildtest-TESTS and runtest-TESTS no longer have rule bodies, breaking<br>
the existing ptest recipe which relied on these targets for compilation<br>
and execution. The fix replaces these internal automake targets with<br>
stable interfaces: check-am for compilation and direct binary execution<br>
on target.<br>
<br>
Release notes:<br>
<a href=3D"https://community.openvpn.net/ReleaseHistory#openvpn-270-release=
d-11-february-2026" rel=3D"noreferrer" target=3D"_blank">https://community.=
openvpn.net/ReleaseHistory#openvpn-270-released-11-february-2026</a><br>
<br>
Signed-off-by: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.c=
om" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-test-execution-when-cross-compiling.patch | 34 ++++++++++++++++++=
<br>
=C2=A0.../recipes-support/openvpn/openvpn/run-ptest | 16 +++++++--<br>
=C2=A0.../{<a href=3D"http://openvpn_2.6.17.bb" rel=3D"noreferrer" target=
=3D"_blank">openvpn_2.6.17.bb</a> =3D&gt; <a href=3D"http://openvpn_2.7.0.b=
b" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a>}=C2=A0 =C2=A0|=
 35 +++++++++++--------<br>
=C2=A03 files changed, 68 insertions(+), 17 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/openvpn/openvpn/00=
01-tests-skip-test-execution-when-cross-compiling.patch<br>
=C2=A0rename meta-networking/recipes-support/openvpn/{<a href=3D"http://ope=
nvpn_2.6.17.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.17.bb</a> =
=3D&gt; <a href=3D"http://openvpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">openvpn_2.7.0.bb</a>} (80%)<br>
<br>
diff --git a/meta-networking/recipes-support/openvpn/openvpn/0001-tests-ski=
p-test-execution-when-cross-compiling.patch b/meta-networking/recipes-suppo=
rt/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patc=
h<br>
new file mode 100644<br>
index 000000000000..f8f2d2907f2c<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-=
execution-when-cross-compiling.patch<br>
@@ -0,0 +1,34 @@<br>
+From 93f7f6ca0c916427d28610d3e263fa556587532d Mon Sep 17 00:00:00 2001<br>
+From: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.com" targ=
et=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
+Date: Thu, 26 Mar 2026 13:43:50 +0800<br>
+Subject: [PATCH] tests: skip test execution when cross-compiling<br>
+<br>
+The auth-pam unit test Makefile.am unconditionally assigns the TESTS varia=
ble,<br>
+causing test execution to fail during cross-compilation because the target=
<br>
+binaries are not executable on the build host.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.=
com" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
+---<br>
+ tests/unit_tests/plugins/auth-pam/Makefile.am | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/tests/unit_tests/plugins/auth-pam/Makefile.am b/tests/unit_te=
sts/plugins/auth-pam/Makefile.am<br>
+index ba32013ac920..7da299ccde92 100644<br>
+--- a/tests/unit_tests/plugins/auth-pam/Makefile.am<br>
++++ b/tests/unit_tests/plugins/auth-pam/Makefile.am<br>
+@@ -4,8 +4,10 @@ AM_TESTSUITE_SUMMARY_HEADER =3D &#39; for $(PACKAGE_STRIN=
G) auth_pam Plugin Unit-Tests<br>
+ <br>
+ if ENABLE_PLUGIN_AUTH_PAM<br>
+ check_PROGRAMS =3D auth_pam_testdriver<br>
++if !CROSS_COMPILING<br>
+ TESTS =3D $(check_PROGRAMS)<br>
+ endif<br>
++endif<br>
+ <br>
+ auth_pam_testdriver_SOURCES =3D test_search_and_replace.c=C2=A0 $(top_src=
dir)/src/plugins/auth-pam/utils.h $(top_srcdir)/src/plugins/auth-pam/utils.=
c<br>
+ auth_pam_testdriver_CFLAGS=C2=A0 =3D @TEST_CFLAGS@ -I$(top_srcdir)/src/pl=
ugins/auth-pam<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta-networking/recipes-support/openvpn/openvpn/run-ptest b/me=
ta-networking/recipes-support/openvpn/openvpn/run-ptest<br>
index 19f66b5c565e..b0f5699e57dd 100644<br>
--- a/meta-networking/recipes-support/openvpn/openvpn/run-ptest<br>
+++ b/meta-networking/recipes-support/openvpn/openvpn/run-ptest<br>
@@ -1,8 +1,20 @@<br>
=C2=A0#!/bin/sh<br>
<br>
-find ./ -name Makefile | while read -r x; do<br>
-=C2=A0 =C2=A0 make -C &quot;$(dirname &quot;${x}&quot;)&quot; -k runtest-T=
ESTS | sed \<br>
+# Run unit tests directly<br>
+find ./ -name &quot;*testdriver&quot; -type f -executable | while read -r =
t; do<br>
+=C2=A0 =C2=A0 dir=3D$(dirname &quot;${t}&quot;)<br>
+=C2=A0 =C2=A0 srcdir=3D&quot;${dir}&quot; &quot;${t}&quot; 2&gt;&amp;1 | s=
ed \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/^\(\[=C2=A0 =C2=A0 =C2=A0 =C2=
=A0OK \].*\)$/PASS: \1/&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/^\(\[=C2=A0 FAILED=C2=A0 \].*\)=
$/FAIL: \1/&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/^\(\[=C2=A0 SKIPPED \].*\)$/SKI=
P: \1/&#39;<br>
=C2=A0done<br>
+<br>
+# Run crypto loopback integration test<br>
+if [ -f ./t_lpback.sh ]; then<br>
+=C2=A0 =C2=A0 sh ./t_lpback.sh 2&gt;&amp;1<br>
+=C2=A0 =C2=A0 if [ $? -eq 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: t_lpback&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: t_lpback&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+fi<br>
diff --git a/meta-networking/recipes-support/openvpn/<a href=3D"http://open=
vpn_2.6.17.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.17.bb</a> b=
/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.7.0.bb=
" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
similarity index 80%<br>
rename from meta-networking/recipes-support/openvpn/<a href=3D"http://openv=
pn_2.6.17.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.17.bb</a><br=
>
rename to meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn=
_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
index c454a9327647..0cbe4641cd6c 100644<br>
--- a/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.6=
.17.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.17.bb</a><br>
+++ b/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.7=
.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
@@ -2,20 +2,21 @@ SUMMARY =3D &quot;A full-featured SSL VPN solution via tu=
n device.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://openvpn.net/" rel=3D"noreferrer=
" target=3D"_blank">https://openvpn.net/</a>&quot;<br>
=C2=A0SECTION =3D &quot;net&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D89196bacc47ed37a5b242a5356=
61a049&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D924af2c382c415a0a68d0d9e7b=
483d23&quot;<br>
=C2=A0DEPENDS =3D &quot;lzo lz4 openssl libcap-ng ${@bb.utils.contains(&#39=
;DISTRO_FEATURES&#39;, &#39;pam&#39;, &#39;libpam&#39;, &#39;&#39;, d)} ${@=
bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;cmocka&#39;, &=
#39;&#39;, d)} &quot;<br>
<br>
=C2=A0inherit autotools systemd update-rc.d pkgconfig ptest<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://swupdate.openvpn.org/community/re=
leases/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://swupda=
te.openvpn.org/community/releases/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure.ac-eliminat=
e-build-path-from-openvpn-versi.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-skip-test-execu=
tion-when-cross-compiling.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvpn \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://openvpn.net/community=
-downloads" rel=3D"noreferrer" target=3D"_blank">https://openvpn.net/commun=
ity-downloads</a>&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd3=
7d93831e2fd3208b370&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2f0e10eb272be61e8fb25fe1cfa20875ff30ac857ef14=
18000c02290bd6dfa45&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2020-27569] =3D &quot;not-applicable-config: Applies o=
nly Aviatrix OpenVPN client, not openvpn&quot;<br>
<br>
@@ -46,7 +47,8 @@ PACKAGECONFIG[iproute2] =3D &quot;--enable-iproute2,,ipro=
ute2,iproute2-ip&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-systemd,s=
ystemd&quot;<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-selinux,l=
ibselinux&quot;<br>
<br>
-RDEPENDS:${PN}-ptest:append =3D &quot; make bash&quot;<br>
+RDEPENDS:${PN}:append =3D &quot; bash&quot;<br>
+RDEPENDS:${PN}-ptest:append =3D &quot; bash&quot;<br>
<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}/${sysconfdir}/init.d<br>
@@ -70,21 +72,21 @@ do_install:append() {<br>
=C2=A0}<br>
<br>
=C2=A0do_compile_ptest () {<br>
-=C2=A0 =C2=A0 for x in `find ${B}/tests/unit_tests -name Makefile -exec gr=
ep -l buildtest-TESTS {} \;`; do<br>
+=C2=A0 =C2=A0 for x in `find ${B}/tests/unit_tests -name Makefile -exec gr=
ep -l check_PROGRAMS {} \;`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dir=3D`dirname ${x}`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case $dir in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*example*)=C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Sk=
ipping directory: $dir&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${di=
r} buildtest-TESTS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${di=
r} check-am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest() {<br>
-=C2=A0 =C2=A0 for x in $(find ${B}/tests/unit_tests -name Makefile -exec g=
rep -l buildtest-TESTS {} \;); do<br>
+=C2=A0 =C2=A0 for x in $(find ${B}/tests/unit_tests -name Makefile -exec g=
rep -l check_PROGRAMS {} \;); do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dir=3D$(dirname ${x})<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [[ &quot;$dir&quot; =3D=3D *example* ]=
]; then<br>
@@ -93,21 +95,23 @@ do_install_ptest() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_dir=3D&quot;${D}/${PTEST_PATH}/uni=
t_tests/$(basename ${dir})&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${target_dir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -f ${dir}/Makefile ${target_dir}/=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s/^Makefile:/MM:/g&quot; ${target=
_dir}/Makefile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/^#TESTS =3D $(am__EXEEXT_4)/TEST=
S =3D $(am__EXEEXT_4)/&#39; ${target_dir}/Makefile<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for testfile in $(find ${dir} -name &quot;*tes=
tdriver&quot;); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for testfile in $(find ${dir} -name &quot;*tes=
tdriver&quot; -type f -executable); do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${testfile} ${target=
_dir}/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 sed -i &#39;s|find ./|find ${PTEST_PATH}|g&#39; ${D}${PTEST_=
PATH}/run-ptest<br>
+<br>
+=C2=A0 =C2=A0 # Install test input data files needed by user_pass and misc=
 tests<br>
+=C2=A0 =C2=A0 cp -rf ${S}/tests/unit_tests/openvpn/input ${D}/${PTEST_PATH=
}/unit_tests/openvpn/<br>
+<br>
+=C2=A0 =C2=A0 # Install COPYRIGHT.GPL needed by test_list<br>
+=C2=A0 =C2=A0 # test_list references srcdir/../../../COPYRIGHT.GPL<br>
+=C2=A0 =C2=A0 # srcdir=3D./unit_tests/openvpn -&gt; resolves to ../COPYRIG=
HT.GPL from ptest cwd<br>
+=C2=A0 =C2=A0 # which is ${libdir}/openvpn/COPYRIGHT.GPL<br>
+=C2=A0 =C2=A0 cp -f ${S}/COPYRIGHT.GPL ${D}/${libdir}/openvpn/<br>
+<br>
=C2=A0 =C2=A0 =C2=A0sed -i &#39;s|${top_builddir}/src/openvpn|${sbindir}|g&=
#39; ${S}/tests/t_lpback.sh<br>
=C2=A0 =C2=A0 =C2=A0cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}<br>
-=C2=A0 =C2=A0 cp -f ${B}/tests/Makefile ${D}/${PTEST_PATH}<br>
-=C2=A0 =C2=A0 sed -i &quot;s/^Makefile:/MM:/g&quot; ${D}/${PTEST_PATH}/Mak=
efile<br>
-=C2=A0 =C2=A0 sed -i &quot;s/^test_scripts =3D t_client.sh t_lpback.sh <a =
href=3D"http://t_cltsrv.sh/test_scripts" rel=3D"noreferrer" target=3D"_blan=
k">t_cltsrv.sh/test_scripts</a> =3D <a href=3D"http://t_lpback.sh/g" rel=3D=
"noreferrer" target=3D"_blank">t_lpback.sh/g</a>&quot; ${D}/${PTEST_PATH}/M=
akefile<br>
-=C2=A0 =C2=A0 <br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot; ${PN}-sample &quot;<br>
@@ -115,6 +119,7 @@ PACKAGES =3D+ &quot; ${PN}-sample &quot;<br>
=C2=A0RRECOMMENDS:${PN} =3D &quot;kernel-module-tun&quot;<br>
<br>
=C2=A0FILES:${PN}-dbg +=3D &quot;${libdir}/openvpn/plugins/.debug&quot;<br>
+FILES:${PN}-ptest +=3D &quot;${libdir}/openvpn/COPYRIGHT.GPL&quot;<br>
=C2=A0FILES:${PN} +=3D &quot;${systemd_system_unitdir}/openvpn-server@.serv=
ice \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_sys=
tem_unitdir}/openvpn-client@.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_lib=
dir}/tmpfiles.d \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125638): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125638" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125638</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118514973/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118514973/1997914</a><br>
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

--000000000000678b9c064dee602f--

