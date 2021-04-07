Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.2.1617834759167909949
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IetOW4Af;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id m3so15099edv.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6MAVcIEn9xerYWi6DQVJqgvM5RmSDqJMYz/xPY/eWIo=;
        b=IetOW4AfQwsmSX/z0HFp3IlOtms9hHVA2aPaiyhoZWe47pJs2xAVMC4lFbpI4K2aa7
         /PsikP9AGmcrVOHbvKGH9nV6K0xKYjsmRHBP6+D2HaFM4NbylncA87km/iXjRTZoZ9pH
         9JAPzrFo9N04OqAuEzdtiusWIQQ3Hs/6Q/40o60lFyqGcmzzgTAC+ymCLykNQC3Kx67t
         EiuoitBxQ9ffpNXO9Q+9cNrJd0DDbj8htWEpKqvvT+1SJPvZGTOVFTt60lT0LOgtySU/
         0JWnDhBGk57lCWXi2URsTTBbzeV0HQ7tClTygZYUmd8w7jx37iFjbWL0Zw/4kmjnziae
         9LrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6MAVcIEn9xerYWi6DQVJqgvM5RmSDqJMYz/xPY/eWIo=;
        b=J5bvT5ROK9G56xj/jnnBrvCkUsO/AW7LUoueq4tvm7V64aDMjgIOEzWfGm938wHdjx
         Y8xdm0CsHSxmhFlDXr8V3YAeszLk9bs8BfNS4ND9iYlLFZtAE5yZs7tOaZDbWUzi0CyU
         +Ek7NudtRAgMukjnPDOfR16AFXxNxbUiILb9KGJ6R7PaeAUzqt5yVXcVECMcjCczj4oH
         +68CWEF6BmN+SVi9+hBTHWf6Qdtl1N9wfjMGelPE32IIa8/Lvk203WmidDBQiW74YyzF
         aNaZPyFG0q5aR3yDExhGKzmrHzWn4ybeJgHJB/XCn5Y8EfuYlVKc2vLc9qerhw+l4UAw
         RVWA==
X-Gm-Message-State: AOAM533AnteM6HQJsnIlSfFUSDCss+g4Z+CvV7iMsTcSulYiKFZZ1AGY
	7eZL+kc9s8jx8IvhrEB0cb254jZkPsYKZXuOQT8=
X-Google-Smtp-Source: ABdhPJyNJsvMgcxfggXYlk549mwB0RYjaLqGVso5jgbGiztb2cbjoT7e+zaICj5G/PL0iwoFTUGMsE1PyVbGxHXVnfw=
X-Received: by 2002:a05:6402:1848:: with SMTP id v8mr7243915edy.388.1617834755803;
 Wed, 07 Apr 2021 15:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
 <20210407221829.606871-2-schnitzeltony@gmail.com> <CAMKF1soK2QREb8XkTanPJQ_bCOQRAGTeng5iiuf1_D_WUwfpwQ@mail.gmail.com>
In-Reply-To: <CAMKF1soK2QREb8XkTanPJQ_bCOQRAGTeng5iiuf1_D_WUwfpwQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 8 Apr 2021 00:32:24 +0200
Message-ID: <CA+chaQe8OauKrne0mB1sbZ2Ct46+qTwzkbjqzoFCCC3f16HisA@mail.gmail.com>
Subject: Re: [oe] [PATCH] networkmanager-openvpn: Fix packageing
To: Khem Raj <raj.khem@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eccd3005bf69819c"

--000000000000eccd3005bf69819c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

isn't this one already in master?
https://git.openembedded.org/meta-openembedded/commit/?id=3Da23fa069d0a60c=
f348dcc6399f7990de59105c21

On Thu, Apr 8, 2021 at 12:26 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Apr 7, 2021 at 3:18 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
> wrote:
> >
> > Recent upgrade introduced:
> > | ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue:
> networkmanager-openvpn: Files/directories were installed but not shipped=
 in
> any package:
> > |  /usr/share/metainfo
> > |  /usr/share/metainfo/network-manager-openvpn.metainfo.xml
> >
>
> I wonder why my world build missed this. Is there any setting you are
> use where this is triggered.
>
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../networkmanager/networkmanager-openvpn_1.8.14.bb              | 1 =
+
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager-openvpn_1.8.14.bb
> b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager-openvpn_1.8.14.bb
> > index a1a61bed1..1f76d8ab5 100644
> > --- a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager-openvpn_1.8.14.bb
> > +++ b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager-openvpn_1.8.14.bb
> > @@ -38,6 +38,7 @@ USERADD_PARAM_${PN} =3D "--system nm-openvpn"
> >
> >  FILES_${PN} +=3D " \
> >      ${datadir}/dbus-1 \
> > +    ${datadir}/metainfo \
> >      ${libdir}/NetworkManager/*.so \
> >      ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
> >  "
> > --
> > 2.26.2
> >
> >
> >
> >
>
>=20
>
>

--000000000000eccd3005bf69819c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">isn&#39;t this one already in master?<div><a href=3D"https=
://git.openembedded.org/meta-openembedded/commit/?id=3Da23fa069d0a60cf348dc=
c6399f7990de59105c21">https://git.openembedded.org/meta-openembedded/commit=
/?id=3Da23fa069d0a60cf348dcc6399f7990de59105c21</a></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 8, 202=
1 at 12:26 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Apr 7, 2021 at 3:18 PM Andreas M=C3=BCller &lt;<a href=3D"m=
ailto:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt; Recent upgrade introduced:<br>
&gt; | ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue: netwo=
rkmanager-openvpn: Files/directories were installed but not shipped in any =
package:<br>
&gt; |=C2=A0 /usr/share/metainfo<br>
&gt; |=C2=A0 /usr/share/metainfo/network-manager-openvpn.metainfo.xml<br>
&gt;<br>
<br>
I wonder why my world build missed this. Is there any setting you are<br>
use where this is triggered.<br>
<br>
&gt; Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzelton=
y@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../networkmanager/<a href=3D"http://networkmanager-openvpn_1.8=
.14.bb" rel=3D"noreferrer" target=3D"_blank">networkmanager-openvpn_1.8.14.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/networkmanager/<a h=
ref=3D"http://networkmanager-openvpn_1.8.14.bb" rel=3D"noreferrer" target=
=3D"_blank">networkmanager-openvpn_1.8.14.bb</a> b/meta-networking/recipes=
-connectivity/networkmanager/<a href=3D"http://networkmanager-openvpn_1.8.1=
4.bb" rel=3D"noreferrer" target=3D"_blank">networkmanager-openvpn_1.8.14.bb=
</a><br>
&gt; index a1a61bed1..1f76d8ab5 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/networkmanager/<a href=3D"=
http://networkmanager-openvpn_1.8.14.bb" rel=3D"noreferrer" target=3D"_blan=
k">networkmanager-openvpn_1.8.14.bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/networkmanager/<a href=3D"=
http://networkmanager-openvpn_1.8.14.bb" rel=3D"noreferrer" target=3D"_blan=
k">networkmanager-openvpn_1.8.14.bb</a><br>
&gt; @@ -38,6 +38,7 @@ USERADD_PARAM_${PN} =3D &quot;--system nm-openvpn&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 FILES_${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${datadir}/dbus-1 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/metainfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/NetworkManager/*.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/NetworkManager/VPN/<a href=3D"h=
ttp://nm-openvpn-service.name" rel=3D"noreferrer" target=3D"_blank">nm-open=
vpn-service.name</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt; --<br>
&gt; 2.26.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000eccd3005bf69819c--
