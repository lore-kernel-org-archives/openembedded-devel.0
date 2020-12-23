Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.8600.1608729341829191981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Dec 2020 05:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PXB7sG67;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id n26so22757270eju.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Dec 2020 05:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=84P3Wm3MNiF4hZ8t3mvLmHSR2MGTtaWkAh/38QTMnkw=;
        b=PXB7sG670t++9Y1iapfweHOZXlmiFKIi1nmUPK51EdD8BU6ScaI9a1fBFW2yEaHOQl
         SYCxZq+I6CptTsstkGFihpZUjD5qbgppA02B581zQajhI9nhm9RZZJsdCqZyrWVGz1LC
         oWnZOSaEtwAlytOzB+sJSx+hA10+F6Clpzhe5L1xQxSFy6LZicOvwcc8yiCpjQc4T+dg
         Hh7O87/bPu7OnFmYJlSbGlEBc4yVBuq6fgp54cURK/HRydE95023SFDRKunNij5tWTBH
         0ydwJGj4VCFtV3GwQWPM1zR37bWO5dgjaYOafE04ei6ND1NuSNSNv9V50DLTzqjFEiLD
         xGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84P3Wm3MNiF4hZ8t3mvLmHSR2MGTtaWkAh/38QTMnkw=;
        b=pbdbmkuAI6k6rWVeYBG0BYdz+XEnr2a0l+Q+UbKyYDToaOo1r/JKv9vUG0YBSn4Sa4
         qaTLjN9oP0Sxz447QQ8b2W+RhUrP+xJDfEeC/HbN0a6rprFQGn22miG0nrHz2xRrVMvP
         sUTrozhfwqoFsA1v3+GGTdL2ed4GFLwNpj3u/IaSAckWEpQoK76wn8+GPjCh+uiWqNx8
         o7UickYj+cWp8o+MoQrkhGjYjZ2wn0vrtp1hAyzuNtNdpEPdjKzjS/ajiMsfqShVvg1A
         4DQyyv/k8eWTA4D86Uw8SYa8yODPf2YHlXWR86MU+jNRRRb2mxGH0c1scppRafu075hC
         AzMQ==
X-Gm-Message-State: AOAM5318Sin6qnn17AUhCsTHxCRniSEdKwDq5rtwPkXCZwvr1Jmt4cyZ
	TwqusJbTI53lcFosE6nhhU6twndKCIMZDhZ0H7I=
X-Google-Smtp-Source: ABdhPJyOFH0NLNed/9Yh9WjGwoAPOkaWLvVl2+UatqWc0T4kDTCoMYDCaYrxOTxS7U6ffwgYbPtMEleaEt1FPjZpTMU=
X-Received: by 2002:a17:906:7f13:: with SMTP id d19mr24755879ejr.54.1608729340392;
 Wed, 23 Dec 2020 05:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20201208182629.3651761-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20201208182629.3651761-1-fabio.berton@ossystems.com.br>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 23 Dec 2020 14:15:29 +0100
Message-ID: <CA+chaQc4xDn=57TvgY12G6jiYbwyRAuFQW_EUzQh7h-uJwf15g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] linuxconsole: Add recipe for version 1.7.0
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dfb9b105b7217c55"

--000000000000dfb9b105b7217c55
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 8, 2020 at 7:26 PM Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Add linuxconsole and inputattach-config recipes. The inputattach-config
> recipe is intend to use as machine configuration file for inputattach.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ....

+FILES_joystick += "\
> +    ${bindir}/evdev-joystick \
> +    ${bindir}/ffcfstress \
> +    ${bindir}/ffmvforce \
> +    ${bindir}/ffset \
> +    ${bindir}/fftest \
> +    ${bindir}/jscal \
> +    ${bindir}/jscal-restore \
> +    ${bindir}/jscal-store \
> +    ${bindir}/jstest \
> +    ${datadir}/joystick \
> +    ${base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules \
> +    ${base_libdir}/udev/js-set-enum-leds \
> +    ${base_libdir}/udev/rules.d/60-joystick.rules \
> +    ${base_libdir}/udev/rules.d/80-stelladaptor-joystick.rules \
> +"
> +
> +RDEPENDS_inputattach += "inputattach-config"
> +
> +RDEPENDS_joystick += "\
> +    bash \
> +    gawk \
> +"
>

would you mind if I split jscal files to separate package with these
runtime dependencies?

We have joystick-jscal package in joystick recipe in meta-ros:
https://github.com/ros/meta-ros/commit/ee3a3f6051594bdf39322d43ec08cce0df8f172c
and it would make transition a bit simpler - but we also don't really use
joystick anymore, so I don't have strong opinion on this, for now I'm
replacing our joystick recipe with linuxconsole bbappend which does this,
if you think it's useful I'll send patch for meta-oe to separate the
package here.

Cheers,

--000000000000dfb9b105b7217c55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Dec 8, 2020 at 7:26 PM Fabio Bert=
on &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossyst=
ems.com.br</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Add linuxconsole and inputattach-confi=
g recipes. The inputattach-config<br>
recipe is intend to use as machine configuration file for inputattach.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>....</bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">+FILES_joystick +=
=3D &quot;\<br>
+=C2=A0 =C2=A0 ${bindir}/evdev-joystick \<br>
+=C2=A0 =C2=A0 ${bindir}/ffcfstress \<br>
+=C2=A0 =C2=A0 ${bindir}/ffmvforce \<br>
+=C2=A0 =C2=A0 ${bindir}/ffset \<br>
+=C2=A0 =C2=A0 ${bindir}/fftest \<br>
+=C2=A0 =C2=A0 ${bindir}/jscal \<br>
+=C2=A0 =C2=A0 ${bindir}/jscal-restore \<br>
+=C2=A0 =C2=A0 ${bindir}/jscal-store \<br>
+=C2=A0 =C2=A0 ${bindir}/jstest \<br>
+=C2=A0 =C2=A0 ${datadir}/joystick \<br>
+=C2=A0 =C2=A0 ${base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.ru=
les \<br>
+=C2=A0 =C2=A0 ${base_libdir}/udev/js-set-enum-leds \<br>
+=C2=A0 =C2=A0 ${base_libdir}/udev/rules.d/60-joystick.rules \<br>
+=C2=A0 =C2=A0 ${base_libdir}/udev/rules.d/80-stelladaptor-joystick.rules \=
<br>
+&quot;<br>
+<br>
+RDEPENDS_inputattach +=3D &quot;inputattach-config&quot;<br>
+<br>
+RDEPENDS_joystick +=3D &quot;\<br>
+=C2=A0 =C2=A0 bash \<br>
+=C2=A0 =C2=A0 gawk \<br>
+&quot;<br></blockquote><div><br></div><div>would you mind if I split jscal=
 files to separate package with these runtime dependencies?</div><div><br><=
/div><div>We have joystick-jscal package in joystick recipe in meta-ros:</d=
iv><div><a href=3D"https://github.com/ros/meta-ros/commit/ee3a3f6051594bdf3=
9322d43ec08cce0df8f172c">https://github.com/ros/meta-ros/commit/ee3a3f60515=
94bdf39322d43ec08cce0df8f172c</a><br></div><div>and it would make transitio=
n a bit simpler - but we also don&#39;t really use joystick anymore, so I d=
on&#39;t have strong opinion on this, for now I&#39;m replacing our joystic=
k recipe with linuxconsole bbappend which does this, if you think it&#39;s =
useful I&#39;ll send patch for meta-oe to separate the package here.</div><=
div><br></div><div>Cheers,</div></div></div>

--000000000000dfb9b105b7217c55--
