Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B29EC5AC67
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 02:23:32 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2915.1786242211474313003
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2026 19:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YNJjcpCo;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7dbcb505578so5095937b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2026 19:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786242210; cv=none;
        d=google.com; s=arc-20260327;
        b=VjG2zbH0HOWWfJT2FVi7eoCWAmKhMLGLPoEyTlgDQSPo1UmQZ2kxQNrGcybQfX9adD
         FSVUgtSKN7lGbhOxBkwecUTlePipENh0uqzWNKCKqnPEjAaLh5NmGMDjuquj2XI/94+i
         3L/B/Kg/cdWCGQr0sDuUSQDIy4TuFmoiLbxATFpQDkz9wUJa10jYYVG/yz2UgAw9Rrgm
         GzwHePWT4Mx5w0TT0ae9yAF9xySdVPe/QrmzUc2mfzhRaMvIPiINEjhF8lRyo7I2T46p
         4xifqbUeJ+wZ3VA4AqCvOYm3/8Bh26SFFMYoLlZGNufr/+HCxiUXqPQoS7o5LgClJXHh
         LSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YAhqQ/hrWCV+juz2dayo9hRmg7FFyKiclhGSieH/DZE=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=igCbnKq9Eo9whcvjEBHCf4Lr1lKlN/NSON3Yw4Nk8xFcIxWPYsZMBq8a2C6vtRU/iu
         VMn2ZbSDh3FjHAGLeYDES/+sH445KvJ0vQngCaYGyQQ/6Mjx57MXgiekqsuhQD9Mi/wJ
         ibs62jeIffLnWTZgK0XdbIhCcxMn5wwBuuxLqo9X85GU+zvF4TfLvXQFAk2/Ve2EBwY4
         adgPKbhcQj/bEhrxWuN14vAEeAJbfTdXjnLfOCd8ptV3+rpfW7BF0aBaBZIWnlrAnj2L
         fOEkzWheoNodGWEBJOiGUft+xw/h1FkgfyBuCMjPUGh7+fTnkAQtCiTMg4nYZllKrQ9s
         SWVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786242210; x=1786847010; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YAhqQ/hrWCV+juz2dayo9hRmg7FFyKiclhGSieH/DZE=;
        b=YNJjcpCo277GkKHehxCglmly4AXrgI6TNFn76SWOhGhvKXLOCLEegFM5XE7rehH+Yv
         gpvVKfUQFQU3U7lSYdGoz9DkP9aumYwLebS92jFIvcV0xCxsCt/r7jxp9Vps4PxNeP3l
         yuIlqMzdO+b8ajbKAB0cDswOLEHapXE/E9y8kiqSQYSlcfP/YGCxBaKzMq92mIjkYX7q
         vQEoLfpswAPRjLDaIyqIyjTaqaerGbN+UIpHHTlzoidb7eXEP4hgUUXqwZm1FzlLJAc3
         lJeZ0xziuYHXM+oAO7RFrZW9sSGMQq7eA30Hx+fAH/p0+QX1v19G10R7yIj/nybhiiuU
         8C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786242210; x=1786847010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YAhqQ/hrWCV+juz2dayo9hRmg7FFyKiclhGSieH/DZE=;
        b=iwxxUhqY6MWUS+6Y2jQe+gneeUtQPbjf9NZoNZxWdW1OYaX08zABuvh0R6n2aTcTTU
         TV8+3+2EK8X+XQuCiStIE/xwiZ4zzZ3ZK2ebu6wMS1aAVp5FjmECj5G0NyPNGLnjjJym
         lakAqbG975hlbHKX3hNIj4NxhJHAPNWB/eNfTZIY+fDD6XuqHyEerltRG2iWrDJ6Og0H
         58WIVz9MIHYvhseWUpoGpIICAEyYLS5GA+y2IQVQKf1+FPUfDT37L1lcB8LEzQflouNm
         Q06pN9MSkkconEnYqKS6Lv/VgSujsOqY8Jfz3a5LCmyjDEd73o2ZlCN/8+dM4V4C7pkV
         sZzA==
X-Gm-Message-State: AOJu0YzJ4QV2hf9K9Bl6nA1hxnoud+wodyNZ4QWCMHlPRq4r8vC+Mi8g
	DlvoVCkzwvDLir/gGK8d1wozCMPHOrIapqOrrxClKx9CGglvIq14ckPZnY0sqmve1fvMTAanbba
	loIwM4FdXtHBgh0E4PrBjqhhEf8Bao0Jufb5rYCc=
X-Gm-Gg: AR+sD11XvvDhotQX3LPPqRAGj30XhzLL6BvT1Zq9BFQaIMTQVGtmxmolML65iCNug/b
	EBCzl+WBC2h706oraoAFqmjZR10dnQ4zpBeLI4yL3OmBR4l3YPm53tbdU4qckt6YJODHKpvznDK
	BEtXdt5wIzXk+lK+Ec0AlT9FjORDSyl61GfoGPmrHtO/69fUtyr2JMnfCC/8WqCjLZyNMc5gsFO
	s5mOllWaD9vPuCZAK6l5Oj96aXsoaKHY2DAaQWm4t1xv0JsnTCvalKlzlnanVm1cSOM9flSt3n+
	XgmH49sVJAIUdL7TWeAs98XPDNjpMDF/Y40PnAGzLXZ4uaYIfMjCFkWoB53EwoYcBceRp8y6+gd
	ogm9OYAuvGQ7zBwOaexPVAkWwmYwY7hzx2mQ07/DpO/8WC2eoUHl5xcJilMtMeHSFLlz/y8TKeg
	5zaNNuvNMiUnijA9dJhIY2SgfsfM87I8WYZVKEfoh6qU8bRnB2GEne
X-Received: by 2002:a05:690c:9a81:b0:820:12dd:7472 with SMTP id
 00721157ae682-82445193dddmr70980537b3.23.1786242210357; Sat, 08 Aug 2026
 19:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260807100911.1629-1-wangmy@fujitsu.com>
In-Reply-To: <20260807100911.1629-1-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Aug 2026 19:23:04 -0700
X-Gm-Features: AUfX_mwo411z5s3i5sk62qinaudbdyfSNGYgJDVj9kIl5wsKxUJAUmgAFXKz6qI
Message-ID: <CAMKF1spGr_KhHN97Te28gBNhaRonnR_Xj16uc6s-e6o5z_j84g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v3] pcsc-lite: install systemd system units
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e6759065893ecc1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 02:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128870

--0000000000006e6759065893ecc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Next error

| ../sources/pcsc-lite-2.5.1/meson.build:12:0: ERROR: Value "no" (of type
"string") for option "systemdunit" is not one of the choices. Possible
choices are (as string): "user", "system".
|


On Fri, Aug 7, 2026 at 3:09=E2=80=AFAM wangmy via lists.openembedded.org <w=
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
> index ae20447050..f70c17495a 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
> @@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative
>
>  EXTRA_OEMESON =3D " \
>      -Dlibusb=3Dfalse \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '-Dsystemdunit=3Dsystem', '-Dsystemdunit=3Dno', d)} \
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
> View/Reply Online (#128867):
> https://lists.openembedded.org/g/openembedded-devel/message/128867
> Mute This Topic: https://lists.openembedded.org/mt/120640343/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006e6759065893ecc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Next=C2=A0error</div><div><br></div>| ../sources/pcsc=
-lite-2.5.1/meson.build:12:0: ERROR: Value &quot;no&quot; (of type &quot;st=
ring&quot;) for option &quot;systemdunit&quot; is not one of the choices. P=
ossible choices are (as string): &quot;user&quot;, &quot;system&quot;.<br>|=
 <br>=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 7, 2026 at 3:09=E2=80=AFAM wan=
gmy via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujits=
u.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@=
fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
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
index ae20447050..f70c17495a 100644<br>
--- a/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a><br>
+++ b/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pcsc-lite_2.5.1.bb</a><br>
@@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative<br>
<br>
=C2=A0EXTRA_OEMESON =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Dlibusb=3Dfalse \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd=
&#39;, &#39;-Dsystemdunit=3Dsystem&#39;, &#39;-Dsystemdunit=3Dno&#39;, d)} =
\<br>
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
View/Reply Online (#128867): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128867" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128867</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120640343/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120640343/1997914</a><br>
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

--0000000000006e6759065893ecc1--

