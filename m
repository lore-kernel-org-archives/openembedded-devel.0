Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F16CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 00:41:23 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.4473.1761871275113180000
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 17:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XnMuC+TR;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-44f44a1a515so1003507b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 17:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761871274; x=1762476074; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxmwYoUgSMyC8VBzkRUrOfe1DctR1WRdX050nEyg6Ws=;
        b=XnMuC+TRKruLOkfSAMvTvixFxHbfZ1blcGGBnws8IxAn7qzl1/G12bCN5CBnKGk056
         6AP689fMQWNJsBrZsUy/GHJaVlzpM27yd/z0glFztrQ2slEvm54Y0+kSuKmd9EgWlVSy
         AxXVOqjD4MWsHKXkouMpd2Vh/X84aRRJo4kEU7ybZ2ND4Z+R+s8T+lgQYZZfimaBzrNS
         sERwb5lm7NWeYKPwwgaaGkS5A2BpaxC6q8wTlPzR7o9tbS4k05XLntsXGLsRuQG4bLZP
         xCRRDmU4SKhZVsvTWeO8U9rRmp9oaiYk2xIFLTEUb7QReV4v6WFnE3rZlvmY8FSixJkY
         YD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761871274; x=1762476074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxmwYoUgSMyC8VBzkRUrOfe1DctR1WRdX050nEyg6Ws=;
        b=NGgyyChxz6uoZ7qrNPhIAE8e6EGOHNAcCLZ4SW6AOJ6HhHUQoIjdx9I3NEp5qcEcpd
         iERzz8nqrs/44Y6GuxcNcM4BBevv4jb2LvRWlOX6VduD+MNHuViA69d3MNj7KVO0fOZF
         ya4JDXTO9kmJ+tRlWXJr77IzmJ+IUUJcpPUfkJ8PJj13Gl+YmezoAkP4jb5opB3W8GQL
         TkBylGYAd1Ddr8yPfgbLUF9dHwuUN9+BtrNkNLg11Q1O1ErjQlAVJInuaV2uaVevDxpk
         EoeN8u0GGWhNPxr2dp0iSxHOQFswFMUUmU7ceME5R+ZxVOSq1Cj6Ld0cBiKdu7NlvKSy
         g4Mw==
X-Gm-Message-State: AOJu0Ywd/Wg4wbvdZzrfi8ipxnlAg2eU8itC9dbLhwCy5RaI/XuZ6/03
	MajJL0H1NYQXV2a9OgArIRVHn4BosAxa/B9g9wVqcsekjZoKEhBBA6aV8U6bYtLs/k/FgcXmitz
	8XuVc6t3uKpgcncmfYTlehkXOcWg/jRA=
X-Gm-Gg: ASbGncth0pMSdJ+J1Op5dG45wo0etzldwTJiyx+GMb/Kc1Yvs8toOy2f0Y9StPBmEDg
	uRkgsB7C79hZI6q1o4g2hJ4R4lJcrMfqm5sDNxHSTS0y5O2S3tExCElqMfuiFcGfkSYqVXykcCN
	EGPoLEH64t8pSYxxtCbfs2YlYFsDA9inUPxq/NntpMTmne8zKiVT18LrRjks7LU2hQFgFsKe0fn
	VRyqzxU79hZyTPzYMb2eBkuLNuWkz5ARl6C0QVCRMX9Es8ZXskujntxlbuDqN8=
X-Google-Smtp-Source: AGHT+IEWVu0a2syOPm/Pc1Yaq7eCRCFgQeb/HuGnYLbm4C6y0bHL2XYw+vV0Htp5onhu8mDA4iiJYONlQujf184QzQU=
X-Received: by 2002:a05:6808:c1e1:b0:43f:6cf3:ad37 with SMTP id
 5614622812f47-44f952126ecmr839530b6e.3.1761871274271; Thu, 30 Oct 2025
 17:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com> <fcb5f25762c06c8566d2fcfbcd4d0c2ad4e8c28a.camel@intel.com>
In-Reply-To: <fcb5f25762c06c8566d2fcfbcd4d0c2ad4e8c28a.camel@intel.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 31 Oct 2025 13:41:03 +1300
X-Gm-Features: AWmQ_blup6DWm_2n1b9otJXYPLEsrh6tJaDf2oUQAFuyvobCRhb8a2Rx6sNPq34
Message-ID: <CADySD0HFWDovuAd6cvCQ3WzNGUankPYYBDjvGPmO95-iuMZP6w@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/4] mercurial: Update CVE status
 for CVE-2022-43410
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 00:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121212

On Thu, Oct 30, 2025 at 7:38=E2=80=AFPM Mittal, Anuj <anuj.mittal@intel.com=
> wrote:
>
> On Wed, 2025-10-15 at 19:35 +1300, Ankur Tyagi via
> lists.openembedded.org wrote:
> > From: Ninette Adhikari <ninette@thehoodiefirm.com>
> >
> > The recipe used in the `meta-openembedded` is a different mercurial
> > package compared to the one which has the CVE issue.
> > Package used in `meta-embedded`: https://www.mercurial-scm.org/
> > Package with CVE issue is a Jenkins plugin:
> > https://plugins.jenkins.io/mercurial/
> > (This is reflected in the CPE)
> >
> > Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit bf84ac1c4c1a00c2aa92a09fbdfae128d055fe05)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
> > b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
> > index 2451a36be2..53fe0a28ae 100644
> > --- a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
> > +++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
> > @@ -34,3 +34,4 @@ PACKAGES =3D+ "${PN}-python"
> >  FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
> >  FILES:${PN}-python =3D "${nonarch_libdir}/${PYTHON_DIR}"
> >
> > +CVE_STATUS[CVE-2022-43410] =3D "cpe-incorrect: The recipe used in the
> > `meta-openembedded` is a different mercurial package compared to the
> > one which has the CVE issue."
>
> This shouldn't be a cpe-incorrect in that case and should use
> mercurial-scm as the vendor in CVE_PRODUCT.

Good point, I'll send the fix to the master branch as well.
Please drop this patch.

>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120690):
> > https://lists.openembedded.org/g/openembedded-devel/message/120690
> > Mute This Topic: https://lists.openembedded.org/mt/115766810/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub [
> > anuj.mittal@intel.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

