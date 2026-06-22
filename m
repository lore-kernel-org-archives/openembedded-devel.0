Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03499CDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 05:23:58 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36574.1782105834452515115
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Jun 2026 22:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RfCj1UXm;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so3758612e87.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Jun 2026 22:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782105832; cv=none;
        d=google.com; s=arc-20240605;
        b=jrHlQwAQiMfYf3E2BByMOPR6TU+vIewLaPYlolnwr5/Eh6swIFqez++XvQH4KTsT7Z
         68yVbZBK614bs1tcXPWLp6oIH+9UJzw4XGfbJ/p1KsEfNM97zIkHpWMFS3v9iNVizFlN
         WdbP06NjLxAbCQ6CJb76ELXquVgnhdWYqnXgU77CpbCltdglQ+WzfriaLt8eDoVB8hLo
         XjR3pv8jrjQwAigP0zikMzjrgl5qZoVxrwk7toLvyhRrPRGeAMN0AZSpF5tsG4Ttx2IS
         xzYmgq6+L1bARSeVZdqZDekDSQnsSqLFvWP67fKSGMFsfH5vZuTqSX2knOzEtXOY0jJG
         ps0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8lf3TcwpkkCCMdOI8LYTFjiFyE0BEhkOgaxtsRtmAq8=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=ERKBOsKdw2NUeQHNsYVpJuR+h/k0kf1hTu0i/nX3Z/rijZZamxWdwRE+0y5vTHKp6a
         NO2+14V2comUW/cofBx9k21LgRUhSQBtZ2J05xCyTWtpavrYo93B6jEV3Ud4xdehQsIK
         Klu0oatwsXHk45jLjZWCZOt19/+zg+Jkjm+b8+M8HXnl+4TpSKuhzQuHbSqvFzlReUUw
         qakX+EFKwNdvmUD8PNjuefNKQelt68pwsEjrQZdihEH5FrFC14c6rGga9w3lDeZ1eNUL
         TKV1bguiLF/Pf2o+CK51DI7a0AuM88+JG5z/AKu6Gn5lI+Utq33HbAn369I9mScPXTg0
         7D6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782105832; x=1782710632; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lf3TcwpkkCCMdOI8LYTFjiFyE0BEhkOgaxtsRtmAq8=;
        b=RfCj1UXmWpZM5tFdniaxC1jPpPQaYsvDjR11JdszfzDYddh/oU1sxwb5Mw3g0X2xoK
         OYEecikEFBKJ1ntaJgYF8KEGUITTo0zKZEUdRpnzEm/PRZ6bSLGmJcj185LP1HULu73e
         ZHA3S/vpAsAeeWn8EmnXEy/o6lkVeWjscWJyf7fhgPsccZx8KNAhEq0Wlw4VztDy1g8i
         LvtdDcEG3Rp5KRiRbMr7OrIdCAlJU9fdRMeHPtHVYZ+hf15BLwG3kKv5Fv0PDS202GGf
         WJEd4mYLRhKVuHNy4x7cfzIShLLF9y5B3IeMw5Z7ea0B58DfD08/UyHq/j92M2vUTzj4
         CAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105832; x=1782710632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8lf3TcwpkkCCMdOI8LYTFjiFyE0BEhkOgaxtsRtmAq8=;
        b=bmQHdVFQvQs3AuoQqfQchihvi2cVZ9Iw0wdcAjnKK/zfyTeblDrwCNljxxAxBb4NZC
         gbh6ojNFBh577qbGWkOht1QSb7mpdJHRtje+Mtw+5YL+pogCtZUaUDkxEmP2ZxYZ2DzO
         XsfdBw37eyrHMdJJi0mZSLLzXjxT5NsbsPXAOX3LTtbpnqWLd5hqAueNfJb0EvsjYIIY
         ytURlpQIM4GrPgS1fIdyIhpp4HH3sqUlsYZhEQ/7QxwdrGg2l1O+JlxS6XmBaEwCKlZ/
         zTafCJNn2nTfUWF98+9EhhBIP2IzaamGT0mjRsYFb1Ja5JecuQKSDtnzCmjLAwB/Ebi8
         qfBg==
X-Gm-Message-State: AOJu0YzB78Bvqv24urngapyR9V/5N8IozEnworIiwoEThmUgrxwA2aDs
	FlGprTTVItdSCQcZM/iIRE1Zshq0h5lVOIavFbm/WeAEVrNUFfTaFKR3G+vCzQAiNouc53IuyK8
	0TCAqsRinqxZeAKuTvagzBLJTnPRV+5M=
X-Gm-Gg: AfdE7clHw040Cuh8k4il8BA+3KPsQmUdunJ7lNLnt8bLItN0+as0oAA8OClJO9Wf5b8
	ScirvvgVi4sIQvLdlhaDYdW3mN7W06xsmZiLgASw0LPtrxAlTLgR6UvENVtm4aKIAsrsntTuGAd
	Ja+u4wTnh0Fkt2kpcKJP3XGtwZVPaOm4jDWyQU84VC+pdJmsFF/LdFj/IgspPtKFvV4CGlE4w2+
	bNHPtxezn+VyWYw3RI5dYuRjdWnIYP3lSEA+erVoIRgmtqhqx3fwypxbdOLC3mkgoi0wROep4UP
	Ed1seSw+7MBu2/h0XCc+qKTgy2T188h0kxuRLXVljRXcGgBp7hq7Tuk=
X-Received: by 2002:ac2:482f:0:b0:5aa:6db6:530 with SMTP id
 2adb3069b0e04-5ad5771566amr2414114e87.39.1782105832002; Sun, 21 Jun 2026
 22:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260611124540.1132897-1-f_l_k@t-online.de>
In-Reply-To: <20260611124540.1132897-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Jun 2026 07:23:34 +0200
X-Gm-Features: AVVi8CcT7DrSuj5oMXeC9cnbktNYppqQ4fcAbV9FbJ64jSjQZI5cEatR7lke6lU
Message-ID: <CA+chaQcALoDLpkXf8rhjmD2S=oT7ftCn5ObrxDPd=vs2FWU8YA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] hwlock: update LIC_FILES_CHECKSUM
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 05:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127686

Hi, was the LIC_FILES_CHKSUM change intentional?

It should be part of the upgrade to 2.14.0, right? But now in master
there is the LIC_FILES_CHKSUM change but still with 2.12.2 version
leading to:

ERROR: hwloc-2.12.2-r0 do_populate_lic: QA Issue: hwloc: The
LIC_FILES_CHKSUM does not match for
file://COPYING;md5=3D883e49a2e0f7142a345f9b0c01a380e7
hwloc: The new md5 checksum is 79179bb373cd55cbd834463a514fb714

On Thu, Jun 11, 2026 at 2:45=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - SPDX license header has been added
> - hwloc/base64.c is distributed under the ISC license
> ---
>  meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb b/meta-oe/rec=
ipes-extended/hwloc/hwloc_2.14.0.bb
> index 9716e32faa..aeff14fd20 100644
> --- a/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb
> +++ b/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb
> @@ -4,8 +4,8 @@ DESCRIPTION =3D "The Portable Hardware Locality (hwloc) s=
oftware package \
>   architectures."
>  HOMEPAGE =3D "https://www.open-mpi.org/software/hwloc/"
>  SECTION =3D "base"
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D79179bb373cd55cbd834463a514fb=
714"
> +LICENSE =3D "BSD-3-Clause & ISC"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D883e49a2e0f7142a345f9b0c01a38=
0e7"
>
>  SRC_URI =3D "https://www.open-mpi.org/software/${BPN}/v2.14/downloads/${=
BP}.tar.bz2"
>  SRC_URI[sha256sum] =3D "966b9bb3e9f29f8d65ce8d106779e457f40e246a645e584b=
100772a42f9ae94b"
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127531): https://lists.openembedded.org/g/openembedde=
d-devel/message/127531
> Mute This Topic: https://lists.openembedded.org/mt/119755682/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

