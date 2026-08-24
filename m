Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9E8C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 19:57:53 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6167.1787601466584188235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 12:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SyfqBafS;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-765c077b5c1so1058173137.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 12:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787601465; cv=none;
        d=google.com; s=arc-20260327;
        b=QIxr9aGuutZdTNnk2HBGLyZ5cxZOpv1AeWyFN+WrCW5aelcNQ9Mo1VNvHEyTlnTOYg
         FkWGc3XLAC0MAWAmeJGxDI+7TEeZd1GEnoMYRg4D1cZS2NC8iishfApWlc/bKydUKQJj
         hTcwJ+/cCCQfemzs0MtOWEgzBtLw0YKzz1ftW7ja4usU33VaAf8r8WG/8ZiZP637CLi/
         wolneSURhVFtJO4dnHWW9Voa+j9svMvActaqx9bSsssJPyeSQN7zs0+keeQEGEAPYbbi
         +bZ2Wj/C//lkqJh5Iio/O6AtRwuirY9pG/pO5TJBRbN0gRIQa101YPIZ2LnOQKpfJP0O
         6mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vEPLjwXFecLugMIsmr0gEO+P/gJPHRgoD0AMF0COaWA=;
        fh=jS7bAEzFxckajYZuOATSvi0CRTT8wptu76L7EbS5k0M=;
        b=SpoO8UB7lGhGMRKyWBi+EDg/n2ZfGArbzmCQvwxsr97rmkBrCOn+qLKCdw71EfPaeo
         G8uDhflIrTlB92KPwXmMgKcif7BwTYXzUcvhPO/+yjlDbYz3FZnSNB7kk0vXTgjEKIQP
         8YeT4tPFRcFSFIlc//9DQWc39dJGin2KDjqBim2Szj5Ip5/CUREn+Ba3sMsBfcyFClaF
         2d6MY2PMMEw+vk0dCRJGH6698zaOfTWlaAR8AE+oah61jd2ZYgoTCWPHtj47uB332R/W
         5T04j3av9y52sEbkrEhrKmX5Bledis90d4SYZUXBSd3X30m++vlZHe/9/L3mXQ2pg4nn
         ajCA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787601465; x=1788206265; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEPLjwXFecLugMIsmr0gEO+P/gJPHRgoD0AMF0COaWA=;
        b=SyfqBafSgUQ6XNTf6HU0UTYi1lwV2lA2lVB72dvANqORAGI5kSa7S7JIkng+Kbl4NK
         /hH0A1YCs5YCObh5/H1TyekpH/2x7/rLDvn2RCS/QqvsyjdSZtMAwvpiVTs6QBuM2GE4
         +HjkoGDgiM2O24Ky1fdgHvwA9pLytbPQ1LCYXozldxrJGsM6CznvMzqcrgjhk/R45XSZ
         qyG6vu0rj+lQgI0yW2p0wgrMFzVwSRDbOXON6A7+gzVNOCPjh80bfiH/J5ow7RFBMWiS
         MjL89C7DBWZloZsh7ZSmj8v9ofgWyVEB/GKP+u0o4EUC5ub1WB2fG5bFvBrXE657oEMg
         +5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601465; x=1788206265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vEPLjwXFecLugMIsmr0gEO+P/gJPHRgoD0AMF0COaWA=;
        b=dJjKQid4/WQvLUN32fnOG2NyPElJbGdNJMB9GtZz7ldJ0CTTLYh+KcQ/kkExF7KN9H
         KZU85CL8t0dZxtGAg7yvFfbr2P7E3tj8V/cHGbtIcxYsUwp63AKdtjfhjvgjgduV6BIB
         RlJUFbVhRFwJnDaegZ7odtVX4h873YgkbZlD4y6+7CGBSsEGXpgG5M2HCJWjRV7cztQD
         dykGI+gFtCtM0PHdqc+iRYH9sX/PYWFQgRYRWMMDZI3KZsriyB/CMlTM/EZ1FGRo/Nfg
         v5q9oJos/3A3GlMTpVgh8YPiGY3FryIOyOiY+Y1Xs/8z2l0h34F4mPpSXu3lyGrMEbIW
         zWDQ==
X-Gm-Message-State: AFuF++n7TNZHXpOr3O30BEY5Odh4UtuxzOjM8NGSnrzpN9b8d2mo+TCy
	WnzJ42bOapZjQNXf0fPsC9fMY9pv5K6SRQecWhzk348jvXTMkdMBiECdw+Vk8yFwdvJO5MI5dZz
	8YIw4QRxHNGfo2+ewDWqEMuIIN8Rthpk=
X-Gm-Gg: AR+sD104Ps9jC1fTuYMPuE8yl/mSwyxdccGuFOHNg+wI/L33YZDfwcBC3SCyehMJlRb
	qCxkSmmDbY9BgROcdDP+/GkTyX84ez+kMep+Q4P5pct3ZGnKa8CkiY9lRvuGypnAc0fdzmEo9eV
	4/vF7iXy9TvIIgpNtrezqzSTtHwv2NYobPrabtQ7fQledvgE2CrPKz4AbqiE+90j3cl79vaqagK
	3hVBIeWacePm2N5q/YVfXNs/tfs7FfDO9pw0k61IWzL5m8KW07di1NAKAvgRdCDRSuGMOJF0ua1
	eJwi2UpSeaawVrhCDdfxiD6+6iS4r5PGcI3FdMdFEjbGHzIzBsMnT+nD7YqBnoePUDLwCXRHtrO
	5kZHhXwKputE=
X-Received: by 2002:a05:6102:290f:b0:77b:b14e:b670 with SMTP id
 ada2fe7eead31-77fe7391b4dmr420533137.8.1787601465159; Mon, 24 Aug 2026
 12:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260824102907.2341187-1-locutusofborg@debian.org> <CAMKF1spXrsRbf97NnyYa6yxpo4dGowqjYBAFEw7WPfrzKU6pYw@mail.gmail.com>
In-Reply-To: <CAMKF1spXrsRbf97NnyYa6yxpo4dGowqjYBAFEw7WPfrzKU6pYw@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Mon, 24 Aug 2026 21:57:33 +0200
X-Gm-Features: AcwNN1VECK_xRp-f8_jAONiKokl99C93GcX83pqwP1cmKqocUQcOmmummtZRbUk
Message-ID: <CAATN8PWAVr3ac6CvrdzjjB4HFPYjeck1QskdZOi3qkyuOcCq0w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: update sha256sum hash for
 new release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <locutusofborg@debian.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Content-Type: multipart/alternative; boundary="00000000000054b4650659d0663a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 19:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129467

--00000000000054b4650659d0663a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Done! Thank you

On Mon, Aug 24, 2026, 20:57 Khem Raj <raj.khem@gmail.com> wrote:

> In order to help bisecting in future, please squash it into upgrade patch
> and resend a v2.
>
> On Mon, Aug 24, 2026 at 3:34=E2=80=AFAM Gianfranco via lists.openembedded=
.org
> <costamagna.gianfranco=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> ---
>>  .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers_7.2.16.bb b/meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers_7.2.16.bb
>> index 952eca1a06..f12270680c 100644
>> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.b=
b
>> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.b=
b
>> @@ -24,7 +24,7 @@ SRC_URI =3D "
>> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
>>      file://Makefile.utils \
>>
>>  file://0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch=
 \
>>  "
>> -SRC_URI[sha256sum] =3D
>> "384f293184c52fd51bc941c17d753b4019446f53a6b07c828adfb3e61fe0a500"
>> +SRC_URI[sha256sum] =3D
>> "50356ccdaefe8f03537600ec31898b506e3a85ce79b94f26fb6cc1920c9e18eb"
>>
>>  S ?=3D "${UNPACKDIR}/vbox_module"
>>  S:task-unpack =3D "${UNPACKDIR}/${VBOX_NAME}"
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#129457):
>> https://lists.openembedded.org/g/openembedded-devel/message/129457
>> Mute This Topic: https://lists.openembedded.org/mt/120900785/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--00000000000054b4650659d0663a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Done! Thank you</div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 24, 2026=
, 20:57 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
In order to help bisecting in future, please squash=C2=A0it into upgrade pa=
tch and resend a v2.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Aug 24, 2026 at 3:34=E2=80=AFAM Gianfranco via =
<a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferr=
er">lists.openembedded.org</a> &lt;costamagna.gianfranco=3D<a href=3D"mailt=
o:gmail.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Signed-off-by: Gianfranco Costamagna &lt;<a h=
ref=3D"mailto:locutusofborg@debian.org" target=3D"_blank" rel=3D"noreferrer=
">locutusofborg@debian.org</a>&gt;<br>
Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfr=
anco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfranco@ya=
hoo.it</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/vboxguestdrivers/<a href=3D"http://vboxguestdrive=
rs_7.2.16.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vboxguestdriv=
ers_7.2.16.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vbo=
xguestdrivers_7.2.16.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vb=
oxguestdrivers_7.2.16.bb</a> b/meta-oe/recipes-support/vboxguestdrivers/<a =
href=3D"http://vboxguestdrivers_7.2.16.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">vboxguestdrivers_7.2.16.bb</a><br>
index 952eca1a06..f12270680c 100644<br>
--- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxguestd=
rivers_7.2.16.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vboxguest=
drivers_7.2.16.bb</a><br>
+++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxguestd=
rivers_7.2.16.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vboxguest=
drivers_7.2.16.bb</a><br>
@@ -24,7 +24,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.virtualbox.o=
rg/virtualbox/$%7BPV%7D/$%7BVBOX_NAME%7D.tar.bz2" rel=3D"noreferrer norefer=
rer" target=3D"_blank">http://download.virtualbox.org/virtualbox/${PV}/${VB=
OX_NAME}.tar.bz2</a><br>
=C2=A0 =C2=A0 =C2=A0file://Makefile.utils \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-vboxvideo-let-the-build-decide-if-drm_fb_he=
lper_alloc.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;384f293184c52fd51bc941c17d753b4019446f53a6b07=
c828adfb3e61fe0a500&quot;<br>
+SRC_URI[sha256sum] =3D &quot;50356ccdaefe8f03537600ec31898b506e3a85ce79b94=
f26fb6cc1920c9e18eb&quot;<br>
<br>
=C2=A0S ?=3D &quot;${UNPACKDIR}/vbox_module&quot;<br>
=C2=A0S:task-unpack =3D &quot;${UNPACKDIR}/${VBOX_NAME}&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129457): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129457" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/129457</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120900785/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120900785/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--00000000000054b4650659d0663a--

