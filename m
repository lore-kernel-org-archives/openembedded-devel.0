Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1CBC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:13:52 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.5322.1642594431789197558
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o10fMZLi;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 g9-20020a17090a67c900b001b4f1d71e4fso2455723pjm.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s/v6tNVWsLIsWPie/aUC2opGwnPwvgytWNJm8BdTM2Y=;
        b=o10fMZLi4hQmGGO8VhVC08SSzE1eu4Thj72SD+ATDhsMI33yyV9aQoCHung5Thbtmc
         H5qgsFTKKU/7vhATPpUeXWRQAg75fyYX4T3YqutBrUQyT2jDpejkJX3zkL/s4rubvUuR
         G5+uqEdl1vOBjns+6tqqdI9VCXIGGRXFbknVET+KNURb7XUm3lf9x3XXRNqEF9uCVk0G
         YUc4HE04I8j28tNpOJJs9EiqCzZX35L/K+WGuL3K2fNdoeFpJfKww58YO3zSkbqAS4sO
         GzRWthxKsordXBnNhxc4YzBksEd9yeCVMgkOTWrZQapEfsKWiEGlV/YbD2sJcIqe9wvv
         JJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s/v6tNVWsLIsWPie/aUC2opGwnPwvgytWNJm8BdTM2Y=;
        b=Wz3BoCr2QgJKOeIft9ovNfXVryQeC2FmMTQ5TxwZMVfu5PYYi9m184WV42i1VDhwX8
         Gg7QYn/DfDmNskgIhVNiu5tzRNNdYX6U6Rx6D8/KxVNkOYSXT3donozHzu5kLyYoUn1H
         DTqJ9OVfAFNRqed7EDhKW8H/F5PA8QZx/dz/L+ozJDRLPegOjmGfRAyHWFhydp212IEf
         kkwnyEdP8GjOLOA8Btf4SvmKI1U/WwjDXG1U8FeWUe2gIvKfIB9Z8LL0IxmmiC+kyudB
         tBXoTB30den7uhqT9PSJi76rvZtQcUNZwuz92PSQ8qIs1Hv9lhCywJBLYr5NfyvFQgOh
         lE+A==
X-Gm-Message-State: AOAM531Yp2l+LlaKLmp3nGb+jGuOV/0DHhf6H4Qcinpf/xvL49DvItRf
	C4SC5YC9M2WoRwwOsN3BJyU34FwU1Uak/t3kySU=
X-Google-Smtp-Source: 
 ABdhPJzndxFQ8zWlBQwc3fG1KV6HM0LTDeMyUu0qLFu+Nqd984B7YfnbjZCJYI10PPn4DuFSu34rcp3AnxEZDcc3QYk=
X-Received: by 2002:a17:90b:3912:: with SMTP id
 ob18mr3955874pjb.112.1642594431161;
 Wed, 19 Jan 2022 04:13:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642309436.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1642309436.git.tim.orling@konsulko.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Wed, 19 Jan 2022 14:13:39 +0200
Message-ID: 
 <CABXoSoXRi3hpg7Dgs=JArN7mCwGEMv+5MQQkZcmsu+w32V_FYA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/7] setuptools-rust and
 python3-cryptography
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000094577605d5ee51d3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 12:13:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94940

--00000000000094577605d5ee51d3
Content-Type: text/plain; charset="UTF-8"

Hi,

This seems to be causing build break for nativesdk builds.
nativesdk-python3-cryptography:
running build_rust
error: Error loading target specification: Could not find specification for
target "x86_64-pokysdk-linux". Run `rustc --print target-list` for a list
of built-in targets

The same build for target gives only warning:
running build_rust
warning: build_rust: Forced Rust target `aarch64-poky-linux` is not
compatible with deduced Rust target `aarch64-unknown-linux-gnu` - the built
package  may not import successfully once installed.

-samuli

On Sun, 16 Jan 2022 at 07:29, Tim Orling <ticotimo@gmail.com> wrote:

> This series upgrades python3-cryptography from the last version to be
> purely Python/C extensions (3.3.2) to the latest version which also
> includes Rust extensions (36.0.1).
>
> This has been tested (including full ptest runs) on:
>   - qemux86-64
>   - qemux86-musl
>   - qemuarm64
>
> The test cases require an absolute minimum of 1 GB of free memory
> according to the documentation, but in practice it was more performant
> to have 2 GB of free memory. For this reason a check-memfree.py test is
> added to run-ptest to avoid OOM/Exit code 9 in the ptest-runner. The
> test cases were run with:
>
>     runqemu nographic slirp qemuparams="-m 2176 -smp 4"
>
> On x86-64 with kvm this takes about 5 minutes.
>
> The results are 2856+/-2 passed, 1654+/-2 skipped. Of the skipped tests
> 1600 of them are because of unsupported "counter location middle_fixed"
> in https://github.com/pyca/cryptography/pull/2773. A further ~35 test
> cases are skipped because of not setting --wychefproof-root, but even
> when the Google wychefproof repository is cloned and the option is set,
> it adds another ~5000 skipped test cases:
>
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=timo/wip-python3-cryptography-ptest&id=fff4da6e70c97265e17a82f1d043ab16039d510e
>
> Upstream uses python3-pytest-xdist to parallize test cases (and
> python3-pytest-shard to distribute amongst workers), but this uses
> stdin/stdout and therefore we have no output to ptest-runner.
>
> This series introduces two helper classes pyo3.bbclass and
> setuptools_rust.bbclass for Python/Rust projects.
>
> The setuptools_rust.bbclass wraps PyO3, Cargo and the newly added
> python3-setuptools-rust-native recipe. Since oe-core only supports
> native rustc at this time, only a native recipe is provided.
>
> To demonstrate that these classes are applicable to multiple recipes, we
> also introduce python3-pyruvate, a WSGI implementation in Rust.
>
> While we are at it we upgrade python3-pytest-subtests from 0.5.0 to
> 0.6.0.
>
> The following changes since commit
> df5c1a31fdb8325d1c514f9ed8a7b3805dc581ac:
>
>   python3-diskcache: Upgrade 5.3.0 -> 5.4.0 (2022-01-10 10:35:02 -0800)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> timo/python3-cryptography_36.0.1
>
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-cryptography_36.0.1
>
> Tim Orling (7):
>   python3-setuptools-rust-native: add v1.1.2 recipe
>   pyo3.bbclass: add class for PyO3 cross-compilation
>   setuptools3_rust.bbclass: setuptoools Rust plugin
>   python3-pyruvate: add recipe for v1.1.2
>   python3-pytest-subtests: upgrade 0.5.0 -> 0.6.0
>   python3-cryptography-vectors: upgrade 35.0.0 => 36.0.1
>   python3-cryptography: upgrade 3.3.2 -> 36.0.1
>
>  meta-python/classes/pyo3.bbclass              |  30 +++++
>  meta-python/classes/setuptools3_rust.bbclass  |  11 ++
>  ...=> python3-cryptography-vectors_36.0.1.bb} |   5 +-
>  .../0001-Cargo.toml-specify-pem-version.patch |  31 +++++
>  .../0002-Cargo.toml-edition-2018-2021.patch   |  28 ++++
>  .../python3-cryptography/check-memfree.py     |  10 ++
>  .../python/python3-cryptography/h-test.patch  |  10 --
>  .../python3-cryptography/openssl3.patch       |  62 ---------
>  .../python/python3-cryptography/run-ptest     |   4 +-
>  .../python/python3-cryptography_3.3.2.bb      |  68 ----------
>  .../python/python3-cryptography_36.0.1.bb     | 121 ++++++++++++++++++
>  .../python/python3-pyruvate_1.1.2.bb          | 119 +++++++++++++++++
>  .../python/python3-pytest-subtests_0.5.0.bb   |  16 ---
>  .../python/python3-pytest-subtests_0.6.0.bb   |  20 +++
>  .../python3-setuptools-rust-native_1.1.2.bb   |  26 ++++
>  15 files changed, 403 insertions(+), 158 deletions(-)
>  create mode 100644 meta-python/classes/pyo3.bbclass
>  create mode 100644 meta-python/classes/setuptools3_rust.bbclass
>  rename meta-python/recipes-devtools/python/{
> python3-cryptography-vectors_35.0.0.bb =>
> python3-cryptography-vectors_36.0.1.bb} (72%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
>  create mode 100755
> meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-cryptography/openssl3.patch
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-cryptography_3.3.2.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-cryptography_36.0.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pyruvate_1.1.2.bb
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-pytest-subtests_0.5.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pytest-subtests_0.6.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-setuptools-rust-native_1.1.2.bb
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94875):
> https://lists.openembedded.org/g/openembedded-devel/message/94875
> Mute This Topic: https://lists.openembedded.org/mt/88458046/3617605
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> samuli.piippo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000094577605d5ee51d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>This seems to be causing=
 build break for nativesdk builds.</div><div>nativesdk-python3-cryptography=
:</div><div></div><div><span style=3D"font-family:monospace"><span style=3D=
"color:rgb(0,0,0);background-color:rgb(255,255,255)">running build_rust
</span><br>error: Error loading target specification: Could not find specif=
ication for target &quot;x86_64-pokysdk-linux&quot;. Run `rustc --print tar=
get-list` for a list of built-in targets<br>
<br></span></div><div><span style=3D"font-family:monospace"><font face=3D"a=
rial,sans-serif">The same build for target gives only warning:</font></span=
></div><div><span style=3D"font-family:arial,sans-serif"><span style=3D"fon=
t-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">running build_rust
</span><br>warning: build_rust: Forced Rust target `aarch64-poky-linux` is =
not compatible with deduced Rust target `aarch64-unknown-linux-gnu` - the b=
uilt package =C2=A0may not import successfully once installed.<br></span></=
span></div><div><span style=3D"font-family:arial,sans-serif"><span style=3D=
"font-family:monospace"><br></span></span></div><div><span style=3D"font-fa=
mily:arial,sans-serif"><span style=3D"font-family:monospace"><font face=3D"=
arial,sans-serif">-samuli</font><br></span></span></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 16 Jan 2022=
 at 07:29, Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">This series upgrades python3-cryptography from the last version to b=
e<br>
purely Python/C extensions (3.3.2) to the latest version which also<br>
includes Rust extensions (36.0.1).<br>
<br>
This has been tested (including full ptest runs) on:<br>
=C2=A0 - qemux86-64<br>
=C2=A0 - qemux86-musl<br>
=C2=A0 - qemuarm64<br>
<br>
The test cases require an absolute minimum of 1 GB of free memory<br>
according to the documentation, but in practice it was more performant<br>
to have 2 GB of free memory. For this reason a check-memfree.py test is<br>
added to run-ptest to avoid OOM/Exit code 9 in the ptest-runner. The<br>
test cases were run with:<br>
<br>
=C2=A0 =C2=A0 runqemu nographic slirp qemuparams=3D&quot;-m 2176 -smp 4&quo=
t;<br>
<br>
On x86-64 with kvm this takes about 5 minutes.<br>
<br>
The results are 2856+/-2 passed, 1654+/-2 skipped. Of the skipped tests<br>
1600 of them are because of unsupported &quot;counter location middle_fixed=
&quot;<br>
in <a href=3D"https://github.com/pyca/cryptography/pull/2773" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/pyca/cryptography/pull/2773</a>.=
 A further ~35 test<br>
cases are skipped because of not setting --wychefproof-root, but even<br>
when the Google wychefproof repository is cloned and the option is set,<br>
it adds another ~5000 skipped test cases:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded-contrib/commit/?h=
=3Dtimo/wip-python3-cryptography-ptest&amp;id=3Dfff4da6e70c97265e17a82f1d04=
3ab16039d510e" rel=3D"noreferrer" target=3D"_blank">https://git.openembedde=
d.org/meta-openembedded-contrib/commit/?h=3Dtimo/wip-python3-cryptography-p=
test&amp;id=3Dfff4da6e70c97265e17a82f1d043ab16039d510e</a><br>
<br>
Upstream uses python3-pytest-xdist to parallize test cases (and<br>
python3-pytest-shard to distribute amongst workers), but this uses<br>
stdin/stdout and therefore we have no output to ptest-runner.<br>
<br>
This series introduces two helper classes pyo3.bbclass and<br>
setuptools_rust.bbclass for Python/Rust projects.<br>
<br>
The setuptools_rust.bbclass wraps PyO3, Cargo and the newly added<br>
python3-setuptools-rust-native recipe. Since oe-core only supports<br>
native rustc at this time, only a native recipe is provided.<br>
<br>
To demonstrate that these classes are applicable to multiple recipes, we<br=
>
also introduce python3-pyruvate, a WSGI implementation in Rust.<br>
<br>
While we are at it we upgrade python3-pytest-subtests from 0.5.0 to<br>
0.6.0.<br>
<br>
The following changes since commit df5c1a31fdb8325d1c514f9ed8a7b3805dc581ac=
:<br>
<br>
=C2=A0 python3-diskcache: Upgrade 5.3.0 -&gt; 5.4.0 (2022-01-10 10:35:02 -0=
800)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembe=
dded-contrib</a> timo/python3-cryptography_36.0.1<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Dtimo/python3-cryptography_36.0.1" rel=3D"noreferrer" target=3D"_blan=
k">http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/pyt=
hon3-cryptography_36.0.1</a><br>
<br>
Tim Orling (7):<br>
=C2=A0 python3-setuptools-rust-native: add v1.1.2 recipe<br>
=C2=A0 pyo3.bbclass: add class for PyO3 cross-compilation<br>
=C2=A0 setuptools3_rust.bbclass: setuptoools Rust plugin<br>
=C2=A0 python3-pyruvate: add recipe for v1.1.2<br>
=C2=A0 python3-pytest-subtests: upgrade 0.5.0 -&gt; 0.6.0<br>
=C2=A0 python3-cryptography-vectors: upgrade 35.0.0 =3D&gt; 36.0.1<br>
=C2=A0 python3-cryptography: upgrade 3.3.2 -&gt; 36.0.1<br>
<br>
=C2=A0meta-python/classes/pyo3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 30 +++++<br>
=C2=A0meta-python/classes/setuptools3_rust.bbclass=C2=A0 |=C2=A0 11 ++<br>
=C2=A0...=3D&gt; <a href=3D"http://python3-cryptography-vectors_36.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-cryptography-vectors_36.0.1.bb=
</a>} |=C2=A0 =C2=A05 +-<br>
=C2=A0.../0001-Cargo.toml-specify-pem-version.patch |=C2=A0 31 +++++<br>
=C2=A0.../0002-Cargo.toml-edition-2018-2021.patch=C2=A0 =C2=A0|=C2=A0 28 ++=
++<br>
=C2=A0.../python3-cryptography/check-memfree.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
10 ++<br>
=C2=A0.../python/python3-cryptography/h-test.patch=C2=A0 |=C2=A0 10 --<br>
=C2=A0.../python3-cryptography/openssl3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 62 ---------<br>
=C2=A0.../python/python3-cryptography/run-ptest=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../python/<a href=3D"http://python3-cryptography_3.3.2.bb" rel=3D"no=
referrer" target=3D"_blank">python3-cryptography_3.3.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 68 ----------<br>
=C2=A0.../python/<a href=3D"http://python3-cryptography_36.0.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-cryptography_36.0.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 121 ++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-pyruvate_1.1.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-pyruvate_1.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 119 +++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-subtests_0.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-pytest-subtests_0.5.0.bb</a>=C2=A0 =
=C2=A0|=C2=A0 16 ---<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-subtests_0.6.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-pytest-subtests_0.6.0.bb</a>=C2=A0 =
=C2=A0|=C2=A0 20 +++<br>
=C2=A0.../<a href=3D"http://python3-setuptools-rust-native_1.1.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-setuptools-rust-native_1.1.2.bb</a>=
=C2=A0 =C2=A0|=C2=A0 26 ++++<br>
=C2=A015 files changed, 403 insertions(+), 158 deletions(-)<br>
=C2=A0create mode 100644 meta-python/classes/pyo3.bbclass<br>
=C2=A0create mode 100644 meta-python/classes/setuptools3_rust.bbclass<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-cryptography-vectors_35.0.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-cryptography-vectors_35.0.0.bb</a> =3D&gt; <a href=3D"http://python3-cry=
ptography-vectors_36.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-c=
ryptography-vectors_36.0.1.bb</a>} (72%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-crypto=
graphy/0001-Cargo.toml-specify-pem-version.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-crypto=
graphy/0002-Cargo.toml-edition-2018-2021.patch<br>
=C2=A0create mode 100755 meta-python/recipes-devtools/python/python3-crypto=
graphy/check-memfree.py<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-crypto=
graphy/h-test.patch<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-crypto=
graphy/openssl3.patch<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-cryptography_3.3.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-cryptography_3.3.2.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-cryptography_36.0.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-cryptography_36.0.1.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pyruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pyruvate_1.1.2.bb</a><br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-subtests_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-pytest-subtests_0.5.0.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-subtests_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-pytest-subtests_0.6.0.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-setuptools-rust-native_1.1.2.bb" rel=3D"noreferrer" target=3D"_=
blank">python3-setuptools-rust-native_1.1.2.bb</a><br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94875): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94875" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94875</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88458046/3617=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88458046/3617605</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:samuli.piippo@gmail.com"=
 target=3D"_blank">samuli.piippo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000094577605d5ee51d3--

