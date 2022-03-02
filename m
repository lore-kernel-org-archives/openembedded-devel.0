Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97D4C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 01:21:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.2757.1646184065443064344
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pJ8B7bQB;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p15so515307ejc.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GRR6BDy5mYpKkWvRxXYavdQvx5rtWq6SQoL9KHT2Azc=;
        b=pJ8B7bQB3uoljaKuCBxPxd3L2c+Mbpzo/HJTUYXFVpLSizJmw40OK5nQc1ZdsOAqdR
         +PHQ96ea1GpJuARRcd2Z5QMvo54yqY2tsp0VHtR2nqb8csdpvUI3/yVKd0pzMNUJZWNu
         gIl8neauwC8chUDYJqv+ID8pRSvztUy26nrMcVG23UUJ9iOopqsoKkswau4/lMHngSsM
         jt4imGxLxcZX1ABj8Rwd9c9A6qXRmHpuKK9zxFfHzLtDsdJwCZporf7+E/xPZNJOQuC/
         aJ3hpAt98cJCizpa9Zmf/PuwefPPFNl7pLMg5dRkjDGbgH/PuUJG2Drxa2IhIJQbL15f
         X4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GRR6BDy5mYpKkWvRxXYavdQvx5rtWq6SQoL9KHT2Azc=;
        b=7wxBZy8Og3bj0+uOO4WGSm/i/VUUrP3VCIbwnA7+vOvEuMe2+E8CJzctEqnyT27eFJ
         3pLekwhD9rJ1L06S6A/flF931inpH+wIphA1QLph/32I5VIkH0QKDvH9y0frijEjcZq+
         WbsOVzhkbidyJfyHOtYPV1cTW067TBPb+CWBTad8jv+UgvaTPJpDoU4QhMLkD1t2floH
         ocG7l+RlkLtmK5BPNeqfTQLZrXlr7WXsYzYBs/cVaU3bJUZ8+uR3Q4Dmhq0gt8ZeCFBA
         3JCnuJajiYQHjHDgZtwgJy10YlVmm+UqZ0D3yRLG9S6PZTvZD3xelwf4NehufxcEix0/
         KXwg==
X-Gm-Message-State: AOAM532FNUngJhwynGbqRZZHCP8C3ELVehU9f33bXHwYP+PBwlxkHdKH
	efvWPcmMV5Khh8XkbXiLUT7mwAqD8S/aNgc7tAY=
X-Google-Smtp-Source: 
 ABdhPJzKIWwmr5BEelken1tb3X9uSk6QaMqmxTcI37iHQY4HVzPygC24HTRwkqGFfwjUB9OfG7lGeqQdtnNe/QN8avQ=
X-Received: by 2002:a17:906:3e4b:b0:6cf:7f02:9332 with SMTP id
 t11-20020a1709063e4b00b006cf7f029332mr20991144eji.404.1646184063806; Tue, 01
 Mar 2022 17:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
 <20220301203354.3839755-4-tim.orling@konsulko.com>
 <CAMKF1sqU6scw+3zr+cPGb8t4Woif05k2295vNmxaAuKrnEM0ag@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqU6scw+3zr+cPGb8t4Woif05k2295vNmxaAuKrnEM0ag@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Mar 2022 17:20:52 -0800
Message-ID: 
 <CANx9H-CoSFEBDg3tbY3SDM7fi-3pcxwC+Hnui7fvjARUSeY59Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/9] python3-pkconfig: inherit
 poetry_core
To: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <tim.orling@konsulko.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005bb29d05d932188c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 01:21:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95671

--0000000000005bb29d05d932188c
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 5:19 PM Khem Raj <raj.khem@gmail.com> wrote:

> typo in subject line but I fixed it in master-next
>

Grr. I think I need to see the eye doctor again

>
> On Tue, Mar 1, 2022 at 12:34 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > Use PEP-517 build-backend instead of setuptools3.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-pkgconfig_1.5.5.bb b/meta-python/recipes-devtools/python/
> python3-pkgconfig_1.5.5.bb
> > index 2d68a78e37..c5a74796a0 100644
> > --- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
> > @@ -10,7 +10,7 @@ RDEPENDS:${PN} = "pkgconfig \
> >                   ${PYTHON_PN}-shell \
> >                   "
> >
> > -inherit pypi setuptools3
> > +inherit pypi poetry_core
> >
> >  BBCLASSEXTEND = "native"
> >
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95651):
> https://lists.openembedded.org/g/openembedded-devel/message/95651
> > Mute This Topic: https://lists.openembedded.org/mt/89486858/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000005bb29d05d932188c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 1, 2022 at 5:19 PM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">typo in subject line but I fixed it in master-next<br=
>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Grr. I think I n=
eed to see the eye doctor again=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
br>
On Tue, Mar 1, 2022 at 12:34 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@g=
mail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Use PEP-517 build-backend instead of setuptools3.<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python3-pk=
gconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkgconfig_1.=
5.5.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pkgconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkgco=
nfig_1.5.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-pkgconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkg=
config_1.5.5.bb</a><br>
&gt; index 2d68a78e37..c5a74796a0 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pk=
gconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkgconfig_1.=
5.5.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pk=
gconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkgconfig_1.=
5.5.bb</a><br>
&gt; @@ -10,7 +10,7 @@ RDEPENDS:${PN} =3D &quot;pkgconfig \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${=
PYTHON_PN}-shell \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;<br>
&gt;<br>
&gt; -inherit pypi setuptools3<br>
&gt; +inherit pypi poetry_core<br>
&gt;<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#95651): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/95651" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/95651</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89486858=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89486858/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000005bb29d05d932188c--

