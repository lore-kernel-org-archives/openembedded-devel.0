Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFF4C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:15:59 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.11898.1716452158368859036
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 01:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=csoaG8rH;
 spf=pass (domain: smile.fr, ip: 209.85.218.44, mailfrom: alexandre.truong@smile.fr)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59c448b44aso1096020866b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716452157; x=1717056957; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yKeEsB7CgNjW61DazLhElNeZppY8Bcs5aOe/ncZPWB4=;
        b=csoaG8rHT/LApUht8XLI7F72uY/wq18tzQkVJRPkHla4mEDfTH7PkoIQftxA0I7TfZ
         tlnqL2wx0Cw3e+jcq9PWj+BUzmdes7hnmgBbnLv51s0eqC0hacafr6ZvllDTyosaJ4L9
         0+W66ykD+6StGT6GSr326irxjwh8CG6g+jHbTeZtIAIGjQcPhZkP63x1ow1PCpE9Lunn
         iMpauI2WhWr5yhYQLt1uEb4VIopzxpG+eGHySFCEz89BSFDEtluxzT+NOVKhBlD+YY+7
         iePTy66zV4TuszOeiuIcLOdHEEjfOem/u3DTXnd8YWkekH974l0QcdrfGGuduNgIShM2
         oVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716452157; x=1717056957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKeEsB7CgNjW61DazLhElNeZppY8Bcs5aOe/ncZPWB4=;
        b=WCqt+0o8yUCEQ7DQCZk6yaISBQLW2TzKydhCqJMUwRtRB6cwCbdividp60VMWB9VWt
         RUPpDY6nHq+qIKTdOYGWMk8y3hT9SzKVkPkQILdABY+RGKABNu9cDkYwC0QOH1ZQ5mF8
         8EeSuln4KCSjdb1TewcpC8WaqC1ZAmaobZwosDv5aSvHnRCnGyPq2dszFzeBQ/fapO+F
         g2S5SVqHv2uM4M4+fmFCN9Wgnc2wJBIxqfXgb9sG8gF7pIePRu3MoPD5MsPPc0Cja+Di
         apPZ6Zgkk4t/Y9K0xzndgdTaP0Ld+/HnBvY+lmNkWbymj1D3AL3PW+NFUurjWj+CKNwG
         dLdg==
X-Gm-Message-State: AOJu0YxUDT8XRNWYLj/SCBmKq8t8XHAvb+ne8U0NjpPnxWpxDg0PhpmZ
	svLl7pRvHjnmCrEbffBM9NukAABpfLQLf6hjP5JAp17Q78FD/EuQ17GiuZ+leVpJt9eDBSl5pxD
	4/xVqmoUhsGiIOVcB599IZHgesllUlRP62WbIfA==
X-Google-Smtp-Source: AGHT+IFAoGxf98d4iUoFyfBU8reN7PozAcAB7Yyys+IMpzg48dusbNUwB0451/th1MFZLI9HtEUFEQTKhte1nc5il3Y=
X-Received: by 2002:a17:906:3783:b0:a59:c090:777d with SMTP id
 a640c23a62f3a-a622807be6bmr221586666b.21.1716452156606; Thu, 23 May 2024
 01:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240523075052.8854-1-alexandre.truong@smile.fr> <CA+chaQetbft86fKv-BLs5QVT4HsW9bXVCvYGSZUTGauSV_MO6g@mail.gmail.com>
In-Reply-To: <CA+chaQetbft86fKv-BLs5QVT4HsW9bXVCvYGSZUTGauSV_MO6g@mail.gmail.com>
From: Alexandre TRUONG <alexandre.truong@smile.fr>
Date: Thu, 23 May 2024 10:15:45 +0200
Message-ID: <CAN21hX6RLtLX0HcmndXpnaHiqBSB_cCAP7s2BoCupADNHpzsow@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] source-han-sans-*-fonts: rename downloaded
 files in SRC_URI
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="00000000000011aa5c06191aa941"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 08:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110498

--00000000000011aa5c06191aa941
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, you are right ! I will make the changes in a v2
Thank you.

Alexandre Truong


Le jeu. 23 mai 2024 =C3=A0 09:58, Martin Jansa <martin.jansa@gmail.com> a =
=C3=A9crit :

> I think you can use ${BP} for downloafilename.
>
> On Thu, May 23, 2024 at 9:51=E2=80=AFAM Alexandre Truong via
> lists.openembedded.org
> <alexandre.truong=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> > In commit [0], we've switched away from SVN fetcher in SRC_URI.
> > The archives downloaded are named SourceHanSans*.zip
> > They are named this way regardless of the version 1.004 or 2.004.
> > So when the new archives checksums are tested, the fetcher will
> > look for the old archives with the same name in the DL_DIR.
> > From [1], there are checksum failures due to given checksums not
> > matching the ones in DL_DIR. Thus, downloaded archives are renamed
> > by adding ${PV} in archive name.
> >
> > [0]:
> https://git.openembedded.org/meta-openembedded/commit/?id=3D36a1e36e1272c=
a50e5dba0c4cf25ee3ff8b8f1c9
> > [1]:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/367/st=
eps/16/logs/errors
> >
> > Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> > Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb                 | 2 +-
> >  .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb                 | 2 +-
> >  .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb                 | 2 +-
> >  .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb                 | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-cn-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-cn-fonts_2.004.bb
> > index 391d46557..f6e1a4c6d 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-cn-fonts_2.004.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-cn-fonts_2.004.bb
> > @@ -11,7 +11,7 @@ inherit allarch fontcache
> >  #EXCLUDE_FROM_WORLD =3D "1"
> >
> >  SRC_URI =3D " \
> > -
> https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/S=
ourceHanSansCN.zip;subdir=3D${BP}
> \
> > +
> https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/S=
ourceHanSansCN.zip;subdir=3D${BP};downloadfilename=3Dsource-han-sans-cn-fon=
ts-${PV}.zip
> \
> >      file://44-source-han-sans-cn.conf \
> >  "
> >  SRC_URI[sha256sum] =3D
> "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-jp-fonts_2.004.bb
> > index f940478a8..9e18921d6 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-jp-fonts_2.004.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-jp-fonts_2.004.bb
> > @@ -11,7 +11,7 @@ inherit allarch fontcache
> >  #EXCLUDE_FROM_WORLD =3D "1"
> >
> >  SRC_URI =3D " \
> > -
> https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/S=
ourceHanSansJP.zip;subdir=3D${BP}
> \
> > +
> https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/S=
ourceHanSansJP.zip;subdir=3D${BP};downloadfilename=3Dsource-han-sans-jp-fon=
ts-${PV}.zip
> \
> >      file://44-source-han-sans-jp.conf \
> >  "
> >  SRC_URI[sha256sum] =3D
> "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-kr-fonts_2.004.bb
> > index f536d1b61..2b79cd762 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-kr-fonts_2.004.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-kr-fonts_2.004.bb
> > @@ -11,7 +11,7 @@ inherit allarch fontcache
> >  #EXCLUDE_FROM_WORLD =3D "1"
> >
> >  SRC_URI =3D " \
> > -
> https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/S=
ourceHanSansKR.zip;subdir=3D${BP}
> \
> > +
> https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/S=
ourceHanSansKR.zip;subdir=3D${BP};downloadfilename=3Dsource-han-sans-kr-fon=
ts-${PV}.zip
> \
> >      file://44-source-han-sans-kr.conf \
> >  "
> >  SRC_URI[sha256sum] =3D
> "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-tw-fonts_2.004.bb
> > index 0a4aff5e3..303edf3b6 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-tw-fonts_2.004.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-tw-fonts_2.004.bb
> > @@ -11,7 +11,7 @@ inherit allarch fontcache
> >  #EXCLUDE_FROM_WORLD =3D "1"
> >
> >  SRC_URI =3D " \
> > -
> https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/S=
ourceHanSansTW.zip;subdir=3D${BP}
> \
> > +
> https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/S=
ourceHanSansTW.zip;subdir=3D${BP};downloadfilename=3Dsource-han-sans-tw-fon=
ts-${PV}.zip
> \
> >      file://44-source-han-sans-tw.conf \
> >  "
> >  SRC_URI[sha256sum] =3D
> "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c8638e6ba170de806"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110496):
> https://lists.openembedded.org/g/openembedded-devel/message/110496
> > Mute This Topic: https://lists.openembedded.org/mt/106258754/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000011aa5c06191aa941
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, you are right ! I will make the changes in a v2<div>T=
hank you.</div><div><br></div><div>Alexandre Truong</div></div><div dir=3D"=
ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">Le=C2=A0jeu. 23 mai 2024 =C3=A0=C2=A009:58, Martin Jansa &lt;<a hr=
ef=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.c=
om</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">I think you can use ${BP} for downloafilename.<br>
<br>
On Thu, May 23, 2024 at 9:51=E2=80=AFAM Alexandre Truong via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;alexandre.truong=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" t=
arget=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; In commit [0], we&#39;ve switched away from SVN fetcher in SRC_URI.<br=
>
&gt; The archives downloaded are named SourceHanSans*.zip<br>
&gt; They are named this way regardless of the version 1.004 or 2.004.<br>
&gt; So when the new archives checksums are tested, the fetcher will<br>
&gt; look for the old archives with the same name in the DL_DIR.<br>
&gt; From [1], there are checksum failures due to given checksums not<br>
&gt; matching the ones in DL_DIR. Thus, downloaded archives are renamed<br>
&gt; by adding ${PV} in archive name.<br>
&gt;<br>
&gt; [0]: <a href=3D"https://git.openembedded.org/meta-openembedded/commit/=
?id=3D36a1e36e1272ca50e5dba0c4cf25ee3ff8b8f1c9" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?id=3D36a=
1e36e1272ca50e5dba0c4cf25ee3ff8b8f1c9</a><br>
&gt; [1]: <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/156/builds/367/steps/16/logs/errors" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/367/ste=
ps/16/logs/errors</a><br>
&gt;<br>
&gt; Signed-off-by: Alexandre Truong &lt;<a href=3D"mailto:alexandre.truong=
@smile.fr" target=3D"_blank">alexandre.truong@smile.fr</a>&gt;<br>
&gt; Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr"=
 target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../ttf-fonts/<a href=3D"http://source-han-sans-cn-fonts_2.004.b=
b" rel=3D"noreferrer" target=3D"_blank">source-han-sans-cn-fonts_2.004.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../ttf-fonts/<a href=3D"http://source-han-sans-jp-fonts_2.004.b=
b" rel=3D"noreferrer" target=3D"_blank">source-han-sans-jp-fonts_2.004.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../ttf-fonts/<a href=3D"http://source-han-sans-kr-fonts_2.004.b=
b" rel=3D"noreferrer" target=3D"_blank">source-han-sans-kr-fonts_2.004.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../ttf-fonts/<a href=3D"http://source-han-sans-tw-fonts_2.004.b=
b" rel=3D"noreferrer" target=3D"_blank">source-han-sans-tw-fonts_2.004.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 4 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://sour=
ce-han-sans-cn-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-=
han-sans-cn-fonts_2.004.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=
=3D"http://source-han-sans-cn-fonts_2.004.bb" rel=3D"noreferrer" target=3D"=
_blank">source-han-sans-cn-fonts_2.004.bb</a><br>
&gt; index 391d46557..f6e1a4c6d 100644<br>
&gt; --- a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://source-han-=
sans-cn-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-han-san=
s-cn-fonts_2.004.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://source-han-=
sans-cn-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-han-san=
s-cn-fonts_2.004.bb</a><br>
&gt; @@ -11,7 +11,7 @@ inherit allarch fontcache<br>
&gt;=C2=A0 #EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 <a href=3D"https://github.com/adobe-fonts/source-han-sa=
ns/releases/download/2.004R/SourceHanSansCN.zip;subdir=3D$%7BBP%7D" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/adobe-fonts/source-han-san=
s/releases/download/2.004R/SourceHanSansCN.zip;subdir=3D${BP}</a> \<br>
&gt; +=C2=A0 =C2=A0 <a href=3D"https://github.com/adobe-fonts/source-han-sa=
ns/releases/download/2.004R/SourceHanSansCN.zip;subdir=3D$%7BBP%7D;download=
filename=3Dsource-han-sans-cn-fonts-$%7BPV%7D.zip" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/adobe-fonts/source-han-sans/releases/downlo=
ad/2.004R/SourceHanSansCN.zip;subdir=3D${BP};downloadfilename=3Dsource-han-=
sans-cn-fonts-${PV}.zip</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://44-source-han-sans-cn.conf \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;6841fc13f1c0d255cfeb33d2a2c68d24bbe=
bd94ae2c070347a2b2b200a1db4d6&quot;<br>
&gt; diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://sour=
ce-han-sans-jp-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-=
han-sans-jp-fonts_2.004.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=
=3D"http://source-han-sans-jp-fonts_2.004.bb" rel=3D"noreferrer" target=3D"=
_blank">source-han-sans-jp-fonts_2.004.bb</a><br>
&gt; index f940478a8..9e18921d6 100644<br>
&gt; --- a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://source-han-=
sans-jp-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-han-san=
s-jp-fonts_2.004.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://source-han-=
sans-jp-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-han-san=
s-jp-fonts_2.004.bb</a><br>
&gt; @@ -11,7 +11,7 @@ inherit allarch fontcache<br>
&gt;=C2=A0 #EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 <a href=3D"https://github.com/adobe-fonts/source-han-sa=
ns/releases/download/2.004R/SourceHanSansJP.zip;subdir=3D$%7BBP%7D" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/adobe-fonts/source-han-san=
s/releases/download/2.004R/SourceHanSansJP.zip;subdir=3D${BP}</a> \<br>
&gt; +=C2=A0 =C2=A0 <a href=3D"https://github.com/adobe-fonts/source-han-sa=
ns/releases/download/2.004R/SourceHanSansJP.zip;subdir=3D$%7BBP%7D;download=
filename=3Dsource-han-sans-jp-fonts-$%7BPV%7D.zip" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/adobe-fonts/source-han-sans/releases/downlo=
ad/2.004R/SourceHanSansJP.zip;subdir=3D${BP};downloadfilename=3Dsource-han-=
sans-jp-fonts-${PV}.zip</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://44-source-han-sans-jp.conf \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;1ae9f62ad620d686c4a049ce25cf54e3afd=
8fefc954a678c644cf9802750c17e&quot;<br>
&gt; diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://sour=
ce-han-sans-kr-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-=
han-sans-kr-fonts_2.004.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=
=3D"http://source-han-sans-kr-fonts_2.004.bb" rel=3D"noreferrer" target=3D"=
_blank">source-han-sans-kr-fonts_2.004.bb</a><br>
&gt; index f536d1b61..2b79cd762 100644<br>
&gt; --- a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://source-han-=
sans-kr-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-han-san=
s-kr-fonts_2.004.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://source-han-=
sans-kr-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-han-san=
s-kr-fonts_2.004.bb</a><br>
&gt; @@ -11,7 +11,7 @@ inherit allarch fontcache<br>
&gt;=C2=A0 #EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 <a href=3D"https://github.com/adobe-fonts/source-han-sa=
ns/releases/download/2.004R/SourceHanSansKR.zip;subdir=3D$%7BBP%7D" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/adobe-fonts/source-han-san=
s/releases/download/2.004R/SourceHanSansKR.zip;subdir=3D${BP}</a> \<br>
&gt; +=C2=A0 =C2=A0 <a href=3D"https://github.com/adobe-fonts/source-han-sa=
ns/releases/download/2.004R/SourceHanSansKR.zip;subdir=3D$%7BBP%7D;download=
filename=3Dsource-han-sans-kr-fonts-$%7BPV%7D.zip" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/adobe-fonts/source-han-sans/releases/downlo=
ad/2.004R/SourceHanSansKR.zip;subdir=3D${BP};downloadfilename=3Dsource-han-=
sans-kr-fonts-${PV}.zip</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://44-source-han-sans-kr.conf \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;02fe28a48c6381c49d61c27a1b173c77f0e=
6f2b9f2b68e79f076f10a6a8f4bfe&quot;<br>
&gt; diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://sour=
ce-han-sans-tw-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-=
han-sans-tw-fonts_2.004.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=
=3D"http://source-han-sans-tw-fonts_2.004.bb" rel=3D"noreferrer" target=3D"=
_blank">source-han-sans-tw-fonts_2.004.bb</a><br>
&gt; index 0a4aff5e3..303edf3b6 100644<br>
&gt; --- a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://source-han-=
sans-tw-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-han-san=
s-tw-fonts_2.004.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://source-han-=
sans-tw-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-han-san=
s-tw-fonts_2.004.bb</a><br>
&gt; @@ -11,7 +11,7 @@ inherit allarch fontcache<br>
&gt;=C2=A0 #EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 <a href=3D"https://github.com/adobe-fonts/source-han-sa=
ns/releases/download/2.004R/SourceHanSansTW.zip;subdir=3D$%7BBP%7D" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/adobe-fonts/source-han-san=
s/releases/download/2.004R/SourceHanSansTW.zip;subdir=3D${BP}</a> \<br>
&gt; +=C2=A0 =C2=A0 <a href=3D"https://github.com/adobe-fonts/source-han-sa=
ns/releases/download/2.004R/SourceHanSansTW.zip;subdir=3D$%7BBP%7D;download=
filename=3Dsource-han-sans-tw-fonts-$%7BPV%7D.zip" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/adobe-fonts/source-han-sans/releases/downlo=
ad/2.004R/SourceHanSansTW.zip;subdir=3D${BP};downloadfilename=3Dsource-han-=
sans-tw-fonts-${PV}.zip</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://44-source-han-sans-tw.conf \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;11d78c8fbc1a4bb04a453cdd65c99db8d41=
ec5cd6ba6d68c8638e6ba170de806&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#110496): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/110496" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/110496</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10625875=
4/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/106258754/3617156</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000011aa5c06191aa941--

