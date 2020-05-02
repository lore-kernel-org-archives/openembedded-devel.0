Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.14946.1588460920861942073
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2020 16:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gC17c3XH;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id l78so12919377qke.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2020 16:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=70C8MtvBynKdizaVY8CsY2o1ufgkeINuUNN0q4HOVTI=;
        b=gC17c3XH/gEjLmQYsy1inl+2apJrlFMB2dp9RDNjX/u2799LZGsajV0mz1kM5aE8Oa
         sX2+zYCrlnpbTsHgnSnsN5IoppO0wxFMXdqMancINXnClGU9Zc7Q4xgRGWpcLl/v4Ln6
         Mt98kp2HrqUED8p+XUBDfswjvmWM0n88BH4sNh/e+XWxq5GdQr2YmAEdcbFJRG4aH/7l
         2CE7EdbS8DmvE6TapwVPCRQBQxv1FfaJwBxxCsVLgqn1sIlqKguuxu3kdrZZxwciZw++
         eMW+NKhhGku24tKHOIrz+/JviMUDdwdaGZBOKAtH707z01nTYZRsGOYpBU1stfuWNe8o
         zeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=70C8MtvBynKdizaVY8CsY2o1ufgkeINuUNN0q4HOVTI=;
        b=aEjCNNj5Mz54WQyUHWOKuKerOgAluD+fmxLJAxb4iz6WjpeLo0vQCRQxAcx5KMxcbp
         olgypR4vG17p3BX5sA6hB08mJU1EbUKXjiAIC9GvQmVdqgJU/9nWmpMWoxX/V8Ts2Mt9
         gYskuIW0xWkbzsWU4BpA/zPqG2iG9Gu7s+uwesGpVz1/cRRYmdZAvE5gL4nhE5Q3eV6D
         inS9fPTNgP+a9wVQ4FPcRgdByNv6Odj/SPkEWc2+hNiNPrybx6V1PPyruerXYaoFsUJM
         ksFzqliM5c2iW7DPcvDdunMuXyDQjrbYoZRd0WpdWgcwHQweE7roE7I/zvY71urbtucu
         IzlQ==
X-Gm-Message-State: AGi0PuYC/JDPWqxFKR6etS7WcbqOK1CmplC8KwPqqi/7Tlk2KSMm/pum
	z9kszatmmGix9bChZm8HWQkFxPXqYSi7H7UmNtTvfA+M
X-Google-Smtp-Source: APiQypJkIZ8AHUA7US39SLRNC0Gbsw+ZO4TFi/tk4XbWOU8G5upyqLGTYBZOEGEFPoSGpxbFAJobbV0QD/aROm0MHLE=
X-Received: by 2002:a37:7143:: with SMTP id m64mr10053300qkc.215.1588460919589;
 Sat, 02 May 2020 16:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
 <20200501113534.16030-10-schnitzeltony@gmail.com> <CAMKF1so0ve_FuQJafWSxtJ8Mz7M0vZkZNhd7oK76SEN4Xu_mew@mail.gmail.com>
 <CALbNGRSUrqJgj-eZK0eJz0RLn4MzvgNsS=kHrfJkXOdKRwiUiA@mail.gmail.com>
In-Reply-To: <CALbNGRSUrqJgj-eZK0eJz0RLn4MzvgNsS=kHrfJkXOdKRwiUiA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 2 May 2020 16:08:28 -0700
Message-ID: <CAMKF1srksjAHR+mbTLoqhViX3AGWwCbwJw=LymfrVRR97+svUw@mail.gmail.com>
Subject: Re: [oe] [PATCH 10/10] qpdf: upgrade 9.1.0 -> 10.0.1
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000da102f05a4b260af"

--000000000000da102f05a4b260af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 2, 2020 at 2:59 AM Andreas M?ller <schnitzeltony@gmail.com>
wrote:

> On Sat, May 2, 2020 at 7:26 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > fails on mips
> >
> > https://errors.yoctoproject.org/Errors/Details/409858/
> >
> > I think you need to perhaps link with -latomic on mips
> In other recipes adding -latomic it is usually not only for mips but e-g
>
> | meta-networking/recipes-daemons/squid/squid_4.9.bb:
> LDFLAGS_append_mipsarch
> =3D " -latomic"
> | meta-networking/recipes-daemons/squid/squid_4.9.bb:
> LDFLAGS_append_powerpc
> =3D " -latomic"
> | meta-networking/recipes-daemons/squid/squid_4.9.bb:
> LDFLAGS_append_riscv64
> =3D " -latomic"
> | meta-networking/recipes-daemons/squid/squid_4.9.bb:
> LDFLAGS_append_riscv32
> =3D " -latomic"
>
> Do you still have this patch in - so we can see if other arches fail
> for same reason?


I guess all of them will mostly need them too but for now let=E2=80=99s fi=
x mips
atleast

>
>
> Andreas
>=20
>

--000000000000da102f05a4b260af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, May 2, 2020 at 2:59 AM Andreas M?ller &lt;<a href=
=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Sat, May 2, 2020 at 7:26 AM Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; fails on mips<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/409858/" re=
l=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/D=
etails/409858/</a><br>
&gt;<br>
&gt; I think you need to perhaps link with -latomic on mips<br>
In other recipes adding -latomic it is usually not only for mips but e-g<b=
r>
<br>
| meta-networking/recipes-daemons/squid/squid_4.9.bb:LDFLAGS_append_mipsar=
ch<br>
=3D &quot; -latomic&quot;<br>
| meta-networking/recipes-daemons/squid/squid_4.9.bb:LDFLAGS_append_powerp=
c<br>
=3D &quot; -latomic&quot;<br>
| meta-networking/recipes-daemons/squid/squid_4.9.bb:LDFLAGS_append_riscv6=
4<br>
=3D &quot; -latomic&quot;<br>
| meta-networking/recipes-daemons/squid/squid_4.9.bb:LDFLAGS_append_riscv3=
2<br>
=3D &quot; -latomic&quot;<br>
<br>
Do you still have this patch in - so we can see if other arches fail<br>
for same reason?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I guess all of them will mostly need them too but for now let=E2=80=99s fi=
x mips atleast=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Andreas<br>
<br>
</blockquote></div></div>

--000000000000da102f05a4b260af--
