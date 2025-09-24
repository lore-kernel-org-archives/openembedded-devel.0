Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7938FCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:30:16 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.8723.1758706214970394716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SGDTj/eh;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-31d6b8be249so6078288fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 02:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758706214; x=1759311014; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8k+5ZU8AqmEI9CGyUrF8NB7Z7ol/JebW19rJ/D7hls=;
        b=SGDTj/ehQyxGWwgva/ZaGZ67gFdglbId1fZ9zM6HK9e0eH9jQOS5uJLbmMmyoZHSyx
         xQFxYK2uWMsuMhMFAnfRRkxZsCqvMPc53ilok5VhL3wvShjvQYizyinH98Gv0rqUaA1R
         7o1BIEVMC+e80V0JPV/4GGJ9uppyu+CeHA2Kee2AMHn9ExYm1HvOOmsVZ7P06nSr1iB/
         wih447tyYpAWv1OntIeYLr89/6HdM4bQ2Aer8uxGOg2069oGRLC4G6Nt7DQMSI9kxzcP
         D4lqVSkE81+0+bqS+MNQ5OixpJ1B6my5ugbMpNOhIMmqNoWmL0egCQg9lTgawXZ3j4Y4
         6SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758706214; x=1759311014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8k+5ZU8AqmEI9CGyUrF8NB7Z7ol/JebW19rJ/D7hls=;
        b=VuKW8Hb7EgnaCdOle/4miZVEkP8DfdqmsEp4UQuXJlWjrhdGMqYNrdueRkeS5cHqV1
         uK523dyfNNJsotthe0HYb3aFKFILupqzLOy1i8yPU17w8vgGBRBY3d2RVTeLpBUHNtZb
         F79evFDsPax6Ph5GNmbgBrBHDmNOuBEyFJ/jsLY/s4zUNBRErr49m84va+jioFV/fd9T
         G7PvTCDOH3TP9seMIhES0KzQ+Le/BSwVUx0TLSQlUUqvxxFvVYmyw8wgLlVlK1PoJgkY
         pmTrS2FScz0ySwDQQ3IgI5hkj4KBkZZY7MsBDtqhaRvDRKcOQq8Acqlnbc+ftMPNsAEz
         0QsA==
X-Gm-Message-State: AOJu0YykGwxrj/9kEPMoF1CizM7xXN79YzS+JJGMgfFc8HA2b8vHQa6n
	KMP5dJDKMfVNBG/XHKQ50a0NrYRDah4byWw6kFqF9+QNlwK3gwcI8BJWVmYmEFseDb4R+e8jrNe
	2ZSqBzUsdD4B8dOjciVhAhEHVSEN+qXVLmg==
X-Gm-Gg: ASbGncvT3A4Ie6jXIyaxCEwi/YNxhapEJI0THP02hTvoRv2Ym/ul4hH8dWVJZcRPr+P
	F44iBJAjQVukUCO4hImkJoFGYm7PQcT0iry21cxIDmW1/frnwE61evMSC9x1MzlIYv8e7BxpbUA
	I07iZYKXNzJtweA3VIy81gi4Nc6B8XjHUGcViOqvGlCXaRMm3LCjpJKhW8HU4LUUVXMI8TNtkoP
	PJ4Om5ARA==
X-Google-Smtp-Source: AGHT+IFBD5o1aHtKMFQAAVoYndj2w3+wk9PZobSdX/t2IfvspSxJdg525eIu3y2jdrac11Oa/fMrsjkyFfJqAneknKU=
X-Received: by 2002:a05:6808:6c93:b0:438:3def:446a with SMTP id
 5614622812f47-43f2d48d60dmr3831229b6e.45.1758706214033; Wed, 24 Sep 2025
 02:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com> <d09b1bc7-3c18-47f8-a7eb-3cc6e88b5bb1@windriver.com>
In-Reply-To: <d09b1bc7-3c18-47f8-a7eb-3cc6e88b5bb1@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 24 Sep 2025 21:30:02 +1200
X-Gm-Features: AS18NWC1dHE5OJtfkzmnhg7vdJvrDlYW88jfbb6r136ybS2TyEmsJiGnDaH7IfY
Message-ID: <CADySD0EG7dt841cwvcbd5BLyBh39Yq81kn2XBRb_2qjkyJvaFA@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 0/6] cherry-picks from master branch
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119795

On Wed, Sep 24, 2025 at 8:02=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wrot=
e:
>
> There are a few major version upgrades in this series.
>

Correct but I found no concern from the respective changelog.
But if you (and others) think it can cause any issue then please let me kno=
w
and I'll do some more validation otherwise drop that patch.

> Regards,
> Qi

cheers
Ankur

>
> On 9/24/25 15:56, Ankur Tyagi via lists.openembedded.org wrote:
> > Trying to keep recipes in the walnascar branch updated with useful fixe=
s
> > from the master branch.
> >
> > I intend to submit patch series for each sub-folder, this series is for
> > the recipes inside "meta-oe/recipes-bsp".
> >
> > I have tried to carefully review the change logs and commit logs while =
updating
> > recipe versions.
> >
> > Did basic validation by building against qemux86-64 and qemuarm64
> > machine targets.
> >
> > Changqing Li (1):
> >    lsscsi: upgrade to version 0.32
> >
> > Gyorgy Sarvari (1):
> >    ledmon: upgrade 0.97 -> 1.1.0
> >
> > Mikko Rapeli (2):
> >    fwupd: update to 2.0.12
> >    fwupd-efi: update from 1.6 to 1.7
> >
> > Wang Mingyu (2):
> >    bolt: upgrade 0.9.6 -> 0.9.10
> >    flashrom: upgrade 1.5.1 -> 1.6.0
> >
> >   .../bolt/{bolt_0.9.6.bb =3D> bolt_0.9.10.bb}    |   2 +-
> >   ...-meson-Add-options-pciutils-ftdi-usb.patch |  17 ++-
> >   .../{flashrom_1.5.1.bb =3D> flashrom_1.6.0.bb}  |   2 +-
> >   ..._binary.py-Use-env-to-detect-python3.patch |  23 ---
> >   .../{fwupd-efi_1.6.bb =3D> fwupd-efi_1.7.bb}    |   5 +-
> >   ...certs.py-use-usr-bin-env-for-python3.patch |  28 ++++
> >   ...-reduce-lzma-compression-level-from-.patch |  47 ++++++
> >   meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb     | 134 -----------------=
-
> >   meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb     |  93 ++++++++++++
> >   .../ledmon/0001-fix-build-with-clang.patch    |  90 ------------
> >   ...nclude-sys-select.h-and-sys-types.h.patch} |  27 ++--
> >   .../{ledmon_0.97.bb =3D> ledmon_1.1.0.bb}       |  10 +-
> >   .../lsscsi/{lsscsi_030.bb =3D> lsscsi_0.32.bb}  |   6 +-
> >   13 files changed, 197 insertions(+), 287 deletions(-)
> >   rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb =3D> bolt_0.9.10.bb} (=
92%)
> >   rename meta-oe/recipes-bsp/flashrom/{flashrom_1.5.1.bb =3D> flashrom_=
1.6.0.bb} (89%)
> >   delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-gener=
ate_binary.py-Use-env-to-detect-python3.patch
> >   rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb =3D> fwupd-efi_1.7=
.bb} (90%)
> >   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.p=
y-use-usr-bin-env-for-python3.patch
> >   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-commo=
n.c-reduce-lzma-compression-level-from-.patch
> >   delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
> >   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
> >   delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-w=
ith-clang.patch
> >   rename meta-oe/recipes-bsp/ledmon/ledmon/{0002-include-sys-select.h-a=
nd-sys-types.h.patch =3D> 0001-include-sys-select.h-and-sys-types.h.patch} =
(56%)
> >   rename meta-oe/recipes-bsp/ledmon/{ledmon_0.97.bb =3D> ledmon_1.1.0.b=
b} (79%)
> >   rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb =3D> lsscsi_0.32.bb}=
 (63%)
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#119755): https://lists.openembedded.org/g/openembed=
ded-devel/message/119755
> > Mute This Topic: https://lists.openembedded.org/mt/115408371/7304865
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Qi.Chen@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

