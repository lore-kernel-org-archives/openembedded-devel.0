Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22112C5AD5A
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 02:10:00 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21388.1786327790834208409
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2026 19:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CfutNf/n;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-45837e52d8aso346156fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 19:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786327790; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9BfJQxfA9apGS1s7iZnORLM75dCKoMO2atwxIYaJ3OfqpUZfRLZ+nJf0791UQVNXh
         ibjfaxXSQIGuSjMN57j0Z7NRDGyuyRhQL9cWpWTKMAdBQZFESxTSD2Ki+dgZyBgQPybI
         GYon09Y+7oCQ7V1rOcHlF2NL3eoLo45fC+Rxn1Fs4NShmDA61791hH+CZYJAcsPyGm8b
         IUnnHqUJlkAe5g7TDQ1hIInA+BXe3yPo3feWb8LII0IPWlBsof/fd6SnrtyOhGKEIvLJ
         Re3omnh71/vk/uLZRSiLMLr9QkIMdDwekCebaWUzylwaNbGJw+5ClnOSnUBCqQRH2wGc
         tCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yGy7+y2isccb1h+d4LzMt33JDhDrBcQjLiP+1zs/puc=;
        fh=dzABH9JnyN3KCs6Dy8pFwSEYSF0uh86waDF4uJXR4Ek=;
        b=m8nsMlWVfeFPNYJ/0tYO7AbVz0nWx5pfy2HLg3zzL/cMLSnK+py/E8wAfeWl4Yb3xf
         LbhCHn78a1dXOfhwt+hJohjgZSRrvK186DIUpJzHpIuVXuT+Qq/lp7KfcPdo8ssHjilj
         XnFjbc5sCrvgwdSE1L2U4C4eDbV+Ov9IukWQHVRxHqsjSUlje7HR+bGgb2NWHjMgXFsY
         9MNSzShQgMnzKvSBYN26nvcdQX0xLVzf5fGFS6ZVi8HEmRilgUMpijIX+JqmekJUmlDH
         Za93qUJh/U6EViGBJPCeD+G8xDgAcArELT75IdPMU75jnoJziqqb54UAeKwx6vESjETx
         YUYg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786327790; x=1786932590; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yGy7+y2isccb1h+d4LzMt33JDhDrBcQjLiP+1zs/puc=;
        b=CfutNf/n96SYprWpgSnmbsvEowAqs2ETh3kfgT7I56+Ds914CrTaeRwP3LFEiTooX3
         0IdJW8VegVfyHtjMQRvtbXcrr/neGkOpP/obQOtpXYCsfC9BTZz6uiZT8a8ToJMLUT1d
         QTB1jDbzysqTBTPmzvo/DzI5KaFzVNeSnr2VFZZXJA0Jt5CkCWEQRhvqGpYrNr8hxygQ
         ofwoIh6uXfWnEbWJOYoMl0jla44Y3lJkwB+5X74fYumQ/G5C6KMAUMYkIVFsZQMRX515
         d6CWheDBXhBnRs8IuPueDFJ6PNF2LmTaCXVSSEXY4jgf+VGsrrHGVbs47mAJ7vsk/Cez
         YqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786327790; x=1786932590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGy7+y2isccb1h+d4LzMt33JDhDrBcQjLiP+1zs/puc=;
        b=cJARH45SWjHfOteaXZ0/REJjcMcv6RXOzc/a/RrXsEV+Lt/lpqEM8ettFW0OSSHAgc
         WmvT/8iiBgS/QINQ0JklrpoVhl+A+gxykErFOxWYKOahPwuPg8zAln3erwxonLk2yLZ+
         C0T3eyN1TWvDtgQ+1oalOUdAJuO/xMGVN+kKyexWnHq1qn2KqsvYpOhd9ZBPQwLnIiMB
         YhnE5IB7IyJF0U79VHwMiDub2uu1jax6xWrWujkkZun2ZQC/lipZht9oBGs1z/I//Swp
         7mZseHTAXX+cohnVT1Lu+FRW4k5nmM7oqxcGSJNG9sV76Ad887Llb9kJKQbOp/xnP76h
         MrVQ==
X-Gm-Message-State: AOJu0YxYtlmpi1PKtft4HVP4gN/kxHfcHeklLaKtg2bG33+76chfehWi
	z73kis3Yuv6DDO8I9kQgoauAL6i78GlDMYDQhDcPCnl6Bya35WXk2rL4HB43pLA107zoW6SOTgW
	zEHG8jBVBallU68b5xhJ/6ukFAxOXXZo=
X-Gm-Gg: AR+sD12JjwD5CW1LNIc3pK/XHSKK+iRttBaZNkHOag+bKciad+XtkB9wPOb6a6JrBG3
	mBYZzUxXALfQieMj2/sRWtFwLRdHWkVevNUiscvPA9PEPpt6doGgbX0yIJwZOqMSaGXNGQKkyhF
	Jh7MSfn8zAt+ymN06579P36nM6+zuun3VLMMUIw0qRA20d2Nu1DZY0c7ebGdBNphXyZKr/k16D5
	02E5/WOmsBXMehEyvIX9D/O/azPr6+x4lLqNpMzOT/E/KLwYWJkZFk8PBh+kks/xMpNF+mIvS2u
	7zD0HIgk6IP2gDGSAXVyxrjlbRwT1yLIhcxl8OM0oZEL4cs=
X-Received: by 2002:a05:6871:726:b0:43d:20f3:bc86 with SMTP id
 586e51a60fabf-4599e6e1048mr20079007fac.0.1786327789954; Sun, 09 Aug 2026
 19:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
 <20260804194003.3158916-27-ankur.tyagi85@gmail.com> <CA+s=J=xVmVDry8gq5DmkCMXC2swsffZFxtzE5e-6d5yTL-d2BA@mail.gmail.com>
In-Reply-To: <CA+s=J=xVmVDry8gq5DmkCMXC2swsffZFxtzE5e-6d5yTL-d2BA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 10 Aug 2026 14:09:38 +1200
X-Gm-Features: AUfX_mxqwj6DGHeBNYimCi_cUb1pDqZAlbtG8_T2vqwCqSrJm8m_52KJ6HHyAa8
Message-ID: <CADySD0Em+FRNvXCDVyxx5jKd64WdxoP-ToLRq-dQyUAOmB01og@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][wrynose][PATCH 27/36] libupnp: upgrade
 1.14.25 -> 1.14.31
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 02:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128874

On Mon, Aug 10, 2026 at 1:48=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> This causes mpd build to break:
>
> | Run-time dependency libupnp found: YES 1.14.31
> |
> | ../sources/mpd-0.24.9/src/lib/upnp/meson.build:29:4: ERROR: Problem
> encountered: Your libupnp version is known to be broken, see
> https://github.com/pupnp/pupnp/issues/528
> |
> | A full log can be found at
> /local/mnt/workspace/wrynose/build/tmp/work/cortexa57-oe-linux/mpd/0.24.9=
/build/meson-logs/meson-log.txt
> |

Thanks Anuj, I will look into it later today.

cheers
Ankur

>
> On Wed, Aug 5, 2026 at 3:43=E2=80=AFAM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Khem Raj <khem.raj@oss.qualcomm.com>
> >
> > Upstream changes (ChangeLog):
> >  * 1.14.31: fix for CVE-2026-41682.
> >  * 1.14.30: revert an inadvertent API change (25d4bd0b).
> >  * 1.14.29: CMake builds from the release tarball now work.
> >  * 1.14.26-28: SONAME/CMake build fixes and assorted portability fixes
> >    (e.g. OmniOS POSIX asctime_r).
> >
> > Version-only bump (git tag release-1.14.31); recipe unchanged.
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > (cherry picked from commit d98bc9596101d3eae2921cd93f1a35b72869edf6)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../libupnp/{libupnp_1.14.25.bb =3D> libupnp_1.14.31.bb}          | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.25.b=
b =3D> libupnp_1.14.31.bb} (94%)
> >
> > diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.=
25.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
> > similarity index 94%
> > rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.2=
5.bb
> > rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.=
bb
> > index bcecfd3b8e..6ba21971d0 100644
> > --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
> > +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
> > @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://pupnp.sourceforge.net/"
> >  LICENSE =3D "BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D394a0f17b97f33426275571e159=
20434"
> >
> > -SRCREV =3D "da7cf950f22357545061961b7e5610e08690b0cf"
> > +SRCREV =3D "79ff958ed1012e60faba84981481f76cea43c7f2"
> >  SRC_URI =3D "git://github.com/pupnp/pupnp.git;protocol=3Dhttps;branch=
=3Dbranch-1.14.x;tag=3Drelease-${PV} \
> >            "
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#128774): https://lists.openembedded.org/g/openembed=
ded-devel/message/128774
> > Mute This Topic: https://lists.openembedded.org/mt/120599957/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

