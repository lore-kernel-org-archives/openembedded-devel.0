Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255C2C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 15:51:53 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46127.1785772307194753273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 08:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qDhCJn86;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66896892b6cso4601032d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 08:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785772306; cv=none;
        d=google.com; s=arc-20260327;
        b=JGUM3oivCFLZTxUSbliDeLG9jSGSqcHEGQsxc7foS2/ZbqdcGv9pb3Nipj8Q7UT4Xu
         SM9ONvqa7nUawKCXao9JGH2mD19barRdHm5hDAMf+r+Pf4EnlApgkPJFtUb7Fbw2YTXj
         86Jdma0KV+qHTQivAJhkTyRhLhoCnGxv00d9UYSH3IKrnueAqPRmz+yhhknQ8u5pG8Jz
         eGvLISQySDJ+wy8x2yEDOKz9gaoOj6XboziVDiJyJqCXeKgiWxPeq5j6hxYvPYdQxUtK
         2vaEswAxX6L4wClShLLOMuBNFHWAB+G1cMYPcNiHJ2+P2q9WZx5psh58pMTk0jahqPHV
         Q1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pf1jopxZCi7+BxmWrJqN4iAp1F2a0EDNMvmzyc4tGcY=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=p2IFzzOCtDVs5ZDoNrQfil12ldvVS/FJNwzFVQBW6eQXmkd2BoCh9GvnvgTHxMFOxq
         vb341fsK0vyi+3eyXrt/WXVm5wKdTS20X6eKx9oh/EHoFR0DVlti1Ozpm1kl8aW4Jtoe
         Knq/mhaMNTilj91s6ItzAWgeVNpNvPUgeIPXDNB2oSt82EjceXDJMjUVcUQq9+wGIcNr
         XlPmdT+JymsI9PtR3bsI4L2kPnbxfxGl0zC6bcFoo4OpVhx4nMowCOXXv4ZpotJmMo23
         oFvJ9jU93V1wD/sm98EX+0upfCr/RjmAYE0L5ZtvpkUA/HOea4T6ZUFKmr9a0whSWbOD
         otNA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785772306; x=1786377106; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pf1jopxZCi7+BxmWrJqN4iAp1F2a0EDNMvmzyc4tGcY=;
        b=qDhCJn86W3lpw7AP8yw/XOFclE+YKJtTGlBeK8tJBtTuAcwwD3GRrAjNjt9uQhMA+O
         PudE7h22G96oBYIiph8Gp8CETPxz+IOe24qFrpQAx1ZgCNsAslp/he2xecFfISxFersb
         v7ds6zOQoBpQfjSGV1YW97gZARVb7an5z5Hh3HB3rCsq4B5ahc01sTPwTbdBA+fc2Rzf
         okP6Uc4HHuZtvQNxPAXjpG75DGHAR3z47wHV6YTFV8l7IBIERm8fDYN1FfAt5/CwpDHX
         PudNN1XkRIS/Dli4+R4mrcdkf9YH2p7v+H7YNoPG39MEigVpXoKbxAZy5K6ACFsYmF3q
         VvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772306; x=1786377106;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pf1jopxZCi7+BxmWrJqN4iAp1F2a0EDNMvmzyc4tGcY=;
        b=H/jDm+OeAvGW1C5b7htn9SCBCjZs14Q4wil7acDio+RUUuwi0B6VD4bKWZkec25ul8
         LGg5hhD8vAInWqyToS7N2+JbpkpG51flmxRhVpev3SUYdWqZKW5ykDp2WGe1Xo4lMrh+
         VimwErRShxSyhtoHIBnbpzrS6/MOw8PCIu2k2MR48cbI91hoYXbHQX+JHC2ujYdd0IIX
         XN862xgFz8QAQGJoQnF845pKs78s5KvQT3z3rYWEP3uguXdLT/JAN5J0YDHsiLHfxcEp
         Io5B/jbddIBSpC79dzKH/5i4I0YIiGj4zOzjgfVdDKMJshqU1DYzMLN1QU4cVyUYRWgd
         k52A==
X-Gm-Message-State: AOJu0Yxdjd92Ll73dP+eDWaO5S4pKQASwf9P4GcETBVDVFVhWFwj37UV
	a325fK+P45i4WqeNXh0QwiQokXgitvVZbgL0NiZNSvVRiH8UGX4pQ7fEs5d+kdzpW2dCdYSEk2T
	1DFaxoCagiOMkxkEWGZhQ6/CZVMcUMSMmNT47qlI=
X-Gm-Gg: AR+sD10mgQovSQ4uH7pgbkdlNyy5et1PCtooL78qlyDFpniDbnxZFYNs8Cx9oNcf3/l
	UUizOzzikUiu3I4Fa3on6BUcgv7lOb14N/2x5K0C86kY+yBLRBWqkC1COMqHbYl6oJDsm2H1rZ5
	iS12DJx63PxpVJXD+iowOSHQu92dGNnHYLQu/jY564A6KT4y5rRBY4/iyn3cSc1wAK37DSprrvt
	VO+q2Y6MtqSI8uI916AiMy7+IBOp5u2WLsREuD+9OMewJRhraJ0wA7JT5juNuPhw2RsDKeQntMb
	+S3RWBVhuU7I9/lcoinxhIKaQO4IEnrg4f0HB6hH7HVYB7LNvyx8sxkRG/J4YXK9jgcQ0vw3re8
	y2eD33U4KwwUv1MskpnU0tJ7piKEGP+rE8prqmBN273sC3d76by2/hdVR7M87X8N126VTc1EH/h
	H+vQhjEtNyttVSqk8zKUkfWCdkGf2QS0cEGUL8CYeXOQ==
X-Received: by 2002:a53:b54e:0:b0:668:8b09:bd13 with SMTP id
 956f58d0204a3-6694f04b85bmr9574152d50.18.1785772305953; Mon, 03 Aug 2026
 08:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260803031401.316-1-wangmy@fujitsu.com>
In-Reply-To: <20260803031401.316-1-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Aug 2026 08:51:19 -0700
X-Gm-Features: AUfX_myfcdD-AArys-sYhErdOIQa41vLyWltjoAoAOJt0q7hWoAcZcZUoNWHHTw
Message-ID: <CAMKF1sog7XDTK4cMyqO1WJmDTvBL5n+B6StXj67H-cZRQi6gAg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] pcsc-lite: install systemd system units
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f23885065826833a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 15:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128693

--000000000000f23885065826833a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing this now

ERROR: pcsc-lite-2.5.1-r0 do_package: QA Issue: pcsc-lite:
Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/pcscd.service
  /usr/lib/systemd/system/pcscd.socket
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
pcsc-lite: 4 installed and not shipped files. [installed-vs-shipped]


On Sun, Aug 2, 2026 at 8:14=E2=80=AFPM wangmy via lists.openembedded.org <w=
angmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> pcsc-lite 2.5.0 defaults to installing systemd user units, which leaves t=
he
> package without a system-level pcscd.service while SYSTEMD_SERVICE still
> enables pcscd.socket. On target systems this makes systemctl status pcscd
> fail, and systemctl --user start pcscd can fail because the user unit
> requires polkit.service from the user manager.
>
> Select upstream Meson systemdunit=3Dsystem so pcscd.service and pcscd.soc=
ket
> are installed as system units. Keep upstream sysusers.d packaging so
> systemd-sysusers can create the pcscd system user required by the
> generated service and socket units.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
> b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
> index ae20447050..bf0b45dd14 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
> @@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative
>
>  EXTRA_OEMESON =3D " \
>      -Dlibusb=3Dfalse \
> +    -Dsystemdunit=3Dsystem \
>      -Dusbdropdir=3D${libdir}/pcsc/drivers \
>  "
>
> @@ -38,7 +39,10 @@ RPROVIDES:${PN}:append:class-native =3D "
> pcsc-lite-lib-native"
>
>  FILES:${PN} =3D "${sbindir}/pcscd \
>                 ${datadir}/polkit-1 \
> -               ${nonarch_libdir}/systemd/user \
> +               ${systemd_system_unitdir}/pcscd.service \
> +               ${systemd_system_unitdir}/pcscd.socket \
> +               ${libdir}/sysusers.d \
> +               ${exec_prefix}/sysusers.d \
>                 ${sysconfdir}/default/pcscd"
>  FILES:${PN}-lib =3D "${libdir}/libpcsclite*${SOLIBS}"
>  FILES:${PN}-dev =3D "${includedir} \
> @@ -54,12 +58,6 @@ FILES:${PN}-spy-dev =3D "${libdir}/libpcscspy.la \
>
>  do_install:append() {
>      rm -rf ${D}${datadir}/metainfo
> -    # pcsc-lite installs pcscd-sysusers.conf into systemd's sysusersdir
> when
> -    # the systemd pkg-config variable is available (${libdir}/sysusers.d=
),
> -    # and falls back to ${exec_prefix}/sysusers.d otherwise. Drop both s=
o
> the
> -    # file is not left unpackaged (installed-vs-shipped QA).
> -    rm -rf ${D}${libdir}/sysusers.d
> -    rm -rf ${D}${exec_prefix}/sysusers.d
>  }
>
>  RPROVIDES:${PN} +=3D "${PN}-systemd"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128672):
> https://lists.openembedded.org/g/openembedded-devel/message/128672
> Mute This Topic: https://lists.openembedded.org/mt/120572332/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f23885065826833a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">seeing this now<div><br></div><div><pre style=3D"color:rgb=
(0,0,0);white-space:pre-wrap">ERROR: pcsc-lite-2.5.1-r0 do_package: QA Issu=
e: pcsc-lite: Files/directories were installed but not shipped in any packa=
ge:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/pcscd.service
  /usr/lib/systemd/system/pcscd.socket
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
pcsc-lite: 4 installed and not shipped files. [installed-vs-shipped]</pre><=
/div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sun, Aug 2, 2026 at 8:14=E2=80=AFPM wangmy vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujits=
u.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
pcsc-lite 2.5.0 defaults to installing systemd user units, which leaves the=
<br>
package without a system-level pcscd.service while SYSTEMD_SERVICE still<br=
>
enables pcscd.socket. On target systems this makes systemctl status pcscd<b=
r>
fail, and systemctl --user start pcscd can fail because the user unit<br>
requires polkit.service from the user manager.<br>
<br>
Select upstream Meson systemdunit=3Dsystem so pcscd.service and pcscd.socke=
t<br>
are installed as system units. Keep upstream sysusers.d packaging so<br>
systemd-sysusers can create the pcscd system user required by the<br>
generated service and socket units.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a> | 12 +++++--=
-----<br>
=C2=A01 file changed, 5 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_=
2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a> b/met=
a-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.bb" rel=3D=
"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a><br>
index ae20447050..bf0b45dd14 100644<br>
--- a/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a><br>
+++ b/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a><br>
@@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative<br>
<br>
=C2=A0EXTRA_OEMESON =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Dlibusb=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dsystemdunit=3Dsystem \<br>
=C2=A0 =C2=A0 =C2=A0-Dusbdropdir=3D${libdir}/pcsc/drivers \<br>
=C2=A0&quot;<br>
<br>
@@ -38,7 +39,10 @@ RPROVIDES:${PN}:append:class-native =3D &quot; pcsc-lite=
-lib-native&quot;<br>
<br>
=C2=A0FILES:${PN} =3D &quot;${sbindir}/pcscd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/polkit-1=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_libdir}/s=
ystemd/user \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_system_un=
itdir}/pcscd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_system_un=
itdir}/pcscd.socket \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/sysusers.=
d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${exec_prefix}/sysu=
sers.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/defau=
lt/pcscd&quot;<br>
=C2=A0FILES:${PN}-lib =3D &quot;${libdir}/libpcsclite*${SOLIBS}&quot;<br>
=C2=A0FILES:${PN}-dev =3D &quot;${includedir} \<br>
@@ -54,12 +58,6 @@ FILES:${PN}-spy-dev =3D &quot;${libdir}/<a href=3D"http:=
//libpcscspy.la" rel=3D"noreferrer" target=3D"_blank">libpcscspy.la</a> \<b=
r>
<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${D}${datadir}/metainfo<br>
-=C2=A0 =C2=A0 # pcsc-lite installs pcscd-sysusers.conf into systemd&#39;s =
sysusersdir when<br>
-=C2=A0 =C2=A0 # the systemd pkg-config variable is available (${libdir}/sy=
susers.d),<br>
-=C2=A0 =C2=A0 # and falls back to ${exec_prefix}/sysusers.d otherwise. Dro=
p both so the<br>
-=C2=A0 =C2=A0 # file is not left unpackaged (installed-vs-shipped QA).<br>
-=C2=A0 =C2=A0 rm -rf ${D}${libdir}/sysusers.d<br>
-=C2=A0 =C2=A0 rm -rf ${D}${exec_prefix}/sysusers.d<br>
=C2=A0}<br>
<br>
=C2=A0RPROVIDES:${PN} +=3D &quot;${PN}-systemd&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128672): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128672" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128672</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120572332/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120572332/1997914</a><br>
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

--000000000000f23885065826833a--

