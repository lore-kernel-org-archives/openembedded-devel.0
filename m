Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFB3CA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:57:25 +0000 (UTC)
Received: from mail-yx2-f32.google.com (mail-yx2-f32.google.com [74.125.224.160])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1174.1790701042120548049
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mx5/m5XQ;
 spf=pass (domain: gmail.com, ip: 74.125.224.160, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f32.google.com with SMTP id 00721157ae682-8aa75b33a26so25921877b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 09:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790701041; cv=none;
        d=google.com; s=arc-20260327;
        b=n2LwSL2mpKzDe4kVkstaAru0v2OtcLA7udnR6w31uOr+8Hfi8T5ivbPvlD9frh5KjN
         xk+61Nf39UTo6yn5Z3xayVo6GdUGTfLO6hOalhUeqtFu9nQe9H0UYPFNPIiGdcSD82jd
         l5oH9zgK+/rC/UNam8lyLFMxRLBSdQs7WppLwSv+tqvWykJ3A3bUqqA1UlZ3kLd8ONcY
         aY0XsPEZMP4H6qRTE/Yxnvs2oVuY1T+5Ey62aUCuen+YrZzNPwFshGacOmr2GmT2jzWR
         gt80L1nl9EFASHQvyFScACCCrQbFViWtJU8ldGrhRw5dLPwvfD4jwoJcjfXHc7/gE/oX
         OiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3k3M0o18CRE52tn4bWoXDvBFViU/QZUMDlGQdg5WgmM=;
        fh=dsJe4/NGABVfCxSoYOy5ui4wBe0AzUqCNTNkjCeBiXQ=;
        b=EJlZQHZ6Iio4Tu2gKbu+5XrC/CLOJKMQvmKDWtS+/D4X85X46iMtGMtiw6CrPIjxu7
         ZCVFPmv5t5vQUHgCEKqeH7onsEr74XgEcjLp5ER3BM6V01xi4WQJA9jFeABSyeHa0cfw
         S/+AYpcT3YMslzhYWbty/FoX2jRW4TzKBsWEL4/0Bac3T9ocyGPtNAQCL1AjvFXJrXFR
         o5j1j/XtD8U3O+lmZWs0pZJs3WMgwtoeCjxNPVShAJtYB9KcfNvDW5nSmaSE66UFxZxr
         oqOjH9ZsfEy3+NgPJdyt09aOVpeWRKimik3+5LGr+M6w2w7A2ZJLBItYJIgdOCHjxFVx
         H6/g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790701041; x=1791305841; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3k3M0o18CRE52tn4bWoXDvBFViU/QZUMDlGQdg5WgmM=;
        b=mx5/m5XQwpONToXGGim3IRGX1bQzgOMtycUfLhTopeCGO3FaSCuwPt6yQlHfKIhebw
         mn9E8egYogFjZCCWBz+VQmt4/UZyW2jUjWGmr6rUGigpO3/EAxMTGOWC5IX/FHcoZj4S
         NTgk9ctWCodiflO5Au++Vsda0ah+2/ZhnKlXMlgFdemnrBxwvusLM32+nTiJyn9R8Gj5
         uk5crK6/gYTIBlXa8PtL9KE7RVR5q7Tpp2NxDIasAVx/rTma5CIcYRxNeCdL3JvxanqT
         NGZ25MUaUIuW6zpoL2OBtueMI4Pt+WIPhrox4sPOPiVRo0eOlPWVmRUpPaYEcN8OGFFQ
         MtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701041; x=1791305841;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3k3M0o18CRE52tn4bWoXDvBFViU/QZUMDlGQdg5WgmM=;
        b=Bhzt7RPSiifvFc4Fvlcvt/i+KHF7ryRqE04e73Fkz4o9QTfYEU5l2pShmVcqHuKZlh
         Kif+YTmwYezeSUrvNsWumOEw+kymsLxSuPFjdunj91+CqUT02eE2F4KUZUL/tbK3LIaM
         wjELg8Vtlgp4IAJZX4I9KO90GyxaLMFDI5+CMGuTjqgntHDKJSH+U/oqefzGsnTFySIX
         ghqOvrycMA6sxdUaexpm0YXJjpfvZ3Hkhk9aZzsJs4NSuKAZ5O01tSgG4iWCSjQTAk2J
         iMMTUPSXq44J6zwxaOcVrhv5n2cCgmVymKDY7eijiI2yEgnLxoba3+Kv/0PNHsP0480S
         hwtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHI947A/+jRlnlVEiI8XutIutOv0XIpvo6Zwme2erxgtMx3cxbt1aqVKrLgAsGg7cTbgudhqj4MliQ0cQklOr9eSc=@lists.openembedded.org
X-Gm-Message-State: AFq9FYLYqQnyRm7KrCA1139BtvTgWZphfNlv+NVlKWsNh1b8EhLGiY7N
	PHTuqDSR4ZeHb4dmKRATck5c9PeAV9YQ3ukWvn9Kk+XOf84XJmsc+HFpcSLri4+VVwBTsYkIp8q
	fj4X92v4oV2LhurZwKg76QQEjG+l+qzE=
X-Gm-Gg: AYBFou3T/VNgT76/VtP88d+iJ099WngMtINkzmzgXtqZO5SzRAGuiJEJSDkNh2rIYZ1
	bivJqf8EzPkikR60lSDQ+c9TMKt2dxn5aNqB5rQh5z6i6SGJ4O3xom9AlrnYdAhTIPAwop6wJ7L
	DIySrGqwpTO2yENrLuyODuD2SeI+0WW0DVOWoC/e5Spfsmi+UrMMmuSGr2Vk12wgAPUUTeNmDT3
	OazOY9jAKYb9fYvgzSRtbvC02ioPJqKr8dC3e4uCm7JHHF37zO2hN5+pyle57awDcwCLzTQiLWc
	lfIEHzwK6gLaA7ncvPNATw4rtQUgZImiD8zYvd5WPkiS1bSAadsDxlYD/PpHd7rkDD8x3VBOJrX
	Qv6+beNirhG5j/Z3eF6BlMg6oJCQrRR2Bk/AnpRD8HOg0u36QxC/XLfX/LcFJTZ+Rz/G+nv+epX
	Mqqh6lpLcl32pUIS3FMHibAJQcXTIx4e1Y+jX4R4fDF/0SbMjKcraUSwsXIKC8EJmkqpVC07WY9
	LGvpJDNCc6weTjqgYbZJiXWyhnmX3Jdiar3qB3FHdZVyPJ9tjXGdXkCgE/Rsvx6+pO/PKbWss4V
	CtXOzsc=
X-Received: by 2002:a05:690c:3:b0:873:5c7b:c0f5 with SMTP id
 00721157ae682-8a64ba07317mr84925447b3.45.1790701041105; Tue, 29 Sep 2026
 09:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260927141257.8721-1-f_l_k@t-online.de> <aruEqfFB1usll_BK@navimatix.de>
In-Reply-To: <aruEqfFB1usll_BK@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Sep 2026 09:56:54 -0700
X-Gm-Features: AclHuK9qWfKU2dqYrY6_bIb3sNrR8mto0I1zzTVU6R_VnMPqrNFReZ8a3jXCXKM
Message-ID: <CAMKF1srGpk5iBjJyrCc2RW-0NCQGbjg6b-gFjU0E=zSZ06i9bg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fwupd: create the fwupd-refresh user
To: joerg.sommer@navimatix.de
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007440ea065ca21344"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 16:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130485

--0000000000007440ea065ca21344
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

send a followup, it looks a good improvement

On Tue, Sep 29, 2026 at 2:29=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> Markus Volk via lists.openembedded.org schrieb am So 27. Sep, 16:12
> (+0200):
> > @@ -36,6 +36,9 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
> >
> >  EXTRA_OEMESON =3D "-Dvendor_ids_dir=3D${datadir}/hwdata"
> >
> > +USERADD_PACKAGES =3D "${PN}"
> > +USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group
> --home-dir ${localstatedir}/lib/fwupd --shell /sbin/nologin fwupd-refresh=
"
> > +
>
> Maybe ${sbindir} instead of /sbin?
>
>
> Regards, J=C3=B6rg
>
> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jena               www.navimatix.de
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130476):
> https://lists.openembedded.org/g/openembedded-devel/message/130476
> Mute This Topic: https://lists.openembedded.org/mt/121455859/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007440ea065ca21344
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">send a followup, it looks a good improvement</div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Sep 29, 2026 at 2:29=E2=80=AFAM J=C3=B6rg Sommer via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;joerg.so=
mmer=3D<a href=3D"mailto:navimatix.de@lists.openembedded.org">navimatix.de@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Markus Volk via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> schrie=
b am So 27. Sep, 16:12 (+0200):<br>
&gt; @@ -36,6 +36,9 @@ GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXTRA_OEMESON =3D &quot;-Dvendor_ids_dir=3D${datadir}/hwdata&quo=
t;<br>
&gt;=C2=A0 <br>
&gt; +USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
&gt; +USERADD_PARAM:${PN} =3D &quot;--system --no-create-home --user-group =
--home-dir ${localstatedir}/lib/fwupd --shell /sbin/nologin fwupd-refresh&q=
uot;<br>
&gt; +<br>
<br>
Maybe ${sbindir} instead of /sbin?<br>
<br>
<br>
Regards, J=C3=B6rg<br>
<br>
-- <br>
Navimatix GmbH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T: 03641 - 327 99 0<=
br>
Tatzendpromenade 2=C2=A0 =C2=A0 =C2=A0 =C2=A0F: 03641 - 526 306<br>
07745 Jena=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://www.navimatix.de" rel=3D"noreferrer" target=3D"_blank">www.navimati=
x.de</a><br>
<br>
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130476): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130476" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130476</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121455859/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121455859/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007440ea065ca21344--

