Return-Path: <mhei@heimpold.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893CBC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 17:58:04 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
 by mx.groups.io with SMTP id smtpd.web10.67167.1686592674784253548
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 10:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@heimpold.de header.s=strato-dkim-0002 header.b=cR0ncShN;
 spf=pass (domain: heimpold.de, ip: 81.169.146.160, mailfrom: mhei@heimpold.de)
ARC-Seal: i=1; a=rsa-sha256; t=1686592672; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=RtHn2eECceh2DNBEcLYErAjQnpKUP3UJeeCaZigW+6RXLMUZ7UooF4+6WxFSOADiZV
    IPrwBK2NeYSiT+OGh4bY8CTvRXXY/ZxNPUIl/tp9Bnrd5zBEjHfrrtdr7Tsd3hZ/tyWb
    +xbF/BWVL4ELG9Jwki8PU2j5hcdv50HzuyBPduGj6Ut3nT5fJqtaMYx5QRR2kkCTxTaj
    62NgpToE2YzKGqJIb/wmaqgcd+f1WZf05drLkQCeVHYXXyMFN5OA6WH6a7pJ2mwCi8gH
    S8PWfyjMqqWbJSLYc5HokVuTLV7sqVLKeD6OHYb1IYdPFIankCBLW7f3iGvsu69/EQxe
    PE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686592672;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ydnbb890MbHm1rGKWxbOxxtnkWADbSWDQKG5JtL3XbE=;
    b=tzb0W6iuJIWIhohw/1xCYOiaZJSWcPPT0yNi3JresS/2LDIeQ5xGzi0SBhOB5kSgmv
    DXucv082bWZtAawLpUlo8j7/GGsLuBM8Dyx9ttqfTxiLUtZ5OWuKIxGVB3me8ezqsmh9
    NWJ5dHAAlmLzwtKakL2P+t6hHFZThLZ0L04CFy9rno6zf4v1BX3YZckbK56vuJuj904l
    PjBVzLGeoXaT13MpwG3m4b8dyvANs2BbHMIDN2kL7SdvfkcPimKxFT/dAUjLtUw6Vjvd
    s4L6dU4FmPdvEcvQtBYBYzvWfuJCFHy9LYdTcqLwUer6U77X1WyTKFLQXxVF9ySoaQaS
    UNxQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686592672;
    s=strato-dkim-0002; d=heimpold.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ydnbb890MbHm1rGKWxbOxxtnkWADbSWDQKG5JtL3XbE=;
    b=cR0ncShN++qTib91d6LIzV+5+HHumN/HgIl6kjiXid4xL9xbesrGTats4/tlidLPcX
    c66HIAZp+GlUVHzl8z1eHGpaILZEXNFDdgANRgp9x4GOl7sVFPYhTz86/74XSrkqa9aF
    kTNJS8KFSKFmYcOKLTWrceap4BZKj8X4SnkpnfW7O/8JitWRekeGKDf79mgBFifykNMO
    r+L6zGzKx1AqFx5QUYY77ZGPii9QDU1NPVB7jt4zm82fJTNFytW2AfZjvGezoG7q9z/t
    PCjH0zM8GvvL3Wq0e2zbnaMOqIWtumXmu8vzkhxCkZODQd+O030tAvtaLksRsFwQ0Y1i
    N3kA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686592672;
    s=strato-dkim-0003; d=heimpold.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ydnbb890MbHm1rGKWxbOxxtnkWADbSWDQKG5JtL3XbE=;
    b=d+mSzj29KkOZ/iWvcNCrLIolkgLfaTV6YbogO/lisjtOUQuMpvkhmAh3fEcyZL6Zb1
    xX/fBsPmKG3tGYF2swDA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EW8QnKjhhg/vO4pzqdNytq77N6ZKUSN7PfdWTGbO3oK8Gj1qrnlkHiHKw=="
Received: from tonne.mhei.heimpold.itr
    by smtp.strato.de (RZmta 49.5.3 DYNA|AUTH)
    with ESMTPSA id Debb7az5CHvqibn
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 12 Jun 2023 19:57:52 +0200 (CEST)
Received: from kerker.localnet (kerker.mhei.heimpold.itr [192.168.8.1])
	by tonne.mhei.heimpold.itr (Postfix) with ESMTPS id 8551B1528D7;
	Mon, 12 Jun 2023 20:00:11 +0200 (CEST)
From: Michael Heimpold <mhei@heimpold.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: drop explicite ARM_INSTRUCTION_SET
Date: Mon, 12 Jun 2023 19:57:51 +0200
Message-ID: <3896518.ElGaqSPkdT@kerker>
In-Reply-To: <CAMKF1sqeRP-+YES+WoB784U1389_=f2MmuHzS13-d2rP2GK-Bw@mail.gmail.com>
References: <20230611160530.392975-1-mhei@heimpold.de> <8273188.T7Z3S40VBb@kerker> <CAMKF1sqeRP-+YES+WoB784U1389_=f2MmuHzS13-d2rP2GK-Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 17:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103215

Am Montag, 12. Juni 2023, 01:44:29 CEST schrieb Khem Raj:
> On Sun, Jun 11, 2023 at 1:53 PM Michael Heimpold <mhei@heimpold.de> wrote:
> > Am Sonntag, 11. Juni 2023, 18:32:31 CEST schrieb Khem Raj:
> > > On Sun, Jun 11, 2023 at 9:05=E2=80=AFAM Michael Heimpold <mhei@heimpo=
ld.de>
> >=20
> > wrote:
> > > > If my git skills don't trick me, forcing ARM mode for PHP
> > > > dates back to year 2015 with commit e836f8f93.
> > > >=20
> > > > I wondered whether the compile problem still persists and just
> > > > tested that it compiles fine for qemuarm nowaydays.
> > > >=20
> > > > I also tested the binaries on a physical device, a
> > > > NXP iMX6ULL based one, and did not notice any problems
> > > > so far.
> > > >=20
> > > > Signed-off-by: Michael Heimpold <mhei@heimpold.de>
> > > > ---
> > > >=20
> > > >  meta-oe/recipes-devtools/php/php_8.2.6.bb | 9 ---------
> > > >  1 file changed, 9 deletions(-)
> > > >=20
> > > > diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > > b/meta-oe/recipes-devtools/php/php_8.2.6.bb index dad955452..404ff3=
93b
> > > > 100644
> > > > --- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > > +++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > > @@ -284,12 +284,3 @@ do_install:append:class-native() {
> > > >=20
> > > >      create_wrapper ${D}${bindir}/php \
> > > >     =20
> > > >          PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
> > > > =20
> > > >  }
> > > >=20
> > > > -
> > > > -# Fails to build with thumb-1 (qemuarm)
> > > > -# | {standard input}: Assembler messages:
> > > > -# | {standard input}:3719: Error: selected processor does not supp=
ort
> > > > Thumb mode `smull r0,r2,r9,r3' -# | {standard input}:3720: Error:
> > > > unshifted register required -- `sub r2,r2,r0,asr#31' -# | {standard
> > > > input}:3796: Error: selected processor does not support Thumb mode
> >=20
> > `smull
> >=20
> > > > r0,r2,r3,r3' -# | {standard input}:3797: Error: unshifted register
> > > > required -- `sub r2,r2,r0,asr#31' -# | make: ***
> > > > [ext/standard/math.lo]
> > > > Error 1
> > > > -ARM_INSTRUCTION_SET =3D "arm"
> > >=20
> > > Martin explained it well, it was seen with thumb1 ISA some armv6 and
> > > all armv7+ uses thumb2 ISA along with standard ARM ISA
> > > Testing this will need armv4/armv5 perhaps you can limit this to
> > > armv5/arm4 arches
> > >=20
> > > ARM_INSTRUCTION_SET:armv5 =3D "arm"
> > > ARM_INSTRUCTION_SET:armv4 =3D "arm"
> > >=20
> > > If you can test it on armv5 and ensure that it works there too now a
> > > days then we can remove it completely
> >=20
> > Thank you all for your feedback.
> >=20
> > Here is what I've done so far.
> >=20
> > I've done a compile test against machine qemuarmv5 which succeeded
> > without errors.
> >=20
> > I have a custom board at hand, which uses a NXP iMX28 CPU, the build
> > configuration tells me the same TUNE_FEATURES as qemuarmv5:
> > MACHINE              =3D "evachargese"
> > TUNE_FEATURES        =3D "arm armv5 thumb dsp"
> > I used the kirkstone branch to have a faster roundtrip since the board
> > currently runs a kirkstone-based system. The PHP binaries run without
> > obvious problems in a quick test (simple webpages on the device).
>=20
> That=E2=80=99s for testing it out. Can you check compiler longs for php a=
nd see if
> it passed -mthumb to it ?

Just to ensure, that I got you right: you mean something like
grep thumb tmp/work/armv5e-poky-linux-gnueabi/php/8.1.16-r0/temp/log.*
which shows an empty result for qemuarmv5/evachargese and for qemuarm
there are a lot of matches like:
=2E../log.do_compile.2431535:/bin/bash /.../cortexa15t2hf-neon-poky-linux-
gnueabi/php/8.1.16-r0/build/libtool --silent --preserve-dup-deps --tag CC --
mode=3Dcompile arm-poky-linux-gnueabi-gcc -mthumb -mfpu=3Dneon -mfloat-abi=
=3Dhard -
mcpu=3Dcortex-a15 ...

> > I have no armv4 board at hand nor a found a configuration file for
> > qemuarmv4.
> > So I put some lines manually together using strongarm - which should be
> > armv4,
> > right? It resulted in
> > TUNE_FEATURES        =3D "arm strongarm"
> > The build completed without error - no runtime testing with qemu done y=
et.





