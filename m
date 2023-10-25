Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA96C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 17:18:40 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.179422.1698254318131782854
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Oct 2023 10:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NumhFTnd;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1dd71c0a41fso4097349fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 10:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698254317; x=1698859117; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/KWom83JvcxoUDiBP8jwYQ0axLGBpywu53O35JIOf8=;
        b=NumhFTndebgIZ4kV0v4EprqeWMvlUaIRMuBcl6JFpwnksKm734RzsbDy5H6ZCxoOnI
         ViaKE5zqsuLZClM/4Kry4hX3Orl3a8216WfuonHwli+OgBp6PnKEzkUoM6UJl2V1zqQc
         0cnLh5iMZIkfxuahMzH/Nc0Zrof9puiCNBXhB12VsG5nImRJthWzIP9MH/XTmkTDLES+
         eCO6PVClIj/fyPdznzPPsHr0LCojgu7U7N22w8JlLCGoBuyg8vBYIxfBzHnKMTDcb09M
         ZggYOBVD6C09AMJz4xvMu1hyQq0c8hQLTRdP3qqmSirxj59NlFAzTDa8OIfKjY+JIL0c
         N1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698254317; x=1698859117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/KWom83JvcxoUDiBP8jwYQ0axLGBpywu53O35JIOf8=;
        b=IIdeThan+HrM+o2R7iEklU1vpuOyzVfwNh8dmeX5mB9oa7vhx20NkUU21x7RzUyadE
         +dSkt9XksrANLn5x9MSVxlFZxGl8ipcwvBlSSuioVhc+FP+PuyFOPQggfx5PCqMbv3aQ
         8JuVYHIgQgZrLthjUVazvhM9UI6KqXdcvKRbep6IJkjvCdpYEx3gYwehqzgrsCFgZkty
         9El2u6Gs+6U0YRQfn7JWLTivAu7bxRXYsZfJxHt7rLlXJ2ngZpRxAinfL1VLbfzHo/jb
         S/qXpv6hGX8zGZfNk9ypgJeoqrgywSwx9XRQ9gWx/RK6d/8Ep4e6kFjPNnsZAmK0gYjq
         Tx1A==
X-Gm-Message-State: AOJu0YzxKGJQ1y9R43nBN9BMsZOM7yuCxnLDa0uLPwgFSCRoTb4q8aXd
	kMyNbcwxhTpEPBtVapXyTz+9pC4z2/4buDIOH1w=
X-Google-Smtp-Source: AGHT+IHXkLd6FjWKP/q7Ekb2Smro7/2kDz6FmgMEyN57D1v9JmxXuONYQsViDbuBxUDEcUON/uLCOHAXuT+QKinCVVU=
X-Received: by 2002:a05:6870:9f8a:b0:1e9:8d44:a5cf with SMTP id
 xm10-20020a0568709f8a00b001e98d44a5cfmr20732135oab.17.1698254317169; Wed, 25
 Oct 2023 10:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com> <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
In-Reply-To: <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Oct 2023 10:18:10 -0700
Message-ID: <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, joerg.sommer@navimatix.de, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 17:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105730

I wonder if something like below would help

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 2cff48c39c3..6133721334c 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -12,7 +12,7 @@ S =3D "${WORKDIR}"

 do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
openssl-native:do_populate_sysroot"
 do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
-
+do_populate_sysroot[depends] +=3D "openssl-native:do_populate_sysroot"

 DEPENDS +=3D "bc-native bison-native"
 DEPENDS +=3D "gmp-native"

On Wed, Oct 25, 2023 at 7:45=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Wed, Oct 25, 2023 at 7:40=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com> wrote:
> >
> > Hi Joerg,
> >
> > This topic has already been discussed previously in
> > https://lists.openembedded.org/g/openembedded-core/topic/98296212
> >
> > Bruce even sent a patch but it was never integrated, probably because i=
t was a very invasive change.
> > https://lists.openembedded.org/g/openembedded-core/message/182024
>
> Heh. No, that wasn't the reason. The change wasn't invasive, it is
> isolated to just the single recipe.
>
> I just didn't have the cycles to chase down host specific issues and
> uninative updates.
>
> Clobbering rm_work isn't the right solution IMHO, but it can do the job.
>
> Bruce
>
> >
> > Anyway you can solve this problem with:
> > RM_WORK_EXCLUDE +=3D "make-mod-scripts"
> >
> > Jose
> >
> > J=C3=B6rg Sommer via lists.openembedded.org <joerg.sommer=3Dnavimatix.d=
e@lists.openembedded.org> escreveu no dia quarta, 25/10/2023 =C3=A0(s) 09:5=
7:
> >>
> >> Hi,
> >>
> >> I'm having an odd problem building the external kernel module
> >> kernel-module-imx-gpu-viv [1]. I'm using kirkstone and have rm_work
> >> enabled.
> >>
> >> [1]  https://layers.openembedded.org/layerindex/recipe/40267/
> >>
> >> The module builds fine, but the install step contains the module signi=
ng
> >> which **silently** fails with *libcrypto.so.3* not found:
> >>
> >> ```
> >> | make -C /build/tmp/work-shared/ziborium/kernel-source
> >> M=3D/build/tmp/work/machine-pyxis-linux/kernel-module-imx-gpu-viv/6.4.=
3.p4.2-r0/git/src
> >> modules_install
> >> | make[1]: Entering directory '/build/tmp/work-shared/machine/kernel-s=
ource'
> >> | make -C /build/tmp/work-shared/machine/kernel-build-artifacts -f
> >> /build/tmp/work-shared/machine/kernel-source/Makefile modules_install
> >> | make[2]: Entering directory
> >> '/build/tmp/work-shared/machine/kernel-build-artifacts'
> >> | test -e include/generated/autoconf.h -a -e include/config/auto.conf =
||
> >> (               \
> >> | echo >&2;                                                     \
> >> | echo >&2 "  ERROR: Kernel configuration is invalid.";         \
> >> | echo >&2 "         include/generated/autoconf.h or
> >> include/config/auto.conf are missing.";\
> >> | echo >&2 "         Run 'make oldconfig && make prepare' on kernel sr=
c
> >> to fix it.";    \
> >> | echo >&2 ;                                                    \
> >> | /bin/false)
> >> | make -f
> >> /build/tmp/work-shared/machine/kernel-source/scripts/Makefile.modinst
> >> |   mkdir -p
> >> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.=
2-r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/;
> >> cp
> >> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.=
2-r0/git/src/galcore.ko
> >> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.=
2-r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
> >> |   :
> >> |   scripts/sign-file "sha1" "certs/signing_key.pem"
> >> certs/signing_key.x509
> >> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.=
2-r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
> >> || true
> >> | scripts/sign-file: error while loading shared libraries:
> >> libcrypto.so.3: cannot open shared object file: No such file or direct=
ory
> >> |   sh /build/tmp/work-shared/machine/kernel-source/scripts/depmod.sh
> >> echo 5.15.60-imx8mm+g343e81c0e39e
> >> | Warning: modules_install: missing 'System.map' file. Skipping depmod=
.
> >> | make[2]: Leaving directory
> >> '/build/tmp/work-shared/machine/kernel-build-artifacts'
> >> | make[1]: Leaving directory '/build/tmp/work-shared/machine/kernel-so=
urce'
> >> ```
> >>
> >> I noticed that there are special dependency definitions in make-mod-sc=
ripts
> >>
> >> ```
> >> do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
> >> openssl-native:do_populate_sysroot"
> >> do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
> >> ```
> >>
> >> and module-base.bbclass (inherited by module.bbclass)
> >>
> >> ```
> >> # We do the dependency this way because the output is not preserved
> >> # in sstate, so we must force do_compile to run (once).
> >> do_configure[depends] +=3D "make-mod-scripts:do_compile"
> >> ```
> >>
> >> Is there an additional dependency needed to address rm_work?
> >>
> >> Kind regards
> >>
> >> J=C3=B6rg Sommer
> >> --
> >> Navimatix GmbH
> >> Tatzendpromenade 2
> >> D-07745 Jena
> >> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> >> Registergericht: Amtsgericht Jena, HRB 501480
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105729): https://lists.openembedded.org/g/openembedde=
d-devel/message/105729
> Mute This Topic: https://lists.openembedded.org/mt/102174355/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

