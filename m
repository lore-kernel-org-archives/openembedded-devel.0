Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9A1C38142
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 02:11:30 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.5803.1674007889673734928
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 18:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NQV5Rhk1;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id e130so6967751yba.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 18:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3qJYAiAAjIt0BGQ2sCGB010neiwD+zy8C5Las9ch9TE=;
        b=NQV5Rhk1YIFE03Sxy5JOVob37nzyAqPVkqoQXPg7teLdrF6jNXQt6I2qWOO1IKbK/i
         gljKB3O9/MO2HYFhzYtACJscnLhkgKJ8ZBezCXkOI5xgMk+RdXHfztljFYk1+3dbVFzp
         OGhnDsrPbNzJXOJdImpNIbhD1nSA34a8AvLkiXOGWMTwjqwEtBaZZQYcfXP52p7Aagg4
         +Kbo4mHh+uwc2/jpCf6ebXDgEKuxr3Xb5HDpsMeET40ZDyYtmp0PmKayWr8nycxnitQA
         pWHKGnr6PeK7shG7GP8gs7NmzqjFqNT18GayelXpZnX9uKtjc8OCZpoTCDcE5kTh4KP9
         5GDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qJYAiAAjIt0BGQ2sCGB010neiwD+zy8C5Las9ch9TE=;
        b=jQlkHl80E/feHfcakIuGsfwEAA4nljVErTN6mIvgnR9y8Ka19GPtgUZYc9nNPB4u5V
         NqAb81qjenmwQ1H94G7Sa7FR1yFLmAQPtm2cAAPAhWljIMRwRS4DWu0kerO+K5ltXhCG
         iEpSjlXaq7XBy3oDNZr5pEhaLfFi3mGjb9VDb1+ltXqAzGe6Bep8kdoiD8bWw/jfFcwd
         m78juZZyoQCyTaQ0Oz3U4gJnkYVqOxCFIVswVhchvudKyocjVsqDU9SINjp8k52WuDT8
         6KO3oJve53wWx2YV32e7VAcuAx8hisdg++camCzbKSAyyGLEqBvmeur46ed7mlAESPva
         A3Cg==
X-Gm-Message-State: AFqh2ko3MmpMyWHbTNg5wKqpMX4gBJV2OcBH7d8VpNhuU8O2HQa6FKJ7
	zVixU4XcYuSFnmI/XunDzToru4A9JTNDf+grLjFIXZGa9hE=
X-Google-Smtp-Source: AMrXdXv+2A9RgSGp8pG7eqXSRrpRt0BnSW42EcFzN5Vvy81C26p+YMo9DmHgZCq8YhRjSXpzpURuvkjCWo4lxr7418s=
X-Received: by 2002:a25:9d8d:0:b0:7ee:b52b:6d11 with SMTP id
 v13-20020a259d8d000000b007eeb52b6d11mr622208ybp.74.1674007888615; Tue, 17 Jan
 2023 18:11:28 -0800 (PST)
MIME-Version: 1.0
References: <OiM6.1673818791556733074.T0ut@lists.openembedded.org>
 <HKRJOR.GVPO6JMFGBGT1@t-online.de> <9FED42D9-734A-4481-9B34-003FCF582B2C@arm.com>
 <815a59a5-19f4-2fc3-0f1d-646c80b8379c@ffrnk.de>
In-Reply-To: <815a59a5-19f4-2fc3-0f1d-646c80b8379c@ffrnk.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 17 Jan 2023 18:11:17 -0800
Message-ID: <CANx9H-DQe-roJJXyY5+Z9E9r09P+Nzk9bwgar-eQGyv+pEkWVw@mail.gmail.com>
Subject: Re: [oe] [meta-python] Build recipe with pypa/build
To: Florian Frank <ffrank.os@ffrnk.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008d5e1305f2805534"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 02:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100642

--0000000000008d5e1305f2805534
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 12:02 PM Florian Frank <ffrank.os@ffrnk.de> wrote:

> On 16 Jan 2023, at 13:24, Ross Burton wrote:
> > On 15 Jan 2023, at 21:55, Markus Volk via lists.openembedded.org <f_l_k=
=3D
> t-online.de@lists.openembedded.org> wrote:
> >>
> >> You can try to 'inherit python_setuptools_build_meta' for your recipe
> >
> > This is the correct solution.  The recipe uses pyproject.toml and
> setuptools, so you can just inherit setuptools_build_meta (which will the=
n
> use build).
>
> Thanks for your responses. That was my first approach (and I should have
> mentioned the results already in the first message), but it did not
> generate the wheel correctly. Instead I see this in the do_compile log:
>
> >  > DEBUG: Executing shell function do_compile
> > running bdist_wheel
> > running build
> > installing to build/bdist.linux-x86_64/wheel
> > running install
> > running install_egg_info
> > running egg_info
> > creating UNKNOWN.egg-info
> > writing UNKNOWN.egg-info/PKG-INFO
> > writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
> > writing top-level names to UNKNOWN.egg-info/top_level.txt
> > writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> > listing git files failed - pretending there aren't any
> > reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> > adding license file 'LICENSE'
> > writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> > Copying UNKNOWN.egg-info to
> build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0-py3.10.egg-info
> > running install_scripts
> > adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
> > creating build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0.dist-info/WHEEL
> > creating
> '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-poky-linux-mu=
sleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/tmpj7vto26b/U=
NKNOWN-0.0.0-py3-none-any.whl'
> and adding 'build/bdist.linux-x86_64/wheel' to it
> > adding 'UNKNOWN-0.0.0.dist-info/LICENSE'
> > adding 'UNKNOWN-0.0.0.dist-info/METADATA'
> > adding 'UNKNOWN-0.0.0.dist-info/WHEEL'
> > adding 'UNKNOWN-0.0.0.dist-info/top_level.txt'
> > adding 'UNKNOWN-0.0.0.dist-info/RECORD'
> > removing build/bdist.linux-x86_64/wheel
> > DEBUG: Shell function do_compile finished
>
> Similarly, the installed files are missing any source files:
>
> tree
>
> tmp/work/arm1176jzfshf-vfp-poky-linux-musleabi/python3-adafruit-circuitpy=
thon-busdevice/5.2.3-r0/image/
> >
> tmp/work/arm1176jzfshf-vfp-poky-linux-musleabi/python3-adafruit-circuitpy=
thon-busdevice/5.2.3-r0/image/
> > =E2=94=94=E2=94=80=E2=94=80 usr
> >     =E2=94=94=E2=94=80=E2=94=80 lib
> >         =E2=94=94=E2=94=80=E2=94=80 python3.10
> >             =E2=94=94=E2=94=80=E2=94=80 site-packages
> >                 =E2=94=94=E2=94=80=E2=94=80 UNKNOWN-0.0.0.dist-info
> >                     =E2=94=9C=E2=94=80=E2=94=80 LICENSE
> >                     =E2=94=9C=E2=94=80=E2=94=80 METADATA
> >                     =E2=94=9C=E2=94=80=E2=94=80 RECORD
> >                     =E2=94=9C=E2=94=80=E2=94=80 WHEEL
> >                     =E2=94=94=E2=94=80=E2=94=80 top_level.txt
>
> It seems something is still missing but from looking at other recipes
> inheriting from pypi and python_setuptools_build_meta I don't see
> anything else I should add.
>
>
This works fine on master/mickledore, but the root cause is the lack of
PEP-621 support in setuptools 59.5.0 in kirkstone.
See https://github.com/pypa/setuptools/issues/3269#issuecomment-1254507377

The fix appears to be adding the following (at a minimum) to a setup.cfg
file:
[metadata]
name =3D adafruit_circuitpython_busdevice
version =3D 5.2.3

See https://setuptools.pypa.io/en/latest/userguide/declarative_config.html
for more options

The other option would be to fall back to the 5.2.0 release and "inherit
pypi setuptools3" which will also happily build a wheel.
The 5.2.0 release was before the switch to pyproject.toml.


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100639):
> https://lists.openembedded.org/g/openembedded-devel/message/100639
> Mute This Topic: https://lists.openembedded.org/mt/96294851/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008d5e1305f2805534
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 17, 2023 at 12:02 PM Flor=
ian Frank &lt;<a href=3D"mailto:ffrank.os@ffrnk.de">ffrank.os@ffrnk.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16=
 Jan 2023, at 13:24, Ross Burton wrote:<br>
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
s/3269#issuecomment-1254507377">https://github.com/pypa/setuptools/issues/3=
269#issuecomment-1254507377</a></div><div><br></div><div>The fix appears to=
 be adding the following (at a minimum) to a setup.cfg file:</div><div>[met=
adata]<br>name =3D adafruit_circuitpython_busdevice<br>version =3D 5.2.3<br=
></div><div><br></div><div>See=C2=A0<a href=3D"https://setuptools.pypa.io/e=
n/latest/userguide/declarative_config.html">https://setuptools.pypa.io/en/l=
atest/userguide/declarative_config.html</a> for more options</div><div><br>=
</div><div>The other option would be to fall back to the 5.2.0 release and =
&quot;inherit pypi setuptools3&quot; which will also happily build a wheel.=
</div><div>The 5.2.0 release was before the switch to pyproject.toml.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#100639): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/100639" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/100639</a><br>
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

--0000000000008d5e1305f2805534--

