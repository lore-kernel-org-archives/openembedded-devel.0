Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E50D206A9
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 14:14:46 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44763.1764857684819928536
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 06:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W/LLw8IC;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso1463407a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 06:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764857683; x=1765462483; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CwPUaFOFqXO5MGMoqJ+eI+f79ddpeLJ+yqFFfAQpJgc=;
        b=W/LLw8ICrj1nDXNVUAWHEALCWxTxzNxXzrbe/YaHniqqjxuuoj6rYcpdZ4sCeD8VEX
         5cN52bRV7bvW+Qw4Pi0htqbwTwRTFTBr/YR0BZ71GBiGTvcGVTTvvOCOSxSFkd6g+eGt
         LFnVUkHWQwHLxm08EvWI+CT3JGdj4KnAyIu6e9dVOCNeY5m9N01fFRmKw8wtlURiZE3x
         aCo3MJ4OIgaotlW2IXcDh69mVrXGHhhHbQr+mnP7CVWtXAwl6wNznHuEUgs7SkOTQQgN
         4vhLVeyZmA0n3qDn9xQHD6Oc4OlQkPrzXcJ9QVBv9GdxXwaSUoxKzJiP5y6DP/lvbPFV
         BpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764857683; x=1765462483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwPUaFOFqXO5MGMoqJ+eI+f79ddpeLJ+yqFFfAQpJgc=;
        b=ueJErJvbx9/INcPRX4pxKDdtKE6lvbl5oP8lfZPvxSJBZhHuq54Iljt8PQ2/EOunlW
         vWqF6QzfxSjx9VShvTmf0yMOCfw5I3ftZ7edZgU1Z0Pci1ZnKEYkmpw3niQ2PzdOrbKd
         eXu9hsjscIXJhqTjLSL6V/mKPT39+TXGHpLLB3TblNzhe0CyoUfc1DZ8vL2e8lXtNDRN
         c4Esju56ALJkp2yq4Uq6P+uN6bLzopYgiCjpmcl5daEKfnA/fjmQCnJeFCmHbU/0O0Nc
         tR4U4O1MqxusKJnakbwDcAvM/xKf2LC/ocPTdFrq018oUZ60JExb8ZxGIrWGlaGltKII
         12NA==
X-Forwarded-Encrypted: i=1; AJvYcCXfxgjuN8MFENoChqyRVNK82osoWqu4NcOG5u0p3tBETXEmIrpPdWHRsv7rS73Wclai8L9KzgOqdhB8/0FchmNpg1M=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxIcwCeMW2j8rKWKrNI7YPg54m/Nk7NnvrVB2lFVyJG3pq+icOf
	7zc1McLoGawd8pi86SoP/GsNN6JRPjCVW3fLx4VLWagH3dVH4uZUp0/2TdfZnhxN7JSPyJAd4lZ
	XAHoOaoTNcB1H5vXx2JX5I4/BalXUoTA=
X-Gm-Gg: ASbGncv+1CJO/EBjnTXaXb5i55UtGxDFgVpgw0P0PZNk4+1DAwNooh8wgtV/ol/x1y8
	jWoJJIW7CUFzDNVYPWbLj++azN/WjXBcScKk2GHHmwdqOxiIJz9niePBjLBwgIqw+fXjdqGjn9o
	FH7d0iPSs/bR2SDP9F4NMTXiY3IKNd9jJTS6tsG6TBniuN0CSBIcIECJ+B4hesgmG6IvjLKRANH
	MSPwkmIzMdJ8o3xOzpHLvD7cMZVKuKfESKZ8d6Qa9jV6nriwbbyXUhN1MMeZSx8Ykm3ZjOYiISH
	W0GageE+YX9fIAxaNoavB6r660k+/qi5gHSCsmFNr6GhNWkDGLlKng35mxtMFBqlPzz+XsZsMR2
	Y7HHIXcmsYwhI
X-Google-Smtp-Source: AGHT+IEO+WN2ARYxuldJJWqy15VB5jqxiqEi1BdXdC+xT6LTsRy482+zS/e3iSP3cHZwLj4ZstNfl712Cqbp/fB+rQQ=
X-Received: by 2002:a05:6402:4403:b0:647:7a35:a7d5 with SMTP id
 4fb4d7f45d1cf-647abddda6fmr2406232a12.25.1764857682801; Thu, 04 Dec 2025
 06:14:42 -0800 (PST)
MIME-Version: 1.0
References: <20251203090342.2024473-1-changqing.li@windriver.com>
 <FA59CAA8-D404-4977-A8A2-FF02AA4E9BD5@arm.com> <fe857264-7b6f-4f2e-9bb5-582a57a5018f@windriver.com>
 <35688177-1593-4499-AEFE-3EE8775009DF@arm.com>
In-Reply-To: <35688177-1593-4499-AEFE-3EE8775009DF@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Dec 2025 06:14:15 -0800
X-Gm-Features: AWmQ_bkKl76TrVz-BtMyO9O-PdlYBAmJ5WszGIBPZdfiQPxNwMaCFuVprgBHkkU
Message-ID: <CAMKF1srz4CSK7YviyMzrweHaEar7-zNiN=+AOauPpVukVHvo+w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libmng: correct version of libmng
To: ross.burton@arm.com
Cc: Changqing Li <changqing.li@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004339b1064520f35b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 14:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122322

--0000000000004339b1064520f35b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 3:05=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

>
>
> > On 4 Dec 2025, at 02:35, Changqing Li <changqing.li@windriver.com>
> wrote:
> >
> >
> > On 12/3/25 19:08, Ross Burton wrote:
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >>
> >> On 3 Dec 2025, at 09:03, Changqing Li via lists.openembedded.org <
> changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
> >>
> >>> From: Changqing Li <changqing.li@windriver.com>
> >>>
> >>> Current version is 2.0.3, the lastrelease of libmng is in 2015,
> >>> add a patch to fix it
> >>>
> >> Last release a decade ago, for a image format that was designed to
> replace GIF, but no browsers actually support, and has been superseded by
> APNG which is supported by all browsers and a W3C Recommendation?
> >>
> >> Sounds like the follow-up patch to this cleanup should be to delete th=
e
> recipe=E2=80=A6
> > Thanks for sharing the background.
> > I searched under meta-openembeded, there is one recipe might depend on
> this.
> >
> https://git.openembedded.org/meta-openembedded/tree/meta-gnome/recipes-gi=
mp/gimp/gimp_3.0.6.bb?id=3D1d3c3ad93c962ee1c27d88076b63d08e53c8b318#n80
> > Another recipe that depend on this:
> >
> https://code.qt.io/cgit/yocto/meta-qt6.git/tree/recipes-qt/qt6/qtimagefor=
mats_git.bb?h=3D6.10#n19
> > Seems we cannot delete the recipe unless we don't support those
> PACKAGECONFIG mng.
> > //Changqing
>
> The gimp option is easily removed (or at least, disabled by default) in
> the same patch set, and meta-qt will just have to update. MNG _is_ dead, =
so
> there=E2=80=99s no reason to keep the code around in our layers.
>
>
There was a need of it in webkit too IIRC in past.
I agree, for now I have moved with the patch and if we can get more
awareness of its removal then perhaps we should revisit and remove it.


> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122318):
> https://lists.openembedded.org/g/openembedded-devel/message/122318
> Mute This Topic: https://lists.openembedded.org/mt/116591341/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004339b1064520f35b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 4, =
2025 at 3:05=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.c=
om@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On 4 Dec 2025, at 02:35, Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt; wrot=
e:<br>
&gt; <br>
&gt; <br>
&gt; On 12/3/25 19:08, Ross Burton wrote:<br>
&gt;&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt;&gt; Do not click links or open attachments unless you recognize the se=
nder and know the content is safe.<br>
&gt;&gt; <br>
&gt;&gt; On 3 Dec 2025, at 09:03, Changqing Li via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a> &lt;<a href=3D"http://changqing.li" rel=3D"noreferrer" target=3D"_bl=
ank">changqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.=
org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;&gt; <br>
&gt;&gt;&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windrive=
r.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Current version is 2.0.3, the lastrelease of libmng is in 2015=
,<br>
&gt;&gt;&gt; add a patch to fix it<br>
&gt;&gt;&gt; <br>
&gt;&gt; Last release a decade ago, for a image format that was designed to=
 replace GIF, but no browsers actually support, and has been superseded by =
APNG which is supported by all browsers and a W3C Recommendation?<br>
&gt;&gt; <br>
&gt;&gt; Sounds like the follow-up patch to this cleanup should be to delet=
e the recipe=E2=80=A6<br>
&gt; Thanks for sharing the background.<br>
&gt; I searched under meta-openembeded, there is one recipe might depend on=
 this.<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-gn=
ome/recipes-gimp/gimp/gimp_3.0.6.bb?id=3D1d3c3ad93c962ee1c27d88076b63d08e53=
c8b318#n80" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/meta-openembedded/tree/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb?id=3D1=
d3c3ad93c962ee1c27d88076b63d08e53c8b318#n80</a><br>
&gt; Another recipe that depend on this:<br>
&gt; <a href=3D"https://code.qt.io/cgit/yocto/meta-qt6.git/tree/recipes-qt/=
qt6/qtimageformats_git.bb?h=3D6.10#n19" rel=3D"noreferrer" target=3D"_blank=
">https://code.qt.io/cgit/yocto/meta-qt6.git/tree/recipes-qt/qt6/qtimagefor=
mats_git.bb?h=3D6.10#n19</a><br>
&gt; Seems we cannot delete the recipe unless we don&#39;t support those PA=
CKAGECONFIG mng.<br>
&gt; //Changqing<br>
<br>
The gimp option is easily removed (or at least, disabled by default) in the=
 same patch set, and meta-qt will just have to update. MNG _is_ dead, so th=
ere=E2=80=99s no reason to keep the code around in our layers.<br>
<br></blockquote><div><br></div><div>There was a need of it in webkit too I=
IRC in past.</div><div>I agree, for now I have moved with the patch and if =
we can get more awareness of its removal then perhaps we should revisit and=
 remove it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122318): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122318" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122318</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116591341/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116591341/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004339b1064520f35b--

