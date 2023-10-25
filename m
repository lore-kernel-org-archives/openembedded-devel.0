Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCC1C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 14:45:38 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.45548.1698245134225912811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Oct 2023 07:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WwMEC+0O;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9a3d737d66so4506496276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698245133; x=1698849933; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQezZmH2lIeBdoazdVhXH+nCw7mmoewrO8NIf1bGk6U=;
        b=WwMEC+0OMKYqHckdUaj7Z21gip8p9Uk3bF25boru33JAcq/VjToQQLUex5VBGeTxYC
         OipId0tggKkYbbnhT+EPu543DvSJ4yIbRbzc+wjLTBxtpsvRPplFiGiQWfLwUSgmKwoy
         EfUjNjzPjEkyjdmDxlG5qvDhm1Pc74KnU6cZzq9PS1aPfMakZp96bAZ+H5GeMUJNlZA2
         ksFdAxq1TPhX4PWGaqav7vgFYE1eM4BQVQqNXfnAmKEOu/gN3+Uq83ODmR1mWc1u6ppC
         xE4KPwTbqwjBr2HGapilvnGeTAR9gR9V7XXI6dH4QigamXNue2UrUUwND3yVYysF/lyI
         jhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245133; x=1698849933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQezZmH2lIeBdoazdVhXH+nCw7mmoewrO8NIf1bGk6U=;
        b=KFplw1ZERCmPC885HynM4WABKh840sTg1u142OIIZxlCFOnl80vtar+e/MgrHUNcpU
         /2WUPnvDMRn6NqJ99bN9iyGUeCnoEBIS3dq7viIMw1AcDaR4qdnkoEj+grQYkM1BNm5P
         0gV1xKUIHfUugT/n54MDUB3ICMtG1Feowg8t/0AikVllaXVQjm/0AX6lokLJJSOhz0V2
         in9hoc2CD3EEvvfCa8O/WaAhVLf3LHwKVNSDSbIkrrkI9OHScxd0alYv16H/2I3eqfUM
         uWIHBT/dqA6DxOgnN7VN+88uVLbYCWpvTj/ymW20gfoc+zPLsIyIuvNJfQA6GK8rxPcc
         PYVg==
X-Gm-Message-State: AOJu0YxtwTwNRhmC4+65cuZY2h6lvvTj2kkhWCcPZLqJ7sFOYheanEJ2
	Yfwx3fGy4TF6HeBnmEsiRQe3rKPb3gOUvIif2SE=
X-Google-Smtp-Source: AGHT+IG6LyaP5enzteAt1M/WS4IzUNy+XoMJ/FJz1F3NmJtDf3G46d9RqV0ekyA1MHaDj+iDYK+I9MvJYat9DbLhyS4=
X-Received: by 2002:a25:b11:0:b0:d9a:e815:38f6 with SMTP id
 17-20020a250b11000000b00d9ae81538f6mr12901198ybl.15.1698245133142; Wed, 25
 Oct 2023 07:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de> <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
In-Reply-To: <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Oct 2023 10:45:22 -0400
Message-ID: <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: joerg.sommer@navimatix.de, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 14:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105729

On Wed, Oct 25, 2023 at 7:40=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> Hi Joerg,
>
> This topic has already been discussed previously in
> https://lists.openembedded.org/g/openembedded-core/topic/98296212
>
> Bruce even sent a patch but it was never integrated, probably because it =
was a very invasive change.
> https://lists.openembedded.org/g/openembedded-core/message/182024

Heh. No, that wasn't the reason. The change wasn't invasive, it is
isolated to just the single recipe.

I just didn't have the cycles to chase down host specific issues and
uninative updates.

Clobbering rm_work isn't the right solution IMHO, but it can do the job.

Bruce

>
> Anyway you can solve this problem with:
> RM_WORK_EXCLUDE +=3D "make-mod-scripts"
>
> Jose
>
> J=C3=B6rg Sommer via lists.openembedded.org <joerg.sommer=3Dnavimatix.de@=
lists.openembedded.org> escreveu no dia quarta, 25/10/2023 =C3=A0(s) 09:57:
>>
>> Hi,
>>
>> I'm having an odd problem building the external kernel module
>> kernel-module-imx-gpu-viv [1]. I'm using kirkstone and have rm_work
>> enabled.
>>
>> [1]  https://layers.openembedded.org/layerindex/recipe/40267/
>>
>> The module builds fine, but the install step contains the module signing
>> which **silently** fails with *libcrypto.so.3* not found:
>>
>> ```
>> | make -C /build/tmp/work-shared/ziborium/kernel-source
>> M=3D/build/tmp/work/machine-pyxis-linux/kernel-module-imx-gpu-viv/6.4.3.=
p4.2-r0/git/src
>> modules_install
>> | make[1]: Entering directory '/build/tmp/work-shared/machine/kernel-sou=
rce'
>> | make -C /build/tmp/work-shared/machine/kernel-build-artifacts -f
>> /build/tmp/work-shared/machine/kernel-source/Makefile modules_install
>> | make[2]: Entering directory
>> '/build/tmp/work-shared/machine/kernel-build-artifacts'
>> | test -e include/generated/autoconf.h -a -e include/config/auto.conf ||
>> (               \
>> | echo >&2;                                                     \
>> | echo >&2 "  ERROR: Kernel configuration is invalid.";         \
>> | echo >&2 "         include/generated/autoconf.h or
>> include/config/auto.conf are missing.";\
>> | echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
>> to fix it.";    \
>> | echo >&2 ;                                                    \
>> | /bin/false)
>> | make -f
>> /build/tmp/work-shared/machine/kernel-source/scripts/Makefile.modinst
>> |   mkdir -p
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/;
>> cp
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/git/src/galcore.ko
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
>> |   :
>> |   scripts/sign-file "sha1" "certs/signing_key.pem"
>> certs/signing_key.x509
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
>> || true
>> | scripts/sign-file: error while loading shared libraries:
>> libcrypto.so.3: cannot open shared object file: No such file or director=
y
>> |   sh /build/tmp/work-shared/machine/kernel-source/scripts/depmod.sh
>> echo 5.15.60-imx8mm+g343e81c0e39e
>> | Warning: modules_install: missing 'System.map' file. Skipping depmod.
>> | make[2]: Leaving directory
>> '/build/tmp/work-shared/machine/kernel-build-artifacts'
>> | make[1]: Leaving directory '/build/tmp/work-shared/machine/kernel-sour=
ce'
>> ```
>>
>> I noticed that there are special dependency definitions in make-mod-scri=
pts
>>
>> ```
>> do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
>> openssl-native:do_populate_sysroot"
>> do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>> ```
>>
>> and module-base.bbclass (inherited by module.bbclass)
>>
>> ```
>> # We do the dependency this way because the output is not preserved
>> # in sstate, so we must force do_compile to run (once).
>> do_configure[depends] +=3D "make-mod-scripts:do_compile"
>> ```
>>
>> Is there an additional dependency needed to address rm_work?
>>
>> Kind regards
>>
>> J=C3=B6rg Sommer
>> --
>> Navimatix GmbH
>> Tatzendpromenade 2
>> D-07745 Jena
>> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
>> Registergericht: Amtsgericht Jena, HRB 501480
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#105726): https://lists.openembedded.org/g/openembedd=
ed-devel/message/105726
>> Mute This Topic: https://lists.openembedded.org/mt/102174355/5052612
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

