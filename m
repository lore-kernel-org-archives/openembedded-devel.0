Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE57C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 09:30:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.11309.1716456640195860732
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 02:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=woGAOKuL;
 spf=pass (domain: smile.fr, ip: 209.85.218.45, mailfrom: alexandre.truong@smile.fr)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59ad12efe3so528693666b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716456638; x=1717061438; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TtIOCdgT0EC/OUhQ1bVO2MDE/IQn/NdDnpiI0XUR67g=;
        b=woGAOKuLzi5xwuW8YV7dFfHKtTvebv/XYZ7ODsSDzyTaP8twhSZlRy3CbVfeqOF1qO
         c+Hog/HB7HBW/apm3efvn6jp4tBn9e/vXwklF53Oiawy1Vm8kGihtvRo7QMSy0pQcZ0X
         6/8TO2/eheKJgQ+axbUqyTodarNzJVr14ZTs0HHD8shJs4EOzqm8YtEpQyNnawXsdmsv
         B9MK9AJ7uPboQbu6hrl5fFKBnJHYVu8pxwRMpTVfrFYvp+0KG3OZ6zLi03g5MY6DuYsk
         G+fEymEIXD7vrL9nCT3TSOTheM7T3x8y5ZU7gfdBj5dbTq7td0yrgR79qhi1hwlZDy6o
         WVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716456638; x=1717061438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtIOCdgT0EC/OUhQ1bVO2MDE/IQn/NdDnpiI0XUR67g=;
        b=ddqYESRpVvBqoMP98kGyyRdaRFJ+KIgCqDh7t5a6qePQ9PLiXfhIlQH3t7mkdbSax3
         bs0fZnS81cmkjnzAIngLoQLqM4YmQHLtwpgZuGwXi3qezDO34/vBZ2cfJKSwaK4NsuQg
         q+ya+uwak+LpCpJCd1sZolqJuXb8o1AOkLhMyY5UaQ4JC8O6xmThSNlu4jnxiphDoaPH
         pQPDmqHCCGTEbeId/Eh8mcKho/sMwOsFPih8mLsw1TqJTY/LEtGSHQ23+yBdR4TZGoAW
         8leUPjeiW9q86Ax6XzOMVghA3jkiZZ4oP5HN4MICVx2hq4JJLrNp2chkJkAXYCX9M0uK
         Tx7g==
X-Gm-Message-State: AOJu0YwCLRf5zLOlwRduSctszBMilA9dSarUKDnSN1g5cYUk25YzoQC+
	M5a/ocBlVYQrUkFrDyoSvhZL5ut6XkHErR8oWgKs+lvkbc+H0bxxkduws0La8lTIkyGaXxhh7N8
	R5EfRkg/x9S2WgtRkoEirZ6pLdsNfXbMRn4HwrQ==
X-Google-Smtp-Source: AGHT+IHD2gOJOuLHh9+OcD4N5wCGUPcjj9tCllrOZwZXGnQCM3F/ssMF60tATM9bf6Ftmk63vGuhbcTZBbufvTfKYwc=
X-Received: by 2002:a50:9b12:0:b0:578:178e:8cda with SMTP id
 4fb4d7f45d1cf-57832a0266fmr3726188a12.7.1716456638383; Thu, 23 May 2024
 02:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240523083122.17258-1-alexandre.truong@smile.fr> <CA+chaQfgnV83v4Eh1NkPDbxkUXTv7DnZtSrceD8ZAD7ikQrhag@mail.gmail.com>
In-Reply-To: <CA+chaQfgnV83v4Eh1NkPDbxkUXTv7DnZtSrceD8ZAD7ikQrhag@mail.gmail.com>
From: Alexandre TRUONG <alexandre.truong@smile.fr>
Date: Thu, 23 May 2024 11:30:27 +0200
Message-ID: <CAN21hX4Vxgr0fEEAddcSRwHJ+yom6PRJOaNx-iOXrydbCZf2fw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] source-han-sans-*-fonts: rename
 downloaded files in SRC_URI
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000003426b406191bb404"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 09:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110502

--0000000000003426b406191bb404
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It works for me.
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>

Le jeu. 23 mai 2024 =C3=A0 10:49, Martin Jansa <martin.jansa@gmail.com> a =
=C3=A9crit :

> Thanks looks better, it can be simplified further, see:
>
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa/=
master&id=3D80fdbf37b3252ed263091fafe6a156655f1a89fb
>
> Please review and if you agree with it, I'll test it and send it for
> master-next.
>
> Notice that there is inconsistent use of UNPACKDIR in these recipes
> (from master-next) so this will allow us to clean it up a bit in
> single .inc file.
>
> On Thu, May 23, 2024 at 10:31=E2=80=AFAM Alexandre Truong via
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
> > following their package name and version.
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
> > index 391d46557..db4ff4269 100644
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
ourceHanSansCN.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip
> \
> >      file://44-source-han-sans-cn.conf \
> >  "
> >  SRC_URI[sha256sum] =3D
> "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-jp-fonts_2.004.bb
> > index f940478a8..7ece51128 100644
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
ourceHanSansJP.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip
> \
> >      file://44-source-han-sans-jp.conf \
> >  "
> >  SRC_URI[sha256sum] =3D
> "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-kr-fonts_2.004.bb
> > index f536d1b61..0cbe438ef 100644
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
ourceHanSansKR.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip
> \
> >      file://44-source-han-sans-kr.conf \
> >  "
> >  SRC_URI[sha256sum] =3D
> "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/
> source-han-sans-tw-fonts_2.004.bb
> > index 0a4aff5e3..3b4eeb271 100644
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
ourceHanSansTW.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip
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
> > View/Reply Online (#110500):
> https://lists.openembedded.org/g/openembedded-devel/message/110500
> > Mute This Topic: https://lists.openembedded.org/mt/106258987/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000003426b406191bb404
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It works for me.<br>Reviewed-by: Alexandre Truong &lt;<a h=
ref=3D"mailto:alexandre.truong@smile.fr">alexandre.truong@smile.fr</a>&gt;<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Le=C2=A0jeu. 23 mai 2024 =C3=A0=C2=A010:49, Martin Jansa &lt;<a href=3D"=
mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks l=
ooks better, it can be simplified further, see:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded-contrib/commit/?h=
=3Djansa/master&amp;id=3D80fdbf37b3252ed263091fafe6a156655f1a89fb" rel=3D"n=
oreferrer" target=3D"_blank">https://git.openembedded.org/meta-openembedded=
-contrib/commit/?h=3Djansa/master&amp;id=3D80fdbf37b3252ed263091fafe6a15665=
5f1a89fb</a><br>
<br>
Please review and if you agree with it, I&#39;ll test it and send it for<br=
>
master-next.<br>
<br>
Notice that there is inconsistent use of UNPACKDIR in these recipes<br>
(from master-next) so this will allow us to clean it up a bit in<br>
single .inc file.<br>
<br>
On Thu, May 23, 2024 at 10:31=E2=80=AFAM Alexandre Truong via<br>
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
&gt; following their package name and version.<br>
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
&gt; index 391d46557..db4ff4269 100644<br>
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
filename=3D$%7BBP%7D.zip" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN=
.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://44-source-han-sans-cn.conf \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;6841fc13f1c0d255cfeb33d2a2c68d24bbe=
bd94ae2c070347a2b2b200a1db4d6&quot;<br>
&gt; diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://sour=
ce-han-sans-jp-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-=
han-sans-jp-fonts_2.004.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=
=3D"http://source-han-sans-jp-fonts_2.004.bb" rel=3D"noreferrer" target=3D"=
_blank">source-han-sans-jp-fonts_2.004.bb</a><br>
&gt; index f940478a8..7ece51128 100644<br>
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
filename=3D$%7BBP%7D.zip" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP=
.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://44-source-han-sans-jp.conf \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;1ae9f62ad620d686c4a049ce25cf54e3afd=
8fefc954a678c644cf9802750c17e&quot;<br>
&gt; diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://sour=
ce-han-sans-kr-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-=
han-sans-kr-fonts_2.004.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=
=3D"http://source-han-sans-kr-fonts_2.004.bb" rel=3D"noreferrer" target=3D"=
_blank">source-han-sans-kr-fonts_2.004.bb</a><br>
&gt; index f536d1b61..0cbe438ef 100644<br>
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
filename=3D$%7BBP%7D.zip" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR=
.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://44-source-han-sans-kr.conf \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;02fe28a48c6381c49d61c27a1b173c77f0e=
6f2b9f2b68e79f076f10a6a8f4bfe&quot;<br>
&gt; diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://sour=
ce-han-sans-tw-fonts_2.004.bb" rel=3D"noreferrer" target=3D"_blank">source-=
han-sans-tw-fonts_2.004.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=
=3D"http://source-han-sans-tw-fonts_2.004.bb" rel=3D"noreferrer" target=3D"=
_blank">source-han-sans-tw-fonts_2.004.bb</a><br>
&gt; index 0a4aff5e3..3b4eeb271 100644<br>
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
filename=3D$%7BBP%7D.zip" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW=
.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip</a> \<br>
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
&gt; View/Reply Online (#110500): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/110500" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/110500</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10625898=
7/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/106258987/3617156</a><br>
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

--0000000000003426b406191bb404--

