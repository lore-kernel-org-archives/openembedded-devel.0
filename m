Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB4CE77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 09:37:52 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.6679.1733391471938093991
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 01:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RkfweKbO;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ef524fda21so4101907b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 01:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733391471; x=1733996271; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8baEqC1woKY4Tjbw4vErxdnXx/YnxLevFMMTtuIFiE=;
        b=RkfweKbOVJTYUd+j3jU4MkcIWOsydg3VeE15XmR4Oh0cqsG2vm9RKHJrKN12Hwt2U4
         MWUEq/Ep67eBiNRSlKg4fyDvYQ8OU7JwTdFOojXYANXD+mWTlrWbGTXRidg9SDTZvTFi
         +HtWp3Fj+SMU486snHV6F2UoKxxAfG4gMTn567IjEZADYMzYg9yJHqF5dEUpxaLJsEK/
         u4RDHMPrZgsRg8PaN/sS3QnAnY2mefrXWJCUNmmT+3AvbyQAMzRsDB7Ge7dkjJsICihW
         R9MBDq81sBWWqwjZQkb8dY2Q7MXoHh2Eis8b3+KF4ajSMFDateK3iOrJ8/vM0WYFb0rH
         SdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391471; x=1733996271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8baEqC1woKY4Tjbw4vErxdnXx/YnxLevFMMTtuIFiE=;
        b=a4UBp6x0/l1TmbCUSyJoiLo4twTbMye7BGvVDfnRvPdu9SChTwruCxrlcpKVK5csvS
         AhGLm6izlzk88n3e0UXMc4XB2N+g6S/2ijtpKB3POG0Zi5iLQyJ2tKbW9MM4FE5BNoWd
         UNezPpvjqOdXy2EnfKrleiY0ThmucMo7xN4gHtipC13TvMc6betYECX6no4Ux2GSUj1c
         jljUiyvqz0IT4AUCrXQzmXe9USs6Yp1+pxZ0qcBwPLAArmyuMTfq4xtDORpSX/tNfrwI
         sHKsDKT5EBZ4LbMmkAstshAEfFR6KkKBc1/eYq7KpBtDqPBsVCUNP3BybutT86aG6cpC
         9bnA==
X-Gm-Message-State: AOJu0YyV+z2n3bgoQqDAKIMICPO8Cwb7BY3tmiBAasvL4Yf1cd82PWG6
	Q2wdJhYleJGOIvgCB4cL2/1gDkjZj+CEbSfFpXt5UL08pCo1tc/h5LXjs6zHjnESpEY5udRpUfL
	aXhLEHF8+EKdfC69oE7jBVE2S1zhUmCLE
X-Gm-Gg: ASbGncsaE5Km9KZDW1CEhl5BkBWy0pyV9+6mAIX6zD0ttM3Z9ZxpxHoTn7P7V2pHESX
	c4LXEcCOQQrRvWMSgZQhf/ODV1OQBsJL1
X-Google-Smtp-Source: AGHT+IHC6fiGMSSK37+ju2b279qdqAq4d69vMP4reKyn7XrM4toXO6tWFkMyQiJGxhuZQgLMIF42P8ijKCMwX/tl2wU=
X-Received: by 2002:a05:6902:1501:b0:e33:13ab:52c1 with SMTP id
 3f1490d57ef6-e39d436c390mr8645066276.35.1733391470959; Thu, 05 Dec 2024
 01:37:50 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0Hxn4YRVT1_8Vjzcv1Oqe_B7O6UHtEYyRzhKkH8OPq2pg@mail.gmail.com>
 <CADySD0GaOXtoNvagju9h1_1b_h1bjMVijW3RyyO1ji3iX=2q8g@mail.gmail.com> <CAMKF1srUvghoYyv2t_5pOqRptjAtMdO568g2a37tcgAZGSCqJA@mail.gmail.com>
In-Reply-To: <CAMKF1srUvghoYyv2t_5pOqRptjAtMdO568g2a37tcgAZGSCqJA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 5 Dec 2024 22:37:39 +1300
Message-ID: <CADySD0HNZ8U_-cfpzXbLLvjdArZUNs7xfVr5dWe5FoENx9WJAw@mail.gmail.com>
Subject: Re: [oe] Trying to build image inside crops docker using github workflow
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 09:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114201

On Thu, Dec 5, 2024 at 6:12=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Dec 4, 2024 at 1:14=E2=80=AFAM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> > I am trying to use github workflow to build core-image-minimal (scarthg=
ap) inside a docker container (ghcr.io/crops/poky:ubuntu-22.04)
> >
> > Following is the workflow step:
> >
> >
> > steps:
> > - name: Start Yocto image build
> > shell: bash
> >
> > run: |
> > echo "${{ secrets.TRACKER_TOKEN }}" | docker login ghcr.io -u ${{ githu=
b.actor }} --password-stdin
> > docker pull ghcr.io/crops/poky:ubuntu-22.04
> >
> > cat << 'EOF' > script.sh
> > #!/bin/bash
> > echo "Running inside the Docker container"
> > git clone git://git.yoctoproject.org/poky -b scarthgap
> > source oe-init-build-env
> > bitbake core-image-minimal
> > EOF
> >
> > chmod +x script.sh
> > docker run --rm -v $(pwd):/yocto --workdir=3D/workdir ghcr.io/crops/pok=
y:ubuntu-22.04 /bin/bash -c "source /workdir/script.sh"
>
> its possible that its executing in a fresh shell which is not
> inheriting the environment. Maybe try to run steps outside the script.

Thanks for your reply.

Using a new shell for the script is understandable but I don't understand
how a fresh shell can be used to execute part of the script.

I still tried your suggestion and a few other things like
https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-gi=
thub-actions#jobsjob_idcontainer
but no success.

Instead of using docker run, noticed that the github workflow uses
docker create and docker start (which is good)
and also override the entrypoint. I am yet to figure out if that is the rea=
son.

But in the end, I worked-around the problem by self-hosting the runner
and it is working now.

>
> >
> >
> > But I am getting following error when this step runs:
> >
> > WARNING: bitbake binary is not found in PATH, did you source the script=
?
> > ERROR: Execution of event handler 'defaultcheck_sanity_eventhandler' fa=
iled
> > Traceback (most recent call last):
> > File "/workdir/poky/meta/classes-global/sanity.bbclass", line 1025, in =
defaultcheck_sanity_eventhandler(e=3D<bb.event.SanityCheck object at 0x7f74=
95a4cca0>, d=3D<bb.data_smart.DataSmart object at 0x7f74959d6a40>):
> > sanity_data =3D bb.data.createCopy(e.data)
> > > check_sanity(sanity_data)
> > if e.generateevents:
> > File "/workdir/poky/meta/classes-global/sanity.bbclass", line 996, in c=
heck_sanity(sanity_data=3D<bb.data_smart.DataSmart object at 0x7f7495a4cf10=
>):
> > if last_sanity_version < sanity_version or last_nativelsbstr !=3D nativ=
elsbstr:
> > > check_sanity_version_change(status, sanity_data)
> > status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data=
))
> > File "/workdir/poky/meta/classes-global/sanity.bbclass", line 702, in c=
heck_sanity_version_change(status=3D<SanityStatus object at 0x7f7495a4db10>=
, d=3D<bb.data_smart.DataSmart object at 0x7f7495a4cf10>):
> > for bin_cmd in suid_check_bins:
> > > bin_path =3D bb.utils.which(os.environ["PATH"], bin_cmd)
> > if bin_path:
> > File "/usr/lib/python3.10/os.py", line 680, in _Environ.__getitem__(key=
=3D'PATH'):
> > # raise KeyError with the original key value
> > > raise KeyError(key) from None
> > return self.decodevalue(value)
> > KeyError: 'PATH'
> > ERROR: Command execution failed: Traceback (most recent call last):
> > File "/workdir/poky/bitbake/lib/bb/command.py", line 122, in runAsyncCo=
mmand
> > self.cooker.updateCache()
> > File "/workdir/poky/bitbake/lib/bb/cooker.py", line 1606, in updateCach=
e
> > bb.event.fire(bb.event.SanityCheck(False), self.databuilder.mcdata[mc])
> > File "/workdir/poky/bitbake/lib/bb/event.py", line 225, in fire
> > fire_class_handlers(event, d)
> > File "/workdir/poky/bitbake/lib/bb/event.py", line 132, in fire_class_h=
andlers
> > execute_handler(name, handler, event, d)
> > File "/workdir/poky/bitbake/lib/bb/event.py", line 103, in execute_hand=
ler
> > ret =3D handler(event, d)
> > File "/workdir/poky/meta/classes-global/sanity.bbclass", line 1025, in =
defaultcheck_sanity_eventhandler
> > check_sanity(sanity_data)
> > File "/workdir/poky/meta/classes-global/sanity.bbclass", line 996, in c=
heck_sanity
> > check_sanity_version_change(status, sanity_data)
> > File "/workdir/poky/meta/classes-global/sanity.bbclass", line 702, in c=
heck_sanity_version_change
> > bin_path =3D bb.utils.which(os.environ["PATH"], bin_cmd)
> > File "/usr/lib/python3.10/os.py", line 680, in __getitem__
> > raise KeyError(key) from None
> > KeyError: 'PATH'
> > Summary: There was 1 WARNING message.
> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> >
> > I have confirmed by adding "echo $PATH" before image starts that PATH e=
nvironment variable exists and bitbake is in the path:
> >
> > /workdir/poky/scripts:/workdir/poky/bitbake/bin:/usr/local/sbin:/usr/lo=
cal/bin:/usr/sbin:/usr/bin:/sbin:/bin
> >
> >
> > But if I run the step as it is in my host machine, docker container is =
able to build the image.
> >
> > Any suggestions on what could be wrong here?
> >
> > thanks
> > Ankur
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114196): https://lists.openembedded.org/g/openembed=
ded-devel/message/114196
> > Mute This Topic: https://lists.openembedded.org/mt/109916860/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

