Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9DFC433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 17:23:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.15834.1642526587362821103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 09:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VtpR36I5;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id cx27so9256464edb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 09:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qVTMbWy0L8ioOybMdTBGBmRwLLX707C1H5zFoMUr7uc=;
        b=VtpR36I5PAJDLvzOQkum1hi/9H8dIqpqsFOaEO+dkq2OYvUh70CyFOF7F0EBXR5SwR
         eSvzUpTbebyZbfajvQLvbOahGurlWP0rBhIzpSWszHO+xbG9plL5HhNjKo1nkXJhUgAv
         Dq+daIzd7dYiHeT7unDEjccIGHUKwRZ6h+oDAhfmt7GZiLRfP4R941Lo6lsvD4vfJpk7
         9p/hlF7UNzrxAYw1H03/FefOyG2cUDl1eA/Z4vfYu5Y6SNS+7QI/opFGaOBVtSArGM+7
         Tx8d5p4N2bacA/Bytv0GGb/IXIQK6BQMLF9fxa1tOgvVoLQZSHcoYI1ucZommL3PW20M
         n9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qVTMbWy0L8ioOybMdTBGBmRwLLX707C1H5zFoMUr7uc=;
        b=kRncwFX33L0UQ9rTxwk+e3Ni8MCL+5kKqhNgLQnm1dsOA25s456wn+0+1vP6UIDPfC
         sM0UsroRcnYTZRv4t1cf9Oq9+5ZeYrqU0c5FBUQho7rpG4VA1Wd68K/UcXarwWBSYL5K
         ZILYpfNZCmmzdhazwrOm50258uu0vullN5CPkq2bdJ7KqsJK3HRiw7Y4yspwFqb8AY2U
         bZ/un8Gaas+jKbf79YVJ2Y14MULAKuadtKCWEnkwneOyELIg6WV5ppFJbpXF+pomUPB5
         l8D0lztSmJeFB+A1epcwMDv8Deqz/3RgxWTO7eDyKi7flnkupjtUC1rjG/66FutkExFN
         pr2w==
X-Gm-Message-State: AOAM530Fof9Q1CSKyhXrV7qUI+TIVjgDfwSCmiXEZtDCpefyTaQL5ZIw
	yd3UUr9++v6Nx7HE97TbVmJN2uPzrVgB2rS2JAc=
X-Google-Smtp-Source: 
 ABdhPJw7T/6rzcOAsOQHIgyLAWvMwgmf4R/NGD2fzPfqymzulUotqpmCdI6UXdVu5gxYiSY4XGzxIMVIXWilpzCAK6g=
X-Received: by 2002:a17:907:7f01:: with SMTP id
 qf1mr21436926ejc.9.1642526585647;
 Tue, 18 Jan 2022 09:23:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642309436.git.tim.orling@konsulko.com>
 <1953cd6d6bf8617fb08b1244b0a8836732370523.1642309436.git.tim.orling@konsulko.com>
 <CAMKF1soYQst7H8qqyaDATcVuGbR2ma81-6q1Y5CE69SvfDzMhA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soYQst7H8qqyaDATcVuGbR2ma81-6q1Y5CE69SvfDzMhA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 18 Jan 2022 09:22:54 -0800
Message-ID: 
 <CANx9H-AiEeUiZ8G6Bt4M-LD+QCSaUtQQsRuAJJFskon0KTg+gQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-pyruvate: add recipe for
 v1.1.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000abf64505d5de85fa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 17:23:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94917

--000000000000abf64505d5de85fa
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 18, 2022 at 9:15 AM Khem Raj <raj.khem@gmail.com> wrote:

> this fail on mips see
>
> https://errors.yoctoproject.org/Errors/Details/622699/
>
> error[E0432]: unresolved imports `core::sync::atomic::AtomicI64`, `core::sync::atomic::AtomicU64`
  --> /usr/src/debug/python3-pyruvate/1.1.2-r0/cargo_home/bitbake/crossbeam-utils-0.8.6/src/lib.rs:79:49
   |
79 |             pub(crate) use core::sync::atomic::{AtomicI64, AtomicU64};
   |                                                 ^^^^^^^^^
^^^^^^^^^ no `AtomicU64` in `sync::atomic`
   |                                                 |
   |                                                 no `AtomicI64` in
`sync::atomic`
   |
help: a similar name exists in the module
   |
79 |             pub(crate) use core::sync::atomic::{AtomicI8, AtomicU64};
   |                                                 ~~~~~~~~
help: a similar name exists in the module
   |
79 |             pub(crate) use core::sync::atomic::{AtomicI64, AtomicU8};

| ~~~~~~~~
Probably need to disable for mips32 as it doesn't have support in rust?


> On Sat, Jan 15, 2022 at 9:29 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > Pyruvate is a reasonably fast, multithreaded, non-blocking WSGI server
> > implemented in Rust.
> >
> > This recipe uses the new setuptools3_rust and pyo3 classes.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  .../python/python3-pyruvate_1.1.2.bb          | 119 ++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-pyruvate_1.1.2.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/
> python3-pyruvate_1.1.2.bb
> > new file mode 100644
> > index 0000000000..835cf9a93d
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
> > @@ -0,0 +1,119 @@
> > +SUMMARY = "WSGI server implemented in Rust."
> > +DESCRIPTION = "Pyruvate is a reasonably fast, multithreaded,
> non-blocking \
> > +WSGI server implemented in Rust."
> > +HOMEPAGE = "https://gitlab.com/tschorr/pyruvate"
> > +BUGTRACKER = "https://gitlab.com/tschorr/pyruvate/-/issues"
> > +
> > +LICENSE = "GPL-2.0-only"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=051b48e640a6e2d795eac75542d9417c
> \
> > +
> file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +SRC_URI[sha256sum] =
> "10befedd97e73fc18b902d02aa3b24e8978aa162242c1b664849c886c0675899"
> > +
> > +S = "${WORKDIR}/pyruvate-${PV}"
> > +
> > +inherit pypi setuptools3_rust
> > +
> > +SRC_URI += " \
> > +    crate://crates.io/aho-corasick/0.7.18 \
> > +    crate://crates.io/atty/0.2.14 \
> > +    crate://crates.io/autocfg/1.0.1 \
> > +    crate://crates.io/bitflags/1.3.2 \
> > +    crate://crates.io/block-buffer/0.9.0 \
> > +    crate://crates.io/cc/1.0.72 \
> > +    crate://crates.io/cfg-if/1.0.0 \
> > +    crate://crates.io/chrono/0.4.19 \
> > +    crate://crates.io/cpufeatures/0.2.1 \
> > +    crate://crates.io/cpython/0.7.0 \
> > +    crate://crates.io/crossbeam-channel/0.5.2 \
> > +    crate://crates.io/crossbeam-deque/0.8.1 \
> > +    crate://crates.io/crossbeam-epoch/0.9.6 \
> > +    crate://crates.io/crossbeam-queue/0.3.3 \
> > +    crate://crates.io/crossbeam-utils/0.8.6 \
> > +    crate://crates.io/crossbeam/0.8.1 \
> > +    crate://crates.io/crypto-mac/0.11.1 \
> > +    crate://crates.io/ctrlc/3.2.1 \
> > +    crate://crates.io/digest/0.9.0 \
> > +    crate://crates.io/encoding-index-japanese/1.20141219.5 \
> > +    crate://crates.io/encoding-index-korean/1.20141219.5 \
> > +    crate://crates.io/encoding-index-simpchinese/1.20141219.5 \
> > +    crate://crates.io/encoding-index-singlebyte/1.20141219.5 \
> > +    crate://crates.io/encoding-index-tradchinese/1.20141219.5 \
> > +    crate://crates.io/encoding/0.2.33 \
> > +    crate://crates.io/encoding_index_tests/0.1.4 \
> > +    crate://crates.io/env_logger/0.9.0 \
> > +    crate://crates.io/errno-dragonfly/0.1.2 \
> > +    crate://crates.io/errno/0.2.8 \
> > +    crate://crates.io/fastrand/1.6.0 \
> > +    crate://crates.io/generic-array/0.14.5 \
> > +    crate://crates.io/getrandom/0.2.3 \
> > +    crate://crates.io/hermit-abi/0.1.19 \
> > +    crate://crates.io/hmac/0.11.0 \
> > +    crate://crates.io/httparse/1.5.1 \
> > +    crate://crates.io/humantime/2.1.0 \
> > +    crate://crates.io/instant/0.1.12 \
> > +    crate://crates.io/lazy_static/1.4.0 \
> > +    crate://crates.io/libc/0.2.112 \
> > +    crate://crates.io/libsystemd/0.4.1 \
> > +    crate://crates.io/log/0.4.14 \
> > +    crate://crates.io/memchr/2.4.1 \
> > +    crate://crates.io/memoffset/0.6.5 \
> > +    crate://crates.io/mio/0.8.0 \
> > +    crate://crates.io/miow/0.3.7 \
> > +    crate://crates.io/nix/0.23.1 \
> > +    crate://crates.io/ntapi/0.3.6 \
> > +    crate://crates.io/num-integer/0.1.44 \
> > +    crate://crates.io/num-traits/0.2.14 \
> > +    crate://crates.io/num_cpus/1.13.1 \
> > +    crate://crates.io/once_cell/1.9.0 \
> > +    crate://crates.io/opaque-debug/0.3.0 \
> > +    crate://crates.io/paste/1.0.6 \
> > +    crate://crates.io/ppv-lite86/0.2.16 \
> > +    crate://crates.io/proc-macro2/1.0.36 \
> > +    crate://crates.io/python3-sys/0.7.0 \
> > +    crate://crates.io/quote/1.0.14 \
> > +    crate://crates.io/rand/0.8.4 \
> > +    crate://crates.io/rand_chacha/0.3.1 \
> > +    crate://crates.io/rand_core/0.6.3 \
> > +    crate://crates.io/rand_hc/0.3.1 \
> > +    crate://crates.io/redox_syscall/0.2.10 \
> > +    crate://crates.io/regex-syntax/0.6.25 \
> > +    crate://crates.io/regex/1.5.4 \
> > +    crate://crates.io/remove_dir_all/0.5.3 \
> > +    crate://crates.io/scopeguard/1.1.0 \
> > +    crate://crates.io/serde/1.0.133 \
> > +    crate://crates.io/serde_derive/1.0.133 \
> > +    crate://crates.io/sha2/0.9.9 \
> > +    crate://crates.io/simplelog/0.11.1 \
> > +    crate://crates.io/spmc/0.3.0 \
> > +    crate://crates.io/subtle/2.4.1 \
> > +    crate://crates.io/syn/1.0.85 \
> > +    crate://crates.io/tempfile/3.3.0 \
> > +    crate://crates.io/termcolor/1.1.2 \
> > +    crate://crates.io/thiserror-impl/1.0.30 \
> > +    crate://crates.io/thiserror/1.0.30 \
> > +    crate://crates.io/threadpool/1.8.1 \
> > +    crate://crates.io/time/0.1.44 \
> > +    crate://crates.io/typenum/1.15.0 \
> > +    crate://crates.io/unicode-xid/0.2.2 \
> > +    crate://crates.io/urlencoding/2.1.0 \
> > +    crate://crates.io/uuid/0.8.2 \
> > +    crate://crates.io/version_check/0.9.4 \
> > +    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
> > +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi-util/0.1.5 \
> > +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi/0.3.9 \
> > +"
> > +
> > +# The following configs & dependencies are from setuptools
> extras_require.
> > +# These dependencies are optional, hence can be controlled via
> PACKAGECONFIG.
> > +# The upstream names may not correspond exactly to bitbake package
> names.
> > +#
> > +# Uncomment this line to enable all the optional features.
> > +#PACKAGECONFIG ?= "test"
> > +PACKAGECONFIG[test] = ",,,python3-pytest python3-requests"
> > +
> > +# WARNING: the following rdepends are determined through basic analysis
> of the
> > +# python sources, and might not be 100% accurate.
> > +RDEPENDS:${PN} += "python3-core"
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#94879):
> https://lists.openembedded.org/g/openembedded-devel/message/94879
> > Mute This Topic: https://lists.openembedded.org/mt/88458053/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000abf64505d5de85fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 18, 2022 at 9:15 AM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">this fail o=
n mips see<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/622699/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/622699/</a><br>
<br></blockquote><pre style=3D"padding:9.5px;font-family:Monaco,Menlo,Conso=
las,&quot;Courier New&quot;,monospace;font-size:13px;color:rgb(51,51,51);bo=
rder-radius:4px;margin-top:0px;margin-bottom:10px;line-height:20px;word-bre=
ak:break-all;white-space:pre-wrap;background-color:rgb(245,245,245);border:=
1px solid rgba(0,0,0,0.15)">error[E0432]: unresolved imports `core::sync::a=
tomic::AtomicI64`, `core::sync::atomic::AtomicU64`
  --&gt; /usr/src/debug/python3-pyruvate/1.1.2-r0/cargo_home/bitbake/crossb=
eam-utils-0.8.6/src/lib.rs:79:49
   |
79 |             pub(crate) use core::sync::atomic::{AtomicI64, AtomicU64};
   |                                                 ^^^^^^^^^  ^^^^^^^^^ n=
o `AtomicU64` in `sync::atomic`
   |                                                 |
   |                                                 no `AtomicI64` in `syn=
c::atomic`
   |
help: a similar name exists in the module
   |
79 |             pub(crate) use core::sync::atomic::{AtomicI8, AtomicU64};
   |                                                 ~~~~~~~~
help: a similar name exists in the module
   |
79 |             pub(crate) use core::sync::atomic::{AtomicI64, AtomicU8};=
=C2=A0</pre><div><span style=3D"background-color:rgb(245,245,245);color:rgb=
(51,51,51);font-family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monosp=
ace;font-size:13px;white-space:pre-wrap">   |                              =
                              ~~~~~~~~</span></div><div>Probably need to di=
sable for mips32 as it doesn&#39;t have support in rust?</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
On Sat, Jan 15, 2022 at 9:29 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@g=
mail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Pyruvate is a reasonably fast, multithreaded, non-blocking WSGI server=
<br>
&gt; implemented in Rust.<br>
&gt;<br>
&gt; This recipe uses the new setuptools3_rust and pyo3 classes.<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pyruvate_1.1.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-pyruvate_1.1.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 119 ++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 119 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pyruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-pyruvate_1.1.2.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pyruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruva=
te_1.1.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pyruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruva=
te_1.1.2.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..835cf9a93d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
ruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruvate_1.1.=
2.bb</a><br>
&gt; @@ -0,0 +1,119 @@<br>
&gt; +SUMMARY =3D &quot;WSGI server implemented in Rust.&quot;<br>
&gt; +DESCRIPTION =3D &quot;Pyruvate is a reasonably fast, multithreaded, n=
on-blocking \<br>
&gt; +WSGI server implemented in Rust.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/tschorr/pyruvate" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/tschorr/pyruvate</a>&=
quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://gitlab.com/tschorr/pyruvate/-=
/issues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/tschorr/py=
ruvate/-/issues</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D051b48e640a6e2d795eac=
75542d9417c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;10befedd97e73fc18b902d02aa3b24e8978aa162=
242c1b664849c886c0675899&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/pyruvate-${PV}&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3_rust<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/0.7.18=
" rel=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/0.7.18</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atty/0.2.14" rel=3D=
"noreferrer" target=3D"_blank">crates.io/atty/0.2.14</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.0.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.0.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/block-buffer/0.9.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/block-buffer/0.9.0</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.72" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/cc/1.0.72</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.19" rel=
=3D"noreferrer" target=3D"_blank">crates.io/chrono/0.4.19</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cpufeatures/0.2.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/cpufeatures/0.2.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cpython/0.7.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cpython/0.7.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-channel/0=
.5.2" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-channel/0.5.=
2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-deque/0.8=
.1" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque/0.8.1</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoch/0.9=
.6" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch/0.9.6</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-queue/0.3=
.3" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-queue/0.3.3</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.8=
.6" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.8.6</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam/0.8.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/crossbeam/0.8.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crypto-mac/0.11.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/crypto-mac/0.11.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ctrlc/3.2.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/ctrlc/3.2.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/digest/0.9.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/digest/0.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-japa=
nese/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-=
index-japanese/1.20141219.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-kore=
an/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-in=
dex-korean/1.20141219.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-simp=
chinese/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encodi=
ng-index-simpchinese/1.20141219.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-sing=
lebyte/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encodin=
g-index-singlebyte/1.20141219.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-trad=
chinese/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encodi=
ng-index-tradchinese/1.20141219.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding/0.2.33" re=
l=3D"noreferrer" target=3D"_blank">crates.io/encoding/0.2.33</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding_index_test=
s/0.1.4" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding_index_test=
s/0.1.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/env_logger/0.9.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/env_logger/0.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno-dragonfly/0.1=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/errno-dragonfly/0.1.2</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno/0.2.8" rel=3D=
"noreferrer" target=3D"_blank">crates.io/errno/0.2.8</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fastrand/1.6.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/fastrand/1.6.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/generic-array/0.14.=
5" rel=3D"noreferrer" target=3D"_blank">crates.io/generic-array/0.14.5</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.2.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.2.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.1.19" =
rel=3D"noreferrer" target=3D"_blank">crates.io/hermit-abi/0.1.19</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hmac/0.11.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hmac/0.11.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/httparse/1.5.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/httparse/1.5.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/humantime/2.1.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/humantime/2.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/instant/0.1.12" rel=
=3D"noreferrer" target=3D"_blank">crates.io/instant/0.1.12</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.4.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.112" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.112</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libsystemd/0.4.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/libsystemd/0.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.14" rel=3D"=
noreferrer" target=3D"_blank">crates.io/log/0.4.14</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.4.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/memchr/2.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.6.5" re=
l=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.6.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/mio/0.8.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/mio/0.8.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/miow/0.3.7" rel=3D"=
noreferrer" target=3D"_blank">crates.io/miow/0.3.7</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nix/0.23.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/nix/0.23.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ntapi/0.3.6" rel=3D=
"noreferrer" target=3D"_blank">crates.io/ntapi/0.3.6</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.1.44"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/num-integer/0.1.44</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.14" =
rel=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.14</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_cpus/1.13.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/num_cpus/1.13.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.9.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/opaque-debug/0.3.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/opaque-debug/0.3.0</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/paste/1.0.6" rel=3D=
"noreferrer" target=3D"_blank">crates.io/paste/1.0.6</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ppv-lite86/0.2.16" =
rel=3D"noreferrer" target=3D"_blank">crates.io/ppv-lite86/0.2.16</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.36"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.36</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/python3-sys/0.7.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/python3-sys/0.7.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.14" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.14</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.8.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/rand/0.8.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chacha/0.3.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/rand_chacha/0.3.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.6.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/rand_core/0.6.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_hc/0.3.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rand_hc/0.3.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.2.1=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.2.10</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.6.25=
" rel=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.6.25</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.5.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/regex/1.5.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/remove_dir_all/0.5.=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/remove_dir_all/0.5.3</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.133" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde/1.0.133</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.13=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.133</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sha2/0.9.9" rel=3D"=
noreferrer" target=3D"_blank">crates.io/sha2/0.9.9</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/simplelog/0.11.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/simplelog/0.11.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/spmc/0.3.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/spmc/0.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/subtle/2.4.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/subtle/2.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/1.0.85" rel=3D"=
noreferrer" target=3D"_blank">crates.io/syn/1.0.85</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tempfile/3.3.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tempfile/3.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/termcolor/1.1.2" re=
l=3D"noreferrer" target=3D"_blank">crates.io/termcolor/1.1.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror-impl/1.0.=
30" rel=3D"noreferrer" target=3D"_blank">crates.io/thiserror-impl/1.0.30</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror/1.0.30" r=
el=3D"noreferrer" target=3D"_blank">crates.io/thiserror/1.0.30</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/threadpool/1.8.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/threadpool/1.8.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time/0.1.44" rel=3D=
"noreferrer" target=3D"_blank">crates.io/time/0.1.44</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/typenum/1.15.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/typenum/1.15.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-xid/0.2.2" =
rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-xid/0.2.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/urlencoding/2.1.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/urlencoding/2.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/0.8.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/uuid/0.8.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.10.0+wasi-sn=
apshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.10.0=
+wasi-snapshot-preview1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-wind=
ows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i686-p=
c-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1.5" =
rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-wi=
ndows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-x86_=
64-pc-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +# The following configs &amp; dependencies are from setuptools extras=
_require.<br>
&gt; +# These dependencies are optional, hence can be controlled via PACKAG=
ECONFIG.<br>
&gt; +# The upstream names may not correspond exactly to bitbake package na=
mes.<br>
&gt; +#<br>
&gt; +# Uncomment this line to enable all the optional features.<br>
&gt; +#PACKAGECONFIG ?=3D &quot;test&quot;<br>
&gt; +PACKAGECONFIG[test] =3D &quot;,,,python3-pytest python3-requests&quot=
;<br>
&gt; +<br>
&gt; +# WARNING: the following rdepends are determined through basic analys=
is of the<br>
&gt; +# python sources, and might not be 100% accurate.<br>
&gt; +RDEPENDS:${PN} +=3D &quot;python3-core&quot;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#94879): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/94879" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/94879</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88458053=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88458053/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000abf64505d5de85fa--

