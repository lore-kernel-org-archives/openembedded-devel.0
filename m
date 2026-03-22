Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5378D58CA7
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 20:14:39 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2620.1774210477343094718
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 13:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H3EG37ez;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64eb8ceda8fso1249798d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 13:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774210476; cv=none;
        d=google.com; s=arc-20240605;
        b=MggSRAen1ao64wmtkYlvpY986Zr7ipj3zVTjENgWWl6TtexJ3NAA5HM80LcPHCMe0q
         5Tp0KEjSB2n0Rfced0qwHSYNEq2ckIbm3BQGWbNnT8TO9IZQ6BmmuHIayx7P0bVffHF3
         zdn4DEZdv/+nSd0YnhaCtBjrjRd3mwX4DcyungZDaFiHw8qTrluHWhbRnbvOiEaso3PP
         hSATVIYVBzUwrLJjwNqIgEXLNUF03sw2r+epPzmhUGxXnBCVXctzQ/KvqZ9mFhB3hHo5
         9+UiQ+ji2wZkO81sacBh0xP/t8B6sXktzXsF1rQmAs9Znv5Vx/m+PjVadT3wC6UeFvSs
         M5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8Y2azv+nxw19Z52AcgoVX5CrKSr3OnlYYqvuRrEq4lU=;
        fh=oERBEVqzVucB4/iLwMU3cDblmxYC2uHigIaXFpP7tdE=;
        b=Ok+4CoUM8GY8HhUTtAmbEKdL7f4ClTLr0Br11tlgJVC+ZPzX2KaMlmacgvepFXf8UE
         6D3GfFzAZQWzKK/BgoOWrunbjVoXWZ3It0Eti+p3ZqnJbcuswjuqfTD0OJJjQflMr8IF
         BvCyIbsrE1HCX1ip9BYFgW3vn7fOCtNAfmMU09bPsODRibV1PyjWUWlP7sZukZuoWhS8
         Ja49jaZVzNLwwh7leknC8+GGfSyZ7j8vP/grGild8iOqE9BpxbdNSEeh/81ULL4/FLnq
         KLUNKfQDo6uevvrct+8KL6AoOWQ0/4RjS2EL04sEm8D05sZOe/k6QcWxBQl/UD6xf86r
         hvkQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774210476; x=1774815276; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y2azv+nxw19Z52AcgoVX5CrKSr3OnlYYqvuRrEq4lU=;
        b=H3EG37ez9musGfigWq6+f3+NtqBi6FSxvVC5lm0UKyDyUgRvxNvm3dKdsQswlpbkU6
         cKh/TPGgam382a6jWsMqC1Aa0xtlCHi9eu1Uv6OHa6b34e6Is8wdibkyJgwOZnvuaIk8
         YhbitRP50V+EDZqFI/KnF9MjDydthazKpWqyM/ict/IElh34c0/9/WqLxsgGrGg1K6/k
         y6BBpIexqu7wrpH4p1+9gwxH4Uq7w1JMHKqovfZujRbxTluq2LQzrWyvumTbpEreDCQP
         odmDMi0qxPQYjeiv87z235wc+AaxvYU9Y4+cQVV/EinXeW/593hsRQJWXnt+hSGlQEw6
         E9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774210476; x=1774815276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y2azv+nxw19Z52AcgoVX5CrKSr3OnlYYqvuRrEq4lU=;
        b=G5WfFIEFrohgJEal1xk0pG/b3L9QY++u1pfAgfDrzTcO0RLPpT0nwcgnHXwr/JILt1
         JlAKC+x3D3NE6jRHbJLsuMb3PXNnFHILSzy9EUhaI6eMFfwaGJck6iAj0Ctm2cfOPk8+
         p9BxGBoWBPcOX8GxSXLO3ClY292B3Jyg1+po8NELpGSojqW1x77PJ+WWjmH/FCfjoWTg
         qDxz7Lb2rDvU0LDbBEmXJBezi5eWcBwLZDwvf7ZEzny6VB3P2XcJraS8zXjSwIIQ2sbi
         J0g1hy5ORFLdyjE0C2DjNuHyRWhTscP3hC1TVercs3iOf0BUwHuU7omx8yNNFAb+sPgj
         Sc9g==
X-Gm-Message-State: AOJu0YxIDrn5zLsszUj/qjJBr+nWFWbV65Jq8jbVyq4+az+HRR1r2rMo
	ObWf9l/2g3iYZvFvvav66x7ofB4Tqxu8W6D9mHYvcpoLuY5Jom+mxyMRPeKD7yPilW7+vHoAknV
	VBdKgrrpMEbPZQGOsk0jeDJFgSJ8KzLQ=
X-Gm-Gg: ATEYQzz57tbNNgONhIl0AXTMgXK+ML9PP9poheemShPkp781vhVX1RLYD4eJuj4Rmbk
	VR2vQWyh6HqvqjRAabL+T54MLgs/hgS/9qIQoxEH86KfZNHtPCuVCJnnNwly+G5SjB94enOPXYh
	4RCpIiT475S2cK+E1At2mAdyMWo9lDxzX8dbDgmnwaJLJvD2CBFRSk4mBOMgIDWfGMjRncf4+fY
	hwQ+t3LV2CUvo+UhtVe8Xc/wVw7ZvSisG1K2ZtAW+9qW/qetGQlK5sAPP9mhnBUI3cMzlzMxczn
	zkki31icNMDRQNdwmdNDhrBcGZ81Jye9469vzTYO6VWbMhWnMGufc6F+qiZTKLl93/nfkRxTctP
	0+pdKaCyw5crk4Tg64t6xoRwriSZZrAJba2HJvhx8vYApkWbyD70olv+eyWI0+6ZHTk3tdw==
X-Received: by 2002:a05:690c:ec5:b0:79a:b03a:a296 with SMTP id
 00721157ae682-79ab03aa81amr22155757b3.32.1774210476272; Sun, 22 Mar 2026
 13:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260322171515.1955265-1-khem.raj@oss.qualcomm.com> <f5f9d5c4-d5d3-443a-ad48-53743ebb212a@gmail.com>
In-Reply-To: <f5f9d5c4-d5d3-443a-ad48-53743ebb212a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Mar 2026 13:14:25 -0700
X-Gm-Features: AaiRm53SKsxAirXaq-LkLGFHqb911esJsOvUaSwFCWBrWXzT02Hzr7HKTg9HU6s
Message-ID: <CAMKF1soDeKTP7T6nPUx76jDAf58WHfhBxj4j-UQt54NA=ZByqQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] ntopng: Upgrade to 6.6
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000031ef04064da291d7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 20:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125490

--00000000000031ef04064da291d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026, 11:25=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:

>
> On 3/22/26 18:15, Khem Raj via lists.openembedded.org wrote:
> > Fix build with Lua 5.5
> > Add fixes to build with ndpi 5.0
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> >  .../0001-Follow-rrd-post-1.8-change.patch     |  32 ---
> >  ...kefile.in-don-t-use-the-internal-lua.patch |  36 +--
> >  ...utogen.sh-generate-configure.ac-only.patch |  36 ---
> >  ...Allow-dynamic-linking-against-ndpi-3.patch |  51 ++--
> >  ...-configure.ac.in-fix-configure-error.patch |  42 ---
> >  ...nfigure.ac.in-fix-host-contamination.patch | 188 +++++++++++--
> >  ...figure.ac.in-not-check-clang-on-host.patch |  44 ----
> >  ...a-5.5-API-signature-for-lua_newstate.patch | 247 ++++++++++++++++++
>
>
> Could this patch be trimmed? It is 200+ lines long, but it changes only
> 1 line, the rest seems to be whitespace change.
>
> Yeah my editor had linter on
>
>
>

--00000000000031ef04064da291d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 22, 2026, 11:25=E2=
=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com">skandi=
graun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
On 3/22/26 18:15, Khem Raj via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; Fix build with Lua 5.5<br>
&gt; Add fixes to build with ndpi 5.0<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank" rel=3D"noreferrer">khem.raj@oss.qualcomm.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 .../0001-Follow-rrd-post-1.8-change.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 32 ---<br>
&gt;=C2=A0 ...kefile.in-don-t-use-the-internal-lua.patch |=C2=A0 36 +--<br>
&gt;=C2=A0 ...utogen.sh-generate-configure.ac-only.patch |=C2=A0 36 ---<br>
&gt;=C2=A0 ...Allow-dynamic-linking-against-ndpi-3.patch |=C2=A0 51 ++--<br=
>
&gt;=C2=A0 ...-configure.ac.in-fix-configure-error.patch |=C2=A0 42 ---<br>
&gt;=C2=A0 ...nfigure.ac.in-fix-host-contamination.patch | 188 +++++++++++-=
-<br>
&gt;=C2=A0 ...figure.ac.in-not-check-clang-on-host.patch |=C2=A0 44 ----<br=
>
&gt;=C2=A0 ...a-5.5-API-signature-for-lua_newstate.patch | 247 ++++++++++++=
++++++<br>
<br>
<br>
Could this patch be trimmed? It is 200+ lines long, but it changes only<br>
1 line, the rest seems to be whitespace change.<br>
<br>Yeah my editor had linter on=C2=A0<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000031ef04064da291d7--

