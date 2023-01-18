Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992A2C38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:44:04 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.18937.1674056641087019829
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jan 2023 07:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JpadfxkI;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id l139so38548026ybl.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WN5tt2lz+jpia0v8vLUS+BJexe5jyWMb5HPIGc4L+FM=;
        b=JpadfxkI+1lX4lloPaFDURR2v6F0g4bkMeww3iVwwhqZSLXTpit8LNvPh43b/PZbmG
         wNfsiDaSGs5O4mVI0tWcO/qw+qvYLY6ZThGx6ZJS9rikqRioao++yp2srsWYZvP1gmVu
         d/KiRWqrpCkSs+ikqkDRhRIHtP74DMCcHSGtlbhSKuxHUPEgW71AgxvUdOGCSeVPWMfw
         aXFTpoxyaQRnn/Vws2XsKQlMblJIEuOHjTaY+7wKWU6nTXqUYZj20LHgrfMKbqegZFiL
         98WqWGxog4NcnUtuxMpwFOSmgSo4DjItNffjPEOGnVqJ1+w1ZTeZS9h3KQp4bDID2rkn
         JC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN5tt2lz+jpia0v8vLUS+BJexe5jyWMb5HPIGc4L+FM=;
        b=Jc8XkuJl7tHAmnUVJ57R1xNwzsj23209ZGu6qLcIiW/PyI5QINIuNyKOyssEsyKINM
         zEyQU5+KyRtR2l6KwlGLQ74X7i3o+hB+ZS8OGPBGqMRg1GQ0liIRkCop4BQEnvH8vuTD
         LhhUqxEGtXD8rKRpjiXviQtAazhv84E4oGLEbynF2rZVpGBALR7MOV85ulbMpfN+uuL8
         6W1alBiWTWApz4hvl+9HDBaMbevemqpPkOgTz7d72DBTK74PCLsKcDCbWlqaECNEhTUe
         yxT9Okzuhcnv2JkoZXCpF2NXpghYzKADYV2ONlELgGullX29wLbPgk7C6nqlbUS5wzjC
         BYxg==
X-Gm-Message-State: AFqh2koCw2K1CS1QwxdJzgU1Bq4GV753/psTNfMR0WxHKPdbebmZzr1J
	FtKvyhVZx9EPiJz8/Nt46WsaMwnvy4lHUalqgrY=
X-Google-Smtp-Source: AMrXdXsRq63NcMhnR8rnJipGOT4C76toH3bB2oaSsmkidSBpxMTbTs7bjTEWIw0SoFnUEGgRrl1KtSeb+2o3dJtfKx8=
X-Received: by 2002:a25:ac8d:0:b0:70c:afcd:ef4c with SMTP id
 x13-20020a25ac8d000000b0070cafcdef4cmr869093ybi.273.1674056639908; Wed, 18
 Jan 2023 07:43:59 -0800 (PST)
MIME-Version: 1.0
References: <OiM6.1673818791556733074.T0ut@lists.openembedded.org>
 <HKRJOR.GVPO6JMFGBGT1@t-online.de> <9FED42D9-734A-4481-9B34-003FCF582B2C@arm.com>
 <815a59a5-19f4-2fc3-0f1d-646c80b8379c@ffrnk.de> <173B454E7C64E7D4.24231@lists.openembedded.org>
In-Reply-To: <173B454E7C64E7D4.24231@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 18 Jan 2023 07:43:48 -0800
Message-ID: <CANx9H-DWi42pb7aEuQ-JUCCvA9roMXrbFupbYrnAQf480g_3iA@mail.gmail.com>
Subject: Re: [oe] [meta-python] Build recipe with pypa/build
To: ticotimo@gmail.com
Cc: Florian Frank <ffrank.os@ffrnk.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005b12ee05f28baff8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 15:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100651

--0000000000005b12ee05f28baff8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 6:11 PM Tim Orling via lists.openembedded.org
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Tue, Jan 17, 2023 at 12:02 PM Florian Frank <ffrank.os@ffrnk.de> wrote=
:
>
>> On 16 Jan 2023, at 13:24, Ross Burton wrote:
>> > On 15 Jan 2023, at 21:55, Markus Volk via lists.openembedded.org
>> <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>> >>
>> >> You can try to 'inherit python_setuptools_build_meta' for your recipe
>> >
>> > This is the correct solution.  The recipe uses pyproject.toml and
>> setuptools, so you can just inherit setuptools_build_meta (which will th=
en
>> use build).
>>
>> Thanks for your responses. That was my first approach (and I should have
>> mentioned the results already in the first message), but it did not
>> generate the wheel correctly. Instead I see this in the do_compile log:
>>
>> >  > DEBUG: Executing shell function do_compile
>> > running bdist_wheel
>> > running build
>> > installing to build/bdist.linux-x86_64/wheel
>> > running install
>> > running install_egg_info
>> > running egg_info
>> > creating UNKNOWN.egg-info
>> > writing UNKNOWN.egg-info/PKG-INFO
>> > writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
>> > writing top-level names to UNKNOWN.egg-info/top_level.txt
>> > writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>> > listing git files failed - pretending there aren't any
>> > reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>> > adding license file 'LICENSE'
>> > writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>> > Copying UNKNOWN.egg-info to
>> build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0-py3.10.egg-info
>> > running install_scripts
>> > adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
>> > creating build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0.dist-info/WHEEL
>> > creating
>> '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-poky-linux-m=
usleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/tmpj7vto26b/=
UNKNOWN-0.0.0-py3-none-any.whl'
>> and adding 'build/bdist.linux-x86_64/wheel' to it
>> > adding 'UNKNOWN-0.0.0.dist-info/LICENSE'
>> > adding 'UNKNOWN-0.0.0.dist-info/METADATA'
>> > adding 'UNKNOWN-0.0.0.dist-info/WHEEL'
>> > adding 'UNKNOWN-0.0.0.dist-info/top_level.txt'
>> > adding 'UNKNOWN-0.0.0.dist-info/RECORD'
>> > removing build/bdist.linux-x86_64/wheel
>> > DEBUG: Shell function do_compile finished
>>
>> Similarly, the installed files are missing any source files:
>>
>> tree
>>
>> tmp/work/arm1176jzfshf-vfp-poky-linux-musleabi/python3-adafruit-circuitp=
ython-busdevice/5.2.3-r0/image/
>> >
>> tmp/work/arm1176jzfshf-vfp-poky-linux-musleabi/python3-adafruit-circuitp=
ython-busdevice/5.2.3-r0/image/
>> > =E2=94=94=E2=94=80=E2=94=80 usr
>> >     =E2=94=94=E2=94=80=E2=94=80 lib
>> >         =E2=94=94=E2=94=80=E2=94=80 python3.10
>> >             =E2=94=94=E2=94=80=E2=94=80 site-packages
>> >                 =E2=94=94=E2=94=80=E2=94=80 UNKNOWN-0.0.0.dist-info
>> >                     =E2=94=9C=E2=94=80=E2=94=80 LICENSE
>> >                     =E2=94=9C=E2=94=80=E2=94=80 METADATA
>> >                     =E2=94=9C=E2=94=80=E2=94=80 RECORD
>> >                     =E2=94=9C=E2=94=80=E2=94=80 WHEEL
>> >                     =E2=94=94=E2=94=80=E2=94=80 top_level.txt
>>
>> It seems something is still missing but from looking at other recipes
>> inheriting from pypi and python_setuptools_build_meta I don't see
>> anything else I should add.
>>
>>
> This works fine on master/mickledore, but the root cause is the lack of
> PEP-621 support in setuptools 59.5.0 in kirkstone.
> See https://github.com/pypa/setuptools/issues/3269#issuecomment-125450737=
7
>
> The fix appears to be adding the following (at a minimum) to a setup.cfg
> file:
> [metadata]
> name =3D adafruit_circuitpython_busdevice
> version =3D 5.2.3
>
> See https://setuptools.pypa.io/en/latest/userguide/declarative_config.htm=
l
> for more options
>
> This wasn't enough to package the .py files... something more like:
[metadata]
name =3D adafruit_circuitpython_busdevice
description =3D "CircuitPython bus device classes to manage bus sharing."
version =3D 5.2.3
readme =3D "README.rst"
author =3D "Adafruit Industries"
author_email =3D "circuitpython@adafruit.com"
project_urls =3D {Homepage =3D "
https://github.com/adafruit/Adafruit_CircuitPython_BusDevice"}
keywords =3D "adafruit", "spi", "i2c", "bus", "device", "micropython",
"circuitpython"
license =3D {text =3D "MIT"}
classifiers =3D
    "Intended Audience :: Developers",
    "Topic :: Software Development :: Libraries",
    "Topic :: Software Development :: Embedded Systems",
    "Topic :: System :: Hardware",
    "License :: OSI Approved :: MIT License",
    "Programming Language :: Python :: 3",
dynamic =3D ["dependencies", "optional-dependencies"]

[options]
packages =3D find:


> The other option would be to fall back to the 5.2.0 release and "inherit
> pypi setuptools3" which will also happily build a wheel.
> The 5.2.0 release was before the switch to pyproject.toml.
>
>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100642):
> https://lists.openembedded.org/g/openembedded-devel/message/100642
> Mute This Topic: https://lists.openembedded.org/mt/96294851/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005b12ee05f28baff8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 17, 2023 at 6:11 PM Tim O=
rling via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Jan 17, 2023 at 12:02 PM Florian Frank &=
lt;<a href=3D"mailto:ffrank.os@ffrnk.de" target=3D"_blank">ffrank.os@ffrnk.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 16 Jan 2023, at 13:24, Ross Burton wrote:<br>
&gt; On 15 Jan 2023, at 21:55, Markus Volk via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org" target=
=3D"_blank">t-online.de@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; You can try to &#39;inherit python_setuptools_build_meta&#39; for =
your recipe<br>
&gt; <br>
&gt; This is the correct solution.=C2=A0 The recipe uses pyproject.toml and=
 setuptools, so you can just inherit setuptools_build_meta (which will then=
 use build).<br>
<br>
Thanks for your responses. That was my first approach (and I should have <b=
r>
mentioned the results already in the first message), but it did not <br>
generate the wheel correctly. Instead I see this in the do_compile log:<br>
<br>
&gt;=C2=A0 &gt; DEBUG: Executing shell function do_compile<br>
&gt; running bdist_wheel<br>
&gt; running build<br>
&gt; installing to build/bdist.linux-x86_64/wheel<br>
&gt; running install<br>
&gt; running install_egg_info<br>
&gt; running egg_info<br>
&gt; creating UNKNOWN.egg-info<br>
&gt; writing UNKNOWN.egg-info/PKG-INFO<br>
&gt; writing dependency_links to UNKNOWN.egg-info/dependency_links.txt<br>
&gt; writing top-level names to UNKNOWN.egg-info/top_level.txt<br>
&gt; writing manifest file &#39;UNKNOWN.egg-info/SOURCES.txt&#39;<br>
&gt; listing git files failed - pretending there aren&#39;t any<br>
&gt; reading manifest file &#39;UNKNOWN.egg-info/SOURCES.txt&#39;<br>
&gt; adding license file &#39;LICENSE&#39;<br>
&gt; writing manifest file &#39;UNKNOWN.egg-info/SOURCES.txt&#39;<br>
&gt; Copying UNKNOWN.egg-info to build/bdist.linux-x86_64/wheel/UNKNOWN-0.0=
.0-py3.10.egg-info<br>
&gt; running install_scripts<br>
&gt; adding license file &quot;LICENSE&quot; (matched pattern &quot;LICEN[C=
S]E*&quot;)<br>
&gt; creating build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0.dist-info/WHEEL<=
br>
&gt; creating &#39;/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-v=
fp-poky-linux-musleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/di=
st/tmpj7vto26b/UNKNOWN-0.0.0-py3-none-any.whl&#39; and adding &#39;build/bd=
ist.linux-x86_64/wheel&#39; to it<br>
&gt; adding &#39;UNKNOWN-0.0.0.dist-info/LICENSE&#39;<br>
&gt; adding &#39;UNKNOWN-0.0.0.dist-info/METADATA&#39;<br>
&gt; adding &#39;UNKNOWN-0.0.0.dist-info/WHEEL&#39;<br>
&gt; adding &#39;UNKNOWN-0.0.0.dist-info/top_level.txt&#39;<br>
&gt; adding &#39;UNKNOWN-0.0.0.dist-info/RECORD&#39;<br>
&gt; removing build/bdist.linux-x86_64/wheel<br>
&gt; DEBUG: Shell function do_compile finished<br>
<br>
Similarly, the installed files are missing any source files:<br>
<br>
tree <br>
tmp/work/arm1176jzfshf-vfp-poky-linux-musleabi/python3-adafruit-circuitpyth=
on-busdevice/5.2.3-r0/image/<br>
&gt; tmp/work/arm1176jzfshf-vfp-poky-linux-musleabi/python3-adafruit-circui=
tpython-busdevice/5.2.3-r0/image/<br>
&gt; =E2=94=94=E2=94=80=E2=94=80 usr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 lib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 python3.1=
0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=
=94=80 site-packages<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=
=E2=94=80=E2=94=80 UNKNOWN-0.0.0.dist-info<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E2=94=9C=E2=94=80=E2=94=80 LICENSE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E2=94=9C=E2=94=80=E2=94=80 METADATA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E2=94=9C=E2=94=80=E2=94=80 RECORD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E2=94=9C=E2=94=80=E2=94=80 WHEEL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E2=94=94=E2=94=80=E2=94=80 top_level.txt<br>
<br>
It seems something is still missing but from looking at other recipes <br>
inheriting from pypi and python_setuptools_build_meta I don&#39;t see <br>
anything else I should add.<br>
<br></blockquote><div><br></div><div>This works fine on master/mickledore, =
but the root cause is the lack of PEP-621 support in setuptools 59.5.0 in k=
irkstone.</div><div>See <a href=3D"https://github.com/pypa/setuptools/issue=
s/3269#issuecomment-1254507377" target=3D"_blank">https://github.com/pypa/s=
etuptools/issues/3269#issuecomment-1254507377</a></div><div><br></div><div>=
The fix appears to be adding the following (at a minimum) to a setup.cfg fi=
le:</div><div>[metadata]<br>name =3D adafruit_circuitpython_busdevice<br>ve=
rsion =3D 5.2.3<br></div><div><br></div><div>See=C2=A0<a href=3D"https://se=
tuptools.pypa.io/en/latest/userguide/declarative_config.html" target=3D"_bl=
ank">https://setuptools.pypa.io/en/latest/userguide/declarative_config.html=
</a> for more options</div><div><br></div></div></div></blockquote><div>Thi=
s wasn&#39;t enough to package the .py files... something more like:</div>[=
metadata]<br>name =3D adafruit_circuitpython_busdevice<br>description =3D &=
quot;CircuitPython bus device classes to manage bus sharing.&quot;<br>versi=
on =3D 5.2.3<br>readme =3D &quot;README.rst&quot;<br>author =3D &quot;Adafr=
uit Industries&quot;<br>author_email =3D &quot;<a href=3D"mailto:circuitpyt=
hon@adafruit.com" target=3D"_blank">circuitpython@adafruit.com</a>&quot;<br=
>project_urls =3D {Homepage =3D &quot;<a href=3D"https://github.com/adafrui=
t/Adafruit_CircuitPython_BusDevice" target=3D"_blank">https://github.com/ad=
afruit/Adafruit_CircuitPython_BusDevice</a>&quot;}<br>keywords =3D &quot;ad=
afruit&quot;, &quot;spi&quot;, &quot;i2c&quot;, &quot;bus&quot;, &quot;devi=
ce&quot;, &quot;micropython&quot;, &quot;circuitpython&quot;<br>license =3D=
 {text =3D &quot;MIT&quot;}<br>classifiers =3D<br>=C2=A0 =C2=A0 &quot;Inten=
ded Audience :: Developers&quot;,<br>=C2=A0 =C2=A0 &quot;Topic :: Software =
Development :: Libraries&quot;,<br>=C2=A0 =C2=A0 &quot;Topic :: Software De=
velopment :: Embedded Systems&quot;,<br>=C2=A0 =C2=A0 &quot;Topic :: System=
 :: Hardware&quot;,<br>=C2=A0 =C2=A0 &quot;License :: OSI Approved :: MIT L=
icense&quot;,<br>=C2=A0 =C2=A0 &quot;Programming Language :: Python :: 3&qu=
ot;,<br>dynamic =3D [&quot;dependencies&quot;, &quot;optional-dependencies&=
quot;]<br><br>[options]<br>packages =3D find:<br><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div></div><div>The other option would be to fall back to the 5.2=
.0 release and &quot;inherit pypi setuptools3&quot; which will also happily=
 build a wheel.</div><div>The 5.2.0 release was before the switch to pyproj=
ect.toml.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#100642): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/100642" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/100642</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96294851/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
96294851/924729</a><br>
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

--0000000000005b12ee05f28baff8--

