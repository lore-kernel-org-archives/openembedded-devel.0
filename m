Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12F8C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:19:56 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.16242.1713964790451238163
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 06:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X89x+ezV;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-238fd648224so3561325fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713964790; x=1714569590; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx1fnnKHVLAOnTCC6qEx8DQCcSPpqZBa5+99v1Z4mX4=;
        b=X89x+ezVf0zwpUpT8Pbx7Orge3KCF4/bxxX3JjLMl86uyzR9DLsGUoRjhd6k32slqi
         w1deZi+1qGZ5t3sAU5Q+97U5SXr8cErSBZVPaOdLtRQzICi6uUA7tLuiDjY1Thxo5BON
         vm5O+1vByq4ftIXjdVBkLRkvpZuebMDpdhE9dn+CCsWKB/OVWeV1peCEhc1WfFhtbU3Y
         zR2xixbfezHRoGdKsBjYKDKN18AzTicgnumVVG2it3izxt8iIzW6P6DWeFarUyN+XSBM
         ObQJ8HgM68cEDkDB5enCINlx2IR0hqGhthHCKxfKS29tw2eJ4914JZHyeBt3yYDefKUr
         1+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713964790; x=1714569590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yx1fnnKHVLAOnTCC6qEx8DQCcSPpqZBa5+99v1Z4mX4=;
        b=guGtr/q2p4IEtimHTC6ef7SVyjgUe0G0nRbRXPAFZfRJneBS3H0LI1vGk7psgDXAg6
         wUpNu8e4r3yzkIP7uUrMHqk++RhRpG2UqtG3iiJ9xf4laiXyet3J8NDMwXv7mxwyeENb
         bVzge0lygpez3LWlyglRRT4qLkRoEa3Y/KAhSnhHHtqtObjsKa3ABBaoXbSv6zupr0hw
         VgNXBmRkGlCyY9hhnVvsm17ISAFgKknfduaYnb9h065t4lKnofdRcAFunqgz1SS/lF3m
         qD3Apl/iA0ds02+IPo5lYGl/t5OF1OFp1LmbNo+vy3jFws1KrehqsUqhN7mkuKS1BjUU
         lJhA==
X-Forwarded-Encrypted: i=1; AJvYcCVQvnMm9baTDQJKP6qgw4vjJRKyh28HH1cV/57mEZ/sH2yipoEDwmUkyLZgfa0ghtIjSPf9oeJ6XcioV62NEzK2i4MZjXVEyQ0w2Euw3GxUByguxXHzpVPQAg==
X-Gm-Message-State: AOJu0YxgyNYWBIBj/kl2LTbG53GdmBHd+GfGrU/8A6hGZ/gLV+ZPVb9L
	45k0nY4zMnfJlTK+wH9MzPf0R2piwZAtQI3A55rPS25ksEy7/zfS7LuGL54GgzeTpEW0rfUq/lk
	dCS+DqlSB5koDuwWH01Zo+U14ay0=
X-Google-Smtp-Source: AGHT+IG03pAtjkVfk4dNQ4iI7OYGusqAUihEuCsE65G/pNgjtUr9/kuKBjk8xD85CMlYr5x7g8cURY611iiP/gCcnCc=
X-Received: by 2002:a05:6870:a345:b0:238:b140:1ab with SMTP id
 y5-20020a056870a34500b00238b14001abmr2540615oak.48.1713964789720; Wed, 24 Apr
 2024 06:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240424114158.4102856-1-yoann.congal@smile.fr> <053892adff2c9f1d3c80dc3e37a583bc669c01d4.camel@linuxfoundation.org>
In-Reply-To: <053892adff2c9f1d3c80dc3e37a583bc669c01d4.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Apr 2024 15:19:38 +0200
Message-ID: <CAMKF1sr3q+BzmoUGCaQPtgq9Z_t=OxaUz9BY8TZ+PC7udK91dQ@mail.gmail.com>
Subject: Re: [meta-*][PATCH] reproducibility: move repro excludes from AB
 config.json to meta-oe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000072efd70616d78666"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 13:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110124

--00000000000072efd70616d78666
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 2:48=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2024-04-24 at 13:41 +0200, Yoann Congal wrote:
> > For now, the known non-reproducible packages list is stored inside
> > the
> > autobuilder config.json file. This is not ideal. Let's move this list
> > into each layers of meta-openembedded.
> >
> > These lists can be used with, in local.conf:
> >   include conf/include/non-repro-meta-oe.inc
> >   OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES =3D "${KNOWN_NON_REPRO_META_OE}"
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Richard, Khem: The next step will be to move the current AB config to
> > use these
> > files. And then, continue to cleanup reproducibility errors.
>
> Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Thanks for doing this, this should make issues more visible to people
> and easier to update the lists as things change!
>

Agreed


> Cheers,
>
> Richard
>

--00000000000072efd70616d78666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 24, 2024 at 2:48=E2=80=AFPM Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed=
, 2024-04-24 at 13:41 +0200, Yoann Congal wrote:<br>
&gt; For now, the known non-reproducible packages list is stored inside<br>
&gt; the<br>
&gt; autobuilder config.json file. This is not ideal. Let&#39;s move this l=
ist<br>
&gt; into each layers of meta-openembedded.<br>
&gt; <br>
&gt; These lists can be used with, in local.conf:<br>
&gt; =C2=A0 include conf/include/non-repro-meta-oe.inc<br>
&gt; =C2=A0 OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES =3D &quot;${KNOWN_NON_REPRO=
_META_OE}&quot;<br>
&gt; <br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;<br>
&gt; Richard, Khem: The next step will be to move the current AB config to<=
br>
&gt; use these<br>
&gt; files. And then, continue to cleanup reproducibility errors.<br>
<br>
Acked-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
Thanks for doing this, this should make issues more visible to people<br>
and easier to update the lists as things change!<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Agreed=C2=A0</di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--00000000000072efd70616d78666--

