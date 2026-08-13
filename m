Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC4BC5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 13:54:12 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19608.1786629242820843535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 06:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rcu62ziS;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81dfdbd86d1so21207797b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 06:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786629242; cv=none;
        d=google.com; s=arc-20260327;
        b=GsjPTS7eMoKbkKaZT6FmxYx1iCXYovSsB+VCMVzHq8DHndMPOlt1JKKg8qmo0PCEf4
         L49LVS5VzSKOKSgimjTwoW4YfDAV6BCfzfcIXF0V5UW2BTFVLY4IPaSfuPtUUGYrwibe
         6LXl8IV5vDyu2ZReemGs93UXExHmGtRWfJzHIe/VsraQ8CAD0kKPD5jHgdR1AIdy796h
         hVT1vQ+8YP1Bo/+Qk34Qvx88dCVxU4kwgvaoBt44MS4cCzP+K4pQBOJDvuRP/RvywmAC
         El2PZqfhe5yeGif2EAqbNgmBjsy/Q+D5ylnc0sv36IMYiYSd41fDdKgUWS+k65BuV9YN
         d/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JVP6+0nolDBsIhSD4L9Lb7RItQu2tb1jyW4vGsqLMuI=;
        fh=Ob7CXPPKhPpq9HG5k6uo2txlkIdlvlC4WFdsx/zQctE=;
        b=DLQGwrh1fEO6S559AxJiIzKg3T9L7mUflxSIYKnCSVLftXOZh+MC/wcT2CzpQ42Fm+
         Ka2fUxNDkUsZ6oVzs46CBJGf5eEyKEWEFIhZSWzyvxR+Vk5c39bEcBfIwJg3/uYKWvRl
         bWiNYKduhYgy0o0A3NdGfnebCfhSgC+OJ2Sa6D0EyICpRjQoXvjl7xbRIUVdFOtYSlQ9
         LGNAaVcBFcJDXjFZ4dzTweoicwD6TsyIcV3AlpIG2iW3M1xXQjpfr1DzHLEMY3jCglSo
         s5smnXGfu+4p5RRt22zVsGBV51B1XmWnPwtKQ635gyrZZzQtA1UCU0wKiS90hIzCJBMO
         Y75Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629242; x=1787234042; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVP6+0nolDBsIhSD4L9Lb7RItQu2tb1jyW4vGsqLMuI=;
        b=Rcu62ziSBv0aDK/AfFLMNIzW4eIrKTRxPq0bxQlUW42Rfh7ZV9+pCc5wcruYlVy1sD
         G1LZFKK25mHNR9bdxijqvyBi82Yq3vfYb6EbGWkcZReagXyAouiHsrzS8c/EHGxPkKti
         ujgduY0mUVArgq9SJtDAa6qFFyDjDqxvwlPixvSPQ8By6Aa/SxgppOLf73WZywv5ACwQ
         N8iGeTxctKi/Cixr24W6bT/CSB32TMXbrrJqPwwJuvKaPJcAWJ38DgyInYGcAKZhbOtV
         bDzopsi2cir1ERP5GuOpUtJu5MRTkKOdf2b4QG9BGOWAL9rQ8awLIQMj9yfb+tXBL5dS
         PXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629242; x=1787234042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JVP6+0nolDBsIhSD4L9Lb7RItQu2tb1jyW4vGsqLMuI=;
        b=sYPncArR6irk9kT2ojbznAUW/qnblJWctrQsDd/xXCjShQrQUFad7xtT2zIOomOJZy
         PaRODzZGGhvmBO9eksRmttXr/lUvcVRtQMiEp1tkHUmML4IYqXkyTFY88zNjOxn/KzdF
         V3hPvgVR5u/hNeuS7fzKJmvOMiQGVx/SsiE3cyif5E+XsA5dmceWxkxdJ7dKpa163KNg
         ID0AajWerWqOwP6Ib+PSSA8XNvxZdiJfociBnJm1tuK/G91jZ15u9My8Cptjo1BSs6s8
         4Gumrp5RzlrIQspmfR3NDXQ3WzthQw4YbKZSdGalkr/JdhoPsTaNp8uilz8hIbG0VesQ
         joww==
X-Gm-Message-State: AOJu0Yws/08IyuacszmVKdCs3iNi5zzXgAevfHQp6oQVjIe4O79eKKfB
	3uGqvab7Tey1NKEHAey+RI/KXEwnBafWYEHMhbSfo5YGuzOHX/w3O/Q860QezOG2VGXU7fiAvJ4
	wL/Ov4i4CifnD5qZRkR+tkQIZfKhrmj/Wznn/QXc=
X-Gm-Gg: AR+sD13saRkeA2z04gFSsTksQ/dTq2N9LVwjca6uwOoso9oIwUXB/5Kof90hOhbv9DH
	eu7sEkFTpWD0S+6vrljb5ydhmMdb8fmriq8F4tFnqkcqaSLrsF0f6/gv9jMRtl2O8zicWqualaH
	B70pAge97bhIZnkSMmIG7PUB8Iz+vYj58lOX59wzgvCuDwH6tIkNEETojn7VWSnapiFZZnxcV7o
	X8JaOywuFYlejGpWscTxIj2sgEyzupO9ouE2Vtx8YeUAeYIwQ7pdf5GyzdKcpi45hMmZVPpGP/z
	+MyeoRqibg2PwWKNLcnyN/O7q/ahHRQtXgegyl7RAJW1kUTf8XjXicCXU5XYLJyKW9M4toVP+u6
	LXfVAN/oedyzPyvkPBTDCYQ9Cvi+NfQVmWIKJj+skLyrnCLxKyLCxiuU4N0VOIceJh0AnNlLyiy
	SKH74Y7ubapf65+CV27pe1Utt0jXC9s3B1q0eHVkiHEzNwKdBlksW0U7XCR9cu15s4PmlFBsrWx
	Gy8atZT48gK6Q==
X-Received: by 2002:a05:690c:e1d7:10b0:81d:a1e5:a4d7 with SMTP id
 00721157ae682-83470f61d2amr21845957b3.5.1786629241535; Thu, 13 Aug 2026
 06:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260811072523.3463118-1-james@codeconstruct.com.au>
In-Reply-To: <20260811072523.3463118-1-james@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 06:53:35 -0700
X-Gm-Features: AUfX_myoICv0K38YZLxsKjQZxNe77R-NP1qkDC53FxfoFQZMat3Wy1rsGzuLcPw
Message-ID: <CAMKF1srwt1jwqqCsvqOuO+2BpZsADa7N0R7Sz10HOctHaiCsUg@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH v2 1/2] mctp: split mctp tools and
 mctpd into separate recipes
To: james@codeconstruct.com.au
Cc: openembedded-devel@lists.openembedded.org, andrew@codeconstruct.com.au, 
	jk@codeconstruct.com.au
Content-Type: multipart/alternative; boundary="000000000000497dec0658ee09e4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128941

--000000000000497dec0658ee09e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can we do something like
inherit_defer ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'useradd',
'', d)}

On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via lists.openembedded.o=
rg
<james=3Dcodeconstruct.com.au@lists.openembedded.org> wrote:

> The current mctp recipe relies on the upstream's conditional build and
> install of the mctpd binary if systemd is present, only building the
> mctp utility otherwise. Future upstream changes allowing running as
> non-root require more control over the build process. We will need to
> add a new system user when mctpd is built.
>
> Adding a user requires inheriting useradd, which assumes at least one
> user will be created, failing the recipe otherwise. Building without
> mctpd would then cause the recipe to fail as conditionally inheriting
> useradd seems infeasible.
>
> To make useradd available for the new upstream release, split the recipe
> into "mctp" for the utilities and "mctpd" for the daemon, isolating the
> systemd dependency to "mctpd".
>
> This makes the two parts of the source explicitly selectable from user
> choice, rather than auto-detecting based on the presence of systemd. It
> will also let us express the useradd rules only when they're needed for
> the mctpd installation in the upcoming version bump.
>
> Signed-off-by: James Lee james@codeconstruct.com.au
> ---
>  meta-networking/recipes-support/mctp/mctp.inc | 11 +++++
>  .../recipes-support/mctp/mctp_2.5.bb          | 46 ++-----------------
>  .../recipes-support/mctp/mctpd_2.5.bb         | 28 +++++++++++
>  3 files changed, 42 insertions(+), 43 deletions(-)
>  create mode 100644 meta-networking/recipes-support/mctp/mctp.inc
>  create mode 100644 meta-networking/recipes-support/mctp/mctpd_2.5.bb
>
> diff --git a/meta-networking/recipes-support/mctp/mctp.inc
> b/meta-networking/recipes-support/mctp/mctp.inc
> new file mode 100644
> index 0000000000..98225cffea
> --- /dev/null
> +++ b/meta-networking/recipes-support/mctp/mctp.inc
> @@ -0,0 +1,11 @@
> +HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> +SECTION =3D "net"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
> +
> +SRC_URI =3D "git://
> github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}
> <http://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=
=3Dv$%7BPV%7D>
> "
> +SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> +
> +inherit meson pkgconfig
> +
> +EXTRA_OEMESON =3D "-Dtests=3Dfalse"
> diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> index a8787d3f2b..5811495c66 100644
> --- a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> @@ -1,45 +1,5 @@
> -SUMMARY =3D "Management Component Control Protocol utilities"
> -HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> -SECTION =3D "net"
> -LICENSE =3D "GPL-2.0-only"
> +require mctp.inc
>
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
> +SUMMARY =3D "Management Component Transport Protocol (MCTP) utilities"
>
> -SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> -
> -SRC_URI =3D "git://
> github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}
> <http://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=
=3Dv$%7BPV%7D>
> "
> -
> -
> -inherit meson pkgconfig systemd
> -
> -EXTRA_OEMESON =3D " \
> -    -Dtests=3Dfalse \
> -"
> -
> -PACKAGECONFIG ??=3D " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> -"
> -
> -# mctpd will only be built if pkg-config detects libsystemd; in which ca=
se
> -# we'll want to declare the dep and install the service.
> -PACKAGECONFIG[systemd] =3D ",,systemd,libsystemd"
> -SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-local.target"
> -SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
> -
> -do_install:append () {
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false',
> d)}; then
> -        install -d ${D}${systemd_system_unitdir}
> -        install -m 0644 ${S}/conf/mctpd.service \
> -                ${D}${systemd_system_unitdir}/mctpd.service
> -        install -m 0644 ${S}/conf/*.target \
> -                ${D}${systemd_system_unitdir}/
> -        install -d ${D}${datadir}/dbus-1/system.d
> -        install -m 0644 ${S}/conf/mctpd-dbus.conf \
> -                ${D}${datadir}/dbus-1/system.d/mctpd.conf
> -    fi
> -}
> -
> -FILES:${PN} +=3D " \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> -            '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
> -"
> +MESON_TARGET =3D "mctp mctp-client"
> diff --git a/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> new file mode 100644
> index 0000000000..f049be646b
> --- /dev/null
> +++ b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> @@ -0,0 +1,28 @@
> +require mctp.inc
> +
> +SUMMARY =3D "Management Component Transport Protocol (MCTP) control
> protocol daemon"
> +
> +inherit systemd
> +
> +do_install:append () {
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${S}/conf/mctpd.service \
> +            ${D}${systemd_system_unitdir}/mctpd.service
> +    install -m 0644 ${S}/conf/*.target \
> +            ${D}${systemd_system_unitdir}/
> +    install -d ${D}${datadir}/dbus-1/system.d
> +    install -m 0644 ${S}/conf/mctpd-dbus.conf \
> +            ${D}${datadir}/dbus-1/system.d/mctpd.conf
> +}
> +
> +SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-local.target"
> +
> +DEPENDS +=3D "systemd"
> +
> +# Meson adds mctp utility binaries to FILES and do_install(), which
> cannot be
> +# overriden by MESON_TARGET. Override FILES and remove binaries to
> correct.
> +FILES:${PN} =3D "${datadir}/dbus-1/system.d/mctpd.conf ${sbindir}/mctpd"
> +
> +do_install:append () {
> +    rm -r ${D}${bindir}
> +}
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128922):
> https://lists.openembedded.org/g/openembedded-devel/message/128922
> Mute This Topic: https://lists.openembedded.org/mt/120698532/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000497dec0658ee09e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can we do something like=C2=A0<div>inherit_defer ${@bb.uti=
ls.contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;useradd&#39;=
, &#39;&#39;, d)}</div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 11, 2026 at 12:25=
=E2=80=AFAM James Lee via <a href=3D"http://lists.openembedded.org">lists.o=
penembedded.org</a> &lt;james=3D<a href=3D"mailto:codeconstruct.com.au@list=
s.openembedded.org">codeconstruct.com.au@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The current =
mctp recipe relies on the upstream&#39;s conditional build and<br>
install of the mctpd binary if systemd is present, only building the<br>
mctp utility otherwise. Future upstream changes allowing running as<br>
non-root require more control over the build process. We will need to<br>
add a new system user when mctpd is built.<br>
<br>
Adding a user requires inheriting useradd, which assumes at least one<br>
user will be created, failing the recipe otherwise. Building without<br>
mctpd would then cause the recipe to fail as conditionally inheriting<br>
useradd seems infeasible.<br>
<br>
To make useradd available for the new upstream release, split the recipe<br=
>
into &quot;mctp&quot; for the utilities and &quot;mctpd&quot; for the daemo=
n, isolating the<br>
systemd dependency to &quot;mctpd&quot;.<br>
<br>
This makes the two parts of the source explicitly selectable from user<br>
choice, rather than auto-detecting based on the presence of systemd. It<br>
will also let us express the useradd rules only when they&#39;re needed for=
<br>
the mctpd installation in the upcoming version bump.<br>
<br>
Signed-off-by: James Lee <a href=3D"mailto:james@codeconstruct.com.au" targ=
et=3D"_blank">james@codeconstruct.com.au</a><br>
---<br>
=C2=A0meta-networking/recipes-support/mctp/mctp.inc | 11 +++++<br>
=C2=A0.../recipes-support/mctp/<a href=3D"http://mctp_2.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">mctp_2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 46 ++-----------------<br>
=C2=A0.../recipes-support/mctp/<a href=3D"http://mctpd_2.5.bb" rel=3D"noref=
errer" target=3D"_blank">mctpd_2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 28 +++++++++++<br>
=C2=A03 files changed, 42 insertions(+), 43 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/mctp/mctp.inc<br>
=C2=A0create mode 100644 meta-networking/recipes-support/mctp/<a href=3D"ht=
tp://mctpd_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br=
>
<br>
diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-networkin=
g/recipes-support/mctp/mctp.inc<br>
new file mode 100644<br>
index 0000000000..98225cffea<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/mctp/mctp.inc<br>
@@ -0,0 +1,11 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.github.com/CodeConstruct/mctp" re=
l=3D"noreferrer" target=3D"_blank">http://www.github.com/CodeConstruct/mctp=
</a>&quot;<br>
+SECTION =3D &quot;net&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc=
61db21&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/CodeConstruct/mctp;br=
anch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=
=3Dv${PV}</a>&quot;<br>
+SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad917e46652b272&quot;<br>
+<br>
+inherit meson pkgconfig<br>
+<br>
+EXTRA_OEMESON =3D &quot;-Dtests=3Dfalse&quot;<br>
diff --git a/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.=
5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a> b/meta-networkin=
g/recipes-support/mctp/<a href=3D"http://mctp_2.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mctp_2.5.bb</a><br>
index a8787d3f2b..5811495c66 100644<br>
--- a/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.5.bb" r=
el=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
+++ b/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.5.bb" r=
el=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
@@ -1,45 +1,5 @@<br>
-SUMMARY =3D &quot;Management Component Control Protocol utilities&quot;<br=
>
-HOMEPAGE =3D &quot;<a href=3D"http://www.github.com/CodeConstruct/mctp" re=
l=3D"noreferrer" target=3D"_blank">http://www.github.com/CodeConstruct/mctp=
</a>&quot;<br>
-SECTION =3D &quot;net&quot;<br>
-LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+require mctp.inc<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc=
61db21&quot;<br>
+SUMMARY =3D &quot;Management Component Transport Protocol (MCTP) utilities=
&quot;<br>
<br>
-SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad917e46652b272&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/CodeConstruct/mctp;br=
anch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=
=3Dv${PV}</a>&quot;<br>
-<br>
-<br>
-inherit meson pkgconfig systemd<br>
-<br>
-EXTRA_OEMESON =3D &quot; \<br>
-=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
-&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot; \<br>
-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#=
39;, d)} \<br>
-&quot;<br>
-<br>
-# mctpd will only be built if pkg-config detects libsystemd; in which case=
<br>
-# we&#39;ll want to declare the dep and install the service.<br>
-PACKAGECONFIG[systemd] =3D &quot;,,systemd,libsystemd&quot;<br>
-SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.service mctp.target mctp-local.targe=
t&quot;<br>
-SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;enable&quot;<br>
-<br>
-do_install:append () {<br>
-=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;system=
d&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd.service \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_syst=
em_unitdir}/mctpd.service<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/*.target \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_syst=
em_unitdir}/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${datadir}/dbus-1/system.d<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd-dbus.conf \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${datadir}/dbu=
s-1/system.d/mctpd.conf<br>
-=C2=A0 =C2=A0 fi<br>
-}<br>
-<br>
-FILES:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd=
&#39;, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;${datadir}/dbus-1/system.d/=
mctpd.conf&#39;, &#39;&#39;, d)} \<br>
-&quot;<br>
+MESON_TARGET =3D &quot;mctp mctp-client&quot;<br>
diff --git a/meta-networking/recipes-support/mctp/<a href=3D"http://mctpd_2=
.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a> b/meta-network=
ing/recipes-support/mctp/<a href=3D"http://mctpd_2.5.bb" rel=3D"noreferrer"=
 target=3D"_blank">mctpd_2.5.bb</a><br>
new file mode 100644<br>
index 0000000000..f049be646b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/mctp/<a href=3D"http://mctpd_2.5.bb" =
rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
@@ -0,0 +1,28 @@<br>
+require mctp.inc<br>
+<br>
+SUMMARY =3D &quot;Management Component Transport Protocol (MCTP) control p=
rotocol daemon&quot;<br>
+<br>
+inherit systemd<br>
+<br>
+do_install:append () {<br>
+=C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_system_unitdir}/mc=
tpd.service<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/conf/*.target \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_system_unitdir}/<b=
r>
+=C2=A0 =C2=A0 install -d ${D}${datadir}/dbus-1/system.d<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd-dbus.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${datadir}/dbus-1/system.d/m=
ctpd.conf<br>
+}<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.service mctp.target mctp-local.targe=
t&quot;<br>
+<br>
+DEPENDS +=3D &quot;systemd&quot;<br>
+<br>
+# Meson adds mctp utility binaries to FILES and do_install(), which cannot=
 be<br>
+# overriden by MESON_TARGET. Override FILES and remove binaries to correct=
.<br>
+FILES:${PN} =3D &quot;${datadir}/dbus-1/system.d/mctpd.conf ${sbindir}/mct=
pd&quot;<br>
+<br>
+do_install:append () {<br>
+=C2=A0 =C2=A0 rm -r ${D}${bindir}<br>
+}<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128922): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128922" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128922</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120698532/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120698532/1997914</a><br>
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

--000000000000497dec0658ee09e4--

