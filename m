Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.16687.1621242889643583538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 02:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C8jOSBeP;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: athomasset@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id v6so6305217ljj.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=8/si+2Y410srK6mXwafguWKVe4EKIgMZyOZHR47Y0lM=;
        b=C8jOSBePjBoSMM7V2ZKtP2/TBTpFHKWlRyy9cvFQE7lk3MsBeilc0LRMVl26KiesY3
         U6N9VPziE6Zn7mz9yzzwvVE4wBXfd8cd6ybZsp0ikJzOqH2FBjcGRnz0cQ0Q0LZWP5w/
         wHM1qCZeqOSOxACaiitjz1JcmIthGjq21w609hueqfGN2NoWg5SFfOG6+ErwRS9EPJtc
         RMHlAFsbPXwqSFgU8F3wQIg3HCEd7EAPV/NQScJQdKjjUmMHFGAjgLGDkWxnhkQEttbu
         vPzYk9KlJ/OGkUA236eF3PG+Ink2q4Ood41TD0UtVVAjoVSLTYU5T1BioHxzhbS6oppt
         qk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=8/si+2Y410srK6mXwafguWKVe4EKIgMZyOZHR47Y0lM=;
        b=W/0+4XFY1tr2Ma94uS5+iA0inPWxKpO54KFJIYlV/H8NhLRNbMG2qW6zdhQqTcptk9
         iyNYgyE41IkqtDhur7O4hnzcORHInpq4R+tYYgWtsAGmhK8RG6g/UjCuRK7ZrMi1OYew
         1ehJAiOXkBKmXiR0d50cSd/7M0p4yUMbXdyvlEtIZNAmVB1r2fvzbryHNxFuvUU3EPC+
         Wqqf2Zpu3P5qSch18rO8JGuFqcMntLEilmAGFEykbWUNcxJ064T+TuUIhyIdJgXqYjJh
         /3dvpzAUqPadtOQeVqx3yKdgJdNJvQoupYpwC/9aNyNyvJJS5COJECyVQKg6xdb5bg/g
         0i/Q==
X-Gm-Message-State: AOAM530nFK/kzoLOaZR0HIl5Jo17f9qevmwtm/BzSplDFVROYqeR9e43
	w6PxzuiEP0oCdg5upkassJCsF324Dd1nh7nI/TI=
X-Google-Smtp-Source: ABdhPJziyu8rEgUoNQiVlPnWrxBY2BZZJMWOmy6rt6YzvN/f3+VlUORKrfyOHQQM7S0eHwypscqlSc5o5XVvGdgvDr4=
X-Received: by 2002:a05:651c:151:: with SMTP id c17mr44937527ljd.398.1621242887800;
 Mon, 17 May 2021 02:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <CALvjPy0by0vAvNLTzJ4WyasGHpzhw4T8SKmWj-_k7v1gRzR=jg@mail.gmail.com>
 <13743e57-bcc5-46fe-7ccd-9add6f2332db@gmail.com> <CAMKF1sprVXWASfHo-hNvZ2CFiAv7wmPs_9R9wvT21gF_d=8PnQ@mail.gmail.com>
In-Reply-To: <CAMKF1sprVXWASfHo-hNvZ2CFiAv7wmPs_9R9wvT21gF_d=8PnQ@mail.gmail.com>
Reply-To: athomasset@gmail.com
From: "Adrian Thomasset" <athomasset@gmail.com>
Date: Mon, 17 May 2021 10:14:36 +0100
Message-ID: <CALvjPy2H-FLueSVar9C2Edbkn1WuW0z4_d6qHfdsUFkO5LB8Ww@mail.gmail.com>
Subject: Re: [oe] [meta-networking][dunfell][PATCH] wireguard-tools: Fix systemd service installation
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006c0c3105c283068e"

--0000000000006c0c3105c283068e
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, May 14, 2021 at 11:43 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, May 14, 2021 at 3:15 PM Armin Kuster <akuster808@gmail.com> wrote:
> >
> >
> >
> > On 5/14/21 8:28 AM, Adrian Thomasset wrote:
> > > From 84681a31cfd3f7aa8cc89181c2c87ffffcbc261b Mon Sep 17 00:00:00 2001
> > > From: Mario Schuknecht <schuknecht@dresearch-fe.de
> > > <mailto:schuknecht@dresearch-fe.de>>
> > > Date: Thu, 15 Oct 2020 16:53:12 +0200
> > > Subject: [meta-networking][dunfell][PATCH] wireguard-tools: Fix systemd
> > >  service installation
> > >
> > > Install systemd configuration file wg-quick@.service into the proper
> > > folder.
> > > Use 'systemd_system_unitdir' instead of 'systemd_unitdir' as the
> > > installation
> > > path.
> >
> > I take it this will affect Hardknott and Gatesgarth. I will wait for
> > Master to merge before propagating to those branches.
>
> It's already in master for a long time. I think this patch should have
> been marked with [stable] in the subject line to be clear that its a
> backport request.
>

Apologies if this was not clear!

This is my first backport request and I was following the guidelines which
recommends adding "[some-stable-branch]".
With 3 stable branches affected, would using [stable] in the subject avoid
the need to send 3 requests?

Adrian


>
> >
> > -armin
> > >
> > > Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de
> > > <mailto:mario.schuknecht@dresearch-fe.de>>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com
> >>
> > > ---
> > >  .../recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> > > <http://wireguard-tools_1.0.20200513.bb>  | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> > > a/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_1.0.20200513.bb
> > > <http://wireguard-tools_1.0.20200513.bb>
> > > b/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_1.0.20200513.bb
> > > <http://wireguard-tools_1.0.20200513.bb>
> > > index 31b33a045..3403fd943 100644
> > > ---
> > > a/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_1.0.20200513.bb
> > > <http://wireguard-tools_1.0.20200513.bb>
> > > +++
> > > b/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_1.0.20200513.bb
> > > <http://wireguard-tools_1.0.20200513.bb>
> > > @@ -9,7 +9,7 @@ DEPENDS += "libmnl"
> > >
> > >  do_install () {
> > >      oe_runmake DESTDIR="${D}" PREFIX="${prefix}"
> > > SYSCONFDIR="${sysconfdir}" \
> > > -        SYSTEMDUNITDIR="${systemd_unitdir}" \
> > > +        SYSTEMDUNITDIR="${systemd_system_unitdir}" \
> > >          WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
> > > 'systemd', 'yes', '', d)} \
> > >          WITH_BASHCOMPLETION=yes \
> > >          WITH_WGQUICK=yes \
> > > @@ -18,7 +18,7 @@ do_install () {
> > >
> > >  FILES_${PN} = " \
> > >      ${sysconfdir} \
> > > -    ${systemd_unitdir} \
> > > +    ${systemd_system_unitdir} \
> > >      ${bindir} \
> > >  "
> > >
> > > --
> > > 2.25.1
> > >
> >
> >
> > 
> >
>

--0000000000006c0c3105c283068e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br></div></div><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 14, =
2021 at 11:43 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, May 14, 2021 at 3:15 PM Armin Kuster &lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 5/14/21 8:28 AM, Adrian Thomasset wrote:<br>
&gt; &gt; From 84681a31cfd3f7aa8cc89181c2c87ffffcbc261b Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; From: Mario Schuknecht &lt;<a href=3D"mailto:schuknecht@dresearc=
h-fe.de" target=3D"_blank">schuknecht@dresearch-fe.de</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:schuknecht@dresearch-fe.de" target=
=3D"_blank">schuknecht@dresearch-fe.de</a>&gt;&gt;<br>
&gt; &gt; Date: Thu, 15 Oct 2020 16:53:12 +0200<br>
&gt; &gt; Subject: [meta-networking][dunfell][PATCH] wireguard-tools: Fix =
systemd<br>
&gt; &gt;=C2=A0 service installation<br>
&gt; &gt;<br>
&gt; &gt; Install systemd configuration file wg-quick@.service into the pr=
oper<br>
&gt; &gt; folder.<br>
&gt; &gt; Use &#39;systemd_system_unitdir&#39; instead of &#39;systemd_uni=
tdir&#39; as the<br>
&gt; &gt; installation<br>
&gt; &gt; path.<br>
&gt;<br>
&gt; I take it this will affect Hardknott and Gatesgarth. I will wait for<=
br>
&gt; Master to merge before propagating to those branches.<br>
<br>
It&#39;s already in master for a long time. I think this patch should have=
<br>
been marked with [stable] in the subject line to be clear that its a<br>
backport request.<br></blockquote><div><br></div><div>Apologies if this wa=
s not clear! <br></div><div><br></div><div>This is my first backport reques=
t and I was following the guidelines which recommends adding &quot;[some-st=
able-branch]&quot;. <br></div><div>With 3 stable branches affected, would u=
sing [stable] in the subject avoid the need to send 3 requests? <br></div>=
=C2=A0<div>Adrian<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
&gt;<br>
&gt; -armin<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Mario Schuknecht &lt;<a href=3D"mailto:mario.schu=
knecht@dresearch-fe.de" target=3D"_blank">mario.schuknecht@dresearch-fe.de<=
/a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:mario.schuknecht@dresearch-fe.de" t=
arget=3D"_blank">mario.schuknecht@dresearch-fe.de</a>&gt;&gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a> &lt;mailto:<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../recipes-kernel/wireguard/<a href=3D"http://wireguard-t=
ools_1.0.20200513.bb" rel=3D"noreferrer" target=3D"_blank">wireguard-tools_=
1.0.20200513.bb</a><br>
&gt; &gt; &lt;<a href=3D"http://wireguard-tools_1.0.20200513.bb" rel=3D"no=
referrer" target=3D"_blank">http://wireguard-tools_1.0.20200513.bb</a>&gt;=
=C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wir=
eguard-tools_1.0.20200513.bb" rel=3D"noreferrer" target=3D"_blank">wireguar=
d-tools_1.0.20200513.bb</a><br>
&gt; &gt; &lt;<a href=3D"http://wireguard-tools_1.0.20200513.bb" rel=3D"no=
referrer" target=3D"_blank">http://wireguard-tools_1.0.20200513.bb</a>&gt;<=
br>
&gt; &gt; b/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wir=
eguard-tools_1.0.20200513.bb" rel=3D"noreferrer" target=3D"_blank">wireguar=
d-tools_1.0.20200513.bb</a><br>
&gt; &gt; &lt;<a href=3D"http://wireguard-tools_1.0.20200513.bb" rel=3D"no=
referrer" target=3D"_blank">http://wireguard-tools_1.0.20200513.bb</a>&gt;<=
br>
&gt; &gt; index 31b33a045..3403fd943 100644<br>
&gt; &gt; ---<br>
&gt; &gt; a/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wir=
eguard-tools_1.0.20200513.bb" rel=3D"noreferrer" target=3D"_blank">wireguar=
d-tools_1.0.20200513.bb</a><br>
&gt; &gt; &lt;<a href=3D"http://wireguard-tools_1.0.20200513.bb" rel=3D"no=
referrer" target=3D"_blank">http://wireguard-tools_1.0.20200513.bb</a>&gt;<=
br>
&gt; &gt; +++<br>
&gt; &gt; b/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wir=
eguard-tools_1.0.20200513.bb" rel=3D"noreferrer" target=3D"_blank">wireguar=
d-tools_1.0.20200513.bb</a><br>
&gt; &gt; &lt;<a href=3D"http://wireguard-tools_1.0.20200513.bb" rel=3D"no=
referrer" target=3D"_blank">http://wireguard-tools_1.0.20200513.bb</a>&gt;<=
br>
&gt; &gt; @@ -9,7 +9,7 @@ DEPENDS +=3D &quot;libmnl&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 do_install () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=3D&quot;${D}&quot; PREFIX=
=
=3D&quot;${prefix}&quot;<br>
&gt; &gt; SYSCONFDIR=3D&quot;${sysconfdir}&quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMDUNITDIR=3D&quot;${systemd_un=
itdir}&quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMDUNITDIR=3D&quot;${systemd_sy=
stem_unitdir}&quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WITH_SYSTEMDUNITS=3D${@bb.util=
s.contains(&#39;DISTRO_FEATURES&#39;,<br>
&gt; &gt; &#39;systemd&#39;, &#39;yes&#39;, &#39;&#39;, d)} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WITH_BASHCOMPLETION=3Dyes \<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WITH_WGQUICK=3Dyes \<br>
&gt; &gt; @@ -18,7 +18,7 @@ do_install () {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 FILES_${PN} =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${sysconfdir} \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${systemd_unitdir} \<br>
&gt; &gt; +=C2=A0 =C2=A0 ${systemd_system_unitdir} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${bindir} \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div><br></div>

--0000000000006c0c3105c283068e--
