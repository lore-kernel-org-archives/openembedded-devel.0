Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9454D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:05:40 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3069.1764360338162842872
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXA2FSmA;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7815092cd0bso19841507b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764360337; x=1764965137; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=obHflrhTT1oSO6gtj/xd9yHCZEUtaT1oFMa3ALUsRPs=;
        b=fXA2FSmAKe76sPeARE/YawH6hjBhKAG2Ii9t5E11RWFixtpmBujwcdZ3TI8deeffgl
         mwKms8H40AJNqnzE7XEqAE04Uo/eqvIufJE09CMD/QWWA8bZsV8VOgkq/FWO+aG3k6mr
         7pDmG4Y7al8MVPgqLkUZXhDp7bcCRy3SlYWdTlcH+tM7OsSEtpLSi5EQHMDWt+JveTGE
         Rf54INNFbTA8l2cBGLu0f3hatNlFOPpurtPzh0ssl8b3mVkrUMEKe+TDWImT1fKc0Vur
         YyFeKdMa9EAi97WGaL4wNsTI/K7JkSUm2rHggvOd1Jp3eZW9/G+S43wKSYtAgax67KU0
         0caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764360337; x=1764965137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obHflrhTT1oSO6gtj/xd9yHCZEUtaT1oFMa3ALUsRPs=;
        b=S4nm5K4wxTVhb6Ib27kVu2WDwdhq2AM79DOLgpJiLm/6+hpYk0mu8+rlq/PUD45huT
         wqohb0mo0M3D/6b8e5vgB/DAqxtxI/2FrgkTvtlDfyidzFqftkq6aGb6yrDx65VpoEYA
         B/4FOczN8c1B4AA3eGz5JzbG+G7L6PKmkL3YGzJx4ozekVMGEl1GJFiE1jLSZE4FmYIk
         N01d/yKeFNFy+WAmPZ2oM7XMzMpEN44X6mj8hHyfjZkOypp6lx3ULpU7XXxSAd258/T5
         3wCysM28SCwYHvFkkAhZLAeYFTcKi9y/5huQidAxYvbgfXgQ+1/iHkFmsxUh2ot3B65y
         OL3w==
X-Gm-Message-State: AOJu0Yy28YHOuvjpDeh6gNeckcOiLapXSRd3xbEm4pI5P5oFj1T9rm3y
	bW+BBOhs7GIJjSpbMAspvblkJXrabCDG0I3uwQFl28u2KS143Dm0BnJY52NmSJFV1QHZdAcd7iB
	T3GFqScE2mwHfNiIctE8cR+ijIapDA04PXVET
X-Gm-Gg: ASbGncuZiiOp2EUyjJi9xM+XwYsfDPhwBP8leLbZI2j8rSRxnkPtcEn5zi3yNLaayK5
	UBHsobafzptSwwlCbEmWjCkCiFdRoT1uMiD3O6uIn4hHzwz6/wsKV5F4wSDonrov3Fa+huZ2NS8
	rXi/BA31AHjWscBYGW3rgfS8h/DchRc2sdrvmVPiAna417xJ5KTYgXFjwwhtYP4HoUKI8MSZLmu
	q3EbOeB7k2Fw1SKk6MlBfofAuozX+n5wsiGgxiJAgbW8+f2VjtP2oWyDC/9uNqkCK8wUnE1ydO7
	xqgpIFT8Tt5/55tr6mfP+hfHHOmRf959QMJiVPPpwsk8X6WlcE6mrp4JKdfQA8AQ8eu/oNxcape
	gP2QzhTaRQhmmLOTpe4l+O4xZgHhYOmJfMFkz0g==
X-Google-Smtp-Source: AGHT+IEi5R+xg4d4rUwwP56ONHdxuJmaegH+ebjlWXV2MHwSScvbQcGdb5Mg5tMwapxCbA2XZWGZoxSJrxf74AUNmh0=
X-Received: by 2002:a05:690c:fc5:b0:786:9322:e3fa with SMTP id
 00721157ae682-78ab6fc6e99mr256426147b3.68.1764360336930; Fri, 28 Nov 2025
 12:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20251127161711.2341194-1-skandigraun@gmail.com>
 <20251127161711.2341194-2-skandigraun@gmail.com> <CAMKF1sqGCohP7gPUCtBqmiBdQRfWXfcgRpXthaKHtf4OdGCjwA@mail.gmail.com>
 <2326df17-cb30-45df-bbc6-ea0b0c72d84d@gmail.com>
In-Reply-To: <2326df17-cb30-45df-bbc6-ea0b0c72d84d@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Nov 2025 12:05:10 -0800
X-Gm-Features: AWmQ_blCItlYWW2zYfAMIQI7lCLThM0UWe11rTuJIFdwOKtA4I8sRmx5TbCacS8
Message-ID: <CAMKF1sq48H3wCMeQLNHuMCxZ3=4Xpi0Zmg1TK4_xPDmJO6fJWA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] dbus-broker: add ptest support
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000237a590644ad2779"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122130

--000000000000237a590644ad2779
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, typo its with musl/sysvinit

On Fri, Nov 28, 2025 at 12:02=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com>
wrote:

> On 11/28/25 20:34, Khem Raj wrote:
> > with musl/systemd combo I get
> >
>
> Wait, you mean that you have systemd enabled in DISTRO_FEATURES, and
> still this error is thrown?
>
>
> >  ERROR: Nothing RPROVIDES 'dbus-broker-ptest' (but
> > virtual:mcextend:dbus-broker:/srv/build/yoe/
> >    =E2=86=AA
> > sources/meta-openembedded/meta-oe/recipes-core/images/
> meta-oe-image-ptest.bb
> > <http://meta-oe-image-ptest.bb> RDEPENDS on or
> >    =E2=86=AA otherwise requires it)
> >    dbus-broker RPROVIDES dbus-broker-ptest but was skipped: using
> > DISTRO 'yoe', which is missing
> >    =E2=86=AA required DISTRO_FEATURES: 'systemd'
> >    NOTE: Runtime target 'dbus-broker-ptest' is unbuildable, removing...
> >    Missing or unbuildable dependency chain was: ['dbus-broker-ptest']
> >    NOTE: Runtime target 'meta-oe-image-ptest-all-dev' is unbuildable,
> > removing...
> >    Missing or unbuildable dependency chain was:
> > ['meta-oe-image-ptest-all-dev', 'meta-oe-image-
> >    =E2=86=AA ptest-dbus-broker', 'dbus-broker-ptest']
> >    NOTE: Runtime target 'meta-oe-image-ptest-all' is unbuildable,
> > removing...
> >    Missing or unbuildable dependency chain was:
> > ['meta-oe-image-ptest-all', 'meta-oe-image-ptest-
> >    =E2=86=AA dbus-broker', 'dbus-broker-ptest']
> >    ERROR: Nothing RPROVIDES 'meta-oe-image-ptest-dbus-broker'
> >    No eligible RPROVIDERs exist for 'meta-oe-image-ptest-dbus-broker'
> >    NOTE: Runtime target 'meta-oe-image-ptest-dbus-broker' is
> > unbuildable, removing...
> >    Missing or unbuildable dependency chain was:
> > ['meta-oe-image-ptest-dbus-broker']
> >
> > On Thu, Nov 27, 2025 at 8:17=E2=80=AFAM Gyorgy Sarvari via
> > lists.openembedded.org <http://lists.openembedded.org>
> > <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >
> >     It takes less than 30 seconds to execute.
> >
> >     Add a backported patch that fixes a broken test.
> >
> >     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >     ---
> >      .../include/ptest-packagelists-meta-oe.inc    |  1 +
> >      ...-loosen-verification-of-stale-pidfds.patch | 52
> >     +++++++++++++++++++
> >      .../recipes-core/dbus/dbus-broker/run-ptest   | 19 +++++++
> >      meta-oe/recipes-core/dbus/dbus-broker_37.bb
> >     <http://dbus-broker_37.bb>   | 12 ++++-
> >      4 files changed, 82 insertions(+), 2 deletions(-)
> >      create mode 100644
> >
>  meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verificat=
ion-of-stale-pidfds.patch
> >      create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/run-ptest
> >
> >     diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> >     b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> >     index 52ca06ae43..b725c1aa36 100644
> >     --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> >     +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> >     @@ -12,6 +12,7 @@ PTESTS_FAST_META_OE =3D "\
> >          cli11 \
> >          cmocka \
> >          cunit \
> >     +    dbus-broker \
> >          duktape \
> >          exiv2 \
> >          fuse3 \
> >     diff --git
> >
>  a/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verific=
ation-of-stale-pidfds.patch
> >
>  b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verific=
ation-of-stale-pidfds.patch
> >     new file mode 100644
> >     index 0000000000..fac5be1917
> >     --- /dev/null
> >     +++
> >
>  b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verific=
ation-of-stale-pidfds.patch
> >     @@ -0,0 +1,52 @@
> >     +From cc7f9da25b103aacbb1595d04af9cb70ef8f43d9 Mon Sep 17 00:00:00
> >     2001
> >     +From: Gyorgy Sarvari <skandigraun@gmail.com>
> >     +Date: Thu, 4 Sep 2025 10:23:36 +0200
> >     +Subject: [PATCH] test/sockopt: loosen verification of stale pidfds
> >     +
> >     +From: David Rheinsberg <david@readahead.eu>
> >     +
> >     +Newer kernels now properly return stale pidfds from AF_UNIX socket=
s,
> >     +rather than refusing the operation. Ensure that our tests adopt
> >     to this
> >     +and properly verify staleness.
> >     +
> >     +Signed-off-by: David Rheinsberg <david@readahead.eu>
> >     +Upstream-Status: Backport
> >     [
> https://github.com/bus1/dbus-broker/commit/fd5c6e191bffcf5b3e6c9abb8b0b03=
479accc04b
> ]
> >     +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >     +---
> >     + src/util/test-sockopt.c | 16 ++++++++++++----
> >     + 1 file changed, 12 insertions(+), 4 deletions(-)
> >     +
> >     +diff --git a/src/util/test-sockopt.c b/src/util/test-sockopt.c
> >     +index 04148af..eaa8fba 100644
> >     +--- a/src/util/test-sockopt.c
> >     ++++ b/src/util/test-sockopt.c
> >     +@@ -81,17 +81,25 @@ static void test_peerpidfd_client(
> >     +
> >     +         r =3D sockopt_get_peerpidfd(fd, &pidfd);
> >     +         if (r !=3D SOCKOPT_E_UNSUPPORTED) {
> >     +-                if (stale) {
> >     +-                        c_assert(r =3D=3D SOCKOPT_E_REAPED);
> >     ++                if (r =3D=3D SOCKOPT_E_REAPED) {
> >     ++                        /*
> >     ++                         * Old kernels refused to return stale
> >     pidfds. Hence,
> >     ++                         * in that case verify that we expected
> >     a stale pidfd.
> >     ++                         */
> >     ++                        c_assert(stale);
> >     +                 } else {
> >     +                         c_assert(!r);
> >     +                         c_assert(pidfd >=3D 0);
> >     +
> >     +                         r =3D proc_resolve_pidfd(pidfd, &pid_sock=
et);
> >     +                         c_assert(!r);
> >     +-                        c_assert(pid_socket > 0);
> >     +
> >     +-                        c_assert(pid_socket =3D=3D pid_server);
> >     ++                        if (stale) {
> >     ++                                c_assert(pid_socket =3D=3D -1);
> >     ++                        } else {
> >     ++                                c_assert(pid_socket > 0);
> >     ++                                c_assert(pid_socket =3D=3D pid_se=
rver);
> >     ++                        }
> >     +                 }
> >     +         }
> >     + }
> >     diff --git a/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
> >     b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
> >     new file mode 100644
> >     index 0000000000..789000523e
> >     --- /dev/null
> >     +++ b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
> >     @@ -0,0 +1,19 @@
> >     +#!/bin/sh
> >     +RET=3D0
> >     +
> >     +run_tests(){
> >     +  for t in *; do
> >     +    if ./$t; then
> >     +      echo PASS: $t
> >     +    else
> >     +      echo FAIL: $t
> >     +      RET=3D1
> >     +    fi
> >     +  done
> >     +}
> >     +
> >     +cd /usr/lib/dbus-broker/tests/dbus
> >     +run_tests
> >     +cd /usr/lib/dbus-broker/tests/unit
> >     +run_tests
> >     +exit $RET
> >     diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
> >     <http://dbus-broker_37.bb>
> >     b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
> >     <http://dbus-broker_37.bb>
> >     index f0312181b6..c531f555d2 100644
> >     --- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
> >     <http://dbus-broker_37.bb>
> >     +++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
> >     <http://dbus-broker_37.bb>
> >     @@ -10,7 +10,10 @@ DEPENDS =3D "\
> >          ${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
> >     'libselinux (>=3D 3.2)', '', d)} \
> >      "
> >
> >     -SRC_URI =3D
> >     "
> https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz
> >     <
> https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$%7BBP%7=
D.tar.xz
> >"
> >     +SRC_URI =3D
> >     "
> https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz
> >     <
> https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$%7BBP%7=
D.tar.xz
> >
> >     \
> >     +
> >      file://0001-test-sockopt-loosen-verification-of-stale-pidfds.patch=
 \
> >     +           file://run-ptest \
> >     +           "
> >      SRC_URI[sha256sum] =3D
> >     "f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b"
> >
> >      UPSTREAM_CHECK_URI =3D "https://github.com/bus1/${BPN}/releases
> >     <https://github.com/bus1/$%7BBPN%7D/releases>"
> >     @@ -18,10 +21,11 @@ UPSTREAM_CHECK_REGEX =3D
> >     "releases/tag/v(?P<pver>\d+)"
> >
> >      SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> >
> >     -inherit meson pkgconfig systemd features_check
> >     +inherit meson pkgconfig systemd features_check ptest
> >
> >      EXTRA_OEMESON +=3D "-Daudit=3D${@bb.utils.contains('DISTRO_FEATURE=
S',
> >     'selinux', 'true', 'false', d)}"
> >      EXTRA_OEMESON +=3D
> >     "-Dselinux=3D${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
> >     'true', 'false', d)}"
> >     +EXTRA_OEMESON +=3D "-Dtests=3D${@bb.utils.contains('PTEST_ENABLED'=
,
> >     '1', 'true', 'false', d)}"
> >
> >      REQUIRED_DISTRO_FEATURES =3D "systemd"
> >
> >     @@ -36,3 +40,7 @@ RDEPENDS:${PN} +=3D "dbus-common dbus-tools"
> >      FILES:${PN} +=3D "${nonarch_libdir}/systemd/catalog"
> >      FILES:${PN} +=3D "${systemd_system_unitdir}"
> >      FILES:${PN} +=3D "${systemd_user_unitdir}"
> >     +FILES:${PN}-ptest +=3D "${libdir}/${PN}/tests"
> >     +
> >     +# test-sockopt fails to compile with musl without this flag
> >     +CFLAGS:append:libc-musl =3D "${@bb.utils.contains('PTEST_ENABLED',
> >     '1', ' -Wno-error=3Dincompatible-pointer-types ', '', d)}"
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#122111):
> >     https://lists.openembedded.org/g/openembedded-devel/message/122111
> >     Mute This Topic: https://lists.openembedded.org/mt/116502872/199791=
4
> >     Group Owner: openembedded-devel+owner@lists.openembedded.org
> >     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-devel/unsub
> >     [raj.khem@gmail.com]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000237a590644ad2779
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, typo its with musl/sysvinit</div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Nov 28, 2025 at 12:02=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:sk=
andigraun@gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 11/28/25 20:34, Khem Raj wrote=
:<br>
&gt; with musl/systemd combo I get<br>
&gt;<br>
<br>
Wait, you mean that you have systemd enabled in DISTRO_FEATURES, and<br>
still this error is thrown?<br>
<br>
<br>
&gt; =C2=A0ERROR: Nothing RPROVIDES &#39;dbus-broker-ptest&#39; (but<br>
&gt; virtual:mcextend:dbus-broker:/srv/build/yoe/<br>
&gt; =C2=A0 =C2=A0=E2=86=AA<br>
&gt; sources/meta-openembedded/meta-oe/recipes-core/images/<a href=3D"http:=
//meta-oe-image-ptest.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-imag=
e-ptest.bb</a><br>
&gt; &lt;<a href=3D"http://meta-oe-image-ptest.bb" rel=3D"noreferrer" targe=
t=3D"_blank">http://meta-oe-image-ptest.bb</a>&gt; RDEPENDS on or<br>
&gt; =C2=A0 =C2=A0=E2=86=AA otherwise requires it)<br>
&gt; =C2=A0 =C2=A0dbus-broker RPROVIDES dbus-broker-ptest but was skipped: =
using<br>
&gt; DISTRO &#39;yoe&#39;, which is missing<br>
&gt; =C2=A0 =C2=A0=E2=86=AA required DISTRO_FEATURES: &#39;systemd&#39;<br>
&gt; =C2=A0 =C2=A0NOTE: Runtime target &#39;dbus-broker-ptest&#39; is unbui=
ldable, removing...<br>
&gt; =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;dbus-b=
roker-ptest&#39;]<br>
&gt; =C2=A0 =C2=A0NOTE: Runtime target &#39;meta-oe-image-ptest-all-dev&#39=
; is unbuildable,<br>
&gt; removing...<br>
&gt; =C2=A0 =C2=A0Missing or unbuildable dependency chain was:<br>
&gt; [&#39;meta-oe-image-ptest-all-dev&#39;, &#39;meta-oe-image-<br>
&gt; =C2=A0 =C2=A0=E2=86=AA ptest-dbus-broker&#39;, &#39;dbus-broker-ptest&=
#39;]<br>
&gt; =C2=A0 =C2=A0NOTE: Runtime target &#39;meta-oe-image-ptest-all&#39; is=
 unbuildable,<br>
&gt; removing...<br>
&gt; =C2=A0 =C2=A0Missing or unbuildable dependency chain was:<br>
&gt; [&#39;meta-oe-image-ptest-all&#39;, &#39;meta-oe-image-ptest-<br>
&gt; =C2=A0 =C2=A0=E2=86=AA dbus-broker&#39;, &#39;dbus-broker-ptest&#39;]<=
br>
&gt; =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;meta-oe-image-ptest-dbus-br=
oker&#39;<br>
&gt; =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;meta-oe-image-ptest=
-dbus-broker&#39;<br>
&gt; =C2=A0 =C2=A0NOTE: Runtime target &#39;meta-oe-image-ptest-dbus-broker=
&#39; is<br>
&gt; unbuildable, removing...<br>
&gt; =C2=A0 =C2=A0Missing or unbuildable dependency chain was:<br>
&gt; [&#39;meta-oe-image-ptest-dbus-broker&#39;]<br>
&gt;<br>
&gt; On Thu, Nov 27, 2025 at 8:17=E2=80=AFAM Gyorgy Sarvari via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;<a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</=
a>&gt;<br>
&gt; &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0It takes less than 30 seconds to execute.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Add a backported patch that fixes a broken test.<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto=
:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...-loosen-verification-of-stale-pidfds.patch=
 | 52<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-core/dbus/dbus-broker/run-ptest=
=C2=A0 =C2=A0| 19 +++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-core/dbus/<a href=3D"http://d=
bus-broker_37.bb" rel=3D"noreferrer" target=3D"_blank">dbus-broker_37.bb</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dbus-broker_37.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://dbus-broker_37.bb</a>&gt;=C2=A0 =C2=A0| 1=
2 ++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A04 files changed, 82 insertions(+), 2 deletion=
s(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/recipes-core/dbus/dbus-broker/0001-test-soc=
kopt-loosen-verification-of-stale-pidfds.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-core/dbus/=
dbus-broker/run-ptest<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/conf/include/ptest-packagelist=
s-meta-oe.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/conf/include/ptest-packagelists-meta-oe.i=
nc<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 52ca06ae43..b725c1aa36 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-oe/conf/include/ptest-packagelists-meta-=
oe.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/conf/include/ptest-packagelists-meta-=
oe.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -12,6 +12,7 @@ PTESTS_FAST_META_OE =3D &quot;\<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0cli11 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0cmocka \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0cunit \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 dbus-broker \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0duktape \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0exiv2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0fuse3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta-oe/recipes-core/dbus/dbus-broker/0001-test-s=
ockopt-loosen-verification-of-stale-pidfds.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-s=
ockopt-loosen-verification-of-stale-pidfds.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..fac5be1917<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-s=
ockopt-loosen-verification-of-stale-pidfds.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,52 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From cc7f9da25b103aacbb1595d04af9cb70ef8f43d9 Mon =
Sep 17 00:00:00<br>
&gt;=C2=A0 =C2=A0 =C2=A02001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandig=
raun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Date: Thu, 4 Sep 2025 10:23:36 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] test/sockopt: loosen verification=
 of stale pidfds<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: David Rheinsberg &lt;<a href=3D"mailto:david=
@readahead.eu" target=3D"_blank">david@readahead.eu</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Newer kernels now properly return stale pidfds fro=
m AF_UNIX sockets,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+rather than refusing the operation. Ensure that ou=
r tests adopt<br>
&gt;=C2=A0 =C2=A0 =C2=A0to this<br>
&gt;=C2=A0 =C2=A0 =C2=A0+and properly verify staleness.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: David Rheinsberg &lt;<a href=3D"mai=
lto:david@readahead.eu" target=3D"_blank">david@readahead.eu</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Backport<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://github.com/bus1/dbus-broker/com=
mit/fd5c6e191bffcf5b3e6c9abb8b0b03479accc04b" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/bus1/dbus-broker/commit/fd5c6e191bffcf5b3e6c9abb=
8b0b03479accc04b</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailt=
o:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ src/util/test-sockopt.c | 16 ++++++++++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 12 insertions(+), 4 deletions(-)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/src/util/test-sockopt.c b/src/util/te=
st-sockopt.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 04148af..eaa8fba 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/src/util/test-sockopt.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/src/util/test-sockopt.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -81,17 +81,25 @@ static void test_peerpidfd_cli=
ent(<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D sockopt_ge=
t_peerpidfd(fd, &amp;pidfd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r !=3D SOCKO=
PT_E_UNSUPPORTED) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (stale) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(r =3D=3D SOCKOPT_E_REAPED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (r =3D=3D SOCKOPT_E_REAPED) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Old kernels refused to return st=
ale<br>
&gt;=C2=A0 =C2=A0 =C2=A0pidfds. Hence,<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in that case verify that we expe=
cted<br>
&gt;=C2=A0 =C2=A0 =C2=A0a stale pidfd.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(stale);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_assert(!r);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_assert(pidfd &gt;=3D 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D proc_resolve_pidfd(pidfd, &a=
mp;pid_socket);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_assert(!r);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(pid_socket &gt; 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(pid_socket =3D=3D pid_server);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stale) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(pid=
_socket =3D=3D -1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(pid=
_socket &gt; 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(pid=
_socket =3D=3D pid_server);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ }<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-core/dbus/dbus-broker/=
run-ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..789000523e<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-core/dbus/dbus-broker/run-pte=
st<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,19 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#!/bin/sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0+RET=3D0<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+run_tests(){<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 for t in *; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if ./$t; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 echo PASS: $t<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 echo FAIL: $t<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 RET=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 done<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+cd /usr/lib/dbus-broker/tests/dbus<br>
&gt;=C2=A0 =C2=A0 =C2=A0+run_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0+cd /usr/lib/dbus-broker/tests/unit<br>
&gt;=C2=A0 =C2=A0 =C2=A0+run_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0+exit $RET<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-core/dbus/<a href=3D"h=
ttp://dbus-broker_37.bb" rel=3D"noreferrer" target=3D"_blank">dbus-broker_3=
7.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dbus-broker_37.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://dbus-broker_37.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-core/dbus/<a href=3D"http://dbus-=
broker_37.bb" rel=3D"noreferrer" target=3D"_blank">dbus-broker_37.bb</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dbus-broker_37.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://dbus-broker_37.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index f0312181b6..c531f555d2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-oe/recipes-core/dbus/<a href=3D"http://d=
bus-broker_37.bb" rel=3D"noreferrer" target=3D"_blank">dbus-broker_37.bb</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dbus-broker_37.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://dbus-broker_37.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-core/dbus/<a href=3D"http://d=
bus-broker_37.bb" rel=3D"noreferrer" target=3D"_blank">dbus-broker_37.bb</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dbus-broker_37.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://dbus-broker_37.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -10,7 +10,10 @@ DEPENDS =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTR=
O_FEATURES&#39;, &#39;selinux&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;libselinux (&gt;=3D 3.2)&#39;, &#39;&#39;, d)}=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://github.com/bus1/dbus-broke=
r/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/bus1/dbus-broker/releases/download/v${PV}/${=
BP}.tar.xz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/bus1/dbus-broker/=
releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$=
%7BBP%7D.tar.xz</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://github.com/bus1/dbus-broke=
r/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/bus1/dbus-broker/releases/download/v${PV}/${=
BP}.tar.xz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/bus1/dbus-broker/=
releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$=
%7BBP%7D.tar.xz</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0file://0001-test-sockopt-loosen-verification-=
of-stale-pidfds.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ru=
n-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;f819a8db8795fa08c767612e3823fd594694a0990f254=
3ecf35d6a1a6bf2ab5b&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https=
://github.com/bus1/$%7BBPN%7D/releases" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/bus1/${BPN}/releases</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/bus1/$%7BBPN%7D/r=
eleases" rel=3D"noreferrer" target=3D"_blank">https://github.com/bus1/$%7BB=
PN%7D/releases</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -18,10 +21,11 @@ UPSTREAM_CHECK_REGEX =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;releases/tag/v(?P&lt;pver&gt;\d+)&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SYSTEMD_SERVICE:${PN} =3D &quot;${BPN}.servic=
e&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-inherit meson pkgconfig systemd features_check<br>
&gt;=C2=A0 =C2=A0 =C2=A0+inherit meson pkgconfig systemd features_check pte=
st<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0EXTRA_OEMESON +=3D &quot;-Daudit=3D${@bb.util=
s.contains(&#39;DISTRO_FEATURES&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;selinux&#39;, &#39;true&#39;, &#39;false&#39;,=
 d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0EXTRA_OEMESON +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dselinux=3D${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;selinux&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;true&#39;, &#39;false&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+EXTRA_OEMESON +=3D &quot;-Dtests=3D${@bb.utils.con=
tains(&#39;PTEST_ENABLED&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;1&#39;, &#39;true&#39;, &#39;false&#39;, d)}&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;systemd&qu=
ot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -36,3 +40,7 @@ RDEPENDS:${PN} +=3D &quot;dbus-co=
mmon dbus-tools&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0FILES:${PN} +=3D &quot;${nonarch_libdir}/syst=
emd/catalog&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0FILES:${PN} +=3D &quot;${systemd_system_unitd=
ir}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0FILES:${PN} +=3D &quot;${systemd_user_unitdir=
}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+FILES:${PN}-ptest +=3D &quot;${libdir}/${PN}/tests=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# test-sockopt fails to compile with musl without =
this flag<br>
&gt;=C2=A0 =C2=A0 =C2=A0+CFLAGS:append:libc-musl =3D &quot;${@bb.utils.cont=
ains(&#39;PTEST_ENABLED&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;1&#39;, &#39; -Wno-error=3Dincompatible-pointe=
r-types &#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#122111):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-devel/message/122111" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/g/openembedded-devel/message/122111</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/116502872/1997914" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/116502872/1997914</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-devel%2=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-devel%252=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel%2Bowner=
@lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000237a590644ad2779--

