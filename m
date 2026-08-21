Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39817C5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:49:31 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1372.1787291360922949166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 22:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jTR8GQqn;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8111c0c7561so10231567b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 22:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787291360; cv=none;
        d=google.com; s=arc-20260327;
        b=RyumCSKduXVNb9NO+CXoDg0EV3C83vB9TReM93DNelEGDNMhlEl2IURdyy3a9DpcT+
         06G6KDSqz8FnP3yokzzxF9FW/ShZ8IOwwFXn5o6PhtxJQQvsBfZAkI6mwYaAFGdgS4We
         t8FHaltLySglYmsdEa8UI0H2oBH2FcA5hJisMO1ABPQ72IDtYqG0EO7AN1Y6Fr+hJPmL
         YkC6X+ESTSYWnF+PqIlfZUB8zCE7vKJH6tdo43Wyq0Y2svyf6Y7S0xXRCSr9lVbkdxiv
         5/vRFRY+qhLOpFyDgFi5kp4JDF31d765crzQnLnognoAKIlikRT6A+SKtiyM9HeclsYP
         t80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WLwWxL2unSZnv9AyOacDBGPZ32sT0OfRFrmGkWQ2htI=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=psS7TNVC2TItEzLD1Li2xZA1cMJRWyIMzS5vPrWJqJu23EGwxgrEPAJ93O8IXIF0GF
         3xigdXgOu7c3s1szKPhAROVKLsnxe3nZe40ry8bnuhhAnvb+8YBXPPd0SF/3clj3+3N6
         /PMEXGr7X65GvazF5EOJmuAs8Y9TEBgCfAt4by2FFdUlDlohppnLvTwrNlW2kP02WUSD
         JfqRuKplV0budinVKBOkxZyHcRLf2lcHZPwjd8SsR/H0pjtXQhK3vnORKmb2Q/WtD4Rz
         aBxwi0FGFeMjSdqro4LBK66kHKM7gaMmpJAdbpgJJBpUxZdUzZxQPtlno7Lp6giQYygR
         bXLg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787291360; x=1787896160; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLwWxL2unSZnv9AyOacDBGPZ32sT0OfRFrmGkWQ2htI=;
        b=jTR8GQqnZWp1v1jpFOKYpAYy+EfRITnwIA6vMgFYkG8h2ChBU29W9MLSyGbo2ipBed
         LZEJggriOg0lf6Ik6uKQoANWYWXE+xo8BsWs8Exc8P57DtAGlHLbYpAZ894qnHdck6AK
         XAuNo++2Ldar3XOEJOVdVB+9z5iu2culJpzJRly4vz9P1CNoUc6qkVEULv98xfK7VD9k
         bE5lq6ScXxojWfjBilInECQ3rbMfwT0BEPdstGg/LW6Gl/0Jwx4ufGiltJEI06mMmZWr
         wV5dYVqSnHuzZDT9+3X0B7bgNjID9tOqc3T4kaMhs4G6MeKY+JBWNz9KR5vkAKkZVn4s
         W7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787291360; x=1787896160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WLwWxL2unSZnv9AyOacDBGPZ32sT0OfRFrmGkWQ2htI=;
        b=cj80oUlx3k4/yEAL31JMueHHGP/+NeY0StSlKn17wtkoQEpLVqMbzsyniET88wID0g
         Wd/xo6r5WdQvDHoMcJLznJqwn0tmIRGWvleERymhrDiiDt5oa2Rb3/kbWKLtIW4JF2/c
         AnCXvq7fZVwAXAysB5/eNaLSygVohG5rggwlczITUTWo0qccAjl7Kj2KT74RTdKXe/v3
         29ctiZ7/7Z3YxdWg8qXtWdcB7SboSlRBp88tk/A++d61+yixF6cT73HLOFvAQMHBIJJv
         NomRN/wwhk0aGfCsHR27XGDTRk8I1dmq5eP+uHB1YTpy0RW5ytPfCt4+NpX9VF2cCC4H
         J0RQ==
X-Gm-Message-State: AFuF++maCZf5gi+HpCJTRXepy5Gp/LU8Nt9EOi5ppqE7TBKrcunl6vT7
	gNQ7L/8Q0+ZVzmCSGmbI7LZvDSdSq4+YJbvGh71hHnKSN7DK784yOAOFSWsUbxE7xGWDEOkM6lf
	Tm4Fapu4kRNKGyEma7DUHDj9RaUoD0OK3fVWTIFw=
X-Gm-Gg: AR+sD13zHHDv0kyTDZKw8OAc1+mVPGHTkncsEJu4vLP+qewWpQkFhgPOHUCIBvHvfdR
	XqkYdwyq6yhZra/gPMUEC2gz2jEOS1s5GxnX8ZamH6HEOZTrXzeo72xJtMdFp4BQtszOMT4HqSh
	Va/dQvCbPhLB3Htvi1triXHLPYrga5ovdw8LHGev/KFqWoGWaw6BH1kHSostf/IidRUSghE/3Cq
	s4oy5WLAT0DT29t3oRNdZ/q3IBaN8YsQGmK5zdKwmYTpd74monEaoPtb/0ZMgSjjqlOuOwxagc0
	Lfv06QJKG6C6tNkngm4WGVYIRxbUx5SUalETbRtVY+XUQx3BDpCujwPR8SP0wT/xJ5++rPAmARp
	5YzW3ua4hUddkWgn+rrsWDiCO5InZlzX0Mtd3bcDxk2NQ5iWkOO8u8u/IEblQqOxMWPD28Q9gEY
	mmhbHQXR8TK2uD7Nu2dg8TPKeJL+vXfoDQZYBFLOMiOj7bMATW5Fr1z3CPAoFeChtUXM2ml5E29
	Ckcqbd7XxnR+w==
X-Received: by 2002:a05:690c:e1c1:20b0:836:ec3d:b5e6 with SMTP id
 00721157ae682-849f5dfebc0mr11312457b3.28.1787291359829; Thu, 20 Aug 2026
 22:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260821002905.1356-1-wangmy@fujitsu.com>
In-Reply-To: <20260821002905.1356-1-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Aug 2026 22:48:52 -0700
X-Gm-Features: AcwNN1V_skUBmbrZESW-T0tXyHqI99jiA3IjOR9_CzSjGzclxz8KaKWhqdyFZW0
Message-ID: <CAMKF1sqMcr8rXfOkRs+CRZ7CYQc5Mw=4NgP6CFRLRGtWoj2Z_A@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v4] pcsc-lite: install systemd system units
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009ce33d0659883234"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 05:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129414

--0000000000009ce33d0659883234
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails on AB again -
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1740/ste=
ps/17/logs/errors

ERROR: pcsc-lite-2.5.1-r0 do_package: QA Issue: pcsc-lite:
Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/user
  /usr/lib/systemd/user/pcscd.service
  /usr/lib/systemd/user/pcscd.socket
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
pcsc-lite: 4 installed and not shipped files. [installed-vs-shipped]

On Thu, Aug 20, 2026 at 5:29=E2=80=AFPM wangmy via lists.openembedded.org <=
wangmy=3D
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
> index ae20447050..08bd17c64d 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
> @@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative
>
>  EXTRA_OEMESON =3D " \
>      -Dlibusb=3Dfalse \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '-Dsystemdunit=3Dsystem', '', d)} \
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
> View/Reply Online (#129394):
> https://lists.openembedded.org/g/openembedded-devel/message/129394
> Mute This Topic: https://lists.openembedded.org/mt/120855399/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009ce33d0659883234
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fails on AB again -=C2=A0<a href=3D"https://autobuilder.yo=
ctoproject.org/valkyrie/#/builders/81/builds/1740/steps/17/logs/errors">htt=
ps://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1740/steps/=
17/logs/errors</a><div><br></div><div>ERROR: pcsc-lite-2.5.1-r0 do_package:=
 QA Issue: pcsc-lite: Files/directories were installed but not shipped in a=
ny package:<br>=C2=A0 /usr/lib/systemd<br>=C2=A0 /usr/lib/systemd/user<br>=
=C2=A0 /usr/lib/systemd/user/pcscd.service<br>=C2=A0 /usr/lib/systemd/user/=
pcscd.socket<br>Please set FILES such that these items are packaged. Altern=
atively if they are unneeded, avoid installing them or delete them within d=
o_install.<br>pcsc-lite: 4 installed and not shipped files. [installed-vs-s=
hipped]<br></div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 20, 2026 at 5:29=E2=80=
=AFPM wangmy via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.or=
g">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailt=
o:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
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
index ae20447050..08bd17c64d 100644<br>
--- a/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a><br>
+++ b/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a><br>
@@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative<br>
<br>
=C2=A0EXTRA_OEMESON =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Dlibusb=3Dfalse \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd=
&#39;, &#39;-Dsystemdunit=3Dsystem&#39;, &#39;&#39;, d)} \<br>
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
View/Reply Online (#129394): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129394" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129394</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120855399/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120855399/1997914</a><br>
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

--0000000000009ce33d0659883234--

