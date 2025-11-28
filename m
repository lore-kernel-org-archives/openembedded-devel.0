Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACBAD116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 19:35:20 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2595.1764358516850681773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 11:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=axJi5jlc;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78a76afeff6so21393457b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 11:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764358516; x=1764963316; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xzgDGu6IVChjKAnLOFyT3RF+SnKzFAwly4AFwzphE0U=;
        b=axJi5jlc72oqq4QG1J/o7xkAW1i4XCvburDSFiF8su1bII90tinHW1RcgfyFiSr+tH
         2nTDYXYqKgZVrA1goPYAAO5ms0LugTAzU/rTk1Y+eJPXuibDBmrVMzk0hQZzcEAV6QNm
         q7ZAx9X9jztYKL90eZ7W74RkeGcdragxAMD39Rj8099LMxKLd2pk7T53TV4IG/6/I7Ln
         uNUz/Y27h+G6PnBP4qqRkmupkwQymzxkPikhj+9mJdVPOA+F0pmN/uEuQxsltv0LE7P6
         avP9q1uhIcmr3FB/Fa4IF5taAK/kh0EXy/Yf0EcJ5vGqAAEU/pBfcjSjY1wqzC+vQ3Jt
         GqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764358516; x=1764963316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzgDGu6IVChjKAnLOFyT3RF+SnKzFAwly4AFwzphE0U=;
        b=iSRkK0Th7VUmjbngxDeMK2n74baYxeOyrZAT6XN4F8HJICVmsdbvpvrTWSPwPEKuCx
         NAjBh6+18Z3AOT8te6LEM+pgpjyGIDoNHtI+htK4xtkvS64xxqmUp/q2Ewpc8gj+EHXG
         4uj2yDgk9/mAv7RGR1U0e0xyjIESJEHPVDg/vr5MMR+aa3izADmayC3KRc4kaPVBh+XN
         GlU6i5awua34eJDV09JaXKuR5DFvlkvrPiU8m3hWdPkEGJYP1RMaJjAIxGq2DTXfIAxo
         40SZSmIG6+4ub7K+ldL3eGacYT3z6of9NnQMWifjz3chSBPjbn0x/t0gAqEaLs47cxSj
         flAA==
X-Gm-Message-State: AOJu0YzP4+ZBzo+ZYQEJajNw63DAXippWeZEVHqT2wiEIHqF7gO62PuH
	zzXLDYS8kKC8Z06Zuge5UdFtK4KjNbD05sbiQza9wKq/hE1qT3UHT9vUk29BNshRovpzRprNnra
	lf8IjWYUQxmcCZJ9J+rO2v+4vfNPNpYM=
X-Gm-Gg: ASbGncvzAyzja7H8YXg+eRnaUKPtrXinHccgpLqxaxiOHSuxh6Ggi4mGLImKMLJIE7m
	JNQ1SukrUeXUsATVY3TXrlMHLsjtCL0Y0ca6RcuEuMy/czhQahxHnEn766D7bnv7uJhrMviUkZ/
	xpKauWPdS/icjUORXaeH7t0HEOUmvMYm6hCtc5L2b16DHxLZCTDkJWtOXySXUCECHmtYuJmyjce
	IwCBGkc4nJlUfxvQBR5vUe6dEj1VADO2Uj6QBBQpWhFwjAiThe7J4RYm264opchQjP9Uzc5jJ3j
	3xaV36EMANcDShCF7Pyardph7UHpS7MCZG4nkySH+T6QgXKlLzC7C0myDO6HEdt503BUJayDGMl
	nRLL7WHkNC96MxFqdc9NDv53RWokpDwFHZvLf3/t/FjRHpPE=
X-Google-Smtp-Source: AGHT+IFsmEou0vlbQNCyvlKV37bFpopkKPh+WloNOUSVCOvwY8CWPJzoSymXh5xOpL6DM7vbO8gwuBIrntI9LUdqmpM=
X-Received: by 2002:a05:690c:620c:b0:786:7434:dd67 with SMTP id
 00721157ae682-78a8b47f7e0mr255295917b3.3.1764358515780; Fri, 28 Nov 2025
 11:35:15 -0800 (PST)
MIME-Version: 1.0
References: <20251127161711.2341194-1-skandigraun@gmail.com> <20251127161711.2341194-2-skandigraun@gmail.com>
In-Reply-To: <20251127161711.2341194-2-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Nov 2025 11:34:47 -0800
X-Gm-Features: AWmQ_bn7Pr0aSHfbQH7pL5G4hymyC4jR7c_dRegIlt2XI4kJCy6tkWQhEGIixZI
Message-ID: <CAMKF1sqGCohP7gPUCtBqmiBdQRfWXfcgRpXthaKHtf4OdGCjwA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] dbus-broker: add ptest support
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096f0cd0644acbac8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 19:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122125

--00000000000096f0cd0644acbac8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

with musl/systemd combo I get

 ERROR: Nothing RPROVIDES 'dbus-broker-ptest' (but
virtual:mcextend:dbus-broker:/srv/build/yoe/
   =E2=86=AA sources/meta-openembedded/meta-oe/recipes-core/images/
meta-oe-image-ptest.bb RDEPENDS on or
   =E2=86=AA otherwise requires it)
   dbus-broker RPROVIDES dbus-broker-ptest but was skipped: using DISTRO
'yoe', which is missing
   =E2=86=AA required DISTRO_FEATURES: 'systemd'
   NOTE: Runtime target 'dbus-broker-ptest' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['dbus-broker-ptest']
   NOTE: Runtime target 'meta-oe-image-ptest-all-dev' is unbuildable,
removing...
   Missing or unbuildable dependency chain was:
['meta-oe-image-ptest-all-dev', 'meta-oe-image-
   =E2=86=AA ptest-dbus-broker', 'dbus-broker-ptest']
   NOTE: Runtime target 'meta-oe-image-ptest-all' is unbuildable,
removing...
   Missing or unbuildable dependency chain was: ['meta-oe-image-ptest-all',
'meta-oe-image-ptest-
   =E2=86=AA dbus-broker', 'dbus-broker-ptest']
   ERROR: Nothing RPROVIDES 'meta-oe-image-ptest-dbus-broker'
   No eligible RPROVIDERs exist for 'meta-oe-image-ptest-dbus-broker'
   NOTE: Runtime target 'meta-oe-image-ptest-dbus-broker' is unbuildable,
removing...
   Missing or unbuildable dependency chain was:
['meta-oe-image-ptest-dbus-broker']

On Thu, Nov 27, 2025 at 8:17=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> It takes less than 30 seconds to execute.
>
> Add a backported patch that fixes a broken test.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>  ...-loosen-verification-of-stale-pidfds.patch | 52 +++++++++++++++++++
>  .../recipes-core/dbus/dbus-broker/run-ptest   | 19 +++++++
>  meta-oe/recipes-core/dbus/dbus-broker_37.bb   | 12 ++++-
>  4 files changed, 82 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verificati=
on-of-stale-pidfds.patch
>  create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index 52ca06ae43..b725c1aa36 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -12,6 +12,7 @@ PTESTS_FAST_META_OE =3D "\
>      cli11 \
>      cmocka \
>      cunit \
> +    dbus-broker \
>      duktape \
>      exiv2 \
>      fuse3 \
> diff --git
> a/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verifica=
tion-of-stale-pidfds.patch
> b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verifica=
tion-of-stale-pidfds.patch
> new file mode 100644
> index 0000000000..fac5be1917
> --- /dev/null
> +++
> b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verifica=
tion-of-stale-pidfds.patch
> @@ -0,0 +1,52 @@
> +From cc7f9da25b103aacbb1595d04af9cb70ef8f43d9 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Thu, 4 Sep 2025 10:23:36 +0200
> +Subject: [PATCH] test/sockopt: loosen verification of stale pidfds
> +
> +From: David Rheinsberg <david@readahead.eu>
> +
> +Newer kernels now properly return stale pidfds from AF_UNIX sockets,
> +rather than refusing the operation. Ensure that our tests adopt to this
> +and properly verify staleness.
> +
> +Signed-off-by: David Rheinsberg <david@readahead.eu>
> +Upstream-Status: Backport [
> https://github.com/bus1/dbus-broker/commit/fd5c6e191bffcf5b3e6c9abb8b0b03=
479accc04b
> ]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + src/util/test-sockopt.c | 16 ++++++++++++----
> + 1 file changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/util/test-sockopt.c b/src/util/test-sockopt.c
> +index 04148af..eaa8fba 100644
> +--- a/src/util/test-sockopt.c
> ++++ b/src/util/test-sockopt.c
> +@@ -81,17 +81,25 @@ static void test_peerpidfd_client(
> +
> +         r =3D sockopt_get_peerpidfd(fd, &pidfd);
> +         if (r !=3D SOCKOPT_E_UNSUPPORTED) {
> +-                if (stale) {
> +-                        c_assert(r =3D=3D SOCKOPT_E_REAPED);
> ++                if (r =3D=3D SOCKOPT_E_REAPED) {
> ++                        /*
> ++                         * Old kernels refused to return stale pidfds.
> Hence,
> ++                         * in that case verify that we expected a stale
> pidfd.
> ++                         */
> ++                        c_assert(stale);
> +                 } else {
> +                         c_assert(!r);
> +                         c_assert(pidfd >=3D 0);
> +
> +                         r =3D proc_resolve_pidfd(pidfd, &pid_socket);
> +                         c_assert(!r);
> +-                        c_assert(pid_socket > 0);
> +
> +-                        c_assert(pid_socket =3D=3D pid_server);
> ++                        if (stale) {
> ++                                c_assert(pid_socket =3D=3D -1);
> ++                        } else {
> ++                                c_assert(pid_socket > 0);
> ++                                c_assert(pid_socket =3D=3D pid_server);
> ++                        }
> +                 }
> +         }
> + }
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
> b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
> new file mode 100644
> index 0000000000..789000523e
> --- /dev/null
> +++ b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +RET=3D0
> +
> +run_tests(){
> +  for t in *; do
> +    if ./$t; then
> +      echo PASS: $t
> +    else
> +      echo FAIL: $t
> +      RET=3D1
> +    fi
> +  done
> +}
> +
> +cd /usr/lib/dbus-broker/tests/dbus
> +run_tests
> +cd /usr/lib/dbus-broker/tests/unit
> +run_tests
> +exit $RET
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
> b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
> index f0312181b6..c531f555d2 100644
> --- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
> @@ -10,7 +10,10 @@ DEPENDS =3D "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux (>=3D
> 3.2)', '', d)} \
>  "
>
> -SRC_URI =3D "
> https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz=
"
> +SRC_URI =3D "
> https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz
> \
> +
>  file://0001-test-sockopt-loosen-verification-of-stale-pidfds.patch \
> +           file://run-ptest \
> +           "
>  SRC_URI[sha256sum] =3D
> "f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/bus1/${BPN}/releases"
> @@ -18,10 +21,11 @@ UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+)=
"
>
>  SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
>
> -inherit meson pkgconfig systemd features_check
> +inherit meson pkgconfig systemd features_check ptest
>
>  EXTRA_OEMESON +=3D "-Daudit=3D${@bb.utils.contains('DISTRO_FEATURES',
> 'selinux', 'true', 'false', d)}"
>  EXTRA_OEMESON +=3D "-Dselinux=3D${@bb.utils.contains('DISTRO_FEATURES',
> 'selinux', 'true', 'false', d)}"
> +EXTRA_OEMESON +=3D "-Dtests=3D${@bb.utils.contains('PTEST_ENABLED', '1',
> 'true', 'false', d)}"
>
>  REQUIRED_DISTRO_FEATURES =3D "systemd"
>
> @@ -36,3 +40,7 @@ RDEPENDS:${PN} +=3D "dbus-common dbus-tools"
>  FILES:${PN} +=3D "${nonarch_libdir}/systemd/catalog"
>  FILES:${PN} +=3D "${systemd_system_unitdir}"
>  FILES:${PN} +=3D "${systemd_user_unitdir}"
> +FILES:${PN}-ptest +=3D "${libdir}/${PN}/tests"
> +
> +# test-sockopt fails to compile with musl without this flag
> +CFLAGS:append:libc-musl =3D "${@bb.utils.contains('PTEST_ENABLED', '1', =
'
> -Wno-error=3Dincompatible-pointer-types ', '', d)}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122111):
> https://lists.openembedded.org/g/openembedded-devel/message/122111
> Mute This Topic: https://lists.openembedded.org/mt/116502872/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000096f0cd0644acbac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">with musl/systemd combo I get<div><br></div><div>=C2=A0ERR=
OR: Nothing RPROVIDES &#39;dbus-broker-ptest&#39; (but virtual:mcextend:dbu=
s-broker:/srv/build/yoe/<br>=C2=A0 =C2=A0=E2=86=AA sources/meta-openembedde=
d/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-image-ptest.bb">met=
a-oe-image-ptest.bb</a> RDEPENDS on or<br>=C2=A0 =C2=A0=E2=86=AA otherwise =
requires it)<br>=C2=A0 =C2=A0dbus-broker RPROVIDES dbus-broker-ptest but wa=
s skipped: using DISTRO &#39;yoe&#39;, which is missing<br>=C2=A0 =C2=A0=E2=
=86=AA required DISTRO_FEATURES: &#39;systemd&#39;<br>=C2=A0 =C2=A0NOTE: Ru=
ntime target &#39;dbus-broker-ptest&#39; is unbuildable, removing...<br>=C2=
=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;dbus-broker-pt=
est&#39;]<br>=C2=A0 =C2=A0NOTE: Runtime target &#39;meta-oe-image-ptest-all=
-dev&#39; is unbuildable, removing...<br>=C2=A0 =C2=A0Missing or unbuildabl=
e dependency chain was: [&#39;meta-oe-image-ptest-all-dev&#39;, &#39;meta-o=
e-image-<br>=C2=A0 =C2=A0=E2=86=AA ptest-dbus-broker&#39;, &#39;dbus-broker=
-ptest&#39;]<br>=C2=A0 =C2=A0NOTE: Runtime target &#39;meta-oe-image-ptest-=
all&#39; is unbuildable, removing...<br>=C2=A0 =C2=A0Missing or unbuildable=
 dependency chain was: [&#39;meta-oe-image-ptest-all&#39;, &#39;meta-oe-ima=
ge-ptest-<br>=C2=A0 =C2=A0=E2=86=AA dbus-broker&#39;, &#39;dbus-broker-ptes=
t&#39;]<br>=C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;meta-oe-image-ptest-d=
bus-broker&#39;<br>=C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;meta-=
oe-image-ptest-dbus-broker&#39;<br>=C2=A0 =C2=A0NOTE: Runtime target &#39;m=
eta-oe-image-ptest-dbus-broker&#39; is unbuildable, removing...<br>=C2=A0 =
=C2=A0Missing or unbuildable dependency chain was: [&#39;meta-oe-image-ptes=
t-dbus-broker&#39;]</div></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 27, 2025 at 8:17=
=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">It takes less than 30 s=
econds to execute.<br>
<br>
Add a backported patch that fixes a broken test.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 1 +<b=
r>
=C2=A0...-loosen-verification-of-stale-pidfds.patch | 52 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-core/dbus/dbus-broker/run-ptest=C2=A0 =C2=A0| 19 +++++++<=
br>
=C2=A0meta-oe/recipes-core/dbus/<a href=3D"http://dbus-broker_37.bb" rel=3D=
"noreferrer" target=3D"_blank">dbus-broker_37.bb</a>=C2=A0 =C2=A0| 12 ++++-=
<br>
=C2=A04 files changed, 82 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-test-so=
ckopt-loosen-verification-of-stale-pidfds.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/run-ptest<br=
>
<br>
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc<br>
index 52ca06ae43..b725c1aa36 100644<br>
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
@@ -12,6 +12,7 @@ PTESTS_FAST_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0cli11 \<br>
=C2=A0 =C2=A0 =C2=A0cmocka \<br>
=C2=A0 =C2=A0 =C2=A0cunit \<br>
+=C2=A0 =C2=A0 dbus-broker \<br>
=C2=A0 =C2=A0 =C2=A0duktape \<br>
=C2=A0 =C2=A0 =C2=A0exiv2 \<br>
=C2=A0 =C2=A0 =C2=A0fuse3 \<br>
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen=
-verification-of-stale-pidfds.patch b/meta-oe/recipes-core/dbus/dbus-broker=
/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch<br>
new file mode 100644<br>
index 0000000000..fac5be1917<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verifi=
cation-of-stale-pidfds.patch<br>
@@ -0,0 +1,52 @@<br>
+From cc7f9da25b103aacbb1595d04af9cb70ef8f43d9 Mon Sep 17 00:00:00 2001<br>
+From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+Date: Thu, 4 Sep 2025 10:23:36 +0200<br>
+Subject: [PATCH] test/sockopt: loosen verification of stale pidfds<br>
+<br>
+From: David Rheinsberg &lt;<a href=3D"mailto:david@readahead.eu" target=3D=
"_blank">david@readahead.eu</a>&gt;<br>
+<br>
+Newer kernels now properly return stale pidfds from AF_UNIX sockets,<br>
+rather than refusing the operation. Ensure that our tests adopt to this<br=
>
+and properly verify staleness.<br>
+<br>
+Signed-off-by: David Rheinsberg &lt;<a href=3D"mailto:david@readahead.eu" =
target=3D"_blank">david@readahead.eu</a>&gt;<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/bus1/dbus-broker/=
commit/fd5c6e191bffcf5b3e6c9abb8b0b03479accc04b" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/bus1/dbus-broker/commit/fd5c6e191bffcf5b3e6c=
9abb8b0b03479accc04b</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ src/util/test-sockopt.c | 16 ++++++++++++----<br>
+ 1 file changed, 12 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/src/util/test-sockopt.c b/src/util/test-sockopt.c<br>
+index 04148af..eaa8fba 100644<br>
+--- a/src/util/test-sockopt.c<br>
++++ b/src/util/test-sockopt.c<br>
+@@ -81,17 +81,25 @@ static void test_peerpidfd_client(<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D sockopt_get_peerpidfd(fd, &amp;pid=
fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r !=3D SOCKOPT_E_UNSUPPORTED) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stale) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c_assert(r =3D=3D SOCKOPT_E_REAPED);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r =3D=3D SOCK=
OPT_E_REAPED) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* Old kernels refused to return stale pidfds. Hence,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* in that case verify that we expected a stale pidfd.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c_assert(stale);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0c_assert(!r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0c_assert(pidfd &gt;=3D 0);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r =3D proc_resolve_pidfd(pidfd, &amp;pid_socket);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0c_assert(!r);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c_assert(pid_socket &gt; 0);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c_assert(pid_socket =3D=3D pid_server);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (stale) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(pid_socket =3D=3D -1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(pid_socket &gt; 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_assert(pid_socket =3D=3D pid_serve=
r);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/run-ptest b/meta-oe/reci=
pes-core/dbus/dbus-broker/run-ptest<br>
new file mode 100644<br>
index 0000000000..789000523e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest<br>
@@ -0,0 +1,19 @@<br>
+#!/bin/sh<br>
+RET=3D0<br>
+<br>
+run_tests(){<br>
+=C2=A0 for t in *; do<br>
+=C2=A0 =C2=A0 if ./$t; then<br>
+=C2=A0 =C2=A0 =C2=A0 echo PASS: $t<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 echo FAIL: $t<br>
+=C2=A0 =C2=A0 =C2=A0 RET=3D1<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 done<br>
+}<br>
+<br>
+cd /usr/lib/dbus-broker/tests/dbus<br>
+run_tests<br>
+cd /usr/lib/dbus-broker/tests/unit<br>
+run_tests<br>
+exit $RET<br>
diff --git a/meta-oe/recipes-core/dbus/<a href=3D"http://dbus-broker_37.bb"=
 rel=3D"noreferrer" target=3D"_blank">dbus-broker_37.bb</a> b/meta-oe/recip=
es-core/dbus/<a href=3D"http://dbus-broker_37.bb" rel=3D"noreferrer" target=
=3D"_blank">dbus-broker_37.bb</a><br>
index f0312181b6..c531f555d2 100644<br>
--- a/meta-oe/recipes-core/dbus/<a href=3D"http://dbus-broker_37.bb" rel=3D=
"noreferrer" target=3D"_blank">dbus-broker_37.bb</a><br>
+++ b/meta-oe/recipes-core/dbus/<a href=3D"http://dbus-broker_37.bb" rel=3D=
"noreferrer" target=3D"_blank">dbus-broker_37.bb</a><br>
@@ -10,7 +10,10 @@ DEPENDS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;se=
linux&#39;, &#39;libselinux (&gt;=3D 3.2)&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/bus1/dbus-broker/releases/=
download/v$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz</=
a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/bus1/dbus-broker/releases/=
download/v$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz</=
a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-sockopt-loosen-v=
erification-of-stale-pidfds.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f819a8db8795fa08c767612e3823fd594694a099=
0f2543ecf35d6a1a6bf2ab5b&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/bus1/$%7BB=
PN%7D/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/bus=
1/${BPN}/releases</a>&quot;<br>
@@ -18,10 +21,11 @@ UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/v(?P&lt;pve=
r&gt;\d+)&quot;<br>
<br>
=C2=A0SYSTEMD_SERVICE:${PN} =3D &quot;${BPN}.service&quot;<br>
<br>
-inherit meson pkgconfig systemd features_check<br>
+inherit meson pkgconfig systemd features_check ptest<br>
<br>
=C2=A0EXTRA_OEMESON +=3D &quot;-Daudit=3D${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;selinux&#39;, &#39;true&#39;, &#39;false&#39;, d)}&quot;=
<br>
=C2=A0EXTRA_OEMESON +=3D &quot;-Dselinux=3D${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;selinux&#39;, &#39;true&#39;, &#39;false&#39;, d)}&quo=
t;<br>
+EXTRA_OEMESON +=3D &quot;-Dtests=3D${@bb.utils.contains(&#39;PTEST_ENABLED=
&#39;, &#39;1&#39;, &#39;true&#39;, &#39;false&#39;, d)}&quot;<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
<br>
@@ -36,3 +40,7 @@ RDEPENDS:${PN} +=3D &quot;dbus-common dbus-tools&quot;<br=
>
=C2=A0FILES:${PN} +=3D &quot;${nonarch_libdir}/systemd/catalog&quot;<br>
=C2=A0FILES:${PN} +=3D &quot;${systemd_system_unitdir}&quot;<br>
=C2=A0FILES:${PN} +=3D &quot;${systemd_user_unitdir}&quot;<br>
+FILES:${PN}-ptest +=3D &quot;${libdir}/${PN}/tests&quot;<br>
+<br>
+# test-sockopt fails to compile with musl without this flag<br>
+CFLAGS:append:libc-musl =3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&=
#39;, &#39;1&#39;, &#39; -Wno-error=3Dincompatible-pointer-types &#39;, &#3=
9;&#39;, d)}&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122111): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122111" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122111</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116502872/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116502872/1997914</a><br>
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

--00000000000096f0cd0644acbac8--

