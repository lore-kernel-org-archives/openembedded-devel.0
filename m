Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650A8CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 20:50:54 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6118.1762289447444415060
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 12:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pf1QAu4H;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: skandigraun@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b550eff972eso4161648a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 12:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762289447; x=1762894247; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QhFa9qspfid+WXOLvVs8NAfpFAam2TjBX0U9SfvAns8=;
        b=Pf1QAu4HComLRBps4YJAkTKt6W1KUWJ1asBQlvDxW6pgn7onWLJk5e87o281xNohXM
         SSzFth1K3A5EY+kAj0r3Yh9quvjvj+jH2jvhFKD46GJCEDdmY8o1yd1vZofIfvdvlPSe
         kxWe/IhPeyjlIhIJBg/BsL974kG8XkIDtPCP0Ul4bnTcDdyBwI7d987KNwxNtOWgkW0r
         ErfSwFeR9O3e1L1pBTEyzP0OkGJnd9LoHYQHcReBM/+2vYbihtPn09D+7tJEWksPuGxu
         ezF6uhHekO52kQVDYacU4mjXkcO+ss5hBoCaWVGvKaiYWB8HpdVa0ZsexGjk/rVap2cw
         ScoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762289447; x=1762894247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhFa9qspfid+WXOLvVs8NAfpFAam2TjBX0U9SfvAns8=;
        b=ad/QwRRvH6nyj2+n8o2tTMaqqPH7iWNt0AYvcZWFqwThAk1ZABmwuHGoVtBRQu0FCP
         J3JMCGib2bDsiz1uWXaU9ZsVcWUZwMxzHKieUzpOCh2rprOoinvqOW0TDU/3G0hJsZPa
         5mHKQD1/JEIvKADlTzew3HbQjaBui9DhpZRSdSWQyeVbwmBjzif+cjsefNBwIsageOP1
         dne5H1z+lO+OZNzvL0GOaxoNIh6SgFZb5uCknX8GbcvCX17MzbogFcO6reQtXHF7Q99o
         dSCDzuGq9R//kHmnETNukmGHSJHh5CiOSkrA4n/U9ZV/vjdJGzBlWfVdNQ4dSpLAJZOU
         6BKw==
X-Gm-Message-State: AOJu0YzCHa9/zPKsp6qr1f1HSbk/DjrqKyxMMBuo878eQw7gecRbQdOK
	JapJNerm2iJ3VG1dFlE70wt/a5UVtfigpEKrh/4ySuIOy3PggNxa/jP9QdTY+bE7NnS6w+F0cPU
	oLumvXKrGUXLtJICflK0QyiicWBwosro=
X-Gm-Gg: ASbGnctX/w9MM/Dj7Z2isaWWpU91GLAouSd2XZxImpid5d8k6YnShCcHvkdeqVMTvK6
	BzL2tbdffTHkbcGp4KsHw08LRzlfseJ2MXdE+eGjDFkLHiJ9R1L54pOFNSNJ0yHAzYcGuNJCSiy
	LXMdxyOKmoRbg1EC5VISr3x1ZuOT53phOHEMMBlFXYiuj/J/ui/uqx808urfhO+8qzCuvwXTzt2
	scuyg8Fc+oFIokEC0HAVYejoA5QLmO4b5knFcWC5odxXKWnsD8xaSHTRMmj1w==
X-Google-Smtp-Source: AGHT+IEvV+VlyvQRb0DSGjQUOLLpaASBiRarq5SkPZ+catRZOv89yPGkjQlij/7MIgrg1mCfqOBlSvIBIvI2F/cCtt4=
X-Received: by 2002:a05:6a20:3d1e:b0:348:b7a1:431 with SMTP id
 adf61e73a8af0-34f839e259cmr700474637.10.1762289446513; Tue, 04 Nov 2025
 12:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20251102183627.4052101-1-skandigraun@gmail.com> <CAMKF1sr7++AT_8zErfsTe2E2X+VsU0ER+n5D1zf4pgAUgFQr-g@mail.gmail.com>
In-Reply-To: <CAMKF1sr7++AT_8zErfsTe2E2X+VsU0ER+n5D1zf4pgAUgFQr-g@mail.gmail.com>
From: =?UTF-8?B?U8OhcnbDoXJpIEd5w7ZyZ3k=?= <skandigraun@gmail.com>
Date: Tue, 4 Nov 2025 21:50:35 +0100
X-Gm-Features: AWmQ_bkRl3too8xdRzmYS0MOxG5RmvDqymzHY2SZ3jHPgX46CDVXGj1AFFH7ABk
Message-ID: <CAEbCKu66v6rqyRS+oz5GLQwyB6G9Loxh46_vcpRU3OC=iksKdA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: move from PTESTS_PROBLEMS list to PTESTS_SLOW
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007374960642cafc13"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 20:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121307

--0000000000007374960642cafc13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is not being ignored... will try to see in the morning if I can
salvage it. Please drop this patch, will send a v2 in any case.

On Tue, 4 Nov 2025 at 03:54, Khem Raj <raj.khem@gmail.com> wrote:

> I see one failure on musl,
>
> {'mariadb': ['my_tzinfo']}
>
> On Sun, Nov 2, 2025 at 10:36=E2=80=AFAM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > The tests are executing and passing fine.
> > It takes a bit more than 5 minutes to run them.
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >  meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > index 580c79d6d9..78ba1e228c 100644
> > --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > @@ -63,6 +63,7 @@ PTESTS_SLOW_META_OE =3D "\
> >      c-ares \
> >      fftw \
> >      libusb-compat \
> > +    mariadb \
> >      rocksdb \
> >      re2 \
> >  "
> > @@ -72,7 +73,6 @@ PTESTS_SLOW_META_OE:remove:libc-musl =3D
> "kernel-selftest"
> >
> >  PTESTS_PROBLEMS_META_OE =3D "\
> >      keyutils \
> > -    mariadb \
> >      ostree \
> >      poco \
> >      psqlodbc \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#121260):
> https://lists.openembedded.org/g/openembedded-devel/message/121260
> > Mute This Topic: https://lists.openembedded.org/mt/116084470/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000007374960642cafc13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is not being ignored... will try to see in the mornin=
g if I can salvage it. Please drop this patch, will send a v2 in any case.<=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 4 Nov 2025 at 03:54, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">I see one failure on musl,<br>
<br>
{&#39;mariadb&#39;: [&#39;my_tzinfo&#39;]}<br>
<br>
On Sun, Nov 2, 2025 at 10:36=E2=80=AFAM Gyorgy Sarvari via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.or=
g</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; The tests are executing and passing fine.<br>
&gt; It takes a bit more than 5 minutes to run them.<br>
&gt;<br>
&gt; Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.=
com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/met=
a-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; index 580c79d6d9..78ba1e228c 100644<br>
&gt; --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; @@ -63,6 +63,7 @@ PTESTS_SLOW_META_OE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c-ares \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fftw \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libusb-compat \<br>
&gt; +=C2=A0 =C2=A0 mariadb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rocksdb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 re2 \<br>
&gt;=C2=A0 &quot;<br>
&gt; @@ -72,7 +73,6 @@ PTESTS_SLOW_META_OE:remove:libc-musl =3D &quot;kerne=
l-selftest&quot;<br>
&gt;<br>
&gt;=C2=A0 PTESTS_PROBLEMS_META_OE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 keyutils \<br>
&gt; -=C2=A0 =C2=A0 mariadb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ostree \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 poco \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 psqlodbc \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#121260): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/121260" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/121260</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11608447=
0/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116084470/1997914</a><br>
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

--0000000000007374960642cafc13--

