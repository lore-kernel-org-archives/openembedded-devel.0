Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C542C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 01:38:28 +0000 (UTC)
Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49270.1790559499589449119
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 18:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nwP9czQ8;
 spf=pass (domain: gmail.com, ip: 74.125.231.99, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-493cf6d8e60so865135fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 18:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790559499; cv=none;
        d=google.com; s=arc-20260327;
        b=AuhwgUmmz0FkYCvC6pQXfqCkl6GFDs59r9mRtdHJ736FXcmdS8lczsIWpQzuaqq66o
         E41s6UcWAFjYFq58efupDmUXp0Td+NG0xqV/I/UY8o8x4D0xu8hj93RlCmVvmkvJVsOs
         3kvw1O34+XnNslQSv/Kig4Fe72tniUpGJMHLa6G2D4eAKemymk64B5ubftlSb/dvukxZ
         K/hmZz9Cir8xQIp4EF51ffuXYyDNmqOfZh9SoFgpFSFkz6L/BUQFz22ah1TMkC4pdPZy
         9xAqYgp8uBE3ZsYUD3tkyFlT3I4YIbaqAlSl0Rs7HZQ2gvqVH7o2Fl4FLGEi4RQ9q9Z/
         Yt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=THr5ANXPieupsLVuEkg8gszeRS0h96zbvCLULVmVOVc=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=FZ647EGXUCh+SNd84Tv1XaIOslKk52RmbAfWN8zyJ5Gtjlc9G3PyCokIh/oX6srWhI
         Y0xH2XK34dhbRH1qBjaTUwFQcO29t18vdwOuAsNKevpdklL6NH+zGvdDtGEPnFQZHIfA
         V5Ns7Ty036/Bh2JGyQUHP9L/CcTYm9rV9f2XeXjsY7M3HsROWmmshR7sWntayQASCbrH
         FDmqwowLqsm0CDpXwVO6qC41QlWZ7s3zHYRoa/T4i7a8NTHEf5wjWbnmJvoOGy6cMfH6
         4PtGz+RH81Lwxc3xax3Rpyt51/bpE3YfgVCm6NWQgU2ODeGDisG9VPuUiBJJE2sNpM8r
         2V7g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790559499; x=1791164299; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THr5ANXPieupsLVuEkg8gszeRS0h96zbvCLULVmVOVc=;
        b=nwP9czQ8N3zM2W9WlbkaFkSldyKR3t9j0W56IqZHW5CYU7NE16IzP9ZeiVQ+NSAqyO
         +h4JDtxP70Q90XUsEQU+JJJwseOv8+FCl3nhd9tkovyU6OZ4mE9ttMZPu+SIgTDGADAI
         1fWk9qeFGT4w9J227tPGL5fTMWrgMlpYfwS5Rg/GVaVycZceM6QspvX9pX7U84p/pFlb
         0Ir5ngwbXQqe72xCDC6Sru2Ojc5SzIawHTPAh3lBnUFD5DQgvo4tteAo8/5cxI9IaV/A
         R9y49C9w1xW/QXUmd/XwzXMc+DZl5+/aZl6zIoL2TWq4123/AUtlwM4dzgDUbfjJUuP4
         MSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790559499; x=1791164299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THr5ANXPieupsLVuEkg8gszeRS0h96zbvCLULVmVOVc=;
        b=0+210R3J5z6iK7zVnE1t6HSQep+kJyfZ5wpbql+Crl4M1xvucBFRWUDF0Cg+y+otnw
         ccsGwO5C+cB0JSTjurDkwPYROyUDWufYEruPbnM2nZ0Cg5oY5VyrdZC/EQM/yxDSRxIA
         2AnI/3s3XGNDPrlKIhjCYQ94JAfiZZBy8VPhTB7XBqA3jddCI/E2KQdO3zmmSpfvfzvF
         rvPWAmUN7LiVf4OjUsOM3+XAoG8PLKLdEvHGln/sytJEzbmiz6Vggu87YFc79kEgvsot
         9puKj4F5/Zazc0J6k1oXlAipH3vK4C2UxoXKM3b4AlGB/B4ZhbaAx9KVFG8QURcgfAGV
         PRig==
X-Gm-Message-State: AFq9FYLM6i1XrX/riAE4MFsizOGd7wjmToZEb4UpUyCgMOA+fBU28TeR
	RXZfywjzehxjH/oLENozBjDu1pBjixuc0I+Yzebg+VrztAV8SfvPQb9Z2M7OHNI+bGJnVESA6gV
	HFVRTEWXjlsMppwtfiSewvZDl0w+CXcc=
X-Gm-Gg: AYBFou1hr2oJX0uMrq2ahHP4abv0LyxnN3EMf2WkBdLhZAXy1yAw5JaKHL0/i+T9Twb
	dCBaGL21SOLGgpi/+zlq+eppDQHTy+QHgaNuCsbIA9KPXIO8h3JwErZ9jzjL9wR/LjEJe+VIqrp
	hzLDYzjJpod12MwTFAfe0BCLacRKw6IrpO4UX5/csCUxvtAA2AR81uVOZJMVh9TVA3E2EDNS6Cx
	BwsGnb1tqqkEj1OmRAkD5CPVbLqpcL3mtgu7S1fXSYY4kevK/c3TlV5MUdtQQvDx5wwXxmen3hx
	Xbmpm2OwmB3PvmCmEHsZXn55KtBJnAV3Erklngl3WXCcLCBiW6J4ENrqB/KxYLnRYh6AFw==
X-Received: by 2002:a05:6870:24a0:b0:47d:a12f:3951 with SMTP id
 586e51a60fabf-49357ce5264mr6677614fac.39.1790559498756; Sun, 27 Sep 2026
 18:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
 <20260927105002.1832451-27-ankur.tyagi85@gmail.com> <CAMKF1spx5aSzcn3+CGTQuqO-xRhB9QYemo_v_o5+i9xy_2GhUA@mail.gmail.com>
 <CADySD0EepB0Fy7+dt234maqiy9tBdcddC9_Ma9cfiN26QZVyjg@mail.gmail.com>
 <CAMKF1sq+MVmfgWOsLedrDKF2YJ068gQ8=bCECWdJLE1ghZKC5g@mail.gmail.com> <CADySD0Fx-0PW6bDa8D3g_rRjhXSBV5QB9NAq=cYeFMW0zMTeVw@mail.gmail.com>
In-Reply-To: <CADySD0Fx-0PW6bDa8D3g_rRjhXSBV5QB9NAq=cYeFMW0zMTeVw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 28 Sep 2026 14:38:07 +1300
X-Gm-Features: AclHuK-7AG_1h72o1vg4GOgpnt1DwnlOABRd0FSxVdHIHS8lPffDu1sVaQbbOZE
Message-ID: <CADySD0GDTs36xnxoMtVyDSnFrvAZ-YO+AoBQEKfc6mzJRFJiNw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 27/35] pocketpy: upgrade 2.1.8 -> 2.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 01:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130421

On Mon, Sep 28, 2026 at 1:02=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:
>
> On Mon, Sep 28, 2026 at 12:20=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> >
> >
> > On Sun, Sep 27, 2026 at 1:45=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmai=
l.com> wrote:
> >>
> >> Hello Khem,
> >>
> >> I can only repro this error after applying following commit from maste=
r-next:
> >> https://github.com/openembedded/meta-openembedded/commit/201f3c95cca90=
2207c5f6ad25ca057e803921542
> >>
> >> Without the above commit, build succeeds without any QA warnings.
> >>
> >> Not sure if that commit is relevant anymore.
> >
> >
> > This was needed for build to avoid buildpaths and tmpdir in output arti=
facts.
>
> Ok, I'll investigate it later. For now, please drop the patch

Sent v2 https://lists.openembedded.org/g/openembedded-devel/message/130420

> >
> >>
> >> cheers
> >> Ankur
> >>
> >> On Mon, Sep 28, 2026 at 8:52=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> >> >
> >> > This fails to build on AB
> >> >
> >> > | /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3=
-poky-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c: In fu=
nction 'time_sleep':
> >> > | /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3=
-poky-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:112:9:=
 error: implicit declaration of function 'c11_thrd__yield' [-Wimplicit-func=
tion-declaration]
> >> > |   112 |         c11_thrd__yield();
> >> > |       |         ^~~~~~~~~~~~~~~
> >> >
> >> >
> >> > For details see - https://autobuilder.yoctoproject.org/valkyrie/#/bu=
ilders/81/builds/1822/steps/17/logs/stdio
> >> >
> >> > On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via lists.openem=
bedded.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >> >>
> >> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> >>
> >> >> Changelog:
> >> >> https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0
> >> >>
> >> >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> >> ---
> >> >>  .../pocketpy/{pocketpy_2.1.8.bb =3D> pocketpy_2.2.0.bb}           =
| 2 +-
> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >>  rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.8.bb =3D> p=
ocketpy_2.2.0.bb} (95%)
> >> >>
> >> >> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb b/=
meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> >> >> similarity index 95%
> >> >> rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
> >> >> rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> >> >> index 910deba386..e4aca45ae8 100644
> >> >> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
> >> >> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> >> >> @@ -14,7 +14,7 @@ LICENSE =3D "MIT"
> >> >>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D224889df377610675315e19=
4ac59276c"
> >> >>
> >> >>  SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
> >> >> -SRCREV =3D "a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76"
> >> >> +SRCREV =3D "6cbece9ebc98c19fa2c189dc6963b421c22c40ae"
> >> >>
> >> >>
> >> >>  inherit cmake
> >> >>
> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> Links: You receive all messages sent to this group.
> >> >> View/Reply Online (#130361): https://lists.openembedded.org/g/opene=
mbedded-devel/message/130361
> >> >> Mute This Topic: https://lists.openembedded.org/mt/121453680/199791=
4
> >> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >>

