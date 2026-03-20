Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F301093168
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:31:59 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2710.1773966715693900292
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WQCDPUXm;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d756f2a06dso1446806a34.1
        for <Openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 17:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773966715; cv=none;
        d=google.com; s=arc-20240605;
        b=ZiZGXsXqktBcelphvSMmkifVWLIy5aSzrYfR3290nitAETHnv8vFNj+tSetJrD9x5k
         lDMHLr071yek/UVR9ZMsQtoRzz0liqHbm7g1LiMIiG40hrOvABIV/YWZXeq+d6jPPM3e
         R1BbRQtit5L+TU+GyoqyBQrte4ILvKNr6PlXMHyYHTexMoDs0mkgc9Vcj+EM9meUdbL6
         FSqV90VrNIy+AeN4F+v+viFlmuG2SPSxiHLoyQHjd0/HRONHkloFj49dm/yvqbwcCklM
         8s673lSmMJutleoMf+7SeI8pe++X9oer7IzywMOv6VmLffrjuCEbHjYfjnqmD1N2XOpA
         I+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V0fj2LBY20RU7B+z17S9JJ7XXI83PkLKCLG/U6jZqoc=;
        fh=bMqJyVx1OSo0APHvv7nrEO5hri16l/Fg/z1tKXRIzPE=;
        b=YFEm4zXR6/gSOfHTnH1DJ23Uopo+xG0QbhQMcHtsjQJ8RAtpoguap6aUCPVM+ORIAD
         vpfbPBWHe3wYPIWSqNC2a+80vQxTwnEBKV6c0VREEi5Knsk3tcxJnZuIBpN2jUnSehnX
         aOQoNnVPbvzcAwW1zTl6bkSx+gyR9KTqZVxxtEr+lPFqSs2B9jPDhPVHd6tu7UR14OiQ
         nDh+MxMVhZ39UBjJH/7kmR7mgNdl37tYrOByyT98pqNzZUJzgfhGteJIeAXbNFNAR1ph
         V2asaxCEVAc+P9gRqs10kXRFzeNBi7Ju/hsNvHQTXJogROzTKI1pZ7TXZcjIYxTVHQu9
         4TwA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773966715; x=1774571515; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0fj2LBY20RU7B+z17S9JJ7XXI83PkLKCLG/U6jZqoc=;
        b=WQCDPUXm5eV22zaFCStzJFJPNjmfEEzf744c72FFHED/Ftw7WvpJZ8Zzzwn5Ejx+8h
         y0Or0lLa5xPoMaVW4hFbw96hOg3OG/Y8RCK64gToZuQkXvQKDmwFOVa97NV89KT3zU3N
         gRrwg5GiT0+dKMb9GClrBRIm3wSW9WBQtx5dT4dYphyQT6zWubk3yqw4/vesPCKQQxcL
         EbpFPC4KIMGVkxzTpc1jt/N5iZaCWulJ7CYonDdM/jcfBYeDiSmj5/Az3FZ5IaqsWSw8
         ECQzLwBF/kP23+jF8f4jMAYwXrrEHGuOZjByCgQgdR5lWu2lHzdaP/UmsWYdafmGyQBa
         +RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966715; x=1774571515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V0fj2LBY20RU7B+z17S9JJ7XXI83PkLKCLG/U6jZqoc=;
        b=VNTr96Tm9+Ioiz52N+rTqDAV48ApL0EkHZTcbgUNz8NBDonZEZl+bQxPirXbrtTWAE
         PG1ym8NK8S4PdgyTk4Dva+IAX54+NruHjNGhgAA7NoKf3ve+EfWZzsXdCGV23f/qQYzk
         0Wn5jms2ItBCOapZR3TjDKUksNHPML9Nb1IGgTRUI/SVKsGPQs4TpzHMnVQEI+p/620H
         k1CjZwUy5Qo8cjHWu5xL+LGU8c96sPw3wnkz9+v2f5Ip9oiDtdah7SemK2Vc2MRGpz9n
         VlJHP1S9R5s4pJ68id1ElxSsVku1g0E9pkSAX1Q0UWiuWXeOYFODrHakgkUlRY+WbQFi
         J/sw==
X-Forwarded-Encrypted: i=1; AJvYcCUD/dCWpJ6TSKOmmgQBHDNYRyV7Kb7YVpDhS+LJjVe1ooNYzTQSyVpE3xGX/jVWp0RxTdPwu5v13BhqqUEvi/Mpzm0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+YVEmBX69d72yoUtSu/vpSJfODmdY9fq9uQX4YAQKJ7lvowUk
	8tTLE5DfOXLSVdtVXGg8katQ79SHKDixtvTQI7pf05rlYNNEeaDDlcNtT4I2J0jVci7tRNzh+Rw
	GeF6BAVqp5D++nvS/vZjx0+n0mhvYfbM=
X-Gm-Gg: ATEYQzyiftm91R4CTbB/72DwR5ZpoLWEWvSe0akETTHOBmkykI++aRrWJ0LLXClYu4w
	Ma9H6U8Vgc37qKrUq8dr2LMXALKQKC3y+lAde1hRQgkJKTY5jLtlRMkDw3gkXmv2VQEUAphXlkc
	lwm3HBYYKbGqEd5qAIyaTsVckjZnm+vZFPghExhgyU3UGOPHkqRSo5sdrju5Bz7CCUeKIHtaCJI
	Qn14XRO3nItGkBVbPhBrutcqbzFpcOkFKXQ71n558InMH/wPRzczXYOm+NuNfiZyc1FJg0O1q4K
	Pjb5BaIL
X-Received: by 2002:a05:6830:6d26:b0:7d7:e3d7:e200 with SMTP id
 46e09a7af769-7d7ea9f0564mr910289a34.6.1773966714707; Thu, 19 Mar 2026
 17:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so=RHPpR_uQk5XhGWLPywr_x-4cr=Ub-nODf14hSAw83A@mail.gmail.com>
 <DB5PR02MB10213E9B6359ED0E2BCAD3968EF4FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAMKF1srQ2N9F5__Y9k1_yNy5-wfryCqDqAkR8qrJo_rfM878TA@mail.gmail.com>
 <CAMKF1srrHrDeCxJp1nnu1A_Uj8Qd8MyUhe6ZR78frYmFBajfAw@mail.gmail.com>
 <CA+s=J=zqQET=sUwGTPDt4GnJpRpi4c6NkVE9aUOvyJ4bs67erw@mail.gmail.com> <CAMKF1srJJ5uE8Kqz5TM4SAnOF6ST6+esxCoBR4RxPmhJ=Xq32g@mail.gmail.com>
In-Reply-To: <CAMKF1srJJ5uE8Kqz5TM4SAnOF6ST6+esxCoBR4RxPmhJ=Xq32g@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 20 Mar 2026 13:31:43 +1300
X-Gm-Features: AaiRm501lRBY3G5GEdZXl8cd-Nq3R0Ds-Gm9ISOD1_JLPJrhSAd58SZtO2GNLOs
Message-ID: <CADySD0FobO4ybY8_wPuA1h2fxHcA5h+cWTSNY56wzmHVJ+uqmA@mail.gmail.com>
Subject: Re: [oe] Recipes needing build fixes after glibc 2.43 upgrade
To: raj.khem@gmail.com
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 00:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125416

On Fri, Mar 20, 2026 at 1:29=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
>
>
> On Thu, Mar 19, 2026, 2:15=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com> wrote:
>>
>> On Thu, Mar 19, 2026 at 1:53=E2=80=AFPM Khem Raj via lists.openembedded.=
org
>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > remaining list
>> >
>> > Summary: 7 tasks failed:
>> >   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_compile
>> >     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-=
64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.809159
>> >   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile
>> >     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-=
64-v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.790297
>> >   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-bsp/fwupd/fwupd-efi_1.8.bb:do_configure
>> >     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-=
64-v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure.882672

I am not able to replicate the AB error with version 1.8 in my local
env and managed to upgrade the recipe.

>> >   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/qad/qad_git.bb:do_compile
>> >     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-=
64-v3-poky-linux/qad/0.0+git/temp/log.do_compile.886896
>> >   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile
>> >     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-=
64-v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.904879
>> >   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/netcf/netcf_0.2.8.bb:do_configure
>>
>> This seems to be because of a .gnulib-tool.py file in newer gnulib
>> that isn't being copied. Even if that is fixed, it later fails because
>> it uses an obsolete macro.
>>
>> The last release of netcf was 10 years ago and there have been no
>> updates. I didn't find any recipe using it except libvirt. Perhaps it
>> should be removed?
>
>
> I am for it.
>>
>>
>> >     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-=
64-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure.916449
>> >   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:do_compile
>> >     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-=
64-v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_compile.953431
>> >
>> > On Wed, Mar 18, 2026 at 8:23=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
>> >>
>> >> Awesome, thanks for the help
>> >>
>> >> On Wed, Mar 18, 2026, 8:01=E2=80=AFPM Peter Kjellerstedt <peter.kjell=
erstedt@axis.com> wrote:
>> >>>
>> >>> I=E2=80=99ve sent a backport of a patch for liboauth2. Note that ups=
tream has made a mess. They first fixed the problem in commit 0dcba079907d5=
59550ee8d9a201d26203bb8aebd (the commit I have backported), but then they r=
everted it in commit 155b93b2efd1e8b0022c9bdad2297a2a670dc29c under the pre=
tense of fixing the issue (https://github.com/OpenIDC/liboauth2/issues/70).=
 I have reported the mistake as https://github.com/OpenIDC/liboauth2/issues=
/73...
>> >>>
>> >>>
>> >>>
>> >>> //Peter
>> >>>
>> >>>
>> >>>
>> >>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@=
lists.openembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
>> >>> Sent: den 18 mars 2026 22:40
>> >>> To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
>> >>> Subject: [oe] Recipes needing build fixes after glibc 2.43 upgrade
>> >>>
>> >>>
>> >>>
>> >>> Hello All,
>> >>>
>> >>>
>> >>>
>> >>> There are few recipes currently broken on meta-openembedded layers, =
predominantly due to glibc upgrade. Help is needed in fixing them so we can=
 have world builds working again on AB
>> >>>
>> >>>
>> >>>
>> >>> Here is list
>> >>>
>> >>>
>> >>>
>> >>> Summary: 16 tasks failed:
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.55019
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.38373
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:do_co=
mpile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/python3-xstatic-font-awesome/6.2.1.1/temp/log.do_compile=
.107676
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/sysdig/sysdig_0.39.0.bb:do_configure
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/sysdig/0.39.0/temp/log.do_configure.124550
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-bsp/fwupd/fwupd-efi_1.8.bb:do_configure
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure.145475
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/opensaf/opensaf_5.22.01.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/opensaf/5.22.01/temp/log.do_compile.161530
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.154712
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pychromecast_14.0.9.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/python3-pychromecast/14.0.9/temp/log.do_compile.175919
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/qad/qad_git.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/qad/0.0+git/temp/log.do_compile.176411
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-test/libfaketime/libfaketime_0.9.10.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/libfaketime/0.9.10/temp/log.do_compile.182340
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-devtools/luaposix/luaposix_36.2.1.bb:do_package
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/luaposix/36.2.1/temp/log.do_package.186406
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/liboauth2/liboauth2_2.2.0.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/liboauth2/2.2.0/temp/log.do_compile.199073
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_compile.193667
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/netcf/netcf_0.2.8.bb:do_configure
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure.208957
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/links/links-x11_2.26.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/links-x11/2.26/temp/log.do_compile.215047
>> >>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/links/links_2.29.bb:do_compile
>> >>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/links/2.29/temp/log.do_compile.218734
>> >>> Summary: There were 26 ERROR messages, returning a non-zero exit cod=
e.
>> >>>
>> >>>
>> >>>
>> >>> and a build log with errors is here
>> >>>
>> >>>
>> >>>
>> >>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/ra=
w_inline
>> >>>
>> >>>
>> >>>
>> >>> Thanks
>> >>>
>> >>> -Khem
>> >>>
>> >>>
>> >
>> >
>> >
>> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125400): https://lists.openembedded.org/g/openembedde=
d-devel/message/125400
> Mute This Topic: https://lists.openembedded.org/mt/118391105/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

