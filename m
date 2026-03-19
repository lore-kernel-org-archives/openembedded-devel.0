Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49A8103E19B
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 05:53:53 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4819.1773899626811585708
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 22:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ROL4rh/Q;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad9fabd08so221525d50.2
        for <Openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 22:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773899626; cv=none;
        d=google.com; s=arc-20240605;
        b=KKS13ar+/WZAgtl0fQHGjwn1JJKAXNQqkOUpj/86xWujXdlqU9QRu6vDhdmhivfGK5
         0BHfOiaS/gVwVYbQMRAfxPC36FbdpGwvxFVuMDAnbuxShdbZtpoEmQrbdHsYG44SXosV
         +4zQPWUSrenfWa7SGITVT0DaIV0YHG065mYYZX+FvnNgISVjUKq/EdFk0JwG4ZVlvumk
         sNP41tvK1oVyr5Y20LK8/gHX+DeUtFGfLltGPHFQ7g/ssjiOuKsCnLt7/McEyylncvxN
         nhcvMBjxO2HZVcpFuQj5Tbi0lmq4XT2C9TwrXEGD8UKpcfslzmUYIm6b2GwUdc9KnQMe
         gMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PYfKb35lZeXnPTOY7kc3i7jPgmIKPy5yHU7Jhigbxco=;
        fh=aHD971P4Ofrf0ph2vBNzAskpF7q+RiLHBOwiOngzFCw=;
        b=FwuGTqw2HAd+/5NI5xvtyAYADs4nug6eChY9s9rOX/RhbEx7U9QCGXf6oi/oBdMaxH
         TfgfKu7PkF6SjVoEClOHTmciGPSJKwRQQ8Tz/MwcJgP1YdUDdXQa5H+s2N2v/Ia89pLK
         ViaWphZiRh3smUlJYbEpxYD1POeJq1sVXjyCBMADrupRlYz47ZwmCl3nlJ+6QhO0uJxv
         VdQdK30ac4HF8xpvBPqtBq30HUu369SCeVB0VrB4uvDNdpYPwXdV4+d3PIGEJM7CV80y
         lkW5E8ADQj0g9TAv2sAXSjQ/kOHvrjgEkkGj5iDmjkKXjkpXx/ZYoVqwbvy3t5v7MzKT
         sV4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773899626; x=1774504426; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PYfKb35lZeXnPTOY7kc3i7jPgmIKPy5yHU7Jhigbxco=;
        b=ROL4rh/Qs/krz5dq62K9UT9e5/6LH4yzhrFktDwBpe1B7Vof/qcGjg97Xun1e3DIEL
         f+1mJzo6lhumwlQHxQ9xESnklsfsKSHwxDwXPUQ73TaGE+2znQlbxyIAxsmT2+14GkE4
         VsYTD8l7hakLJL1epeBtN6IBQopzRz7XEE2wg2UACxeQI2NAjTnm2+qWU1vxLrluXJGf
         LIqM+Cc3aQeJsUih6ti6Z2OTopVSB201cyXtKReE132picNQODH5iZnBd+ERgyuFLQNb
         LZYfrDizXCAv078mhgncgwHx8S6tMVprsT18VogKUG0NKulqD71bPcfhoRTuXJ0Gd8G/
         xnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899626; x=1774504426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYfKb35lZeXnPTOY7kc3i7jPgmIKPy5yHU7Jhigbxco=;
        b=NBMLRBB2NzGcEXpjIdtaL4uDnGLmo1415fGPqGORIh/x2p/G63dC4oYiu8N2btGrZJ
         ZQb/g7gPWqtA4hCayQFgHCvIz31HOJpfcy3bDSjcg9Q2G/CZaTT1wDfKOXf209X7erwF
         /1DQL+bp4+HCBNJrhXsL53PyFgq4YK2AO1I9QUNlo5QFAZkU7N7w0/edqtF8r90tfdBD
         E5/MHfXBHPuIl7iUIVUsX5L/3YjoL9d64g43IhHbBu0Yug9bk6szbScN1DXsPOwhdqU5
         qn9c9XGOzakBYMns4AmGlpXY3N1eVwpaAcv35DhCTXbTOuddu1ueFLvSHwupmxiK8pir
         2lVQ==
X-Gm-Message-State: AOJu0Yxa+bU9HCWhDFYQDwBbIykQx6x9evYpeKnH1yrAYDUzlLHnp7D1
	KzCpkFnwpmkyWu6VCqhPSmQrTAjMDwsPHZxVlvTX68YZC9jTdY5VOlcHRBJ1rp0rI2a2y4V7caW
	iKchpsY/MLAA3Vl/b/CPLYgUKjJzkdpupjPMh
X-Gm-Gg: ATEYQzxlHHV6FLD9HCuuD0yLDw5eachvlkRbfmuwPDcJg/fg7A5yJW5inYDzMnjt5W1
	5jqfz4S0+63I79+D+RNzk1wyGESuI+iH2rivZ/C9ae4c9H5ipIGx0xollLhGfL6RAwQqg5t1lWT
	ahe9G0lrUU6WtA/02nChl/WyraeB80owzrtYFFKy9j+hi9vkkO+bf6jXNBMhK6PRep/3cpUrQtx
	P6QvkjO3rAzHB/Cy/JlGAa8YorGOgNYWPD9NoVIaJJCpBsOTIC5r74KSLmzTD1LR1dV63A8snHM
	XqZwgmvUGlAuQrCmZBGGQ9iURDI91dj04aj+6t2/+w34VE10o7IFyU4ywHCu+PFQZHJxQJDUU15
	qPk+YInRLGiiRK6zsz5N0AYdv
X-Received: by 2002:a05:690e:1916:b0:64e:a190:ccaa with SMTP id
 956f58d0204a3-64ea190cf02mr835179d50.71.1773899625748; Wed, 18 Mar 2026
 22:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so=RHPpR_uQk5XhGWLPywr_x-4cr=Ub-nODf14hSAw83A@mail.gmail.com>
 <DB5PR02MB10213E9B6359ED0E2BCAD3968EF4FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAMKF1srQ2N9F5__Y9k1_yNy5-wfryCqDqAkR8qrJo_rfM878TA@mail.gmail.com>
In-Reply-To: <CAMKF1srQ2N9F5__Y9k1_yNy5-wfryCqDqAkR8qrJo_rfM878TA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Mar 2026 22:53:18 -0700
X-Gm-Features: AaiRm50G55US3YoZzdS_zl-qy9p84KS-v9BV01jG45ay0a2vyynR1eT32sLdIXY
Message-ID: <CAMKF1srrHrDeCxJp1nnu1A_Uj8Qd8MyUhe6ZR78frYmFBajfAw@mail.gmail.com>
Subject: Re: [oe] Recipes needing build fixes after glibc 2.43 upgrade
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000f5c17064d5a31d5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125377

--0000000000000f5c17064d5a31d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

remaining list

Summary: 7 tasks failed:

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-kernel/minicoredumper/minicoredumper_2.0.7.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/minicoredumper/2.0.7/temp/log.do_compile.809159

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-extended/canopenterm/canopenterm_1.0.14.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/canopenterm/1.0.14/temp/log.do_compile.790297

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-bsp/fwupd/fwupd-efi_1.8.bb:
do_configure
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/fwupd-efi/1.8/temp/log.do_configure.882672

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-extended/qad/qad_git.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/qad/0.0+git/temp/log.do_compile.886896

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking=
/recipes-support/ntopng/ntopng_5.2.1.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/ntopng/5.2.1/temp/log.do_compile.904879

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking=
/recipes-support/netcf/netcf_0.2.8.bb:
do_configure
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/netcf/0.2.8+git/temp/log.do_configure.916449

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking=
/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/open-vm-tools/13.0.10/temp/log.do_compile.953431

On Wed, Mar 18, 2026 at 8:23=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Awesome, thanks for the help
>
> On Wed, Mar 18, 2026, 8:01=E2=80=AFPM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
>> I=E2=80=99ve sent a backport of a patch for liboauth2. Note that upstrea=
m has
>> made a mess. They first fixed the problem in commit
>> 0dcba079907d559550ee8d9a201d26203bb8aebd (the commit I have backported),
>> but then they reverted it in commit
>> 155b93b2efd1e8b0022c9bdad2297a2a670dc29c under the pretense of fixing th=
e
>> issue (https://github.com/OpenIDC/liboauth2/issues/70). I have reported
>> the mistake as https://github.com/OpenIDC/liboauth2/issues/73...
>>
>>
>>
>> //Peter
>>
>>
>>
>> *From:* openembedded-devel@lists.openembedded.org <
>> openembedded-devel@lists.openembedded.org> *On Behalf Of *Khem Raj via
>> lists.openembedded.org
>> *Sent:* den 18 mars 2026 22:40
>> *To:* openembeded-devel <Openembedded-devel@lists.openembedded.org>
>> *Subject:* [oe] Recipes needing build fixes after glibc 2.43 upgrade
>>
>>
>>
>> Hello All,
>>
>>
>>
>> There are few recipes currently broken on meta-openembedded layers,
>> predominantly due to glibc upgrade. Help is needed in fixing them so we =
can
>> have world builds working again on AB
>>
>>
>>
>> Here is list
>>
>>
>>
>> Summary: 16 tasks failed:
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-kernel/minicoredumper/minicoredumper_2.0.7.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/minicoredumper/2.0.7/temp/log.do_compile.55019
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/canopenterm/canopenterm_1.0.14.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/canopenterm/1.0.14/temp/log.do_compile.38373
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/python3-xstatic-font-awesome/
>> 6.2.1.1/temp/log.do_compile.107676
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/sysdig/sysdig_0.39.0.bb:
>> do_configure
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/sysdig/0.39.0/temp/log.do_configure.124550
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-bsp/fwupd/fwupd-efi_1.8.bb:
>> do_configure
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/fwupd-efi/1.8/temp/log.do_configure.145475
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/opensaf/opensaf_5.22.01.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/opensaf/5.22.01/temp/log.do_compile.161530
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/ntopng/ntopng_5.2.1.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/ntopng/5.2.1/temp/log.do_compile.154712
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pychromecast_14.0.9.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/python3-pychromecast/14.0.9/temp/log.do_compile.175919
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/qad/qad_git.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/qad/0.0+git/temp/log.do_compile.176411
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-test/libfaketime/libfaketime_0.9.10.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/libfaketime/0.9.10/temp/log.do_compile.182340
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/luaposix/luaposix_36.2.1.bb:
>> do_package
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/luaposix/36.2.1/temp/log.do_package.186406
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/liboauth2/liboauth2_2.2.0.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/liboauth2/2.2.0/temp/log.do_compile.199073
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/open-vm-tools/13.0.10/temp/log.do_compile.193667
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/netcf/netcf_0.2.8.bb:
>> do_configure
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/netcf/0.2.8+git/temp/log.do_configure.208957
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/links/links-x11_2.26.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/links-x11/2.26/temp/log.do_compile.215047
>>
>> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/links/links_2.29.bb:
>> do_compile
>>     log:
>> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/links/2.29/temp/log.do_compile.218734
>> Summary: There were 26 ERROR messages, returning a non-zero exit code.
>>
>>
>>
>> and a build log with errors is here
>>
>>
>>
>>
>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_in=
line
>>
>>
>>
>> Thanks
>>
>> -Khem
>>
>>
>>
>

--0000000000000f5c17064d5a31d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">remaining list<div><br></div><div>Summary: 7 tasks failed:=
<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_compile<br>=C2=
=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.809159<br>=C2=
=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/rec=
ipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile<br>=C2=A0 =C2=A0=
 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-po=
ky-linux/canopenterm/1.0.14/temp/log.do_compile.790297<br>=C2=A0 /srv/pokyb=
uild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-bsp/fwupd=
/fwupd-efi_1.8.bb:do_configure<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-w=
orker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/fwupd-efi/1.8/temp/=
log.do_configure.882672<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build=
/meta-openembedded/meta-oe/recipes-extended/qad/qad_git.bb:do_compile<br>=
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/qad/0.0+git/temp/log.do_compile.886896<br>=C2=A0 /srv=
/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/rec=
ipes-support/ntopng/ntopng_5.2.1.bb:do_compile<br>=C2=A0 =C2=A0 log: /srv/p=
okybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/nto=
png/5.2.1/temp/log.do_compile.904879<br>=C2=A0 /srv/pokybuild/yocto-worker/=
meta-oe/build/meta-openembedded/meta-networking/recipes-support/netcf/netcf=
_0.2.8.bb:do_configure<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/me=
ta-oe/build/build/tmp/work/x86-64-v3-poky-linux/netcf/0.2.8+git/temp/log.do=
_configure.916449<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-=
openembedded/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13=
.0.10.bb:do_compile<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-=
oe/build/build/tmp/work/x86-64-v3-poky-linux/open-vm-tools/13.0.10/temp/log=
.do_compile.953431<br></div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 18, 2026 at 8=
:23=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto">Awesome, thanks for the help</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 18, 20=
26, 8:01=E2=80=AFPM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"SV">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">I=E2=80=99ve sent a backport =
of a patch for liboauth2. Note that upstream has made a mess. They first fi=
xed the problem in commit
 0dcba079907d559550ee8d9a201d26203bb8aebd (the commit I have backported), b=
ut then they reverted it in commit 155b93b2efd1e8b0022c9bdad2297a2a670dc29c=
 under the pretense of fixing the issue (<a href=3D"https://github.com/Open=
IDC/liboauth2/issues/70" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/OpenIDC/liboauth2/issues/70</a>).
 I have reported the mistake as <a href=3D"https://github.com/OpenIDC/liboa=
uth2/issues/73" rel=3D"noreferrer" target=3D"_blank">
https://github.com/OpenIDC/liboauth2/issues/73</a>...<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> <a href=3D"mailto:openembedd=
ed-devel@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">opene=
mbedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded=
-devel@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">openemb=
edded-devel@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Khem Raj via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
<b>Sent:</b> den 18 mars 2026 22:40<br>
<b>To:</b> openembeded-devel &lt;<a href=3D"mailto:Openembedded-devel@lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">Openembedded-devel@=
lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> [oe] Recipes needing build fixes after glibc 2.43 upgrade<u=
></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hello All,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">There are few recipes currently broken on meta-opene=
mbedded layers, predominantly due to glibc upgrade. Help is needed in fixin=
g them so we can have world builds working again on AB<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Here is list<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Summary: 16 tasks failed:<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.55019<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.38373<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:do_comp=
ile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/python3-xstatic-font-awesome/<a href=3D"http://6.2.1.=
1/temp/log.do_compile.107676" rel=3D"noreferrer" target=3D"_blank">6.2.1.1/=
temp/log.do_compile.107676</a><br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/sysdig/sysdig_0.39.0.bb:do_configure<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/sysdig/0.39.0/temp/log.do_configure.124550<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-bsp/fwupd/fwupd-efi_1.8.bb:do_configure<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure.145475<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/opensaf/opensaf_5.22.01.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/opensaf/5.22.01/temp/log.do_compile.161530<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.154712<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pychromecast_14.0.9.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/python3-pychromecast/14.0.9/temp/log.do_compile.17591=
9<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/qad/qad_git.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/qad/0.0+git/temp/log.do_compile.176411<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-test/libfaketime/libfaketime_0.9.10.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/libfaketime/0.9.10/temp/log.do_compile.182340<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-devtools/luaposix/luaposix_36.2.1.bb:do_package<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/luaposix/36.2.1/temp/log.do_package.186406<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/liboauth2/liboauth2_2.2.0.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/liboauth2/2.2.0/temp/log.do_compile.199073<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:do_compile<b=
r>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_compile.193667<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/netcf/netcf_0.2.8.bb:do_configure<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure.208957<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/links/links-x11_2.26.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/links-x11/2.26/temp/log.do_compile.215047<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/links/links_2.29.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/links/2.29/temp/log.do_compile.218734<br>
Summary: There were 26 ERROR messages, returning a non-zero exit code.<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">and a build log with errors is here<u></u><u></u></p=
>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://autobuilder.yoctoproject.org/valk=
yrie/api/v2/logs/5867932/raw_inline" rel=3D"noreferrer" target=3D"_blank">h=
ttps://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_inline=
</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">-Khem<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>
</blockquote></div>

--0000000000000f5c17064d5a31d5--

