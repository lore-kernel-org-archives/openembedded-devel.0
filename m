Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C33DC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 00:24:14 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.10230.1705969451951636571
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 16:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g3zfyhef;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21429ac4dc9so1167623fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 16:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705969451; x=1706574251; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRsE7cmg97uleUl2mRM/8UN7hI/CH0vHVFBFVt9RoOI=;
        b=g3zfyhefmdl2T3oiIVlO7Mz3pVgFPQthG9PuKcpAxjRku7KvBLdc950oUAkMU33utP
         eG+B300koesWDZJn6Zx9JbY5MC88iC4KMHqXDddzOKr+AvEDMEXB5LeDmNU/5I2okOGA
         WIKLFem+MCpsHEv41Z5P8LhZXU3LtmYQ/WxVWLKrCRTdBO4z0HtceWzczqRrZETKWeRp
         7Gbbhj7dI02uqbJsKtCgK29w7Q1UmJwwZs18T2Rr5LSHSbdbLiTIl+z7JD2DkZw+03EI
         Jwn9e2h5h+GhV9lF2UT4YowcR9So/q12ku/S2/4GWrDh+hUfNNkQ8BJlHERduvrbZ++Z
         qTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705969451; x=1706574251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRsE7cmg97uleUl2mRM/8UN7hI/CH0vHVFBFVt9RoOI=;
        b=NGmMpdbiXeBAwcIQcbY4GCr++kYgF/vWFsZ3SJq60FJIe6/RNlE0r9fAfoK9ZL9DSy
         i/V32EfRmtraWz97MUnAtnvAGCnPXAZqTvzTSiS+ijpxHNLo7Tx+3eFsi6NPbJhjNxxS
         urS586/fA4mF8ZngWBMmGVFcNYr+76rjIUunSZerotJq/QbuUQF9z2FJvuwjukWpB9zP
         Elx3HBj65jXh5obrCCYM9avvb8GefnnbGC9yTyx/Kt3AZa9ehdCKTgZxg3tcCJ150Kg0
         c3ViGg1xRPHkKxoNLK57pCGbwuWszgbV3o7TOxqnBaSzLk3qFu9H8A6R2UJTvHzMwOMR
         gvzg==
X-Gm-Message-State: AOJu0Yxkm+gSfGJMacbinaGJwub+dBnWJ4yrU0bvOx4yvGLcoE6ZfcEM
	tkZ9ecHBzQbLWnU9PbhttbR8HKJgD+W6OiZF7sqQ6dRtfFJwDRf2iQ4jHzbey1gdu1CYV2t0jT2
	vEoEZxr1CWoNK9pR4NuN8TFynhrM=
X-Google-Smtp-Source: AGHT+IFqZfldjfksoA6ac03Q+4oMqb/eNKbN2sE4Wot02f52PnhiuTWpVP3zsnRLM99E26UUNbQTgJNUsIMGs/5O+3Q=
X-Received: by 2002:a05:6870:41d5:b0:210:90ab:a600 with SMTP id
 z21-20020a05687041d500b0021090aba600mr317973oac.27.1705969451059; Mon, 22 Jan
 2024 16:24:11 -0800 (PST)
MIME-Version: 1.0
References: <HwKj.1705904669013507737.KXJd@lists.openembedded.org>
In-Reply-To: <HwKj.1705904669013507737.KXJd@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jan 2024 16:23:45 -0800
Message-ID: <CAMKF1sqSeAJO=dgxjJJsF+qvZK1YkpRMZ2PJ9fUCK30cB3996Q@mail.gmail.com>
Subject: Re: [oe] Add python3-apscheduler #error
To: p35420102@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 00:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108377

can you try adding

DEPENDS +=3D "python3-pip-native"

On Mon, Jan 22, 2024 at 2:04=E2=80=AFPM <p35420102@gmail.com> wrote:
>
> SUMMARY =3D "In-process task scheduler with Cron-like capabilities"
> HOMEPAGE =3D "https://github.com/agronholm/apscheduler"
>
> SECTION =3D "devel/python"
>
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df0e423eea5c91e7aa21bdb7018=
4b3e53"
>
> PYPI_PACKAGE =3D "APScheduler"
>
> SRC_URI[sha256sum] =3D "e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08f07=
44a96d4bd4cef4a"
>
> RDEPENDS:${PN} +=3D "\
> python3-six \
> python3-pytz \
> python3-tzlocal \
> "
>
> inherit pypi setuptools3
>
> ERROR: python3-apscheduler-3.10.4-r0 do_compile: 'python3 setup.py bdist_=
wheel ' execution failed.
> ERROR: python3-apscheduler-3.10.4-r0 do_compile: ExecutionError('/home/io=
t-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.10.4-r0/temp=
/run.do_compile.531694', 1, None, None)
> ERROR: Logfile of failure stored in: /home/iot-yocto/build/tmp/work/armv8=
a-poky-linux/python3-apscheduler/3.10.4-r0/temp/log.do_compile.531694
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.=
10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/d=
ist.py:720: UserWarning: Usage of dash-separated 'upload-dir' will not be s=
upported in future versions. Please use the underscore name 'upload_dir' in=
stead
> |   warnings.warn(
> | /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.=
10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/i=
nstaller.py:27: SetuptoolsDeprecationWarning: setuptools.installer is depre=
cated. Requirements should be satisfied by a PEP 517 installer.
> |   warnings.warn(
> | /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.=
10.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3: No module nam=
ed pip
> | Traceback (most recent call last):
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setu=
ptools/installer.py", line 82, in fetch_build_egg
> |     subprocess.check_call(cmd)
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess.py", li=
ne 369, in check_call
> |     raise CalledProcessError(retcode, cmd)
> | subprocess.CalledProcessError: Command '['/home/iot-yocto/build/tmp/wor=
k/armv8a-poky-linux/python3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr=
/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', '=
wheel', '--no-deps', '-w', '/tmp/tmpmh5cnujt', '--quiet', 'setuptools_scm']=
' returned non-zero exit status 1.
> |
> | The above exception was the direct cause of the following exception:
> |
> | Traceback (most recent call last):
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/APScheduler-3.10.4/setup.py", line 10, in <module>
> |     setup(
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setu=
ptools/__init__.py", line 152, in setup
> |     _install_setup_requires(attrs)
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setu=
ptools/__init__.py", line 147, in _install_setup_requires
> |     dist.fetch_build_eggs(dist.setup_requires)
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setu=
ptools/dist.py", line 809, in fetch_build_eggs
> |     resolved_dists =3D pkg_resources.working_set.resolve(
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_=
resources/__init__.py", line 771, in resolve
> |     dist =3D best[req.key] =3D env.best_match(
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_=
resources/__init__.py", line 1056, in best_match
> |     return self.obtain(req, installer)
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_=
resources/__init__.py", line 1068, in obtain
> |     return installer(requirement)
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setu=
ptools/dist.py", line 880, in fetch_build_egg
> |     return fetch_build_egg(self, req)
> |   File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setu=
ptools/installer.py", line 84, in fetch_build_egg
> |     raise DistutilsError(str(e)) from e
> | distutils.errors.DistutilsError: Command '['/home/iot-yocto/build/tmp/w=
ork/armv8a-poky-linux/python3-apscheduler/3.10.4-r0/recipe-sysroot-native/u=
sr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check',=
 'wheel', '--no-deps', '-w', '/tmp/tmpmh5cnujt', '--quiet', 'setuptools_scm=
']' returned non-zero exit status 1.
> | ERROR: 'python3 setup.py bdist_wheel ' execution failed.
> | WARNING: exit code 1 from a shell command.
> ERROR: Task (/home/iot-yocto/src/poky/../meta-openembedded/meta-python/re=
cipes-devtools/python/python3-apscheduler_3.10.4.bb:do_compile) failed with=
 exit code '1'
> NOTE: Tasks Summary: Attempted 7610 tasks of which 7603 didn't need to be=
 rerun and 1 failed.
>
> Summary: 1 task failed:
>   /home/iot-yocto/src/poky/../meta-openembedded/meta-python/recipes-devto=
ols/python/python3-apscheduler_3.10.4.bb:do_compile
> Summary: There was 1 WARNING message.
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108376): https://lists.openembedded.org/g/openembedde=
d-devel/message/108376
> Mute This Topic: https://lists.openembedded.org/mt/103897332/1997914
> Mute #error:https://lists.openembedded.org/g/openembedded-devel/mutehasht=
ag/error
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

