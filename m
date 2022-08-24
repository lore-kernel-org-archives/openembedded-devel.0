Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004F9C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 17:53:44 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.14156.1661363618691901745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 10:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AGmklnky;
 spf=pass (domain: gmail.com, ip: 209.85.128.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-333b049f231so480925137b3.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 10:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qK3XGWMJ36+o9jLw3055DXFdRM7iX393sIDHEsIo2yQ=;
        b=AGmklnky0jOp/2BY18QMY8pHBraFfMSlYRhgC8sXBAufe80y5X1HBj3CuRMCASJixk
         3Idfkc9b8QMj5ffOLa6DE1FQQiaAdz3bRygrXraJzYC+l3LYyBCO9VT7C/ksd9u4ehdw
         IqByhHTCd9H49cLKRKL0OhV4fUlFBQBYCO/5+ge2exAHVnpdmbqelFTpQgcZ7mS8oiBl
         kSgsCJa4NzcibfpMP6sEeRR+GCL38BKLXGY8vNSNyEEqq3hSuAHp9MPN0OXrd//yEZoZ
         XmDznH1Cpb5ohsRo/bfuOID1k6AAqsAefSEZot4/cwQO0pAAwBGoC3TDEf7TWJ+JPqJU
         vqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qK3XGWMJ36+o9jLw3055DXFdRM7iX393sIDHEsIo2yQ=;
        b=gRAGbeRTBZgQ8z6iY5X5Qsgyj8Z4HO4+5aRFLC1Q8BH7piN4jvyTQaY8xd7tsMY+YA
         dr/Whmk7qwhQiSmHA/KEXEjdF+8wzbAxm13x4NXKZJQ7ledcokQ0NxKclUhO2uEVBB2d
         HOmhjk3+YjvdUZOFH4NNweu7LdepLrhcxNJZKQKxD/xTPIixRe4/u51OIiucgqbl3kSq
         JpC83zH2PH5kmLLhEs/ExZdeKnFnq377QPWc8eDBBPXA2qP2jOrjT3ksglCzIXwaXPWa
         IqhQ9bbGuz01aLejnj9Ei0ZVhlwi/WMIhGHdFjJahi349ELnjZimzPnjO1eVMgW7HCFx
         yUOQ==
X-Gm-Message-State: ACgBeo3HZWZDySLF7hl1ANV71tKrdkzM6UvkzORi1vfwEAt+Ll9SQStO
	lp9gsi1yo+YDbzl88ycPEqrEJvm0LLwXqpSOWzU=
X-Google-Smtp-Source: 
 AA6agR7TfOl7HLsA+QkRs+1CC0kpqHwydHfwtMkkqoEXRVrVw2EAjyTRzlR/wW9fzahvN7N4k4gmlNfcAPxK1rGofC8=
X-Received: by 2002:a5b:107:0:b0:67c:4077:17f0 with SMTP id
 7-20020a5b0107000000b0067c407717f0mr219541ybx.363.1661363617816; Wed, 24 Aug
 2022 10:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220824153539.423878-1-mac@mcrowe.com>
 <CAMKF1spmzy7HkzNA36TmsK7BjrkBxXsBvO1ZCo759Ygd-Qrk5w@mail.gmail.com>
 <YwZftsa5qzXlqtqk@mcrowe.com>
In-Reply-To: <YwZftsa5qzXlqtqk@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Aug 2022 10:53:25 -0700
Message-ID: 
 <CAMKF1sp5+h68O=HauGr_bx4RNWpWdVEGxJt+_oA_+h7rqNj0vg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] yasm: Only depend on xmlto when docs are
 enabled
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000048666d05e7005c0d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 17:53:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98423

--00000000000048666d05e7005c0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 10:28 AM Mike Crowe <mac@mcrowe.com> wrote:

> On Wednesday 24 August 2022 at 09:05:05 -0700, Khem Raj wrote:
> > On Wed, Aug 24, 2022 at 8:35 AM Mike Crowe via lists.openembedded.org
> <mac=3D
> > mcrowe.com@lists.openembedded.org> wrote:
> >
> > > The yasm build system only requires xmlto when building its
> > > documentation. It automatically detects whether it is present at
> > > configure time.
> >
> >
> > Does it also detect it from build machine ?
>
> No, because of the recipe-specific sysroot it can't see my system version
> of xmlto.
>
> I have xmlto installed, yet log.do_configure contains:
>
> checking for xmlto... no
> configure: WARNING: xmlto not found, manpages will not be rebuilt.


That=E2=80=99s partly due to HOSTTOOLS now hiding majority of build system =
tools


>
> > Perhaps better to turn the knob on and off explicitly as well for
> > determinism
>
> I couldn't find a --disable-doc/--without-xmlto knob otherwise I would ha=
ve
> done. :(


Ok I think it=E2=80=99s fine as it is since someone would have to explicitl=
y add
xmlto to HOSTTOOLS to cause the issue


>
> Or did you mean that I should explicitly set ac_cv_prog_XMLTO with
> something like:
>
>  PACKAGECONFIG[docs] =3D ",ac_cv_prog_XMLTO=3D'',xmlto-native,"
>
> ?
>
> Thanks.
>
> Mike.
>

--00000000000048666d05e7005c0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 24, 2022 at 10:28 AM Mike Crowe &lt;<a href=3D"=
mailto:mac@mcrowe.com">mac@mcrowe.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Wednesday 24 August 2022 at 09:05:05 -0700, Khem Raj w=
rote:<br>
&gt; On Wed, Aug 24, 2022 at 8:35 AM Mike Crowe via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;mac=3D<br>
&gt; <a href=3D"mailto:mcrowe.com@lists.openembedded.org" target=3D"_blank"=
>mcrowe.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; The yasm build system only requires xmlto when building its<br>
&gt; &gt; documentation. It automatically detects whether it is present at<=
br>
&gt; &gt; configure time.<br>
&gt; <br>
&gt; <br>
&gt; Does it also detect it from build machine ?<br>
<br>
No, because of the recipe-specific sysroot it can&#39;t see my system versi=
on<br>
of xmlto.<br>
<br>
I have xmlto installed, yet log.do_configure contains:<br>
<br>
checking for xmlto... no<br>
configure: WARNING: xmlto not found, manpages will not be rebuilt.</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">That=E2=80=99s partly due=
 to HOSTTOOLS now hiding majority of build system tools=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; Perhaps better to turn the knob on and off explicitly as well for<br>
&gt; determinism<br>
<br>
I couldn&#39;t find a --disable-doc/--without-xmlto knob otherwise I would =
have<br>
done. :(</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok I thi=
nk it=E2=80=99s fine as it is since someone would have to explicitly add xm=
lto to HOSTTOOLS to cause the issue=C2=A0</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Or did you mean that I should explicitly set ac_cv_prog_XMLTO with<br>
something like:<br>
<br>
=C2=A0PACKAGECONFIG[docs] =3D &quot;,ac_cv_prog_XMLTO=3D&#39;&#39;,xmlto-na=
tive,&quot;<br>
<br>
?<br>
<br>
Thanks.<br>
<br>
Mike.<br>
</blockquote></div></div>

--00000000000048666d05e7005c0d--

