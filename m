Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.10326.1621006097808526803
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 08:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WYuOiyhr;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: athomasset@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id h10so3057180lfm.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=1dbWiVmU8nw4/el0QpWaHf3moQFMkfxSfbMW0W231cA=;
        b=WYuOiyhrv74p7UgqBIKorrS6Tod5JuYiSZALLRuDApEow/KzozBDHGbGc30UzO6QTj
         oaulJ+ODl+9EXNncbxiA1yY12p4iC500r/P7/1uqtHRYALqSj5ZinapJu7ay0BhwIxMo
         wHhkY+nuQ+TFbNii68bR2z3j6I80iKD2yPdRQaOrGclVPjLMBY7sPGLYXrssUQ0LLR9H
         BgzLwp1CblBhiDga6t9jINvhgTzkSieyBkCvVj3J93CACMqFGZbVpfzFMHNNdMZroPe4
         U05quJk5tevSC7rAEdbV8TP4OKcPXoFh6wBeNjGVsv4TiOjYuAFwFXJVrFc50dief5jj
         RG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=1dbWiVmU8nw4/el0QpWaHf3moQFMkfxSfbMW0W231cA=;
        b=k9Ze4iuTRKG4zs2n5lP3dtJ4bbpoeCAf5B14Fwl4997RbOuplwOPK0BQTOjhnLzojA
         tgRBxNV3im4QGp8pj+NrnXLkREnMwSURPjqArSeoKVMexGcodaIzEWhO/Ohl/MJp3xMk
         oUErWohjx8EBkWaheDzycjSFwhMbWvxPzIhft8tD7EfCYXLKgKgy4oeiGOLMVbXqZ9YV
         Em2syGUW5Eful6bDss/w+wgrF32qfBUnJuKAeGrrXyoSPRrEEh9luCQaUKOmD+UtoblS
         WADgq2kQgHQxVnJdy1XTKu0brVLyfi+omovD0bcOQmveMZSEnkG+hlnwuO6bwzh+1reH
         iicw==
X-Gm-Message-State: AOAM532IIPYYm63Oevu5u8Cl3XCN9OH3j/ubS//1O7fzqHROV1CzZo2L
	BKmYHsD84SUEUeJHKxKJG/J/9NWFiCsxWYz3bRc=
X-Google-Smtp-Source: ABdhPJwD2i0wGrEBjtTjygljxYdtifDdJDAJK5VpgGI9y+LTaMtnS5djSD80ttM7zyiqIKsVyLuVVOjMcMiTLHI0iUA=
X-Received: by 2002:ac2:4a83:: with SMTP id l3mr32245656lfp.229.1621006095942;
 Fri, 14 May 2021 08:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210514140722.3503198-1-adrian.thomasset@doulos.com> <c9a6745e-f7ef-74c9-5333-9a447dd14bdd@gmail.com>
In-Reply-To: <c9a6745e-f7ef-74c9-5333-9a447dd14bdd@gmail.com>
Reply-To: athomasset@gmail.com
From: "Adrian Thomasset" <athomasset@gmail.com>
Date: Fri, 14 May 2021 16:28:04 +0100
Message-ID: <CALvjPy1ubiEO1ne3Z1vz+5EGRagyGTEUjpNCddAusPALUOEqrg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] wireguard-tools: change path for wg-quick systemd unit
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Adrian Thomasset <adrian.thomasset@doulos.com>
Content-Type: multipart/alternative; boundary="00000000000087075a05c24be418"

--00000000000087075a05c24be418
Content-Type: text/plain; charset="UTF-8"

Hello Kehm,

Thanks for pointing this out, I missed the fix.
I will ask to get this backported to dunfell now.

Adrian



On Fri, May 14, 2021 at 3:21 PM Khem Raj <raj.khem@gmail.com> wrote:

> Hello Adrian
>
> this is already fixed in master via commit
>
> https://git.openembedded.org/meta-openembedded/commit/?id=84681a31cfd3f7aa8cc89181c2c87ffffcbc261b
> if you are proposing it for backport then add branch name in subject and
> CC armin
>
> On 5/14/21 7:07 AM, Adrian Thomasset wrote:
> > Fix error when enabling the wg-quick unit:
> >
> > % systemctl enable wg-quick@wg0
> > Failed to enable unit: Unit file wg-quick@wg0.service does not exist
> >
> > The wg-quick@.service template unit needs to be in /lib/systemd/system
> >
> > Signed-off-by: Adrian Thomasset <adrian.thomasset@doulos.com>
> > ---
> >   .../recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb    | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_1.0.20200319.bb
> b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
> > index f698b9a9a..e769f44b7 100644
> > --- a/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_1.0.20200319.bb
> > +++ b/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_1.0.20200319.bb
> > @@ -9,7 +9,7 @@ DEPENDS += "wireguard-module libmnl"
> >
> >   do_install () {
> >       oe_runmake DESTDIR="${D}" PREFIX="${prefix}"
> SYSCONFDIR="${sysconfdir}" \
> > -        SYSTEMDUNITDIR="${systemd_unitdir}" \
> > +        SYSTEMDUNITDIR="${systemd_unitdir}/system" \
> >           WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'yes', '', d)} \
> >           WITH_BASHCOMPLETION=yes \
> >           WITH_WGQUICK=yes \
> >
> >
> >
> > 
> >
>


-- 
Adrian Thomasset
t: 0117 923 1990
m: 0776 629 4010

--00000000000087075a05c24be418
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Kehm,</div><div><br></div><div>Thanks for point=
ing this out, I missed the fix.</div><div>I will ask to get this backported=
 to dunfell now.</div><div><br></div><div>Adrian</div><div><br></div><div><=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, May 14, 2021 at 3:21 PM Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hello Adrian<br>
<br>
this is already fixed in master via commit <br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D846=
81a31cfd3f7aa8cc89181c2c87ffffcbc261b" rel=3D"noreferrer" target=3D"_blank"=
>https://git.openembedded.org/meta-openembedded/commit/?id=3D84681a31cfd3f7=
aa8cc89181c2c87ffffcbc261b</a><br>
if you are proposing it for backport then add branch name in subject and <=
br>
CC armin<br>
<br>
On 5/14/21 7:07 AM, Adrian Thomasset wrote:<br>
&gt; Fix error when enabling the wg-quick unit:<br>
&gt; <br>
&gt; % systemctl enable wg-quick@wg0<br>
&gt; Failed to enable unit: Unit file wg-quick@wg0.service does not exist<=
br>
&gt; <br>
&gt; The wg-quick@.service template unit needs to be in /lib/systemd/syste=
m<br>
&gt; <br>
&gt; Signed-off-by: Adrian Thomasset &lt;<a href=3D"mailto:adrian.thomasse=
t@doulos.com" target=3D"_blank">adrian.thomasset@doulos.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../recipes-kernel/wireguard/<a href=3D"http://wireguard-=
tools_1.0.20200319.bb" rel=3D"noreferrer" target=3D"_blank">wireguard-tools=
_1.0.20200319.bb</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-networking/recipes-kernel/wireguard/<a href=3D"http=
://wireguard-tools_1.0.20200319.bb" rel=3D"noreferrer" target=3D"_blank">wi=
reguard-tools_1.0.20200319.bb</a> b/meta-networking/recipes-kernel/wireguar=
d/<a href=3D"http://wireguard-tools_1.0.20200319.bb" rel=3D"noreferrer" tar=
get=3D"_blank">wireguard-tools_1.0.20200319.bb</a><br>
&gt; index f698b9a9a..e769f44b7 100644<br>
&gt; --- a/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wire=
guard-tools_1.0.20200319.bb" rel=3D"noreferrer" target=3D"_blank">wireguard=
-tools_1.0.20200319.bb</a><br>
&gt; +++ b/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wire=
guard-tools_1.0.20200319.bb" rel=3D"noreferrer" target=3D"_blank">wireguard=
-tools_1.0.20200319.bb</a><br>
&gt; @@ -9,7 +9,7 @@ DEPENDS +=3D &quot;wireguard-module libmnl&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D&quot;${D}&quot; PREFI=
X=3D&quot;${prefix}&quot; SYSCONFDIR=3D&quot;${sysconfdir}&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMDUNITDIR=3D&quot;${systemd_unitdir=
}&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMDUNITDIR=3D&quot;${systemd_unitdir=
}/system&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_SYSTEMDUNITS=3D${@bb.uti=
ls.contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;yes&#39;, &#=
39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_BASHCOMPLETION=3Dyes \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_WGQUICK=3Dyes \<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Adrian Thomasset<br>t: 0117 923 1990<br>m: 0776 629 4010</=
div>

--00000000000087075a05c24be418--
