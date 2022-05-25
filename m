Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C42C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:10:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.10252.1653502222292791860
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxMh5YK4;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id u3so31218124wrg.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+5Tm+cdGPL5lL0UetF7WX5rw4uiB/R4JjcsYcJ56Rh4=;
        b=XxMh5YK4IqY4DFauaM4UVVyNcz70ixHbuvd/tZ9XR2ZcV89zG5uXbxp6OKzdMIgztM
         7f9q3Pkq8Sv6UrnWM50S/z9A60cmby6njlYQG6FQN5cigWCqdw6Q3BzBLO4KEIL0CcOG
         WfTghuYGa0uSSDy/qkEYFmGNV2HJoxRDYPesU439b2E6hgrpebXKc+LOJlmxROgePQR0
         8+3S4tKQbaTuFwsZ8U94TiojwWqORUtGzCg6LBmJni3iXZ12BI5ffjQnKYeSp14K9N/3
         R9Qzfr0yT2nvNWQcsKHv5MMHfQYqXE1lBF+tqwj3/Bn7RB91i5Q2MFOnEq/+q7EQ4a9h
         Z8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+5Tm+cdGPL5lL0UetF7WX5rw4uiB/R4JjcsYcJ56Rh4=;
        b=L6pyl8nZZjQ84Pty8uG45qUdLXZufnnGv74FNKlzET/1aMs7MoBIxTwUIGY1RdQxcL
         K6aUNVe5f0uV4d9R+ygGk07T8hCRNQOtpGXC0GDgWN2vybcO9tHxEkNqfET0hkpPh1B4
         GBlK3YAHVL8ZIBCuH5xtO2pvMbM7MwMki9JyxJKOu31V0HzvADlE63xMTHtz3OPMqY6Z
         6hDD292yh9ZRjaPvs1rli3+i1h6EamSdtp1bK/PZg8mhcH5xO1IVxi3yEmF0YaK/vG26
         itqs8h6ndDP6iSmXXCYAfYWeP1x93EsUJAh7Ox3PALagJHcZ8ZS1pPPWHBdDahnuXpa/
         1aQw==
X-Gm-Message-State: AOAM5313CEpOQV56IeMfp6sou6OlrHUnaYMpY0gpadizhUR6sFfquQ4g
	dZ17qCzNAOALq/DcRndOGyljm9yi9b6HcFHu2pE=
X-Google-Smtp-Source: 
 ABdhPJyFIjg5kZRfVXNkgtZAvF2+QI6+ufPmd5k2LQBFNiDjurcKDaYMUX5RzyIMgPfhXjtTPJthMuNW5whT253ouKk=
X-Received: by 2002:adf:d1a8:0:b0:20f:f808:2ac8 with SMTP id
 w8-20020adfd1a8000000b0020ff8082ac8mr6896148wrc.495.1653502220785; Wed, 25
 May 2022 11:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220512234307.1189721-1-denis@denix.org>
 <20220512234307.1189721-3-denis@denix.org>
 <16F26B2EAAE59EFB.12338@lists.openembedded.org>
In-Reply-To: <16F26B2EAAE59EFB.12338@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 May 2022 20:09:59 +0200
Message-ID: 
 <CA+chaQftM_8AAf-bF=6E8kgY1APry-ZPSicn9fOgDunfXOCcCg@mail.gmail.com>
Subject: Re: [oe] [kirkstone][PATCH 3/3] devmem2: update SRC_URI according to
 redirect
To: Martin.Jansa@gmail.com
Cc: Denys Dmytriyenko <denis@denix.org>,
 openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000815fb305dfd9fcc1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 18:10:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97272

--000000000000815fb305dfd9fcc1
Content-Type: text/plain; charset="UTF-8"

The history of this is deep :)

https://git.openembedded.org/openembedded/log/packages/devmem2?h=master
https://git.openembedded.org/openembedded/log/recipes/devmem2?h=master
https://git.openembedded.org/meta-openembedded/log/meta-oe/recipes-support/devmem2

On Wed, May 25, 2022 at 8:04 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> Anyone willing to create a repo for this on github instead of patching
> this in metadata?
>
> This is another reproducer for do_patch issue described here
> https://lists.yoctoproject.org/g/yocto/message/56602
>
> On Fri, May 13, 2022 at 1:43 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> http://www.free-electrons.com now redirects to https://bootlin.com
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> ---
>>  meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
>> b/meta-oe/recipes-support/devmem2/devmem2.bb
>> index ba7aad8ab..70d413521 100644
>> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
>> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
>> @@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-or-later"
>>  LIC_FILES_CHKSUM =
>> "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
>>  PR = "r7"
>>
>> -SRC_URI = "
>> http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c
>> \
>> +SRC_URI = "
>> https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
>>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
>>
>> file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
>>
>> file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
>> --
>> 2.25.1
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97270):
> https://lists.openembedded.org/g/openembedded-devel/message/97270
> Mute This Topic: https://lists.openembedded.org/mt/91070560/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000815fb305dfd9fcc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The history of this is deep :)<div><br></div><div><a href=
=3D"https://git.openembedded.org/openembedded/log/packages/devmem2?h=3Dmast=
er">https://git.openembedded.org/openembedded/log/packages/devmem2?h=3Dmast=
er</a><br></div><div><a href=3D"https://git.openembedded.org/openembedded/l=
og/recipes/devmem2?h=3Dmaster">https://git.openembedded.org/openembedded/lo=
g/recipes/devmem2?h=3Dmaster</a><br></div><div><a href=3D"https://git.opene=
mbedded.org/meta-openembedded/log/meta-oe/recipes-support/devmem2">https://=
git.openembedded.org/meta-openembedded/log/meta-oe/recipes-support/devmem2<=
/a><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, May 25, 2022 at 8:04 PM Martin Jansa via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D=
<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Anyone willing to create a repo for this on git=
hub instead of patching this in metadata?<div><br></div><div>This is anothe=
r reproducer for do_patch issue described here=C2=A0<a href=3D"https://list=
s.yoctoproject.org/g/yocto/message/56602" target=3D"_blank">https://lists.y=
octoproject.org/g/yocto/message/56602</a></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 13, 2022 at 1:43=
 AM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_bla=
nk">denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Michael Opdenacker &lt;<a href=3D"mailto:michael.o=
pdenacker@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>=
&gt;<br>
<br>
<a href=3D"http://www.free-electrons.com" rel=3D"noreferrer" target=3D"_bla=
nk">http://www.free-electrons.com</a> now redirects to <a href=3D"https://b=
ootlin.com" rel=3D"noreferrer" target=3D"_blank">https://bootlin.com</a><br=
>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" tar=
get=3D"_blank">denis@denix.org</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.bb" rel=3D"=
noreferrer" target=3D"_blank">devmem2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.bb" =
rel=3D"noreferrer" target=3D"_blank">devmem2.bb</a> b/meta-oe/recipes-suppo=
rt/devmem2/<a href=3D"http://devmem2.bb" rel=3D"noreferrer" target=3D"_blan=
k">devmem2.bb</a><br>
index ba7aad8ab..70d413521 100644<br>
--- a/meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.bb" rel=3D"=
noreferrer" target=3D"_blank">devmem2.bb</a><br>
+++ b/meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.bb" rel=3D"=
noreferrer" target=3D"_blank">devmem2.bb</a><br>
@@ -3,7 +3,7 @@ LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://devmem2.c;endline=3D38;md5=3Da9eb9f=
3890384519f435aedf986297cf&quot;<br>
=C2=A0PR =3D &quot;r7&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.free-electrons.com/pub/mirror/devm=
em2.c;downloadfilename=3Ddevmem2-new.c" rel=3D"noreferrer" target=3D"_blank=
">http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=3Ddev=
mem2-new.c</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://bootlin.com/pub/mirror/devmem2.c;down=
loadfilename=3Ddevmem2-new.c" rel=3D"noreferrer" target=3D"_blank">https://=
bootlin.com/pub/mirror/devmem2.c;downloadfilename=3Ddevmem2-new.c</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://devmem2-fixups-2.patch;app=
ly=3Dyes;striplevel=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-devmem.c-ensure-word-=
is-32-bit-and-add-support-for-6.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-devmem2-support-diffe=
rent-page-sizes-at-run-time.patch \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97270): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97270" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97270</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91070560/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91070560/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000815fb305dfd9fcc1--

