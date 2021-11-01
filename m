Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9706C433FE
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 19:28:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.1186.1635794929209887803
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 12:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YncIqRVl;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id u17so3109254plg.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iwEHIIeQtHI2XNXjth+Bwj35KiuDq865yyhWDB+1SrQ=;
        b=YncIqRVlJ2+x1+rZu0prKOt7/HGd5xFEcYTmMNhChT17XhLTrexpC7z7jHnCbLeRqK
         b8DYVVzRNgIGaWm7m6g7hS3Kmp4cxn4hqHiCnXqy0mqL3HLiW1OfyY+dRJG23oFURNq7
         vwdAA49t9vlZEKFwgKBnT800oRp3vrTvaK9XbWf09DZbMEo3f88GF0RTGp6RBjMrMcsQ
         eC+hvF7RgraTqFVJB+6oKku24BtVnpAuccHHUfiMgvNMxH4bd2JxfPERbKgz8WohhDoQ
         SpFAdjZ5mtvj9sBb0IDh0BiFft1kLktrpiZnsHtpERTJMDN/k1/YCDhi39IddDAZnxhW
         UiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iwEHIIeQtHI2XNXjth+Bwj35KiuDq865yyhWDB+1SrQ=;
        b=bNeUh3Q7d50A8YFWNZLCrCD1S5Wkg72yH7exAHSsgZ7/3Ud3Do/A/wQSS80z20Ni6Y
         Bnqu9oInoCpR8VLldxNp8aKsyGOe5D/wxBtln60jl3S9p0rFGiUxTjHwzQAz5eju8e00
         bO0wv8jOqi223a8go9sBn2kCr4oTGohwDRkEMetvefw6ucI/byUPcMZhLoguFySNcXE5
         eUkIWpodqFXMkPq39rbeM6ZPI+6f1L3mrsVc/8WduXDDiqOMm/SfSyXb8vllUkgMt8O4
         4EtAL6t9cdopJki3gQUhExEwgFJ33BIfVkP2j1qoBG82GZvNAnEzv/OZ5Misjy/sTv33
         NczA==
X-Gm-Message-State: AOAM533zbqQIs3/dtWysttgZZdwD5FlITLAGYgCi1/bChv6ZjtFaOdc4
	kXy9NRNX7nyMQyK4TfzgkxfPbjczBx1rPUfr+q0=
X-Google-Smtp-Source: 
 ABdhPJzOQGVamc0Oxem8PCoj4ObaDG/SDOk81vqcsfEBhTenmt+XK9FdoqbeshFRWDw0f1Gwt5imZ4y4Ded1u26hwpU=
X-Received: by 2002:a17:90b:380d:: with SMTP id
 mq13mr987067pjb.110.1635794925388;
 Mon, 01 Nov 2021 12:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211101114934.3646836-1-schnitzeltony@gmail.com>
 <20211101114934.3646836-8-schnitzeltony@gmail.com>
 <aa99a6e6-b42d-e7d5-3b2e-1398a182cf5d@gmail.com>
In-Reply-To: <aa99a6e6-b42d-e7d5-3b2e-1398a182cf5d@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Nov 2021 20:28:33 +0100
Message-ID: 
 <CALbNGRTYiQBTMwzRin8TbrVdy6+BCNaL9_SiL1fGfrbc=xGdxQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome++][PATCH 07/31] mozjs-78: Initial add
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 19:28:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93753

On Mon, Nov 1, 2021 at 7:36 PM Khem Raj <raj.khem@gmail.com> wrote:
> fails during configure, I am using mips/musl locally but I guess it
> could be a common problem
>
> https://errors.yoctoproject.org/Errors/Details/615986/
This one is I think musl+mips 32Bit - considered that out of scope for
initial fix.
>
> on arm/glibc I see this
>
> https://errors.yoctoproject.org/Errors/Details/615992/
>
All erriors I checked so far share same: missing llvm-objdump - you do
not have meta-clang in layers - I have.

Have

DEPENDS =3D \
...
${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer",
"clang-native", "llvm-native", d)} \
..
"

in mozjs-78 and I tested both paths but just by testing both variants
not by removing meta-clang. Will do now

Andreas

> also see other CI failed jobs
> http://jenkins.nas-admin.org/view/OE/


>
>
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >   ...figure-Skip-all-target-manipulations.patch |  66 ++++
> >   ...-autoconf-s-config.sub-to-canonicali.patch |  33 ++
> >   ...003-Cargo.toml-do-not-abort-on-panic.patch |  33 ++
> >   ...ibility-of-mozbuild-with-Python-3.10.patch | 304 +++++++++++++++++=
+
> >   .../mozjs-78/0005-use-asm-sgidefs.h.patch     |  35 ++
> >   .../mozjs/mozjs-78/0006-fix-musl-build.patch  |  15 +
> >   .../mozjs/mozjs-78/0007-riscv.patch           |  52 +++
> >   ...0008-riscv-Disable-atomic-operations.patch |  52 +++
> >   .../0009-riscv-Set-march-correctly.patch      |  60 ++++
> >   ...ace-include-by-code-to-fix-arm-build.patch |  43 +++
> >   ...aredArrayRawBufferRefs-to-public-API.patch |  35 ++
> >   .../mozjs/mozjs-78_78.15.0.bb                 | 140 ++++++++
> >   12 files changed, 868 insertions(+)
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0001-rust.configure-Skip-all-target-manipulations.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.=
patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0003-Cargo.toml-do-not-abort-on-panic.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patc=
h
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0005-use-asm-sgidefs.h.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0006-fix-musl-build.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0007-riscv.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0008-riscv-Disable-atomic-operations.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0009-riscv-Set-march-correctly.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0010-replace-include-by-code-to-fix-arm-build.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78/0011-Add-SharedArrayRawBufferRefs-to-public-API.patch
> >   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extende=
d/mozjs/mozjs-78_78.15.0.bb
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0001-rust.configure-Skip-all-target-manipulations.patch b/meta-oe/=
dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-rust.config=
ure-Skip-all-target-manipulations.patch
> > new file mode 100644
> > index 000000000..453174e51
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0001-rust.configure-Skip-all-target-manipulations.patch
> > @@ -0,0 +1,66 @@
> > +From b75661fbddd00ba9a43680c35b8c08aad8807d6b Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail=
.com>
> > +Date: Sun, 31 Oct 2021 16:49:55 +0100
> > +Subject: [PATCH] rust.configure: Skip all target manipulations
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Mozjs/rust targets are different from OE-rust targets. Use targets rep=
orted
> > +as is.
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + build/moz.configure/rust.configure | 16 +---------------
> > + 1 file changed, 1 insertion(+), 15 deletions(-)
> > +
> > +diff --git a/build/moz.configure/rust.configure b/build/moz.configure/=
rust.configure
> > +index e5122d6..9f3cc91 100644
> > +--- a/build/moz.configure/rust.configure
> > ++++ b/build/moz.configure/rust.configure
> > +@@ -81,9 +81,6 @@ def unwrap_rustup(prog, name):
> > +
> > +     return unwrap
> > +
> > +-rustc =3D unwrap_rustup(rustc, 'rustc')
> > +-cargo =3D unwrap_rustup(cargo, 'cargo')
> > +-
> > +
> > + set_config('CARGO', cargo)
> > + set_config('RUSTC', rustc)
> > +@@ -239,6 +236,7 @@ def rust_triple_alias(host_or_target, host_or_targ=
et_c_compiler):
> > +     @imports(_from=3D'textwrap', _import=3D'dedent')
> > +     def rust_target(rustc, host_or_target, compiler_info,
> > +                     rust_supported_targets, arm_target):
> > ++        return host_or_target.alias
> > +         # Rust's --target options are similar to, but not exactly the=
 same
> > +         # as, the autoconf-derived targets we use.  An example would =
be that
> > +         # Rust uses distinct target triples for targetting the GNU C+=
+ ABI
> > +@@ -401,22 +399,10 @@ def rust_triple_alias(host_or_target, host_or_ta=
rget_c_compiler):
> > +
> > +     return rust_target
> > +
> > +-
> > + rust_target_triple =3D rust_triple_alias(target, c_compiler)
> > + rust_host_triple =3D rust_triple_alias(host, host_c_compiler)
> > +
> > +
> > +-@depends(host, rust_host_triple, rustc_info.host)
> > +-def validate_rust_host_triple(host, rust_host, rustc_host):
> > +-    if rust_host !=3D rustc_host:
> > +-        if host.alias =3D=3D rust_host:
> > +-            configure_host =3D host.alias
> > +-        else:
> > +-            configure_host =3D '{}/{}'.format(host.alias, rust_host)
> > +-        die("The rust compiler host ({}) is not suitable for the conf=
igure host ({})."
> > +-            .format(rustc_host, configure_host))
> > +-
> > +-
> > + set_config('RUST_TARGET', rust_target_triple)
> > + set_config('RUST_HOST_TARGET', rust_host_triple)
> > +
> > +--
> > +2.31.1
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch b/=
meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0002-bui=
ld-do-not-use-autoconf-s-config.sub-to-canonicali.patch
> > new file mode 100644
> > index 000000000..21ad82ede
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
> > @@ -0,0 +1,33 @@
> > +From e5b95b3918588e2930c9af7ba304c57e871b2d55 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex@linutronix.de>
> > +Date: Thu, 7 Oct 2021 12:44:18 +0200
> > +Subject: [PATCH] build: do not use autoconf's config.sub to 'canonical=
ize'
> > + names
> > +
> > +The outcome is that processed names no longer match our custom rust
> > +target definitions, and the build fails.
> > +
> > +Upstream-Status: Inappropriate [oespecific]
> > +
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + build/moz.configure/init.configure | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/build/moz.configure/init.configure b/build/moz.configure/=
init.configure
> > +index b887153..0a6a33c 100644
> > +--- a/build/moz.configure/init.configure
> > ++++ b/build/moz.configure/init.configure
> > +@@ -808,7 +808,7 @@ def help_host_target(help, host, target):
> > + def config_sub(shell, triplet):
> > +     config_sub =3D os.path.join(os.path.dirname(__file__), '..',
> > +                               'autoconf', 'config.sub')
> > +-    return check_cmd_output(shell, config_sub, triplet).strip()
> > ++    return triplet
> > +
> > +
> > + @depends('--host', shell)
> > +--
> > +2.31.1
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0003-Cargo.toml-do-not-abort-on-panic.patch b/meta-oe/dynamic-laye=
rs/meta-python/recipes-extended/mozjs/mozjs-78/0003-Cargo.toml-do-not-abort=
-on-panic.patch
> > new file mode 100644
> > index 000000000..665eace66
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0003-Cargo.toml-do-not-abort-on-panic.patch
> > @@ -0,0 +1,33 @@
> > +From 9e37248870b2b955293754933c789ca00bca06ef Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex@linutronix.de>
> > +Date: Fri, 1 Oct 2021 13:00:24 +0200
> > +Subject: [PATCH] Cargo.toml: do not abort on panic
> > +
> > +OE's rust is configured to unwind, and this setting clashes with it/
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + Cargo.toml | 2 --
> > + 1 file changed, 2 deletions(-)
> > +
> > +diff --git a/Cargo.toml b/Cargo.toml
> > +index 897daad41b..505454263e 100644
> > +--- a/Cargo.toml
> > ++++ b/Cargo.toml
> > +@@ -56,13 +56,11 @@ opt-level =3D 1
> > + rpath =3D false
> > + lto =3D false
> > + debug-assertions =3D true
> > +-panic =3D "abort"
> > +
> > + [profile.release]
> > + opt-level =3D 2
> > + rpath =3D false
> > + debug-assertions =3D false
> > +-panic =3D "abort"
> > +
> > + [patch.crates-io]
> > + libudev-sys =3D { path =3D "dom/webauthn/libudev-sys" }
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch b/meta=
-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0004-Fixup-c=
ompatibility-of-mozbuild-with-Python-3.10.patch
> > new file mode 100644
> > index 000000000..d069d00af
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch
> > @@ -0,0 +1,304 @@
> > +From a88d0c8e27b48344942187c2611bb121bde9332d Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Franti=3DC5=3DA1ek=3D20Zatloukal?=3D <fzatlouk@redha=
t.com>
> > +Date: Tue, 13 Jul 2021 11:46:20 +0200
> > +Subject: [PATCH] Fixup compatibility of mozbuild with Python 3.10
> > +
> > +Stolen from [1]
> > +
> > +[1] https://src.fedoraproject.org/rpms/mozjs78/raw/rawhide/f/Fixup-com=
patibility-of-mozbuild-with-Python-3.10.patch
> > +
> > +Upstream-Status: Pending
> > +
> > +---
> > + python/mach/mach/config.py                                    | 4 ++-=
-
> > + python/mach/mach/decorators.py                                | 2 +-
> > + python/mozbuild/mozbuild/backend/configenvironment.py         | 3 ++-
> > + python/mozbuild/mozbuild/makeutil.py                          | 2 +-
> > + python/mozbuild/mozbuild/util.py                              | 2 +-
> > + testing/marionette/client/marionette_driver/wait.py           | 2 +-
> > + testing/mozbase/manifestparser/manifestparser/filters.py      | 3 ++-
> > + testing/mozbase/versioninfo.py                                | 2 +-
> > + testing/web-platform/tests/tools/manifest/vcs.py              | 2 +-
> > + .../web-platform/tests/tools/third_party/h2/h2/settings.py    | 2 +-
> > + .../tests/tools/third_party/html5lib/html5lib/_trie/_base.py  | 2 +-
> > + .../tools/third_party/html5lib/html5lib/treebuilders/dom.py   | 2 +-
> > + .../tests/tools/third_party/hyper/hyper/common/headers.py     | 2 +-
> > + .../tests/tools/third_party/hyper/hyper/h2/settings.py        | 2 +-
> > + .../tests/tools/third_party/hyper/hyper/http11/connection.py  | 4 ++-=
-
> > + .../third_party/hyper/hyper/packages/hyperframe/flags.py      | 2 +-
> > + .../tests/tools/third_party/hyperframe/hyperframe/flags.py    | 2 +-
> > + testing/web-platform/tests/tools/wptserve/wptserve/config.py  | 3 ++-
> > + testing/web-platform/tests/webdriver/tests/support/sync.py    | 2 +-
> > + 19 files changed, 24 insertions(+), 21 deletions(-)
> > +
> > +diff --git a/python/mach/mach/config.py b/python/mach/mach/config.py
> > +index 7210eca82..edb4d2e93 100644
> > +--- a/python/mach/mach/config.py
> > ++++ b/python/mach/mach/config.py
> > +@@ -144,7 +144,7 @@ def reraise_attribute_error(func):
> > +     return _
> > +
> > +
> > +-class ConfigSettings(collections.Mapping):
> > ++class ConfigSettings(collections.abc.Mapping):
> > +     """Interface for configuration settings.
> > +
> > +     This is the main interface to the configuration.
> > +@@ -190,7 +190,7 @@ class ConfigSettings(collections.Mapping):
> > +     will result in exceptions being raised.
> > +     """
> > +
> > +-    class ConfigSection(collections.MutableMapping, object):
> > ++    class ConfigSection(collections.abc.MutableMapping, object):
> > +         """Represents an individual config section."""
> > +         def __init__(self, config, name, settings):
> > +             object.__setattr__(self, '_config', config)
> > +diff --git a/python/mach/mach/decorators.py b/python/mach/mach/decorat=
ors.py
> > +index 27f7f34a6..5f63271a3 100644
> > +--- a/python/mach/mach/decorators.py
> > ++++ b/python/mach/mach/decorators.py
> > +@@ -140,7 +140,7 @@ def CommandProvider(cls):
> > +               'Conditions argument must take a list ' + \
> > +               'of functions. Found %s instead.'
> > +
> > +-        if not isinstance(command.conditions, collections.Iterable):
> > ++        if not isinstance(command.conditions, collections.abc.Iterabl=
e):
> > +             msg =3D msg % (command.name, type(command.conditions))
> > +             raise MachError(msg)
> > +
> > +diff --git a/python/mozbuild/mozbuild/backend/configenvironment.py b/p=
ython/mozbuild/mozbuild/backend/configenvironment.py
> > +index 20d1a9fa6..8747958bd 100644
> > +--- a/python/mozbuild/mozbuild/backend/configenvironment.py
> > ++++ b/python/mozbuild/mozbuild/backend/configenvironment.py
> > +@@ -9,7 +9,8 @@ import six
> > + import sys
> > + import json
> > +
> > +-from collections import Iterable, OrderedDict
> > ++from collections import OrderedDict
> > ++from collections.abc import Iterable
> > + from types import ModuleType
> > +
> > + import mozpack.path as mozpath
> > +diff --git a/python/mozbuild/mozbuild/makeutil.py b/python/mozbuild/mo=
zbuild/makeutil.py
> > +index 4da1a3b26..4ce56848c 100644
> > +--- a/python/mozbuild/mozbuild/makeutil.py
> > ++++ b/python/mozbuild/mozbuild/makeutil.py
> > +@@ -7,7 +7,7 @@ from __future__ import absolute_import, print_function=
, unicode_literals
> > + import os
> > + import re
> > + import six
> > +-from collections import Iterable
> > ++from collections.abc import Iterable
> > +
> > +
> > + class Makefile(object):
> > +diff --git a/python/mozbuild/mozbuild/util.py b/python/mozbuild/mozbui=
ld/util.py
> > +index 044cf645c..98ed3ef52 100644
> > +--- a/python/mozbuild/mozbuild/util.py
> > ++++ b/python/mozbuild/mozbuild/util.py
> > +@@ -782,7 +782,7 @@ class HierarchicalStringList(object):
> > +         self._strings =3D StrictOrderingOnAppendList()
> > +         self._children =3D {}
> > +
> > +-    class StringListAdaptor(collections.Sequence):
> > ++    class StringListAdaptor(collections.abc.Sequence):
> > +         def __init__(self, hsl):
> > +             self._hsl =3D hsl
> > +
> > +diff --git a/testing/marionette/client/marionette_driver/wait.py b/tes=
ting/marionette/client/marionette_driver/wait.py
> > +index eeaa1e23d..c147f463f 100644
> > +--- a/testing/marionette/client/marionette_driver/wait.py
> > ++++ b/testing/marionette/client/marionette_driver/wait.py
> > +@@ -82,7 +82,7 @@ class Wait(object):
> > +
> > +         exceptions =3D []
> > +         if ignored_exceptions is not None:
> > +-            if isinstance(ignored_exceptions, collections.Iterable):
> > ++            if isinstance(ignored_exceptions, collections.abc.Iterabl=
e):
> > +                 exceptions.extend(iter(ignored_exceptions))
> > +             else:
> > +                 exceptions.append(ignored_exceptions)
> > +diff --git a/testing/mozbase/manifestparser/manifestparser/filters.py =
b/testing/mozbase/manifestparser/manifestparser/filters.py
> > +index 287ee033b..b1d608003 100644
> > +--- a/testing/mozbase/manifestparser/manifestparser/filters.py
> > ++++ b/testing/mozbase/manifestparser/manifestparser/filters.py
> > +@@ -12,7 +12,8 @@ from __future__ import absolute_import
> > +
> > + import itertools
> > + import os
> > +-from collections import defaultdict, MutableSequence
> > ++from collections import defaultdict
> > ++from collections.abc import MutableSequence
> > +
> > + import six
> > + from six import string_types
> > +diff --git a/testing/mozbase/versioninfo.py b/testing/mozbase/versioni=
nfo.py
> > +index 91d1a0473..8c1680069 100755
> > +--- a/testing/mozbase/versioninfo.py
> > ++++ b/testing/mozbase/versioninfo.py
> > +@@ -11,7 +11,7 @@ from commit messages.
> > +
> > + from __future__ import absolute_import, print_function
> > +
> > +-from collections import Iterable
> > ++from collections.abc import Iterable
> > + from distutils.version import StrictVersion
> > + import argparse
> > + import os
> > +diff --git a/testing/web-platform/tests/tools/manifest/vcs.py b/testin=
g/web-platform/tests/tools/manifest/vcs.py
> > +index 7c0feeb81..05ee19c7c 100644
> > +--- a/testing/web-platform/tests/tools/manifest/vcs.py
> > ++++ b/testing/web-platform/tests/tools/manifest/vcs.py
> > +@@ -3,7 +3,7 @@ import json
> > + import os
> > + import stat
> > + from collections import deque
> > +-from collections import MutableMapping
> > ++from collections.abc import MutableMapping
> > +
> > + from six import with_metaclass, PY2
> > +
> > +diff --git a/testing/web-platform/tests/tools/third_party/h2/h2/settin=
gs.py b/testing/web-platform/tests/tools/third_party/h2/h2/settings.py
> > +index 3da720329..e097630e9 100644
> > +--- a/testing/web-platform/tests/tools/third_party/h2/h2/settings.py
> > ++++ b/testing/web-platform/tests/tools/third_party/h2/h2/settings.py
> > +@@ -88,7 +88,7 @@ class ChangedSetting:
> > +         )
> > +
> > +
> > +-class Settings(collections.MutableMapping):
> > ++class Settings(collections.abc.MutableMapping):
> > +     """
> > +     An object that encapsulates HTTP/2 settings state.
> > +
> > +diff --git a/testing/web-platform/tests/tools/third_party/html5lib/htm=
l5lib/_trie/_base.py b/testing/web-platform/tests/tools/third_party/html5li=
b/html5lib/_trie/_base.py
> > +index a1158bbbf..a9295a2ba 100644
> > +--- a/testing/web-platform/tests/tools/third_party/html5lib/html5lib/_=
trie/_base.py
> > ++++ b/testing/web-platform/tests/tools/third_party/html5lib/html5lib/_=
trie/_base.py
> > +@@ -1,6 +1,6 @@
> > + from __future__ import absolute_import, division, unicode_literals
> > +
> > +-from collections import Mapping
> > ++from collections.abc import Mapping
> > +
> > +
> > + class Trie(Mapping):
> > +diff --git a/testing/web-platform/tests/tools/third_party/html5lib/htm=
l5lib/treebuilders/dom.py b/testing/web-platform/tests/tools/third_party/ht=
ml5lib/html5lib/treebuilders/dom.py
> > +index dcfac220b..818a33433 100644
> > +--- a/testing/web-platform/tests/tools/third_party/html5lib/html5lib/t=
reebuilders/dom.py
> > ++++ b/testing/web-platform/tests/tools/third_party/html5lib/html5lib/t=
reebuilders/dom.py
> > +@@ -1,7 +1,7 @@
> > + from __future__ import absolute_import, division, unicode_literals
> > +
> > +
> > +-from collections import MutableMapping
> > ++from collections.abc import MutableMapping
> > + from xml.dom import minidom, Node
> > + import weakref
> > +
> > +diff --git a/testing/web-platform/tests/tools/third_party/hyper/hyper/=
common/headers.py b/testing/web-platform/tests/tools/third_party/hyper/hype=
r/common/headers.py
> > +index 655a591ac..6454f550a 100644
> > +--- a/testing/web-platform/tests/tools/third_party/hyper/hyper/common/=
headers.py
> > ++++ b/testing/web-platform/tests/tools/third_party/hyper/hyper/common/=
headers.py
> > +@@ -10,7 +10,7 @@ import collections
> > + from hyper.common.util import to_bytestring, to_bytestring_tuple
> > +
> > +
> > +-class HTTPHeaderMap(collections.MutableMapping):
> > ++class HTTPHeaderMap(collections.abc.MutableMapping):
> > +     """
> > +     A structure that contains HTTP headers.
> > +
> > +diff --git a/testing/web-platform/tests/tools/third_party/hyper/hyper/=
h2/settings.py b/testing/web-platform/tests/tools/third_party/hyper/hyper/h=
2/settings.py
> > +index fedc5e3c4..040afea92 100755
> > +--- a/testing/web-platform/tests/tools/third_party/hyper/hyper/h2/sett=
ings.py
> > ++++ b/testing/web-platform/tests/tools/third_party/hyper/hyper/h2/sett=
ings.py
> > +@@ -151,7 +151,7 @@ class ChangedSetting:
> > +         )
> > +
> > +
> > +-class Settings(collections.MutableMapping):
> > ++class Settings(collections.abc.MutableMapping):
> > +     """
> > +     An object that encapsulates HTTP/2 settings state.
> > +
> > +diff --git a/testing/web-platform/tests/tools/third_party/hyper/hyper/=
http11/connection.py b/testing/web-platform/tests/tools/third_party/hyper/h=
yper/http11/connection.py
> > +index 61361c358..a214311d2 100644
> > +--- a/testing/web-platform/tests/tools/third_party/hyper/hyper/http11/=
connection.py
> > ++++ b/testing/web-platform/tests/tools/third_party/hyper/hyper/http11/=
connection.py
> > +@@ -10,7 +10,7 @@ import os
> > + import socket
> > + import base64
> > +
> > +-from collections import Iterable, Mapping
> > ++from collections.abc import Iterable, Mapping
> > +
> > + import collections
> > + from hyperframe.frame import SettingsFrame
> > +@@ -295,7 +295,7 @@ class HTTP11Connection(object):
> > +                 return
> > +
> > +             # Iterables that set a specific content length.
> > +-            elif isinstance(body, collections.Iterable):
> > ++            elif isinstance(body, collections.abc.Iterable):
> > +                 for item in body:
> > +                     try:
> > +                         self._sock.send(item)
> > +diff --git a/testing/web-platform/tests/tools/third_party/hyper/hyper/=
packages/hyperframe/flags.py b/testing/web-platform/tests/tools/third_party=
/hyper/hyper/packages/hyperframe/flags.py
> > +index e8f630056..8f2ea689b 100644
> > +--- a/testing/web-platform/tests/tools/third_party/hyper/hyper/package=
s/hyperframe/flags.py
> > ++++ b/testing/web-platform/tests/tools/third_party/hyper/hyper/package=
s/hyperframe/flags.py
> > +@@ -11,7 +11,7 @@ import collections
> > + Flag =3D collections.namedtuple("Flag", ["name", "bit"])
> > +
> > +
> > +-class Flags(collections.MutableSet):
> > ++class Flags(collections.abc.MutableSet):
> > +     """
> > +     A simple MutableSet implementation that will only accept known fl=
ags as elements.
> > +
> > +diff --git a/testing/web-platform/tests/tools/third_party/hyperframe/h=
yperframe/flags.py b/testing/web-platform/tests/tools/third_party/hyperfram=
e/hyperframe/flags.py
> > +index 05b35017e..14c352e10 100644
> > +--- a/testing/web-platform/tests/tools/third_party/hyperframe/hyperfra=
me/flags.py
> > ++++ b/testing/web-platform/tests/tools/third_party/hyperframe/hyperfra=
me/flags.py
> > +@@ -11,7 +11,7 @@ import collections
> > + Flag =3D collections.namedtuple("Flag", ["name", "bit"])
> > +
> > +
> > +-class Flags(collections.MutableSet):
> > ++class Flags(collections.abc.MutableSet):
> > +     """
> > +     A simple MutableSet implementation that will only accept known fl=
ags as
> > +     elements.
> > +diff --git a/testing/web-platform/tests/tools/wptserve/wptserve/config=
.py b/testing/web-platform/tests/tools/wptserve/wptserve/config.py
> > +index 7766565fe..3c1c36d6f 100644
> > +--- a/testing/web-platform/tests/tools/wptserve/wptserve/config.py
> > ++++ b/testing/web-platform/tests/tools/wptserve/wptserve/config.py
> > +@@ -2,7 +2,8 @@ import copy
> > + import logging
> > + import os
> > +
> > +-from collections import defaultdict, Mapping
> > ++from collections import defaultdict
> > ++from collections.abc import Mapping
> > + from six import integer_types, iteritems, itervalues, string_types
> > +
> > + from . import sslutils
> > +diff --git a/testing/web-platform/tests/webdriver/tests/support/sync.p=
y b/testing/web-platform/tests/webdriver/tests/support/sync.py
> > +index 3fc77131c..8e8f6b819 100644
> > +--- a/testing/web-platform/tests/webdriver/tests/support/sync.py
> > ++++ b/testing/web-platform/tests/webdriver/tests/support/sync.py
> > +@@ -81,7 +81,7 @@ class Poll(object):
> > +
> > +         exceptions =3D []
> > +         if ignored_exceptions is not None:
> > +-            if isinstance(ignored_exceptions, collections.Iterable):
> > ++            if isinstance(ignored_exceptions, collections.abc.Iterabl=
e):
> > +                 exceptions.extend(iter(ignored_exceptions))
> > +             else:
> > +                 exceptions.append(ignored_exceptions)
> > +--
> > +2.31.1
> > +
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0005-use-asm-sgidefs.h.patch b/meta-oe/dynamic-layers/meta-python/=
recipes-extended/mozjs/mozjs-78/0005-use-asm-sgidefs.h.patch
> > new file mode 100644
> > index 000000000..b56f0b95b
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0005-use-asm-sgidefs.h.patch
> > @@ -0,0 +1,35 @@
> > +From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00 2001
> > +From: Andre McCurdy <amccurdy@gmail.com>
> > +Date: Sat, 30 Apr 2016 15:29:06 -0700
> > +Subject: [PATCH] use <asm/sgidefs.h>
> > +
> > +Build fix for MIPS with musl libc
> > +
> > +The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
> > +but not by musl. Regardless of the libc, the kernel headers provide
> > +<asm/sgidefs.h> which provides the same definitions, so use that
> > +instead.
> > +
> > +Upstream-Status: Pending
> > +
> > +[Vincent:
> > +Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=3D21070]
> > +
> > +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > +---
> > + gdb/mips-linux-nat.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +--- a/mfbt/RandomNum.cpp
> > ++++ b/mfbt/RandomNum.cpp
> > +@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PV
> > + #  elif defined(__s390__)
> > + #    define GETRANDOM_NR 349
> > + #  elif defined(__mips__)
> > +-#    include <sgidefs.h>
> > ++#    include <asm/sgidefs.h>
> > + #    if _MIPS_SIM =3D=3D _MIPS_SIM_ABI32
> > + #      define GETRANDOM_NR 4353
> > + #    elif _MIPS_SIM =3D=3D _MIPS_SIM_ABI64
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0006-fix-musl-build.patch b/meta-oe/dynamic-layers/meta-python/rec=
ipes-extended/mozjs/mozjs-78/0006-fix-musl-build.patch
> > new file mode 100644
> > index 000000000..c0834af58
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0006-fix-musl-build.patch
> > @@ -0,0 +1,15 @@
> > +Upstream: No
> > +Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYW=
ORD:
> > +https://github.com/void-linux/void-packages/issues/2598
> > +--- a/js/src/old-configure.in
> > ++++ b/js/src/old-configure.in
> > +@@ -1072,6 +1072,9 @@ if test "$ac_cv_thread_keyword" =3D yes; t
> > +     *-android*|*-linuxandroid*)
> > +       :
> > +       ;;
> > ++    *-musl*)
> > ++      :
> > ++      ;;
> > +     *)
> > +       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
> > +       ;;
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0007-riscv.patch b/meta-oe/dynamic-layers/meta-python/recipes-exte=
nded/mozjs/mozjs-78/0007-riscv.patch
> > new file mode 100644
> > index 000000000..70177d003
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0007-riscv.patch
> > @@ -0,0 +1,52 @@
> > +Add RISCV32/64 support
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + build/moz.configure/init.configure                        | 6 ++++++
> > + python/mozbuild/mozbuild/configure/constants.py           | 2 ++
> > + 2 files changed, 8 insertions(+)
> > +
> > +diff --git a/build/moz.configure/init.configure b/build/moz.configure/=
init.configure
> > +index 0a6a33c..eeee87e 100644
> > +--- a/build/moz.configure/init.configure
> > ++++ b/build/moz.configure/init.configure
> > +@@ -755,6 +755,12 @@ def split_triplet(triplet, allow_msvc=3DFalse):
> > +     elif cpu.startswith('aarch64'):
> > +         canonical_cpu =3D 'aarch64'
> > +         endianness =3D 'little'
> > ++    elif cpu in ("riscv32", "riscv32gc"):
> > ++        canonical_cpu =3D "riscv32"
> > ++        endianness =3D "little"
> > ++    elif cpu in ("riscv64", "riscv64gc"):
> > ++        canonical_cpu =3D "riscv64"
> > ++        endianness =3D "little"
> > +     elif cpu =3D=3D 'sh4':
> > +         canonical_cpu =3D 'sh4'
> > +         endianness =3D 'little'
> > +diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/=
mozbuild/mozbuild/configure/constants.py
> > +index 7542dcd..de25be2 100644
> > +--- a/python/mozbuild/mozbuild/configure/constants.py
> > ++++ b/python/mozbuild/mozbuild/configure/constants.py
> > +@@ -50,6 +50,8 @@ CPU_bitness =3D {
> > +     'mips64': 64,
> > +     'ppc': 32,
> > +     'ppc64': 64,
> > ++    'riscv32': 32,
> > ++    'riscv64': 64,
> > +     's390': 32,
> > +     's390x': 64,
> > +     'sh4': 32,
> > +@@ -82,6 +84,8 @@ CPU_preprocessor_checks =3D OrderedDict((
> > +     ('s390', '__s390__'),
> > +     ('ppc64', '__powerpc64__'),
> > +     ('ppc', '__powerpc__'),
> > ++    ('riscv32', '__riscv && __SIZEOF_POINTER__ =3D=3D 4'),
> > ++    ('riscv64', '__riscv && __SIZEOF_POINTER__ =3D=3D 8'),
> > +     ('Alpha', '__alpha__'),
> > +     ('hppa', '__hppa__'),
> > +     ('sparc64', '__sparc__ && __arch64__'),
> > +--
> > +2.31.1
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0008-riscv-Disable-atomic-operations.patch b/meta-oe/dynamic-layer=
s/meta-python/recipes-extended/mozjs/mozjs-78/0008-riscv-Disable-atomic-ope=
rations.patch
> > new file mode 100644
> > index 000000000..ba50e10c6
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0008-riscv-Disable-atomic-operations.patch
> > @@ -0,0 +1,52 @@
> > +From 64ad80e6d95871f17be4cd01da15581f41ac0b2b Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 27 May 2019 21:10:34 -0700
> > +Subject: [PATCH] riscv: Disable atomic operations
> > +
> > +This was ported from what was used with mozjs-60 which was
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate[old-version]
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + js/src/jit/AtomicOperations.h                          | 3 ++-
> > + js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h | 8 ++++++++
> > + 2 files changed, 10 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/js/src/jit/AtomicOperations.h b/js/src/jit/AtomicOperatio=
ns.h
> > +index 0486cba..cf6b91c 100644
> > +--- a/js/src/jit/AtomicOperations.h
> > ++++ b/js/src/jit/AtomicOperations.h
> > +@@ -391,7 +391,8 @@ inline bool AtomicOperations::isLockfreeJS(int32_t=
 size) {
> > + #elif defined(__ppc__) || defined(__PPC__) || defined(__sparc__) ||  =
   \
> > +     defined(__ppc64__) || defined(__PPC64__) || defined(__ppc64le__) =
|| \
> > +     defined(__PPC64LE__) || defined(__alpha__) || defined(__hppa__) |=
|  \
> > +-    defined(__sh__) || defined(__s390__) || defined(__s390x__)
> > ++    defined(__sh__) || defined(__s390__) || defined(__s390x__) || \
> > ++    defined(__riscv)
> > + #  include "jit/shared/AtomicOperations-feeling-lucky.h"
> > + #else
> > + #  error "No AtomicOperations support provided for this platform"
> > +diff --git a/js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h b/=
js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h
> > +index f002cd4..14bb5f9 100644
> > +--- a/js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h
> > ++++ b/js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h
> > +@@ -77,6 +77,14 @@
> > + #  endif
> > + #endif
> > +
> > ++#ifdef __riscv
> > ++#  ifdef __riscv_xlen =3D=3D 64
> > ++#    define HAS_64BIT_ATOMICS
> > ++#    define HAS_64BIT_LOCKFREE
> > ++#  endif
> > ++#endif
> > ++
> > ++
> > + // The default implementation tactic for gcc/clang is to use the newe=
r __atomic
> > + // intrinsics added for use in C++11 <atomic>.  Where that isn't avai=
lable, we
> > + // use GCC's older __sync functions instead.
> > +--
> > +2.31.1
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0009-riscv-Set-march-correctly.patch b/meta-oe/dynamic-layers/meta=
-python/recipes-extended/mozjs/mozjs-78/0009-riscv-Set-march-correctly.patc=
h
> > new file mode 100644
> > index 000000000..befede172
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0009-riscv-Set-march-correctly.patch
> > @@ -0,0 +1,60 @@
> > +From c3c2d1c69859c5e567005f0c3fa07a0dbe31e4a3 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail=
.com>
> > +Date: Fri, 29 Oct 2021 21:18:26 +0200
> > +Subject: [PATCH] riscv: Set march correctly
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Stolen from leftover patch in oe-core [1]
> > +
> > +[1] https://github.com/openembedded/openembedded-core/blob/c884878f6c8=
33b18a3a95b193f5de68df5bcea48/meta/recipes-devtools/rust/files/rv64gc.patch
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + third_party/rust/cc/src/lib.rs           | 14 ++++++++++----
> > + third_party/rust/cc/.cargo-checksum.json | 2 +-
> > + 1 file changed, 10 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/third_party/rust/cc/src/lib.rs b/third_party/rust/cc/src/=
lib.rs
> > +index 621d31d..6f72e13 100644
> > +--- a/third_party/rust/cc/src/lib.rs
> > ++++ b/third_party/rust/cc/src/lib.rs
> > +@@ -1587,14 +1587,20 @@ impl Build {
> > +                     let mut parts =3D target.split('-');
> > +                     if let Some(arch) =3D parts.next() {
> > +                         let arch =3D &arch[5..];
> > +-                        cmd.args.push(("-march=3Drv".to_owned() + arc=
h).into());
> > +-                        // ABI is always soft-float right now, update=
 this when this is no longer the
> > +-                        // case:
> > +-                        if arch.starts_with("64") {
> > ++                        if target.contains("linux") && arch.starts_wi=
th("64") {
> > ++                            cmd.args.push(("-march=3Drv64gc").into())=
;
> > ++                            cmd.args.push("-mabi=3Dlp64d".into());
> > ++                        } else if target.contains("linux") && arch.st=
arts_with("32") {
> > ++                            cmd.args.push(("-march=3Drv32gc").into())=
;
> > ++                            cmd.args.push("-mabi=3Dilp32d".into());
> > ++                        } else if arch.starts_with("64") {
> > ++                            cmd.args.push(("-march=3Drv".to_owned() +=
 arch).into());
> > +                             cmd.args.push("-mabi=3Dlp64".into());
> > +                         } else {
> > ++                            cmd.args.push(("-march=3Drv".to_owned() +=
 arch).into());
> > +                             cmd.args.push("-mabi=3Dilp32".into());
> > +                         }
> > ++                        cmd.args.push("-mcmodel=3Dmedany".into());
> > +                     }
> > +                 }
> > +             }
> > +diff --git a/third_party/rust/cc/.cargo-checksum.json b/third_party/ru=
st/cc/.cargo-checksum.json
> > +index 417fde7..70e5d02 100644
> > +--- a/third_party/rust/cc/.cargo-checksum.json
> > ++++ b/third_party/rust/cc/.cargo-checksum.json
> > +@@ -1 +1 @@
> > +-{"files":{"Cargo.lock":"3aff5f8b0a7f4d72852b11b0526f0002e6bf55f19f1eb=
d6470d7f97fbd540e60","Cargo.toml":"6ab10d9b6a9c6f0909074e6698c90c6b6a722366=
1ec2e83174d2593117cbe7f2","LICENSE-APACHE":"a60eea817514531668d7e0076573144=
9fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3=
f2d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"7184fbdf375a057e67325=
7348f6d7584c0dd11b66318d98f3647f69eb610b097","src/bin/gcc-shim.rs":"b779078=
75029494b6288841c3aed2e4939ed40708c7f597fca5c9e2570490ca6","src/com.rs":"bc=
daf1c28b71e6ef889c6b08d1ce9d7c0761344a677f523bc4c3cd297957f804","src/lib.rs=
":"4753929dbb7b676c19d7cfa06d0a47e37003554b80c536cbf2b892d591ef61c2","src/r=
egistry.rs":"3cc1b5a50879fa751572878ae1d0afbfc960c11665258492754b2c8bccb0ff=
5d","src/setup_config.rs":"7014103587d3382eac599cb76f016e2609b8140970861b22=
37982d1db24af265","src/winapi.rs":"ea8b7edbb9ff87957254f465c2334e714c5d6b3b=
19a8d757c48ea7ca0881c50c","src/windows_registry.rs":"388e79dcf3e84078ae0b08=
6c6cdee9cf9eb7e3ffafdcbf3e2df26163661f5856","tests/cc_env.rs":"e02b3b0824ad=
039b47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cflags.rs":"57=
f06eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","tests/cxxf=
lags.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593cade5f3371"=
,"tests/support/mod.rs":"71620b178583b6e6e5e0d4cac14e2cef6afc62fb6841e0c72e=
d1784543abf8ac","tests/test.rs":"1605640c9b94a77f48fc92e1dc0485bdf1960da562=
6e2e00279e4703691656bc"},"package":"aa87058dce70a3ff5621797f1506cb837edd02a=
c4c0ae642b4542dce802908b8"}
> > +\ No newline at end of file
> > ++{"files":{"Cargo.lock":"3aff5f8b0a7f4d72852b11b0526f0002e6bf55f19f1eb=
d6470d7f97fbd540e60","Cargo.toml":"6ab10d9b6a9c6f0909074e6698c90c6b6a722366=
1ec2e83174d2593117cbe7f2","LICENSE-APACHE":"a60eea817514531668d7e0076573144=
9fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3=
f2d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"7184fbdf375a057e67325=
7348f6d7584c0dd11b66318d98f3647f69eb610b097","src/bin/gcc-shim.rs":"b779078=
75029494b6288841c3aed2e4939ed40708c7f597fca5c9e2570490ca6","src/com.rs":"bc=
daf1c28b71e6ef889c6b08d1ce9d7c0761344a677f523bc4c3cd297957f804","src/lib.rs=
":"feab2b4cc51fcfb041f83a1a689960c3c9abfbaa9580ba186244a880586ba29a","src/r=
egistry.rs":"3cc1b5a50879fa751572878ae1d0afbfc960c11665258492754b2c8bccb0ff=
5d","src/setup_config.rs":"7014103587d3382eac599cb76f016e2609b8140970861b22=
37982d1db24af265","src/winapi.rs":"ea8b7edbb9ff87957254f465c2334e714c5d6b3b=
19a8d757c48ea7ca0881c50c","src/windows_registry.rs":"388e79dcf3e84078ae0b08=
6c6cdee9cf9eb7e3ffafdcbf3e2df26163661f5856","tests/cc_env.rs":"e02b3b0824ad=
039b47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cflags.rs":"57=
f06eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","tests/cxxf=
lags.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593cade5f3371"=
,"tests/support/mod.rs":"71620b178583b6e6e5e0d4cac14e2cef6afc62fb6841e0c72e=
d1784543abf8ac","tests/test.rs":"1605640c9b94a77f48fc92e1dc0485bdf1960da562=
6e2e00279e4703691656bc"},"package":"aa87058dce70a3ff5621797f1506cb837edd02a=
c4c0ae642b4542dce802908b8"}
> > +--
> > +2.31.1
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0010-replace-include-by-code-to-fix-arm-build.patch b/meta-oe/dyna=
mic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0010-replace-include=
-by-code-to-fix-arm-build.patch
> > new file mode 100644
> > index 000000000..adca9c721
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0010-replace-include-by-code-to-fix-arm-build.patch
> > @@ -0,0 +1,43 @@
> > +From fd6847c9416f9eebde636e21d794d25d1be8791d Mon Sep 17 00:00:00 2001
> > +From: Mike Hommey <mh@glandium.org>
> > +Date: Sat, 1 Jun 2019 09:06:01 +0900
> > +Subject: [PATCH] Bug 1526653 - Include struct definitions for user_vfp=
 and
> > + user_vfp_exc.
> > +
> > +* We need this to fix arm builds
> > +* Stolen from [1]
> > +
> > +[1] https://salsa.debian.org/mozilla-team/firefox/commit/fd6847c9416f9=
eebde636e21d794d25d1be8791d
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + js/src/wasm/WasmSignalHandlers.cpp | 11 ++++++++++-
> > + 1 file changed, 10 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/js/src/wasm/WasmSignalHandlers.cpp b/js/src/wasm/WasmSign=
alHandlers.cpp
> > +index 636537f8478..383c380f04c 100644
> > +--- a/js/src/wasm/WasmSignalHandlers.cpp
> > ++++ b/js/src/wasm/WasmSignalHandlers.cpp
> > +@@ -248,7 +248,16 @@ using mozilla::DebugOnly;
> > + #endif
> > +
> > + #ifdef WASM_EMULATE_ARM_UNALIGNED_FP_ACCESS
> > +-#  include <sys/user.h>
> > ++struct user_vfp {
> > ++  unsigned long long fpregs[32];
> > ++  unsigned long fpscr;
> > ++};
> > ++
> > ++struct user_vfp_exc {
> > ++  unsigned long fpexc;
> > ++  unsigned long fpinst;
> > ++  unsigned long fpinst2;
> > ++};
> > + #endif
> > +
> > + #if defined(ANDROID)
> > +--
> > +GitLab
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78/0011-Add-SharedArrayRawBufferRefs-to-public-API.patch b/meta-oe/dy=
namic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0011-Add-SharedArr=
ayRawBufferRefs-to-public-API.patch
> > new file mode 100644
> > index 000000000..ca37ca72c
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/0011-Add-SharedArrayRawBufferRefs-to-public-API.patch
> > @@ -0,0 +1,35 @@
> > +From ccdd47cee610cb33fa5f67f856a68f5e411c79d5 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail=
.com>
> > +Date: Sun, 31 Oct 2021 18:32:39 +0100
> > +Subject: [PATCH] Add SharedArrayRawBufferRefs to public API
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Stolen from [1]
> > +
> > +[1] https://src.fedoraproject.org/rpms/mozjs78/blob/rawhide/f/FixShare=
dArray.diff
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + js/public/StructuredClone.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/js/public/StructuredClone.h b/js/public/StructuredClone.h
> > +index cb3cd5b..06da4dd 100644
> > +--- a/js/public/StructuredClone.h
> > ++++ b/js/public/StructuredClone.h
> > +@@ -381,7 +381,7 @@ enum OwnTransferablePolicy {
> > + namespace js {
> > + class SharedArrayRawBuffer;
> > +
> > +-class SharedArrayRawBufferRefs {
> > ++class JS_PUBLIC_API SharedArrayRawBufferRefs {
> > +  public:
> > +   SharedArrayRawBufferRefs() =3D default;
> > +   SharedArrayRawBufferRefs(SharedArrayRawBufferRefs&& other) =3D defa=
ult;
> > +--
> > +2.31.1
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/=
mozjs-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78_78.15.0.bb
> > new file mode 100644
> > index 000000000..f4a6872b6
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8_78.15.0.bb
> > @@ -0,0 +1,140 @@
> > +SUMMARY =3D "SpiderMonkey is Mozilla's JavaScript engine written in C/=
C++"
> > +HOMEPAGE =3D "https://developer.mozilla.org/en-US/docs/Mozilla/Project=
s/SpiderMonkey"
> > +LICENSE =3D "MPL-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc9b6ecd19a14a54a628edaaf23=
733bf"
> > +
> > +SRC_URI =3D " \
> > +    https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/f=
irefox-${PV}esr.source.tar.xz \
> > +    file://0001-rust.configure-Skip-all-target-manipulations.patch \
> > +    file://0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.p=
atch \
> > +    file://0003-Cargo.toml-do-not-abort-on-panic.patch \
> > +    file://0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch=
 \
> > +    file://0005-use-asm-sgidefs.h.patch \
> > +    file://0006-fix-musl-build.patch \
> > +    file://0007-riscv.patch \
> > +    file://0008-riscv-Disable-atomic-operations.patch \
> > +    file://0009-riscv-Set-march-correctly.patch \
> > +    file://0010-replace-include-by-code-to-fix-arm-build.patch \
> > +    file://0011-Add-SharedArrayRawBufferRefs-to-public-API.patch \
> > +"
> > +
> > +SRC_URI[sha256sum] =3D "a4438d84d95171a6d4fea9c9f02c2edbf0475a9c614d96=
8ebe2eedc25a672151"
> > +S =3D "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
> > +
> > +DEPENDS =3D " \
> > +    autoconf-2.13-native \
> > +    icu-native \
> > +    cargo-native \
> > +    ${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer", "clang-n=
ative", "llvm-native", d)} \
> > +    zlib \
> > +    python3-six \
> > +    python3-six-native \
> > +"
> > +
> > +inherit autotools pkgconfig rust python3native siteinfo
> > +
> > +JIT ?=3D ""
> > +JIT:mipsarch =3D "--disable-jit"
> > +
> > +EXTRA_OECONF =3D " \
> > +    --target=3D${TARGET_SYS} \
> > +    --host=3D${BUILD_SYS} \
> > +    --prefix=3D${prefix} \
> > +    --libdir=3D${libdir} \
> > +    --without-system-icu \
> > +    --disable-tests --disable-strip --disable-optimize \
> > +    --disable-jemalloc \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-go=
ld", '--disable-gold', d)} \
> > +    ${JIT} \
> > +"
> > +
> > +# Note: Python with mozilla build is a mess: E.g: python-six: to get a=
n error
> > +# free configure we need:
> > +# * python3-six-native in DEPENDS
> > +# * python3-six in DEPENDS
> > +# * path to python-six shipped by mozilla in PYTHONPATH
> > +prepare_python_and_rust() {
> > +    if [ ! -f ${B}/PYTHONPATH ]; then
> > +        oldpath=3D`pwd`
> > +        cd ${S}
> > +        # Add mozjs python-modules necessary
> > +        PYTHONPATH=3D"${S}/build:${S}/config"
> > +        PYTHONPATH=3D"$PYTHONPATH:${S}/third_party/python/distro:${S}/=
third_party/python/jsmin"
> > +        PYTHONPATH=3D"$PYTHONPATH:${S}/third_party/python/pytoml:${S}/=
third_party/python/six"
> > +        PYTHONPATH=3D"$PYTHONPATH:${S}/third_party/python/pyyaml/lib3:=
${S}/third_party/python/which"
> > +        for sub_dir in python testing/mozbase; do
> > +            for module_dir in `ls $sub_dir -1`;do
> > +                [ $module_dir =3D "virtualenv" ] && continue
> > +                if [ -d "${S}/$sub_dir/$module_dir" ];then
> > +                    PYTHONPATH=3D"$PYTHONPATH:${S}/$sub_dir/$module_di=
r"
> > +                fi
> > +            done
> > +        done
> > +        # looks odd but it's huge and we want to see what's in there
> > +        echo "$PYTHONPATH" > ${B}/PYTHONPATH
> > +        cd "$oldpath"
> > +    fi
> > +
> > +    export PYTHONPATH=3D`cat ${B}/PYTHONPATH`
> > +
> > +    export RUST_TARGET_PATH=3D"${RUST_TARGET_PATH}"
> > +    export RUST_TARGET=3D"${TARGET_SYS}"
> > +    export RUSTFLAGS=3D"${RUSTFLAGS}"
> > +}
> > +
> > +export HOST_CC =3D "${BUILD_CC}"
> > +export HOST_CXX =3D "${BUILD_CXX}"
> > +export HOST_CFLAGS =3D "${BUILD_CFLAGS}"
> > +export HOST_CPPFLAGS =3D "${BUILD_CPPFLAGS}"
> > +export HOST_CXXFLAGS =3D "${BUILD_CXXFLAGS}"
> > +# otherwise we are asked for yasm...
> > +export AS =3D "${CC}"
> > +
> > +do_configure() {
> > +    prepare_python_and_rust
> > +
> > +    cd ${S}/js/src
> > +    autoconf213 --macrodir=3D${STAGING_DATADIR_NATIVE}/autoconf213 old=
-configure.in > old-configure
> > +
> > +    cd ${B}
> > +    # * use of /tmp can causes problems on heavily loaded hosts
> > +    # * with mozjs-78 we get without:
> > +    # | Path specified in LOCAL_INCLUDES (..) resolves to the topsrcdi=
r or topobjdir (<tmpdir>/oe-core-glibc/work/cortexa72-mortsgna-linux/mozjs-=
78/78.15.0-r0/firefox-78.15.0/js/src), which is not allowed
> > +    mkdir -p "${B}/lcl_tmp"
> > +    TMPDIR=3D"${B}/lcl_tmp"  ${S}/js/src/configure ${EXTRA_OECONF}
> > +
> > +    # inspired by what fedora [1] does: for big endian rebuild icu dat
> > +    # this avoids gjs qemu crash on mips at gir creation
> > +    # [1] https://src.fedoraproject.org/rpms/mozjs78/blob/rawhide/f/mo=
zjs78.spec
> > +    if [ ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little'=
, 'big', d)} =3D "big" ]; then
> > +        echo "Do big endian icu dat-convert..."
> > +        icupkg -tb ${S}/config/external/icu/data/icudt67l.dat ${S}/con=
fig/external/icu/data/icudt67b.dat
> > +        rm -f ${S}/config/external/icu/data/icudt*l.dat
> > +    fi
> > +}
> > +
> > +do_compile:prepend() {
> > +    prepare_python_and_rust
> > +}
> > +
> > +do_install:prepend() {
> > +    prepare_python_and_rust
> > +}
> > +
> > +MAJOR_VERSION =3D "${@oe.utils.trim_version("${PV}", 1)}"
> > +do_install:append() {
> > +    # tidy up installation
> > +    chmod -x ${D}${libdir}/pkgconfig/*.pc
> > +    sed -i 's:\x24{includedir}/mozjs-78/js/RequiredDefines.h:js/Requir=
edDefines.h:g' ${D}${libdir}/pkgconfig/*.pc
> > +
> > +    mv ${D}${libdir}/libmozjs-${MAJOR_VERSION}.so ${D}${libdir}/libmoz=
js-${MAJOR_VERSION}.so.${PV}
> > +    ln -s libmozjs-${MAJOR_VERSION}.so.${PV} ${D}${libdir}/libmozjs-${=
MAJOR_VERSION}.so.${MAJOR_VERSION}
> > +    ln -s libmozjs-${MAJOR_VERSION}.so.${PV} ${D}${libdir}/libmozjs-${=
MAJOR_VERSION}.so
> > +
> > +    rm -f ${D}${libdir}/libjs_static.ajs
> > +}
> > +
> > +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> > +ARM_INSTRUCTION_SET:armv4 =3D "arm"
> > +
> > +DISABLE_STATIC =3D ""
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#93707): https://lists.openembedded.org/g/openembedd=
ed-devel/message/93707
> > Mute This Topic: https://lists.openembedded.org/mt/86737132/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

