Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D72C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:07:40 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.16364.1704805653209597334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CL1wc9Ny;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28c0df4b42eso2660200a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 05:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704805652; x=1705410452; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4ykb1ei6y+1UOmgGEw+7S8njF6YMF5JmuA1710dUDQ=;
        b=CL1wc9Ny21goXLPXt9RflvchBjSxHqhOdYNIRo5wO9m2jECATaHPZHrqsTjCaX7tFr
         Q9qj2SOb7nD1HlEFzyKtCE/+pLQlsbve9UjhdeJ5eKcpkhoq/gV5kRhuyDuyillcpCec
         Fl0KIptliQiw1l2DW0dLYMOxZCsigcNHux8h9drBeLaXCHv1LAJ9gU4zSipBE4Vv4WAF
         vg0bQJjc/ZjvcV1CTWxN85XuHANuqdHXB4ijr+jXRe5POB+Wxi3iiaF5P86rvpt9Tu8C
         geraSQIZtnfURxWGDHQwhF1/krs3jpzJYmUh+RL5e3PJWhwJNn726GNxTnV6hwwEh41o
         as1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805652; x=1705410452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4ykb1ei6y+1UOmgGEw+7S8njF6YMF5JmuA1710dUDQ=;
        b=JZajcA6KO00IplTVjSFlq4o1dHfogS8+Iv2uxlQqARDzO0FJnGu7C0Auyk/SMO/8n0
         IS6UE47E7kn2utUV7TFmNFTTvT3fag3rIGF5rjibcYW09QfP8Nv4ZMfqwXN3fXL7MDz6
         i+0jHSOBt05Q1NesDyrU7zvu1FTiMqXHj9aRRL/K8S/w7xKsp+YyZ4wutHFPl3E2R1pN
         I+lIXQ1y9x2k0/lz/+9SHgzNcylcNyhOBmDH0WTUVXJXd8gPsWxM/q+ElG7n5QmQfGzh
         uDbAuqCpIMeczQDqIsE6GgnN8qxDl5oLnzvVz/84ug+dEPxZwNhw42Lc6aOGzDqFmvlG
         5vIg==
X-Gm-Message-State: AOJu0YwbIPkQYkzYuOydbHaqXMabyab6tkgosLvLsjPN5DyFV+QDzbeL
	RckHTCOrxjpZ1HBZ+PRe7on0FIXYCZNsy8p9qdM=
X-Google-Smtp-Source: AGHT+IGnulWoal95VSq0ndwAfJt4SITFzl9Lo0apCo6txHAe0FTsBR4vgLqMSDSAdUwY0tym4O2D7W8thsjEC1xfXng=
X-Received: by 2002:a17:90b:1c01:b0:28c:4f11:1894 with SMTP id
 oc1-20020a17090b1c0100b0028c4f111894mr829454pjb.39.1704805652337; Tue, 09 Jan
 2024 05:07:32 -0800 (PST)
MIME-Version: 1.0
References: <20240108181014.321844-1-alperyasinak1@gmail.com> <593B95CF-FB18-4AF4-997C-C1263BB0CF4D@arm.com>
In-Reply-To: <593B95CF-FB18-4AF4-997C-C1263BB0CF4D@arm.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Tue, 9 Jan 2024 16:07:21 +0300
Message-ID: <CAGpma=6tqLfMV_swJaupYfXdQ=tsbD1PvYete+PHq-GY4sscSA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv3] wavpack: upgrade 5.1.0 -> 5.6.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005197f7060e82ff72"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 13:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108188

--0000000000005197f7060e82ff72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the tips. I clearly understood when "lib_package" should and
should not be used with the examples you have shown.

> Manpages disappeared too.  Do they need to be enabled, or were they
removed?

I thought there should be no manpages in target so removed with cmake
option. I guess, I should have created packageconfigs for both "manpages"
and "shared lib" options and enable only shared lib in bb. If people don't
want to use shared lib or want to add manpages, it can be added from
bbappend.

Best Regards,
Alper Ak


Ross Burton <Ross.Burton@arm.com>, 9 Oca 2024 Sal, 14:32 tarihinde =C5=9Fun=
u
yazd=C4=B1:

>
>
> > On 8 Jan 2024, at 18:10, Alper Ak via lists.openembedded.org
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > -inherit autotools lib_package
>
> You removed lib_package, which will change the packaging.  Always remembe=
r
> to check the packaging only changes in ways you expect (buildhistory-diff
> is very useful for this):
>
> packages/cortexa57-poky-linux/wavpack: PACKAGES: removed "wavpack-bin=E2=
=80=9D
>
> This is because you removed lib_package, which adds that package.  This
> class pulls ${bindir} into ${PN}-bin, so the main package is _just_ the
> library.  Of course there may be no binaries in bindir so it could have
> been a redundant inherit.
>
> packages/cortexa57-poky-linux/wavpack/wavpack: PKG changed from
> libwavpack1 to wavpack [default] - may indicate debian renaming failure
>
> This is what happens when the base package used to just contain a library
> (so it gets renamed to reflect the library name) and now doesn=E2=80=99t,=
 so can=E2=80=99t
> be renamed. This suggests that it was not a redundant inherit after all.
>
> packages/cortexa57-poky-linux/wavpack/wavpack: FILELIST: removed
> "/usr/lib/libwavpack.so.1.2.0", added "/usr/bin/wavpack /usr/bin/wvgain
> /usr/lib/libwavpack.so.1.2.5 /usr/bin/wvunpack /usr/bin/wvtag=E2=80=9D
>
> Here we can see .so.1.2.0 being replaced with .so.1.2.5 which is expected=
,
> but also ${bindir} being added as the -bin package no longer exists.  Thi=
s
> is wrong and lib_package should be inherited.
>
> packages/cortexa57-poky-linux/wavpack/wavpack-dev: RRECOMMENDS: added
> "openssl-dev=E2=80=9D
>
> This is expected as you depend on openssl now.
>
> packages/cortexa57-poky-linux/wavpack/wavpack-doc: FILELIST: removed all
> items "/usr/share/man/man1/wavpack.1 /usr/share/man/man1/wvunpack.1
> /usr/share/man/man1/wvtag.1 /usr/share/man/man1/wvgain.1=E2=80=9D
> packages/cortexa57-poky-linux/wavpack/wavpack-doc: PKGSIZE changed from
> 25522 to 0 (-100%)
>
> Manpages disappeared too.  Do they need to be enabled, or were they
> removed?
>
> Ross

--0000000000005197f7060e82ff72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the tips. I clearly understood when &quot;lib_p=
ackage&quot; should and should not be used with the examples you have shown=
.<br><br>&gt; Manpages disappeared too.=C2=A0 Do they need to be enabled, o=
r were they removed?<br><br>I thought there should be no manpages in target=
 so removed with cmake option. I guess, I should have created packageconfig=
s for both &quot;manpages&quot; and &quot;shared lib&quot; options and enab=
le only shared lib in bb. If people don&#39;t want to use shared lib or wan=
t to add manpages, it can be added from bbappend.<br><br>Best Regards,<br>A=
lper Ak<br></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross=
.Burton@arm.com</a>&gt;, 9 Oca 2024 Sal, 14:32 tarihinde =C5=9Funu yazd=C4=
=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On 8 Jan 2024, at 18:10, Alper Ak via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &=
lt;alperyasinak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targ=
et=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; -inherit autotools lib_package<br>
<br>
You removed lib_package, which will change the packaging.=C2=A0 Always reme=
mber to check the packaging only changes in ways you expect (buildhistory-d=
iff is very useful for this):<br>
<br>
packages/cortexa57-poky-linux/wavpack: PACKAGES: removed &quot;wavpack-bin=
=E2=80=9D<br>
<br>
This is because you removed lib_package, which adds that package.=C2=A0 Thi=
s class pulls ${bindir} into ${PN}-bin, so the main package is _just_ the l=
ibrary.=C2=A0 Of course there may be no binaries in bindir so it could have=
 been a redundant inherit.<br>
<br>
packages/cortexa57-poky-linux/wavpack/wavpack: PKG changed from libwavpack1=
 to wavpack [default] - may indicate debian renaming failure<br>
<br>
This is what happens when the base package used to just contain a library (=
so it gets renamed to reflect the library name) and now doesn=E2=80=99t, so=
 can=E2=80=99t be renamed. This suggests that it was not a redundant inheri=
t after all.<br>
<br>
packages/cortexa57-poky-linux/wavpack/wavpack: FILELIST: removed &quot;/usr=
/lib/libwavpack.so.1.2.0&quot;, added &quot;/usr/bin/wavpack /usr/bin/wvgai=
n /usr/lib/libwavpack.so.1.2.5 /usr/bin/wvunpack /usr/bin/wvtag=E2=80=9D<br=
>
<br>
Here we can see .so.1.2.0 being replaced with .so.1.2.5 which is expected, =
but also ${bindir} being added as the -bin package no longer exists.=C2=A0 =
This is wrong and lib_package should be inherited.<br>
<br>
packages/cortexa57-poky-linux/wavpack/wavpack-dev: RRECOMMENDS: added &quot=
;openssl-dev=E2=80=9D<br>
<br>
This is expected as you depend on openssl now.<br>
<br>
packages/cortexa57-poky-linux/wavpack/wavpack-doc: FILELIST: removed all it=
ems &quot;/usr/share/man/man1/wavpack.1 /usr/share/man/man1/wvunpack.1 /usr=
/share/man/man1/wvtag.1 /usr/share/man/man1/wvgain.1=E2=80=9D<br>
packages/cortexa57-poky-linux/wavpack/wavpack-doc: PKGSIZE changed from 255=
22 to 0 (-100%)<br>
<br>
Manpages disappeared too.=C2=A0 Do they need to be enabled, or were they re=
moved?<br>
<br>
Ross</blockquote></div>

--0000000000005197f7060e82ff72--

