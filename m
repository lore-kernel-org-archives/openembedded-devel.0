Return-Path: <mhei@heimpold.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D84C7EE23
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 20:53:28 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
 by mx.groups.io with SMTP id smtpd.web10.44605.1686516807960554348
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jun 2023 13:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@heimpold.de header.s=strato-dkim-0002 header.b=Qdd5Vc1k;
 spf=pass (domain: heimpold.de, ip: 81.169.146.217, mailfrom: mhei@heimpold.de)
ARC-Seal: i=1; a=rsa-sha256; t=1686516805; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aqOX/Sp0vtnyVuSEdEyBnIhKOsYjHUDuHyD48nZ2moOkdlb1+Sdr+TUg49dPOQo165
    EUs3v1STPUQJaoTaoO2Ad+IYfaMXaxnz8gaW2+6PcQ/TMokjdvXlDDIpLe66KmhvhOcR
    RGa9djesHBdDtX7MfdvsSTxnnJaEQYjJdwIGIcPw1unrIGYivjCmvO6GApJqr/HTkbz7
    36SyruCAkgaMwgZ2de4MZe9tloVtTouMbctNxzTyibOf3Eo7nBPG+Viqj3k124s5u+z5
    4+ru7BuDSfyXHDQK7jJpteRrVeHQiWMDCWTg1lJdPTQRujFx968YukghZNaDNzDUVJbk
    LuxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686516805;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=I5RBPrhKV9x8b8YolcH2yQE9kSEjaMOxHpflYXv5+mc=;
    b=T6IB0VJ0j/zFI/l8oOapfEyztBh87kOL6+OOwynZ+4MxT8rdN+e2tbEWbkk1fRtUKZ
    vGLAT8mM7ZupPRrBR6i5b1D179QvzG/bEQfiwP3cLfBEOihcq0o5ZFyR5mQJyOztegas
    p0eEMiwpJG7QozSlM6Re3sHQahNEGnutTSt4pLqi0I7Uuz1IkvxcQoKM1dLI539x7Yxm
    shfBGRMkFr44i7HBjx9HnTY0/JLyBUnVQeHY2nosus78FWuOHewEmlE+XY3xMeMaFgRX
    VyKqbu4t3ehA0G5oesrfZ78MYqMpln2kFqkAruB+q3GCRHQoZxIjfFCzAa2BHeNBZ3+4
    5AJg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686516805;
    s=strato-dkim-0002; d=heimpold.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=I5RBPrhKV9x8b8YolcH2yQE9kSEjaMOxHpflYXv5+mc=;
    b=Qdd5Vc1kp2wVbVxoSFTWR91I6gNtwCz33RHx65tTjh6S0d8q5deoPkgc+DXzAKz+bx
    vHbmjB8ywVt+xq78UpYdwqWh2QgHylCjeI2PK9qT5fDGvr7viMh8YrLAc8xpJNLtHnzx
    U980RF1MbIdJSPbYocSK8nzjy9xTWvtdXZUbmcD5d388jdRCVCmxgxMoi4WampqiiLtN
    XDCliu+14EDkD3dVQLnFfmvgMHzhtccb4tU3nILgSa5dizOXzIPM/3xf2XKKnGXjObra
    rmeGS/plQtJfb45fQCVT7RECVC0d4zFbax50bVdqmh2QLEgYaQuhmQkiSYbibLvFsWoa
    moNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686516804;
    s=strato-dkim-0003; d=heimpold.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=I5RBPrhKV9x8b8YolcH2yQE9kSEjaMOxHpflYXv5+mc=;
    b=IS+bmKgnK3uGjF9FAMI/yef9XbyXUkJYAwRIJwJ19bU/LM3OFIvp+AXGX8Nabs4TjU
    hs7fEuuD8VJZLuqkAwBw==
X-RZG-AUTH: ":O2kGeEG7b/pS1EW8QnKjhhg/vO4pzqdNytq77N6ZKUSN7PfdWTGbO3oK8Gj1q7Xl5SageA=="
Received: from tonne.mhei.heimpold.itr
    by smtp.strato.de (RZmta 49.5.3 DYNA|AUTH)
    with ESMTPSA id Debb7az5BKrOdpf
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 11 Jun 2023 22:53:24 +0200 (CEST)
Received: from kerker.localnet (kerker.mhei.heimpold.itr [192.168.8.1])
	by tonne.mhei.heimpold.itr (Postfix) with ESMTPS id 86B961527CA;
	Sun, 11 Jun 2023 22:55:42 +0200 (CEST)
From: Michael Heimpold <mhei@heimpold.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: drop explicite ARM_INSTRUCTION_SET
Date: Sun, 11 Jun 2023 22:53:23 +0200
Message-ID: <8273188.T7Z3S40VBb@kerker>
In-Reply-To: <CAMKF1srQwuXQV8QLTCfYmDKfm-iTDXNjLTJKFxN+umTrq3tOPw@mail.gmail.com>
References: <20230611160530.392975-1-mhei@heimpold.de> <CAMKF1srQwuXQV8QLTCfYmDKfm-iTDXNjLTJKFxN+umTrq3tOPw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 20:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103208

Am Sonntag, 11. Juni 2023, 18:32:31 CEST schrieb Khem Raj:
> On Sun, Jun 11, 2023 at 9:05=E2=80=AFAM Michael Heimpold <mhei@heimpold.d=
e> wrote:
> > If my git skills don't trick me, forcing ARM mode for PHP
> > dates back to year 2015 with commit e836f8f93.
> >=20
> > I wondered whether the compile problem still persists and just
> > tested that it compiles fine for qemuarm nowaydays.
> >=20
> > I also tested the binaries on a physical device, a
> > NXP iMX6ULL based one, and did not notice any problems
> > so far.
> >=20
> > Signed-off-by: Michael Heimpold <mhei@heimpold.de>
> > ---
> >=20
> >  meta-oe/recipes-devtools/php/php_8.2.6.bb | 9 ---------
> >  1 file changed, 9 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > b/meta-oe/recipes-devtools/php/php_8.2.6.bb index dad955452..404ff393b
> > 100644
> > --- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > +++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > @@ -284,12 +284,3 @@ do_install:append:class-native() {
> >=20
> >      create_wrapper ${D}${bindir}/php \
> >     =20
> >          PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
> > =20
> >  }
> >=20
> > -
> > -# Fails to build with thumb-1 (qemuarm)
> > -# | {standard input}: Assembler messages:
> > -# | {standard input}:3719: Error: selected processor does not support
> > Thumb mode `smull r0,r2,r9,r3' -# | {standard input}:3720: Error:
> > unshifted register required -- `sub r2,r2,r0,asr#31' -# | {standard
> > input}:3796: Error: selected processor does not support Thumb mode `smu=
ll
> > r0,r2,r3,r3' -# | {standard input}:3797: Error: unshifted register
> > required -- `sub r2,r2,r0,asr#31' -# | make: *** [ext/standard/math.lo]
> > Error 1
> > -ARM_INSTRUCTION_SET =3D "arm"
>=20
> Martin explained it well, it was seen with thumb1 ISA some armv6 and
> all armv7+ uses thumb2 ISA along with standard ARM ISA
> Testing this will need armv4/armv5 perhaps you can limit this to
> armv5/arm4 arches
>=20
> ARM_INSTRUCTION_SET:armv5 =3D "arm"
> ARM_INSTRUCTION_SET:armv4 =3D "arm"
>=20
> If you can test it on armv5 and ensure that it works there too now a
> days then we can remove it completely

Thank you all for your feedback.

Here is what I've done so far.

I've done a compile test against machine qemuarmv5 which succeeded
without errors.

I have a custom board at hand, which uses a NXP iMX28 CPU, the build
configuration tells me the same TUNE_FEATURES as qemuarmv5:
MACHINE              =3D "evachargese"
TUNE_FEATURES        =3D "arm armv5 thumb dsp"
I used the kirkstone branch to have a faster roundtrip since the board
currently runs a kirkstone-based system. The PHP binaries run without
obvious problems in a quick test (simple webpages on the device).

I have no armv4 board at hand nor a found a configuration file for qemuarmv=
4.
So I put some lines manually together using strongarm - which should be arm=
v4,=20
right? It resulted in
TUNE_FEATURES        =3D "arm strongarm"
The build completed without error - no runtime testing with qemu done yet.




