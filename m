Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062E0FD377C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 17:56:55 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51577.1772042209522371637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 09:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nU777Gw6;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: geoffhp@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79801df3e21so69959187b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772042209; cv=none;
        d=google.com; s=arc-20240605;
        b=W/2lwxGL1kDi1zs7sGKU6+hm1mbe2lTf48Nb2o8ZsVwvTsMMv0/Sem3OcknsVw78mP
         4FcTZt8t0XQ2pqhAJ7/BXwTvaVkGjpa0hu99/y+L+u+5VPT6BEWIdeQ+w4DuV5bIVozs
         5yxSQVso+xgasq4lOxnEPxZM0tao5PXzn/vZcdLy5QGAGqpW9izxPXh/vbbbE1LiYJqG
         ZEBD0kt9cFCkZA5DXytmxzOyqp8DmeqrHRNU+BJP+zH863Bcc5sRPXSWHMmLQ7zPXeQ8
         saZWpjSGS8+Z+1ar1Vml74KpUOSljl3yW4ThkIk/I9+4ZpI30H9SKOKIjMKRifiwTJ35
         ma5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N+5bfXKpuXEyV2ZXSB+we9s3le6LU9t5NfVHv968xuc=;
        fh=igSkpWTjPnKS03mR+3SwoSEcWI+i1B+KwDEl7LAYVDo=;
        b=iOb7+/Qysf1PMyitMNyxc9uqt1YD7TiL2X8uTJMDhYRhgLcE+zc/iUV2444ctnZ22X
         2En8zTdvM6qZOpEbHpBmt3rbl9ftPONRsZmCd4hwPQ1fnAbhRkO/Y6lQWZ9GCWIuZXcS
         de+YJ2CWDJ3Gtyt6XkwQbB6ylbQyjt/UV20lU8Aq52kxklM8+h5PDsFOU6whDw7mS33s
         iKgdT4MTC7vI3BtUrlr+chXAxGzHI5Zq6T+BAfPucqeAk9kU+8tbDSApAQBG9Meay37t
         NYuVsLnUNCH3wITD+R/wfAIjJPlkwuMiW6hQiIwtLbfGrIyPOLrUwYXkdyQrfdZpCt/Z
         uSDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772042208; x=1772647008; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+5bfXKpuXEyV2ZXSB+we9s3le6LU9t5NfVHv968xuc=;
        b=nU777Gw6qR8mI7JbV/77jfOD19r3/EsRBpdC7BKJCqsAMnDHohxqI9TKyTDJwLSDqT
         FXbp/MLQI9O5yvNiOd7IeSNiSWaO2zP6dzfFvXvdj4YC7+dpzd28dLE6F9QNGb48HA/Z
         AohAlgX6bf5nEHk42LwM8B0HcOS4DZJyHNTvRHdgRLEQNEaqshhqC6W16WzxOsvRB2Vz
         GAGyPM7TUIaj/ajiIhVZxc36+zlywjVdLr0qhAD6yPxR4sUVYQAcJCMaEiAxqFJMz0GJ
         Ur/0t4QkNJ2vGQAzZDDrnJtteguune1fIsPD+RygXDNOb3auWYb3fdD84U2dGIVYALkL
         KGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042208; x=1772647008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+5bfXKpuXEyV2ZXSB+we9s3le6LU9t5NfVHv968xuc=;
        b=NUB1nOUAznVA9yvVGO8Mln3Hy2dYb175r6K7oMoqjiePtmPqOYflgRjhpfgqrEFg3b
         OX5yjDJfJmIYK7Q4oeKX4iZ6bXdiNBTv7bJpm3ENSGPThYovezPWFRZ9w+II+mzSSAeU
         A6haquSmglNeG4CeIpdXpO+x69NUAso8ar55MtZoMuDRv+y15XVXqi1n3veXJbQdtGc1
         xcS9MLEMqRVGRt/Hq0hUDaOGUgMI59lJ0H9QBJlABSZc0VyHNqcZrr38djw1iD4b+Ggq
         P3bzfm8JPwbuwjJ+40bfyCKom8ixreiyvq4xc0IRQ6vWGehM6589q1OthB3LjWGo7OH3
         lJYg==
X-Gm-Message-State: AOJu0Yyj7Hr9aKAw7svEa2HOXjumxtl2nA2b0rFx1YgM88AkoIXMLRO1
	AP/ZXTChHnWBaFy9efN/CPOz3Va5jpAHy4Z8w3aou4jIdnfTf/6Ojk5jGbZ2NLzFhNispAKrI9r
	pr4ZHFvjjmQ7e20jpBEZiNwc1kGCgrHE=
X-Gm-Gg: ATEYQzwZy3e+U+VlYcSe+2Im4Jpmn367+w/RS2VOghtI/v4FzFfvmUTr4YKaozmUYo8
	oDflDzBwkOk7b94agTf4W6JcGbac0LX9vFscufNr8CS2S42P8xXT2byc0jQ4rML/cxpvH1EpCq5
	zY/PPY0xwm62iCuo3J92jEw1mFk+hQvxSQX4GEsRXbwMFWSV16jXPspX2AbiqtQH+xS/foORluM
	tHHHGSX1y74miSj4Mn8q5dzv6P+mwllQTYISPZjz5lgBpgME12CcE+CAsfKK42RTXgIvnbXVFLC
	DGVda0S/
X-Received: by 2002:a05:690c:84:b0:794:ea37:1d3a with SMTP id
 00721157ae682-7986fca7968mr12517797b3.28.1772042208472; Wed, 25 Feb 2026
 09:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20260220014927.412049-1-geoffrey.parker@arthrex.com> <CA+s=J=xRGkj_QK05LQ=MhYOFemL1jNkQn3HLs1qT-8+8WfTwEg@mail.gmail.com>
In-Reply-To: <CA+s=J=xRGkj_QK05LQ=MhYOFemL1jNkQn3HLs1qT-8+8WfTwEg@mail.gmail.com>
From: Geoff Parker <geoffhp@gmail.com>
Date: Wed, 25 Feb 2026 09:56:37 -0800
X-Gm-Features: AaiRm538DPMZhArmitFKWm5tpJF5xsvnj1U_tP08pE9Tdt1S35OE1wFfS0K4bm8
Message-ID: <CAHNuFGJ-nL7kOpFEZ14j-QVqazhQhGpqiNnhTnzAYgrk2a4tNA@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-m2crypto: fix
 python3-m2crypto-native do_configure:prepend()
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Geoff Parker <geoffrey.parker@arthrex.com>
Content-Type: multipart/alternative; boundary="0000000000005cf5be064ba9ba41"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 17:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124655

--0000000000005cf5be064ba9ba41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

Yes is applies to whinlatter also.  I had submitted a patch to openembedded
master a few hours before submitting for scarthgap:

https://lore.kernel.org/all/20260220005225.401958-1-geoffrey.parker@arthrex=
.com/

On Tue, Feb 24, 2026 at 9:04=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> On Fri, Feb 20, 2026 at 9:49=E2=80=AFAM Geoff Parker via
> lists.openembedded.org <geoffhp=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > The recent workaround for
> https://github.com/swiftlang/swift/issues/69311
> > breaks python3-m2crypto-native, with error about missing e_os2.h file i=
n
> > recipe-sysroot-native.
> >
> > Apply do_configure:prepend to class-target only to fix.
>
> I will pick the scarthgap patch after it has been merged in master. Is
> this applicable to whinlatter branch as well?
>
> >
> > Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> > ---
> >  meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/
> python3-m2crypto_0.40.1.bb
> > index dce459477f..24e6ef9b32 100644
> > --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
> > @@ -46,7 +46,7 @@ export SWIG_FEATURES
> >
> >  export STAGING_DIR
> >
> > -do_configure:prepend() {
> > +do_configure:prepend:class-target() {
> >      # workaround for https://github.com/swiftlang/swift/issues/69311
> >      sed -i "/sys\/types.h/d"
> ${RECIPE_SYSROOT}${includedir}/openssl/e_os2.h
> >  }
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#124519):
> https://lists.openembedded.org/g/openembedded-devel/message/124519
> > Mute This Topic: https://lists.openembedded.org/mt/117903868/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005cf5be064ba9ba41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Anuj,=C2=A0<br><br>Yes is applies=C2=A0to whinlatter al=
so.=C2=A0 I had submitted a patch to openembedded master a few hours before=
 submitting for scarthgap:<br><br><a href=3D"https://lore.kernel.org/all/20=
260220005225.401958-1-geoffrey.parker@arthrex.com/">https://lore.kernel.org=
/all/20260220005225.401958-1-geoffrey.parker@arthrex.com/</a></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Feb 24, 2026 at 9:04=E2=80=AFPM Anuj Mittal &lt;<a href=3D"=
mailto:anuj.mittal@oss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Fe=
b 20, 2026 at 9:49=E2=80=AFAM Geoff Parker via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;geoffhp=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a=
>&gt;<br>
wrote:<br>
&gt;<br>
&gt; The recent workaround for <a href=3D"https://github.com/swiftlang/swif=
t/issues/69311" rel=3D"noreferrer" target=3D"_blank">https://github.com/swi=
ftlang/swift/issues/69311</a><br>
&gt; breaks python3-m2crypto-native, with error about missing e_os2.h file =
in<br>
&gt; recipe-sysroot-native.<br>
&gt;<br>
&gt; Apply do_configure:prepend to class-target only to fix.<br>
<br>
I will pick the scarthgap patch after it has been merged in master. Is<br>
this applicable to whinlatter branch as well?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@arth=
rex.com" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python3-m2=
crypto_0.40.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.4=
0.1.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-m2crypto_0.40.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2cry=
pto_0.40.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-m2crypto_0.40.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2c=
rypto_0.40.1.bb</a><br>
&gt; index dce459477f..24e6ef9b32 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2=
crypto_0.40.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.4=
0.1.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2=
crypto_0.40.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.4=
0.1.bb</a><br>
&gt; @@ -46,7 +46,7 @@ export SWIG_FEATURES<br>
&gt;<br>
&gt;=C2=A0 export STAGING_DIR<br>
&gt;<br>
&gt; -do_configure:prepend() {<br>
&gt; +do_configure:prepend:class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # workaround for <a href=3D"https://github.com/swi=
ftlang/swift/issues/69311" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/swiftlang/swift/issues/69311</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i &quot;/sys\/types.h/d&quot; ${RECIPE_SYSROO=
T}${includedir}/openssl/e_os2.h<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#124519): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/124519" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/124519</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11790386=
8/3616702" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/117903868/3616702</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:anuj.mittal@oss.qua=
lcomm.com" target=3D"_blank">anuj.mittal@oss.qualcomm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000005cf5be064ba9ba41--

