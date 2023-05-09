Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329D3C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 11:28:52 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.29409.1683631725897320357
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 04:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KKarbxk3;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ac826a1572so58283081fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 04:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683631724; x=1686223724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8fNL2UiOw7HN5Onw9Fr2QMLTRVyn66BQYBN4UOQPhhY=;
        b=KKarbxk31Kndmls9ZbaVsj594mD2YDTOj8/rZAxzWX/kEyNPqBGir7vBNjVq1OTcmw
         oQZq0/toDC0dW7ZlM/A8g/S8GBufwTS2xpPpgCmIWA0N/gFI7/hAWirZ4cRmlDzac6lx
         Stg3WLfGV3ElWzL4Vhsn5F8bwHGeko4wILiUsLZ5Ld6FWzvIIIz2lFqpy6zSDVV2IioT
         Tt2JgAoO1NjrpP5zez8wdazuVJ/RUg+mRy9fqga9+DN0ySYNUfSR3AqidDW0PqMwpwpM
         snphOYJZBmkPEk87s1Hw5O3WkH5fXRgWbC4o6SNIchtvMTZYY5PtNR7ob4rGCDnFMNR4
         NMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631724; x=1686223724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fNL2UiOw7HN5Onw9Fr2QMLTRVyn66BQYBN4UOQPhhY=;
        b=itqgJ2qNjeMaIoRTlA6PLMI/X5EoIyGdPSvv5zmkF1f7Su9sR5Y/lNw729R33a/We7
         3LjIqYVb4tzySjrLxISDduMm7KAvrYxx/JrfqXWz0/vlF1/8cyo/YwdJTqeFueqs7f1a
         dOTvCHUh7vGvFB+ur2+OEYLc4beAd9oksfKxVS5jR5HMwLyAAigQyPZ61s9zMhjCvVba
         WEXuVwxVWoWWKpvkTxF76yuzgA77x6OTnYl+NWoQhqxmCnsanijEJriKBZoAfsNCxUNK
         WFUKAV0NP4/rAgtcHFqz9bP0cEHV9UKPZ/SZzu4d8BElJNd9W5m3EDXlFB6eIIhxdL0J
         4EwQ==
X-Gm-Message-State: AC+VfDyCkfsb2zF5dqlmfyVBWK3b0PbI7KhsWXqxcXwGcsMQEizHf9gZ
	8twWxPWjNM4RIOWaCCEYBi4uYpDHt6Jzvk+IPRY=
X-Google-Smtp-Source: ACHHUZ4VW/UTIpdD4DsKiI27ftxydWiAKu9pyPJ/RnhnDcBVqVZATIy4r+qm/fo8PIDmDjy3b3x5N8BiI+dPoSiup20=
X-Received: by 2002:a2e:8715:0:b0:2a8:ac62:7fea with SMTP id
 m21-20020a2e8715000000b002a8ac627feamr862763lji.22.1683631723936; Tue, 09 May
 2023 04:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230509074509.7362-1-liu.ming50@gmail.com> <20230509074509.7362-3-liu.ming50@gmail.com>
 <4568531a-3825-7ad3-53e1-989f4c5211c7@gmail.com>
In-Reply-To: <4568531a-3825-7ad3-53e1-989f4c5211c7@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 9 May 2023 13:28:43 +0200
Message-ID: <CALatG=4DgpKLHOdfACtPo+jkuLgf3hOu8myKu_5fYQDzd11J0Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [kirkstone] [PATCH 1/1] lmdb: Don't inherit base
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, francesco.dolcini@toradex.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d67fe805fb410ee1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 11:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102500

--000000000000d67fe805fb410ee1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, akuster808:

It was sent by mistake, sorry, I have made a V2 to remove it.

the best,
thank you

akuster808 <akuster808@gmail.com> =E6=96=BC 2023=E5=B9=B45=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A

>
>
> On 5/9/23 3:45 AM, Ming Liu wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > base is always inherited so remove this code which will soon cause an
> error.
>
> This is already in kirkstone:
>
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-dbs=
/lmdb?h=3Dkirkstone&id=3Dc5b5f631fc485e91f67827c536c06215a803d7cc
>
> Was this meant for another branch?
>
> -armin
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit a755af4fb5ca2e158b00214bb18e27ba69c200fd)
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >   meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> > index f23960f40..a76d388d7 100644
> > --- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> > +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> > @@ -16,7 +16,7 @@ SRC_URI =3D "git://
> github.com/LMDB/lmdb.git;nobranch=3D1;protocol=3Dhttps \
> >
> >   SRCREV =3D "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
> >
> > -inherit base ptest
> > +inherit ptest
> >
> >   S =3D "${WORKDIR}/git/libraries/liblmdb"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102487):
> https://lists.openembedded.org/g/openembedded-devel/message/102487
> > Mute This Topic: https://lists.openembedded.org/mt/98779065/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> akuster808@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000d67fe805fb410ee1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, akuster808:</div><div><br></div><div>It was sent =
by mistake, sorry, I have made a V2 to remove it.</div><div><br></div><div>=
the best,</div><div>thank you<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">akuster808 &lt;<a href=3D"mailto:aku=
ster808@gmail.com">akuster808@gmail.com</a>&gt; =E6=96=BC 2023=E5=B9=B45=E6=
=9C=889=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8812:57=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
>
<br>
On 5/9/23 3:45 AM, Ming Liu wrote:<br>
&gt; From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;<br>
&gt; base is always inherited so remove this code which will soon cause an =
error.<br>
<br>
This is already in kirkstone:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-oe/re=
cipes-dbs/lmdb?h=3Dkirkstone&amp;id=3Dc5b5f631fc485e91f67827c536c06215a803d=
7cc" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta=
-openembedded/commit/meta-oe/recipes-dbs/lmdb?h=3Dkirkstone&amp;id=3Dc5b5f6=
31fc485e91f67827c536c06215a803d7cc</a><br>
<br>
Was this meant for another branch?<br>
<br>
-armin<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; (cherry picked from commit a755af4fb5ca2e158b00214bb18e27ba69c200fd)<b=
r>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-dbs/lmdb/<a href=3D"http://lmdb_0.9.29.bb"=
 rel=3D"noreferrer" target=3D"_blank">lmdb_0.9.29.bb</a> | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-dbs/lmdb/<a href=3D"http://lmdb_0.9.29.bb=
" rel=3D"noreferrer" target=3D"_blank">lmdb_0.9.29.bb</a> b/meta-oe/recipes=
-dbs/lmdb/<a href=3D"http://lmdb_0.9.29.bb" rel=3D"noreferrer" target=3D"_b=
lank">lmdb_0.9.29.bb</a><br>
&gt; index f23960f40..a76d388d7 100644<br>
&gt; --- a/meta-oe/recipes-dbs/lmdb/<a href=3D"http://lmdb_0.9.29.bb" rel=
=3D"noreferrer" target=3D"_blank">lmdb_0.9.29.bb</a><br>
&gt; +++ b/meta-oe/recipes-dbs/lmdb/<a href=3D"http://lmdb_0.9.29.bb" rel=
=3D"noreferrer" target=3D"_blank">lmdb_0.9.29.bb</a><br>
&gt; @@ -16,7 +16,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/LMDB/lmdb.git;nobranch=3D1;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/LMDB/lmdb.git;nobranch=3D1;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRCREV =3D &quot;8ad7be2510414b9506ec9f9e24f24d04d9b04a1a&=
quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -inherit base ptest<br>
&gt; +inherit ptest<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git/libraries/liblmdb&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#102487): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/102487" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/102487</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98779065=
/3616698" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98779065/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000d67fe805fb410ee1--

