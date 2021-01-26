Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.19628.1611696427402284274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 13:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SMVO2bCs;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id c2so21234747edr.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 13:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+NOcdT2x3p8QQWzBs5k9Ofv/V6Vyg3LiiDra1jPr1E=;
        b=SMVO2bCsJx2E7aFlttFUdSluXpTpMEbGnWgXNYK1VjgxUgDyEywrdmbUs/QD4I8a56
         eR1+U4d3y92avgnqVK5fcrjIIrzk7mOIngvdHqGvqbwV6z+a2fSQ0UZqIeZl3gExFJI4
         tCsfdqw+GSdJtMy0IOw2dsRlrOzNjKTkc2ujWhYVwqjRCImQRFN5NQgN4PaqF8NeH+rc
         f/IuM9UrtScoZgnoGwfYQ30QjccUqXczn4CuFUH6tHu/PKJRmKubn2EzGS/MrvjatW9e
         mXPLFBkBNf8P2klS5W265PLuLitpQy5pKPcW076itDjFSf9lAvzwGDTdcVXsf77EjdES
         McVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+NOcdT2x3p8QQWzBs5k9Ofv/V6Vyg3LiiDra1jPr1E=;
        b=q44LYZnNE64lslZYa08qKKFp2ZCWTwSB2XxR2+8j9MIF3bqMjBvkCsqCtGyb1hMYwA
         dlCSkZqhQCL3l5RyoE4+dUneYHnHCe0b+peiaFhiwmznopkHg/WhkbFtcwoHcImRccKF
         jjfOG543kl33lRefEgWHSEaDjrkc7sZje0njDdqJv6rVOfWXgU0ESJd8owXRmFfG+hng
         aw3/XSjCamak02RaGIvEk8NecCPxClt7RSMVTjBjpvg7QDO0dZ83w9S70a6z3W1eyp22
         LjJryIP9gpdsYS/b3JIg2uQFs94g33NtaDZtx/VFirSp6/zLfTVdm8zO8RNJBsgM8Il2
         RKRQ==
X-Gm-Message-State: AOAM533BLRuNdMBFjNvzEP/z7xEfXejHCpcUZ+P8KYVrFBoJJiT2+m5n
	Ms7mJ3pJMjIzD2za4zOEj9tvho/uKyISh4yMaXU=
X-Google-Smtp-Source: ABdhPJwD/QnQvqVlrxyhFDLyASOMH5wufTfXUxhV9zI+h7caFHnoHT+62lxwNmbtmmOnZD8SoEJVPiOw+k/vuJh87d8=
X-Received: by 2002:a50:f288:: with SMTP id f8mr6000570edm.388.1611696425865;
 Tue, 26 Jan 2021 13:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20210126205652.3870967-1-adrian.freihofer@siemens.com>
In-Reply-To: <20210126205652.3870967-1-adrian.freihofer@siemens.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 26 Jan 2021 13:26:54 -0800
Message-ID: <CA+chaQeHvbd3-Jc4t6ZcA7Ves_X_bhwtxG8J8zKr_76-j56FZg@mail.gmail.com>
Subject: Re: [oe][meta-networking][PATCH v2] networkmanager: add missing readline depends
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000f3160705b9d4508e"

--000000000000f3160705b9d4508e
Content-Type: text/plain; charset="UTF-8"

Hi,

is the
ALLOW_EMPTY_${PN}-nmcli*
actually useful for anything? Why should the empty package exist? If people
include it in the image, then they need to make sure the PACKAGECONFIG is
enabled.

And when it's not enabled do_rootfs will correctly fail. Creating useless
empty package hides this useful error which IMHO makes it worse.

Regards,

On Tue, Jan 26, 2021 at 12:57 PM Adrian Freihofer <
adrian.freihofer@gmail.com> wrote:

> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../networkmanager/networkmanager_1.28.0.bb                  | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.28.0.bb
> b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.28.0.bb
> index 1053bdd42..36d50668e 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.28.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.28.0.bb
> @@ -62,7 +62,7 @@ do_compile_prepend() {
>      export
> GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
>  }
>
> -PACKAGECONFIG ??= "nss ifupdown dnsmasq \
> +PACKAGECONFIG ??= "nss ifupdown dnsmasq nmcli \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
> bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '',
> d)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
> @@ -85,6 +85,7 @@ PACKAGECONFIG[wifi] =
> "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
>  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
>  PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
>  PACKAGECONFIG[cloud-setup] =
> "--with-nm-cloud-setup=yes,--with-nm-cloud-setup=no"
> +PACKAGECONFIG[nmcli] = "--with-nmcli=yes,--with-nmcli=no,readline"
>
>  PACKAGES =+ " \
>    ${PN}-nmcli ${PN}-nmcli-doc \
> @@ -140,10 +141,12 @@ FILES_${PN}-dev += " \
>  FILES_${PN}-nmcli = " \
>      ${bindir}/nmcli \
>  "
> +ALLOW_EMPTY_${PN}-nmcli = "1"
>
>  FILES_${PN}-nmcli-doc = " \
>      ${mandir}/man1/nmcli* \
>  "
> +ALLOW_EMPTY_${PN}-nmcli-doc = "1"
>
>  FILES_${PN}-nmtui = " \
>      ${bindir}/nmtui \
> --
> 2.26.2
>
>
> 
>
>

--000000000000f3160705b9d4508e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>is the</div>ALLOW_EMPTY_=
${PN}-nmcli*<div>actually useful for anything? Why should the empty package=
 exist? If people include it in the image, then they need to make sure the =
PACKAGECONFIG is enabled.</div><div><br></div><div>And when it&#39;s not en=
abled do_rootfs will correctly fail. Creating useless empty package hides t=
his useful error which IMHO makes it worse.</div><div><br></div><div>Regard=
s,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Jan 26, 2021 at 12:57 PM Adrian Freihofer &lt;<a href=3D"ma=
ilto:adrian.freihofer@gmail.com">adrian.freihofer@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: A=
drian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siemens.com" target=
=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../networkmanager/<a href=3D"http://networkmanager_1.28.0.bb" rel=
=3D"noreferrer" target=3D"_blank">networkmanager_1.28.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/networkmanager/<a href=
=3D"http://networkmanager_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">=
networkmanager_1.28.0.bb</a> b/meta-networking/recipes-connectivity/network=
manager/<a href=3D"http://networkmanager_1.28.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">networkmanager_1.28.0.bb</a><br>
index 1053bdd42..36d50668e 100644<br>
--- a/meta-networking/recipes-connectivity/networkmanager/<a href=3D"http:=
//networkmanager_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">networkman=
ager_1.28.0.bb</a><br>
+++ b/meta-networking/recipes-connectivity/networkmanager/<a href=3D"http:=
//networkmanager_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">networkman=
ager_1.28.0.bb</a><br>
@@ -62,7 +62,7 @@ do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/libnm/.libs:${=
B}/libnm-glib/.libs:${B}/libnm-util/.libs&quot;<br>
=C2=A0}<br>
<br>
-PACKAGECONFIG ??=3D &quot;nss ifupdown dnsmasq \<br>
+PACKAGECONFIG ??=3D &quot;nss ifupdown dnsmasq nmcli \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;s=
ystemd&#39;, &#39;systemd&#39;, bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;x11&#39;, &#39;consolekit&#39;, &#39;&#39;, d), d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;b=
luetooth&#39;, &#39;bluez5&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;wif=
i polkit&#39;, d)} \<br>
@@ -85,6 +85,7 @@ PACKAGECONFIG[wifi] =3D &quot;--enable-wifi=3Dyes,--enab=
le-wifi=3Dno,,wpa-supplicant&quot;<br>
=C2=A0PACKAGECONFIG[ifupdown] =3D &quot;--enable-ifupdown,--disable-ifupdo=
wn&quot;<br>
=C2=A0PACKAGECONFIG[qt4-x11-free] =3D &quot;--enable-qt,--disable-qt,qt4-x=
11-free&quot;<br>
=C2=A0PACKAGECONFIG[cloud-setup] =3D &quot;--with-nm-cloud-setup=3Dyes,--w=
ith-nm-cloud-setup=3Dno&quot;<br>
+PACKAGECONFIG[nmcli] =3D &quot;--with-nmcli=3Dyes,--with-nmcli=3Dno,readl=
ine&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot; \<br>
=C2=A0 =C2=A0${PN}-nmcli ${PN}-nmcli-doc \<br>
@@ -140,10 +141,12 @@ FILES_${PN}-dev +=3D &quot; \<br>
=C2=A0FILES_${PN}-nmcli =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/nmcli \<br>
=C2=A0&quot;<br>
+ALLOW_EMPTY_${PN}-nmcli =3D &quot;1&quot;<br>
<br>
=C2=A0FILES_${PN}-nmcli-doc =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${mandir}/man1/nmcli* \<br>
=C2=A0&quot;<br>
+ALLOW_EMPTY_${PN}-nmcli-doc =3D &quot;1&quot;<br>
<br>
=C2=A0FILES_${PN}-nmtui =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/nmtui \<br>
-- <br>
2.26.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f3160705b9d4508e--
