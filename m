Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.13228.1626105851015655363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jul 2021 09:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vy66dbv3;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: jatedev@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso212640pjx.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jul 2021 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r+3KZBiC4SFxB/LRqvoG6jBv+y/Usu5fw2eCmIiANx8=;
        b=Vy66dbv3N9WzMOi5yElT9S2+tlVJSBbW/reyMcA7p8TbvMKqam/gZUXB1przuaifL2
         HLHwaAKZQgxSiZ3a5UHG1hAC3zJzSWDikCDXrU5Stt7rH8spxPWexiIdEgAe9u93gpXw
         Z3/wYUGTLEl55TC/LD07cvQCpGc2FhqjSD7RBFy7SVbKqR22SIXNFc+xFQEpWdmdwQiM
         K7np+33qnGwiPWx58YpP0WQwMCxjTGqF9qoWzarPN5iGWHWQ+7Fx0gCF1KDRDJKJPPl2
         9AVl2Kv7qFIV8B03WzRa0CUkXO2uEelgsfSbnlXii0fBz0iMa7ZPXZjAM1/EvUybT1Cl
         mNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r+3KZBiC4SFxB/LRqvoG6jBv+y/Usu5fw2eCmIiANx8=;
        b=MZBm+Zh0QTrDXlIjZUJ3IN/o+xme0x4rIsqSJwk89WZ0YOxUB7gNHnd51CDYfJWONU
         /nG5vvuNK3+aNt3glJDxQ3reyxo0sWo1zP0jzTi7CwoFByqUaTc3eh9r7sZ2e6R4faHp
         cTg9yXnILaopSLaZgkopg/rpZ5XWNWCqdbbakvygDRU8ipiAErVMfYHwDCX88W2EVKd0
         6zkCShzHD56icTEdfcc5qe6nqKRKpzOZkcEBvMKiYfhDI+9LqCFTEEFivPPsKYblRh/v
         BdkV0JKiHg0tln0P9EslxW/v5xn5Tr+VpO+KsrzFP8SKyWerj6Y3omJce+nEbZHQ2f8S
         qVJw==
X-Gm-Message-State: AOAM531WMOPnxDskB5aG50JS98PBKOW8LvrpezkqTNgYpgEtxgo473sm
	OInPsnmbdyecLnyyl8FGzQBj03Uvbmtw20Z/Oag=
X-Google-Smtp-Source: ABdhPJzTVT7tcx1aAkQHpeDNg1G3GJNwtbRwJb1h4gf0RaJzf/QTMojMr7DEfrVU6hic65xQHJgdxGUSBkAqICPhst4=
X-Received: by 2002:a17:90a:1a:: with SMTP id 26mr14650159pja.187.1626105850531;
 Mon, 12 Jul 2021 09:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626055148.git.jatedev@gmail.com> <a7901ba7-29c6-507b-3cc4-2be2fc8e1016@gmail.com>
In-Reply-To: <a7901ba7-29c6-507b-3cc4-2be2fc8e1016@gmail.com>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Mon, 12 Jul 2021 12:03:59 -0400
Message-ID: <CAPphmgaRX7dsRywafByOQzLQqppfOSGXfkk7ujQtm1Wvg5=2uw@mail.gmail.com>
Subject: Re: [meta-networking][dunfell][PATCH 0/2] ufw: Backport 0.36, update module RRECOMMENDS
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096922305c6ef45d3"

--00000000000096922305c6ef45d3
Content-Type: text/plain; charset="UTF-8"

Ufw version 0.34 does not work with the python 3 within dunfell, so I
backported 0.36 running its self tests successfully.

I have now found the stable release and LTS guidance on the yocto project
wiki. Let me know if this is appropriate for the dunfell branch.

- Jate S.

On Mon, Jul 12, 2021 at 9:44 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 7/11/21 7:08 PM, Jate Sujjavanich wrote:
> > Backport ufw 0.36 to dunfell and update kernel module RRECOMMENDS for
> > linux-yocto 5.4 in dunfell poky.
> This update, is it bug fix only ?
>
> -armin
> >
> > The following changes since commit
> c38d2a74f762a792046f3d3c377827b08aade513:
> >
> >   dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45
> -0700)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/jatedev/meta-openembedded pr-dunfell-ufw-0.36
> >   https://github.com/jatedev/meta-openembedded/tree/pr-dunfell-ufw-0.36
> >
> > Jate Sujjavanich (2):
> >   ufw: bump version to 0.36 and add services
> >   ufw: update RRECOMMENDS for linux-yocto 5.4
> >
> >  .../ufw/ufw/0001-optimize-boot.patch          |  37 ++++--
> >  ...option-to-specify-iptables-location.patch} |  41 +++---
> >  .../ufw/ufw/0002-lp1044361.patch              | 118 ------------------
> >  .../ufw/ufw/0003-fix-typeerror-on-error.patch |  20 ---
> >  .../0003-only-make-one-reference-to-env.patch |  73 +++++++++++
> >  .../ufw/ufw/0004-lp1039729.patch              |  40 ------
> >  .../ufw/ufw/0005-lp1191197.patch              |  32 -----
> >  ...setup-only-make-one-reference-to-env.patch |  77 ------------
> >  .../recipes-connectivity/ufw/ufw_0.33.bb      |  59 ---------
> >  .../recipes-connectivity/ufw/ufw_0.36.bb      |  90 +++++++++++++
> >  10 files changed, 209 insertions(+), 378 deletions(-)
> >  rename
> meta-networking/recipes-connectivity/ufw/ufw/{setup-add-an-option-to-specify-iptables-location.patch
> => 0002-add-an-option-to-specify-iptables-location.patch} (87%)
> >  delete mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
> >  delete mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0003-only-make-one-reference-to-env.patch
> >  delete mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
> >  delete mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
> >  delete mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
> >  delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> >  create mode 100644 meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
> >
>
>

--00000000000096922305c6ef45d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ufw version 0.34 does not work with the python 3 with=
in dunfell, so I backported 0.36 running its self tests successfully.</div>=
<div><br></div><div>I have now found the stable release and LTS guidance on=
 the yocto project wiki. Let me know if this is appropriate for the dunfell=
 branch.</div><div><br></div><div>- Jate S.<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 12, 2021=
 at 9:44 AM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster8=
08@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
On 7/11/21 7:08 PM, Jate Sujjavanich wrote:<br>
&gt; Backport ufw 0.36 to dunfell and update kernel module RRECOMMENDS for<=
br>
&gt; linux-yocto 5.4 in dunfell poky.<br>
This update, is it bug fix only ?<br>
<br>
-armin<br>
&gt;<br>
&gt; The following changes since commit c38d2a74f762a792046f3d3c377827b08aa=
de513:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-=
29 11:41:45 -0700)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://github.com/jatedev/meta-openembedd=
ed" rel=3D"noreferrer" target=3D"_blank">github.com/jatedev/meta-openembedd=
ed</a> pr-dunfell-ufw-0.36<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/jatedev/meta-openembedded/tr=
ee/pr-dunfell-ufw-0.36" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/jatedev/meta-openembedded/tree/pr-dunfell-ufw-0.36</a><br>
&gt;<br>
&gt; Jate Sujjavanich (2):<br>
&gt;=C2=A0 =C2=A0ufw: bump version to 0.36 and add services<br>
&gt;=C2=A0 =C2=A0ufw: update RRECOMMENDS for linux-yocto 5.4<br>
&gt;<br>
&gt;=C2=A0 .../ufw/ufw/0001-optimize-boot.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 37 ++++--<br>
&gt;=C2=A0 ...option-to-specify-iptables-location.patch} |=C2=A0 41 +++---<=
br>
&gt;=C2=A0 .../ufw/ufw/0002-lp1044361.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 118 ------------------<br>
&gt;=C2=A0 .../ufw/ufw/0003-fix-typeerror-on-error.patch |=C2=A0 20 ---<br>
&gt;=C2=A0 .../0003-only-make-one-reference-to-env.patch |=C2=A0 73 +++++++=
++++<br>
&gt;=C2=A0 .../ufw/ufw/0004-lp1039729.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 40 ------<br>
&gt;=C2=A0 .../ufw/ufw/0005-lp1191197.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 32 -----<br>
&gt;=C2=A0 ...setup-only-make-one-reference-to-env.patch |=C2=A0 77 -------=
-----<br>
&gt;=C2=A0 .../recipes-connectivity/ufw/<a href=3D"http://ufw_0.33.bb" rel=
=3D"noreferrer" target=3D"_blank">ufw_0.33.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 59 ---------<br>
&gt;=C2=A0 .../recipes-connectivity/ufw/<a href=3D"http://ufw_0.36.bb" rel=
=3D"noreferrer" target=3D"_blank">ufw_0.36.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 90 +++++++++++++<br>
&gt;=C2=A0 10 files changed, 209 insertions(+), 378 deletions(-)<br>
&gt;=C2=A0 rename meta-networking/recipes-connectivity/ufw/ufw/{setup-add-a=
n-option-to-specify-iptables-location.patch =3D&gt; 0002-add-an-option-to-s=
pecify-iptables-location.patch} (87%)<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0002-lp1044361.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0003-fix-typeerror-on-error.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0003-only-make-one-reference-to-env.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0004-lp1039729.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0005-lp1191197.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
setup-only-make-one-reference-to-env.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/<a h=
ref=3D"http://ufw_0.33.bb" rel=3D"noreferrer" target=3D"_blank">ufw_0.33.bb=
</a><br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/ufw/<a h=
ref=3D"http://ufw_0.36.bb" rel=3D"noreferrer" target=3D"_blank">ufw_0.36.bb=
</a><br>
&gt;<br>
<br>
</blockquote></div>

--00000000000096922305c6ef45d3--
