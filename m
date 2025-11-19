Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A977CF3959
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:33:59 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11522.1763570030702139902
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yw1hFdln;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78a76afeff5so3062117b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 08:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763570030; x=1764174830; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uCwg2xplhuwcXls/ly1tCMFv1IZWt9GeNZ1oR8fzgAs=;
        b=Yw1hFdlnGVOBkmzVRBoeoGOMSIwZVJzKASlMddUV3alAkin0mmzbppoeyE7veI2cfC
         dBJH2M7CEKn7Gb9z4Uakvx6DoRbIQcYfW7D8mW8T2OYWstw2eAOFMoabU/ipNrGznoTj
         VfW4jhw0c3Ng5yDEE/mVVzSnMi5M0s5fyl0POiJdrzhsDqzIgfP83eAze1ll+QcSSe+h
         oQpD63dRJz9SNYQpsnabtpn53XTJtJw5gfsgym7NBguErbDL5KIpfAY3fPTVctpYR01A
         PCoI0wxskM8O++Th7pCnG/5PO6hNHlBXM8RYBTOBlhMdC/xmW2Mr0HIR68epdtm6J6Be
         /loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570030; x=1764174830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCwg2xplhuwcXls/ly1tCMFv1IZWt9GeNZ1oR8fzgAs=;
        b=gCwc5BYG6xwlMkjeOQoA4kR8YVo4VuAiIqJLjN6IN2M88ZSMa9FvQFAiwQDRLu8CMk
         Rlae+WBQ19DULK537rDJRND1MMnzU73BPLP2/ROyhNF2i/udM4Y6bYhA8Sqd9WdiFAwM
         T0N9LKCl8MKBEdxQQVJgCL/nlwNldmEzksJ2EASKOnHUenHmLajL/OK2tq8Hkz603JmK
         f41kYERsW4SbPsdJocjrGz8AWh2Yd+Un3NvjNCwMx3rfxkdoYwCdMv2tvnwPL6PaXk6p
         l1AXkzsZfiVRusZS1n4hveWB6soBpVvT4lUfm0emJ7zW4Evx0RWjmIR7EFnb+MH7PNB3
         U7JA==
X-Gm-Message-State: AOJu0Yz+QlknMIbNq04Vf0YBGHIE0EfZPIZH0XqLU/Do3yN+8BjbHYad
	mXRhmN85StT0ZVPAogfy+DciMCYifHmcAKm2n+gkDiJVmlILT2p2LB7j+A04YyYfFBF4F+I9t/4
	WnwHCcqx3SMZSiDsgXGqkjmVGBwrA230=
X-Gm-Gg: ASbGncuKizX23QKBbxZBUcmznlV+X0w+sgtj/F04AU6qU8A9eES55Z6GnCWFE1zX2uK
	cKtyRhMMN/i+M1Bxv2Wdn87cH2ZIP+6KjdZWYFcIBxihTl28xhxQrbG+6qC9Jn+KfCiId4aNLqP
	wJ+IkLZnoN4M9HB59eiGcJcxVv4SekU6f4+lm63b5PWOqqWGolFrkaxnvUC9HOHemwZO2rZa1Lc
	vwL/3BHOQFfyLReYAYfimvAqqBSQm1XSWXTsmLBMlGnMqePycwE8H3wDgmp/M5WoOVUrbg4qKy9
	NYQXAeDCfv/eApTXAPPuAz17dqXyxEyFwDIO5rWcqze7pJgYlkzln6gSgjeB2N3N5e9BzzpyuNY
	fUFcy3+2c5RbUJhtLu+F+UC0d5HZILMNoEgm8xRlScmfsYA==
X-Google-Smtp-Source: AGHT+IEssC0THQTEjHebS2yiTXSgJtFdcFvilLt0/iXRl+xOVunN1g9IL4ICgYuVxkbsKyxnsdk22buue1p5MtW05rk=
X-Received: by 2002:a05:690c:4348:b0:784:8ed9:e362 with SMTP id
 00721157ae682-78929edb921mr134951817b3.40.1763570029843; Wed, 19 Nov 2025
 08:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20251119044347.2884483-1-raj.khem@gmail.com> <2C0908CC-B83A-412E-AD6C-528B88BD542A@arm.com>
In-Reply-To: <2C0908CC-B83A-412E-AD6C-528B88BD542A@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Nov 2025 08:33:23 -0800
X-Gm-Features: AWmQ_blJlGFDG0X19ekpKiQtwqdcsNDB8eXLczC2rTAhFki1QiviIwKVqFergrc
Message-ID: <CAMKF1spcVKsRnw3dg_CGcXBy1O4NLzLYh0zCGmdZTAbiUv+xEw@mail.gmail.com>
Subject: Re: [meta-gnome][ 1/3] gtksourceview4: Adjust for setting S in gnomebase.bbclass
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002a5bc90643f525c5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 16:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121910

--0000000000002a5bc90643f525c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 2:42=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 19 Nov 2025, at 04:43, Khem Raj <raj.khem@gmail.com> wrote:
> > -SRC_URI =3D "${GNOME_MIRROR}/gtksourceview/4.8/${PNAME}-${PV}.tar.xz \
> > +SRC_URI =3D
> "${GNOME_MIRROR}/gtksourceview/${@oe.utils.trim_version("${PV}",
> 2)}/${GNOMEBN}-${PV}.tar.xz \
> >            file://0001-remove-pointless-check.patch"
> > SRC_URI[sha256sum] =3D
> "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3fbabbb5958420a87d"
>
> You can change the SRC_URI to be just +=3D the patch, as gnomebase has a
> default SRC_URI too.
>
>
Thanks for the fix


> Ross

--0000000000002a5bc90643f525c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 19,=
 2025 at 2:42=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 19 Nov 2025, at 04:43, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrot=
e:<br>
&gt; -SRC_URI =3D &quot;${GNOME_MIRROR}/gtksourceview/4.8/${PNAME}-${PV}.ta=
r.xz \<br>
&gt; +SRC_URI =3D &quot;${GNOME_MIRROR}/gtksourceview/${@oe.utils.trim_vers=
ion(&quot;${PV}&quot;, 2)}/${GNOMEBN}-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-remove-pointless-=
check.patch&quot;<br>
&gt; SRC_URI[sha256sum] =3D &quot;7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c00=
6597b3fbabbb5958420a87d&quot;<br>
<br>
You can change the SRC_URI to be just +=3D the patch, as gnomebase has a de=
fault SRC_URI too.<br>
<br></blockquote><div><br></div><div>Thanks for the fix</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Ross</blockquote></div></div>

--0000000000002a5bc90643f525c5--

