Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16766C5516F
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 17:59:12 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2159.1785520745310354484
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 10:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bWl5LUcr;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6682259cae6so1254202d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 10:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785520744; cv=none;
        d=google.com; s=arc-20260327;
        b=NetUqPOYsJleJi8oyxjbfAdBMimBixN8rCjZTscKPUdUxcRAHsXxDKYDIqNHH1xvul
         Ht57/1a5sD9OPKY5/wRof/96XE1xCtrMxVO/48VlCgr2AX0gduejeWdQAvX+EwDmAYJj
         JfywGUryhMzWJ2sgiQMIu6gktlOfhAdwQXpSJlS2n6FALXmDgVbw7Ekom6GgnNZjIr6o
         s1dYEe70CxNVnwc2f6NA0rO1q2PRqDLC4bDDGyLJZRKLkzvTueCjpP4TSLHBsgxLesZT
         DZWMZ5k0OCEZSrfvSYGGfd3Phug8NyOUvaafBEPsXOyMM3zYq3d7T6xWGXrehhMuftlX
         R18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7VY2ln+jLO97w5E9lF6AQKb/PH3HPjE6f3OzEh7emks=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=f5y2gVRaSJdIts82GoEATnZA4yYwik9LnuQ20rNT30MsRVAjc/xDjKcKKnX6awLLnt
         CaL4DXHnaQSj2rVJEQZ5lzeXOyb5u5naB9XqICPsDnq1Xk7CqK3NDEtdGkwFqQtXFkZm
         B4g8NrNhBcFq5RbV1KACT4AWaOZPVWxUspxpT2UgBkr7DOJcR0xEqW3JbTQz17BZjwhX
         YFXEsv09I/2hJqyVfpVbDHVPHNOdXFDk/bebCmOumv1g0HOtopcfiJs/CT89o2jg8Bwl
         s0N7t+WKuappN8hSlYva1gzq8XLJwJYz6apPbgpF83Hqc+vHAcqc+I4ckGUDpsqqOqiC
         eEFg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785520744; x=1786125544; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VY2ln+jLO97w5E9lF6AQKb/PH3HPjE6f3OzEh7emks=;
        b=bWl5LUcra0F3u3aOO5dB5TBmHt79ObEKMTNdu/0GWgE8GrqwG6VDaxWA5rT/092ZrY
         L2K+vz5Q1kYkhnJSEaRQJCU5jswXKZKfhSqoG5EOMnlRHlpLCfPT6AA2+beUw6LGNayb
         nL7PQSo3RXVq8Qu3R78rNC4YDXYC88cnUQH338xF1sUTizIfGE0FlO/wyron4QZKKyoJ
         RTF7LgrpyCVMFNgg0qWBl5bJFnceFNp8b1sPgLQTP2b+K3SKi+0ND3EjLJKemgXYVnvm
         0D21yjhM8onDpIMursgRZYwsJAVVEbZMxndA6WLT3txoIp1erTHHS//eZ5LB6Nxc4hE2
         3sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520744; x=1786125544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7VY2ln+jLO97w5E9lF6AQKb/PH3HPjE6f3OzEh7emks=;
        b=Ajwzb94lmCUFmn9jnsLHDsuz7TD3x76b9d9BTmX+AvBnbkPyXW3MPo7nai8P3tFQ1t
         OlvXrrY0ADtyaREbPsHpf5doG96SmTBGfqSnmzk9AM8O4UHjd7v66ty1zE0xpW59r5Jm
         7ezVfGaeFCGzK5bTiTg7BDUR5ADT+7TJBCI8GmVo5eD0rAMdp9uV4KzXm/lseonmaZN0
         ixK3rf5UCKaCqRCuOvZp46a/uVfNAti2+H2Lej8kcWhgTD/qQIzTtPKuIIXgQnFlDgL4
         hSIOwH6ZcPcvO+OfGgpLZsqCkKIOfPwVwLcOYMbu23zSkA8ZrTIEhR0JQfqCXoMHHUDj
         lGZQ==
X-Gm-Message-State: AOJu0YxhHPi714ljoDafQR6ZDnuwzaP/GkRRAoq5GitoTdJl0TP4KA1c
	BAlS1RuU+0zPKymBgnSPSDb6Mk1wkIhcrztfcxADcHUKJc/bBErPzLJ7OFS75aqVzxN9J/tr4Qp
	oVzWzY2QNxCd8qBTDMUGXB01fGMiqBAWAa6DL
X-Gm-Gg: AR+sD11a41WqL9B43zGq3VVbIrF0iMtq+Y8bIVaCR5S27fHWHrsPuETqW1RJo+h0v0j
	NLIIRzEDBa+aNiRqO7jYZwR7evKArBWza0preji23NsfEWpFmtD6KFN2zRZfWzceourvNgyvF3f
	w5hX0P2QzMfjxYQz+aREFoc25yT9ADj5Eeo6NJc9hVMySOPglmDB7vOg6TIkeeouE8SAFgZ82mj
	gMVCa58nRiD6BSPCh+h6AUoRWOLFrwJaUycIYbofYX9XtjWwz7nBTJRK/0KH4E9FR5D/l2zozO1
	5SiqnvrtpepED/qnypzeQCltIlj8DHFfprardjCrRbJ/GYDy7Cm+ejBPUzSbtuOHRn8fooTzIJ8
	OCVONBQsyRyPKphMZspzpmhulntRTiVDP0PS3IZe/38SdaeNaEGM7ye41k5CgESZt+CPDbjIaAp
	H+lyv+8aHQVv4kJT2wwi4uZMWzZVu4ZmfY4y1kaF0lLr/pgyI6KPKd4Ws=
X-Received: by 2002:a53:b4c9:0:b0:669:483e:c36a with SMTP id
 956f58d0204a3-6694f17092amr829665d50.34.1785520744219; Fri, 31 Jul 2026
 10:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260731043610.1552-1-wangmy@fujitsu.com>
In-Reply-To: <20260731043610.1552-1-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Jul 2026 10:58:34 -0700
X-Gm-Features: AUfX_mx-IHebrAb_rrHN_yduL_PTSo2saCZNQ2hft0_kvyZzpbRj9ZzsKN25Ljw
Message-ID: <CAMKF1sqfzZL4eFsKu1zfQJuh-8yUNgRiFYJAWXfHYS14xZtx7A@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] pcsc-lite: install systemd system units
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b2d2d60657ebf1f0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 17:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128585

--000000000000b2d2d60657ebf1f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase on top of the latest master branch and resend.

On Thu, Jul 30, 2026 at 9:36=E2=80=AFPM wangmy via lists.openembedded.org <=
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
>  meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
> b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
> index d6427d2eba..75b0babec3 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
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
> View/Reply Online (#128578):
> https://lists.openembedded.org/g/openembedded-devel/message/128578
> Mute This Topic: https://lists.openembedded.org/mt/120530364/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b2d2d60657ebf1f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase on top of the latest master branch and resen=
d.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 30, 2026 at 9:36=E2=80=AFPM wangmy via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;wa=
ngmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.=
com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
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
=C2=A0meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.0.bb</a> | 12 +++++--=
-----<br>
=C2=A01 file changed, 5 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_=
2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.0.bb</a> b/met=
a-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pcsc-lite_2.5.0.bb</a><br>
index d6427d2eba..75b0babec3 100644<br>
--- a/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.0.bb</a><br>
+++ b/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.0.bb</a><br>
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
View/Reply Online (#128578): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128578" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128578</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120530364/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120530364/1997914</a><br>
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

--000000000000b2d2d60657ebf1f0--

