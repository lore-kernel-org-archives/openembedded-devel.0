Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01C8C561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 15:02:42 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42210.1785942158355208535
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 08:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eXGnUM31;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81e6f2ee60bso32239637b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 08:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785942157; cv=none;
        d=google.com; s=arc-20260327;
        b=OMYe/b6vl39lWVusIt+qXlDO/8bD+l6j2SbD0vMOAWn0aQ1DWZBNu3JCaFXgG8PF4a
         kjg2a76KHEjhB3kIWArU9b0fi47+Svx7Z9oizXaYMpZ08LaEryNQdU9ZsP0kBwVeFxSo
         izHzthDM6xlM99xgP+/ETYrKbIQ//wLgotz5z2XhaERLzX6LzJFkKuD76VAbqpE5bXX4
         dmgVGQAH2yJoOhCB3/l92jW9ehAACkHfVj9WmYDLLrRzbZPpoL5PlK+kRKC2h2MGQP0M
         c7/LkgDWRPrviIJMXv9QufwDh02t07e1ZcosqNE8KXWXgD6D1BQOvQKn6XlFa7jzg64l
         tJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BAchU7djXZGslcVmOOmTC8hu5X44UOMwRYfqGurFBbE=;
        fh=mGYbzhJM41s/2GjXYYW2zjhA2E8zeYO7tonanxUygiM=;
        b=ijxX0JO7v2lQEvWbYA29J4OUsGD4WPyPSF975W5mvUEZ9WEqv2pam0Cjse61QXe3Jx
         EXskQYA0nX8MVXcUV5icMlIUhfa5BaC9epLhNwD0YzXF7LOXABd1oY2ldMCMmEgoyWgW
         QTfDUDcazD60589mveKUBqkZi4HpvbWX8mcfZjouTMDYa63wqPxf6O227kvFFZY9IN94
         2oddByonFqqqv+dcwZza81jT7t15jmQaAL5j3rN47qPJUxmxIfxlf3mu/L5iEu/kYxSb
         fZEOLeXxzDrxI24Dd8gxaRpGBN8SJ1WkESIfM9DgTCzOLOJe+u+2CS2dwVbiDsVvUgvu
         j8/g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785942157; x=1786546957; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAchU7djXZGslcVmOOmTC8hu5X44UOMwRYfqGurFBbE=;
        b=eXGnUM31kPxwEmrtZmhZHp69Cr/w2KCQE5hqEkieMsRDa1A7R1FKgam7kRGbgb6QlI
         eIffKi/kc5q9N/UDRDHud3s5BYO444VPEUw3n8GCnnwfOOK0MdIlERGgSAp9cv97t5I+
         GLvaRIJa3RIhVzN08HKJz8tEKJyOnU3h02hcHJJ2ObOx0YT4OwIOKMv+AS25Ysb9dy0T
         6sNPTLHy4+pbkNh4U9uYy4aYm+mfLNlvjFuHcnMLsufPlTRq/SdvfwHqIkUsG5i46YrJ
         evLb7P1pMpBs3JaRNC3y6OvVtTYjwFdTTLtmhlxPf/TQP0Ppk/Gew3CTbtkFWgXDyIyL
         tLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942157; x=1786546957;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BAchU7djXZGslcVmOOmTC8hu5X44UOMwRYfqGurFBbE=;
        b=mqH0tYpN785atPWKq51QxQRNp32QwSrDC5ZjkK0r0+DnzJI9qxM0WThQ0BaNzbKBvK
         ydsEUa4v8kGJgNJlrx2w6q8/a+qlh7SsZrV0DCU0DBv/YKwCvLUgYHOlL+OaBCb5LY2A
         kxHFkPoPsnwVv9XU+YVfWwDhneJzLXW/Gqow8kaG1E2XK/AD4k6Q0NDod3lNUeeXDdWm
         JzDiUlzMJ1ftzb6vwoxoGsMJPoBspDErXQnUh9HnOKt6btuDe+KmWTHNXdPwd/yhxzX8
         EVjakT3PMpYopKvWPUzz8gayN8GCIJwVGAlJJGKJabbcHheHz8PqaTPd05KKnJQO4H25
         tYKw==
X-Gm-Message-State: AOJu0YzTQBQ1VkmxpvI4vVBFiC4KoR5wmNIFGapnz1AyYrGhT0agfCYc
	sCKcUcNPzeJvvGh2dEllOGmm7IYJ5yxzw2UzTdqtcxJjgsyLicKqy0ZJzH0KrRDUmWj3T16Gg87
	TgxlUae230QCoXzIYAwy1bD9odP3QEFDVoh+Z
X-Gm-Gg: AR+sD11+3dwu6EnLzWMWrz2zeUqPB3+KSCVROKTy2mEkmxei8AVce26K6AU6ACTROBC
	yYo/jJ1XvE/cZ9tbRDDDVv87lIFmyUGkz8+0sggDqroHlgMmiqor91MkjyRQZjBO6x6JUZN1Dvw
	nDrNQJrvnYw0ePiC5kPFeBppc+FSm5BYIXKxLzYOT7N3hgyHmioQ5FwQMD7radDs7Hb/rLZwp0E
	KkePUhmSDDEos5RPdOzzuYvwjR2ResB9jGoY187L2po4LRk2/6KVqLkv5AHFQpU4my1ew+L+uSi
	u5DK6BppCd0R47GcDVxCakQSEh+WphiXQ6FnMhMTAD7qoY0xsjR7pTt4MmElke2NdtAtS21f0c1
	djxdgzAADx53Pmet1kAoQ/qRpoIuTzxQRGZ/PEzM4aLfPaS/QA0gH8DLQ3H3WYcvXBv0B6L70Hn
	WoMZ8z41KXzGuBsp4n9g9JiATsiciY+5Hn2V2ox//OQQ==
X-Received: by 2002:a05:690c:6901:b0:81e:4acb:c0a with SMTP id
 00721157ae682-8201a96a658mr49442777b3.2.1785942155462; Wed, 05 Aug 2026
 08:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260803031401.316-1-wangmy@fujitsu.com> <CAMKF1sog7XDTK4cMyqO1WJmDTvBL5n+B6StXj67H-cZRQi6gAg@mail.gmail.com>
 <TYYPR01MB134196275DEF46EB7208D16EBDCD32@TYYPR01MB13419.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB134196275DEF46EB7208D16EBDCD32@TYYPR01MB13419.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2026 08:02:23 -0700
X-Gm-Features: AUfX_mymGlMQLb305_m3_Q_F7a4sYTHgaF_06UndcSY1Uqyyp_z1cQ3GCxbkKLw
Message-ID: <CAMKF1soJyXch=kt+6O=m2Of_L7tx38i3=hc-LuEiORNz7iuJ8Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] pcsc-lite: install systemd system units
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c40d3c06584e0f57"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 15:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128819

--000000000000c40d3c06584e0f57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It happens when init system is sysvinit not systemd

On Wed, Aug 5, 2026, 1:45=E2=80=AFAM Mingyu Wang (Fujitsu) <wangmy@fujitsu.=
com>
wrote:

> Hello,
>
> Thank you for reporting this issue.
>
> I have been trying to reproduce the installed-vs-shipped error for
> pcsc-lite on my side, but unfortunately I cannot trigger it on either
> aarch64 or x86_64 builds with my current configuration. The patch I
> submitted seems to work fine in my environment.
>
> To help me understand what is the problem, could you please provide the
> test details?
>
>
>
>  --
>
> Best Regards
>
> ---------------------------------------------------
>
> Wang Mingyu
>
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>
> No.6 Wenzhu Road, Nanjing, 210012, China
> <https://www.google.com/maps/search/No.6+Wenzhu+Road,+Nanjing,+210012,+Ch=
ina?entry=3Dgmail&source=3Dg>
>
> TEL=EF=BC=9A+86+25-86630566--8568
>
> COINS: 79988548
>
> FAX: +86+25-83317685
>
> MAIL: wangmy@fujitsu.com
>
>
>
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Monday, August 3, 2026 11:51 PM
> *To:* Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-oe] [PATCH v2] pcsc-lite: install systemd
> system units
>
>
>
> seeing this now
>
>
>
> ERROR: pcsc-lite-2.5.1-r0 do_package: QA Issue: pcsc-lite: Files/director=
ies were installed but not shipped in any package:
>
>   /usr/lib/systemd
>
>   /usr/lib/systemd/system
>
>   /usr/lib/systemd/system/pcscd.service
>
>   /usr/lib/systemd/system/pcscd.socket
>
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
>
> pcsc-lite: 4 installed and not shipped files. [installed-vs-shipped]
>
>
>
> On Sun, Aug 2, 2026 at 8:14=E2=80=AFPM wangmy via lists.openembedded.org =
<wangmy=3D
> fujitsu.com@lists.openembedded.org> wrote:
>
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

--000000000000c40d3c06584e0f57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It happens when init system is sysvinit not systemd=C2=A0=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Aug 5, 2026, 1:45=E2=80=AFAM Mingyu Wang (Fuj=
itsu) &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"overflow-wrap: =
break-word;">
<div class=3D"m_287855043163246413WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF">Hello,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF">Thank you for reporting this issue.<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF">I have been trying to reproduce the=C2=A0install=
ed-vs-shipped=C2=A0error for pcsc-lite on my side, but unfortunately I cann=
ot trigger it on either aarch64 or x86_64 builds with my current
 configuration. The patch I submitted seems to work fine in my environment.=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF">To help me understand what is the problem, could=
 you please provide the test details?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">=C2=A0--<u></u><=
u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">Best Regards<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">----------------=
-----------------------------------<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">Wang Mingyu<u></=
u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">FUJITSU NANJING =
SOFTWARE TECHNOLOGY CO., LTD. (FNST)<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;"><a href=3D"https=
://www.google.com/maps/search/No.6+Wenzhu+Road,+Nanjing,+210012,+China?entr=
y=3Dgmail&amp;source=3Dg">No.6 Wenzhu Road, Nanjing, 210012, China</a><u></=
u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">TEL</span><span =
style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">=EF=BC=9A<span=
 lang=3D"EN-US">+86+25-86630566--8568<u></u><u></u></span></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">COINS: 79988548<=
u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">FAX: +86+25-8331=
7685<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;">MAIL:
<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank" rel=3D"noreferrer">=
<span style=3D"color:rgb(5,99,193)">wangmy@fujitsu.com</span></a><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.=
com</a>&gt;
<br>
<b>Sent:</b> Monday, August 3, 2026 11:51 PM<br>
<b>To:</b> Wang, Mingyu/</span><span style=3D"font-size:11pt">=E7=8E=8B</sp=
an><span style=3D"font-size:11pt;font-family:Calibri,sans-serif">
</span><span style=3D"font-size:11pt">=E9=B8=A3=E7=91=9C</span><span lang=
=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-serif"> &lt;<a =
href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank" rel=3D"noreferrer">wan=
gmy@fujitsu.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org=
</a><br>
<b>Subject:</b> Re: [oe] [meta-oe] [PATCH v2] pcsc-lite: install systemd sy=
stem units<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">seeing this now<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<pre style=3D"white-space:pre-wrap"><span lang=3D"EN-US" style=3D"color:bla=
ck">ERROR: pcsc-lite-2.5.1-r0 do_package: QA Issue: pcsc-lite: Files/direct=
ories were installed but not shipped in any package:<u></u><u></u></span></=
pre>
<pre><span lang=3D"EN-US" style=3D"color:black">=C2=A0 /usr/lib/systemd<u><=
/u><u></u></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">=C2=A0 /usr/lib/systemd/sys=
tem<u></u><u></u></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">=C2=A0 /usr/lib/systemd/sys=
tem/pcscd.service<u></u><u></u></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">=C2=A0 /usr/lib/systemd/sys=
tem/pcscd.socket<u></u><u></u></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">Please set FILES such that =
these items are packaged. Alternatively if they are unneeded, avoid install=
ing them or delete them within do_install.<u></u><u></u></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">pcsc-lite: 4 installed and =
not shipped files. [installed-vs-shipped]<u></u><u></u></span></pre>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Sun, Aug 2, 2026 at 8:14</sp=
an><span lang=3D"EN-US" style=3D"font-family:&quot;Times New Roman&quot;,se=
rif">=E2=80=AF</span><span lang=3D"EN-US">PM wangmy via
<a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferr=
er">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@l=
ists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">fujitsu.com@lis=
ts.openembedded.org</a>&gt; wrote:<u></u><u></u></span></p>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">Fr=
om: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank"=
 rel=3D"noreferrer">wangmy@fujitsu.com</a>&gt;<br>
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
=3D"_blank" rel=3D"noreferrer">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" target=3D"_blank" rel=3D"noreferrer">pcsc-lite_2.5.1.bb</a> | 12 +++++--=
-----<br>
=C2=A01 file changed, 5 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_=
2.5.1.bb" target=3D"_blank" rel=3D"noreferrer">pcsc-lite_2.5.1.bb</a> b/met=
a-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.bb" target=
=3D"_blank" rel=3D"noreferrer">pcsc-lite_2.5.1.bb</a><br>
index ae20447050..bf0b45dd14 100644<br>
--- a/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" target=3D"_blank" rel=3D"noreferrer">pcsc-lite_2.5.1.bb</a><br>
+++ b/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.b=
b" target=3D"_blank" rel=3D"noreferrer">pcsc-lite_2.5.1.bb</a><br>
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
//libpcscspy.la" target=3D"_blank" rel=3D"noreferrer">libpcscspy.la</a> \<b=
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
enembedded-devel/message/128672" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/g/openembedded-devel/message/128672</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120572332/199=
7914" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/mt/120572332/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gma=
il.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></span></p>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--000000000000c40d3c06584e0f57--

