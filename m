Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6A4C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:07:30 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.20739.1750687644323520739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 07:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QfN0j+CJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70a57a8ffc3so35617687b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750687643; x=1751292443; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BmB0HZcR+xscAB8VpdKTWHf6TAJOuQzghILkgi3eDGQ=;
        b=QfN0j+CJguhOERSTE3utGvezbKNR0YqkPAtFtHmA5htvGe3ISXl0k6gk/boJ3AJeXr
         5ioXFk//8UMAhcpXFPpPFiykjsEy4uMvhxwtdy/R6CsBLerH+z8QF9xjEErTzfhiXOJz
         Ff400NoQQ/8Gzq5Ergm562ZywULAEACImNcHGi6NJxms82Oa9Vs8FfM3AWbd7KMMLNre
         fnDNkTCf5UfPSDDxttzKkpbK+D0cD0v7nfC/+KX4q8q7BCh8NvmKBl9eWojF97akPeU7
         eyvpJwxBqo1Y4aaW0S6AkLeSQ6qRFEHNsrHsFksrUN4wubsdXGovsoTDR8QzAE3aT+CQ
         dIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687643; x=1751292443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmB0HZcR+xscAB8VpdKTWHf6TAJOuQzghILkgi3eDGQ=;
        b=kzbBy8Y0QySl9/nWsvZC/BXhP5WTTiYI07v0CEmVlTJlNHi1LM1mR1C/hljSLE0990
         JcJ4d4jvl8Eul62bY6IS/gFxvaNEPY0NRiZCQbZyVD9q0LqyMMAtfzDeb25WXva1X/4B
         TGHBIZXGiZBx6VIoln6sIaCKP1emvxkve4QFuEl4Q/lDFbQn3Pw/+Xm7LWdDJdm87NTa
         TQvIpEJlXzKxrjhbV961qu7NeSd55uHN+aUfHwa3gkRp2gXUlEssYjnHGKzcCX21XjAr
         sffl9g+n6wXrmRjSKFaMVdayNLxTHb3Sagyl1x5WyDlKm9Ct2Ix1wOy/j9qFd3Nb/ikU
         9GPw==
X-Gm-Message-State: AOJu0YxkbniUtOl83WfKT+rmlxqd0XDDOcyrTJFEeysEAVvqpNWheIIK
	xuYH+KiOYl3ePKeGqJGuuWaZOwE9past4U/J8EblaCKBI0kvx2DXyR9MrLVplDOhujd7/+q/KXG
	m5AtInnshkgfa5nByy69TK6bi4QdoK8U=
X-Gm-Gg: ASbGncsCUcX7CNufqaBswzY6XSEur0LFAz0NO5Scl6xNm005fN1RAgcfGDZFPyhVH+J
	UjIIrv22CPJobGyTctfZ61pNNUR0DL1GiKhRdf4Sa5pGdwiVFnbFXGl5zDS6KAIgYNt0bCQy5NJ
	PiDX0wXeLBoHEt3E+Q5xXDFZf2zxzCZuZbwG67y7Jfyl97DdOFEfsuVOl+uxytmO0mZ2kv8Ww+B
	OFWm020Vkk4wBg=
X-Google-Smtp-Source: AGHT+IGGLeZgwRh90N+w5dv4zbB3UfPO+5j9QuYvIOd/HGSQJ+jAKudzJff2IqiASRivB0KnsXBDqkmD3fqsAZuQRgc=
X-Received: by 2002:a05:690c:601:b0:70e:2c7f:2edd with SMTP id
 00721157ae682-712c63f06b1mr164143687b3.9.1750687643360; Mon, 23 Jun 2025
 07:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250619145738.3562283-1-christli@axis.com> <ab6d6f50-0409-4469-be0b-2b07f5333d6c@gmail.com>
 <CAMKF1sqKnL85LrUv2ResvCS1_X5Ggf4udG9iOyQqyRyM+8JkXQ@mail.gmail.com> <b54aa060-9664-4a79-8844-d4029843949a@axis.com>
In-Reply-To: <b54aa060-9664-4a79-8844-d4029843949a@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jun 2025 07:07:12 -0700
X-Gm-Features: AX0GCFtYrM-Av0lYkW7VaDuiovp1ij1zbfw0qTe707fiocdfjoHxsFdBqFxLDqA
Message-ID: <CAMKF1sq5Xs1fAgw0-T1p4pk9yp-0LLaUfxMBo_TA9Buk73grcw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Use go module fetcher
To: Christian Lindeberg <christian.lindeberg@axis.com>
Cc: openembedded-devel@lists.openembedded.org, skandigraun@gmail.com
Content-Type: multipart/alternative; boundary="00000000000018637106383dbbad"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 14:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118081

--00000000000018637106383dbbad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:48=E2=80=AFAM Christian Lindeberg <
christian.lindeberg@axis.com> wrote:

>
> On 19/06/2025 18:09, Khem Raj wrote:
> > On Thu, Jun 19, 2025 at 8:34=E2=80=AFAM Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >> On 6/19/25 16:57, Christian Lindeberg via lists.openembedded.org wrote=
:
> >>>   CVE_STATUS[CVE-2019-10329] =3D "cpe-incorrect: Version does not mat=
ch
> and only the Jenkins plugin is affected."
> >>>   SKIP_RECIPE[influxdb] ?=3D "QA Issue: task do_compile has network
> enabled"
> >>>
> >> I believe your patch obsoletes this SKIP_RECIPE variable from the bott=
om
> >> of the recipe.
> >>
> > Thats right, I have added a patch for removing the skip
> Oops, I guess I didn't check the result of the rebase properly.
>
> Should it be added back to packagegroup-meta-oe-dbs as well now when
> network
> access is resolved?


Perhaps yes


>
> Christian
>
>

--00000000000018637106383dbbad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 23, 2025 at 12:48=E2=80=AFA=
M Christian Lindeberg &lt;<a href=3D"mailto:christian.lindeberg@axis.com">c=
hristian.lindeberg@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><br>
On 19/06/2025 18:09, Khem Raj wrote:<br>
&gt; On Thu, Jun 19, 2025 at 8:34=E2=80=AFAM Gyorgy Sarvari via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt; On 6/19/25 16:57, Christian Lindeberg via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a> wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0CVE_STATUS[CVE-2019-10329] =3D &quot;cpe-incorrect=
: Version does not match and only the Jenkins plugin is affected.&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0SKIP_RECIPE[influxdb] ?=3D &quot;QA Issue: task do=
_compile has network enabled&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt; I believe your patch obsoletes this SKIP_RECIPE variable from the =
bottom<br>
&gt;&gt; of the recipe.<br>
&gt;&gt;<br>
&gt; Thats right, I have added a patch for removing the skip<br>
Oops, I guess I didn&#39;t check the result of the rebase properly.<br>
<br>
Should it be added back to packagegroup-meta-oe-dbs as well now when networ=
k<br>
access is resolved?</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Perhaps yes</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto"><br>
<br>
Christian<br>
<br>
</blockquote></div></div>

--00000000000018637106383dbbad--

