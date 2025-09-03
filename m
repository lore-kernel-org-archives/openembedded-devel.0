Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B83CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 19:01:54 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.21105.1756926108303931517
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 12:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ckka4WIK;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7227bc08c97so9467807b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 12:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756926107; x=1757530907; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c8bRQD4HcZFNgml79R6hHV3UKbMNmrasdyvHHTPugY=;
        b=Ckka4WIK8OLMb5/MVgooUgXqZuazHWFWutvzpMEKTuSINFOqxaN4CkXSKs0GwATv3Z
         Tpb4Ul91UeIFihCh4aCOFkili4Mdv79GyGuO1pLQKLMswCnXdjD3QpxKeVzwVepBrQqZ
         0SoEFKJBrDD/FSzn3Q7R9vM5g1/yWB/BwIM+4pG8lun5a2t34WIk3iYFFTyQJv/zOW61
         qSIC1MzunA4PRhbwXHatz7YV4xPSldDIzjz2/rnYeGLtYX+0khU+lnW+xzTJec3s/vWq
         qmcgSDhW/O5QUqVpRJ6oxFj8nwCWF47Mw7XIIJiw6ASpPApNIsO/Xcy41YdO7qrNbbJ7
         IUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756926107; x=1757530907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c8bRQD4HcZFNgml79R6hHV3UKbMNmrasdyvHHTPugY=;
        b=EjP8oQrPetYBu0NjJQd3xwRLBwrtZjmRvPu/JiBGc4rUl56/2wKH/NJFYurSdVweCy
         9lN6bDUE8AHAjqhyuqmTqg7nF2eG1lPuanofkRllXCwnxOCU/r0mF+m5e34Y66FQgKsk
         65wFOE6aeB08qDujQQNhOr+Ig1hBUrHo/9CpuX11tGDHJ9kAIZLM6WsvsMPTCnb21xpd
         EZPJYAEyHRBRLRCFu0E8CSbJ6Febx11Wc9SDBQou5LiggKbNClMb/U5eJXHas2Oap7Rm
         cN4L2lyJemJQ1cVzVJ+C9ySo0FRCM6JR6I9W2DzxRgQ1T8HONYWO934IfMz4LJ8oll2T
         O3Dw==
X-Gm-Message-State: AOJu0Yzf3Cgp+lzIs3qJP+kujT+iiYVDHxw6tfefqX18QHxQKtrqhwSG
	HhbPsBl3CCzq2Vij4wfNL43h8yRVV2S6AUGeZXWt+4qzMmGMsUHtboNdl6a/+a9+5s+Ra7nR4H5
	i/Iej8JZ74bLaP+TFOidZbsN1rixWNUI=
X-Gm-Gg: ASbGncsJfEtjxTPhU7XmSmfErnQPfM13fPmBgPF1W9b58ncn8ERe/YDS8rxsARnX/Gp
	NBBgtN+Aw8h5yKh8gDB72Co3ZVJLzS6YaVDDP6KakbpNwnCTzZaHDveHzOyI7BqmV6YXxVJMfwh
	UHdrBsTplIhG6fsz2CSSTne1ZFZF7elPUzzxH5zs+yWTjajMErWCNZEVyv7dDvzqX/+1xl0aiWu
	+LJQbT7iFaFSLoKcggTGTxvm1HY4vNn/ZrkU52AMOQ/6TJ/L6XvnAGdFYTNKYKNmkgQ76CNBmJN
	TvP6lstBKYfvhjGjPWLzWN5abSLmmf+ZbjTFAMSf1Gj6jnjOHQIg5c71B1cj9BJP
X-Google-Smtp-Source: AGHT+IG+nEnDqe0pxgWMLEbR9diBBAzm6W5rbWk3dTz1IFOJpl0w+FB5jqXvg/3v3jYBqAOw5BMLY+Qdpv7BVkP3qRs=
X-Received: by 2002:a05:690c:8d07:b0:724:da2:6506 with SMTP id
 00721157ae682-7240da26d38mr21881467b3.12.1756926106522; Wed, 03 Sep 2025
 12:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sq-jwOYHSYbfAyDgZFAbwFTAYps1OQCbT5a0rpNsn2fRg@mail.gmail.com>
 <9129.1756924023101392693@lists.openembedded.org>
In-Reply-To: <9129.1756924023101392693@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Sep 2025 12:01:19 -0700
X-Gm-Features: Ac12FXwMgpfPvb0X7PtQOOanzvr8HjAeggXtExbkEHLMTxUGl98YslenLcXbQSQ
Message-ID: <CAMKF1sqNgfGonFUGLDmAd5r32bYPD1MeWJm_DfFfW1kxCYJqUw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pocketpy: Upgrade to 2.1.1
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 19:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119266

On Wed, Sep 3, 2025 at 11:27=E2=80=AFAM Michael Fitzmayer via
lists.openembedded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
>
> On Wed, Sep 3, 2025 at 08:12 PM, Khem Raj wrote:
>
> On Wed, Sep 3, 2025 at 11:10=E2=80=AFAM Michael Fitzmayer via
> lists.openembedded.org
> <mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
>
> LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf64135026=
d91"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc292beb20a17db07c359b0cc2c039=
027"
>
> Please describe what changed here, in License-Update: tag in commit msg.
>
> The year in the copyright notice has been updated.

OK, please reflect that in V2

>
> inherit cmake
>
> +EXTRA_OECMAKE =3D "\
> + -DPK_ENABLE_OS=3DON \
>
> why is this change needed?
>
> This is an optional feature that allows PocketPy to perform file operatio=
ns.
>

mention it in commit msg.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119265): https://lists.openembedded.org/g/openembedde=
d-devel/message/119265
> Mute This Topic: https://lists.openembedded.org/mt/115050209/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

