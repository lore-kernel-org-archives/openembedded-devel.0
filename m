Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D7BCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 18:40:14 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.136530.1781548809618453157
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 11:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ociy7nq2;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66061993294so3618642d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 11:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781548809; cv=none;
        d=google.com; s=arc-20240605;
        b=QNnxEgR1+BHRKkU6iNfF2R1PT75n2nzlptJaH9aSrx6mgd03xmzlMXONIKV4qMfboT
         On81E2E2eeTqr/k7H9mK1GA/z4VADlz4PHI929ZARrwmxVPzkfsJcJ/n5Kh4NsZcJTki
         OD9KBb7/8bgwfQMis/ACJfvaUqb4Z7EaONR9wrFQ6mNFCFscGGNhOotpGW5Wa4WamhFf
         2uy4FpuYu+MNmVeaWCZlxYsS6pFivUmxHLKS9LpKj8ZOpzQpTbeJk0NSnZKMrmB4mT2x
         fLyruomKGe/K+DAfBFYlpy3n9C+lTWxdILsDAeLv72E9Gs21txZBKlIufZIw1NYtWkHW
         j+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sv/qZUJDPU7SVuVlt7OrZ4ZRZYim3AtmbGcC1obBxE0=;
        fh=TKJj+TQbOfhIZO+HJtRVqEbv76mR7gPejKPp/8pTfkM=;
        b=ZSHE2Z9pd1U9fI7+rI7KBoaQqiMYUuSga9SPBW1v4cKEJ6vpVYDRirNzJ7+OPwCP36
         eUWKnh55FhgRu2J7vCU14jUI4yZhZXUY+Dg4CD1sOnLb6Cpwl0KEnD7QwWdr3maORxQs
         FPnrFEz3z06eHLdgc1iEQEhwzyMt9cpGVqT+iLWRKITICN+rTt+toLBdS84XebHdcLug
         2TinnujlIkzBFvUidSQj3t2PAGDZoa+cGkKmax7Yrbm621lddzzX6ne2xkwDqR1EBy73
         dqygB99om+nVu7gtnSsSJhkRUbWChkjkrYfIwlUnxv+hXwnK2HoFgFhdAmfiZPz9E08J
         NJ+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781548809; x=1782153609; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv/qZUJDPU7SVuVlt7OrZ4ZRZYim3AtmbGcC1obBxE0=;
        b=ociy7nq2U5EsYnZNtecwZIr2RSawcVq3dNywJKJ0px1CFJGOAaCipifbJbd5M2XivI
         jGx6GMgy2NbvrAVkDeyt30UhYm/STPHP1xDg6p/ZfX86pyvhHpdu5JfWk58WuJ0Ix6xo
         MrPqmS1oNj3Yi2FG1JqS/tspjltcXd8S/edK7zyJ7eqpb4Q7zFO44seasH0aX8pR2Jp3
         eF6QIl7szZpmKkR/dMG0s+/3sF4D6ANRg9z6iX8i/WwYL6oadgK/EzWCSnEtTn8ZS8FQ
         I8JflHUbhlZTZE59xXsXHtePlfFyyW8eIu7QX6Adou4+JqDxIl9lZU9XwMZayj1B6Q91
         B49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781548809; x=1782153609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sv/qZUJDPU7SVuVlt7OrZ4ZRZYim3AtmbGcC1obBxE0=;
        b=l9c2pHLoLFfgjqEsYxNSbhfXwxJs2ibb1mEmEkjxEUB3MVdE/G/jkWURrX8GAY9U0A
         s61ynCLUMCbtkzcDTd76m4Ia0o9l/3f9ftsMgHdNWestEk/GA+488+utcKKkp+Y7iVH4
         iDtSycc/mwlC89T31ki7T9bIFJ+CTDwnEwJV9cv2BDCEkWdLsKxTuINy2X/ss7hOo0hE
         Zr19VNSDhHR8yHR5ap8Aud2D9q7pESrTKqy6LFAyTRywNZBJWEtNWA00/OALz45xc++l
         A8zLkKc5b5R4oqXPau7wqPQNtMaRprFuP4qe8vc7kyRU31oRGji1mOxYwPOFweMdqL7L
         YLRQ==
X-Gm-Message-State: AOJu0YzqwC3Q01hubrNumtmlo8L+PFO/3St4IlD8oR+T/4J8paM65FCg
	++7zQFEOxeHUumLb2gf91LTWi3f8qBRLp0tDEIq5UXMXqJAOp5TQQj0Tycy/tROEfvGvCDG+tQA
	C/AZCvSZrZBa9lvGVZ2xejLol+DbHrDE=
X-Gm-Gg: Acq92OH7PkDlppOMLhcQW5or+H0Onr8kZcpiQcdp5EEKnNHxTFLEc0sWNxtm2+TaLfc
	rmzXYmzNUZThLo5dB+tgNBKYksY0LwUeMjN1I0yRKUHQFslvbTJVMVoMxeOTtPuE+7yQ9gnhu3s
	HD6jtK3nmGiL9C/jgcbui3vSPWfO0LSz4wWpufczpwHIO4I0UctQeUjsgcXNOWGMIpFFge1z1By
	CCq44+riRIdjevqBLB7MFg6l1D4oWK9gnIuZRm67G9g7R5VCjUrcN1f653JtgKiTfja0WBLP+mu
	Etr9pA++Omxl2NYPD74sH0NZzEgDfZVRcOB4v0xzy6Bd8FlC3wX6hQ8uQECml0mNMHtmM0z4EkL
	v4nvGkeoG5ALDNzzhUziFVP3i353QCjLVk12yznKgIT3mTGSmknrtzsY9IB+zuKa99wQWJdBBsc
	OyGP+BSmo=
X-Received: by 2002:a05:690e:dcd:b0:660:41fb:6728 with SMTP id
 956f58d0204a3-662b5c2833fmr229046d50.0.1781548808567; Mon, 15 Jun 2026
 11:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260615144348.7946-1-f_l_k@t-online.de>
In-Reply-To: <20260615144348.7946-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jun 2026 11:39:57 -0700
X-Gm-Features: AVVi8CczqjNKyQjTuyrF-oBfn6IXQ2CC0fcut3zSqds-pJJjfWuemYij2BlvdvI
Message-ID: <CAMKF1sqdnApLQLRANTfimRqnqTUKvfzpkSa-EJ+JbmCzLr6tiQ@mail.gmail.com>
Subject: Re: [oe] [meta-multrimedia][PATCHv2] libdvdread: switch to meson buildsystem
To: Markus Volk <f_l_k@t-online.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e280b306544f2704"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 18:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127593

--000000000000e280b306544f2704
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I realize there are more recipes in other layers eg meta-gnome depending on
it. So moving to multimedia layer is perhaps not gonna work

On Mon, Jun 15, 2026, 7:44=E2=80=AFAM Markus Volk via lists.openembedded.or=
g <f_l_k=3D
t-online.de@lists.openembedded.org> wrote:

> autotools buildsystem has been removed:
> do_configure: no configure script found
>
> move recipe to meta-multimedia
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-multimedia/libdvdread/libdvdread_7.0.1.bb       | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename {meta-oe =3D> meta-multimedia}/recipes-multimedia/libdvdread/
> libdvdread_7.0.1.bb (59%)
>
> diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> similarity index 59%
> rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> rename to meta-multimedia/recipes-multimedia/libdvdread/
> libdvdread_7.0.1.bb
> index 0e56f0bd3c..0be61c2174 100644
> --- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> +++ b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D64e753fa7d1ca31632bc383da3b57c27"
>  SRC_URI =3D "
> https://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${=
PV}.tar.xz
> "
>  SRC_URI[sha256sum] =3D
> "2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407"
>
> -inherit autotools lib_package binconfig pkgconfig
> +inherit meson lib_package binconfig pkgconfig manpages
>
> -CONFIGUREOPTS:remove =3D "--disable-silent-rules"
> +PACKAGECONFIG ?=3D "libdvdcss"
> +PACKAGECONFIG[libdvdcss] =3D
> "-Dlibdvdcss=3Denabled,-Dlibdvdcss=3Ddisabled,libdvdcss"
> +PACKAGECONFIG[manpages] =3D
> "-Denable_docs=3Dtrue,-Denable_docs=3Dfalse,doxygen-native"
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127585):
> https://lists.openembedded.org/g/openembedded-devel/message/127585
> Mute This Topic: https://lists.openembedded.org/mt/119816699/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e280b306544f2704
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I realize there are more recipes in other layers eg meta-=
gnome depending on it. So moving to multimedia layer is perhaps not gonna w=
ork=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jun 15, 2026, 7:44=E2=80=AFAM Markus=
 Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-onl=
ine.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">autotools buildsystem has been removed:<br>
do_configure: no configure script found<br>
<br>
move recipe to meta-multimedia<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank" rel=3D"noreferrer">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../recipes-multimedia/libdvdread/<a href=3D"http://libdvdread_7.0.1.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libdvdread_7.0.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
=C2=A0rename {meta-oe =3D&gt; meta-multimedia}/recipes-multimedia/libdvdrea=
d/<a href=3D"http://libdvdread_7.0.1.bb" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">libdvdread_7.0.1.bb</a> (59%)<br>
<br>
diff --git a/meta-oe/recipes-multimedia/libdvdread/<a href=3D"http://libdvd=
read_7.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libdvdread_7=
.0.1.bb</a> b/meta-multimedia/recipes-multimedia/libdvdread/<a href=3D"http=
://libdvdread_7.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">lib=
dvdread_7.0.1.bb</a><br>
similarity index 59%<br>
rename from meta-oe/recipes-multimedia/libdvdread/<a href=3D"http://libdvdr=
ead_7.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libdvdread_7.=
0.1.bb</a><br>
rename to meta-multimedia/recipes-multimedia/libdvdread/<a href=3D"http://l=
ibdvdread_7.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libdvdr=
ead_7.0.1.bb</a><br>
index 0e56f0bd3c..0be61c2174 100644<br>
--- a/meta-oe/recipes-multimedia/libdvdread/<a href=3D"http://libdvdread_7.=
0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libdvdread_7.0.1.bb=
</a><br>
+++ b/meta-multimedia/recipes-multimedia/libdvdread/<a href=3D"http://libdv=
dread_7.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libdvdread_=
7.0.1.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D64e753fa7d1=
ca31632bc383da3b57c27&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://download.videolan.org/pub/videol=
an/libdvdread/$%7BPV%7D/libdvdread-$%7BPV%7D.tar.xz" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://download.videolan.org/pub/videolan/libdvd=
read/${PV}/libdvdread-${PV}.tar.xz</a>&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2e3e04a305c15c3963aa03ae1b9a83c1d2398800=
03fcf3dde986d3943355d407&quot;<br>
<br>
-inherit autotools lib_package binconfig pkgconfig<br>
+inherit meson lib_package binconfig pkgconfig manpages<br>
<br>
-CONFIGUREOPTS:remove =3D &quot;--disable-silent-rules&quot;<br>
+PACKAGECONFIG ?=3D &quot;libdvdcss&quot;<br>
+PACKAGECONFIG[libdvdcss] =3D &quot;-Dlibdvdcss=3Denabled,-Dlibdvdcss=3Ddis=
abled,libdvdcss&quot;<br>
+PACKAGECONFIG[manpages] =3D &quot;-Denable_docs=3Dtrue,-Denable_docs=3Dfal=
se,doxygen-native&quot;<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127585): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127585" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/127585</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119816699/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119816699/1997914</a><br>
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

--000000000000e280b306544f2704--

