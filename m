Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBD1C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 03:45:55 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.3765.1705981547828507860
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 19:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FCMHw1Xm;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-21428d99395so1051551fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 19:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705981547; x=1706586347; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fuk+Alx6A4JfCPH4XtFT639gymXxkw4fIqlIBVd4SpU=;
        b=FCMHw1XmT6HLDJu7O8DScJhuC8+qzduJb+DULxYHw1BdVRuwnfY82lE3PH+jwkj0en
         sPV8Crg2vvBBUU+H9cjsJxVkM9E1utd7+6SQ0ZB4qjXMlRXZ0IcO7hFkBj3ZSaJzPqbp
         r2NFALL5QuMmQ6H/Vc+edIQmeyQk0LBisOjUCVHjpZ8QS06DYgpf3ZveuMGDh8f5OE23
         usDRU5Z7cwsZsnskhyqgjSc1Xq5w49HI4EiBVPY2EGnYWCKppAH6NMdYN0SuZKav623L
         LZW26Vm+EfMTYPwmeKfH9lqL2X0MzAsZ5I2YheCokPfDc/KnM4S2QcDgSfFCBZro+xv1
         Vksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705981547; x=1706586347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fuk+Alx6A4JfCPH4XtFT639gymXxkw4fIqlIBVd4SpU=;
        b=HRAcpJr5nFWTfVGL0oa96ObtSDniNwi93WkBTm53EfW4dCxsFkC97Z9xT8KXftgaPf
         1T9r9k/Nx52+Fme7x/hZCjIrG5/Nft6ye5mgMaaO4ofF3LeLq+pkhiHY+HpEa+sd88yV
         aZJayW/VZe2gWEu7GlEFgdxllb3uOXX6jOuzI4JbpQMYaARPO+18KYCHc+WZaGd2Zosk
         zTB/n6Nt9S3AipnHdFEYB4QQR8Tco9OkGwgf+fXAUd+DW+cZjcslqCsRgmfEwtbVn92P
         RlJPXicFFB5/WtYis6+FA3Um+YRra+X5vcM/mckl0lrVF1IB7DmV+vNm2lVzIVePVYo1
         eFGA==
X-Gm-Message-State: AOJu0YzhAJQog8jwzFzTltwmQTNiMV+s6XDz1ZCWwXKbB4+tYb4YmjHR
	TxZM8FINMWc4dHwfprRxo2AupAfsg1wGntYk4iFINQVPZhV9zr/F/mi0TzqO3ca5V1jt8ho0Zs6
	KQIm2CsMCo0kCS78JGHJ0ExEY7Y8=
X-Google-Smtp-Source: AGHT+IHkKKWmPKZmqvxJAE+iHiIk1IcEmTvs3JMebhy5OPfolUlZTCb5ylMeJ1VRbXqMjaSXUdN9PZmotOUW06LMZac=
X-Received: by 2002:a05:6870:639f:b0:205:bcaf:279d with SMTP id
 t31-20020a056870639f00b00205bcaf279dmr390241oap.50.1705981546858; Mon, 22 Jan
 2024 19:45:46 -0800 (PST)
MIME-Version: 1.0
References: <HwKj.1705904669013507737.KXJd@lists.openembedded.org>
 <CAMKF1sqSeAJO=dgxjJJsF+qvZK1YkpRMZ2PJ9fUCK30cB3996Q@mail.gmail.com>
 <TYWPR01MB11861F5DF79157AE6558754A4DC742@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANx9H-AGVrAkoOT+9gCS-7OGZffNS2uxs7+EQ7ybTXge4s9h7w@mail.gmail.com>
In-Reply-To: <CANx9H-AGVrAkoOT+9gCS-7OGZffNS2uxs7+EQ7ybTXge4s9h7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jan 2024 19:45:20 -0800
Message-ID: <CAMKF1soSYy4s5Tr6iAZf3sEru2ATwnxNMygk=wddeGNtnwbmZw@mail.gmail.com>
Subject: Re: [oe] Add python3-apscheduler #error
To: Tim Orling <ticotimo@gmail.com>
Cc: wangmy <wangmy@fujitsu.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"p35420102@gmail.com" <p35420102@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 03:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108433

On Mon, Jan 22, 2024 at 7:33=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
> This project uses setuptools.build_meta:
> https://github.com/agronholm/apscheduler/blob/master/pyproject.toml#L6
>
> Instead of =E2=80=9Cinherit setuptools3=E2=80=9D please use =E2=80=9Cinhe=
rit python_setuptools_build_meta=E2=80=9D
> https://git.yoctoproject.org/poky/tree/meta/classes-recipe/python_setupto=
ols_build_meta.bbclass
>
> If you had used =E2=80=9Cdevtool add=E2=80=9D it would have detected this=
.
>

There is a patch here
https://lore.kernel.org/openembedded-devel/1705972804-25125-1-git-send-emai=
l-wangmy@fujitsu.com/T/#u
which does the right things. Its also staged in master-next atm.
Please try that.

> On Mon, Jan 22, 2024 at 6:23=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote=
:
>>
>> I tried DEPENDS +=3D "python3-pip-native", but there is an error:
>>
>> | ERROR Missing dependencies:
>> |       setuptools_scm
>>
>> If I tried
>> DEPENDS +=3D "python3-pip-native \
>>             python3-setuptools-scm-native"
>> the compile succeeded.
>>
>>   --
>> Best Regards
>> ---------------------------------------------------
>> Wang Mingyu
>> Development Dept.I
>> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, =
Nanjing, 210012, China
>> TEL: +86+25-86630566-8568
>> COINS: 79988548
>> FAX: +86+25-83317685
>> MAIL: wangmy@fujitsu.com
>> http://www.fujitsu.com/cn/fnst/
>>
>> > -----Original Message-----
>> > From: openembedded-devel@lists.openembedded.org
>> > <openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj
>> > Sent: Tuesday, January 23, 2024 8:24 AM
>> > To: p35420102@gmail.com
>> > Cc: openembedded-devel@lists.openembedded.org
>> > Subject: Re: [oe] Add python3-apscheduler #error
>> >
>> > can you try adding
>> >
>> > DEPENDS +=3D "python3-pip-native"
>> >
>> > On Mon, Jan 22, 2024 at 2:04=E2=80=AFPM <p35420102@gmail.com> wrote:
>> > >
>> > > SUMMARY =3D "In-process task scheduler with Cron-like capabilities"
>> > > HOMEPAGE =3D "https://github.com/agronholm/apscheduler"
>> > >
>> > > SECTION =3D "devel/python"
>> > >
>> > > LICENSE =3D "MIT"
>> > > LIC_FILES_CHKSUM =3D
>> > "file://LICENSE.txt;md5=3Df0e423eea5c91e7aa21bdb70184b3e53"
>> > >
>> > > PYPI_PACKAGE =3D "APScheduler"
>> > >
>> > > SRC_URI[sha256sum] =3D
>> > "e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08f0744a96d4bd4cef4a"
>> > >
>> > > RDEPENDS:${PN} +=3D "\
>> > > python3-six \
>> > > python3-pytz \
>> > > python3-tzlocal \
>> > > "
>> > >
>> > > inherit pypi setuptools3
>> > >
>> > > ERROR: python3-apscheduler-3.10.4-r0 do_compile: 'python3 setup.py
>> > bdist_wheel ' execution failed.
>> > > ERROR: python3-apscheduler-3.10.4-r0 do_compile:
>> > > ExecutionError('/home/iot-yocto/build/tmp/work/armv8a-poky-linux/pyt=
ho
>> > > n3-apscheduler/3.10.4-r0/temp/run.do_compile.531694', 1, None, None)
>> > > ERROR: Logfile of failure stored in:
>> > > /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler=
/3
>> > > .10.4-r0/temp/log.do_compile.531694
>> > > Log data follows:
>> > > | DEBUG: Executing shell function do_compile
>> > > |
>> > /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.10
>> > .4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptool=
s/dist.py:
>> > 720: UserWarning: Usage of dash-separated 'upload-dir' will not be sup=
ported in
>> > future versions. Please use the underscore name 'upload_dir' instead
>> > > |   warnings.warn(
>> > > |
>> > /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.10
>> > .4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptool=
s/installe
>> > r.py:27: SetuptoolsDeprecationWarning: setuptools.installer is depreca=
ted.
>> > Requirements should be satisfied by a PEP 517 installer.
>> > > |   warnings.warn(
>> > > | /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apschedul=
er
>> > > | /3.10.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3: N=
o
>> > module named pip Traceback (most recent call last):
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/install
>> > er.py", line 82, in fetch_build_egg
>> > > |     subprocess.check_call(cmd)
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess.py", line 3=
69, in
>> > check_call
>> > > |     raise CalledProcessError(retcode, cmd)
>> > > | subprocess.CalledProcessError: Command
>> > '['/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apschedule=
r/3.1
>> > 0.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'p=
ip',
>> > '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmpmh=
5cnujt',
>> > '--quiet', 'setuptools_scm']' returned non-zero exit status 1.
>> > > |
>> > > | The above exception was the direct cause of the following exceptio=
n:
>> > > |
>> > > | Traceback (most recent call last):
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/APScheduler-3.10.4/setup.py", line 10, in <module>
>> > > |     setup(
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/__init
>> > __.py", line 152, in setup
>> > > |     _install_setup_requires(attrs)
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/__init
>> > __.py", line 147, in _install_setup_requires
>> > > |     dist.fetch_build_eggs(dist.setup_requires)
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/dist.p
>> > y", line 809, in fetch_build_eggs
>> > > |     resolved_dists =3D pkg_resources.working_set.resolve(
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_reso=
urces/_
>> > _init__.py", line 771, in resolve
>> > > |     dist =3D best[req.key] =3D env.best_match(
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_reso=
urces/_
>> > _init__.py", line 1056, in best_match
>> > > |     return self.obtain(req, installer)
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_reso=
urces/_
>> > _init__.py", line 1068, in obtain
>> > > |     return installer(requirement)
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/dist.p
>> > y", line 880, in fetch_build_egg
>> > > |     return fetch_build_egg(self, req)
>> > > |   File
>> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3.1
>> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/install
>> > er.py", line 84, in fetch_build_egg
>> > > |     raise DistutilsError(str(e)) from e
>> > > | distutils.errors.DistutilsError: Command
>> > '['/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apschedule=
r/3.1
>> > 0.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'p=
ip',
>> > '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmpmh=
5cnujt',
>> > '--quiet', 'setuptools_scm']' returned non-zero exit status 1.
>> > > | ERROR: 'python3 setup.py bdist_wheel ' execution failed.
>> > > | WARNING: exit code 1 from a shell command.
>> > > ERROR: Task
>> > (/home/iot-yocto/src/poky/../meta-openembedded/meta-python/recipes-dev=
to
>> > ols/python/python3-apscheduler_3.10.4.bb:do_compile) failed with exit =
code '1'
>> > > NOTE: Tasks Summary: Attempted 7610 tasks of which 7603 didn't need =
to be
>> > rerun and 1 failed.
>> > >
>> > > Summary: 1 task failed:
>> > >
>> > > /home/iot-yocto/src/poky/../meta-openembedded/meta-python/recipes-de=
vt
>> > > ools/python/python3-apscheduler_3.10.4.bb:do_compile
>> > > Summary: There was 1 WARNING message.
>> > > Summary: There were 2 ERROR messages, returning a non-zero exit code=
.
>> > >
>> > >
>> > >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#108431): https://lists.openembedded.org/g/openembedd=
ed-devel/message/108431
>> Mute This Topic: https://lists.openembedded.org/mt/103897332/924729
>> Mute #error:https://lists.openembedded.org/g/openembedded-devel/mutehash=
tag/error
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

