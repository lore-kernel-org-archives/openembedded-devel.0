Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778E1C47DDF
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 03:33:05 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.3580.1705980783913124569
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 19:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JaSctTf9;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc21d7a7042so3186715276.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 19:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705980783; x=1706585583; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8cQKf92xs2/pXO7p/P97nBPDfkKMs9u/Vbl+HJ9MM2E=;
        b=JaSctTf9RTTQ4P2vN3WgQEM4enTThL39J/KYuHhqB0WYHJhcDg16Tq3be9/LXpXxHJ
         4Tx9oikcaB0yzcbz0pfdFksA2BI14m+gE+5wPMUSK6JziEM7CdZBZt0ZFaATs6QqDM7t
         RXw0MOiFj4pasvF/gTGOMFDSBSC4Xqx0M0KUWpcYMf9XdHhz4HzHLwnv5ADSJGelbF2p
         PLqRk9seGJA5NMBAuQPW/VxQ5ojl30p8Rgs6LpWC8h6kpFGeqFv1BEC6cyAQqlZz3NBj
         WrRWm2TyjwIEUu+PMrooMWwTWsakhK8E3y+QquaB5Glj2PL5onmVBbZCEo1BgEg5BMyu
         Z4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705980783; x=1706585583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cQKf92xs2/pXO7p/P97nBPDfkKMs9u/Vbl+HJ9MM2E=;
        b=bQjDo5YqA6kHKt1y1GFtNobbodHyI1kBPOGleZqajlC1GuYbrnd3g7xed4onwnCloj
         7uVYdb8fF53mNhsLKP6vOIqgGKSBQWM4vpBTgiQKSMu2jYI1cfArgxVhBhhbICQciKYv
         2ZIZxvXv185EoZbxuDYLdWDTmI3T2w/scg3jGOWtkArhJUyG6WpZ9TpRgr4BIdTtWn9n
         br+Xj/tgaMFZJWMwUaLkyZ2iCF67TbQE6DDIlqxJET3K6e35BWdcIdvix7f0tnmLjqhD
         opo1Gk7XT+jEYE1GUQruGtl+pu+2RhlAjlZsMrYKVnxWZmxe44qljRfABSdGTu6wNDAS
         q5aQ==
X-Gm-Message-State: AOJu0YzhW689N17aXquo42IADJTPLVMqdGPg56cEylE2KC3rIG28XSey
	SL4y3ZaycVIA0oo78vcEAOf3h/kanTjGBQNpdZFdtPDMaMFNbcjKW9yWIU4MU3UiLp3zTrFG8nK
	eVH1kGLzM8IxXOKDgQCgdm76w2XA=
X-Google-Smtp-Source: AGHT+IFr5T5wJ6eww2Bf7jwis3NgH4t8BifwftwRBZQiLp9IfjKQ8pKsWUi+KVT5a5DwP7gmVHhaqLD6I+ZmWcUdzcY=
X-Received: by 2002:a5b:941:0:b0:dc2:3af4:3ff4 with SMTP id
 x1-20020a5b0941000000b00dc23af43ff4mr2969191ybq.52.1705980782910; Mon, 22 Jan
 2024 19:33:02 -0800 (PST)
MIME-Version: 1.0
References: <HwKj.1705904669013507737.KXJd@lists.openembedded.org>
 <CAMKF1sqSeAJO=dgxjJJsF+qvZK1YkpRMZ2PJ9fUCK30cB3996Q@mail.gmail.com> <TYWPR01MB11861F5DF79157AE6558754A4DC742@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861F5DF79157AE6558754A4DC742@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 22 Jan 2024 19:32:51 -0800
Message-ID: <CANx9H-AGVrAkoOT+9gCS-7OGZffNS2uxs7+EQ7ybTXge4s9h7w@mail.gmail.com>
Subject: Re: [oe] Add python3-apscheduler #error
To: wangmy <wangmy@fujitsu.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"p35420102@gmail.com" <p35420102@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008f21cf060f949ac1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 03:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108432

--0000000000008f21cf060f949ac1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This project uses setuptools.build_meta:
https://github.com/agronholm/apscheduler/blob/master/pyproject.toml#L6

Instead of =E2=80=9Cinherit setuptools3=E2=80=9D please use =E2=80=9Cinheri=
t
python_setuptools_build_meta=E2=80=9D
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/python_setuptool=
s_build_meta.bbclass

If you had used =E2=80=9Cdevtool add=E2=80=9D it would have detected this.

On Mon, Jan 22, 2024 at 6:23=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:

> I tried DEPENDS +=3D "python3-pip-native", but there is an error:
>
> | ERROR Missing dependencies:
> |       setuptools_scm
>
> If I tried
> DEPENDS +=3D "python3-pip-native \
>             python3-setuptools-scm-native"
> the compile succeeded.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,
> Nanjing, 210
> <https://www.google.com/maps/search/ST)+No.+6+Wenzhu+Road,+Nanjing,+210?e=
ntry=3Dgmail&source=3Dg>012,
> China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org
> > <openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: Tuesday, January 23, 2024 8:24 AM
> > To: p35420102@gmail.com
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] Add python3-apscheduler #error
> >
> > can you try adding
> >
> > DEPENDS +=3D "python3-pip-native"
> >
> > On Mon, Jan 22, 2024 at 2:04=E2=80=AFPM <p35420102@gmail.com> wrote:
> > >
> > > SUMMARY =3D "In-process task scheduler with Cron-like capabilities"
> > > HOMEPAGE =3D "https://github.com/agronholm/apscheduler"
> > >
> > > SECTION =3D "devel/python"
> > >
> > > LICENSE =3D "MIT"
> > > LIC_FILES_CHKSUM =3D
> > "file://LICENSE.txt;md5=3Df0e423eea5c91e7aa21bdb70184b3e53"
> > >
> > > PYPI_PACKAGE =3D "APScheduler"
> > >
> > > SRC_URI[sha256sum] =3D
> > "e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08f0744a96d4bd4cef4a"
> > >
> > > RDEPENDS:${PN} +=3D "\
> > > python3-six \
> > > python3-pytz \
> > > python3-tzlocal \
> > > "
> > >
> > > inherit pypi setuptools3
> > >
> > > ERROR: python3-apscheduler-3.10.4-r0 do_compile: 'python3 setup.py
> > bdist_wheel ' execution failed.
> > > ERROR: python3-apscheduler-3.10.4-r0 do_compile:
> > > ExecutionError('/home/iot-yocto/build/tmp/work/armv8a-poky-linux/pyth=
o
> > > n3-apscheduler/3.10.4-r0/temp/run.do_compile.531694', 1, None, None)
> > > ERROR: Logfile of failure stored in:
> > > /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/=
3
> > > .10.4-r0/temp/log.do_compile.531694
> > > Log data follows:
> > > | DEBUG: Executing shell function do_compile
> > > |
> > /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.=
10
> >
> .4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/d=
ist.py:
> > 720: UserWarning: Usage of dash-separated 'upload-dir' will not be
> supported in
> > future versions. Please use the underscore name 'upload_dir' instead
> > > |   warnings.warn(
> > > |
> > /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.=
10
> >
> .4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/i=
nstalle
> > r.py:27: SetuptoolsDeprecationWarning: setuptools.installer is
> deprecated.
> > Requirements should be satisfied by a PEP 517 installer.
> > > |   warnings.warn(
> > > | /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apschedule=
r
> > > | /3.10.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3: No
> > module named pip Traceback (most recent call last):
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/=
install
> > er.py", line 82, in fetch_build_egg
> > > |     subprocess.check_call(cmd)
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> > 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess.py", line
> 369, in
> > check_call
> > > |     raise CalledProcessError(retcode, cmd)
> > > | subprocess.CalledProcessError: Command
> >
> '['/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> > 0.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m',
> 'pip',
> > '--disable-pip-version-check', 'wheel', '--no-deps', '-w',
> '/tmp/tmpmh5cnujt',
> > '--quiet', 'setuptools_scm']' returned non-zero exit status 1.
> > > |
> > > | The above exception was the direct cause of the following exception=
:
> > > |
> > > | Traceback (most recent call last):
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> > 0.4-r0/APScheduler-3.10.4/setup.py", line 10, in <module>
> > > |     setup(
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/=
__init
> > __.py", line 152, in setup
> > > |     _install_setup_requires(attrs)
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/=
__init
> > __.py", line 147, in _install_setup_requires
> > > |     dist.fetch_build_eggs(dist.setup_requires)
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/=
dist.p
> > y", line 809, in fetch_build_eggs
> > > |     resolved_dists =3D pkg_resources.working_set.resolve(
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_resourc=
es/_
> > _init__.py", line 771, in resolve
> > > |     dist =3D best[req.key] =3D env.best_match(
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_resourc=
es/_
> > _init__.py", line 1056, in best_match
> > > |     return self.obtain(req, installer)
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_resourc=
es/_
> > _init__.py", line 1068, in obtain
> > > |     return installer(requirement)
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/=
dist.p
> > y", line 880, in fetch_build_egg
> > > |     return fetch_build_egg(self, req)
> > > |   File
> > "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> >
> 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/=
install
> > er.py", line 84, in fetch_build_egg
> > > |     raise DistutilsError(str(e)) from e
> > > | distutils.errors.DistutilsError: Command
> >
> '['/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.1
> > 0.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m',
> 'pip',
> > '--disable-pip-version-check', 'wheel', '--no-deps', '-w',
> '/tmp/tmpmh5cnujt',
> > '--quiet', 'setuptools_scm']' returned non-zero exit status 1.
> > > | ERROR: 'python3 setup.py bdist_wheel ' execution failed.
> > > | WARNING: exit code 1 from a shell command.
> > > ERROR: Task
> > (/home/iot-yocto/src/poky/../meta-openembedded/meta-python/recipes-devt=
o
> > ols/python/python3-apscheduler_3.10.4.bb:do_compile) failed with exit
> code '1'
> > > NOTE: Tasks Summary: Attempted 7610 tasks of which 7603 didn't need t=
o
> be
> > rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >
> > > /home/iot-yocto/src/poky/../meta-openembedded/meta-python/recipes-dev=
t
> > > ools/python/python3-apscheduler_3.10.4.bb:do_compile
> > > Summary: There was 1 WARNING message.
> > > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108431):
> https://lists.openembedded.org/g/openembedded-devel/message/108431
> Mute This Topic: https://lists.openembedded.org/mt/103897332/924729
> Mute #error:
> https://lists.openembedded.org/g/openembedded-devel/mutehashtag/error
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008f21cf060f949ac1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">This project uses setuptools.build_meta:</div><div d=
ir=3D"auto"><div><a href=3D"https://github.com/agronholm/apscheduler/blob/m=
aster/pyproject.toml#L6">https://github.com/agronholm/apscheduler/blob/mast=
er/pyproject.toml#L6</a></div><br></div><div dir=3D"auto">Instead of =E2=80=
=9Cinherit setuptools3=E2=80=9D please use =E2=80=9Cinherit python_setuptoo=
ls_build_meta=E2=80=9D</div><div dir=3D"auto"><div><a href=3D"https://git.y=
octoproject.org/poky/tree/meta/classes-recipe/python_setuptools_build_meta.=
bbclass">https://git.yoctoproject.org/poky/tree/meta/classes-recipe/python_=
setuptools_build_meta.bbclass</a></div><br></div><div dir=3D"auto">If you h=
ad used =E2=80=9Cdevtool add=E2=80=9D it would have detected this.</div></d=
iv><div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jan 22, 2024 at 6:23=E2=80=AFPM wangmy &lt;<a href=3D"mailto=
:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">I tried DEPENDS +=3D &quot;python3-pip-native&quot;=
, but there is an error:<br>
<br>
| ERROR Missing dependencies:<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0setuptools_scm<br>
<br>
If I tried <br>
DEPENDS +=3D &quot;python3-pip-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-setuptools-scm-native&quo=
t;<br>
the compile succeeded.<br>
<br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
Development Dept.I<br>
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FN<a href=3D"https://www.goo=
gle.com/maps/search/ST)+No.+6+Wenzhu+Road,+Nanjing,+210?entry=3Dgmail&amp;s=
ource=3Dg" target=3D"_blank">ST) No. 6 Wenzhu Road, Nanjing, 210</a>012, Ch=
ina<br>
TEL: +86+25-86630566-8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<a href=3D"http://www.fujitsu.com/cn/fnst/" rel=3D"noreferrer" target=3D"_b=
lank">http://www.fujitsu.com/cn/fnst/</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a>&gt; On Behalf Of=
 Khem Raj<br>
&gt; Sent: Tuesday, January 23, 2024 8:24 AM<br>
&gt; To: <a href=3D"mailto:p35420102@gmail.com" target=3D"_blank">p35420102=
@gmail.com</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] Add python3-apscheduler #error<br>
&gt; <br>
&gt; can you try adding<br>
&gt; <br>
&gt; DEPENDS +=3D &quot;python3-pip-native&quot;<br>
&gt; <br>
&gt; On Mon, Jan 22, 2024 at 2:04=E2=80=AFPM &lt;<a href=3D"mailto:p3542010=
2@gmail.com" target=3D"_blank">p35420102@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; SUMMARY =3D &quot;In-process task scheduler with Cron-like capabi=
lities&quot;<br>
&gt; &gt; HOMEPAGE =3D &quot;<a href=3D"https://github.com/agronholm/apsche=
duler" rel=3D"noreferrer" target=3D"_blank">https://github.com/agronholm/ap=
scheduler</a>&quot;<br>
&gt; &gt;<br>
&gt; &gt; SECTION =3D &quot;devel/python&quot;<br>
&gt; &gt;<br>
&gt; &gt; LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE.txt;md5=3Df0e423eea5c91e7aa21bdb70184b3e53&quot;<=
br>
&gt; &gt;<br>
&gt; &gt; PYPI_PACKAGE =3D &quot;APScheduler&quot;<br>
&gt; &gt;<br>
&gt; &gt; SRC_URI[sha256sum] =3D<br>
&gt; &quot;e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08f0744a96d4bd4cef4a=
&quot;<br>
&gt; &gt;<br>
&gt; &gt; RDEPENDS:${PN} +=3D &quot;\<br>
&gt; &gt; python3-six \<br>
&gt; &gt; python3-pytz \<br>
&gt; &gt; python3-tzlocal \<br>
&gt; &gt; &quot;<br>
&gt; &gt;<br>
&gt; &gt; inherit pypi setuptools3<br>
&gt; &gt;<br>
&gt; &gt; ERROR: python3-apscheduler-3.10.4-r0 do_compile: &#39;python3 set=
up.py<br>
&gt; bdist_wheel &#39; execution failed.<br>
&gt; &gt; ERROR: python3-apscheduler-3.10.4-r0 do_compile:<br>
&gt; &gt; ExecutionError(&#39;/home/iot-yocto/build/tmp/work/armv8a-poky-li=
nux/pytho<br>
&gt; &gt; n3-apscheduler/3.10.4-r0/temp/run.do_compile.531694&#39;, 1, None=
, None)<br>
&gt; &gt; ERROR: Logfile of failure stored in:<br>
&gt; &gt; /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apschedu=
ler/3<br>
&gt; &gt; .10.4-r0/temp/log.do_compile.531694<br>
&gt; &gt; Log data follows:<br>
&gt; &gt; | DEBUG: Executing shell function do_compile<br>
&gt; &gt; |<br>
&gt; /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.10<br>
&gt; .4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptool=
s/dist.py:<br>
&gt; 720: UserWarning: Usage of dash-separated &#39;upload-dir&#39; will no=
t be supported in<br>
&gt; future versions. Please use the underscore name &#39;upload_dir&#39; i=
nstead<br>
&gt; &gt; |=C2=A0 =C2=A0warnings.warn(<br>
&gt; &gt; |<br>
&gt; /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3=
.10<br>
&gt; .4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptool=
s/installe<br>
&gt; r.py:27: SetuptoolsDeprecationWarning: setuptools.installer is depreca=
ted.<br>
&gt; Requirements should be satisfied by a PEP 517 installer.<br>
&gt; &gt; |=C2=A0 =C2=A0warnings.warn(<br>
&gt; &gt; | /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsche=
duler<br>
&gt; &gt; | /3.10.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3=
: No<br>
&gt; module named pip Traceback (most recent call last):<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/install<br>
&gt; er.py&quot;, line 82, in fetch_build_egg<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0subprocess.check_call(cmd)<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess.py&quot;, l=
ine 369, in<br>
&gt; check_call<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0raise CalledProcessError(retcode, cmd)<br>
&gt; &gt; | subprocess.CalledProcessError: Command<br>
&gt; &#39;[&#39;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-ap=
scheduler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3&#39;, &#39=
;-m&#39;, &#39;pip&#39;,<br>
&gt; &#39;--disable-pip-version-check&#39;, &#39;wheel&#39;, &#39;--no-deps=
&#39;, &#39;-w&#39;, &#39;/tmp/tmpmh5cnujt&#39;,<br>
&gt; &#39;--quiet&#39;, &#39;setuptools_scm&#39;]&#39; returned non-zero ex=
it status 1.<br>
&gt; &gt; |<br>
&gt; &gt; | The above exception was the direct cause of the following excep=
tion:<br>
&gt; &gt; |<br>
&gt; &gt; | Traceback (most recent call last):<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/APScheduler-3.10.4/setup.py&quot;, line 10, in &lt;module&gt;<b=
r>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0setup(<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/__init<br>
&gt; __.py&quot;, line 152, in setup<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0_install_setup_requires(attrs)<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/__init<br>
&gt; __.py&quot;, line 147, in _install_setup_requires<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0dist.fetch_build_eggs(dist.setup_requires)<b=
r>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/dist.p<br>
&gt; y&quot;, line 809, in fetch_build_eggs<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0resolved_dists =3D pkg_resources.working_set=
.resolve(<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_reso=
urces/_<br>
&gt; _init__.py&quot;, line 771, in resolve<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0dist =3D best[req.key] =3D env.best_match(<b=
r>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_reso=
urces/_<br>
&gt; _init__.py&quot;, line 1056, in best_match<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0return self.obtain(req, installer)<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pkg_reso=
urces/_<br>
&gt; _init__.py&quot;, line 1068, in obtain<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0return installer(requirement)<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/dist.p<br>
&gt; y&quot;, line 880, in fetch_build_egg<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0return fetch_build_egg(self, req)<br>
&gt; &gt; |=C2=A0 =C2=A0File<br>
&gt; &quot;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apsched=
uler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptoo=
ls/install<br>
&gt; er.py&quot;, line 84, in fetch_build_egg<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0raise DistutilsError(str(e)) from e<br>
&gt; &gt; | distutils.errors.DistutilsError: Command<br>
&gt; &#39;[&#39;/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-ap=
scheduler/3.1<br>
&gt; 0.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3&#39;, &#39=
;-m&#39;, &#39;pip&#39;,<br>
&gt; &#39;--disable-pip-version-check&#39;, &#39;wheel&#39;, &#39;--no-deps=
&#39;, &#39;-w&#39;, &#39;/tmp/tmpmh5cnujt&#39;,<br>
&gt; &#39;--quiet&#39;, &#39;setuptools_scm&#39;]&#39; returned non-zero ex=
it status 1.<br>
&gt; &gt; | ERROR: &#39;python3 setup.py bdist_wheel &#39; execution failed=
.<br>
&gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt; &gt; ERROR: Task<br>
&gt; (/home/iot-yocto/src/poky/../meta-openembedded/meta-python/recipes-dev=
to<br>
&gt; ols/python/python3-apscheduler_3.10.4.bb:do_compile) failed with exit =
code &#39;1&#39;<br>
&gt; &gt; NOTE: Tasks Summary: Attempted 7610 tasks of which 7603 didn&#39;=
t need to be<br>
&gt; rerun and 1 failed.<br>
&gt; &gt;<br>
&gt; &gt; Summary: 1 task failed:<br>
&gt; &gt;<br>
&gt; &gt; /home/iot-yocto/src/poky/../meta-openembedded/meta-python/recipes=
-devt<br>
&gt; &gt; ools/python/python3-apscheduler_3.10.4.bb:do_compile<br>
&gt; &gt; Summary: There was 1 WARNING message.<br>
&gt; &gt; Summary: There were 2 ERROR messages, returning a non-zero exit c=
ode.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108431): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108431" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108431</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103897332/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103897332/924729</a><br>
Mute #error:<a href=3D"https://lists.openembedded.org/g/openembedded-devel/=
mutehashtag/error" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/mutehashtag/error</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div>

--0000000000008f21cf060f949ac1--

