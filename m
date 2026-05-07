Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F272CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 08:46:24 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7373.1778143577488072233
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 01:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GS2ljHIj;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so822121a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 01:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778143576; cv=none;
        d=google.com; s=arc-20240605;
        b=gspqvNRtQHvoYEkhWi0W+5FvuI9FbE7VM3S442e9dBggzQmeJKUtYn3LOGvstoBQIy
         GAROJcFv8uQz535tvROPbV+r/LFe9vFEKEnMEatqj4mnDESw8J+HJjmw8juez/p83Pm/
         jswfzGVyD1SCnIjlv1dj8IzKN7t4Y5/beuCEkPs+VnvX2Q+sf9enV9VtIX/6k5yFTEmn
         2EIMjm5oCdSVuEYTnsuuUS5cl7104Te3z+mpXBY47pf0bZc9iwsWU1gW2itPqySvGl9v
         p+fQIXKcEorNqa3lrMCTnFUg3wFfnzGRNbtCQayFmCV18q6iFLNT4jS2bZC0sXAxX6J7
         tvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rVG8JoWlxhFGk1WeyVjEVxRDegsYmVtEtdXAg9rrhfc=;
        fh=LSk4jJ5N5Ki20m4F6rSahRPX9Yqr3TRTX5CjbRgccNY=;
        b=ez2z6vvWZghlQhj35CToHNxNuCgSooI6sDN9LMRLBHdLiPOzcYgZsfaoAa12grwD53
         5Q1ME79wUhHJ1+8wzggae5po8myQfoUnS50Kq23rdNnOBCa6liIdkUgwHgWOw0m7aKGO
         vqqMGO3qp7GIILdgpIvaJRdos9VcNoVUZU/SOnrkbcaARzgdhtwyh0MTkJHjjSaBCUU4
         J9vYfoKIkVa2Haa1pVRvwQ6aKKzZcpNbMEVeU80cZ/kazTEnijEsE/3ZpJ9k+FrUmHun
         HJreeucb1nSzosiEv3mxBgygDs22FZicN8/lFe24Tw3xfm/kgxSE/wBg60J8hGsvlYBb
         JYtA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143576; x=1778748376; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rVG8JoWlxhFGk1WeyVjEVxRDegsYmVtEtdXAg9rrhfc=;
        b=GS2ljHIjQNlNORS3i4nwp45M6hOdHslT7fai5rjmCz9ZQgxvOYIC1D2iO2pEzwvRTn
         bSCALr00RugC4QrUqPr9wYFA0olTZegMxBKDLERj0kqRNlwKHKfO0cdYIWel6lcRv7ZD
         aofTOr2VsOcsfviByUDVQoCrEm6AIw2eD++kKFk9/J26ycIr0s87Xo/3k/tPXf2tlU8n
         H94gQcYMXTHjifaS2dmkxiSRoB4ZL7fgGD0MGPLTLBNvOdo1s43J0shDNB7gmNrS2A7j
         dgIURrx3uC7NF6BbFLXs2MmQrpvTBOcMoHpL3r3yW4wNbmDkhTf861auPkilMuVQyeWJ
         ZkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143576; x=1778748376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVG8JoWlxhFGk1WeyVjEVxRDegsYmVtEtdXAg9rrhfc=;
        b=q0+8VT5N635yqvjSZrWYssFvKubsM1xyo+z8E7fIzqHR5WGqmwFM0AhbDVjNwRsW3X
         55Ey45eVDK/Ojn0TL0U+P3p4qB2rwhvzec/Meo4qM6C0DgeahtfDvOfdg9hFPdDMQN+H
         K8lgbLtNI4yV7GB2SqfCiwiwm3klYRW+nA8Vf47JpwnGDvugnC8VsKgaqoaBdEG85zxO
         Mdb8EktbNrQ55NFV39v8oPNUq05dbRO1Jl3XAwPSGS2TEjfOXXUAYDMkP7B8WSzg3AKE
         1SaL1ZQP0VjbCMdSM1rFWYSBMQYjezdVwJo4K89ZRhD6F0sWbEdIYLTIFzOWsObJznJ1
         +rZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oWspsKSyXxB3VF/SQ7Y9pAOexG5L0X39DqCzp8OPGP35agik4fsoITPgyCnSW0UKP5+5GqbkUuxFDEw7ueOMsqYw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxP0ezlS1kqvzjhyh0O+tPTGi3XzuOaW5XPqikaFJxlcEULyFCE
	MO7fZz1pdaFOzqSeOgipBr1dPl3Kw8UTSZs/CVyNOJPHLtKEzSjKIOou0kZnpE2XyYbWfQAi9Lz
	tQj+0KVtIM7EvbDucQGDeRMgFWnCHZ0c=
X-Gm-Gg: AeBDieuqwx0rQd0cb0EMkR205I5Q62OLlmDix7BlM9s65NkL90ncB2r41whJTfp9zFW
	/DSockT7vqn4OKci+HhynUTbSgEwlKhjwFRMLRqbuL6aWqiWtLC0COucclQF4HD2bDQJCuWULJY
	YF47ZPhPFj1IhS7g26S4T3SklfWIuJoIDs6FoTfwRM+XawCIM6QgteThL0wcWy/XKGhKfDZWXIJ
	Daxsou/Dxil0WQBtJuk7tqvo17r/yKz3xyMvCq15Fuj/n2oE6rcKAUqhUx4KpH8h30xgkHQh3oR
	DCYCRuJpbgKBYuu70KWyXT8sOccN48po5M0iEm8vyyHWoL0JKHtVb2d5SC9pUAiI3JB9ct8Po1e
	baoh4
X-Received: by 2002:a17:907:807:b0:ba5:2f0a:2f40 with SMTP id
 a640c23a62f3a-bc56aa45eafmr384232766b.4.1778143575216; Thu, 07 May 2026
 01:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-bash-rr-v1-1-507ee57b7fe7@non.se.com> <4464a296-b5ef-46e4-a87d-90e9fcb29da3@gmail.com>
In-Reply-To: <4464a296-b5ef-46e4-a87d-90e9fcb29da3@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 7 May 2026 09:46:03 +0100
X-Gm-Features: AVHnY4J8RUVvVt_MnCgQVAp5rbWCOMqT4bep4BVmI6giRstnevlE0Mleqw2hK04
Message-ID: <CANPvuRn42dyFcaDOhvjTQMkEEyumqaJ1YW3z7D=C_pviKAH_sQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] openvpn: change bash rdepends to rrecommends
To: skandigraun@gmail.com
Cc: louis.rannou@semalibre.com, openembedded-devel@lists.openembedded.org, 
	Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
Content-Type: multipart/alternative; boundary="000000000000291dcf065136506f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 08:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126812

--000000000000291dcf065136506f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gyorgy Sarvari via lists.openembedded.org <skandigraun=3D
gmail.com@lists.openembedded.org> escreveu (quinta, 7/05/2026 =C3=A0(s) 08:=
39):

>
> On 5/6/26 18:07, Louis Rannou via lists.openembedded.org wrote:
> > From: Louis Rannou <louis.rannou@non.se.com>
> >
> > The dependency to bash is only required for dns-updown scripts. As bash
> is
> > under the GPLv3 license, it might be preferred to exclude it.
> >
> > Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> > ---
> >  meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> > index 0cbe4641cd..d967a0dc12 100644
> > --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> > +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> > @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D
> "--enable-iproute2,,iproute2,iproute2-ip"
> >  PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd=
"
> >  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libseli=
nux"
> >
> > -RDEPENDS:${PN}:append =3D " bash"
> > +RRECOMMENDS:${PN}:append =3D " bash"
>
>
> In case bash is excluded (with PACKAGE_EXCLUDE, INCOMPATIBLE_LICENSE,
> BAD_RECOMMENDATIONS...) I would expect this change to throw an error
> still, the latest during package QA, when it scans the scripts for
> missing dependencies - because the dependency itself is still present.
> Does it not fail those checks?
>
> As an alternative, I wonder if it would make sense to install this
> dns-updown script to a separate package, and make that depend on bash onl=
y.
>

A new package would be more appropriate.
On the other hand, is bash really necessary? Sometimes it's just shaband
that's wrong on script
and POSIx /bin/sh can even be used. Could you try this?

Jose


>
>
>
> >  RDEPENDS:${PN}-ptest:append =3D " bash"
> >
> >  do_install:append() {
> >
> > ---
> > base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
> > change-id: 20260506-bash-rr-5fd0820519e4
> >
> > Best regards,
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126810):
> https://lists.openembedded.org/g/openembedded-devel/message/126810
> Mute This Topic: https://lists.openembedded.org/mt/119181734/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000291dcf065136506f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Gyorgy Sarvari =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; escreveu (quinta, 7/05/2026 =C3=A0(s) 08:=
39):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 5/6/26 18:07, Louis Rannou via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" targ=
et=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
&gt; <br>
&gt; The dependency to bash is only required for dns-updown scripts. As bas=
h is<br>
&gt; under the GPLv3 license, it might be preferred to exclude it.<br>
&gt; <br>
&gt; Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.=
com" target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-networking/recipes-support/openvpn/<a href=3D"http://openvp=
n_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a> | 2 +=
-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-networking/recipes-support/openvpn/<a href=3D"http:/=
/openvpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a=
> b/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.7.0=
.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
&gt; index 0cbe4641cd..d967a0dc12 100644<br>
&gt; --- a/meta-networking/recipes-support/openvpn/<a href=3D"http://openvp=
n_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/openvpn/<a href=3D"http://openvp=
n_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
&gt; @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D &quot;--enable-iproute2,=
,iproute2,iproute2-ip&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-syst=
emd,systemd&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-seli=
nux,libselinux&quot;<br>
&gt;=C2=A0 <br>
&gt; -RDEPENDS:${PN}:append =3D &quot; bash&quot;<br>
&gt; +RRECOMMENDS:${PN}:append =3D &quot; bash&quot;<br>
<br>
<br>
In case bash is excluded (with PACKAGE_EXCLUDE, INCOMPATIBLE_LICENSE,<br>
BAD_RECOMMENDATIONS...) I would expect this change to throw an error<br>
still, the latest during package QA, when it scans the scripts for<br>
missing dependencies - because the dependency itself is still present.<br>
Does it not fail those checks?<br>
<br>
As an alternative, I wonder if it would make sense to install this<br>
dns-updown script to a separate package, and make that depend on bash only.=
<br></blockquote><div><br></div><div>A new package would be more appropriat=
e.</div><div>On the other hand, is bash really necessary? Sometimes it&#39;=
s just shaband that&#39;s wrong on script</div><div>and POSIx /bin/sh can e=
ven be used.=C2=A0Could you try this?</div><div><br></div><div>Jose</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
<br>
&gt;=C2=A0 RDEPENDS:${PN}-ptest:append =3D &quot; bash&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append() {<br>
&gt; <br>
&gt; ---<br>
&gt; base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9<br>
&gt; change-id: 20260506-bash-rr-5fd0820519e4<br>
&gt; <br>
&gt; Best regards,<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126810): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126810" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126810</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119181734/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119181734/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000291dcf065136506f--

