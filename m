Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B42CCF9EE
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 01:37:12 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.18344.1761788229279962684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 18:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WSJ6D7Xd;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-784807fa38dso7834557b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 18:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761788228; x=1762393028; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zIDPgLeGI/IhtjB7MzI9W06TG+MlOyk3jenrvBv3V44=;
        b=WSJ6D7XdCouGjYeudVzh/bj3XVtl1Zp7kw7Ex+kpXozRqjyQuMrVhul3zI20gH4UXA
         QHYeeuHNf/6ME/uQzI/Tyo+whXQGia6Y4B60Xjp7+M8zV5Im3zsYPcmhz7Oncj4/Cja4
         z0klAs9c4E/CgHyG2OPGwZgrFTmpZhYfnhb1ULVRCLUVpDVEpD3cw3v4X9Vu939Yj91q
         QL3qvVQD79/ykfHo+jrKoz9WNVpM6BDCleNHJtLbV+awhZBNvHWkX+PE6ga7XjsNLuJz
         3Ew4lxlJTg1FIZTYqSfuyOznsW6r/EAaIFDIlcG6gklX2xIa2FgT6Ril4ZJAjEgA4q0y
         kzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761788228; x=1762393028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zIDPgLeGI/IhtjB7MzI9W06TG+MlOyk3jenrvBv3V44=;
        b=mScA8tCCs2ikoXPmFDmSlNy61j9s2VpgY9EqtABcuwT135jlBDF9T3Mq0Z/QodvIoa
         A/5BgsCrpbRHuj0scG4gIkK7HrPSdh0xfPxV61lsDQ5whMB+/jJ2ISRkD53lkO0FsKom
         u7BAYQXe63U/dnv+fTNbLM4sMNwQejux1Htim0oZ5AkBPDAzROJIDphBJXopWDISRUtr
         bRtEEyyo9QERrWlDoICLTKhXGLIPz2hn8Vlq3szDdAkb+g7sgqWxghow9w0zxLpQpGR4
         63yROH2p1bcrgTX07sVUYTEDgrE1hSbknnEsppWwUUAy/qCXZ+GFnCXkiKJeqY2/Ig0L
         mSqg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ONiDsZ3ZD7KVTlmjPEP0U5I0uqIRMgQBsRpACtRrNDl5TrCrkux1n+6f0DvzH+grYiXpigeynT5NTD4ssQvOjis=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOB/HegFxQSRm6/2myHI/n4v+uW3888NlnzS9Ij6UpwYQ2V+vZ
	jJ33zNbe3vpsTU7h8C2bnD2BaEK7MHmXRIs/7l4nzimbpHpnLL/VHvAlngFtn4rFlqH0kQR4/Qm
	v1GLq0bZ39G9BVOXw45qedKoQZPZoWYI=
X-Gm-Gg: ASbGncsFn367gTiP0fUOiSU5DtNgb3uJBIDjlz34ajaFtqMN4lFvA82q/Z2tkcYLMxC
	KkPNQsaXYxAm6t3yLMpTZaZYitWZXurIxGIBTKcBgawWDd5pRk/KcbjlSKVnR1rnrAfUwf05vfD
	GeE3KACQrlIkTwQ+nkJjHJcmER105ASM+gXqJvPNPcad8E8lGS7/2+0OrVC7KPWMshfyBQDYuys
	Vv4u0au3DYMjMCcYMCQl9eWp7oE7VkE5QimZPEPZiyU3sxfwwM0YwHOOoPrLfUNhEFjIUsqNaqt
	aeu/0fQLqjwykZeLlaiKci2cFDmsLodcakeWbt1CQM3YJuFKvCL+0KJTM5ZhopWdOilj751g/Zu
	MzlQ=
X-Google-Smtp-Source: AGHT+IG5ru+DwWF8G/9Y0b1iZG4hOWrnsEyEAceE5tBc3xyMWSXTcM2cLrPwBxqMMoYRP3bgVIVQcx3LKNK4cPEEJi0=
X-Received: by 2002:a05:690c:28b:b0:781:54df:1fe3 with SMTP id
 00721157ae682-78628f8b4dfmr48427207b3.33.1761788228208; Wed, 29 Oct 2025
 18:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <186254E5AFCF9A1C.28137@lists.openembedded.org>
 <IA4PR11MB942025F4F4ACFCD39771A76AB8FAA@IA4PR11MB9420.namprd11.prod.outlook.com>
 <56d9e7c77a9924f1ec4f526a0a083d2652243b44.camel@intel.com>
 <CAMKF1srL9oF4h1K0E+ejj-TxerhHyC2s_GiAe8jAnTFey6_xkA@mail.gmail.com> <fbcbf6a0f7b3111ed3784242c3ed39adcdeb3e16.camel@intel.com>
In-Reply-To: <fbcbf6a0f7b3111ed3784242c3ed39adcdeb3e16.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Oct 2025 18:36:57 -0700
X-Gm-Features: AWmQ_bnii2_sNAQKLasMoIZLwoKu74Is0xMEnjQEGfE8HojbBCiXEZQnLd3XsOc
Message-ID: <CAMKF1sojfKNwh5mCd_sDC1+tCtvbq-1zSbAX4PwNrsmRb6rsRQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1 -> 2.44.3
To: anuj.mittal@intel.com
Cc: "Jiaying.Song.CN@windriver.com" <Jiaying.Song.CN@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000830d190642564988"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 01:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121178

--000000000000830d190642564988
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 6:35=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Dintel.com@lists.openembedded.org> wrote:

> On Wed, 2025-10-29 at 18:28 -0700, Khem Raj wrote:
> > On Wed, Oct 29, 2025 at 6:15=E2=80=AFPM Anuj Mittal via
> > lists.openembedded.org
> > <anuj.mittal=3Dintel.com@lists.openembedded.org> wrote:
> > >
> > > On Wed, 2025-10-29 at 08:52 +0000, Song, Jiaying (CN) via
> > > lists.openembedded.org wrote:
> > > > kindly ping for scarthgap branch
> > > >
> > >
> > > These were missed and I will include them now.
> >
> > are you going to add it to current PR that we have on ML now ?
> > or to the next lot
>
> Next, because these have not been tested yet. I plan to send next PR
> again this week though to catch up with rest of changes.


Alright. Makes sense


>
> >
> > >
> > > Thanks,
> > >
> > > Anuj
> > >
> > > > -----Original Message-----
> > > > From:
> > > > openembedded-devel@lists.openembedded.org <
> > > > openembedded-devel@lists.openembedded.org
> > > > > On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
> > > > Sent: Friday, September 5, 2025 4:16 PM
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Subject: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update
> > > > 2.44.1 -> 2.44.3
> > > >
> > > > From: Jiaying Song <jiaying.song.cn@windriver.com>
> > > >
> > > > Changelog:
> > > > https://webkitgtk.org/2024/05/16/webkitgtk2.44.2-released.html
> > > > https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html
> > > >
> > > > Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> > > > ---
> > > >  .../webkitgtk/{webkitgtk3_2.44.1.bb =3D> webkitgtk3_2.44.3.bb}
> > > > | 2
> > > > +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-
> > > > oe/recipes-support/webkitgtk/{webkitgtk3_2.44.1.bb =3D>
> > > > webkitgtk3_2.44.3.bb} (99%)
> > > >
> > > > diff --git a/meta-oe/recipes-
> > > > support/webkitgtk/webkitgtk3_2.44.1.bb
> > > > b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
> > > > similarity index 99%
> > > > rename from meta-oe/recipes-
> > > > support/webkitgtk/webkitgtk3_2.44.1.bb
> > > > rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
> > > > index fc96d5dc3b..7d70cbda78 100644
> > > > --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
> > > > +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
> > > > @@ -16,7 +16,7 @@ SRC_URI =3D
> > > > "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
> > > >
> > > >
> file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch
> > > >  \
> > > >
> > > > file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
> > > >             "
> > > > -SRC_URI[sha256sum] =3D
> > > > "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561
> > > > "
> > > > +SRC_URI[sha256sum] =3D
> > > > "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54
> > > > "
> > > >
> > > >  inherit cmake pkgconfig gobject-introspection perlnative
> > > > features_check upstream-version-is-even gi-docgen
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121176):
> https://lists.openembedded.org/g/openembedded-devel/message/121176
> Mute This Topic: https://lists.openembedded.org/mt/116009143/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000830d190642564988
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 29, 2025 at 6:35=E2=80=AFPM=
 Anuj Mittal via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:intel.com@lists.openembedded=
.org">intel.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">On Wed, 2025-10-29 at 18:28 -0700, Khem Raj wrote:<br>
&gt; On Wed, Oct 29, 2025 at 6:15=E2=80=AFPM Anuj Mittal via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;anuj.mittal=3D<a href=3D"mailto:intel.com@lists.openembedded.org" =
target=3D"_blank">intel.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Wed, 2025-10-29 at 08:52 +0000, Song, Jiaying (CN) via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; kindly ping for scarthgap branch<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; These were missed and I will include them now.<br>
&gt; <br>
&gt; are you going to add it to current PR that we have on ML now ?<br>
&gt; or to the next lot<br>
<br>
Next, because these have not been tested yet. I plan to send next PR<br>
again this week though to catch up with rest of changes.</blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Alright. Makes sense=C2=A0</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Thanks,<br>
&gt; &gt; <br>
&gt; &gt; Anuj<br>
&gt; &gt; <br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From:<br>
&gt; &gt; &gt; <a href=3D"mailto:openembedded-devel@lists.openembedded.org"=
 target=3D"_blank">openembedded-devel@lists.openembedded.org</a>=C2=A0&lt;<=
br>
&gt; &gt; &gt; <a href=3D"mailto:openembedded-devel@lists.openembedded.org"=
 target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; On Behalf Of Song, Jiaying (CN) via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&gt; &gt; &gt; Sent: Friday, September 5, 2025 4:16 PM<br>
&gt; &gt; &gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.=
org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; &gt; Subject: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: up=
date<br>
&gt; &gt; &gt; 2.44.1 -&gt; 2.44.3<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; From: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@win=
driver.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Changelog:<br>
&gt; &gt; &gt; <a href=3D"https://webkitgtk.org/2024/05/16/webkitgtk2.44.2-=
released.html" rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2=
024/05/16/webkitgtk2.44.2-released.html</a><br>
&gt; &gt; &gt; <a href=3D"https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-=
released.html" rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2=
024/08/13/webkitgtk2.44.3-released.html</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.so=
ng.cn@windriver.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt=
;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0.../webkitgtk/{<a href=3D"http://webkitgtk3_2.44.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.44.1.bb</a> =3D&gt; <a h=
ref=3D"http://webkitgtk3_2.44.3.bb" rel=3D"noreferrer" target=3D"_blank">we=
bkitgtk3_2.44.3.bb</a>}=C2=A0=C2=A0=C2=A0<br>
&gt; &gt; &gt; | 2<br>
&gt; &gt; &gt; +-<br>
&gt; &gt; &gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)=C2=A0 re=
name meta-<br>
&gt; &gt; &gt; oe/recipes-support/webkitgtk/{<a href=3D"http://webkitgtk3_2=
.44.1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.44.1.bb</a> =3D=
&gt;<br>
&gt; &gt; &gt; <a href=3D"http://webkitgtk3_2.44.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">webkitgtk3_2.44.3.bb</a>} (99%)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta-oe/recipes-<br>
&gt; &gt; &gt; support/webkitgtk/<a href=3D"http://webkitgtk3_2.44.1.bb" re=
l=3D"noreferrer" target=3D"_blank">webkitgtk3_2.44.1.bb</a><br>
&gt; &gt; &gt; b/meta-oe/recipes-support/webkitgtk/<a href=3D"http://webkit=
gtk3_2.44.3.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.44.3.bb</=
a><br>
&gt; &gt; &gt; similarity index 99%<br>
&gt; &gt; &gt; rename from meta-oe/recipes-<br>
&gt; &gt; &gt; support/webkitgtk/<a href=3D"http://webkitgtk3_2.44.1.bb" re=
l=3D"noreferrer" target=3D"_blank">webkitgtk3_2.44.1.bb</a><br>
&gt; &gt; &gt; rename to meta-oe/recipes-support/webkitgtk/<a href=3D"http:=
//webkitgtk3_2.44.3.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.4=
4.3.bb</a><br>
&gt; &gt; &gt; index fc96d5dc3b..7d70cbda78 100644<br>
&gt; &gt; &gt; --- a/meta-oe/recipes-support/webkitgtk/<a href=3D"http://we=
bkitgtk3_2.44.1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.44.1.=
bb</a><br>
&gt; &gt; &gt; +++ b/meta-oe/recipes-support/webkitgtk/<a href=3D"http://we=
bkitgtk3_2.44.3.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.44.3.=
bb</a><br>
&gt; &gt; &gt; @@ -16,7 +16,7 @@ SRC_URI =3D<br>
&gt; &gt; &gt; &quot;<a href=3D"https://www.webkitgtk.org/releases/webkitgt=
k-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.webkit=
gtk.org/releases/webkitgtk-${PV}.tar.xz</a>=C2=A0\<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-=
decl.patch<br>
&gt; &gt; &gt; =C2=A0\<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0<br>
&gt; &gt; &gt; file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch=C2=A0\=
<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;<br>
&gt; &gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &gt; &gt; &quot;425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2=
d5d29c5561<br>
&gt; &gt; &gt; &quot;<br>
&gt; &gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &gt; &gt; &quot;dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b=
97883a0b54<br>
&gt; &gt; &gt; &quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0inherit cmake pkgconfig gobject-introspection perlnati=
ve<br>
&gt; &gt; &gt; features_check upstream-version-is-even gi-docgen<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.34.1<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121176): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121176" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121176</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116009143/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116009143/1997914</a><br>
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

--000000000000830d190642564988--

