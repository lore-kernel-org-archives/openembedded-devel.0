Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B82C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 18:38:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.1781.1709750325129182150
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 10:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3guNAgv;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29b6f82125dso1292886a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709750324; x=1710355124; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5BzKL3gWeYIRJxTmQZFgCN8Sh/zy+rduJSyYMH+fwik=;
        b=f3guNAgvYfyy0D5Xiobo52xH3DOk3NaXCTpenQJjY7/l7ub8RBmngRSeH8qjOh62kP
         TSu+awjSCffyxjRfLc0mhYda53Ig7kGIYz0tOjojln39aiuvGwtf3NT7F0Z81BrNB0tn
         GzXyIb36k1qv3EkMRDfn7+VZRxbSp0bLWN7UpIuGcQQ8VxVtMRO+zS9gf3armNUzP8zc
         UQ4VbCHWdyCHnPNCIMDziZAyAnt+jis+Cq8FwPZZk966D8U/krzmH2GqvQ5Rmqb87PKq
         jr8J5QRRz40nlJhOo9ufGNB76g8ZTXsaa0RvUli0XNMel6iVG+VOblWQUiVTrN/R37AH
         Rw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709750324; x=1710355124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BzKL3gWeYIRJxTmQZFgCN8Sh/zy+rduJSyYMH+fwik=;
        b=JTe35vYXVB+rqvS0dtzrw1mHAVYZkBMXrylolIcL1m/7fUe6+x4uKkbA6jKvLEe3pG
         olYpqDf89jRU0rp+RUT8YsTQS8SQx1URxYEtulypinK4i5hNLQvzHc9Y5HuYenB7t4a2
         LAM/Bg++CHa/qewgJI78sJF3aD5bgcYqvBn+/fX/We0+L/8vDeLHhYqGHGBnWuEZgbBp
         YY02yfhsxKAsI+cNbVREp3zFTlTc1SkXLgaiC49Cuk0ZGldNgzKDFrb4O7BX8u2b2NtW
         5he2GMVDKKLrWm2kqdj7IGdSY7HvLR/dzsOfs9IJTrmStmbd5mpCSxXeFBGrUgEnsbxc
         MAPA==
X-Gm-Message-State: AOJu0Yzwtyx58fq6vZYFqM7iNrCq399WGaBGXHkxszBqZY1yhWRGIPX2
	w6AGi5WekcddiV6f9jbgFcc0s3wmNOT9BNPDC/k0kXrHu/YCSdQmw4jUTte5x+U3T+10x6BBMuo
	D6XUqo4HrAp/SbjdMq6yVR8wiIbM=
X-Google-Smtp-Source: AGHT+IGpW2dYwGVmQr0QxoeTIA7nzzaPmQrNgPoS8dfrGaiSCGtN3oEKEBMnTHsok10bhLGvGZXMHe+ynWymUt6VUfQ=
X-Received: by 2002:a17:90b:886:b0:299:3c2e:64ca with SMTP id
 bj6-20020a17090b088600b002993c2e64camr13050353pjb.14.1709750323929; Wed, 06
 Mar 2024 10:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20240306171740.480830-1-alperyasinak1@gmail.com> <CAMKF1sqjODuzjjc47US2obJXSX7uJLKC0XEu91fRLiZRrY3HgQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqjODuzjjc47US2obJXSX7uJLKC0XEu91fRLiZRrY3HgQ@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Wed, 6 Mar 2024 21:38:32 +0300
Message-ID: <CAGpma=7YWN5pyD9ZqkyzN_7abqxVdnppVVoNYi0h2P64mH5TLQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-icecream: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b66e33061302442e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 18:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109177

--000000000000b66e33061302442e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is but when I tried to test it, I encountered deprecated things being
used. For example, new assert function name is required for Python 3.12
compat.

Khem Raj <raj.khem@gmail.com>, 6 Mar 2024 =C3=87ar, 20:19 tarihinde =C5=9Fu=
nu yazd=C4=B1:

> Are there any unit tests with this new package ?
>
> On Wed, Mar 6, 2024 at 9:17=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
> >
> > icecream (ic) package offers a more concise and readable way to debug
> code by replacing print statements with simple function calls.
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../python/python3-icecream_2.1.3.bb            | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-icecream_2.1.3.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-icecream_2.1.3.bb b/meta-python/recipes-devtools/python/
> python3-icecream_2.1.3.bb
> > new file mode 100644
> > index 000000000..ec3a4b90f
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Never use print() to debug again; inspect variables,
> expressions, and program execution with a single, simple function call."
> > +HOMEPAGE =3D "https://github.com/gruns/icecream"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Deca5ce1610d64ed40920efdce85ff8d1"
> > +
> > +SRC_URI[sha256sum] =3D
> "0aa4a7c3374ec36153a1d08f81e3080e83d8ac1eefd97d2f4fe9544e8f9b49de"
> > +
> > +inherit pypi setuptools3
> > +
> > +RDEPENDS:${PN} +=3D " \
> > +        python3-asttokens \
> > +        python3-colorama \
> > +        python3-executing \
> > +        python3-numbers \
> > +        python3-pygments \
> > +        python3-pprint \
> > +"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109174):
> https://lists.openembedded.org/g/openembedded-devel/message/109174
> > Mute This Topic: https://lists.openembedded.org/mt/104770329/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b66e33061302442e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">There is but when I tried to test it, I e=
ncountered deprecated things being used. For example, new assert function n=
ame is required for Python 3.12 compat.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;, 6 Mar 2024 =C3=87ar, 20:19=
 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Are there any unit tests with this new package ?<br>
<br>
On Wed, Mar 6, 2024 at 9:17=E2=80=AFAM Alper Ak &lt;<a href=3D"mailto:alper=
yasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; icecream (ic) package offers a more concise and readable way to debug =
code by replacing print statements with simple function calls.<br>
&gt;<br>
&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" =
target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-icecream_2.1.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-icecream_2.1.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 17 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-icecream_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-icecream_2.1.3.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-icecream_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-icecre=
am_2.1.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-icecream_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-icecre=
am_2.1.3.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..ec3a4b90f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ic=
ecream_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-icecream_2.1.=
3.bb</a><br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +SUMMARY =3D &quot;Never use print() to debug again; inspect variables=
, expressions, and program execution with a single, simple function call.&q=
uot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/gruns/icecream" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/gruns/icecream</a>&quo=
t;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Deca5ce1610d64ed40=
920efdce85ff8d1&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;0aa4a7c3374ec36153a1d08f81e3080e83d8ac1e=
efd97d2f4fe9544e8f9b49de&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-asttokens \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-colorama \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-executing \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-numbers \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pygments \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pprint \<br>
&gt; +&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#109174): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/109174" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/109174</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10477032=
9/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104770329/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000b66e33061302442e--

