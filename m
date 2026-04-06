Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE253E9D834
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 05:13:38 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49005.1775452417030388679
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 22:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bmcCwjoK;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6500040f172so1140488d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 22:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775452416; cv=none;
        d=google.com; s=arc-20240605;
        b=iFATvssb2El5A+LXHUk1gXDzi2viSAQ3RRpfEmPlm9ukvG7HxSDQY4ZdkIa5i9F/ny
         0dwjl55hrnlPKuPc5qNQ9XOqHolQziZejDtF8tJNE/z7wiYQRT7+G0Qq6aC+PFQM2KsE
         NGXEPrA3bjmwI4mKIobSv8ghGIz4X08Y8MgRLtEiw1LvRlF7Lv8nHXE8kk7+EIcqmUkt
         R/TimDsaR0IlF9yoM+wjm+oLr2jeYiv+CO8y7gX529lL9f7s+g/MIVEUHRuKVrOiLvIR
         7JwFPqx/iTAxT8y/OxxhZw9lct+kZjbyWeQxoc7zfKgxaFmNHW0l4ELyuor44Y8n5BON
         Ol5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ORBgf7YBEQUeKaKSOuygmy0xQJG6+Il59R37jL+M17c=;
        fh=i3NjXtwgjbl7OeVkI+jB2rfwLQ3F3cvK1Fm/vLwXrDk=;
        b=HUozZuYcxxhzbProHRU7rI6l2BvB+jvmzNd2klJ/HOKPJEPFV9T6ky8aMlhDRaF1YF
         HR+dy0I0iQ3pik8M+3LoxoLet/nLwqaHZOZTqmZtXSIXuJqvITDEyeKCOh3YyWxF312F
         eHBBKF0nBpNpNw2f7ArMNR7tLbwlxJ24cTwa8hCrjH5aTNSd3y8c1QbdU1jDyggHj2TT
         UVJXBPl15YdVcGOlnNRcxhn/Gc20ENEuAavvVj726sUQKVSjEe5TL5e4mtElbW3EBI8s
         ipo9JT9DxToYbsX9CMCYO4n+zsoqyco4qIOczhdaETqd8rKJ0Rd4zxayyK/cKeLw4NtQ
         5rIA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775452416; x=1776057216; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ORBgf7YBEQUeKaKSOuygmy0xQJG6+Il59R37jL+M17c=;
        b=bmcCwjoKgCrQM4AUNyi1m3DBuYoWnCogyPKxjxLbpZqj7JGqCvMaVaVO02FNKdHxx7
         vVXyUWnxQvbYJw+GmlxgJqw35C4HyHPo3yyZ9cpA7DSRjwVNELM7XbBHY0+OFlpuDTok
         A/GrOtehyjIzD3p+UoMvje2U+Q6RBtT6IzQrS3XexUc4INyYV+JgKSRc0PTdnFSqohm0
         9eAV1Iy/hZyTve/iLieV65XtpYSAENf49CN9GPVjnfVlO7oIdV1iwGXIgJjAGTiiccnM
         L7nWRgjsbU+9Lw+QKK58fw8mnZ6+hXi2Utd1rXAD48uFKxYoAGFukUbbdfLMckhd5XAD
         u64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775452416; x=1776057216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORBgf7YBEQUeKaKSOuygmy0xQJG6+Il59R37jL+M17c=;
        b=Uj9Fo9IGm0ePJSu+clFs1mh8sbwcd0GW3ZHZieZBjFKat8st81pqez+QubaZ9nBi1o
         AUGHNs4NrZ5q9mdKfC3dakPnEpdy/lrgJCNKkzzMbTNJ/pWSIx4KUg3bN7XQjfU8tP+S
         yCYHmzFM5v6lAFO4IUngX5cccba54OEMGGhHlGwfMAkTWPdfRtgjmhctOaCP0eIbSDzE
         OU4g42b3UT5JMqs+WqgEfdfFoGL4qbvYQyTuIyzWVUzA8y53wNgpv3BCrXN+HxQe5Mwx
         QPO6evNKmituVff78qyEpd5gojVr4lJfHWKgr4pd7610BPSyQ8eylY5rmgGuR7+YOyk/
         wgog==
X-Forwarded-Encrypted: i=1; AJvYcCUBXC4foBvBO1nK7mOYX1IkU+3Db0Duk5H/XdfeorMvgbl+6KIKiDsHIKho4YuMDpOAQ+26eA6FFUCmnbC9F95IOuI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzURlT3k4KQA2mHeDcFBrDjtL80ovihKnCr4RL7CcnK4NfvB5pk
	r9oczTYXkmgkbbhASkoqB2bhoIzUzA3L5i7y/jtMTPtEcjcrycOkGpWEOujVcvs0b+Vi3hJ14d5
	9CyU8pBe9H238i2gpIqJNxZFfiKJgUWE=
X-Gm-Gg: AeBDievqIAoKq2tZPxmpnbsakPyBQBuCS2d34ZJekXQ4icgkVqRwWwuQ5UavE6hUDI7
	jB0K76lTvHq8Rti1PTf7WC8zDT3gGt7PXyBZkfHLF8dYZGbXK9uwjpb2ZkJa5DHeRQKO0Ko9lZ7
	sRSaeePfr47gjzj8kpRN+r5KflbW+QN+fK0RuJohBobNZZVl09wnDYYi7sY7MDGm+knXMFkt0eh
	84jVNfNeiwKvauByAuBZe1kxC+gxJlyclKlIVZRdLcbnV1OAucPPyFHyismobvHUQ2DDVYFNWF6
	Bn1OF3BMqxq5vTa6xers56hJv2KaE6bGdn9PIit78HJzeMFr1e4LoopA4nSLHTv3qLSvLLgi63K
	/JYEEdUytxNoeA30Cn8p5Mj9tnjfUvkTBD/k=
X-Received: by 2002:a05:690e:4402:b0:64e:dd86:7369 with SMTP id
 956f58d0204a3-650486c22cemr8374306d50.14.1775452415938; Sun, 05 Apr 2026
 22:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260403033841.2186031-1-haiqing.bai@windriver.com> <95c162a8-3a87-4d61-ad23-9d2548cfdb84@gmail.com>
In-Reply-To: <95c162a8-3a87-4d61-ad23-9d2548cfdb84@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Apr 2026 22:13:09 -0700
X-Gm-Features: AQROBzBxcd1ZE5R5FqJKu6ASytaPtRNiorkst6eaiXstQMrylhseofrFS67L_0Q
Message-ID: <CAMKF1srRRvq+cL4BiDGpXt7j_wjSVJQVuA4DejZKc=xTrqnm2Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-stopit: Fixed the deprecated
 pkg_resources issue
To: skandigraun@gmail.com
Cc: haiqing.bai@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009154f7064ec3ba70"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126021

--0000000000009154f7064ec3ba70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 1:50=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> On 4/3/26 05:38, haiqing.bai via lists.openembedded.org wrote:
> > From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
> >
> > pkg_resources is deprecated as an API. The pkg_resources package
> > has been removed from setuptools, so the way of obtaining the
> > version needs to be replaced with importlib.metadata module.
> >
> > Signed-off-by: Bai, Haiqing <Haiqing.Bai@windriver.com>
> > ---
> >  ...01-Drop-the-deprecated-pkg_resources.patch | 38 +++++++++++++++++++
> >  .../python/python3-stopit_1.1.2.bb            |  6 ++-
> >  2 files changed, 43 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecat=
ed-pkg_resources.patch
> >
> > diff --git
> a/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprec=
ated-pkg_resources.patch
> b/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprec=
ated-pkg_resources.patch
> > new file mode 100644
> > index 0000000000..4252386384
> > --- /dev/null
> > +++
> b/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprec=
ated-pkg_resources.patch
> > @@ -0,0 +1,38 @@
> > +From b72825c89724c2c3b4c9c60d90c9d4ad597eead0 Mon Sep 17 00:00:00 2001
> > +From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
> > +Date: Thu, 2 Apr 2026 08:40:26 +0000
> > +Subject: [PATCH] Drop the deprecated pkg_resources
> > +
> > +pkg_resources is deprecated as an API. The pkg_resources package
> > +is slated for removal, so the way of obtaining the version needs
> > +to be updated.
> > +
> > +Upstream-Status: Inactive-Upstream [lastcommit: Jan/2024 lastrelease:
> Feb/2018]
> > +
> > +Signed-off-by: Bai, Haiqing <Haiqing.Bai@windriver.com>
> > +---
> > + src/stopit/__init__.py | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/stopit/__init__.py b/src/stopit/__init__.py
> > +index 6ca0180..5ddfa4a 100644
> > +--- a/src/stopit/__init__.py
> > ++++ b/src/stopit/__init__.py
> > +@@ -7,7 +7,7 @@ stopit
> > + Public resources from ``stopit``
> > + """
> > +
> > +-import pkg_resources
> > ++from importlib.metadata import version
> > +
> > + from .utils import LOG, TimeoutException
> > + from .threadstop import ThreadingTimeout, async_raise,
> threading_timeoutable
> > +@@ -15,7 +15,7 @@ from .signalstop import SignalTimeout,
> signal_timeoutable
> > +
> > + # PEP 396 style version marker
> > + try:
> > +-    __version__ =3D pkg_resources.get_distribution(__name__).version
> > ++    __version__ =3D version(__name__)
> > + except:
> > +     LOG.warning("Could not get the package version from pkg_resources=
")
> > +     __version__ =3D 'unknown'
> > diff --git a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.b=
b
> b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
> > index a952722619..a83adffcd2 100644
> > --- a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
> > @@ -2,7 +2,6 @@ SUMMARY =3D "Raise asynchronous exceptions in other
> threads, control the timeout o
> >  HOMEPAGE =3D "https://pypi.org/project/stopit/"
> >  SECTION =3D "devel/python"
> >
> > -SRC_URI +=3D " file://LICENSE "
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://${UNPACKDIR}/LICENSE;md5=3D497c556f42b1355b64190da2f3d88f93"
> >
> > @@ -10,6 +9,11 @@ SRC_URI[sha256sum] =3D
> "f7f39c583fd92027bd9d06127b259aee7a5b7945c1f1fa56263811e1e7
> >
> >  inherit pypi setuptools3
> >
> > +SRC_URI +=3D "\
> > +    file://LICENSE \
> > +    file://0001-Drop-the-deprecated-pkg_resources.patch \
> > +"
> > +
> >  RDEPENDS:${PN} +=3D "\
> >      python3-setuptools \
> >      "
>
>
> After this patch, does it still have a runtime dependency on setuptools?
> I think maybe that was the only reason for pulling this in
>
>
Good question. It was added with
https://git.openembedded.org/meta-openembedded/commit/?id=3D812f091414b34db=
ebe4a3990c9039cbaadc4dd71
to fix

ModuleNotFoundError: No module named 'pkg_resources'

on target. So perhaps it should be reverted now as well.

Please test it out and send a revert of the above commit as  a followup.


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125980):
> https://lists.openembedded.org/g/openembedded-devel/message/125980
> Mute This Topic: https://lists.openembedded.org/mt/118646263/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009154f7064ec3ba70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 3, =
2026 at 1:50=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 4/3/26 0=
5:38, haiqing.bai via <a href=3D"http://lists.openembedded.org" rel=3D"nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: &quot;Bai, Haiqing&quot; &lt;<a href=3D"mailto:Haiqing.Bai@windr=
iver.com" target=3D"_blank">Haiqing.Bai@windriver.com</a>&gt;<br>
&gt; <br>
&gt; pkg_resources is deprecated as an API. The pkg_resources package<br>
&gt; has been removed from setuptools, so the way of obtaining the<br>
&gt; version needs to be replaced with importlib.metadata module.<br>
&gt; <br>
&gt; Signed-off-by: Bai, Haiqing &lt;<a href=3D"mailto:Haiqing.Bai@windrive=
r.com" target=3D"_blank">Haiqing.Bai@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...01-Drop-the-deprecated-pkg_resources.patch | 38 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-stopit_1.1.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-stopit_1.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++-<br>
&gt;=C2=A0 2 files changed, 43 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-s=
topit/0001-Drop-the-deprecated-pkg_resources.patch<br>
&gt; <br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-stopit/0001-D=
rop-the-deprecated-pkg_resources.patch b/meta-python/recipes-devtools/pytho=
n/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4252386384<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the=
-deprecated-pkg_resources.patch<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +From b72825c89724c2c3b4c9c60d90c9d4ad597eead0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: &quot;Bai, Haiqing&quot; &lt;<a href=3D"mailto:Haiqing.Bai@wind=
river.com" target=3D"_blank">Haiqing.Bai@windriver.com</a>&gt;<br>
&gt; +Date: Thu, 2 Apr 2026 08:40:26 +0000<br>
&gt; +Subject: [PATCH] Drop the deprecated pkg_resources<br>
&gt; +<br>
&gt; +pkg_resources is deprecated as an API. The pkg_resources package<br>
&gt; +is slated for removal, so the way of obtaining the version needs<br>
&gt; +to be updated.<br>
&gt; +<br>
&gt; +Upstream-Status: Inactive-Upstream [lastcommit: Jan/2024 lastrelease:=
 Feb/2018]<br>
&gt; +<br>
&gt; +Signed-off-by: Bai, Haiqing &lt;<a href=3D"mailto:Haiqing.Bai@windriv=
er.com" target=3D"_blank">Haiqing.Bai@windriver.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/stopit/__init__.py | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/stopit/__init__.py b/src/stopit/__init__.py<br>
&gt; +index 6ca0180..5ddfa4a 100644<br>
&gt; +--- a/src/stopit/__init__.py<br>
&gt; ++++ b/src/stopit/__init__.py<br>
&gt; +@@ -7,7 +7,7 @@ stopit<br>
&gt; + Public resources from ``stopit``<br>
&gt; + &quot;&quot;&quot;<br>
&gt; + <br>
&gt; +-import pkg_resources<br>
&gt; ++from importlib.metadata import version<br>
&gt; + <br>
&gt; + from .utils import LOG, TimeoutException<br>
&gt; + from .threadstop import ThreadingTimeout, async_raise, threading_tim=
eoutable<br>
&gt; +@@ -15,7 +15,7 @@ from .signalstop import SignalTimeout, signal_timeo=
utable<br>
&gt; + <br>
&gt; + # PEP 396 style version marker<br>
&gt; + try:<br>
&gt; +-=C2=A0 =C2=A0 __version__ =3D pkg_resources.get_distribution(__name_=
_).version<br>
&gt; ++=C2=A0 =C2=A0 __version__ =3D version(__name__)<br>
&gt; + except:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LOG.warning(&quot;Could not get the package versi=
on from pkg_resources&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__version__ =3D &#39;unknown&#39;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-stopit_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-stopit_1=
.1.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-stopit_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-stopit_1.1.2=
.bb</a><br>
&gt; index a952722619..a83adffcd2 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-st=
opit_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-stopit_1.1.2.bb=
</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-st=
opit_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-stopit_1.1.2.bb=
</a><br>
&gt; @@ -2,7 +2,6 @@ SUMMARY =3D &quot;Raise asynchronous exceptions in oth=
er threads, control the timeout o<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/stopit/" =
rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/stopit/</a>&q=
uot;<br>
&gt;=C2=A0 SECTION =3D &quot;devel/python&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI +=3D &quot; file://LICENSE &quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${UNPACKDIR}/LICENSE;md5=3D497=
c556f42b1355b64190da2f3d88f93&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -10,6 +9,11 @@ SRC_URI[sha256sum] =3D &quot;f7f39c583fd92027bd9d061=
27b259aee7a5b7945c1f1fa56263811e1e7<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt;=C2=A0 <br>
&gt; +SRC_URI +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 file://LICENSE \<br>
&gt; +=C2=A0 =C2=A0 file://0001-Drop-the-deprecated-pkg_resources.patch \<b=
r>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-setuptools \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
<br>
After this patch, does it still have a runtime dependency on setuptools?<br=
>
I think maybe that was the only reason for pulling this in<br>
<br></blockquote><div><br></div><div>Good question. It was added with</div>=
<div><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3D812f091414b34dbebe4a3990c9039cbaadc4dd71">https://git.openembedded.org/m=
eta-openembedded/commit/?id=3D812f091414b34dbebe4a3990c9039cbaadc4dd71</a><=
/div><div>to fix=C2=A0</div><div><br></div><div>ModuleNotFoundError: No mod=
ule named &#39;pkg_resources&#39;</div><div><br></div><div>on target. So pe=
rhaps it should be reverted now as well.</div><div><br></div><div>Please te=
st it out and send a revert of the above commit as=C2=A0 a followup.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125980): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125980" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125980</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118646263/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118646263/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009154f7064ec3ba70--

