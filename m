Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A284C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 20:25:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.2737.1635193544161481519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXLCPe0p;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id w2so11510595qtn.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=47orbDB9JBiuvACUlIpqfy3iEhxfhXEU7xFfJNdpnzw=;
        b=gXLCPe0pnUHbmvw9wLQd7QTo3eCPdxALzPvFNDnZsfquccYkgdoUcY7ZibQJfTeuuB
         CvLuPI0uBXZF2sm4eBrGEi3EwZBbiJ1GbcO41WbEERg69S+95fuALPj91b5WCL36Smba
         04dpNTojJuNrdg37lCzs/xa+0o/+3Z4hvCtlMkLJw3+JIe8t2VT0xsdMVxqvh072Ydwr
         HuNR7CKRW6Q6+KmT39dYTf3pCVPWCIPwzyTqId9VTRDAWuXIA6M7XI7HDdmgGy+2EwEk
         2popRgTWgSemiPS+Uy5oGW/PvQPwkORS7L3TjV1nLnssz+tZyHteS5uOxKkklOOUftvI
         Au3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=47orbDB9JBiuvACUlIpqfy3iEhxfhXEU7xFfJNdpnzw=;
        b=a9wBUY4vuXVdlCmB0CWDZtSN99YR6Cg1N0CVVQCJvr0Co8nGAERGvKap4FZFpSCmdn
         rmT2/wBFiHWaPzHcbLsposRK63BnGbxvo4BOak6eOwe2w3qTgyXDE73vYy57Xg+/ay64
         swWq4AgOwDyLYP43FtSkvqzHiihH89YCAKMTl/UG37NCx7gMFGPQD6PovLnt1+Dxs7O7
         XOl8ZyskUwaOy4cnz8f7otRu/dBvVtsKvSkk2l/bDKzbHFtzCmLTodB1h6JEoSQv2cbH
         9nI4OH+wZxv8XRPpMnJY6XxYB5OgQjfw9gQGjWcQ/QonJx23xOrjjqO/SXwODrYLftU9
         6b9Q==
X-Gm-Message-State: AOAM532lM2HKYZrlOq2kk25GrDt8wSt5sr9pb/lgu3EwBzcqiyZjsik8
	OBvH6G9wb5VnBbL78i0ZxffE1XZWZCBu1T+jWQ0=
X-Google-Smtp-Source: 
 ABdhPJzRDyp5EZTZbzps7xXZtO2yu6gE+yUoAwVWZhgcKXiN3McHGpnDSyl/pJ+wtBvflwg9RpkUFoRSSgU4hBxhQxQ=
X-Received: by 2002:a05:622a:1788:: with SMTP id
 s8mr4806673qtk.116.1635193542820;
 Mon, 25 Oct 2021 13:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-6-alex@linutronix.de>
 <CALbNGRQKOSPK55jDHOVON3ct+dCgAN0j8D-EJ=Oayf0qHepJZQ@mail.gmail.com>
 <CAMKF1soHevhCSrKZM6qifuVHkAZ_CDmNkqpkDndRqB4GoygG_A@mail.gmail.com>
 <CANNYZj_j5Jm4GK8y-YB4J7Dgcwy10skHt1ba0v=XyBpLB-i09A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_j5Jm4GK8y-YB4J7Dgcwy10skHt1ba0v=XyBpLB-i09A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2021 13:25:31 -0700
Message-ID: 
 <CAMKF1spN9551JXDzDdumeQzRovNVXTJ+w3Z1mW_G252we46zWQ@mail.gmail.com>
Subject: Re: [PATCH 06/24] mozjs: update 60.9.0 -> 91.1.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>,
	Changqing Li <changqing.li@windriver.com>,
 Hongxu Jia <hongxu.jia@windriver.com>,
	Lei Maohui <leimaohui@cn.fujitsu.com>,
 Maciej Borzecki <maciej.borzecki@open-rnd.pl>,
	Mingli Yu <Mingli.Yu@windriver.com>, Ricardo Salveti <ricardo@foundries.io>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000042484805cf332a1a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 20:25:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93579

--00000000000042484805cf332a1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 12:55 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> What prompted me to update mozjs was that without this upgrade, anything
> less than mozjs-91 would itself become broken with the python 3.10 update
> (and thus, polkit would break as well). I test meta-oe builds with
>
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/c=
onfig.json#n906
> Getting that to pass is where I drew the line for 'things I need to fix',
> especially considering that getting new mozjs itself to build was not eas=
y,
> with transition to rust and all (appreciation from Andreas confirms that =
;).
>


Yes it is definitely good stuff however I would have liked to stage it a
bit longer I did not predict the slew of follow ups that it would need

Meta-gnome is not part of test job tested on yocto auto builder there are
few other layers from meta-openembedded which are excluded eg meta-xfce so
you don=E2=80=99t get all the failures there

>
>
> The PR for mozjs-91 support in gjs looks like it's getting close to being
> merged, so we're not going to be in this situation for much longer:
> https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/632
>
> Bleeding edge sometimes bleeds, this update does eliminate a major tech
> debt item and potential securty issue in meta-oe - and quite possibly
> actually unblocks updates to meta-gnome too.
>
> Alex
>
> On Mon, 25 Oct 2021 at 19:54, Khem Raj <raj.khem@gmail.com> wrote:
>
>> this has ensued a bunch of patches and unplanned extra work for others
>> to fix build for mips/riscv and packaging
>> which I guess, I should have waited on, this is behind and its building
>> on all
>> architectures we build in OE CI, but it has left gjs unbuildable as of
>> now. I have
>> started a recipe upgrade to 1.70.0 for gjs [1] but that itself is also
>> not enough since
>> mozjs 91 support is still not upstreamed in gjs [2]
>>
>> gjs seems to be at the heart of meta-gnome, so I can not even add it
>> to the exclusion list.
>> at this point one option is to exclude meta-gnome from my world CI to
>> avoid failed jobs [3]
>>
>> [1]
>> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dkraj/gjs
>> [2] https://gitlab.gnome.org/GNOME/gjs/-/issues/413
>> [3] http://jenkins.nas-admin.org/view/OE/
>>
>>
>> On Tue, Oct 12, 2021 at 2:20 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
>> wrote:
>> >
>> > Started this but did not get it to build. Thanks so much - you're my
>> > this month's hero!!!
>> >
>> > On Mon, Oct 11, 2021 at 8:41 PM Alexander Kanavin
>> > <alex.kanavin@gmail.com> wrote:
>> > >
>> > > The new release requires rust to build and at the same time allows
>> > > updating to python 3.10; I took the opportunity to rewrite the
>> > > recipe from scratch, drop all the old cruft and use the official,
>> > > current upstream build system in it.
>> > >
>> > > All prior patches and tweaks have been dropped; I have no
>> > > reasonable way to test them, so if something regressed
>> > > for you I'm afraid it needs to be addressed after the fact.
>> > >
>> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > > ---
>> > >  ...001-Cargo.toml-do-not-abort-on-panic.patch |   32 +
>> > >  .../mozjs/0001-Port-build-to-python3.patch    | 6897
>> -----------------
>> > >  ...-autoconf-s-config.sub-to-canonicali.patch |   28 +
>> > >  ...include-RequiredDefines.h-for-depend.patch |   33 -
>> > >  ...nfigure-do-not-look-for-llvm-objdump.patch |   43 +
>> > >  ...ix-cross-compilation-on-i586-targets.patch |   38 -
>> > >  ...o-not-try-to-find-a-suitable-upstrea.patch |   65 +
>> > >  ...004-do-not-create-python-environment.patch |   64 -
>> > >  .../mozjs/0005-fix-cannot-find-link.patch     |   34 -
>> > >  ...round-autoconf-2.13-detection-failed.patch |   28 -
>> > >  .../0007-fix-do_compile-failed-on-mips.patch  |   33 -
>> > >  .../mozjs/mozjs/0008-add-riscv-support.patch  |   50 -
>> > >  ...-mozjs-fix-coredump-caused-by-getenv.patch |   27 -
>> > >  .../mozjs/mozjs/0010-format-overflow.patch    |   21 -
>> > >  .../0011-To-fix-build-error-on-arm32BE.patch  |   28 -
>> > >  .../mozjs/mozjs/0012-JS_PUBLIC_API.patch      |   55 -
>> > >  ...0013-riscv-Disable-atomic-operations.patch |   38 -
>> > >  .../mozjs/0014-remove-JS_VOLATIME_ARM.patch   |  111 -
>> > >  ...-compiling-failure-on-mips64-n32-bsp.patch |   80 -
>> > >  .../mozjs/mozjs/musl/0001-support-musl.patch  |   98 -
>> > >  .../musl/0002-js-Fix-build-with-musl.patch    |   31 -
>> > >  .../recipes-extended/mozjs/mozjs_60.9.0.bb    |  147 -
>> > >  .../recipes-extended/mozjs/mozjs_91.1.0.bb    |   61 +
>> > >  23 files changed, 229 insertions(+), 7813 deletions(-)
>> > >  create mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-Car=
go.toml-do-not-abort-on-panic.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-Por=
t-build-to-python3.patch
>> > >  create mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-bui=
ld-do-not-use-autoconf-s-config.sub-to-canonicali.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0002-js.=
pc.in-do-not-include-RequiredDefines.h-for-depend.patch
>> > >  create mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0002-moz=
.configure-do-not-look-for-llvm-objdump.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0003-fix=
-cross-compilation-on-i586-targets.patch
>> > >  create mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0003-rus=
t.configure-do-not-try-to-find-a-suitable-upstrea.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0004-do-=
not-create-python-environment.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0005-fix=
-cannot-find-link.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0006-wor=
karound-autoconf-2.13-detection-failed.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0007-fix=
-do_compile-failed-on-mips.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0008-add=
-riscv-support.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0009-moz=
js-fix-coredump-caused-by-getenv.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0010-for=
mat-overflow.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0011-To-=
fix-build-error-on-arm32BE.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0012-JS_=
PUBLIC_API.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0013-ris=
cv-Disable-atomic-operations.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-rem=
ove-JS_VOLATIME_ARM.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/mipsarch=
n32/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/musl/000=
1-support-musl.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/musl/000=
2-js-Fix-build-with-musl.patch
>> > >  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.b=
b
>> > >  create mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.b=
b
>> > >
>> > > diff --git
>> a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-C=
argo.toml-do-not-abort-on-panic.patch
>> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-C=
argo.toml-do-not-abort-on-panic.patch
>> > > new file mode 100644
>> > > index 000000000..34861de7f
>> > > --- /dev/null
>> > > +++
>> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-C=
argo.toml-do-not-abort-on-panic.patch
>> > > @@ -0,0 +1,32 @@
>> > > +From 9e37248870b2b955293754933c789ca00bca06ef Mon Sep 17 00:00:00
>> 2001
>> > > +From: Alexander Kanavin <alex@linutronix.de>
>> > > +Date: Fri, 1 Oct 2021 13:00:24 +0200
>> > > +Subject: [PATCH] Cargo.toml: do not abort on panic
>> > > +
>> > > +OE's rust is configured to unwind, and this setting clashes with it=
/
>> > > +
>> > > +Upstream-Status: Inappropriate [oe-core specific]
>> > > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > > +---
>> > > + Cargo.toml | 3 +--
>> > > + 1 file changed, 1 insertion(+), 2 deletions(-)
>> > > +
>> > > +diff --git a/Cargo.toml b/Cargo.toml
>> > > +index 09f3e7292f..0fff412569 100644
>> > > +--- a/Cargo.toml
>> > > ++++ b/Cargo.toml
>> > > +@@ -57,7 +57,6 @@ panic =3D "abort"
>> > > + opt-level =3D 2
>> > > + rpath =3D false
>> > > + debug-assertions =3D false
>> > > +-panic =3D "abort"
>> > > +
>> > > + # Optimize build dependencies, because bindgen and proc macros /
>> style
>> > > + # compilation take more to run than to build otherwise.
>> > > +@@ -105,4 +104,4 @@ path =3D "third_party/rust/mio"
>> > > +
>> > > + # Patch failure 0.1.8 to disable the backtrace feature by default.
>> See bug 1608157.
>> > > + [patch.crates-io.failure]
>> > > +-path =3D "third_party/rust/failure"
>> > > +\ No newline at end of file
>> > > ++path =3D "third_party/rust/failure"
>> > > diff --git
>> a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-P=
ort-build-to-python3.patch
>> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-P=
ort-build-to-python3.patch
>> > > deleted file mode 100644
>> > > index 5cdad93e9..000000000
>> > > ---
>> a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-P=
ort-build-to-python3.patch
>> > > +++ /dev/null
>> > > @@ -1,6897 +0,0 @@
>> > > -From 33a373ba41d978af60c2f0230bcba6ad27357ec8 Mon Sep 17 00:00:00
>> 2001
>> > > -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gm=
ail.com>
>> > > -Date: Wed, 29 Jan 2020 16:25:11 +0100
>> > > -Subject: [PATCH] Port build to python3
>> > > -MIME-Version: 1.0
>> > > -Content-Type: text/plain; charset=3DUTF-8
>> > > -Content-Transfer-Encoding: 8bit
>> > > -
>> > > -* first tool of choice was 2to3
>> > > -* some parts were taken from [1] but during work it was found that
>> this patch
>> > > -  introduces interesting effects - see hash functions. Working more
>> on this
>> > > -  makes me guess that one has never worked...
>> > > -* Few parts were taken from upstream mirror [2]. Since they use six
>> for porting
>> > > -  to python3 it adds us a new dependency.
>> > > -* To get a better overview what is going on or failing some
>> additional messages
>> > > -  were added. The most verbose one is left disabled - see
>> > > -  python/mozbuild/mozbuild/configure/__init__.py / Line 310 onwards
>> > > -* major changes upstream on build are not to expect so upgrading
>> should cause
>> > > -  little trouble and changes can be tracked by [3]
>> > > -* some solutions are workarounds/hacks so this patch will not be
>> accepted
>> > > -  upstream. This should not be a problem for us: once mozjs >=3D 68
>> will arrive
>> > > -  we have to go to rust/cargo based build anyway.
>> > > -
>> > > -[1]
>> https://code.foxkit.us/adelie/packages/blob/f2b5773da19ab397fbe64fd32dac=
c383cfe4cd77/user/mozjs/python3.patch
>> > > -[2] https://github.com/mozilla/gecko-dev
>> > > -[3] https://github.com/mozilla/gecko-dev/tree/esr60
>> > > -
>> > > -Upstream-Status: Inappropriate [Some Hacks]
>> > > -
>> > > -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> > > ----
>> > > - build/autoconf/config.status.m4               |   2 +-
>> > > - build/moz.configure/android-ndk.configure     |   4 +-
>> > > - build/moz.configure/checks.configure          |   4 +-
>> > > - build/moz.configure/init.configure            |  31 +-
>> > > - build/moz.configure/keyfiles.configure        |   4 +-
>> > > - build/moz.configure/old.configure             |  32 +-
>> > > - build/moz.configure/toolchain.configure       |  18 +-
>> > > - build/moz.configure/util.configure            |   9 +-
>> > > - build/moz.configure/windows.configure         |  10 +-
>> > > - build/templates.mozbuild                      |   2 +-
>> > > - config/MozZipFile.py                          |  12 +-
>> > > - config/expandlibs.py                          |   6 +-
>> > > - config/expandlibs_exec.py                     |  14 +-
>> > > - config/expandlibs_gen.py                      |   4 +-
>> > > - configure.py                                  |  42 +-
>> > > - js/src/build/moz.build                        |   8 +-
>> > > - js/src/builtin/embedjs.py                     |  10 +-
>> > > - js/src/configure                              |   2 +-
>> > > - js/src/frontend/GenerateReservedWords.py      |   6 +-
>> > > - js/src/gc/GenerateStatsPhases.py              |   4 +-
>> > > - js/src/old-configure.in                       |   2 +
>> > > - memory/build/moz.build                        |   8 +-
>> > > - mozglue/build/moz.build                       |  22 +-
>> > > - .../mozbuild/mozbuild/action/check_binary.py  |   2 +
>> > > - .../mozbuild/action/process_define_files.py   |   4 +-
>> > > - python/mozbuild/mozbuild/backend/base.py      |   8 +-
>> > > - python/mozbuild/mozbuild/backend/common.py    |   8 +-
>> > > - .../mozbuild/backend/configenvironment.py     |  14 +-
>> > > - .../mozbuild/mozbuild/backend/fastermake.py   |  10 +-
>> > > - .../mozbuild/backend/recursivemake.py         | 181 +++----
>> > > - python/mozbuild/mozbuild/config_status.py     |   7 +-
>> > > - .../mozbuild/mozbuild/configure/__init__.py   |  83 +++-
>> > > - .../mozbuild/configure/check_debug_ranges.py  |   6 +-
>> > > - python/mozbuild/mozbuild/configure/options.py |  24 +-
>> > > - python/mozbuild/mozbuild/configure/util.py    |  12 +-
>> > > - .../mozbuild/mozbuild/controller/building.py  |  16 +-
>> > > - python/mozbuild/mozbuild/frontend/context.py  |  89 ++--
>> > > - python/mozbuild/mozbuild/frontend/data.py     |   8 +-
>> > > - python/mozbuild/mozbuild/frontend/emitter.py  |  50 +-
>> > > - python/mozbuild/mozbuild/frontend/reader.py   |  49 +-
>> > > - python/mozbuild/mozbuild/frontend/sandbox.py  |   3 +-
>> > > - python/mozbuild/mozbuild/jar.py               |  12 +-
>> > > - python/mozbuild/mozbuild/makeutil.py          |  24 +-
>> > > - python/mozbuild/mozbuild/mozinfo.py           |   8 +-
>> > > - python/mozbuild/mozbuild/preprocessor.py      |  27 +-
>> > > - python/mozbuild/mozbuild/shellutil.py         |   6 +-
>> > > - .../test/backend/test_recursivemake.py        |  18 +-
>> > > - .../mozbuild/test/configure/common.py         |   8 +-
>> > > - .../mozbuild/mozbuild/test/configure/lint.py  |   8 +-
>> > > - .../test/configure/test_checks_configure.py   |   8 +-
>> > > - .../test/configure/test_compile_checks.py     |   4 +-
>> > > - .../mozbuild/test/configure/test_configure.py | 244 +++++-----
>> > > - .../mozbuild/test/configure/test_lint.py      |  24 +-
>> > > - .../test/configure/test_moz_configure.py      |  32 +-
>> > > - .../mozbuild/test/configure/test_options.py   | 450
>> +++++++++---------
>> > > - .../configure/test_toolchain_configure.py     |  22 +-
>> > > - .../test/configure/test_toolchain_helpers.py  |  62 +--
>> > > - .../configure/test_toolkit_moz_configure.py   |   2 +-
>> > > - .../mozbuild/test/configure/test_util.py      |   8 +-
>> > > - python/mozbuild/mozbuild/testing.py           |  10 +-
>> > > - python/mozbuild/mozbuild/util.py              |  79 ++-
>> > > - python/mozbuild/mozbuild/virtualenv.py        |   6 +-
>> > > - python/mozbuild/mozpack/chrome/manifest.py    |   6 +-
>> > > - python/mozbuild/mozpack/copier.py             |  12 +-
>> > > - python/mozbuild/mozpack/files.py              |  22 +-
>> > > - python/mozbuild/mozpack/manifests.py          |  16 +-
>> > > - python/mozbuild/mozpack/mozjar.py             |  37 +-
>> > > - .../manifestparser/manifestparser/ini.py      |  13 +-
>> > > - .../manifestparser/manifestparser.py          |  24 +-
>> > > - testing/mozbase/mozinfo/mozinfo/mozinfo.py    |  26 +-
>> > > - .../mozprocess/mozprocess/processhandler.py   |  10 +-
>> > > - third_party/python/which/which.py             |  18 +-
>> > > - 72 files changed, 1081 insertions(+), 993 deletions(-)
>> > > -
>> > > -diff --git a/build/autoconf/config.status.m4
>> b/build/autoconf/config.status.m4
>> > > -index c75575386..543c2d682 100644
>> > > ---- a/build/autoconf/config.status.m4
>> > > -+++ b/build/autoconf/config.status.m4
>> > > -@@ -122,7 +122,7 @@ trap 'rm -f $CONFIG_STATUS conftest*; exit 1' 1
>> 2 15
>> > > -
>> > > - dnl We're going to need [ ] for python syntax.
>> > > - changequote(<<<, >>>)dnl
>> > > --echo creating $CONFIG_STATUS
>> > > -+echo creating $CONFIG_STATUS in `pwd`
>> > > -
>> > > - cat > $CONFIG_STATUS <<EOF
>> > > -
>> > > -diff --git a/build/moz.configure/android-ndk.configure
>> b/build/moz.configure/android-ndk.configure
>> > > -index 1067b8619..3b592a237 100644
>> > > ---- a/build/moz.configure/android-ndk.configure
>> > > -+++ b/build/moz.configure/android-ndk.configure
>> > > -@@ -30,7 +30,7 @@ js_option('--with-android-version',
>> > > -
>> > > -
>> > > - @depends('--with-android-version', min_android_version, '--help')
>> > > --@imports(_from=3D'__builtin__', _import=3D'ValueError')
>> > > -+@imports(_from=3D'builtins', _import=3D'ValueError')
>> > > - def android_version(value, min_version, _):
>> > > -     if not value:
>> > > -         # Someone has passed --without-android-version.
>> > > -@@ -68,7 +68,7 @@ add_old_configure_assignment('android_ndk', ndk)
>> > > -
>> > > - @depends(ndk)
>> > > - @checking('for android ndk version')
>> > > --@imports(_from=3D'__builtin__', _import=3D'open')
>> > > -+@imports(_from=3D'builtins', _import=3D'open')
>> > > - def ndk_version(ndk):
>> > > -     if not ndk:
>> > > -         # Building 'js/src' for non-Android.
>> > > -diff --git a/build/moz.configure/checks.configure
>> b/build/moz.configure/checks.configure
>> > > -index 516652da9..11e1091c6 100644
>> > > ---- a/build/moz.configure/checks.configure
>> > > -+++ b/build/moz.configure/checks.configure
>> > > -@@ -14,7 +14,7 @@
>> > > -
>> > > -
>> > > - @template
>> > > --@imports(_from=3D'__builtin__', _import=3D'Exception')
>> > > -+@imports(_from=3D'builtins', _import=3D'Exception')
>> > > - def _declare_exceptions():
>> > > -     class FatalCheckError(Exception):
>> > > -         '''An exception to throw from a function decorated with
>> @checking.
>> > > -@@ -57,7 +57,7 @@ def checking(what, callback=3DNone):
>> > > -                 try:
>> > > -                     ret =3D func(*args, **kwargs)
>> > > -                 except FatalCheckError as e:
>> > > --                    error =3D e.message
>> > > -+                    error =3D str(e)
>> > > -                 display_ret =3D callback(ret) if callback else ret
>> > > -                 if display_ret is True:
>> > > -                     log.info('yes')
>> > > -diff --git a/build/moz.configure/init.configure
>> b/build/moz.configure/init.configure
>> > > -index 648ac2ded..4d74547d8 100644
>> > > ---- a/build/moz.configure/init.configure
>> > > -+++ b/build/moz.configure/init.configure
>> > > -@@ -14,7 +14,7 @@ option(env=3D'DIST', nargs=3D1, help=3D'DIST dire=
ctory')
>> > > -
>> > > -
>> > > - @depends('--help', 'DIST')
>> > > --@imports(_from=3D'__builtin__', _import=3D'open')
>> > > -+@imports(_from=3D'builtins', _import=3D'open')
>> > > - @imports(_from=3D'os.path', _import=3D'exists')
>> > > - def check_build_environment(help, dist):
>> > > -     topobjdir =3D os.path.realpath(os.path.abspath('.'))
>> > > -@@ -65,7 +65,7 @@ def check_build_environment(help, dist):
>> > > -     # Check for CRLF line endings.
>> > > -     with open(os.path.join(topsrcdir, 'configure.py'), 'rb') as fh=
:
>> > > -         data =3D fh.read()
>> > > --        if '\r' in data:
>> > > -+        if b'\r' in data:
>> > > -             die('\n ***\n'
>> > > -                 ' * The source tree appears to have Windows-style
>> line endings.\n'
>> > > -                 ' *\n'
>> > > -@@ -269,7 +269,7 @@ def early_options():
>> > > -     def early_options():
>> > > -         return set(
>> > > -             option.env
>> > > --            for option in __sandbox__._options.itervalues()
>> > > -+            for option in __sandbox__._options.values()
>> > > -             if option.env
>> > > -         )
>> > > -     return early_options
>> > > -@@ -307,15 +307,15 @@ def mozconfig_options(mozconfig, automation,
>> help):
>> > > -                 log.info('  %s' % arg)
>> > > -                 helper.add(arg, origin=3D'mozconfig',
>> args=3Dhelper._args)
>> > > -
>> > > --        for key, value in mozconfig['env']['added'].iteritems():
>> > > -+        for key, value in mozconfig['env']['added'].items():
>> > > -             add(key, value)
>> > > -             os.environ[key] =3D value
>> > > --        for key, (_, value) in
>> mozconfig['env']['modified'].iteritems():
>> > > -+        for key, (_, value) in mozconfig['env']['modified'].items(=
):
>> > > -             add(key, value)
>> > > -             os.environ[key] =3D value
>> > > --        for key, value in mozconfig['vars']['added'].iteritems():
>> > > -+        for key, value in mozconfig['vars']['added'].items():
>> > > -             add(key, value)
>> > > --        for key, (_, value) in
>> mozconfig['vars']['modified'].iteritems():
>> > > -+        for key, (_, value) in
>> mozconfig['vars']['modified'].items():
>> > > -             add(key, value)
>> > > -
>> > > -
>> > > -@@ -353,7 +353,7 @@ option(env=3D'PYTHON3', nargs=3D1, help=3D'Pyth=
on 3
>> interpreter (3.5 or later)')
>> > > - @depends('PYTHON3')
>> > > - @checking('for Python 3',
>> > > -           callback=3Dlambda x: '%s (%s)' % (x.path, x.str_version)=
 if
>> x else 'no')
>> > > --@imports(_from=3D'__builtin__', _import=3D'Exception')
>> > > -+@imports(_from=3D'builtins', _import=3D'Exception')
>> > > - @imports(_from=3D'mozbuild.pythonutil',
>> _import=3D'find_python3_executable')
>> > > - @imports(_from=3D'mozbuild.pythonutil',
>> _import=3D'python_executable_version')
>> > > - def python3(env_python):
>> > > -@@ -377,9 +377,6 @@ def python3(env_python):
>> > > -         if not python:
>> > > -             return None
>> > > -
>> > > --        # The API returns a bytes whereas everything in configure
>> is unicode.
>> > > --        python =3D python.decode('utf-8')
>> > > --
>> > > -     return namespace(
>> > > -         path=3Dpython,
>> > > -         version=3Dversion,
>> > > -@@ -481,6 +478,8 @@ def hg_config(build_env, hg, version):
>> > > - @imports('re')
>> > > - def git_version(git):
>> > > -     out =3D check_cmd_output(git, '--version').rstrip()
>> > > -+    if isinstance(out, bytes):
>> > > -+        out =3D out.decode('utf-8')
>> > > -
>> > > -     match =3D re.search('git version (.*)$', out)
>> > > -
>> > > -@@ -551,8 +550,8 @@ option('--target', nargs=3D1,
>> > > - @imports(_from=3D'mozbuild.configure.constants', _import=3D'Endian=
ness')
>> > > - @imports(_from=3D'mozbuild.configure.constants', _import=3D'Kernel=
')
>> > > - @imports(_from=3D'mozbuild.configure.constants', _import=3D'OS')
>> > > --@imports(_from=3D'__builtin__', _import=3D'KeyError')
>> > > --@imports(_from=3D'__builtin__', _import=3D'ValueError')
>> > > -+@imports(_from=3D'builtins', _import=3D'KeyError')
>> > > -+@imports(_from=3D'builtins', _import=3D'ValueError')
>> > > - def split_triplet(triplet, allow_unknown=3DFalse):
>> > > -     # The standard triplet is defined as
>> > > -     #   CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM
>> > > -@@ -562,6 +561,8 @@ def split_triplet(triplet, allow_unknown=3DFals=
e):
>> > > -     # Additionally, some may omit "unknown" when the manufacturer
>> > > -     # is not specified and emit
>> > > -     #   CPU_TYPE-OPERATING_SYSTEM
>> > > -+    if isinstance(triplet, bytes):
>> > > -+        triplet =3D triplet.decode('utf-8')
>> > > -     parts =3D triplet.split('-', 2)
>> > > -     if len(parts) =3D=3D 3:
>> > > -         cpu, _, os =3D parts
>> > > -@@ -987,7 +988,7 @@ add_old_configure_assignment('MOZ_BUILD_APP',
>> build_project)
>> > > - # - otherwise, if we have "a" in GRE_MILESTONE, we're building
>> Nightly or Aurora
>> > > - # - otherwise, we're building Release/Beta (define RELEASE_OR_BETA=
)
>> > > - @depends(check_build_environment, '--help')
>> > > --@imports(_from=3D'__builtin__', _import=3D'open')
>> > > -+@imports(_from=3D'builtins', _import=3D'open')
>> > > - @imports('re')
>> > > - def milestone(build_env, _):
>> > > -     milestone_path =3D os.path.join(build_env.topsrcdir,
>> > > -@@ -1105,7 +1106,7 @@ def enabled_in_nightly(milestone, _):
>> > > - def all_configure_options():
>> > > -     result =3D []
>> > > -     previous =3D None
>> > > --    for option in __sandbox__._options.itervalues():
>> > > -+    for option in __sandbox__._options.values():
>> > > -         # __sandbox__._options contains items for both option.name
>> and
>> > > -         # option.env. But it's also an OrderedDict, meaning both a=
re
>> > > -         # consecutive.
>> > > -diff --git a/build/moz.configure/keyfiles.configure
>> b/build/moz.configure/keyfiles.configure
>> > > -index 5d51cccea..14a35a3c6 100644
>> > > ---- a/build/moz.configure/keyfiles.configure
>> > > -+++ b/build/moz.configure/keyfiles.configure
>> > > -@@ -16,8 +16,8 @@ def keyfile(desc, default=3DNone, help=3DNone,
>> callback=3Dlambda x: x):
>> > > -
>> > > -     @depends('--with-%s-keyfile' % name)
>> > > -     @checking('for the %s key' % desc, lambda x: x and x is not
>> no_key)
>> > > --    @imports(_from=3D'__builtin__', _import=3D'open')
>> > > --    @imports(_from=3D'__builtin__', _import=3D'IOError')
>> > > -+    @imports(_from=3D'builtins', _import=3D'open')
>> > > -+    @imports(_from=3D'builtins', _import=3D'IOError')
>> > > -     def keyfile(value):
>> > > -         if value:
>> > > -             try:
>> > > -diff --git a/build/moz.configure/old.configure
>> b/build/moz.configure/old.configure
>> > > -index 81c10b91f..29b496bae 100644
>> > > ---- a/build/moz.configure/old.configure
>> > > -+++ b/build/moz.configure/old.configure
>> > > -@@ -64,9 +64,9 @@ set_config('AUTOCONF', autoconf)
>> > > -
>> > > - @depends('OLD_CONFIGURE', mozconfig, autoconf,
>> check_build_environment, shell,
>> > > -          old_configure_assignments, build_project)
>> > > --@imports(_from=3D'__builtin__', _import=3D'open')
>> > > --@imports(_from=3D'__builtin__', _import=3D'print')
>> > > --@imports(_from=3D'__builtin__', _import=3D'sorted')
>> > > -+@imports(_from=3D'builtins', _import=3D'open')
>> > > -+@imports(_from=3D'builtins', _import=3D'print')
>> > > -+@imports(_from=3D'builtins', _import=3D'sorted')
>> > > - @imports('glob')
>> > > - @imports('itertools')
>> > > - @imports('subprocess')
>> > > -@@ -113,7 +113,7 @@ def prepare_configure(old_configure, mozconfig,
>> autoconf, build_env, shell,
>> > > -
>> > > -         # Make old-configure append to config.log, where we put ou=
r
>> own log.
>> > > -         # This could be done with a m4 macro, but it's way easier
>> this way
>> > > --        script =3D script.replace('>./config.log', '>>./config.log=
')
>> > > -+        script =3D script.replace(b'>./config.log', b'>>./config.l=
og')
>> > > -
>> > > -         with open(old_configure, 'wb') as fh:
>> > > -             fh.write(script)
>> > > -@@ -282,8 +282,8 @@ def old_configure_options(*options):
>> > > -     '--x-includes',
>> > > -     '--x-libraries',
>> > > - )
>> > > --@imports(_from=3D'__builtin__', _import=3D'compile')
>> > > --@imports(_from=3D'__builtin__', _import=3D'open')
>> > > -+@imports(_from=3D'builtins', _import=3D'compile')
>> > > -+@imports(_from=3D'builtins', _import=3D'open')
>> > > - @imports('logging')
>> > > - @imports('os')
>> > > - @imports('subprocess')
>> > > -@@ -326,7 +326,7 @@ def old_configure(prepare_configure,
>> extra_old_configure_args, all_options,
>> > > -     log.debug('Running %s', quote(*cmd))
>> > > -     if extra_env:
>> > > -         log.debug('with extra environment: %s',
>> > > --                  ' '.join('%s=3D%s' % pair for pair in
>> extra_env.iteritems()))
>> > > -+                  ' '.join('%s=3D%s' % pair for pair in
>> extra_env.items()))
>> > > -
>> > > -     # Our logging goes to config.log, the same file old.configure
>> uses.
>> > > -     # We can't share the handle on the file, so close it. We assum=
e
>> nothing
>> > > -@@ -359,7 +359,7 @@ def old_configure(prepare_configure,
>> extra_old_configure_args, all_options,
>> > > -         # Every variation of the exec() function I tried led to:
>> > > -         # SyntaxError: unqualified exec is not allowed in function
>> 'main' it
>> > > -         # contains a nested function with free variables
>> > > --        exec code in raw_config # noqa
>> > > -+        exec(code, raw_config) # noqa
>> > > -
>> > > -     # Ensure all the flags known to old-configure appear in the
>> > > -     # @old_configure_options above.
>> > > -@@ -393,16 +393,24 @@ def set_old_configure_define(name, value):
>> > > - @depends(old_configure)
>> > > - @imports('types')
>> > > - def post_old_configure(raw_config):
>> > > -+    log.info('post_old_configure started')
>> > > -+
>> > > -     for k, v in raw_config['substs']:
>> > > -         set_old_configure_config(
>> > > --            k[1:-1], v[1:-1] if isinstance(v, types.StringTypes)
>> else v)
>> > > -+            k[1:-1], v[1:-1] if isinstance(v, str) else v)
>> > > -+
>> > > -+    log.info('post_old_configure 1 finished')
>> > > -
>> > > --    for k, v in dict(raw_config['defines']).iteritems():
>> > > -+    for k, v in dict(raw_config['defines']).items():
>> > > -         set_old_configure_define(k[1:-1], v[1:-1])
>> > > -
>> > > -+    log.info('post_old_configure 2 finished')
>> > > -+
>> > > -     set_old_configure_config('non_global_defines',
>> > > -                              raw_config['non_global_defines'])
>> > > -
>> > > -+    log.info('post_old_configure 3 finished')
>> > > -+
>> > > -
>> > > - # Assuming no other option is declared after this function, handle
>> the
>> > > - # env options that were injected by mozconfig_options by creating
>> dummy
>> > > -@@ -414,6 +422,7 @@ def post_old_configure(raw_config):
>> > > - @imports('__sandbox__')
>> > > - @imports(_from=3D'mozbuild.configure.options', _import=3D'Option')
>> > > - def remaining_mozconfig_options(_):
>> > > -+    log.info('remaining_mozconfig_options started')
>> > > -     helper =3D __sandbox__._helper
>> > > -     for arg in helper:
>> > > -         if helper._origins[arg] !=3D 'mozconfig':
>> > > -@@ -422,5 +431,6 @@ def remaining_mozconfig_options(_):
>> > > -         if name.isupper() and name not in __sandbox__._options:
>> > > -             option =3D Option(env=3Dname, nargs=3D'*', help=3Dname=
)
>> > > -             helper.handle(option)
>> > > -+    log.info('remaining_mozconfig_options finished')
>> > > -
>> > > - # Please do not add anything after remaining_mozconfig_options()
>> > > -diff --git a/build/moz.configure/toolchain.configure
>> b/build/moz.configure/toolchain.configure
>> > > -index fc640c75e..c5508dfb7 100755
>> > > ---- a/build/moz.configure/toolchain.configure
>> > > -+++ b/build/moz.configure/toolchain.configure
>> > > -@@ -391,7 +391,7 @@ def get_compiler_info(compiler, language):
>> > > -         ('CPU', CPU_preprocessor_checks),
>> > > -         ('KERNEL', kernel_preprocessor_checks),
>> > > -     ):
>> > > --        for n, (value, condition) in
>> enumerate(preprocessor_checks.iteritems()):
>> > > -+        for n, (value, condition) in
>> enumerate(preprocessor_checks.items()):
>> > > -             check +=3D dedent('''\
>> > > -                 #%(if)s %(condition)s
>> > > -                 %%%(name)s "%(value)s"
>> > > -@@ -425,9 +425,9 @@ def get_compiler_info(compiler, language):
>> > > -     data =3D {}
>> > > -     for line in result.splitlines():
>> > > -         if line.startswith(b'%'):
>> > > --            k, _, v =3D line.partition(' ')
>> > > --            k =3D k.lstrip('%')
>> > > --            data[k] =3D v.replace(' ', '').lstrip('"').rstrip('"')
>> > > -+            k, _, v =3D line.partition(b' ')
>> > > -+            k =3D k.lstrip(b'%').decode('utf-8')
>> > > -+            data[k] =3D v.replace(b' ',
>> b'').lstrip(b'"').rstrip(b'"').decode('utf-8')
>> > > -             log.debug('%s =3D %s', k, data[k])
>> > > -
>> > > -     try:
>> > > -@@ -551,7 +551,7 @@ def check_compiler(compiler, language, target):
>> > > -     )
>> > > -
>> > > -
>> > > --@imports(_from=3D'__builtin__', _import=3D'open')
>> > > -+@imports(_from=3D'builtins', _import=3D'open')
>> > > - @imports('json')
>> > > - @imports('subprocess')
>> > > - @imports('sys')
>> > > -@@ -606,7 +606,7 @@ def vs_major_version(value):
>> > > -
>> > > -
>> > > - @depends(host, target, vs_major_version, check_build_environment,
>> '--with-visual-studio-version')
>> > > --@imports(_from=3D'__builtin__', _import=3D'sorted')
>> > > -+@imports(_from=3D'builtins', _import=3D'sorted')
>> > > - @imports(_from=3D'operator', _import=3D'itemgetter')
>> > > - @imports('platform')
>> > > - def vc_compiler_path(host, target, vs_major_version, env,
>> vs_release_name):
>> > > -@@ -807,7 +807,7 @@ def compiler(language, host_or_target,
>> c_compiler=3DNone, other_compiler=3DNone,
>> > > -                     target.os !=3D 'Android':
>> > > -                 return namespace(**{
>> > > -                     k: [] if k =3D=3D 'flags' else v
>> > > --                    for k, v in other_compiler.__dict__.iteritems(=
)
>> > > -+                    for k, v in other_compiler.__dict__.items()
>> > > -                 })
>> > > -
>> > > -     # Normally, we'd use `var` instead of `_var`, but the
>> interaction with
>> > > -@@ -1238,7 +1238,7 @@ set_config('VISIBILITY_FLAGS',
>> visibility_flags)
>> > > -
>> > > - @depends(c_compiler)
>> > > - @imports('multiprocessing')
>> > > --@imports(_from=3D'__builtin__', _import=3D'min')
>> > > -+@imports(_from=3D'builtins', _import=3D'min')
>> > > - def pgo_flags(compiler):
>> > > -     if compiler.type in ('gcc', 'clang'):
>> > > -         return namespace(
>> > > -@@ -1517,6 +1517,8 @@ def enable_gnu_linker(enable_gold_option,
>> c_compiler, developer_options, build_e
>> > > -         gold =3D check_cmd_output(*detection_cmd).strip()
>> > > -         if not gold:
>> > > -             return
>> > > -+        if isinstance(gold, bytes):
>> > > -+            gold =3D gold.decode('utf-8')
>> > > -
>> > > -         goldFullPath =3D find_program(gold)
>> > > -         if goldFullPath is None:
>> > > -diff --git a/build/moz.configure/util.configure
>> b/build/moz.configure/util.configure
>> > > -index 3284fd8b5..218813e2d 100644
>> > > ---- a/build/moz.configure/util.configure
>> > > -+++ b/build/moz.configure/util.configure
>> > > -@@ -25,7 +25,6 @@ def configure_error(message):
>> > > - # does not.
>> > > -
>> > > -
>> > > --@imports(_from=3D'__builtin__', _import=3D'unicode')
>> > > - @imports('subprocess')
>> > > - @imports('sys')
>> > > - @imports(_from=3D'mozbuild.configure.util', _import=3D'LineIO')
>> > > -@@ -39,10 +38,10 @@ def check_cmd_output(*args, **kwargs):
>> > > -     if 'env' in kwargs:
>> > > -         normalized_env =3D {}
>> > > -         for k, v in kwargs['env'].items():
>> > > --            if isinstance(k, unicode):
>> > > -+            if isinstance(k, str):
>> > > -                 k =3D k.encode('utf-8', 'strict')
>> > > -
>> > > --            if isinstance(v, unicode):
>> > > -+            if isinstance(v, str):
>> > > -                 v =3D v.encode('utf-8', 'strict')
>> > > -
>> > > -             normalized_env[k] =3D v
>> > > -@@ -285,7 +284,7 @@ def unique_list(l):
>> > > - #     ('19.0', 'x64', r'C:\...\amd64\cl.exe')
>> > > - #     ('19.0', 'x86', r'C:\...\amd64_x86\cl.exe')
>> > > - @imports(_import=3D'_winreg', _as=3D'winreg')
>> > > --@imports(_from=3D'__builtin__', _import=3D'WindowsError')
>> > > -+@imports(_from=3D'builtins', _import=3D'WindowsError')
>> > > - @imports(_from=3D'fnmatch', _import=3D'fnmatch')
>> > > - def get_registry_values(pattern, get_32_and_64_bit=3DFalse):
>> > > -     def enum_helper(func, key):
>> > > -@@ -360,6 +359,8 @@ def get_registry_values(pattern,
>> get_32_and_64_bit=3DFalse):
>> > > - @imports(_from=3D'mozbuild.configure.util', _import=3D'Version',
>> _as=3D'_Version')
>> > > - def Version(v):
>> > > -     'A version number that can be compared usefully.'
>> > > -+    if isinstance(v, bytes):
>> > > -+        v =3D v.decode('utf-8')
>> > > -     return _Version(v)
>> > > -
>> > > - # Denotes a deprecated option. Combines option() and @depends:
>> > > -diff --git a/build/moz.configure/windows.configure
>> b/build/moz.configure/windows.configure
>> > > -index a5b790e3b..2b88fc447 100644
>> > > ---- a/build/moz.configure/windows.configure
>> > > -+++ b/build/moz.configure/windows.configure
>> > > -@@ -10,7 +10,7 @@ option('--with-windows-version', nargs=3D1,
>> default=3D'603',
>> > > -
>> > > -
>> > > - @depends('--with-windows-version')
>> > > --@imports(_from=3D'__builtin__', _import=3D'ValueError')
>> > > -+@imports(_from=3D'builtins', _import=3D'ValueError')
>> > > - def valid_windows_version(value):
>> > > -     if not value:
>> > > -         die('Cannot build with --without-windows-version')
>> > > -@@ -50,8 +50,8 @@ def windows_sdk_dir(value, host):
>> > > -
>> > > - @imports('os')
>> > > - @imports('re')
>> > > --@imports(_from=3D'__builtin__', _import=3D'sorted')
>> > > --@imports(_from=3D'__builtin__', _import=3D'WindowsError')
>> > > -+@imports(_from=3D'builtins', _import=3D'sorted')
>> > > -+@imports(_from=3D'builtins', _import=3D'WindowsError')
>> > > - def get_sdk_dirs(sdk, subdir):
>> > > -     def get_dirs_containing(sdk, stem, subdir):
>> > > -         base =3D os.path.join(sdk, stem)
>> > > -@@ -96,7 +96,7 @@ def valid_windows_sdk_dir_result(value):
>> > > -
>> > > - @depends(c_compiler, windows_sdk_dir, valid_windows_version,
>> 'WINDOWSSDKDIR')
>> > > - @checking('for Windows SDK', valid_windows_sdk_dir_result)
>> > > --@imports(_from=3D'__builtin__', _import=3D'sorted')
>> > > -+@imports(_from=3D'builtins', _import=3D'sorted')
>> > > - @imports(_from=3D'textwrap', _import=3D'dedent')
>> > > - def valid_windows_sdk_dir(compiler, windows_sdk_dir, target_versio=
n,
>> > > -                           windows_sdk_dir_env):
>> > > -@@ -174,7 +174,7 @@ def valid_ucrt_sdk_dir_result(value):
>> > > - @depends(windows_sdk_dir, 'WINDOWSSDKDIR', c_compiler)
>> > > - @checking('for Universal CRT SDK', valid_ucrt_sdk_dir_result)
>> > > - @imports('os')
>> > > --@imports(_from=3D'__builtin__', _import=3D'sorted')
>> > > -+@imports(_from=3D'builtins', _import=3D'sorted')
>> > > - @imports(_import=3D'mozpack.path', _as=3D'mozpath')
>> > > - def valid_ucrt_sdk_dir(windows_sdk_dir, windows_sdk_dir_env,
>> c_compiler):
>> > > -     if windows_sdk_dir_env:
>> > > -diff --git a/build/templates.mozbuild b/build/templates.mozbuild
>> > > -index 3da850ce5..ae5e410fe 100644
>> > > ---- a/build/templates.mozbuild
>> > > -+++ b/build/templates.mozbuild
>> > > -@@ -10,7 +10,7 @@ def Binary():
>> > > -     templates.'''
>> > > -
>> > > -     # Add -llog by default, since we use it all over the place.
>> > > --    if CONFIG['OS_TARGET'] =3D=3D 'Android':
>> > > -+    if str(CONFIG['OS_TARGET']) =3D=3D 'Android':
>> > > -         OS_LIBS +=3D ['log']
>> > > -
>> > > -
>> > > -diff --git a/config/MozZipFile.py b/config/MozZipFile.py
>> > > -index 337fe0521..dc7add4c3 100644
>> > > ---- a/config/MozZipFile.py
>> > > -+++ b/config/MozZipFile.py
>> > > -@@ -18,7 +18,7 @@ class ZipFile(zipfile.ZipFile):
>> > > -   def __init__(self, file, mode=3D"r", compression=3Dzipfile.ZIP_S=
TORED,
>> > > -                lock =3D False):
>> > > -     if lock:
>> > > --      assert isinstance(file, basestring)
>> > > -+      assert isinstance(file, str)
>> > > -       self.lockfile =3D lock_file(file + '.lck')
>> > > -     else:
>> > > -       self.lockfile =3D None
>> > > -@@ -46,7 +46,7 @@ class ZipFile(zipfile.ZipFile):
>> > > -                               date_time=3Dtime.localtime(time.time=
()))
>> > > -       zinfo.compress_type =3D self.compression
>> > > -       # Add some standard UNIX file access permissions (-rw-r--r--=
).
>> > > --      zinfo.external_attr =3D (0x81a4 & 0xFFFF) << 16L
>> > > -+      zinfo.external_attr =3D (0x81a4 & 0xFFFF) << 16
>> > > -     else:
>> > > -       zinfo =3D zinfo_or_arcname
>> > > -
>> > > -@@ -58,7 +58,7 @@ class ZipFile(zipfile.ZipFile):
>> > > -     # as the old, reuse the existing entry.
>> > > -
>> > > -     doSeek =3D False # store if we need to seek to the eof after
>> overwriting
>> > > --    if self.NameToInfo.has_key(zinfo.filename):
>> > > -+    if zinfo.filename in self.NameToInfo:
>> > > -       # Find the last ZipInfo with our name.
>> > > -       # Last, because that's catching multiple overwrites
>> > > -       i =3D len(self.filelist)
>> > > -@@ -109,14 +109,14 @@ class ZipFile(zipfile.ZipFile):
>> > > -       # adjust file mode if we originally just wrote, now we rewri=
te
>> > > -       self.fp.close()
>> > > -       self.fp =3D open(self.filename, 'r+b')
>> > > --    all =3D map(lambda zi: (zi, True), self.filelist) + \
>> > > --        map(lambda zi: (zi, False), self._remove)
>> > > -+    all =3D [(zi, True) for zi in self.filelist] + \
>> > > -+        [(zi, False) for zi in self._remove]
>> > > -     all.sort(lambda l, r: cmp(l[0].header_offset,
>> r[0].header_offset))
>> > > -     # empty _remove for multiple closes
>> > > -     self._remove =3D []
>> > > -
>> > > -     lengths =3D [all[i+1][0].header_offset - all[i][0].header_offs=
et
>> > > --               for i in xrange(len(all)-1)]
>> > > -+               for i in range(len(all)-1)]
>> > > -     lengths.append(self.end - all[-1][0].header_offset)
>> > > -     to_pos =3D 0
>> > > -     for (zi, keep), length in zip(all, lengths):
>> > > -diff --git a/config/expandlibs.py b/config/expandlibs.py
>> > > -index ac06c432f..df1fed15d 100644
>> > > ---- a/config/expandlibs.py
>> > > -+++ b/config/expandlibs.py
>> > > -@@ -26,7 +26,7 @@ ${LIB_PREFIX}${ROOT}.${LIB_SUFFIX} following thes=
e
>> rules:
>> > > -   descriptor contains. And for each of these LIBS, also apply the
>> same
>> > > -   rules.
>> > > - '''
>> > > --from __future__ import with_statement
>> > > -+
>> > > - import sys, os, errno
>> > > - import expandlibs_config as conf
>> > > -
>> > > -@@ -36,7 +36,7 @@ def ensureParentDir(file):
>> > > -     if dir and not os.path.exists(dir):
>> > > -         try:
>> > > -             os.makedirs(dir)
>> > > --        except OSError, error:
>> > > -+        except OSError as error:
>> > > -             if error.errno !=3D errno.EEXIST:
>> > > -                 raise
>> > > -
>> > > -@@ -140,4 +140,4 @@ class ExpandArgs(list):
>> > > -         return [relativize(arg)]
>> > > -
>> > > - if __name__ =3D=3D '__main__':
>> > > --    print " ".join(ExpandArgs(sys.argv[1:]))
>> > > -+    print(" ".join(ExpandArgs(sys.argv[1:])))
>> > > -diff --git a/config/expandlibs_exec.py b/config/expandlibs_exec.py
>> > > -index df656016c..fb786a6a8 100644
>> > > ---- a/config/expandlibs_exec.py
>> > > -+++ b/config/expandlibs_exec.py
>> > > -@@ -20,7 +20,7 @@ With the --symbol-order argument, followed by a
>> file name, it will add the
>> > > - relevant linker options to change the order in which the linker
>> puts the
>> > > - symbols appear in the resulting binary. Only works for ELF targets=
.
>> > > - '''
>> > > --from __future__ import with_statement
>> > > -+
>> > > - import sys
>> > > - import os
>> > > - from expandlibs import (
>> > > -@@ -304,11 +304,11 @@ class SectionFinder(object):
>> > > -         return syms
>> > > -
>> > > - def print_command(out, args):
>> > > --    print >>out, "Executing: " + " ".join(args)
>> > > -+    print("Executing: " + " ".join(args), file=3Dout)
>> > > -     for tmp in [f for f in args.tmp if os.path.isfile(f)]:
>> > > --        print >>out, tmp + ":"
>> > > -+        print(tmp + ":", file=3Dout)
>> > > -         with open(tmp) as file:
>> > > --            print >>out, "".join(["    " + l for l in
>> file.readlines()])
>> > > -+            print("".join(["    " + l for l in file.readlines()]),
>> file=3Dout)
>> > > -     out.flush()
>> > > -
>> > > - def main(args, proc_callback=3DNone):
>> > > -@@ -338,13 +338,13 @@ def main(args, proc_callback=3DNone):
>> > > -             proc =3D subprocess.Popen(args, stdout =3D subprocess.=
PIPE,
>> stderr =3D subprocess.STDOUT)
>> > > -             if proc_callback:
>> > > -                 proc_callback(proc)
>> > > --        except Exception, e:
>> > > --            print >>sys.stderr, 'error: Launching', args, ':', e
>> > > -+        except Exception as e:
>> > > -+            print('error: Launching', args, ':', e, file=3Dsys.std=
err)
>> > > -             raise e
>> > > -         (stdout, stderr) =3D proc.communicate()
>> > > -         if proc.returncode and not options.verbose:
>> > > -             print_command(sys.stderr, args)
>> > > --        sys.stderr.write(stdout)
>> > > -+        sys.stderr.write(stdout.decode("utf-8"))
>> > > -         sys.stderr.flush()
>> > > -         if proc.returncode:
>> > > -             return proc.returncode
>> > > -diff --git a/config/expandlibs_gen.py b/config/expandlibs_gen.py
>> > > -index b1de63cd0..dc62bd184 100644
>> > > ---- a/config/expandlibs_gen.py
>> > > -+++ b/config/expandlibs_gen.py
>> > > -@@ -5,7 +5,7 @@
>> > > - '''Given a list of object files and library names, prints a librar=
y
>> > > - descriptor to standard output'''
>> > > -
>> > > --from __future__ import with_statement
>> > > -+
>> > > - import sys
>> > > - import os
>> > > - import expandlibs_config as conf
>> > > -@@ -38,4 +38,4 @@ if __name__ =3D=3D '__main__':
>> > > -
>> > > -     ensureParentDir(options.output)
>> > > -     with open(options.output, 'w') as outfile:
>> > > --        print >>outfile, generate(args)
>> > > -+        print(generate(args), file=3Doutfile)
>> > > -diff --git a/configure.py b/configure.py
>> > > -index 771e34e38..bee329d7c 100644
>> > > ---- a/configure.py
>> > > -+++ b/configure.py
>> > > -@@ -2,10 +2,11 @@
>> > > - # License, v. 2.0. If a copy of the MPL was not distributed with
>> this
>> > > - # file, You can obtain one at http://mozilla.org/MPL/2.0/.
>> > > -
>> > > --from __future__ import print_function, unicode_literals
>> > > -+
>> > > -
>> > > - import codecs
>> > > - import itertools
>> > > -+import logging
>> > > - import os
>> > > - import sys
>> > > - import textwrap
>> > > -@@ -34,7 +35,9 @@ from mozbuild.util import (
>> > > - def main(argv):
>> > > -     config =3D {}
>> > > -     sandbox =3D ConfigureSandbox(config, os.environ, argv)
>> > > -+    print('sandbox.run started')
>> > > -     sandbox.run(os.path.join(os.path.dirname(__file__),
>> 'moz.configure'))
>> > > -+    print('sandbox.run finished')
>> > > -
>> > > -     if sandbox._help:
>> > > -         return 0
>> > > -@@ -56,12 +59,21 @@ def config_status(config):
>> > > -
>> > > -     sanitized_config =3D {}
>> > > -     sanitized_config['substs'] =3D {
>> > > --        k: sanitized_bools(v) for k, v in config.iteritems()
>> > > -+        k: sanitized_bools(v) for k, v in config.items()
>> > > -         if k not in ('DEFINES', 'non_global_defines', 'TOPSRCDIR',
>> 'TOPOBJDIR',
>> > > -                      'ALL_CONFIGURE_PATHS')
>> > > -     }
>> > > -+
>> > > -+    # Hack around OptionValue entries unknown during compile
>> > > -+    for opt in ('BUILD_BACKENDS', 'MOZ_UI_LOCALE', 'RUSTFLAGS' ):
>> > > -+        old =3D sanitized_config['substs'][opt]
>> > > -+        new =3D []
>> > > -+        for setting in old:
>> > > -+            new.append(setting)
>> > > -+        sanitized_config['substs'][opt] =3D new
>> > > -+
>> > > -     sanitized_config['defines'] =3D {
>> > > --        k: sanitized_bools(v) for k, v in
>> config['DEFINES'].iteritems()
>> > > -+        k: sanitized_bools(v) for k, v in config['DEFINES'].items(=
)
>> > > -     }
>> > > -     sanitized_config['non_global_defines'] =3D
>> config['non_global_defines']
>> > > -     sanitized_config['topsrcdir'] =3D config['TOPSRCDIR']
>> > > -@@ -71,20 +83,17 @@ def config_status(config):
>> > > -     # Create config.status. Eventually, we'll want to just do the
>> work it does
>> > > -     # here, when we're able to skip configure tests/use cached
>> results/not rely
>> > > -     # on autoconf.
>> > > --    print("Creating config.status", file=3Dsys.stderr)
>> > > --    encoding =3D 'mbcs' if sys.platform =3D=3D 'win32' else 'utf-8=
'
>> > > --    with codecs.open('config.status', 'w', encoding) as fh:
>> > > -+    logging.getLogger('moz.configure').info('Creating
>> config.status')
>> > > -+    with codecs.open('config.status', 'w', 'utf-8') as fh:
>> > > -         fh.write(textwrap.dedent('''\
>> > > -             #!%(python)s
>> > > --            # coding=3D%(encoding)s
>> > > --            from __future__ import unicode_literals
>> > > --            from mozbuild.util import encode
>> > > --            encoding =3D '%(encoding)s'
>> > > --        ''') % {'python': config['PYTHON'], 'encoding': encoding})
>> > > -+            # coding=3Dutf-8
>> > > -+            print("config.status started")
>> > > -+        ''') % {'python': config['PYTHON']})
>> > > -         # A lot of the build backend code is currently expecting
>> byte
>> > > -         # strings and breaks in subtle ways with unicode strings.
>> (bug 1296508)
>> > > --        for k, v in sanitized_config.iteritems():
>> > > --            fh.write('%s =3D encode(%s, encoding)\n' % (k,
>> indented_repr(v)))
>> > > -+        for k, v in sanitized_config.items():
>> > > -+            fh.write('%s =3D %s\n' % (k, indented_repr(v)))
>> > > -         fh.write("__all__ =3D ['topobjdir', 'topsrcdir', 'defines'=
, "
>> > > -                  "'non_global_defines', 'substs', 'mozconfig']")
>> > > -
>> > > -@@ -97,6 +106,9 @@ def config_status(config):
>> > > -                     args =3D dict([(name, globals()[name]) for nam=
e
>> in __all__])
>> > > -                     config_status(**args)
>> > > -             '''))
>> > > -+        fh.write(textwrap.dedent('''
>> > > -+            print("config.status finished")
>> > > -+        '''))
>> > > -
>> > > -     partial_config =3D PartialConfigEnvironment(config['TOPOBJDIR'=
])
>> > > -     partial_config.write_vars(sanitized_config)
>> > > -@@ -116,7 +128,7 @@ def config_status(config):
>> > > -     # executable permissions.
>> > > -     os.chmod('config.status', 0o755)
>> > > -     if config.get('MOZ_BUILD_APP') !=3D 'js' or
>> config.get('JS_STANDALONE'):
>> > > --        os.environ[b'WRITE_MOZINFO'] =3D b'1'
>> > > -+        os.environ['WRITE_MOZINFO'] =3D '1'
>> > > -         from mozbuild.config_status import config_status
>> > > -
>> > > -         # Some values in sanitized_config also have more complex
>> types, such as
>> > > -@@ -127,7 +139,7 @@ def config_status(config):
>> > > -
>> > > -         # A lot of the build backend code is currently expecting
>> byte strings
>> > > -         # and breaks in subtle ways with unicode strings.
>> > > --        return config_status(args=3D[], **encode(sanitized_config,
>> encoding))
>> > > -+        return config_status(args=3D[], **sanitized_config)
>> > > -     return 0
>> > > -
>> > > -
>> > > -diff --git a/js/src/build/moz.build b/js/src/build/moz.build
>> > > -index a7f5fa4ce..856cae32d 100644
>> > > ---- a/js/src/build/moz.build
>> > > -+++ b/js/src/build/moz.build
>> > > -@@ -47,22 +47,22 @@ USE_LIBS +=3D [
>> > > -     'zlib',
>> > > - ]
>> > > -
>> > > --if CONFIG['OS_ARCH'] not in ('WINNT', 'HP-UX'):
>> > > -+if str(CONFIG['OS_ARCH']) not in ('WINNT', 'HP-UX'):
>> > > -     OS_LIBS +=3D [
>> > > -         'm',
>> > > -     ]
>> > > -
>> > > --if CONFIG['OS_ARCH'] =3D=3D 'FreeBSD':
>> > > -+if str(CONFIG['OS_ARCH']) =3D=3D 'FreeBSD':
>> > > -     OS_LIBS +=3D [
>> > > -         '-pthread',
>> > > -     ]
>> > > -
>> > > --if CONFIG['OS_ARCH'] =3D=3D 'Linux':
>> > > -+if str(CONFIG['OS_ARCH']) =3D=3D 'Linux':
>> > > -     OS_LIBS +=3D [
>> > > -         'dl',
>> > > -     ]
>> > > -
>> > > --if CONFIG['OS_ARCH'] =3D=3D 'SunOS':
>> > > -+if str(CONFIG['OS_ARCH']) =3D=3D 'SunOS':
>> > > -     OS_LIBS +=3D [
>> > > -         'posix4',
>> > > -         'dl',
>> > > -diff --git a/js/src/builtin/embedjs.py b/js/src/builtin/embedjs.py
>> > > -index ba25e71c1..d4f2de122 100644
>> > > ---- a/js/src/builtin/embedjs.py
>> > > -+++ b/js/src/builtin/embedjs.py
>> > > -@@ -36,7 +36,7 @@
>> > > - #
>> > > - # It uses the C preprocessor to process its inputs.
>> > > -
>> > > --from __future__ import with_statement
>> > > -+
>> > > - import re, sys, os, subprocess
>> > > - import shlex
>> > > - import which
>> > > -@@ -52,8 +52,8 @@ def ToCAsciiArray(lines):
>> > > -
>> > > - def ToCArray(lines):
>> > > -   result =3D []
>> > > --  for chr in lines:
>> > > --    result.append(str(ord(chr)))
>> > > -+  for char in lines:
>> > > -+    result.append("0x%0.2X" % char)
>> > > -   return ", ".join(result)
>> > > -
>> > > - HEADER_TEMPLATE =3D """\
>> > > -@@ -87,7 +87,7 @@ def embed(cxx, preprocessorOption, cppflags, msgs=
,
>> sources, c_out, js_out, names
>> > > -
>> > > -   js_out.write(processed)
>> > > -   import zlib
>> > > --  compressed =3D zlib.compress(processed)
>> > > -+  compressed =3D zlib.compress(processed.encode('utf-8'))
>> > > -   data =3D ToCArray(compressed)
>> > > -   c_out.write(HEADER_TEMPLATE % {
>> > > -     'sources_type': 'unsigned char',
>> > > -@@ -107,7 +107,7 @@ def preprocess(cxx, preprocessorOption, source,
>> args =3D []):
>> > > -   tmpOut =3D 'self-hosting-preprocessed.pp';
>> > > -   outputArg =3D shlex.split(preprocessorOption + tmpOut)
>> > > -
>> > > --  with open(tmpIn, 'wb') as input:
>> > > -+  with open(tmpIn, 'w') as input:
>> > > -     input.write(source)
>> > > -   print(' '.join(cxx + outputArg + args + [tmpIn]))
>> > > -   result =3D subprocess.Popen(cxx + outputArg + args + [tmpIn]).wa=
it()
>> > > -diff --git a/js/src/configure b/js/src/configure
>> > > -index 3b3a39af3..8f5ea41d0 100755
>> > > ---- a/js/src/configure
>> > > -+++ b/js/src/configure
>> > > -@@ -24,4 +24,4 @@ export OLD_CONFIGURE=3D"$SRCDIR"/old-configure
>> > > -
>> > > - set -- "$@" --enable-project=3Djs
>> > > -
>> > > --which python2.7 > /dev/null && exec python2.7
>> "$TOPSRCDIR/configure.py" "$@" || exec python "$TOPSRCDIR/configure.py" =
"$@"
>> > > -+which python3 > /dev/null && exec python3 "$TOPSRCDIR/configure.py=
"
>> "$@" || exec python "$TOPSRCDIR/configure.py" "$@"
>> > > -diff --git a/js/src/frontend/GenerateReservedWords.py
>> b/js/src/frontend/GenerateReservedWords.py
>> > > -index 3aa2307b9..381c8e2b4 100644
>> > > ---- a/js/src/frontend/GenerateReservedWords.py
>> > > -+++ b/js/src/frontend/GenerateReservedWords.py
>> > > -@@ -80,14 +80,14 @@ def split_list_per_column(reserved_word_list,
>> column):
>> > > -         per_column =3D column_dict.setdefault(word[column], [])
>> > > -         per_column.append(item)
>> > > -
>> > > --    return sorted(column_dict.items(), key=3Dlambda (char, word):
>> ord(char))
>> > > -+    return sorted(list(column_dict.items()), key=3Dlambda char_wor=
d:
>> ord(char_word[0]))
>> > > -
>> > > - def generate_letter_switch(opt, unprocessed_columns,
>> reserved_word_list,
>> > > -                            columns=3DNone):
>> > > -     assert(len(reserved_word_list) !=3D 0);
>> > > -
>> > > -     if not columns:
>> > > --        columns =3D range(0, unprocessed_columns)
>> > > -+        columns =3D list(range(0, unprocessed_columns))
>> > > -
>> > > -     if len(reserved_word_list) =3D=3D 1:
>> > > -         index, word =3D reserved_word_list[0]
>> > > -@@ -161,7 +161,7 @@ def split_list_per_length(reserved_word_list):
>> > > -         per_length =3D length_dict.setdefault(len(word), [])
>> > > -         per_length.append(item)
>> > > -
>> > > --    return sorted(length_dict.items(), key=3Dlambda (length, word)=
:
>> length)
>> > > -+    return sorted(list(length_dict.items()), key=3Dlambda
>> length_word: length_word[0])
>> > > -
>> > > - def generate_switch(opt, reserved_word_list):
>> > > -     assert(len(reserved_word_list) !=3D 0);
>> > > -diff --git a/js/src/gc/GenerateStatsPhases.py
>> b/js/src/gc/GenerateStatsPhases.py
>> > > -index 2daf83555..e39a26a4b 100644
>> > > ---- a/js/src/gc/GenerateStatsPhases.py
>> > > -+++ b/js/src/gc/GenerateStatsPhases.py
>> > > -@@ -267,7 +267,7 @@ def generateHeader(out):
>> > > -     #
>> > > -     # Generate PhaseKind enum.
>> > > -     #
>> > > --    phaseKindNames =3D map(lambda phaseKind: phaseKind.name,
>> AllPhaseKinds)
>> > > -+    phaseKindNames =3D [phaseKind.name for phaseKind in AllPhaseKi=
nds]
>> > > -     extraPhaseKinds =3D [
>> > > -         "NONE =3D LIMIT",
>> > > -         "EXPLICIT_SUSPENSION =3D LIMIT",
>> > > -@@ -279,7 +279,7 @@ def generateHeader(out):
>> > > -     #
>> > > -     # Generate Phase enum.
>> > > -     #
>> > > --    phaseNames =3D map(lambda phase: phase.name, AllPhases)
>> > > -+    phaseNames =3D [phase.name for phase in AllPhases]
>> > > -     extraPhases =3D [
>> > > -         "NONE =3D LIMIT",
>> > > -         "EXPLICIT_SUSPENSION =3D LIMIT",
>> > > -diff --git a/js/src/old-configure.in b/js/src/old-configure.in
>> > > -index 11c3d5a2e..389265404 100644
>> > > ---- a/js/src/old-configure.in
>> > > -+++ b/js/src/old-configure.in
>> > > -@@ -1884,3 +1884,5 @@ if test "$JS_STANDALONE"; then
>> > > - fi
>> > > -
>> > > - rm -fr confdefs* $ac_clean_files
>> > > -+echo confdefs* $ac_clean_files removed
>> > > -+echo "old-configure done"
>> > > -diff --git a/memory/build/moz.build b/memory/build/moz.build
>> > > -index e2c715271..f09ce7935 100644
>> > > ---- a/memory/build/moz.build
>> > > -+++ b/memory/build/moz.build
>> > > -@@ -30,7 +30,7 @@ else:
>> > > -         'fallback.cpp',
>> > > -     ]
>> > > -
>> > > --if CONFIG['OS_TARGET'] =3D=3D 'Darwin' and
>> (CONFIG['MOZ_REPLACE_MALLOC'] or
>> > > -+if str(CONFIG['OS_TARGET']) =3D=3D 'Darwin' and
>> (CONFIG['MOZ_REPLACE_MALLOC'] or
>> > > -         CONFIG['MOZ_MEMORY']):
>> > > -     SOURCES +=3D [
>> > > -         'zone.c',
>> > > -@@ -38,15 +38,15 @@ if CONFIG['OS_TARGET'] =3D=3D 'Darwin' and
>> (CONFIG['MOZ_REPLACE_MALLOC'] or
>> > > -
>> > > - Library('memory')
>> > > -
>> > > --if CONFIG['OS_TARGET'] =3D=3D 'Android' and CONFIG['CC_TYPE'] =3D=
=3D
>> 'clang':
>> > > -+if str(CONFIG['OS_TARGET']) =3D=3D 'Android' and str(CONFIG['CC_TY=
PE'])
>> =3D=3D 'clang':
>> > > -     CXXFLAGS +=3D [
>> > > -         '-Wno-tautological-pointer-compare',
>> > > -     ]
>> > > -
>> > > --if CONFIG['MOZ_BUILD_APP'] !=3D 'memory':
>> > > -+if str(CONFIG['MOZ_BUILD_APP']) !=3D 'memory':
>> > > -     FINAL_LIBRARY =3D 'mozglue'
>> > > -
>> > > --if CONFIG['CC_TYPE'] in ('msvc', 'clang-cl'):
>> > > -+if str(CONFIG['CC_TYPE']) in ('msvc', 'clang-cl'):
>> > > -     CXXFLAGS +=3D ['-wd4273'] # inconsistent dll linkage (bug 5581=
63)
>> > > -
>> > > - if CONFIG['MOZ_REPLACE_MALLOC_STATIC']:
>> > > -diff --git a/mozglue/build/moz.build b/mozglue/build/moz.build
>> > > -index 53758485a..5e9308802 100644
>> > > ---- a/mozglue/build/moz.build
>> > > -+++ b/mozglue/build/moz.build
>> > > -@@ -9,12 +9,12 @@
>> > > - # If this is ever changed, update MOZ_SHARED_MOZGLUE in
>> browser/installer/Makefile.in
>> > > - if CONFIG['JS_STANDALONE'] and not CONFIG['MOZ_MEMORY']:
>> > > -     Library('mozglue')
>> > > --elif CONFIG['OS_TARGET'] in ('WINNT', 'Darwin', 'Android'):
>> > > -+elif str(CONFIG['OS_TARGET']) in ('WINNT', 'Darwin', 'Android'):
>> > > -     SharedLibrary('mozglue')
>> > > - else:
>> > > -     Library('mozglue')
>> > > -
>> > > --if CONFIG['OS_TARGET'] =3D=3D 'Android':
>> > > -+if str(CONFIG['OS_TARGET']) =3D=3D 'Android':
>> > > -     SOURCES +=3D [
>> > > -         'BionicGlue.cpp',
>> > > -     ]
>> > > -@@ -24,14 +24,14 @@ if CONFIG['MOZ_ASAN']:
>> > > -         'AsanOptions.cpp',
>> > > -     ]
>> > > -
>> > > --if CONFIG['OS_TARGET'] =3D=3D 'WINNT':
>> > > -+if str(CONFIG['OS_TARGET']) =3D=3D 'WINNT':
>> > > -     DEFFILE =3D 'mozglue.def'
>> > > -     # We'll break the DLL blocklist if we immediately load
>> user32.dll
>> > > -     DELAYLOAD_DLLS +=3D [
>> > > -         'user32.dll',
>> > > -     ]
>> > > -
>> > > --    if CONFIG['CC_TYPE'] =3D=3D "msvc":
>> > > -+    if str(CONFIG['CC_TYPE']) =3D=3D "msvc":
>> > > -         CFLAGS +=3D ['-guard:cf']
>> > > -         CXXFLAGS +=3D ['-guard:cf']
>> > > -         LDFLAGS +=3D ['-guard:cf']
>> > > -@@ -48,12 +48,12 @@ if CONFIG['MOZ_WIDGET_TOOLKIT']:
>> > > -             'dummy.cpp',
>> > > -         ]
>> > > -
>> > > --    if CONFIG['OS_TARGET'] =3D=3D 'WINNT':
>> > > -+    if str(CONFIG['OS_TARGET']) =3D=3D 'WINNT':
>> > > -         LOCAL_INCLUDES +=3D [
>> > > -             '/memory/build',
>> > > -         ]
>> > > -
>> > > --        if CONFIG['CC_TYPE'] =3D=3D "msvc":
>> > > -+        if str(CONFIG['CC_TYPE']) =3D=3D "msvc":
>> > > -             SOURCES +=3D ['WindowsCFGStatus.cpp']
>> > > -         SOURCES +=3D [
>> > > -             'Authenticode.cpp',
>> > > -@@ -85,17 +85,17 @@ if CONFIG['MOZ_WIDGET_TOOLKIT']:
>> > > -         'WindowsDllBlocklist.h',
>> > > -     ]
>> > > -
>> > > --    if CONFIG['CPU_ARCH'].startswith('x86'):
>> > > -+    if str(CONFIG['CPU_ARCH']).startswith('x86'):
>> > > -         SOURCES +=3D [
>> > > -             'SSE.cpp',
>> > > -         ]
>> > > -
>> > > --    if CONFIG['CPU_ARCH'] =3D=3D 'arm':
>> > > -+    if str(CONFIG['CPU_ARCH']) =3D=3D 'arm':
>> > > -         SOURCES +=3D [
>> > > -             'arm.cpp',
>> > > -         ]
>> > > -
>> > > --    if CONFIG['CPU_ARCH'].startswith('mips'):
>> > > -+    if str(CONFIG['CPU_ARCH']).startswith('mips'):
>> > > -         SOURCES +=3D [
>> > > -             'mips.cpp',
>> > > -         ]
>> > > -@@ -114,7 +114,7 @@ LIBRARY_DEFINES['MOZ_HAS_MOZGLUE'] =3D True
>> > > -
>> > > - LDFLAGS +=3D CONFIG['MOZ_GLUE_WRAP_LDFLAGS']
>> > > -
>> > > --if CONFIG['OS_TARGET'] =3D=3D 'Darwin':
>> > > -+if str(CONFIG['OS_TARGET']) =3D=3D 'Darwin':
>> > > -     # On OSX 10.10.3, a dead lock happens in some cases involving
>> dynamic
>> > > -     # symbol resolution for symbols that jemalloc itself uses.
>> While it
>> > > -     # might be possible to find a way to avoid all such symbol
>> resolutions,
>> > > -@@ -124,7 +124,7 @@ if CONFIG['OS_TARGET'] =3D=3D 'Darwin':
>> > > -     # for TLS.
>> > > -     LDFLAGS +=3D ['-Wl,-bind_at_load']
>> > > -
>> > > --if CONFIG['MOZ_LINKER'] and CONFIG['TARGET_CPU'] =3D=3D 'arm':
>> > > -+if CONFIG['MOZ_LINKER'] and str(CONFIG['TARGET_CPU']) =3D=3D 'arm'=
:
>> > > -     LDFLAGS +=3D ['-Wl,-version-script,%s/arm-eabi-filter' % SRCDI=
R]
>> > > -
>> > > - DIST_INSTALL =3D True
>> > > -diff --git a/python/mozbuild/mozbuild/action/check_binary.py
>> b/python/mozbuild/mozbuild/action/check_binary.py
>> > > -index 5665ef053..b696f73d6 100644
>> > > ---- a/python/mozbuild/mozbuild/action/check_binary.py
>> > > -+++ b/python/mozbuild/mozbuild/action/check_binary.py
>> > > -@@ -104,6 +104,8 @@ def iter_readelf_symbols(target, binary):
>> > > -
>> > > - def iter_readelf_dynamic(target, binary):
>> > > -     for line in get_output(target['readelf'], '-d', binary):
>> > > -+        if isinstance(line, bytes):
>> > > -+            line=3Dline.decode('utf-8')
>> > > -         data =3D line.split(None, 2)
>> > > -         if data and len(data) =3D=3D 3 and data[0].startswith('0x'=
):
>> > > -             yield data[1].rstrip(')').lstrip('('), data[2]
>> > > -diff --git a/python/mozbuild/mozbuild/action/process_define_files.p=
y
>> b/python/mozbuild/mozbuild/action/process_define_files.py
>> > > -index 563fbb8fa..c3df2869b 100644
>> > > ---- a/python/mozbuild/mozbuild/action/process_define_files.py
>> > > -+++ b/python/mozbuild/mozbuild/action/process_define_files.py
>> > > -@@ -2,7 +2,7 @@
>> > > - # License, v. 2.0. If a copy of the MPL was not distributed with
>> this
>> > > - # file, You can obtain one at http://mozilla.org/MPL/2.0/.
>> > > -
>> > > --from __future__ import absolute_import, print_function,
>> unicode_literals
>> > > -+
>> > > -
>> > > - import argparse
>> > > - import os
>> > > -@@ -53,7 +53,7 @@ def process_define_file(output, input):
>> > > -                                 'CONFIGURE_DEFINE_FILE')
>> > > -                         defines =3D '\n'.join(sorted(
>> > > -                             '#define %s %s' % (name, val)
>> > > --                            for name, val in
>> config.defines['ALLDEFINES'].iteritems()))
>> > > -+                            for name, val in
>> config.defines['ALLDEFINES'].items()))
>> > > -                         l =3D l[:m.start('cmd') - 1] \
>> > > -                             + defines + l[m.end('name'):]
>> > > -                     elif cmd =3D=3D 'define':
>> > > -diff --git a/python/mozbuild/mozbuild/backend/base.py
>> b/python/mozbuild/mozbuild/backend/base.py
>> > > -index a8d5c94e0..7cda63475 100644
>> > > ---- a/python/mozbuild/mozbuild/backend/base.py
>> > > -+++ b/python/mozbuild/mozbuild/backend/base.py
>> > > -@@ -2,7 +2,7 @@
>> > > - # License, v. 2.0. If a copy of the MPL was not distributed with
>> this
>> > > - # file, You can obtain one at http://mozilla.org/MPL/2.0/.
>> > > -
>> > > --from __future__ import absolute_import, unicode_literals
>> > > -+
>> > > -
>> > > - from abc import (
>> > > -     ABCMeta,
>> > > -@@ -31,7 +31,7 @@ from .configenvironment import ConfigEnvironment
>> > > - from mozbuild.base import ExecutionSummary
>> > > -
>> > > -
>> > > --class BuildBackend(LoggingMixin):
>> > > -+class BuildBackend(LoggingMixin, metaclass=3DABCMeta):
>> > > -     """Abstract base class for build backends.
>> > > -
>> > > -     A build backend is merely a consumer of the build configuratio=
n
>> (the output
>> > > -@@ -39,8 +39,6 @@ class BuildBackend(LoggingMixin):
>> > > -     is the discretion of the specific implementation.
>> > > -     """
>> > > -
>> > > --    __metaclass__ =3D ABCMeta
>> > > --
>> > > -     def __init__(self, environment):
>> > > -         assert isinstance(environment, (ConfigEnvironment,
>> EmptyConfig))
>> > > -         self.populate_logger()
>> > > -@@ -311,7 +309,7 @@ class BuildBackend(LoggingMixin):
>> > > -         srcdir =3D mozpath.dirname(obj.input_path)
>> > > -         pp.context.update({
>> > > -             k: ' '.join(v) if isinstance(v, list) else v
>> > > --            for k, v in obj.config.substs.iteritems()
>> > > -+            for k, v in obj.config.substs.items()
>> > > -         })
>> > > -         pp.context.update(
>> > > -             top_srcdir=3Dobj.topsrcdir,
>> > > -diff --git a/python/mozbuild/mozbuild/backend/common.py
>> b/python/mozbuild/mozbuild/backend/common.py
>> > > -index d00cbbcaf..f747df446 100644
>> > > ---- a/python/mozbuild/mozbuild/backend/common.py
>> > > -+++ b/python/mozbuild/mozbuild/backend/common.py
>> > > -@@ -2,7 +2,7 @@
>> > > - # License, v. 2.0. If a copy of the MPL was not distributed with
>> this
>> > > - # file, You can obtain one at http://mozilla.org/MPL/2.0/.
>> > > -
>> > > --from __future__ import absolute_import, unicode_literals
>> > > -+
>> > > -
>> > > - import json
>> > > - import os
>> > > -@@ -174,7 +174,7 @@ class CommonBackend(BuildBackend):
>> > > -         if len(self._idl_manager.idls):
>> > > -             self._write_rust_xpidl_summary(self._idl_manager)
>> > > -             self._handle_idl_manager(self._idl_manager)
>> > > --
>> self._handle_generated_sources(mozpath.join(self.environment.topobjdir,
>> 'dist/include/%s.h' % idl['root']) for idl in
>> self._idl_manager.idls.values())
>> > > -+
>> self._handle_generated_sources(mozpath.join(self.environment.topobjdir,
>> 'dist/include/%s.h' % idl['root']) for idl in
>> list(self._idl_manager.idls.values()))
>> > > -
>> > > -
>> > > -         for config in self._configs:
>> > > -@@ -372,14 +372,14 @@ class CommonBackend(BuildBackend):
>> > > -
>> > > -         with self._write_file(mozpath.join(topobjdir, 'dist',
>> 'xpcrs', 'rt', 'all.rs')) as fh:
>> > > -             fh.write("// THIS FILE IS GENERATED - DO NOT EDIT\n\n"=
)
>> > > --            for idl in manager.idls.values():
>> > > -+            for idl in list(manager.idls.values()):
>> > > -                 fh.write(include_tmpl % ("rt", idl['root']))
>> > > -                 fh.write(";\n")
>> > > -
>> > > -         with self._write_file(mozpath.join(topobjdir, 'dist',
>> 'xpcrs', 'bt', 'all.rs')) as fh:
>> > > -             fh.write("// THIS FILE IS GENERATED - DO NOT EDIT\n\n"=
)
>> > > -             fh.write("&[\n")
>> > > --            for idl in manager.idls.values():
>> > > -+            for idl in list(manager.idls.values()):
>> > > -                 fh.write(include_tmpl % ("bt", idl['root']))
>> > > -                 fh.write(",\n")
>> > > -             fh.write("]\n")
>> > > -diff --git a/python/mozbuild/mozbuild/backend/configenvironment.py
>> b/python/mozbuild/mozbuild/backend/configenvironment.py
>> > > -index 3676a7d18..f0896cea4 100644
>> > > ---- a/python/mozbuild/mozbuild/backend/configenvironment.py
>> > > -+++ b/python/mozbuild/mozbuild/backend/configenvironment.py
>> > > -@@ -2,14 +2,14 @@
>> > > - # License, v. 2.0. If a copy of the MPL was not distributed with
>> this
>> > > - # file, You can obtain one at http://mozilla.org/MPL/2.0/.
>> > > -
>> > > --from __future__ import absolute_import
>> > > -+
>> > > -
>> > > - import os
>> > > - import sys
>> > > - import json
>> > > -
>> > > - from collections import Iterable, OrderedDict
>> > > --from types import StringTypes, ModuleType
>> > > -+from types import ModuleType
>> > > -
>> > > - import mozpack.path as mozpath
>> > > -
>> > > -@@ -22,7 +22,7 @@ from mozbuild.shellutil import quote as shell_quo=
te
>> > > -
>> > > -
>> > > - if sys.version_info.major =3D=3D 2:
>> > > --    text_type =3D unicode
>> > > -+    text_type =3D str
>> > > - else:
>> > > -     text_type =3D str
>> > > -
>> > > -@@ -151,7 +151,7 @@ class ConfigEnvironment(object):
>> > > -             shell_quote(self.defines[name]).replace('$', '$$'))
>> > > -             for name in sorted(global_defines)])
>> > > -         def serialize(name, obj):
>> > > --            if isinstance(obj, StringTypes):
>> > > -+            if isinstance(obj, str):
>> > > -                 return obj
>> > > -             if isinstance(obj, Iterable):
>> > > -                 return ' '.join(obj)
>> > > -@@ -185,8 +185,8 @@ class ConfigEnvironment(object):
>> > > -                 except UnicodeDecodeError:
>> > > -                     return v.decode('utf-8', 'replace')
>> > > -
>> > > --        for k, v in self.substs.items():
>> > > --            if not isinstance(v, StringTypes):
>> > > -+        for k, v in list(self.substs.items()):
>> > > -+            if not isinstance(v, str):
>> > > -                 if isinstance(v, Iterable):
>> > > -                     type(v)(decode(i) for i in v)
>> > > -             elif not isinstance(v, text_type):
>> > > -@@ -255,7 +255,7 @@ class PartialConfigDict(object):
>> > > -         existing_files =3D self._load_config_track()
>> > > -
>> > > -         new_files =3D set()
>> > > --        for k, v in values.iteritems():
>> > > -+        for k, v in values.items():
>> > > -             new_files.add(self._write_file(k, v))
>> > > -
>> > > -         for filename in existing_files - new_files:
>> > > -diff --git a/python/mozbuild/mozbuild/backend/fastermake.py
>> b/python/mozbuild/mozbuild/backend/fastermake.py
>> > > -index b029aa10f..b66ade64f 100644
>> > > ---- a/python/mozbuild/mozbuild/backend/fastermake.py
>> > > -+++ b/python/mozbuild/mozbuild/backend/fastermake.py
>> > > -@@ -2,7 +2,7 @@
>> > > - # License, v. 2.0. If a copy of the MPL was not distributed with
>> this
>> > > - # file, You can obtain one at http://mozilla.org/MPL/2.0/.
>> > > -
>> > > --from __future__ import absolute_import, unicode_literals,
>> print_function
>> > > -+
>> > > -
>> > > - from mozbuild.backend.base import PartialBackend
>> > > - from mozbuild.backend.common import CommonBackend
>> > > -@@ -140,7 +140,7 @@ class FasterMakeBackend(CommonBackend,
>> PartialBackend):
>> > > -         # Add information for chrome manifest generation
>> > > -         manifest_targets =3D []
>> > > -
>> > > --        for target, entries in self._manifest_entries.iteritems():
>> > > -+        for target, entries in self._manifest_entries.items():
>> > > -             manifest_targets.append(target)
>> > > -             install_target =3D mozpath.basedir(target,
>> install_manifests_bases)
>> > > -             self._install_manifests[install_target].add_content(
>> > > -@@ -152,13 +152,13 @@ class FasterMakeBackend(CommonBackend,
>> PartialBackend):
>> > > -                          % ' '.join(self._install_manifests.keys()=
))
>> > > -
>> > > -         # Add dependencies we infered:
>> > > --        for target, deps in self._dependencies.iteritems():
>> > > -+        for target, deps in self._dependencies.items():
>> > > -             mk.create_rule([target]).add_dependencies(
>> > > -                 '$(TOPOBJDIR)/%s' % d for d in deps)
>> > > -
>> > > -         mk.add_statement('include $(TOPSRCDIR)/config/faster/
>> rules.mk')
>> > > -
>> > > --        for base, install_manifest in
>> self._install_manifests.iteritems():
>> > > -+        for base, install_manifest in
>> self._install_manifests.items():
>> > > -             with self._write_file(
>> > > -                     mozpath.join(self.environment.topobjdir,
>> 'faster',
>> > > -                                  'install_%s' % base.replace('/',
>> '_'))) as fh:
>> > > -@@ -167,7 +167,7 @@ class FasterMakeBackend(CommonBackend,
>> PartialBackend):
>> > > -         # For artifact builds only, write a single unified manifes=
t
>> for consumption by |mach watch|.
>> > > -         if self.environment.is_artifact_build:
>> > > -             unified_manifest =3D InstallManifest()
>> > > --            for base, install_manifest in
>> self._install_manifests.iteritems():
>> > > -+            for base, install_manifest in
>> self._install_manifests.items():
>> > > -                 # Expect 'dist/bin/**', which includes 'dist/bin'
>> with no trailing slash.
>> > > -                 assert base.startswith('dist/bin')
>> > > -                 base =3D base[len('dist/bin'):]
>> > > -diff --git a/python/mozbuild/mozbuild/backend/recursivemake.py
>> b/python/mozbuild/mozbuild/backend/recursivemake.py
>> > > -index dd9020d62..aa89cc297 100644
>> > > ---- a/python/mozbuild/mozbuild/backend/recursivemake.py
>> > > -+++ b/python/mozbuild/mozbuild/backend/recursivemake.py
>> > > -@@ -2,7 +2,7 @@
>> > > - # License, v. 2.0. If a copy of the MPL was not distributed with
>> this
>> > > - # file, You can obtain one at http://mozilla.org/MPL/2.0/.
>> > > -
>> > > --from __future__ import absolute_import, unicode_literals
>> > > -+
>> > > -
>> > > - import logging
>> > > - import os
>> > > -@@ -12,7 +12,7 @@ from collections import (
>> > > -     defaultdict,
>> > > -     namedtuple,
>> > > - )
>> > > --from StringIO import StringIO
>> > > -+from io import StringIO
>> > > - from itertools import chain
>> > > -
>> > > - from mozpack.manifests import (
>> > > -@@ -80,75 +80,76 @@ from ..util import (
>> > > - )
>> > > - from ..makeutil import Makefile
>> > > - from mozbuild.shellutil import quote as shell_quote
>> > > -+from functools import reduce
>> > > -
>> > > - MOZBUILD_VARIABLES =3D [
>> > > --    b'ASFLAGS',
>> > > --    b'CMSRCS',
>> > > --    b'CMMSRCS',
>> > > --    b'CPP_UNIT_TESTS',
>> > > --    b'DIRS',
>> > > --    b'DIST_INSTALL',
>> > > --    b'EXTRA_DSO_LDOPTS',
>> > > --    b'EXTRA_JS_MODULES',
>> > > --    b'EXTRA_PP_COMPONENTS',
>> > > --    b'EXTRA_PP_JS_MODULES',
>> > > --    b'FORCE_SHARED_LIB',
>> > > --    b'FORCE_STATIC_LIB',
>> > > --    b'FINAL_LIBRARY',
>> > > --    b'HOST_CFLAGS',
>> > > --    b'HOST_CSRCS',
>> > > --    b'HOST_CMMSRCS',
>> > > --    b'HOST_CXXFLAGS',
>> > > --    b'HOST_EXTRA_LIBS',
>> > > --    b'HOST_LIBRARY_NAME',
>> > > --    b'HOST_PROGRAM',
>> > > --    b'HOST_SIMPLE_PROGRAMS',
>> > > --    b'JAR_MANIFEST',
>> > > --    b'JAVA_JAR_TARGETS',
>> > > --    b'LIBRARY_NAME',
>> > > --    b'LIBS',
>> > > --    b'MAKE_FRAMEWORK',
>> > > --    b'MODULE',
>> > > --    b'NO_DIST_INSTALL',
>> > > --    b'NO_EXPAND_LIBS',
>> > > --    b'NO_INTERFACES_MANIFEST',
>> > > --    b'NO_JS_MANIFEST',
>> > > --    b'OS_LIBS',
>> > > --    b'PARALLEL_DIRS',
>> > > --    b'PREF_JS_EXPORTS',
>> > > --    b'PROGRAM',
>> > > --    b'RESOURCE_FILES',
>> > > --    b'SHARED_LIBRARY_LIBS',
>> > > --    b'SHARED_LIBRARY_NAME',
>> > > --    b'SIMPLE_PROGRAMS',
>> > > --    b'SONAME',
>> > > --    b'STATIC_LIBRARY_NAME',
>> > > --    b'TEST_DIRS',
>> > > --    b'TOOL_DIRS',
>> > > -+    'ASFLAGS',
>> > > -+    'CMSRCS',
>> > > -+    'CMMSRCS',
>> > > -+    'CPP_UNIT_TESTS',
>> > > -+    'DIRS',
>> > > -+    'DIST_INSTALL',
>> > > -+    'EXTRA_DSO_LDOPTS',
>> > > -+    'EXTRA_JS_MODULES',
>> > > -+    'EXTRA_PP_COMPONENTS',
>> > > -+    'EXTRA_PP_JS_MODULES',
>> > > -+    'FORCE_SHARED_LIB',
>> > > -+    'FORCE_STATIC_LIB',
>> > > -+    'FINAL_LIBRARY',
>> > > -+    'HOST_CFLAGS',
>> > > -+    'HOST_CSRCS',
>> > > -+    'HOST_CMMSRCS',
>> > > -+    'HOST_CXXFLAGS',
>> > > -+    'HOST_EXTRA_LIBS',
>> > > -+    'HOST_LIBRARY_NAME',
>> > > -+    'HOST_PROGRAM',
>> > > -+    'HOST_SIMPLE_PROGRAMS',
>> > > -+    'JAR_MANIFEST',
>> > > -+    'JAVA_JAR_TARGETS',
>> > > -+    'LIBRARY_NAME',
>> > > -+    'LIBS',
>> > > -+    'MAKE_FRAMEWORK',
>> > > -+    'MODULE',
>> > > -+    'NO_DI
>
>

--00000000000042484805cf332a1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 25, 2021 at 12:55 PM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>What prompte=
d me to update mozjs was that without this upgrade, anything less than mozj=
s-91 would itself become broken with the python 3.10 update (and thus, polk=
it would break as well). I test meta-oe builds with <br></div><div><a href=
=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree=
/config.json#n906" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.=
cgi/yocto-autobuilder-helper/tree/config.json#n906</a></div><div>Getting th=
at to pass is where I drew the line for &#39;things I need to fix&#39;, esp=
ecially considering that getting new mozjs itself to build was not easy, wi=
th transition to rust and all (appreciation from Andreas confirms that ;).<=
/div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Yes it is definitely good stuff however I would have=
 liked to stage it a bit longer I did not predict the slew of follow ups th=
at it would need=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">M=
eta-gnome is not part of test job tested on yocto auto builder there are fe=
w other layers from meta-openembedded which are excluded eg meta-xfce so yo=
u don=E2=80=99t get all the failures there=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><div dir=3D"auto"><br></div><div><br></div><div>=
The PR for mozjs-91 support in gjs looks like it&#39;s getting close to bei=
ng merged, so we&#39;re not going to be in this situation for much longer:<=
/div><div><a href=3D"https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/63=
2" target=3D"_blank">https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/63=
2</a></div><div><br></div><div>Bleeding edge sometimes bleeds, this update =
does eliminate a major tech debt item and potential securty issue in meta-o=
e - and quite possibly actually unblocks updates to meta-gnome too.<br></di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, 25 Oct 2021 at 19:54, Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">this has ensued a bunch of patches and unplanned extra work for others<b=
r>
to fix build for mips/riscv and packaging<br>
which I guess, I should have waited on, this is behind and its building on =
all<br>
architectures we build in OE CI, but it has left gjs unbuildable as of<br>
now. I have<br>
started a recipe upgrade to 1.70.0 for gjs [1] but that itself is also<br>
not enough since<br>
mozjs 91 support is still not upstreamed in gjs [2]<br>
<br>
gjs seems to be at the heart of meta-gnome, so I can not even add it<br>
to the exclusion list.<br>
at this point one option is to exclude meta-gnome from my world CI to<br>
avoid failed jobs [3]<br>
<br>
[1] <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/log/?=
h=3Dkraj/gjs" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded=
.org/meta-openembedded-contrib/log/?h=3Dkraj/gjs</a><br>
[2] <a href=3D"https://gitlab.gnome.org/GNOME/gjs/-/issues/413" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gjs/-/issues/413</=
a><br>
[3] <a href=3D"http://jenkins.nas-admin.org/view/OE/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://jenkins.nas-admin.org/view/OE/</a><br>
<br>
<br>
On Tue, Oct 12, 2021 at 2:20 AM Andreas M=C3=BCller &lt;<a href=3D"mailto:s=
chnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; Started this but did not get it to build. Thanks so much - you&#39;re =
my<br>
&gt; this month&#39;s hero!!!<br>
&gt;<br>
&gt; On Mon, Oct 11, 2021 at 8:41 PM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The new release requires rust to build and at the same time allow=
s<br>
&gt; &gt; updating to python 3.10; I took the opportunity to rewrite the<br=
>
&gt; &gt; recipe from scratch, drop all the old cruft and use the official,=
<br>
&gt; &gt; current upstream build system in it.<br>
&gt; &gt;<br>
&gt; &gt; All prior patches and tweaks have been dropped; I have no<br>
&gt; &gt; reasonable way to test them, so if something regressed<br>
&gt; &gt; for you I&#39;m afraid it needs to be addressed after the fact.<b=
r>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linut=
ronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...001-Cargo.toml-do-not-abort-on-panic.patch |=C2=A0 =C2=
=A032 +<br>
&gt; &gt;=C2=A0 .../mozjs/0001-Port-build-to-python3.patch=C2=A0 =C2=A0 | 6=
897 -----------------<br>
&gt; &gt;=C2=A0 ...-autoconf-s-config.sub-to-canonicali.patch |=C2=A0 =C2=
=A028 +<br>
&gt; &gt;=C2=A0 ...include-RequiredDefines.h-for-depend.patch |=C2=A0 =C2=
=A033 -<br>
&gt; &gt;=C2=A0 ...nfigure-do-not-look-for-llvm-objdump.patch |=C2=A0 =C2=
=A043 +<br>
&gt; &gt;=C2=A0 ...ix-cross-compilation-on-i586-targets.patch |=C2=A0 =C2=
=A038 -<br>
&gt; &gt;=C2=A0 ...o-not-try-to-find-a-suitable-upstrea.patch |=C2=A0 =C2=
=A065 +<br>
&gt; &gt;=C2=A0 ...004-do-not-create-python-environment.patch |=C2=A0 =C2=
=A064 -<br>
&gt; &gt;=C2=A0 .../mozjs/0005-fix-cannot-find-link.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A034 -<br>
&gt; &gt;=C2=A0 ...round-autoconf-2.13-detection-failed.patch |=C2=A0 =C2=
=A028 -<br>
&gt; &gt;=C2=A0 .../0007-fix-do_compile-failed-on-mips.patch=C2=A0 |=C2=A0 =
=C2=A033 -<br>
&gt; &gt;=C2=A0 .../mozjs/mozjs/0008-add-riscv-support.patch=C2=A0 |=C2=A0 =
=C2=A050 -<br>
&gt; &gt;=C2=A0 ...-mozjs-fix-coredump-caused-by-getenv.patch |=C2=A0 =C2=
=A027 -<br>
&gt; &gt;=C2=A0 .../mozjs/mozjs/0010-format-overflow.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A021 -<br>
&gt; &gt;=C2=A0 .../0011-To-fix-build-error-on-arm32BE.patch=C2=A0 |=C2=A0 =
=C2=A028 -<br>
&gt; &gt;=C2=A0 .../mozjs/mozjs/0012-JS_PUBLIC_API.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A055 -<br>
&gt; &gt;=C2=A0 ...0013-riscv-Disable-atomic-operations.patch |=C2=A0 =C2=
=A038 -<br>
&gt; &gt;=C2=A0 .../mozjs/0014-remove-JS_VOLATIME_ARM.patch=C2=A0 =C2=A0|=
=C2=A0 111 -<br>
&gt; &gt;=C2=A0 ...-compiling-failure-on-mips64-n32-bsp.patch |=C2=A0 =C2=
=A080 -<br>
&gt; &gt;=C2=A0 .../mozjs/mozjs/musl/0001-support-musl.patch=C2=A0 |=C2=A0 =
=C2=A098 -<br>
&gt; &gt;=C2=A0 .../musl/0002-js-Fix-build-with-musl.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A031 -<br>
&gt; &gt;=C2=A0 .../recipes-extended/mozjs/<a href=3D"http://mozjs_60.9.0.b=
b" rel=3D"noreferrer" target=3D"_blank">mozjs_60.9.0.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 147 -<br>
&gt; &gt;=C2=A0 .../recipes-extended/mozjs/<a href=3D"http://mozjs_91.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">mozjs_91.1.0.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A061 +<br>
&gt; &gt;=C2=A0 23 files changed, 229 insertions(+), 7813 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0001-Cargo.toml-do-not-abort-on-panic.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0001-Port-build-to-python3.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0001-build-do-not-use-autoconf-s-config.sub-to-cano=
nicali.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-=
depend.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0002-moz.configure-do-not-look-for-llvm-objdump.pat=
ch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0003-fix-cross-compilation-on-i586-targets.patch<br=
>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0003-rust.configure-do-not-try-to-find-a-suitable-u=
pstrea.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0004-do-not-create-python-environment.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0005-fix-cannot-find-link.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0006-workaround-autoconf-2.13-detection-failed.patc=
h<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0007-fix-do_compile-failed-on-mips.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0008-add-riscv-support.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0009-mozjs-fix-coredump-caused-by-getenv.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0010-format-overflow.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0011-To-fix-build-error-on-arm32BE.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0012-JS_PUBLIC_API.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0013-riscv-Disable-atomic-operations.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/0014-remove-JS_VOLATIME_ARM.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/mipsarchn32/0001-fix-compiling-failure-on-mips64-n3=
2-bsp.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/musl/0001-support-musl.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs/musl/0002-js-Fix-build-with-musl.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/<a href=3D"http://mozjs_60.9.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mozjs_60.9.0.bb</a><br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/<a href=3D"http://mozjs_91.1.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mozjs_91.1.0.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/=
mozjs/mozjs/0001-Cargo.toml-do-not-abort-on-panic.patch b/meta-oe/dynamic-l=
ayers/meta-python/recipes-extended/mozjs/mozjs/0001-Cargo.toml-do-not-abort=
-on-panic.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..34861de7f<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/m=
ozjs/0001-Cargo.toml-do-not-abort-on-panic.patch<br>
&gt; &gt; @@ -0,0 +1,32 @@<br>
&gt; &gt; +From 9e37248870b2b955293754933c789ca00bca06ef Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de=
" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; +Date: Fri, 1 Oct 2021 13:00:24 +0200<br>
&gt; &gt; +Subject: [PATCH] Cargo.toml: do not abort on panic<br>
&gt; &gt; +<br>
&gt; &gt; +OE&#39;s rust is configured to unwind, and this setting clashes =
with it/<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; &gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linu=
tronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + Cargo.toml | 3 +--<br>
&gt; &gt; + 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/Cargo.toml b/Cargo.toml<br>
&gt; &gt; +index 09f3e7292f..0fff412569 100644<br>
&gt; &gt; +--- a/Cargo.toml<br>
&gt; &gt; ++++ b/Cargo.toml<br>
&gt; &gt; +@@ -57,7 +57,6 @@ panic =3D &quot;abort&quot;<br>
&gt; &gt; + opt-level =3D 2<br>
&gt; &gt; + rpath =3D false<br>
&gt; &gt; + debug-assertions =3D false<br>
&gt; &gt; +-panic =3D &quot;abort&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + # Optimize build dependencies, because bindgen and proc macros =
/ style<br>
&gt; &gt; + # compilation take more to run than to build otherwise.<br>
&gt; &gt; +@@ -105,4 +104,4 @@ path =3D &quot;third_party/rust/mio&quot;<br=
>
&gt; &gt; +<br>
&gt; &gt; + # Patch failure 0.1.8 to disable the backtrace feature by defau=
lt. See bug 1608157.<br>
&gt; &gt; + [patch.crates-io.failure]<br>
&gt; &gt; +-path =3D &quot;third_party/rust/failure&quot;<br>
&gt; &gt; +\ No newline at end of file<br>
&gt; &gt; ++path =3D &quot;third_party/rust/failure&quot;<br>
&gt; &gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/=
mozjs/mozjs/0001-Port-build-to-python3.patch b/meta-oe/dynamic-layers/meta-=
python/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 5cdad93e9..000000000<br>
&gt; &gt; --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/m=
ozjs/0001-Port-build-to-python3.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,6897 +0,0 @@<br>
&gt; &gt; -From 33a373ba41d978af60c2f0230bcba6ad27357ec8 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D=
"mailto:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com<=
/a>&gt;<br>
&gt; &gt; -Date: Wed, 29 Jan 2020 16:25:11 +0100<br>
&gt; &gt; -Subject: [PATCH] Port build to python3<br>
&gt; &gt; -MIME-Version: 1.0<br>
&gt; &gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; -Content-Transfer-Encoding: 8bit<br>
&gt; &gt; -<br>
&gt; &gt; -* first tool of choice was 2to3<br>
&gt; &gt; -* some parts were taken from [1] but during work it was found th=
at this patch<br>
&gt; &gt; -=C2=A0 introduces interesting effects - see hash functions. Work=
ing more on this<br>
&gt; &gt; -=C2=A0 makes me guess that one has never worked...<br>
&gt; &gt; -* Few parts were taken from upstream mirror [2]. Since they use =
six for porting<br>
&gt; &gt; -=C2=A0 to python3 it adds us a new dependency.<br>
&gt; &gt; -* To get a better overview what is going on or failing some addi=
tional messages<br>
&gt; &gt; -=C2=A0 were added. The most verbose one is left disabled - see<b=
r>
&gt; &gt; -=C2=A0 python/mozbuild/mozbuild/configure/__init__.py / Line 310=
 onwards<br>
&gt; &gt; -* major changes upstream on build are not to expect so upgrading=
 should cause<br>
&gt; &gt; -=C2=A0 little trouble and changes can be tracked by [3]<br>
&gt; &gt; -* some solutions are workarounds/hacks so this patch will not be=
 accepted<br>
&gt; &gt; -=C2=A0 upstream. This should not be a problem for us: once mozjs=
 &gt;=3D 68 will arrive<br>
&gt; &gt; -=C2=A0 we have to go to rust/cargo based build anyway.<br>
&gt; &gt; -<br>
&gt; &gt; -[1] <a href=3D"https://code.foxkit.us/adelie/packages/blob/f2b57=
73da19ab397fbe64fd32dacc383cfe4cd77/user/mozjs/python3.patch" rel=3D"norefe=
rrer" target=3D"_blank">https://code.foxkit.us/adelie/packages/blob/f2b5773=
da19ab397fbe64fd32dacc383cfe4cd77/user/mozjs/python3.patch</a><br>
&gt; &gt; -[2] <a href=3D"https://github.com/mozilla/gecko-dev" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/mozilla/gecko-dev</a><br>
&gt; &gt; -[3] <a href=3D"https://github.com/mozilla/gecko-dev/tree/esr60" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/mozilla/gecko-dev/t=
ree/esr60</a><br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Inappropriate [Some Hacks]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitz=
eltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - build/autoconf/config.status.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt; - build/moz.configure/android-ndk.configure=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt; &gt; - build/moz.configure/checks.configure=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt; - build/moz.configure/init.configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 31 +-<br>
&gt; &gt; - build/moz.configure/keyfiles.configure=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt; - build/moz.configure/old.configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 32 +-<br>
&gt; &gt; - build/moz.configure/toolchain.configure=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 18 +-<br>
&gt; &gt; - build/moz.configure/util.configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
&gt; &gt; - build/moz.configure/windows.configure=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 10 +-<br>
&gt; &gt; - build/templates.mozbuild=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt; - config/MozZipFile.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt; &gt; - config/expandlibs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt; &gt; - config/expandlibs_exec.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 +-<br>
&gt; &gt; - config/expandlibs_gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt; - configure.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 42 +-<br>
&gt; &gt; - js/src/build/moz.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt; &gt; - js/src/builtin/embedjs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt; &gt; - js/src/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02=
 +-<br>
&gt; &gt; - js/src/frontend/GenerateReservedWords.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
&gt; &gt; - js/src/gc/GenerateStatsPhases.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt; - js/src/<a href=3D"http://old-configure.in" rel=3D"noreferrer" t=
arget=3D"_blank">old-configure.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt; &gt; - memory/build/moz.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt; &gt; - mozglue/build/moz.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +-<br>
&gt; &gt; - .../mozbuild/mozbuild/action/check_binary.py=C2=A0 |=C2=A0 =C2=
=A02 +<br>
&gt; &gt; - .../mozbuild/action/process_define_files.py=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/backend/base.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A08 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/backend/common.py=C2=A0 =C2=A0 |=C2=A0=
 =C2=A08 +-<br>
&gt; &gt; - .../mozbuild/backend/configenvironment.py=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 14 +-<br>
&gt; &gt; - .../mozbuild/mozbuild/backend/fastermake.py=C2=A0 =C2=A0|=C2=A0=
 10 +-<br>
&gt; &gt; - .../mozbuild/backend/recursivemake.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 181 +++----<br>
&gt; &gt; - python/mozbuild/mozbuild/config_status.py=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A07 +-<br>
&gt; &gt; - .../mozbuild/mozbuild/configure/__init__.py=C2=A0 =C2=A0|=C2=A0=
 83 +++-<br>
&gt; &gt; - .../mozbuild/configure/check_debug_ranges.py=C2=A0 |=C2=A0 =C2=
=A06 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/configure/options.py |=C2=A0 24 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/configure/util.py=C2=A0 =C2=A0 |=C2=A0=
 12 +-<br>
&gt; &gt; - .../mozbuild/mozbuild/controller/building.py=C2=A0 |=C2=A0 16 +=
-<br>
&gt; &gt; - python/mozbuild/mozbuild/frontend/context.py=C2=A0 |=C2=A0 89 +=
+--<br>
&gt; &gt; - python/mozbuild/mozbuild/frontend/data.py=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A08 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/frontend/emitter.py=C2=A0 |=C2=A0 50 +=
-<br>
&gt; &gt; - python/mozbuild/mozbuild/frontend/reader.py=C2=A0 =C2=A0|=C2=A0=
 49 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/frontend/sandbox.py=C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/jar.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/makeutil.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 24 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/mozinfo.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/preprocessor.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 27 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/shellutil.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; &gt; - .../test/backend/test_recursivemake.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 18 +-<br>
&gt; &gt; - .../mozbuild/test/configure/common.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt; &gt; - .../mozbuild/mozbuild/test/configure/lint.py=C2=A0 |=C2=A0 =C2=
=A08 +-<br>
&gt; &gt; - .../test/configure/test_checks_configure.py=C2=A0 =C2=A0|=C2=A0=
 =C2=A08 +-<br>
&gt; &gt; - .../test/configure/test_compile_checks.py=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt; &gt; - .../mozbuild/test/configure/test_configure.py | 244 +++++-----<=
br>
&gt; &gt; - .../mozbuild/test/configure/test_lint.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 24 +-<br>
&gt; &gt; - .../test/configure/test_moz_configure.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 32 +-<br>
&gt; &gt; - .../mozbuild/test/configure/test_options.py=C2=A0 =C2=A0| 450 +=
++++++++---------<br>
&gt; &gt; - .../configure/test_toolchain_configure.py=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 22 +-<br>
&gt; &gt; - .../test/configure/test_toolchain_helpers.py=C2=A0 |=C2=A0 62 +=
--<br>
&gt; &gt; - .../configure/test_toolkit_moz_configure.py=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
&gt; &gt; - .../mozbuild/test/configure/test_util.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A08 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/testing.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt; &gt; - python/mozbuild/mozbuild/util.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 79 ++-<br>
&gt; &gt; - python/mozbuild/mozbuild/virtualenv.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +-<br>
&gt; &gt; - python/mozbuild/mozpack/chrome/manifest.py=C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
&gt; &gt; - python/mozbuild/mozpack/copier.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
&gt; &gt; - python/mozbuild/mozpack/files.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 22 +-<br>
&gt; &gt; - python/mozbuild/mozpack/manifests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 16 +-<br>
&gt; &gt; - python/mozbuild/mozpack/mozjar.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 37 +-<br>
&gt; &gt; - .../manifestparser/manifestparser/ini.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 13 +-<br>
&gt; &gt; - .../manifestparser/manifestparser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 24 +-<br>
&gt; &gt; - testing/mozbase/mozinfo/mozinfo/mozinfo.py=C2=A0 =C2=A0 |=C2=A0=
 26 +-<br>
&gt; &gt; - .../mozprocess/mozprocess/processhandler.py=C2=A0 =C2=A0|=C2=A0=
 10 +-<br>
&gt; &gt; - third_party/python/which/which.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +-<br>
&gt; &gt; - 72 files changed, 1081 insertions(+), 993 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/build/autoconf/config.status.m4 b/build/autoconf/co=
nfig.status.m4<br>
&gt; &gt; -index c75575386..543c2d682 100644<br>
&gt; &gt; ---- a/build/autoconf/config.status.m4<br>
&gt; &gt; -+++ b/build/autoconf/config.status.m4<br>
&gt; &gt; -@@ -122,7 +122,7 @@ trap &#39;rm -f $CONFIG_STATUS conftest*; ex=
it 1&#39; 1 2 15<br>
&gt; &gt; -<br>
&gt; &gt; - dnl We&#39;re going to need [ ] for python syntax.<br>
&gt; &gt; - changequote(&lt;&lt;&lt;, &gt;&gt;&gt;)dnl<br>
&gt; &gt; --echo creating $CONFIG_STATUS<br>
&gt; &gt; -+echo creating $CONFIG_STATUS in `pwd`<br>
&gt; &gt; -<br>
&gt; &gt; - cat &gt; $CONFIG_STATUS &lt;&lt;EOF<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/build/moz.configure/android-ndk.configure b/build/m=
oz.configure/android-ndk.configure<br>
&gt; &gt; -index 1067b8619..3b592a237 100644<br>
&gt; &gt; ---- a/build/moz.configure/android-ndk.configure<br>
&gt; &gt; -+++ b/build/moz.configure/android-ndk.configure<br>
&gt; &gt; -@@ -30,7 +30,7 @@ js_option(&#39;--with-android-version&#39;,<br=
>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; - @depends(&#39;--with-android-version&#39;, min_android_version,=
 &#39;--help&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;ValueErr=
or&#39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;ValueError&=
#39;)<br>
&gt; &gt; - def android_version(value, min_version, _):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if not value:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Someone has passed --without=
-android-version.<br>
&gt; &gt; -@@ -68,7 +68,7 @@ add_old_configure_assignment(&#39;android_ndk&=
#39;, ndk)<br>
&gt; &gt; -<br>
&gt; &gt; - @depends(ndk)<br>
&gt; &gt; - @checking(&#39;for android ndk version&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;open&#39=
;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;open&#39;)<=
br>
&gt; &gt; - def ndk_version(ndk):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if not ndk:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Building &#39;js/src&#39; fo=
r non-Android.<br>
&gt; &gt; -diff --git a/build/moz.configure/checks.configure b/build/moz.co=
nfigure/checks.configure<br>
&gt; &gt; -index 516652da9..11e1091c6 100644<br>
&gt; &gt; ---- a/build/moz.configure/checks.configure<br>
&gt; &gt; -+++ b/build/moz.configure/checks.configure<br>
&gt; &gt; -@@ -14,7 +14,7 @@<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; - @template<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;Exceptio=
n&#39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;Exception&#=
39;)<br>
&gt; &gt; - def _declare_exceptions():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0class FatalCheckError(Exception):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;An exception to=
 throw from a function decorated with @checking.<br>
&gt; &gt; -@@ -57,7 +57,7 @@ def checking(what, callback=3DNone):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tr=
y:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret =3D func(*args, **kwargs)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ex=
cept FatalCheckError as e:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 error =3D e.message<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 error =3D str(e)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0di=
splay_ret =3D callback(ret) if callback else ret<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 display_ret is True:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"http://log.info" rel=3D"noreferrer" target=3D"_blan=
k">log.info</a>(&#39;yes&#39;)<br>
&gt; &gt; -diff --git a/build/moz.configure/init.configure b/build/moz.conf=
igure/init.configure<br>
&gt; &gt; -index 648ac2ded..4d74547d8 100644<br>
&gt; &gt; ---- a/build/moz.configure/init.configure<br>
&gt; &gt; -+++ b/build/moz.configure/init.configure<br>
&gt; &gt; -@@ -14,7 +14,7 @@ option(env=3D&#39;DIST&#39;, nargs=3D1, help=
=3D&#39;DIST directory&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; - @depends(&#39;--help&#39;, &#39;DIST&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;open&#39=
;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;open&#39;)<=
br>
&gt; &gt; - @imports(_from=3D&#39;os.path&#39;, _import=3D&#39;exists&#39;)=
<br>
&gt; &gt; - def check_build_environment(help, dist):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0topobjdir =3D os.path.realpath(os.path.abspa=
th(&#39;.&#39;))<br>
&gt; &gt; -@@ -65,7 +65,7 @@ def check_build_environment(help, dist):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Check for CRLF line endings.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0with open(os.path.join(topsrcdir, &#39;confi=
gure.py&#39;), &#39;rb&#39;) as fh:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D fh.read()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;\r&#39; in data:<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if b&#39;\r&#39; in data:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die(&#39;\n ***\=
n&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39; * The source tree appears to have Windows-style line endings.\n&#39;<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39; *\n&#39;<br>
&gt; &gt; -@@ -269,7 +269,7 @@ def early_options():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def early_options():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return set(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0option.env<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for option in __sandb=
ox__._options.itervalues()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for option in __sandb=
ox__._options.values()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if option.env<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return early_options<br>
&gt; &gt; -@@ -307,15 +307,15 @@ def mozconfig_options(mozconfig, automatio=
n, help):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>=
(&#39;=C2=A0 %s&#39; % arg)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0he=
lper.add(arg, origin=3D&#39;mozconfig&#39;, args=3Dhelper._args)<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for key, value in mozconfig[&#39;en=
v&#39;][&#39;added&#39;].iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for key, value in mozconfig[&#39;en=
v&#39;][&#39;added&#39;].items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add(key, value)<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[key] =
=3D value<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for key, (_, value) in mozconfig[&#=
39;env&#39;][&#39;modified&#39;].iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for key, (_, value) in mozconfig[&#=
39;env&#39;][&#39;modified&#39;].items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add(key, value)<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[key] =
=3D value<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for key, value in mozconfig[&#39;va=
rs&#39;][&#39;added&#39;].iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for key, value in mozconfig[&#39;va=
rs&#39;][&#39;added&#39;].items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add(key, value)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for key, (_, value) in mozconfig[&#=
39;vars&#39;][&#39;modified&#39;].iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for key, (_, value) in mozconfig[&#=
39;vars&#39;][&#39;modified&#39;].items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add(key, value)<=
br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -353,7 +353,7 @@ option(env=3D&#39;PYTHON3&#39;, nargs=3D1, h=
elp=3D&#39;Python 3 interpreter (3.5 or later)&#39;)<br>
&gt; &gt; - @depends(&#39;PYTHON3&#39;)<br>
&gt; &gt; - @checking(&#39;for Python 3&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callback=3Dlambda x: &#=
39;%s (%s)&#39; % (x.path, x.str_version) if x else &#39;no&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;Exceptio=
n&#39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;Exception&#=
39;)<br>
&gt; &gt; - @imports(_from=3D&#39;mozbuild.pythonutil&#39;, _import=3D&#39;=
find_python3_executable&#39;)<br>
&gt; &gt; - @imports(_from=3D&#39;mozbuild.pythonutil&#39;, _import=3D&#39;=
python_executable_version&#39;)<br>
&gt; &gt; - def python3(env_python):<br>
&gt; &gt; -@@ -377,9 +377,6 @@ def python3(env_python):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not python:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return None<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The API returns a bytes whereas e=
verything in configure is unicode.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 python =3D python.decode(&#39;utf-8=
&#39;)<br>
&gt; &gt; --<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return namespace(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path=3Dpython,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version=3Dversion,<br>
&gt; &gt; -@@ -481,6 +478,8 @@ def hg_config(build_env, hg, version):<br>
&gt; &gt; - @imports(&#39;re&#39;)<br>
&gt; &gt; - def git_version(git):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0out =3D check_cmd_output(git, &#39;--version=
&#39;).rstrip()<br>
&gt; &gt; -+=C2=A0 =C2=A0 if isinstance(out, bytes):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D out.decode(&#39;utf-8&#39;)=
<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0match =3D re.search(&#39;git version (.*)$&#=
39;, out)<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -551,8 +550,8 @@ option(&#39;--target&#39;, nargs=3D1,<br>
&gt; &gt; - @imports(_from=3D&#39;mozbuild.configure.constants&#39;, _impor=
t=3D&#39;Endianness&#39;)<br>
&gt; &gt; - @imports(_from=3D&#39;mozbuild.configure.constants&#39;, _impor=
t=3D&#39;Kernel&#39;)<br>
&gt; &gt; - @imports(_from=3D&#39;mozbuild.configure.constants&#39;, _impor=
t=3D&#39;OS&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;KeyError=
&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;ValueErr=
or&#39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;KeyError&#3=
9;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;ValueError&=
#39;)<br>
&gt; &gt; - def split_triplet(triplet, allow_unknown=3DFalse):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# The standard triplet is defined as<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0CPU_TYPE-MANUFACTURER-OPERATIN=
G_SYSTEM<br>
&gt; &gt; -@@ -562,6 +561,8 @@ def split_triplet(triplet, allow_unknown=3DF=
alse):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Additionally, some may omit &quot;unknown&=
quot; when the manufacturer<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# is not specified and emit<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0CPU_TYPE-OPERATING_SYSTEM<br>
&gt; &gt; -+=C2=A0 =C2=A0 if isinstance(triplet, bytes):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 triplet =3D triplet.decode(&#39;utf=
-8&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0parts =3D triplet.split(&#39;-&#39;, 2)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if len(parts) =3D=3D 3:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu, _, os =3D parts<br>
&gt; &gt; -@@ -987,7 +988,7 @@ add_old_configure_assignment(&#39;MOZ_BUILD_=
APP&#39;, build_project)<br>
&gt; &gt; - # - otherwise, if we have &quot;a&quot; in GRE_MILESTONE, we&#3=
9;re building Nightly or Aurora<br>
&gt; &gt; - # - otherwise, we&#39;re building Release/Beta (define RELEASE_=
OR_BETA)<br>
&gt; &gt; - @depends(check_build_environment, &#39;--help&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;open&#39=
;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;open&#39;)<=
br>
&gt; &gt; - @imports(&#39;re&#39;)<br>
&gt; &gt; - def milestone(build_env, _):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0milestone_path =3D os.path.join(build_env.to=
psrcdir,<br>
&gt; &gt; -@@ -1105,7 +1106,7 @@ def enabled_in_nightly(milestone, _):<br>
&gt; &gt; - def all_configure_options():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0result =3D []<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0previous =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 for option in __sandbox__._options.itervalues():<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 for option in __sandbox__._options.values():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# __sandbox__._options contain=
s items for both <a href=3D"http://option.name" rel=3D"noreferrer" target=
=3D"_blank">option.name</a> and<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# option.env. But it&#39;s als=
o an OrderedDict, meaning both are<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# consecutive.<br>
&gt; &gt; -diff --git a/build/moz.configure/keyfiles.configure b/build/moz.=
configure/keyfiles.configure<br>
&gt; &gt; -index 5d51cccea..14a35a3c6 100644<br>
&gt; &gt; ---- a/build/moz.configure/keyfiles.configure<br>
&gt; &gt; -+++ b/build/moz.configure/keyfiles.configure<br>
&gt; &gt; -@@ -16,8 +16,8 @@ def keyfile(desc, default=3DNone, help=3DNone,=
 callback=3Dlambda x: x):<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0@depends(&#39;--with-%s-keyfile&#39; % name)=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0@checking(&#39;for the %s key&#39; % desc, l=
ambda x: x and x is not no_key)<br>
&gt; &gt; --=C2=A0 =C2=A0 @imports(_from=3D&#39;__builtin__&#39;, _import=
=3D&#39;open&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 @imports(_from=3D&#39;__builtin__&#39;, _import=
=3D&#39;IOError&#39;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 @imports(_from=3D&#39;builtins&#39;, _import=3D&#=
39;open&#39;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 @imports(_from=3D&#39;builtins&#39;, _import=3D&#=
39;IOError&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def keyfile(value):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if value:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt; &gt; -diff --git a/build/moz.configure/old.configure b/build/moz.confi=
gure/old.configure<br>
&gt; &gt; -index 81c10b91f..29b496bae 100644<br>
&gt; &gt; ---- a/build/moz.configure/old.configure<br>
&gt; &gt; -+++ b/build/moz.configure/old.configure<br>
&gt; &gt; -@@ -64,9 +64,9 @@ set_config(&#39;AUTOCONF&#39;, autoconf)<br>
&gt; &gt; -<br>
&gt; &gt; - @depends(&#39;OLD_CONFIGURE&#39;, mozconfig, autoconf, check_bu=
ild_environment, shell,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old_configure_assignments, bu=
ild_project)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;open&#39=
;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;print&#3=
9;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;sorted&#=
39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;open&#39;)<=
br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;print&#39;)=
<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;sorted&#39;=
)<br>
&gt; &gt; - @imports(&#39;glob&#39;)<br>
&gt; &gt; - @imports(&#39;itertools&#39;)<br>
&gt; &gt; - @imports(&#39;subprocess&#39;)<br>
&gt; &gt; -@@ -113,7 +113,7 @@ def prepare_configure(old_configure, mozconf=
ig, autoconf, build_env, shell,<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Make old-configure append to=
 config.log, where we put our own log.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This could be done with a m4=
 macro, but it&#39;s way easier this way<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 script =3D script.replace(&#39;&gt;=
./config.log&#39;, &#39;&gt;&gt;./config.log&#39;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 script =3D script.replace(b&#39;&gt=
;./config.log&#39;, b&#39;&gt;&gt;./config.log&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(old_configure, &#39;=
wb&#39;) as fh:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh.write(script)=
<br>
&gt; &gt; -@@ -282,8 +282,8 @@ def old_configure_options(*options):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&#39;--x-includes&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&#39;--x-libraries&#39;,<br>
&gt; &gt; - )<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;compile&=
#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;open&#39=
;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;compile&#39=
;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;open&#39;)<=
br>
&gt; &gt; - @imports(&#39;logging&#39;)<br>
&gt; &gt; - @imports(&#39;os&#39;)<br>
&gt; &gt; - @imports(&#39;subprocess&#39;)<br>
&gt; &gt; -@@ -326,7 +326,7 @@ def old_configure(prepare_configure, extra_o=
ld_configure_args, all_options,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0log.debug(&#39;Running %s&#39;, quote(*cmd))=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if extra_env:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log.debug(&#39;with extra envi=
ronment: %s&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&#39; &#39;.join(&#39;%s=3D%s&#39; % pair for pair in extra_env.iteritems()=
))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&#39; &#39;.join(&#39;%s=3D%s&#39; % pair for pair in extra_env.items()))<b=
r>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Our logging goes to config.log, the same f=
ile old.configure uses.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# We can&#39;t share the handle on the file,=
 so close it. We assume nothing<br>
&gt; &gt; -@@ -359,7 +359,7 @@ def old_configure(prepare_configure, extra_o=
ld_configure_args, all_options,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Every variation of the exec(=
) function I tried led to:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# SyntaxError: unqualified exe=
c is not allowed in function &#39;main&#39; it<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# contains a nested function w=
ith free variables<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec code in raw_config # noqa<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec(code, raw_config) # noqa<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Ensure all the flags known to old-configur=
e appear in the<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# @old_configure_options above.<br>
&gt; &gt; -@@ -393,16 +393,24 @@ def set_old_configure_define(name, value):=
<br>
&gt; &gt; - @depends(old_configure)<br>
&gt; &gt; - @imports(&#39;types&#39;)<br>
&gt; &gt; - def post_old_configure(raw_config):<br>
&gt; &gt; -+=C2=A0 =C2=A0 <a href=3D"http://log.info" rel=3D"noreferrer" ta=
rget=3D"_blank">log.info</a>(&#39;post_old_configure started&#39;)<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for k, v in raw_config[&#39;substs&#39;]:<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_old_configure_config(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k[1:-1], v[1:-1] if i=
sinstance(v, types.StringTypes) else v)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k[1:-1], v[1:-1] if i=
sinstance(v, str) else v)<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 <a href=3D"http://log.info" rel=3D"noreferrer" ta=
rget=3D"_blank">log.info</a>(&#39;post_old_configure 1 finished&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 for k, v in dict(raw_config[&#39;defines&#39;]).i=
teritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 for k, v in dict(raw_config[&#39;defines&#39;]).i=
tems():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_old_configure_define(k[1:-=
1], v[1:-1])<br>
&gt; &gt; -<br>
&gt; &gt; -+=C2=A0 =C2=A0 <a href=3D"http://log.info" rel=3D"noreferrer" ta=
rget=3D"_blank">log.info</a>(&#39;post_old_configure 2 finished&#39;)<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set_old_configure_config(&#39;non_global_def=
ines&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_config[&#39;non_global_define=
s&#39;])<br>
&gt; &gt; -<br>
&gt; &gt; -+=C2=A0 =C2=A0 <a href=3D"http://log.info" rel=3D"noreferrer" ta=
rget=3D"_blank">log.info</a>(&#39;post_old_configure 3 finished&#39;)<br>
&gt; &gt; -+<br>
&gt; &gt; -<br>
&gt; &gt; - # Assuming no other option is declared after this function, han=
dle the<br>
&gt; &gt; - # env options that were injected by mozconfig_options by creati=
ng dummy<br>
&gt; &gt; -@@ -414,6 +422,7 @@ def post_old_configure(raw_config):<br>
&gt; &gt; - @imports(&#39;__sandbox__&#39;)<br>
&gt; &gt; - @imports(_from=3D&#39;mozbuild.configure.options&#39;, _import=
=3D&#39;Option&#39;)<br>
&gt; &gt; - def remaining_mozconfig_options(_):<br>
&gt; &gt; -+=C2=A0 =C2=A0 <a href=3D"http://log.info" rel=3D"noreferrer" ta=
rget=3D"_blank">log.info</a>(&#39;remaining_mozconfig_options started&#39;)=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0helper =3D __sandbox__._helper<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for arg in helper:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if helper._origins[arg] !=3D &=
#39;mozconfig&#39;:<br>
&gt; &gt; -@@ -422,5 +431,6 @@ def remaining_mozconfig_options(_):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if name.isupper() and name not=
 in __sandbox__._options:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0option =3D Optio=
n(env=3Dname, nargs=3D&#39;*&#39;, help=3Dname)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0helper.handle(op=
tion)<br>
&gt; &gt; -+=C2=A0 =C2=A0 <a href=3D"http://log.info" rel=3D"noreferrer" ta=
rget=3D"_blank">log.info</a>(&#39;remaining_mozconfig_options finished&#39;=
)<br>
&gt; &gt; -<br>
&gt; &gt; - # Please do not add anything after remaining_mozconfig_options(=
)<br>
&gt; &gt; -diff --git a/build/moz.configure/toolchain.configure b/build/moz=
.configure/toolchain.configure<br>
&gt; &gt; -index fc640c75e..c5508dfb7 100755<br>
&gt; &gt; ---- a/build/moz.configure/toolchain.configure<br>
&gt; &gt; -+++ b/build/moz.configure/toolchain.configure<br>
&gt; &gt; -@@ -391,7 +391,7 @@ def get_compiler_info(compiler, language):<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&#39;CPU&#39;, CPU_preprocess=
or_checks),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&#39;KERNEL&#39;, kernel_prep=
rocessor_checks),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for n, (value, condition) in enumer=
ate(preprocessor_checks.iteritems()):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for n, (value, condition) in enumer=
ate(preprocessor_checks.items()):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check +=3D deden=
t(&#39;&#39;&#39;\<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#%=
(if)s %(condition)s<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%%=
%(name)s &quot;%(value)s&quot;<br>
&gt; &gt; -@@ -425,9 +425,9 @@ def get_compiler_info(compiler, language):<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0data =3D {}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for line in result.splitlines():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if line.startswith(b&#39;%&#39=
;):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k, _, v =3D line.part=
ition(&#39; &#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k =3D k.lstrip(&#39;%=
&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[k] =3D v.replace=
(&#39; &#39;, &#39;&#39;).lstrip(&#39;&quot;&#39;).rstrip(&#39;&quot;&#39;)=
<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k, _, v =3D line.part=
ition(b&#39; &#39;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k =3D k.lstrip(b&#39;=
%&#39;).decode(&#39;utf-8&#39;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[k] =3D v.replace=
(b&#39; &#39;, b&#39;&#39;).lstrip(b&#39;&quot;&#39;).rstrip(b&#39;&quot;&#=
39;).decode(&#39;utf-8&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log.debug(&#39;%=
s =3D %s&#39;, k, data[k])<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0try:<br>
&gt; &gt; -@@ -551,7 +551,7 @@ def check_compiler(compiler, language, targe=
t):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;open&#39=
;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;open&#39;)<=
br>
&gt; &gt; - @imports(&#39;json&#39;)<br>
&gt; &gt; - @imports(&#39;subprocess&#39;)<br>
&gt; &gt; - @imports(&#39;sys&#39;)<br>
&gt; &gt; -@@ -606,7 +606,7 @@ def vs_major_version(value):<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; - @depends(host, target, vs_major_version, check_build_environmen=
t, &#39;--with-visual-studio-version&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;sorted&#=
39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;sorted&#39;=
)<br>
&gt; &gt; - @imports(_from=3D&#39;operator&#39;, _import=3D&#39;itemgetter&=
#39;)<br>
&gt; &gt; - @imports(&#39;platform&#39;)<br>
&gt; &gt; - def vc_compiler_path(host, target, vs_major_version, env, vs_re=
lease_name):<br>
&gt; &gt; -@@ -807,7 +807,7 @@ def compiler(language, host_or_target, c_com=
piler=3DNone, other_compiler=3DNone,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0target.os !=3D &#39;Android&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn namespace(**{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0k: [] if k =3D=3D &#39;flags&#39; else v<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for k, v in other_compiler.__dict__.iteritems()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for k, v in other_compiler.__dict__.items()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})=
<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Normally, we&#39;d use `var` instead of `_=
var`, but the interaction with<br>
&gt; &gt; -@@ -1238,7 +1238,7 @@ set_config(&#39;VISIBILITY_FLAGS&#39;, vis=
ibility_flags)<br>
&gt; &gt; -<br>
&gt; &gt; - @depends(c_compiler)<br>
&gt; &gt; - @imports(&#39;multiprocessing&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;min&#39;=
)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;min&#39;)<b=
r>
&gt; &gt; - def pgo_flags(compiler):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if compiler.type in (&#39;gcc&#39;, &#39;cla=
ng&#39;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return namespace(<br>
&gt; &gt; -@@ -1517,6 +1517,8 @@ def enable_gnu_linker(enable_gold_option, =
c_compiler, developer_options, build_e<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gold =3D check_cmd_output(*det=
ection_cmd).strip()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not gold:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(gold, bytes):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gold =3D gold.decode(=
&#39;utf-8&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goldFullPath =3D find_program(=
gold)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if goldFullPath is None:<br>
&gt; &gt; -diff --git a/build/moz.configure/util.configure b/build/moz.conf=
igure/util.configure<br>
&gt; &gt; -index 3284fd8b5..218813e2d 100644<br>
&gt; &gt; ---- a/build/moz.configure/util.configure<br>
&gt; &gt; -+++ b/build/moz.configure/util.configure<br>
&gt; &gt; -@@ -25,7 +25,6 @@ def configure_error(message):<br>
&gt; &gt; - # does not.<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;unicode&=
#39;)<br>
&gt; &gt; - @imports(&#39;subprocess&#39;)<br>
&gt; &gt; - @imports(&#39;sys&#39;)<br>
&gt; &gt; - @imports(_from=3D&#39;mozbuild.configure.util&#39;, _import=3D&=
#39;LineIO&#39;)<br>
&gt; &gt; -@@ -39,10 +38,10 @@ def check_cmd_output(*args, **kwargs):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if &#39;env&#39; in kwargs:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0normalized_env =3D {}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for k, v in kwargs[&#39;env&#3=
9;].items():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(k, unic=
ode):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(k, str)=
:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k =
=3D k.encode(&#39;utf-8&#39;, &#39;strict&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(v, unic=
ode):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(v, str)=
:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v =
=3D v.encode(&#39;utf-8&#39;, &#39;strict&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0normalized_env[k=
] =3D v<br>
&gt; &gt; -@@ -285,7 +284,7 @@ def unique_list(l):<br>
&gt; &gt; - #=C2=A0 =C2=A0 =C2=A0(&#39;19.0&#39;, &#39;x64&#39;, r&#39;C:\.=
..\amd64\cl.exe&#39;)<br>
&gt; &gt; - #=C2=A0 =C2=A0 =C2=A0(&#39;19.0&#39;, &#39;x86&#39;, r&#39;C:\.=
..\amd64_x86\cl.exe&#39;)<br>
&gt; &gt; - @imports(_import=3D&#39;_winreg&#39;, _as=3D&#39;winreg&#39;)<b=
r>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;WindowsE=
rror&#39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;WindowsErro=
r&#39;)<br>
&gt; &gt; - @imports(_from=3D&#39;fnmatch&#39;, _import=3D&#39;fnmatch&#39;=
)<br>
&gt; &gt; - def get_registry_values(pattern, get_32_and_64_bit=3DFalse):<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def enum_helper(func, key):<br>
&gt; &gt; -@@ -360,6 +359,8 @@ def get_registry_values(pattern, get_32_and_=
64_bit=3DFalse):<br>
&gt; &gt; - @imports(_from=3D&#39;mozbuild.configure.util&#39;, _import=3D&=
#39;Version&#39;, _as=3D&#39;_Version&#39;)<br>
&gt; &gt; - def Version(v):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&#39;A version number that can be compared u=
sefully.&#39;<br>
&gt; &gt; -+=C2=A0 =C2=A0 if isinstance(v, bytes):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D v.decode(&#39;utf-8&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return _Version(v)<br>
&gt; &gt; -<br>
&gt; &gt; - # Denotes a deprecated option. Combines option() and @depends:<=
br>
&gt; &gt; -diff --git a/build/moz.configure/windows.configure b/build/moz.c=
onfigure/windows.configure<br>
&gt; &gt; -index a5b790e3b..2b88fc447 100644<br>
&gt; &gt; ---- a/build/moz.configure/windows.configure<br>
&gt; &gt; -+++ b/build/moz.configure/windows.configure<br>
&gt; &gt; -@@ -10,7 +10,7 @@ option(&#39;--with-windows-version&#39;, nargs=
=3D1, default=3D&#39;603&#39;,<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; - @depends(&#39;--with-windows-version&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;ValueErr=
or&#39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;ValueError&=
#39;)<br>
&gt; &gt; - def valid_windows_version(value):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if not value:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die(&#39;Cannot build with --w=
ithout-windows-version&#39;)<br>
&gt; &gt; -@@ -50,8 +50,8 @@ def windows_sdk_dir(value, host):<br>
&gt; &gt; -<br>
&gt; &gt; - @imports(&#39;os&#39;)<br>
&gt; &gt; - @imports(&#39;re&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;sorted&#=
39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;WindowsE=
rror&#39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;sorted&#39;=
)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;WindowsErro=
r&#39;)<br>
&gt; &gt; - def get_sdk_dirs(sdk, subdir):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def get_dirs_containing(sdk, stem, subdir):<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D os.path.join(sdk, ste=
m)<br>
&gt; &gt; -@@ -96,7 +96,7 @@ def valid_windows_sdk_dir_result(value):<br>
&gt; &gt; -<br>
&gt; &gt; - @depends(c_compiler, windows_sdk_dir, valid_windows_version, &#=
39;WINDOWSSDKDIR&#39;)<br>
&gt; &gt; - @checking(&#39;for Windows SDK&#39;, valid_windows_sdk_dir_resu=
lt)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;sorted&#=
39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;sorted&#39;=
)<br>
&gt; &gt; - @imports(_from=3D&#39;textwrap&#39;, _import=3D&#39;dedent&#39;=
)<br>
&gt; &gt; - def valid_windows_sdk_dir(compiler, windows_sdk_dir, target_ver=
sion,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0windows_sdk_dir_env):<br>
&gt; &gt; -@@ -174,7 +174,7 @@ def valid_ucrt_sdk_dir_result(value):<br>
&gt; &gt; - @depends(windows_sdk_dir, &#39;WINDOWSSDKDIR&#39;, c_compiler)<=
br>
&gt; &gt; - @checking(&#39;for Universal CRT SDK&#39;, valid_ucrt_sdk_dir_r=
esult)<br>
&gt; &gt; - @imports(&#39;os&#39;)<br>
&gt; &gt; --@imports(_from=3D&#39;__builtin__&#39;, _import=3D&#39;sorted&#=
39;)<br>
&gt; &gt; -+@imports(_from=3D&#39;builtins&#39;, _import=3D&#39;sorted&#39;=
)<br>
&gt; &gt; - @imports(_import=3D&#39;mozpack.path&#39;, _as=3D&#39;mozpath&#=
39;)<br>
&gt; &gt; - def valid_ucrt_sdk_dir(windows_sdk_dir, windows_sdk_dir_env, c_=
compiler):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if windows_sdk_dir_env:<br>
&gt; &gt; -diff --git a/build/templates.mozbuild b/build/templates.mozbuild=
<br>
&gt; &gt; -index 3da850ce5..ae5e410fe 100644<br>
&gt; &gt; ---- a/build/templates.mozbuild<br>
&gt; &gt; -+++ b/build/templates.mozbuild<br>
&gt; &gt; -@@ -10,7 +10,7 @@ def Binary():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0templates.&#39;&#39;&#39;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Add -llog by default, since we use it all =
over the place.<br>
&gt; &gt; --=C2=A0 =C2=A0 if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;Androi=
d&#39;:<br>
&gt; &gt; -+=C2=A0 =C2=A0 if str(CONFIG[&#39;OS_TARGET&#39;]) =3D=3D &#39;A=
ndroid&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OS_LIBS +=3D [&#39;log&#39;]<b=
r>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/config/MozZipFile.py b/config/MozZipFile.py<br>
&gt; &gt; -index 337fe0521..dc7add4c3 100644<br>
&gt; &gt; ---- a/config/MozZipFile.py<br>
&gt; &gt; -+++ b/config/MozZipFile.py<br>
&gt; &gt; -@@ -18,7 +18,7 @@ class ZipFile(zipfile.ZipFile):<br>
&gt; &gt; -=C2=A0 =C2=A0def __init__(self, file, mode=3D&quot;r&quot;, comp=
ression=3Dzipfile.ZIP_STORED,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D=
 False):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if lock:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 assert isinstance(file, basestring)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 assert isinstance(file, str)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0self.lockfile =3D lock_file(file + &#=
39;.lck&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0self.lockfile =3D None<br>
&gt; &gt; -@@ -46,7 +46,7 @@ class ZipFile(zipfile.ZipFile):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0date_time=3Dtime.localtime(=
time.time()))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0zinfo.compress_type =3D self.compress=
ion<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Add some standard UNIX file access =
permissions (-rw-r--r--).<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 zinfo.external_attr =3D (0x81a4 &amp; 0xFF=
FF) &lt;&lt; 16L<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 zinfo.external_attr =3D (0x81a4 &amp; 0xFF=
FF) &lt;&lt; 16<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0zinfo =3D zinfo_or_arcname<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -58,7 +58,7 @@ class ZipFile(zipfile.ZipFile):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# as the old, reuse the existing entry.<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0doSeek =3D False # store if we need to seek =
to the eof after overwriting<br>
&gt; &gt; --=C2=A0 =C2=A0 if self.NameToInfo.has_key(zinfo.filename):<br>
&gt; &gt; -+=C2=A0 =C2=A0 if zinfo.filename in self.NameToInfo:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Find the last ZipInfo with our name=
.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Last, because that&#39;s catching m=
ultiple overwrites<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D len(self.filelist)<br>
&gt; &gt; -@@ -109,14 +109,14 @@ class ZipFile(zipfile.ZipFile):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# adjust file mode if we originally j=
ust wrote, now we rewrite<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0self.fp.close()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0self.fp =3D open(self.filename, &#39;=
r+b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 all =3D map(lambda zi: (zi, True), self.filelist)=
 + \<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 map(lambda zi: (zi, False), self._r=
emove)<br>
&gt; &gt; -+=C2=A0 =C2=A0 all =3D [(zi, True) for zi in self.filelist] + \<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [(zi, False) for zi in self._remove=
]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0all.sort(lambda l, r: cmp(l[0].header_offset=
, r[0].header_offset))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# empty _remove for multiple closes<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0self._remove =3D []<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0lengths =3D [all[i+1][0].header_offset - all=
[i][0].header_offset<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in=
 xrange(len(all)-1)]<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in=
 range(len(all)-1)]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0lengths.append(self.end - all[-1][0].header_=
offset)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0to_pos =3D 0<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for (zi, keep), length in zip(all, lengths):=
<br>
&gt; &gt; -diff --git a/config/expandlibs.py b/config/expandlibs.py<br>
&gt; &gt; -index ac06c432f..df1fed15d 100644<br>
&gt; &gt; ---- a/config/expandlibs.py<br>
&gt; &gt; -+++ b/config/expandlibs.py<br>
&gt; &gt; -@@ -26,7 +26,7 @@ ${LIB_PREFIX}${ROOT}.${LIB_SUFFIX} following t=
hese rules:<br>
&gt; &gt; -=C2=A0 =C2=A0descriptor contains. And for each of these LIBS, al=
so apply the same<br>
&gt; &gt; -=C2=A0 =C2=A0rules.<br>
&gt; &gt; - &#39;&#39;&#39;<br>
&gt; &gt; --from __future__ import with_statement<br>
&gt; &gt; -+<br>
&gt; &gt; - import sys, os, errno<br>
&gt; &gt; - import expandlibs_config as conf<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -36,7 +36,7 @@ def ensureParentDir(file):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if dir and not os.path.exists(dir):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.makedirs(dir)=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError, error:<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as error:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if error.errno !=
=3D errno.EEXIST:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ra=
ise<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -140,4 +140,4 @@ class ExpandArgs(list):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return [relativize(arg)]<br>
&gt; &gt; -<br>
&gt; &gt; - if __name__ =3D=3D &#39;__main__&#39;:<br>
&gt; &gt; --=C2=A0 =C2=A0 print &quot; &quot;.join(ExpandArgs(sys.argv[1:])=
)<br>
&gt; &gt; -+=C2=A0 =C2=A0 print(&quot; &quot;.join(ExpandArgs(sys.argv[1:])=
))<br>
&gt; &gt; -diff --git a/config/expandlibs_exec.py b/config/expandlibs_exec.=
py<br>
&gt; &gt; -index df656016c..fb786a6a8 100644<br>
&gt; &gt; ---- a/config/expandlibs_exec.py<br>
&gt; &gt; -+++ b/config/expandlibs_exec.py<br>
&gt; &gt; -@@ -20,7 +20,7 @@ With the --symbol-order argument, followed by =
a file name, it will add the<br>
&gt; &gt; - relevant linker options to change the order in which the linker=
 puts the<br>
&gt; &gt; - symbols appear in the resulting binary. Only works for ELF targ=
ets.<br>
&gt; &gt; - &#39;&#39;&#39;<br>
&gt; &gt; --from __future__ import with_statement<br>
&gt; &gt; -+<br>
&gt; &gt; - import sys<br>
&gt; &gt; - import os<br>
&gt; &gt; - from expandlibs import (<br>
&gt; &gt; -@@ -304,11 +304,11 @@ class SectionFinder(object):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return syms<br>
&gt; &gt; -<br>
&gt; &gt; - def print_command(out, args):<br>
&gt; &gt; --=C2=A0 =C2=A0 print &gt;&gt;out, &quot;Executing: &quot; + &quo=
t; &quot;.join(args)<br>
&gt; &gt; -+=C2=A0 =C2=A0 print(&quot;Executing: &quot; + &quot; &quot;.joi=
n(args), file=3Dout)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for tmp in [f for f in args.tmp if os.path.i=
sfile(f)]:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 print &gt;&gt;out, tmp + &quot;:&qu=
ot;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(tmp + &quot;:&quot;, file=3Do=
ut)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(tmp) as file:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &gt;&gt;out, &q=
uot;&quot;.join([&quot;=C2=A0 =C2=A0 &quot; + l for l in file.readlines()])=
<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;&quot;.jo=
in([&quot;=C2=A0 =C2=A0 &quot; + l for l in file.readlines()]), file=3Dout)=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0out.flush()<br>
&gt; &gt; -<br>
&gt; &gt; - def main(args, proc_callback=3DNone):<br>
&gt; &gt; -@@ -338,13 +338,13 @@ def main(args, proc_callback=3DNone):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc =3D subproc=
ess.Popen(args, stdout =3D subprocess.PIPE, stderr =3D subprocess.STDOUT)<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if proc_callback=
:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr=
oc_callback(proc)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception, e:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &gt;&gt;sys.std=
err, &#39;error: Launching&#39;, args, &#39;:&#39;, e<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;error: Lau=
nching&#39;, args, &#39;:&#39;, e, file=3Dsys.stderr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise e<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(stdout, stderr) =3D proc.comm=
unicate()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if proc.returncode and not opt=
ions.verbose:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print_command(sy=
s.stderr, args)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(stdout)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(stdout.decode(&quo=
t;utf-8&quot;))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stderr.flush()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if proc.returncode:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return proc.retu=
rncode<br>
&gt; &gt; -diff --git a/config/expandlibs_gen.py b/config/expandlibs_gen.py=
<br>
&gt; &gt; -index b1de63cd0..dc62bd184 100644<br>
&gt; &gt; ---- a/config/expandlibs_gen.py<br>
&gt; &gt; -+++ b/config/expandlibs_gen.py<br>
&gt; &gt; -@@ -5,7 +5,7 @@<br>
&gt; &gt; - &#39;&#39;&#39;Given a list of object files and library names, =
prints a library<br>
&gt; &gt; - descriptor to standard output&#39;&#39;&#39;<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import with_statement<br>
&gt; &gt; -+<br>
&gt; &gt; - import sys<br>
&gt; &gt; - import os<br>
&gt; &gt; - import expandlibs_config as conf<br>
&gt; &gt; -@@ -38,4 +38,4 @@ if __name__ =3D=3D &#39;__main__&#39;:<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ensureParentDir(options.output)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0with open(options.output, &#39;w&#39;) as ou=
tfile:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 print &gt;&gt;outfile, generate(arg=
s)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(generate(args), file=3Doutfil=
e)<br>
&gt; &gt; -diff --git a/configure.py b/configure.py<br>
&gt; &gt; -index 771e34e38..bee329d7c 100644<br>
&gt; &gt; ---- a/configure.py<br>
&gt; &gt; -+++ b/configure.py<br>
&gt; &gt; -@@ -2,10 +2,11 @@<br>
&gt; &gt; - # License, v. 2.0. If a copy of the MPL was not distributed wit=
h this<br>
&gt; &gt; - # file, You can obtain one at <a href=3D"http://mozilla.org/MPL=
/2.0/" rel=3D"noreferrer" target=3D"_blank">http://mozilla.org/MPL/2.0/</a>=
.<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import print_function, unicode_literals<br>
&gt; &gt; -+<br>
&gt; &gt; -<br>
&gt; &gt; - import codecs<br>
&gt; &gt; - import itertools<br>
&gt; &gt; -+import logging<br>
&gt; &gt; - import os<br>
&gt; &gt; - import sys<br>
&gt; &gt; - import textwrap<br>
&gt; &gt; -@@ -34,7 +35,9 @@ from mozbuild.util import (<br>
&gt; &gt; - def main(argv):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0config =3D {}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sandbox =3D ConfigureSandbox(config, os.envi=
ron, argv)<br>
&gt; &gt; -+=C2=A0 =C2=A0 print(&#39;sandbox.run started&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sandbox.run(os.path.join(os.path.dirname(__f=
ile__), &#39;moz.configure&#39;))<br>
&gt; &gt; -+=C2=A0 =C2=A0 print(&#39;sandbox.run finished&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if sandbox._help:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
&gt; &gt; -@@ -56,12 +59,21 @@ def config_status(config):<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sanitized_config =3D {}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sanitized_config[&#39;substs&#39;] =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 k: sanitized_bools(v) for k, v in c=
onfig.iteritems()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 k: sanitized_bools(v) for k, v in c=
onfig.items()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if k not in (&#39;DEFINES&#39;=
, &#39;non_global_defines&#39;, &#39;TOPSRCDIR&#39;, &#39;TOPOBJDIR&#39;,<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;ALL_CONFIGURE_PATHS&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 # Hack around OptionValue entries unknown during =
compile<br>
&gt; &gt; -+=C2=A0 =C2=A0 for opt in (&#39;BUILD_BACKENDS&#39;, &#39;MOZ_UI=
_LOCALE&#39;, &#39;RUSTFLAGS&#39; ):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 old =3D sanitized_config[&#39;subst=
s&#39;][opt]<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new =3D []<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for setting in old:<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new.append(setting)<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sanitized_config[&#39;substs&#39;][=
opt] =3D new<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sanitized_config[&#39;defines&#39;] =3D {<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 k: sanitized_bools(v) for k, v in c=
onfig[&#39;DEFINES&#39;].iteritems()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 k: sanitized_bools(v) for k, v in c=
onfig[&#39;DEFINES&#39;].items()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sanitized_config[&#39;non_global_defines&#39=
;] =3D config[&#39;non_global_defines&#39;]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sanitized_config[&#39;topsrcdir&#39;] =3D co=
nfig[&#39;TOPSRCDIR&#39;]<br>
&gt; &gt; -@@ -71,20 +83,17 @@ def config_status(config):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Create config.status. Eventually, we&#39;l=
l want to just do the work it does<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# here, when we&#39;re able to skip configur=
e tests/use cached results/not rely<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# on autoconf.<br>
&gt; &gt; --=C2=A0 =C2=A0 print(&quot;Creating config.status&quot;, file=3D=
sys.stderr)<br>
&gt; &gt; --=C2=A0 =C2=A0 encoding =3D &#39;mbcs&#39; if sys.platform =3D=
=3D &#39;win32&#39; else &#39;utf-8&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 with codecs.open(&#39;config.status&#39;, &#39;w&=
#39;, encoding) as fh:<br>
&gt; &gt; -+=C2=A0 =C2=A0 logging.getLogger(&#39;moz.configure&#39;).info(&=
#39;Creating config.status&#39;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 with codecs.open(&#39;config.status&#39;, &#39;w&=
#39;, &#39;utf-8&#39;) as fh:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh.write(textwrap.dedent(&#39;=
&#39;&#39;\<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#!%(python)s<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # coding=3D%(encoding=
)s<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from __future__ impor=
t unicode_literals<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from mozbuild.util im=
port encode<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding =3D &#39;%(e=
ncoding)s&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;) % {&#39;python&#39=
;: config[&#39;PYTHON&#39;], &#39;encoding&#39;: encoding})<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # coding=3Dutf-8<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;config.st=
atus started&quot;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;) % {&#39;python&#39=
;: config[&#39;PYTHON&#39;]})<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# A lot of the build backend c=
ode is currently expecting byte<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# strings and breaks in subtle=
 ways with unicode strings. (bug 1296508)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in sanitized_config.iterit=
ems():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fh.write(&#39;%s =3D =
encode(%s, encoding)\n&#39; % (k, indented_repr(v)))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in sanitized_config.items(=
):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fh.write(&#39;%s =3D =
%s\n&#39; % (k, indented_repr(v)))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh.write(&quot;__all__ =3D [&#=
39;topobjdir&#39;, &#39;topsrcdir&#39;, &#39;defines&#39;, &quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;&#39;non_global_defines&#39;, &#39;substs&#39;, &#39;mozconfig&#39;]&q=
uot;)<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -97,6 +106,9 @@ def config_status(config):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0args =3D dict([(name, globals()[name]) for name in __all__])<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0config_status(**args)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;)=
)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fh.write(textwrap.dedent(&#39;&#39;=
&#39;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;config.st=
atus finished&quot;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;))<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0partial_config =3D PartialConfigEnvironment(=
config[&#39;TOPOBJDIR&#39;])<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0partial_config.write_vars(sanitized_config)<=
br>
&gt; &gt; -@@ -116,7 +128,7 @@ def config_status(config):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# executable permissions.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0os.chmod(&#39;config.status&#39;, 0o755)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if config.get(&#39;MOZ_BUILD_APP&#39;) !=3D =
&#39;js&#39; or config.get(&#39;JS_STANDALONE&#39;):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[b&#39;WRITE_MOZINFO&#39;=
] =3D b&#39;1&#39;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;WRITE_MOZINFO&#39;]=
 =3D &#39;1&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from mozbuild.config_status im=
port config_status<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Some values in sanitized_con=
fig also have more complex types, such as<br>
&gt; &gt; -@@ -127,7 +139,7 @@ def config_status(config):<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# A lot of the build backend c=
ode is currently expecting byte strings<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# and breaks in subtle ways wi=
th unicode strings.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return config_status(args=3D[], **e=
ncode(sanitized_config, encoding))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return config_status(args=3D[], **s=
anitized_config)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/js/src/build/moz.build b/js/src/build/moz.build<br>
&gt; &gt; -index a7f5fa4ce..856cae32d 100644<br>
&gt; &gt; ---- a/js/src/build/moz.build<br>
&gt; &gt; -+++ b/js/src/build/moz.build<br>
&gt; &gt; -@@ -47,22 +47,22 @@ USE_LIBS +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&#39;zlib&#39;,<br>
&gt; &gt; - ]<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_ARCH&#39;] not in (&#39;WINNT&#39;, &#39;HP-U=
X&#39;):<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_ARCH&#39;]) not in (&#39;WINNT&#39;, &#39=
;HP-UX&#39;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0OS_LIBS +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;m&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_ARCH&#39;] =3D=3D &#39;FreeBSD&#39;:<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_ARCH&#39;]) =3D=3D &#39;FreeBSD&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0OS_LIBS +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-pthread&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_ARCH&#39;] =3D=3D &#39;Linux&#39;:<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_ARCH&#39;]) =3D=3D &#39;Linux&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0OS_LIBS +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dl&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_ARCH&#39;] =3D=3D &#39;SunOS&#39;:<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_ARCH&#39;]) =3D=3D &#39;SunOS&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0OS_LIBS +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;posix4&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dl&#39;,<br>
&gt; &gt; -diff --git a/js/src/builtin/embedjs.py b/js/src/builtin/embedjs.=
py<br>
&gt; &gt; -index ba25e71c1..d4f2de122 100644<br>
&gt; &gt; ---- a/js/src/builtin/embedjs.py<br>
&gt; &gt; -+++ b/js/src/builtin/embedjs.py<br>
&gt; &gt; -@@ -36,7 +36,7 @@<br>
&gt; &gt; - #<br>
&gt; &gt; - # It uses the C preprocessor to process its inputs.<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import with_statement<br>
&gt; &gt; -+<br>
&gt; &gt; - import re, sys, os, subprocess<br>
&gt; &gt; - import shlex<br>
&gt; &gt; - import which<br>
&gt; &gt; -@@ -52,8 +52,8 @@ def ToCAsciiArray(lines):<br>
&gt; &gt; -<br>
&gt; &gt; - def ToCArray(lines):<br>
&gt; &gt; -=C2=A0 =C2=A0result =3D []<br>
&gt; &gt; --=C2=A0 for chr in lines:<br>
&gt; &gt; --=C2=A0 =C2=A0 result.append(str(ord(chr)))<br>
&gt; &gt; -+=C2=A0 for char in lines:<br>
&gt; &gt; -+=C2=A0 =C2=A0 result.append(&quot;0x%0.2X&quot; % char)<br>
&gt; &gt; -=C2=A0 =C2=A0return &quot;, &quot;.join(result)<br>
&gt; &gt; -<br>
&gt; &gt; - HEADER_TEMPLATE =3D &quot;&quot;&quot;\<br>
&gt; &gt; -@@ -87,7 +87,7 @@ def embed(cxx, preprocessorOption, cppflags, m=
sgs, sources, c_out, js_out, names<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0js_out.write(processed)<br>
&gt; &gt; -=C2=A0 =C2=A0import zlib<br>
&gt; &gt; --=C2=A0 compressed =3D zlib.compress(processed)<br>
&gt; &gt; -+=C2=A0 compressed =3D zlib.compress(processed.encode(&#39;utf-8=
&#39;))<br>
&gt; &gt; -=C2=A0 =C2=A0data =3D ToCArray(compressed)<br>
&gt; &gt; -=C2=A0 =C2=A0c_out.write(HEADER_TEMPLATE % {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&#39;sources_type&#39;: &#39;unsigned char&#=
39;,<br>
&gt; &gt; -@@ -107,7 +107,7 @@ def preprocess(cxx, preprocessorOption, sour=
ce, args =3D []):<br>
&gt; &gt; -=C2=A0 =C2=A0tmpOut =3D &#39;self-hosting-preprocessed.pp&#39;;<=
br>
&gt; &gt; -=C2=A0 =C2=A0outputArg =3D shlex.split(preprocessorOption + tmpO=
ut)<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 with open(tmpIn, &#39;wb&#39;) as input:<br>
&gt; &gt; -+=C2=A0 with open(tmpIn, &#39;w&#39;) as input:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0input.write(source)<br>
&gt; &gt; -=C2=A0 =C2=A0print(&#39; &#39;.join(cxx + outputArg + args + [tm=
pIn]))<br>
&gt; &gt; -=C2=A0 =C2=A0result =3D subprocess.Popen(cxx + outputArg + args =
+ [tmpIn]).wait()<br>
&gt; &gt; -diff --git a/js/src/configure b/js/src/configure<br>
&gt; &gt; -index 3b3a39af3..8f5ea41d0 100755<br>
&gt; &gt; ---- a/js/src/configure<br>
&gt; &gt; -+++ b/js/src/configure<br>
&gt; &gt; -@@ -24,4 +24,4 @@ export OLD_CONFIGURE=3D&quot;$SRCDIR&quot;/old=
-configure<br>
&gt; &gt; -<br>
&gt; &gt; - set -- &quot;$@&quot; --enable-project=3Djs<br>
&gt; &gt; -<br>
&gt; &gt; --which python2.7 &gt; /dev/null &amp;&amp; exec python2.7 &quot;=
$TOPSRCDIR/configure.py&quot; &quot;$@&quot; || exec python &quot;$TOPSRCDI=
R/configure.py&quot; &quot;$@&quot;<br>
&gt; &gt; -+which python3 &gt; /dev/null &amp;&amp; exec python3 &quot;$TOP=
SRCDIR/configure.py&quot; &quot;$@&quot; || exec python &quot;$TOPSRCDIR/co=
nfigure.py&quot; &quot;$@&quot;<br>
&gt; &gt; -diff --git a/js/src/frontend/GenerateReservedWords.py b/js/src/f=
rontend/GenerateReservedWords.py<br>
&gt; &gt; -index 3aa2307b9..381c8e2b4 100644<br>
&gt; &gt; ---- a/js/src/frontend/GenerateReservedWords.py<br>
&gt; &gt; -+++ b/js/src/frontend/GenerateReservedWords.py<br>
&gt; &gt; -@@ -80,14 +80,14 @@ def split_list_per_column(reserved_word_list=
, column):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0per_column =3D column_dict.set=
default(word[column], [])<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0per_column.append(item)<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 return sorted(column_dict.items(), key=3Dlambda (=
char, word): ord(char))<br>
&gt; &gt; -+=C2=A0 =C2=A0 return sorted(list(column_dict.items()), key=3Dla=
mbda char_word: ord(char_word[0]))<br>
&gt; &gt; -<br>
&gt; &gt; - def generate_letter_switch(opt, unprocessed_columns, reserved_w=
ord_list,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 columns=3DNone):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0assert(len(reserved_word_list) !=3D 0);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if not columns:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 columns =3D range(0, unprocessed_co=
lumns)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 columns =3D list(range(0, unprocess=
ed_columns))<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if len(reserved_word_list) =3D=3D 1:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index, word =3D reserved_word_=
list[0]<br>
&gt; &gt; -@@ -161,7 +161,7 @@ def split_list_per_length(reserved_word_list=
):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0per_length =3D length_dict.set=
default(len(word), [])<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0per_length.append(item)<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 return sorted(length_dict.items(), key=3Dlambda (=
length, word): length)<br>
&gt; &gt; -+=C2=A0 =C2=A0 return sorted(list(length_dict.items()), key=3Dla=
mbda length_word: length_word[0])<br>
&gt; &gt; -<br>
&gt; &gt; - def generate_switch(opt, reserved_word_list):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0assert(len(reserved_word_list) !=3D 0);<br>
&gt; &gt; -diff --git a/js/src/gc/GenerateStatsPhases.py b/js/src/gc/Genera=
teStatsPhases.py<br>
&gt; &gt; -index 2daf83555..e39a26a4b 100644<br>
&gt; &gt; ---- a/js/src/gc/GenerateStatsPhases.py<br>
&gt; &gt; -+++ b/js/src/gc/GenerateStatsPhases.py<br>
&gt; &gt; -@@ -267,7 +267,7 @@ def generateHeader(out):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0#<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Generate PhaseKind enum.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0#<br>
&gt; &gt; --=C2=A0 =C2=A0 phaseKindNames =3D map(lambda phaseKind: phaseKin=
d.name, AllPhaseKinds)<br>
&gt; &gt; -+=C2=A0 =C2=A0 phaseKindNames =3D [phaseKind.name for phaseKind =
in AllPhaseKinds]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0extraPhaseKinds =3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;NONE =3D LIMIT&quot;,<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;EXPLICIT_SUSPENSION =3D =
LIMIT&quot;,<br>
&gt; &gt; -@@ -279,7 +279,7 @@ def generateHeader(out):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0#<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Generate Phase enum.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0#<br>
&gt; &gt; --=C2=A0 =C2=A0 phaseNames =3D map(lambda phase: <a href=3D"http:=
//phase.name" rel=3D"noreferrer" target=3D"_blank">phase.name</a>, AllPhase=
s)<br>
&gt; &gt; -+=C2=A0 =C2=A0 phaseNames =3D [<a href=3D"http://phase.name" rel=
=3D"noreferrer" target=3D"_blank">phase.name</a> for phase in AllPhases]<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0extraPhases =3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;NONE =3D LIMIT&quot;,<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;EXPLICIT_SUSPENSION =3D =
LIMIT&quot;,<br>
&gt; &gt; -diff --git a/js/src/<a href=3D"http://old-configure.in" rel=3D"n=
oreferrer" target=3D"_blank">old-configure.in</a> b/js/src/<a href=3D"http:=
//old-configure.in" rel=3D"noreferrer" target=3D"_blank">old-configure.in</=
a><br>
&gt; &gt; -index 11c3d5a2e..389265404 100644<br>
&gt; &gt; ---- a/js/src/<a href=3D"http://old-configure.in" rel=3D"noreferr=
er" target=3D"_blank">old-configure.in</a><br>
&gt; &gt; -+++ b/js/src/<a href=3D"http://old-configure.in" rel=3D"noreferr=
er" target=3D"_blank">old-configure.in</a><br>
&gt; &gt; -@@ -1884,3 +1884,5 @@ if test &quot;$JS_STANDALONE&quot;; then<b=
r>
&gt; &gt; - fi<br>
&gt; &gt; -<br>
&gt; &gt; - rm -fr confdefs* $ac_clean_files<br>
&gt; &gt; -+echo confdefs* $ac_clean_files removed<br>
&gt; &gt; -+echo &quot;old-configure done&quot;<br>
&gt; &gt; -diff --git a/memory/build/moz.build b/memory/build/moz.build<br>
&gt; &gt; -index e2c715271..f09ce7935 100644<br>
&gt; &gt; ---- a/memory/build/moz.build<br>
&gt; &gt; -+++ b/memory/build/moz.build<br>
&gt; &gt; -@@ -30,7 +30,7 @@ else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fallback.cpp&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;Darwin&#39; and (CON=
FIG[&#39;MOZ_REPLACE_MALLOC&#39;] or<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_TARGET&#39;]) =3D=3D &#39;Darwin&#39; and=
 (CONFIG[&#39;MOZ_REPLACE_MALLOC&#39;] or<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG[&#39;MOZ_MEMORY&#39;]):=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SOURCES +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;zone.c&#39;,<br>
&gt; &gt; -@@ -38,15 +38,15 @@ if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;D=
arwin&#39; and (CONFIG[&#39;MOZ_REPLACE_MALLOC&#39;] or<br>
&gt; &gt; -<br>
&gt; &gt; - Library(&#39;memory&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;Android&#39; and CON=
FIG[&#39;CC_TYPE&#39;] =3D=3D &#39;clang&#39;:<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_TARGET&#39;]) =3D=3D &#39;Android&#39; an=
d str(CONFIG[&#39;CC_TYPE&#39;]) =3D=3D &#39;clang&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0CXXFLAGS +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wno-tautological-pointer=
-compare&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;MOZ_BUILD_APP&#39;] !=3D &#39;memory&#39;:<br>
&gt; &gt; -+if str(CONFIG[&#39;MOZ_BUILD_APP&#39;]) !=3D &#39;memory&#39;:<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0FINAL_LIBRARY =3D &#39;mozglue&#39;<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;CC_TYPE&#39;] in (&#39;msvc&#39;, &#39;clang-cl&=
#39;):<br>
&gt; &gt; -+if str(CONFIG[&#39;CC_TYPE&#39;]) in (&#39;msvc&#39;, &#39;clan=
g-cl&#39;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0CXXFLAGS +=3D [&#39;-wd4273&#39;] # inconsis=
tent dll linkage (bug 558163)<br>
&gt; &gt; -<br>
&gt; &gt; - if CONFIG[&#39;MOZ_REPLACE_MALLOC_STATIC&#39;]:<br>
&gt; &gt; -diff --git a/mozglue/build/moz.build b/mozglue/build/moz.build<b=
r>
&gt; &gt; -index 53758485a..5e9308802 100644<br>
&gt; &gt; ---- a/mozglue/build/moz.build<br>
&gt; &gt; -+++ b/mozglue/build/moz.build<br>
&gt; &gt; -@@ -9,12 +9,12 @@<br>
&gt; &gt; - # If this is ever changed, update MOZ_SHARED_MOZGLUE in browser=
/installer/Makefile.in<br>
&gt; &gt; - if CONFIG[&#39;JS_STANDALONE&#39;] and not CONFIG[&#39;MOZ_MEMO=
RY&#39;]:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0Library(&#39;mozglue&#39;)<br>
&gt; &gt; --elif CONFIG[&#39;OS_TARGET&#39;] in (&#39;WINNT&#39;, &#39;Darw=
in&#39;, &#39;Android&#39;):<br>
&gt; &gt; -+elif str(CONFIG[&#39;OS_TARGET&#39;]) in (&#39;WINNT&#39;, &#39=
;Darwin&#39;, &#39;Android&#39;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SharedLibrary(&#39;mozglue&#39;)<br>
&gt; &gt; - else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0Library(&#39;mozglue&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;Android&#39;:<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_TARGET&#39;]) =3D=3D &#39;Android&#39;:<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SOURCES +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;BionicGlue.cpp&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -@@ -24,14 +24,14 @@ if CONFIG[&#39;MOZ_ASAN&#39;]:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;AsanOptions.cpp&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;WINNT&#39;:<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_TARGET&#39;]) =3D=3D &#39;WINNT&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0DEFFILE =3D &#39;mozglue.def&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# We&#39;ll break the DLL blocklist if we im=
mediately load user32.dll<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0DELAYLOAD_DLLS +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;user32.dll&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 if CONFIG[&#39;CC_TYPE&#39;] =3D=3D &quot;msvc&qu=
ot;:<br>
&gt; &gt; -+=C2=A0 =C2=A0 if str(CONFIG[&#39;CC_TYPE&#39;]) =3D=3D &quot;ms=
vc&quot;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS +=3D [&#39;-guard:cf&#3=
9;]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXXFLAGS +=3D [&#39;-guard:cf&=
#39;]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS +=3D [&#39;-guard:cf&#=
39;]<br>
&gt; &gt; -@@ -48,12 +48,12 @@ if CONFIG[&#39;MOZ_WIDGET_TOOLKIT&#39;]:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dummy.cpp&#=
39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;WINNT&=
#39;:<br>
&gt; &gt; -+=C2=A0 =C2=A0 if str(CONFIG[&#39;OS_TARGET&#39;]) =3D=3D &#39;W=
INNT&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOCAL_INCLUDES +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/memory/bui=
ld&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if CONFIG[&#39;CC_TYPE&#39;] =3D=3D=
 &quot;msvc&quot;:<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if str(CONFIG[&#39;CC_TYPE&#39;]) =
=3D=3D &quot;msvc&quot;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCES +=3D [&#=
39;WindowsCFGStatus.cpp&#39;]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCES +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Authenticod=
e.cpp&#39;,<br>
&gt; &gt; -@@ -85,17 +85,17 @@ if CONFIG[&#39;MOZ_WIDGET_TOOLKIT&#39;]:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;WindowsDllBlocklist.h&#39=
;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 if CONFIG[&#39;CPU_ARCH&#39;].startswith(&#39;x86=
&#39;):<br>
&gt; &gt; -+=C2=A0 =C2=A0 if str(CONFIG[&#39;CPU_ARCH&#39;]).startswith(&#3=
9;x86&#39;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCES +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;SSE.cpp&#39=
;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 if CONFIG[&#39;CPU_ARCH&#39;] =3D=3D &#39;arm&#39=
;:<br>
&gt; &gt; -+=C2=A0 =C2=A0 if str(CONFIG[&#39;CPU_ARCH&#39;]) =3D=3D &#39;ar=
m&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCES +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arm.cpp&#39=
;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 if CONFIG[&#39;CPU_ARCH&#39;].startswith(&#39;mip=
s&#39;):<br>
&gt; &gt; -+=C2=A0 =C2=A0 if str(CONFIG[&#39;CPU_ARCH&#39;]).startswith(&#3=
9;mips&#39;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCES +=3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;mips.cpp&#3=
9;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt; &gt; -@@ -114,7 +114,7 @@ LIBRARY_DEFINES[&#39;MOZ_HAS_MOZGLUE&#39;] =
=3D True<br>
&gt; &gt; -<br>
&gt; &gt; - LDFLAGS +=3D CONFIG[&#39;MOZ_GLUE_WRAP_LDFLAGS&#39;]<br>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;Darwin&#39;:<br>
&gt; &gt; -+if str(CONFIG[&#39;OS_TARGET&#39;]) =3D=3D &#39;Darwin&#39;:<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# On OSX 10.10.3, a dead lock happens in som=
e cases involving dynamic<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# symbol resolution for symbols that jemallo=
c itself uses. While it<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# might be possible to find a way to avoid a=
ll such symbol resolutions,<br>
&gt; &gt; -@@ -124,7 +124,7 @@ if CONFIG[&#39;OS_TARGET&#39;] =3D=3D &#39;D=
arwin&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# for TLS.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0LDFLAGS +=3D [&#39;-Wl,-bind_at_load&#39;]<b=
r>
&gt; &gt; -<br>
&gt; &gt; --if CONFIG[&#39;MOZ_LINKER&#39;] and CONFIG[&#39;TARGET_CPU&#39;=
] =3D=3D &#39;arm&#39;:<br>
&gt; &gt; -+if CONFIG[&#39;MOZ_LINKER&#39;] and str(CONFIG[&#39;TARGET_CPU&=
#39;]) =3D=3D &#39;arm&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0LDFLAGS +=3D [&#39;-Wl,-version-script,%s/ar=
m-eabi-filter&#39; % SRCDIR]<br>
&gt; &gt; -<br>
&gt; &gt; - DIST_INSTALL =3D True<br>
&gt; &gt; -diff --git a/python/mozbuild/mozbuild/action/check_binary.py b/p=
ython/mozbuild/mozbuild/action/check_binary.py<br>
&gt; &gt; -index 5665ef053..b696f73d6 100644<br>
&gt; &gt; ---- a/python/mozbuild/mozbuild/action/check_binary.py<br>
&gt; &gt; -+++ b/python/mozbuild/mozbuild/action/check_binary.py<br>
&gt; &gt; -@@ -104,6 +104,8 @@ def iter_readelf_symbols(target, binary):<br=
>
&gt; &gt; -<br>
&gt; &gt; - def iter_readelf_dynamic(target, binary):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for line in get_output(target[&#39;readelf&#=
39;], &#39;-d&#39;, binary):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(line, bytes):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=3Dline.decode(&#=
39;utf-8&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D line.split(None, 2)<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if data and len(data) =3D=3D 3=
 and data[0].startswith(&#39;0x&#39;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield data[1].rs=
trip(&#39;)&#39;).lstrip(&#39;(&#39;), data[2]<br>
&gt; &gt; -diff --git a/python/mozbuild/mozbuild/action/process_define_file=
s.py b/python/mozbuild/mozbuild/action/process_define_files.py<br>
&gt; &gt; -index 563fbb8fa..c3df2869b 100644<br>
&gt; &gt; ---- a/python/mozbuild/mozbuild/action/process_define_files.py<br=
>
&gt; &gt; -+++ b/python/mozbuild/mozbuild/action/process_define_files.py<br=
>
&gt; &gt; -@@ -2,7 +2,7 @@<br>
&gt; &gt; - # License, v. 2.0. If a copy of the MPL was not distributed wit=
h this<br>
&gt; &gt; - # file, You can obtain one at <a href=3D"http://mozilla.org/MPL=
/2.0/" rel=3D"noreferrer" target=3D"_blank">http://mozilla.org/MPL/2.0/</a>=
.<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import absolute_import, print_function, unicode=
_literals<br>
&gt; &gt; -+<br>
&gt; &gt; -<br>
&gt; &gt; - import argparse<br>
&gt; &gt; - import os<br>
&gt; &gt; -@@ -53,7 +53,7 @@ def process_define_file(output, input):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;CONFIGURE_DEFIN=
E_FILE&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0defines =3D &#39;\n&#39;.join(sorted(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;#define %s %s&#39; % (name, v=
al)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name, val in config.defines[&#39;ALL=
DEFINES&#39;].iteritems()))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name, val in config.defines[&#39;ALL=
DEFINES&#39;].items()))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D l[:m.start(&#39;cmd&#39;) - 1] \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ defines + l[m.end(&#39;name&#39;=
):]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0elif cmd =3D=3D &#39;define&#39;:<br>
&gt; &gt; -diff --git a/python/mozbuild/mozbuild/backend/base.py b/python/m=
ozbuild/mozbuild/backend/base.py<br>
&gt; &gt; -index a8d5c94e0..7cda63475 100644<br>
&gt; &gt; ---- a/python/mozbuild/mozbuild/backend/base.py<br>
&gt; &gt; -+++ b/python/mozbuild/mozbuild/backend/base.py<br>
&gt; &gt; -@@ -2,7 +2,7 @@<br>
&gt; &gt; - # License, v. 2.0. If a copy of the MPL was not distributed wit=
h this<br>
&gt; &gt; - # file, You can obtain one at <a href=3D"http://mozilla.org/MPL=
/2.0/" rel=3D"noreferrer" target=3D"_blank">http://mozilla.org/MPL/2.0/</a>=
.<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import absolute_import, unicode_literals<br>
&gt; &gt; -+<br>
&gt; &gt; -<br>
&gt; &gt; - from abc import (<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ABCMeta,<br>
&gt; &gt; -@@ -31,7 +31,7 @@ from .configenvironment import ConfigEnvironme=
nt<br>
&gt; &gt; - from mozbuild.base import ExecutionSummary<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; --class BuildBackend(LoggingMixin):<br>
&gt; &gt; -+class BuildBackend(LoggingMixin, metaclass=3DABCMeta):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Abstract base class for bu=
ild backends.<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0A build backend is merely a consumer of the =
build configuration (the output<br>
&gt; &gt; -@@ -39,8 +39,6 @@ class BuildBackend(LoggingMixin):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0is the discretion of the specific implementa=
tion.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 __metaclass__ =3D ABCMeta<br>
&gt; &gt; --<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def __init__(self, environment):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert isinstance(environment,=
 (ConfigEnvironment, EmptyConfig))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.populate_logger()<br>
&gt; &gt; -@@ -311,7 +309,7 @@ class BuildBackend(LoggingMixin):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcdir =3D mozpath.dirname(obj=
.input_path)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pp.context.update({<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k: &#39; &#39;.j=
oin(v) if isinstance(v, list) else v<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in obj.confi=
g.substs.iteritems()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in obj.confi=
g.substs.items()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pp.context.update(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0top_srcdir=3Dobj=
.topsrcdir,<br>
&gt; &gt; -diff --git a/python/mozbuild/mozbuild/backend/common.py b/python=
/mozbuild/mozbuild/backend/common.py<br>
&gt; &gt; -index d00cbbcaf..f747df446 100644<br>
&gt; &gt; ---- a/python/mozbuild/mozbuild/backend/common.py<br>
&gt; &gt; -+++ b/python/mozbuild/mozbuild/backend/common.py<br>
&gt; &gt; -@@ -2,7 +2,7 @@<br>
&gt; &gt; - # License, v. 2.0. If a copy of the MPL was not distributed wit=
h this<br>
&gt; &gt; - # file, You can obtain one at <a href=3D"http://mozilla.org/MPL=
/2.0/" rel=3D"noreferrer" target=3D"_blank">http://mozilla.org/MPL/2.0/</a>=
.<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import absolute_import, unicode_literals<br>
&gt; &gt; -+<br>
&gt; &gt; -<br>
&gt; &gt; - import json<br>
&gt; &gt; - import os<br>
&gt; &gt; -@@ -174,7 +174,7 @@ class CommonBackend(BuildBackend):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(self._idl_manager.idls)=
:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._write_rust=
_xpidl_summary(self._idl_manager)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._handle_idl=
_manager(self._idl_manager)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._handle_generate=
d_sources(mozpath.join(self.environment.topobjdir, &#39;dist/include/%s.h&#=
39; % idl[&#39;root&#39;]) for idl in self._idl_manager.idls.values())<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._handle_generate=
d_sources(mozpath.join(self.environment.topobjdir, &#39;dist/include/%s.h&#=
39; % idl[&#39;root&#39;]) for idl in list(self._idl_manager.idls.values())=
)<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for config in self._configs:<b=
r>
&gt; &gt; -@@ -372,14 +372,14 @@ class CommonBackend(BuildBackend):<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self._write_file(mozpath.=
join(topobjdir, &#39;dist&#39;, &#39;xpcrs&#39;, &#39;rt&#39;, &#39;<a href=
=3D"http://all.rs" rel=3D"noreferrer" target=3D"_blank">all.rs</a>&#39;)) a=
s fh:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh.write(&quot;/=
/ THIS FILE IS GENERATED - DO NOT EDIT\n\n&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for idl in manager.id=
ls.values():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for idl in list(manag=
er.idls.values()):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh=
.write(include_tmpl % (&quot;rt&quot;, idl[&#39;root&#39;]))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh=
.write(&quot;;\n&quot;)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self._write_file(mozpath.=
join(topobjdir, &#39;dist&#39;, &#39;xpcrs&#39;, &#39;bt&#39;, &#39;<a href=
=3D"http://all.rs" rel=3D"noreferrer" target=3D"_blank">all.rs</a>&#39;)) a=
s fh:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh.write(&quot;/=
/ THIS FILE IS GENERATED - DO NOT EDIT\n\n&quot;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh.write(&quot;&=
amp;[\n&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for idl in manager.id=
ls.values():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for idl in list(manag=
er.idls.values()):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh=
.write(include_tmpl % (&quot;bt&quot;, idl[&#39;root&#39;]))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh=
.write(&quot;,\n&quot;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fh.write(&quot;]=
\n&quot;)<br>
&gt; &gt; -diff --git a/python/mozbuild/mozbuild/backend/configenvironment.=
py b/python/mozbuild/mozbuild/backend/configenvironment.py<br>
&gt; &gt; -index 3676a7d18..f0896cea4 100644<br>
&gt; &gt; ---- a/python/mozbuild/mozbuild/backend/configenvironment.py<br>
&gt; &gt; -+++ b/python/mozbuild/mozbuild/backend/configenvironment.py<br>
&gt; &gt; -@@ -2,14 +2,14 @@<br>
&gt; &gt; - # License, v. 2.0. If a copy of the MPL was not distributed wit=
h this<br>
&gt; &gt; - # file, You can obtain one at <a href=3D"http://mozilla.org/MPL=
/2.0/" rel=3D"noreferrer" target=3D"_blank">http://mozilla.org/MPL/2.0/</a>=
.<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import absolute_import<br>
&gt; &gt; -+<br>
&gt; &gt; -<br>
&gt; &gt; - import os<br>
&gt; &gt; - import sys<br>
&gt; &gt; - import json<br>
&gt; &gt; -<br>
&gt; &gt; - from collections import Iterable, OrderedDict<br>
&gt; &gt; --from types import StringTypes, ModuleType<br>
&gt; &gt; -+from types import ModuleType<br>
&gt; &gt; -<br>
&gt; &gt; - import mozpack.path as mozpath<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -22,7 +22,7 @@ from mozbuild.shellutil import quote as shell_=
quote<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; - if sys.version_info.major =3D=3D 2:<br>
&gt; &gt; --=C2=A0 =C2=A0 text_type =3D unicode<br>
&gt; &gt; -+=C2=A0 =C2=A0 text_type =3D str<br>
&gt; &gt; - else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0text_type =3D str<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -151,7 +151,7 @@ class ConfigEnvironment(object):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shell_quote(self=
.defines[name]).replace(&#39;$&#39;, &#39;$$&#39;))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for name in sort=
ed(global_defines)])<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def serialize(name, obj):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(obj, St=
ringTypes):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(obj, st=
r):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn obj<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(ob=
j, Iterable):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn &#39; &#39;.join(obj)<br>
&gt; &gt; -@@ -185,8 +185,8 @@ class ConfigEnvironment(object):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ex=
cept UnicodeDecodeError:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return v.decode(&#39;utf-8&#39;, &#39;replace&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in self.substs.items():<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(v, =
StringTypes):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in list(self.substs.items(=
)):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(v, =
str):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 isinstance(v, Iterable):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0type(v)(decode(i) for i in v)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif not isinsta=
nce(v, text_type):<br>
&gt; &gt; -@@ -255,7 +255,7 @@ class PartialConfigDict(object):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0existing_files =3D self._load_=
config_track()<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_files =3D set()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in values.iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in values.items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_files.add(se=
lf._write_file(k, v))<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for filename in existing_files=
 - new_files:<br>
&gt; &gt; -diff --git a/python/mozbuild/mozbuild/backend/fastermake.py b/py=
thon/mozbuild/mozbuild/backend/fastermake.py<br>
&gt; &gt; -index b029aa10f..b66ade64f 100644<br>
&gt; &gt; ---- a/python/mozbuild/mozbuild/backend/fastermake.py<br>
&gt; &gt; -+++ b/python/mozbuild/mozbuild/backend/fastermake.py<br>
&gt; &gt; -@@ -2,7 +2,7 @@<br>
&gt; &gt; - # License, v. 2.0. If a copy of the MPL was not distributed wit=
h this<br>
&gt; &gt; - # file, You can obtain one at <a href=3D"http://mozilla.org/MPL=
/2.0/" rel=3D"noreferrer" target=3D"_blank">http://mozilla.org/MPL/2.0/</a>=
.<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import absolute_import, unicode_literals, print=
_function<br>
&gt; &gt; -+<br>
&gt; &gt; -<br>
&gt; &gt; - from mozbuild.backend.base import PartialBackend<br>
&gt; &gt; - from mozbuild.backend.common import CommonBackend<br>
&gt; &gt; -@@ -140,7 +140,7 @@ class FasterMakeBackend(CommonBackend, Parti=
alBackend):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Add information for chrome m=
anifest generation<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest_targets =3D []<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for target, entries in self._manife=
st_entries.iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for target, entries in self._manife=
st_entries.items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest_targets=
.append(target)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_target =
=3D mozpath.basedir(target, install_manifests_bases)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._install_ma=
nifests[install_target].add_content(<br>
&gt; &gt; -@@ -152,13 +152,13 @@ class FasterMakeBackend(CommonBackend, Par=
tialBackend):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 % &#39; &#39;.join(self._install_manifests.keys=
()))<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Add dependencies we infered:=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for target, deps in self._dependenc=
ies.iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for target, deps in self._dependenc=
ies.items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mk.create_rule([=
target]).add_dependencies(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;$(TOPOBJDIR)/%s&#39; % d for d in deps)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mk.add_statement(&#39;include =
$(TOPSRCDIR)/config/faster/<a href=3D"http://rules.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules.mk</a>&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for base, install_manifest in self.=
_install_manifests.iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for base, install_manifest in self.=
_install_manifests.items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self._write=
_file(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mozpath.join(self.environment.topobjdir, &#39;faster&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;install_%s&#39=
; % base.replace(&#39;/&#39;, &#39;_&#39;))) as fh:<br>
&gt; &gt; -@@ -167,7 +167,7 @@ class FasterMakeBackend(CommonBackend, Parti=
alBackend):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# For artifact builds only, wr=
ite a single unified manifest for consumption by |mach watch|.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.environment.is_artifac=
t_build:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unified_manifest=
 =3D InstallManifest()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for base, install_man=
ifest in self._install_manifests.iteritems():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for base, install_man=
ifest in self._install_manifests.items():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# =
Expect &#39;dist/bin/**&#39;, which includes &#39;dist/bin&#39; with no tra=
iling slash.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as=
sert base.startswith(&#39;dist/bin&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ba=
se =3D base[len(&#39;dist/bin&#39;):]<br>
&gt; &gt; -diff --git a/python/mozbuild/mozbuild/backend/recursivemake.py b=
/python/mozbuild/mozbuild/backend/recursivemake.py<br>
&gt; &gt; -index dd9020d62..aa89cc297 100644<br>
&gt; &gt; ---- a/python/mozbuild/mozbuild/backend/recursivemake.py<br>
&gt; &gt; -+++ b/python/mozbuild/mozbuild/backend/recursivemake.py<br>
&gt; &gt; -@@ -2,7 +2,7 @@<br>
&gt; &gt; - # License, v. 2.0. If a copy of the MPL was not distributed wit=
h this<br>
&gt; &gt; - # file, You can obtain one at <a href=3D"http://mozilla.org/MPL=
/2.0/" rel=3D"noreferrer" target=3D"_blank">http://mozilla.org/MPL/2.0/</a>=
.<br>
&gt; &gt; -<br>
&gt; &gt; --from __future__ import absolute_import, unicode_literals<br>
&gt; &gt; -+<br>
&gt; &gt; -<br>
&gt; &gt; - import logging<br>
&gt; &gt; - import os<br>
&gt; &gt; -@@ -12,7 +12,7 @@ from collections import (<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0defaultdict,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0namedtuple,<br>
&gt; &gt; - )<br>
&gt; &gt; --from StringIO import StringIO<br>
&gt; &gt; -+from io import StringIO<br>
&gt; &gt; - from itertools import chain<br>
&gt; &gt; -<br>
&gt; &gt; - from mozpack.manifests import (<br>
&gt; &gt; -@@ -80,75 +80,76 @@ from ..util import (<br>
&gt; &gt; - )<br>
&gt; &gt; - from ..makeutil import Makefile<br>
&gt; &gt; - from mozbuild.shellutil import quote as shell_quote<br>
&gt; &gt; -+from functools import reduce<br>
&gt; &gt; -<br>
&gt; &gt; - MOZBUILD_VARIABLES =3D [<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;ASFLAGS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;CMSRCS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;CMMSRCS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;CPP_UNIT_TESTS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;DIRS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;DIST_INSTALL&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;EXTRA_DSO_LDOPTS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;EXTRA_JS_MODULES&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;EXTRA_PP_COMPONENTS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;EXTRA_PP_JS_MODULES&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;FORCE_SHARED_LIB&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;FORCE_STATIC_LIB&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;FINAL_LIBRARY&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;HOST_CFLAGS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;HOST_CSRCS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;HOST_CMMSRCS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;HOST_CXXFLAGS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;HOST_EXTRA_LIBS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;HOST_LIBRARY_NAME&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;HOST_PROGRAM&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;HOST_SIMPLE_PROGRAMS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;JAR_MANIFEST&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;JAVA_JAR_TARGETS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;LIBRARY_NAME&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;LIBS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;MAKE_FRAMEWORK&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;MODULE&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;NO_DIST_INSTALL&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;NO_EXPAND_LIBS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;NO_INTERFACES_MANIFEST&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;NO_JS_MANIFEST&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;OS_LIBS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;PARALLEL_DIRS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;PREF_JS_EXPORTS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;PROGRAM&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;RESOURCE_FILES&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;SHARED_LIBRARY_LIBS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;SHARED_LIBRARY_NAME&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;SIMPLE_PROGRAMS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;SONAME&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;STATIC_LIBRARY_NAME&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;TEST_DIRS&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 b&#39;TOOL_DIRS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;ASFLAGS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;CMSRCS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;CMMSRCS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;CPP_UNIT_TESTS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;DIRS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;DIST_INSTALL&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;EXTRA_DSO_LDOPTS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;EXTRA_JS_MODULES&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;EXTRA_PP_COMPONENTS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;EXTRA_PP_JS_MODULES&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;FORCE_SHARED_LIB&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;FORCE_STATIC_LIB&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;FINAL_LIBRARY&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;HOST_CFLAGS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;HOST_CSRCS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;HOST_CMMSRCS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;HOST_CXXFLAGS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;HOST_EXTRA_LIBS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;HOST_LIBRARY_NAME&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;HOST_PROGRAM&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;HOST_SIMPLE_PROGRAMS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;JAR_MANIFEST&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;JAVA_JAR_TARGETS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;LIBRARY_NAME&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;LIBS&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;MAKE_FRAMEWORK&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;MODULE&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &#39;NO_DI</blockquote></div>
</blockquote></div></div>

--00000000000042484805cf332a1a--

