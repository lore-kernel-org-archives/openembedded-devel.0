Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143BCE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:12:05 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.20250.1733332322746574132
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L38q/OMY;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71d40fdde2fso6114a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 09:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733332322; x=1733937122; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3iZnGOFiS1I4Z27x+QUzBbwa1I59aUqVWK32coRJYA=;
        b=L38q/OMYW4fRdWf7FwPWxtab7DNZHBMi40ycMP5DZqM8IVh/x9k5D9Xdzq/MKtl0I/
         +BPBK/ppV1CpO5C1NHnuv5ZNKyeeLzgU7tOqWiJXlhOX5NQSFKswU39jOkqJHi0ODzAH
         rtYThv+4UXodLjadUrtnc2O2bISdu75K61f1Uo/awoPvqhUfoWBYjF4tBeZnkljGn8Ck
         /VMjbS3UoNpB0a0mHkBLPGerX7n7aDzxbVgjivQS/JRVmb1QL2aBOjkTb0vj/Qz6wvB1
         j1q2ahzYungAKp3BtGhP4fwAabQjSfn1dZWwMPkXtOVxMNvPZG597+g0yqOON4jBvwdl
         HQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733332322; x=1733937122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3iZnGOFiS1I4Z27x+QUzBbwa1I59aUqVWK32coRJYA=;
        b=X7SBj5ou9gqFGgVyp3EpVVPNrxkvsH38jJNd9guY5QF255y0H28gzXKSiE9i+0zmPa
         Xi2iHwct1G/oPl+lI/rM8z9XjWMaYOqb2tZodVwwQ7MMdjdR5E9Ic7HuEN43LKJnp3jL
         pKhYhSgb7HuXRnqN5GgukqLDtgmuyIYkF5AmAkkabC4pWoX21BBdMkKZ1/4BeUXWMyUk
         LDmPAyZkBUFgB38y/EfPGQUfrxZaJXHheh8S9cbgES3Z/+UOMupQ5LGmkg+7BmB8zJoU
         E68jUMsMMXGOyvP0JKW6f06Zx9HWVAAZZG+MJIwDdPdWBtpX3jtje6dNzwPQ+sl0OMJG
         TKjw==
X-Gm-Message-State: AOJu0Yz4uZvI9OjEKuArUFZgRlp0o8soLrRuuIdohC5Iy9QijKOsR4Ha
	BIPaaQg7tx4npLa7sQA6fHjQHqfKYc/HHfs0ORNsz6CRLWfnWAkksH2C9QnLNX0PPexnelr8n8/
	URzaToXy8pOOjbuN045WaMIxXLgc=
X-Gm-Gg: ASbGncukbhCZL+oLDWX20le0/m9GT93vp3MlD1sZeiULPKzXAGB8TMrGAXdcJoirBd6
	bHugmfFC3z7vV6OXQYtFeHmpiRgrrWQ==
X-Google-Smtp-Source: AGHT+IGmDAK/37cHv3W1UlDLkJ8MW8DuUsSAz6RRyVt/PRJMj9vYR4xzqpggHHtGK7CPYThScpGuOO1ouJreKFRTsnM=
X-Received: by 2002:a05:6830:64c9:b0:710:fae8:fcc1 with SMTP id
 46e09a7af769-71dad610989mr8988639a34.12.1733332321790; Wed, 04 Dec 2024
 09:12:01 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0Hxn4YRVT1_8Vjzcv1Oqe_B7O6UHtEYyRzhKkH8OPq2pg@mail.gmail.com>
 <CADySD0GaOXtoNvagju9h1_1b_h1bjMVijW3RyyO1ji3iX=2q8g@mail.gmail.com>
In-Reply-To: <CADySD0GaOXtoNvagju9h1_1b_h1bjMVijW3RyyO1ji3iX=2q8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Dec 2024 09:11:36 -0800
Message-ID: <CAMKF1srUvghoYyv2t_5pOqRptjAtMdO568g2a37tcgAZGSCqJA@mail.gmail.com>
Subject: Re: [oe] Trying to build image inside crops docker using github workflow
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 17:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114199

On Wed, Dec 4, 2024 at 1:14=E2=80=AFAM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hello,
>
> I am trying to use github workflow to build core-image-minimal (scarthgap=
) inside a docker container (ghcr.io/crops/poky:ubuntu-22.04)
>
> Following is the workflow step:
>
>
> steps:
> - name: Start Yocto image build
> shell: bash
>
> run: |
> echo "${{ secrets.TRACKER_TOKEN }}" | docker login ghcr.io -u ${{ github.=
actor }} --password-stdin
> docker pull ghcr.io/crops/poky:ubuntu-22.04
>
> cat << 'EOF' > script.sh
> #!/bin/bash
> echo "Running inside the Docker container"
> git clone git://git.yoctoproject.org/poky -b scarthgap
> source oe-init-build-env
> bitbake core-image-minimal
> EOF
>
> chmod +x script.sh
> docker run --rm -v $(pwd):/yocto --workdir=3D/workdir ghcr.io/crops/poky:=
ubuntu-22.04 /bin/bash -c "source /workdir/script.sh"

its possible that its executing in a fresh shell which is not
inheriting the environment. Maybe try to run steps outside the script.

>
>
> But I am getting following error when this step runs:
>
> WARNING: bitbake binary is not found in PATH, did you source the script?
> ERROR: Execution of event handler 'defaultcheck_sanity_eventhandler' fail=
ed
> Traceback (most recent call last):
> File "/workdir/poky/meta/classes-global/sanity.bbclass", line 1025, in de=
faultcheck_sanity_eventhandler(e=3D<bb.event.SanityCheck object at 0x7f7495=
a4cca0>, d=3D<bb.data_smart.DataSmart object at 0x7f74959d6a40>):
> sanity_data =3D bb.data.createCopy(e.data)
> > check_sanity(sanity_data)
> if e.generateevents:
> File "/workdir/poky/meta/classes-global/sanity.bbclass", line 996, in che=
ck_sanity(sanity_data=3D<bb.data_smart.DataSmart object at 0x7f7495a4cf10>)=
:
> if last_sanity_version < sanity_version or last_nativelsbstr !=3D nativel=
sbstr:
> > check_sanity_version_change(status, sanity_data)
> status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
> File "/workdir/poky/meta/classes-global/sanity.bbclass", line 702, in che=
ck_sanity_version_change(status=3D<SanityStatus object at 0x7f7495a4db10>, =
d=3D<bb.data_smart.DataSmart object at 0x7f7495a4cf10>):
> for bin_cmd in suid_check_bins:
> > bin_path =3D bb.utils.which(os.environ["PATH"], bin_cmd)
> if bin_path:
> File "/usr/lib/python3.10/os.py", line 680, in _Environ.__getitem__(key=
=3D'PATH'):
> # raise KeyError with the original key value
> > raise KeyError(key) from None
> return self.decodevalue(value)
> KeyError: 'PATH'
> ERROR: Command execution failed: Traceback (most recent call last):
> File "/workdir/poky/bitbake/lib/bb/command.py", line 122, in runAsyncComm=
and
> self.cooker.updateCache()
> File "/workdir/poky/bitbake/lib/bb/cooker.py", line 1606, in updateCache
> bb.event.fire(bb.event.SanityCheck(False), self.databuilder.mcdata[mc])
> File "/workdir/poky/bitbake/lib/bb/event.py", line 225, in fire
> fire_class_handlers(event, d)
> File "/workdir/poky/bitbake/lib/bb/event.py", line 132, in fire_class_han=
dlers
> execute_handler(name, handler, event, d)
> File "/workdir/poky/bitbake/lib/bb/event.py", line 103, in execute_handle=
r
> ret =3D handler(event, d)
> File "/workdir/poky/meta/classes-global/sanity.bbclass", line 1025, in de=
faultcheck_sanity_eventhandler
> check_sanity(sanity_data)
> File "/workdir/poky/meta/classes-global/sanity.bbclass", line 996, in che=
ck_sanity
> check_sanity_version_change(status, sanity_data)
> File "/workdir/poky/meta/classes-global/sanity.bbclass", line 702, in che=
ck_sanity_version_change
> bin_path =3D bb.utils.which(os.environ["PATH"], bin_cmd)
> File "/usr/lib/python3.10/os.py", line 680, in __getitem__
> raise KeyError(key) from None
> KeyError: 'PATH'
> Summary: There was 1 WARNING message.
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
>
> I have confirmed by adding "echo $PATH" before image starts that PATH env=
ironment variable exists and bitbake is in the path:
>
> /workdir/poky/scripts:/workdir/poky/bitbake/bin:/usr/local/sbin:/usr/loca=
l/bin:/usr/sbin:/usr/bin:/sbin:/bin
>
>
> But if I run the step as it is in my host machine, docker container is ab=
le to build the image.
>
> Any suggestions on what could be wrong here?
>
> thanks
> Ankur
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114196): https://lists.openembedded.org/g/openembedde=
d-devel/message/114196
> Mute This Topic: https://lists.openembedded.org/mt/109916860/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

