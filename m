Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AD4CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:35:31 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.29307.1697726130513040541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 07:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ir9V3TOl;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7dd65052aso108107757b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 07:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697726129; x=1698330929; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LrFuLbb66j3oA49YgJVDQSWVk1JZ6YCJTCJU4XyyuTY=;
        b=ir9V3TOlHec8QMx7A5X+je0TkkorKsJOgIwqguehYgA6nDvJV46XdaV/dtH0baqMXG
         qsNQ+BSykOJ6xovlpRFDOTWLNtdoOiWOUlP7NF9dIuGyrnaSvdVdAbB3IZzgjMqfIqul
         PdGlFMHWEduvERxR77jtLJEk41OhpfUUiuE7tzQ5zvLghIDzNkdU7NvUmg4tvuBEZRjK
         sdA3AZJl9tBqUdjUXXZ8Abj65YoM7F2F9f0M6C72e2czEh0RO5sBWfpoGFUgHu1fKX/H
         UGyxR4S1VrLzOZJa1EjnPlNHY8+sQTm90bC7tEn41RyDdIBc+9mLegszQ9KLx9aMpsok
         L+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697726129; x=1698330929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrFuLbb66j3oA49YgJVDQSWVk1JZ6YCJTCJU4XyyuTY=;
        b=tPe7AjpPa2JO1cm98Ek7uxbOYSgADnuYjmdm0mS1a+y5iDFsnz35seV11/vYAy9XZN
         0ElKmtHNGEeLfws92VOx5kC0sJK6a1tyOHSpeJEfaBze3b/AZ98wgRCqlKHZegKapzHY
         1tjWnlmHvmB1GY60hOVdWGU5jGlX5F3jpTGn9ahk/2rCoUZTzZ5FofAVtaaKunEskFNU
         aUABQ7MfyKeR9Nwi7Dy/0NR/+ejQTyhkJSZlVgiuTHhndgQde9xSZyM6maZHd7nAHeiZ
         Kij7nBRU9AhhMLaCJqWpfLuedHpQkAGlok8p1e4dIirPYjHG1XAAE4dv3qYNhjvbLzfo
         XUNg==
X-Gm-Message-State: AOJu0YyHqVLisVCod1rOMYsuUW0f/MIcCkP34N+xvmaPGCTSmg+CKmOz
	SPFowztY1UyrEq1gBnZuJxit4UG5v24BO3Xkm58=
X-Google-Smtp-Source: AGHT+IFLoVWKslVfXFH5nsd5N7hbZbDmSM9Cr8XaAHzKQrOWtMO3VJ2yTTxvmKp+cfrVAtCEzK83SML+7sBLrMUTNhI=
X-Received: by 2002:a0d:e746:0:b0:59d:d85e:795d with SMTP id
 q67-20020a0de746000000b0059dd85e795dmr2286252ywe.51.1697726129548; Thu, 19
 Oct 2023 07:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230928091304.4000026-1-archana.polampalli@windriver.com>
 <178A59668B8F4A5C.9230@lists.openembedded.org> <CA+chaQfec515o-qNEYWWhsnAxcwDy2fKeo9ShM1up61HaNMW_w@mail.gmail.com>
 <CANx9H-AzDAv-wnyBKGTpFu_+d6HXhp0pv2muABWhNf+GqUNxqQ@mail.gmail.com> <CAMKF1spqLUOCkywXgq9CsQZ3WZsoVniM-Q2p3LfToXtO83EjNQ@mail.gmail.com>
In-Reply-To: <CAMKF1spqLUOCkywXgq9CsQZ3WZsoVniM-Q2p3LfToXtO83EjNQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 19 Oct 2023 07:35:18 -0700
Message-ID: <CANx9H-CTYbyNLXOd+krzzsrae=u8LVsirySd8rv-1khDefUc9g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, archana.polampalli@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e0b0d3060812aa84"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 14:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105602

--000000000000e0b0d3060812aa84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 8:40=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Wed, Oct 18, 2023 at 4:19=E2=80=AFPM Tim Orling <ticotimo@gmail.com> w=
rote:
> >
> >
> >
> > On Wed, Oct 18, 2023 at 1:41=E2=80=AFPM Martin Jansa <martin.jansa@gmai=
l.com>
> wrote:
> >>
> >> I've narrowed this down to simple reproducer with webpack creating pac=
k
> with "hello world" as shown in:
> >> https://github.com/shr-project/com.webos.app.minimal/tree/recipes
> >>
> >> Then with this reproducer I've bisected it to nodejs-20.3.0 with libuv
> upgrade 1.45.0 which brings support for io_uring which doesn't work with
> pseudo in:
> >>
> https://github.com/libuv/libuv/pull/3952/commits/26c79a942b92573a1388c0ee=
8a6ad4397f009318
> >>
> >> Now we have 3 options:
> >>
> >> 1) either every use of nodejs-native where io_uring might be used (lik=
e
> in webpack) needs to export UV_USE_IO_URING=3D0 before using node, but be
> aware that the PR says it's only temporary and this variable might be
> removed in future. Unfortunately many people are lucky enough not to know
> what pseudo even is, so they might not realize that host-user-contaminati=
on
> QA issues or "KeyError: 'getpwuid(): uid not found" might be related to
> this (and they probably won't find this e-mail as well).
> >>
> >> 2) revert the io_uring changes from bundled libuv, I've already
> verified this with nodejs-20.3.0, for 20.8.1 it would need couple more
> commits to be reverted as 20.8.1 uses even newer libuv-1.46.0. The change=
s
> are massive and it will be PIA to update them for every nodejs release,
> patch for keeping UV_USE_IO_URING support after it's removed from upstrea=
m
> libuv will be much smaller, but PIA to use UV_USE_IO_URING whenever using
> nodejs-native during build.
> >>
> >> 3) fix pseudo to correctly work with io_uring calls, definitely best
> long-term solution as more and more tools will now switch to io_uring, bu=
t
> without active maintainer of pseudo it might be _very_ difficult to
> implement this and there aren't many people willing to touch this beast.
> >>
> >> Any opinions?
> >>
> >
> > I would advise we not be overly aggressive about updates for important
> tools like NodeJS and Django.
> >
> > I don't think many consumers are building products on the latest
> greatest NodeJS release (which this isn't, latest is 21), many may not ev=
en
> be on the latest LTS (18 vs.16). While we can have a floating "latest"
> recipe, we should keep an LTS recipe.
> > We tried to do this for Django in meta-python, but later commits wiped
> out the comments and the upstream check.
> >
> https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes=
-devtools/python?id=3D961755a7bd17f7347f7dd0f2de3d2400a9c36f09
> >
>
> 20.x is next LTS and we already branched nanbield with 18.x, for
> master and upcoming yocto LTS release in April 2024, I would like to
> see up move to 20.x and figure out
> problems during this time early enough so we can stick to 20.x for
> yocto LTS. Unless we run into blocker issues.
>
>
For anyone else trying to catch up, in the "Active LTS Start" column you
can see when a given release will become an LTS:
https://github.com/nodejs/Release

It is also in the release announcement for 21:
https://nodejs.org/en/blog/announcements/v21-release-announce
"Node.js 21 will replace Node.js 20 as our =E2=80=98Current=E2=80=99 releas=
e line when
Node.js 20 enters long-term support (LTS) later this month. As per the
release schedule, Node.js 21 will be =E2=80=98Current' release for the next=
 6
months, until April 2024"

Unfortunately, the nodejs landing page doesn't have any indication.
https://nodejs.org/en

>
> >> On Mon, Oct 2, 2023 at 7:08=E2=80=AFPM Martin Jansa via lists.openembe=
dded.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >>>
> >>> On Thu, Sep 28, 2023 at 11:13=E2=80=AFAM Polampalli, Archana via
> lists.openembedded.org <archana.polampalli=3D
> windriver.com@lists.openembedded.org> wrote:
> >>>>
> >>>> Update to latest release of latest LTS 20 release
> >>>>
> >>>>     * node v20 introduces several new features and fixes many bugs
> and CVEs as shown in [1]
> >>>>
> >>>>     * Refresh 0001-liftoff-Correct-function-signatures.patch against
> 20.5.1
> >>>>
> >>>>     * License-Update:
> >>>>        - Change zlib version 1.2.13, October 13th, 2022 to version
> 1.2.13.1, October xxth, 2022 [2]
> >>>>        - Change Copyright 2023 from Ada authors to Yagiz Nizipli and
> Daniel Lemire [4]
> >>>>
> >>>>     * Remove big-endian.patch as it is merged in v20.x [5] [6]
> >>>>
> >>>>     * Remove below list of patches since mips32 is deleted from v8 a=
s
> part of update V8 to 10.7.193.13 [7] [8]
> >>>>        - mips-less-memory.patch
> >>>>        - 0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
> >>>>
> >>>>     * Update Using-native-binaries.patch for node_js2c, it resolved
> below do_compile error [9]
> >>>>        Error:
> >>>>        /bin/sh: line 1:
> build/tmp/work/core2-64-poky-linux/nodejs/20.5.1/node-v20.5.1/out/Release=
/node_js2c:
> No such file or directory
> >>>>
> >>>>     * Remove obsolete dtrace & etw configure options (we had:
> --without-<feature>) from the recipe [10]
> >>>
> >>>
> >>> FYI: (in case someone else are seeing similar issues now)
> >>>
> >>> With this upgrade I'm seeing some files created during the build with
> node not to be intercepted by pseudo and recorded in its database.
> >>>
> >>> This results in sstate_report_unihash failure, because appinfo.json i=
s
> now owned by 1026:1026 (my build UID/GID) instead of 0:0 as before:
> >>>
> >>> DEBUG: Executing python function sstate_report_unihash
> >>> WARNING: KeyError in ./package/usr/palm/applications/com.webos.app
> .videoplayer/appinfo.json
> >>> ERROR: Error executing a python function in exec_func_python()
> autogenerated:
> >>>
> >>> The stack trace of python calls that resulted in this
> exception/failure was:
> >>> File: 'exec_func_python() autogenerated', lineno: 2, function: <modul=
e>
> >>>      0001:
> >>>  *** 0002:sstate_report_unihash(d)
> >>>      0003:
> >>> File:
> '/OE/build/luneos-nanbield/openembedded-core/meta/classes-global/sstate.b=
bclass',
> lineno: 880, function: sstate_report_unihash
> >>>      0876:    report_unihash =3D getattr(bb.parse.siggen,
> 'report_unihash', None)
> >>>      0877:
> >>>      0878:    if report_unihash:
> >>>      0879:        ss =3D sstate_state_fromvars(d)
> >>>  *** 0880:        report_unihash(os.getcwd(), ss['task'], d)
> >>>      0881:}
> >>>      0882:
> >>>      0883:#
> >>>      0884:# Shell function to decompress and prepare a package for
> installation
> >>> File: '/OE/build/luneos-nanbield/bitbake/lib/bb/siggen.py', lineno:
> 659, function: report_unihash
> >>>      0655:
> >>>      0656:            if "." in self.method:
> >>>      0657:                (module, method) =3D self.method.rsplit('.'=
, 1)
> >>>      0658:                locs['method'] =3D
> getattr(importlib.import_module(module), method)
> >>>  *** 0659:                outhash =3D bb.utils.better_eval('method(pa=
th,
> sigfile, task, d)', locs)
> >>>      0660:            else:
> >>>      0661:                outhash =3D bb.utils.better_eval(self.metho=
d +
> '(path, sigfile, task, d)', locs)
> >>>      0662:
> >>>      0663:            try:
> >>> File: '/OE/build/luneos-nanbield/bitbake/lib/bb/utils.py', lineno:
> 434, function: better_eval
> >>>      0430:    if extraglobals:
> >>>      0431:        ctx =3D copy.copy(ctx)
> >>>      0432:        for g in extraglobals:
> >>>      0433:            ctx[g] =3D extraglobals[g]
> >>>  *** 0434:    return eval(source, ctx, locals)
> >>>      0435:
> >>>      0436:@contextmanager
> >>>      0437:def fileslocked(files, *args, **kwargs):
> >>>      0438:    """Context manager for locking and unlocking file
> locks."""
> >>> File: '<string>', lineno: 1, function: <module>
> >>>   File "<string>", line 1, in <module>
> >>>
> >>> File:
> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
> lineno: 649, function: OEOuthashBasic
> >>>      0645:                process(root)
> >>>      0646:            for f in files:
> >>>      0647:                if f =3D=3D 'fixmepath':
> >>>      0648:                    continue
> >>>  *** 0649:                process(os.path.join(root, f))
> >>>      0650:
> >>>      0651:            for dir in dirs:
> >>>      0652:                if os.path.islink(os.path.join(root, dir)):
> >>>      0653:                    process(os.path.join(root, dir))
> >>> File:
> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
> lineno: 588, function: process
> >>>      0584:                    except KeyError as e:
> >>>      0585:                        bb.warn("KeyError in %s" % path)
> >>>      0586:                        msg =3D ("KeyError: %s\nPath %s is
> owned by uid %d, gid %d, which doesn't match "
> >>>      0587:                            "any user/group on target. This
> may be due to host contamination." % (e, path, s.st_uid, s.st_gid))
> >>>  *** 0588:                        raise
> Exception(msg).with_traceback(e.__traceback__)
> >>>      0589:
> >>>      0590:                if include_timestamps:
> >>>      0591:                    update_hash(" %10d" % s.st_mtime)
> >>>      0592:
> >>> File:
> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
> lineno: 582, function: process
> >>>      0578:                    else:
> >>>      0579:                        add_perm(stat.S_IXOTH, 'x')
> >>>      0580:
> >>>      0581:                    try:
> >>>  *** 0582:                        update_hash(" %10s" %
> pwd.getpwuid(s.st_uid).pw_name)
> >>>      0583:                        update_hash(" %10s" %
> grp.getgrgid(s.st_gid).gr_name)
> >>>      0584:                    except KeyError as e:
> >>>      0585:                        bb.warn("KeyError in %s" % path)
> >>>      0586:                        msg =3D ("KeyError: %s\nPath %s is
> owned by uid %d, gid %d, which doesn't match "
> >>> Exception: Exception: KeyError: 'getpwuid(): uid not found: 1026'
> >>> Path ./package/usr/palm/applications/com.webos.app.videoplayer/appinf=
o.json
> is owned by uid 1026, gid 1026, which doesn't match any user/group on
> target. This may be due to host contamination.
> >>>
> >>> martin@jama
> /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/
> com.webos.app.videoplayer $ sqlite3
> 0.0.1-12+git-nodejs-20/pseudo/files.db "select * from files where path li=
ke
> '%yer/appinfo.json'"
> >>>
> 1107|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.w=
ebos.app.videoplayer/0.0.1-12+git/sstate-build-package/package/usr/palm/app=
lications/com.webos.app.videoplayer/appinfo.json|66305|41202418|1026|1026|3=
3188|0|0
> >>>
> 1192|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.w=
ebos.app.videoplayer/0.0.1-12+git/sstate-build-package/packages-split/
> com.webos.app.videoplayer/usr/palm/applications/com.webos.app
> .videoplayer/appinfo.json|66305|41
> >>> 202418|1026|1026|33188|0|0
> >>>
> >>> martin@jama
> /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/
> com.webos.app.videoplayer $ sqlite3
> 0.0.1-12+git-nodejs-18/pseudo/files.db "select * from files where path li=
ke
> '%yer/appinfo.json'"
> >>> 56|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/
> com.webos.app
> .videoplayer/0.0.1-12+git/image/usr/palm/applications/com.webos.app.video=
player/appinfo.json|66305|42878067|0|0|33188|0|0
> >>> 374|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/
> com.webos.app
> .videoplayer/0.0.1-12+git/package/usr/palm/applications/com.webos.app.vid=
eoplayer/appinfo.json|66305|42878641|0|0|33188|0|0
> >>> 459|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/
> com.webos.app.videoplayer/0.0.1-12+git/packages-split/com.webos.app
> .videoplayer/usr/palm/applications/com.webos.app
> .videoplayer/appinfo.json|66305|42878641|0|0|33188|0|0
> >>>
> >>> I'll provide more details when I debug this further.
> >>>
> >>> Regards,
> >>>
> >>>
> >>>
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105585):
> https://lists.openembedded.org/g/openembedded-devel/message/105585
> > Mute This Topic: https://lists.openembedded.org/mt/101098430/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000e0b0d3060812aa84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 18, 2023 at 8:40=E2=80=AF=
PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Wed, Oct 18, 2023 at 4:19=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Oct 18, 2023 at 1:41=E2=80=AFPM Martin Jansa &lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve narrowed this down to simple reproducer with webpack crea=
ting pack with &quot;hello world&quot; as shown in:<br>
&gt;&gt; <a href=3D"https://github.com/shr-project/com.webos.app.minimal/tr=
ee/recipes" rel=3D"noreferrer" target=3D"_blank">https://github.com/shr-pro=
ject/com.webos.app.minimal/tree/recipes</a><br>
&gt;&gt;<br>
&gt;&gt; Then with this reproducer I&#39;ve bisected it to nodejs-20.3.0 wi=
th libuv upgrade 1.45.0 which brings support for io_uring which doesn&#39;t=
 work with pseudo in:<br>
&gt;&gt; <a href=3D"https://github.com/libuv/libuv/pull/3952/commits/26c79a=
942b92573a1388c0ee8a6ad4397f009318" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/libuv/libuv/pull/3952/commits/26c79a942b92573a1388c0ee8a6a=
d4397f009318</a><br>
&gt;&gt;<br>
&gt;&gt; Now we have 3 options:<br>
&gt;&gt;<br>
&gt;&gt; 1) either every use of nodejs-native where io_uring might be used =
(like in webpack) needs to export UV_USE_IO_URING=3D0 before using node, bu=
t be aware that the PR says it&#39;s only temporary and this variable might=
 be removed in future. Unfortunately many people are lucky enough not to kn=
ow what pseudo even is, so they might not realize that host-user-contaminat=
ion QA issues or &quot;KeyError: &#39;getpwuid(): uid not found&quot; might=
 be related to this (and they probably won&#39;t find this e-mail as well).=
<br>
&gt;&gt;<br>
&gt;&gt; 2) revert the io_uring changes from bundled libuv, I&#39;ve alread=
y verified this with nodejs-20.3.0, for 20.8.1 it would need couple more co=
mmits to be reverted as 20.8.1 uses even newer libuv-1.46.0. The changes ar=
e massive and it will be PIA to update them for every nodejs release, patch=
 for keeping UV_USE_IO_URING support after it&#39;s removed from upstream l=
ibuv will be much smaller, but PIA to use UV_USE_IO_URING whenever using no=
dejs-native during build.<br>
&gt;&gt;<br>
&gt;&gt; 3) fix pseudo to correctly work with io_uring calls, definitely be=
st long-term solution as more and more tools will now switch to io_uring, b=
ut without active maintainer of pseudo it might be _very_ difficult to impl=
ement this and there aren&#39;t many people willing to touch this beast.<br=
>
&gt;&gt;<br>
&gt;&gt; Any opinions?<br>
&gt;&gt;<br>
&gt;<br>
&gt; I would advise we not be overly aggressive about updates for important=
 tools like NodeJS and Django.<br>
&gt;<br>
&gt; I don&#39;t think many consumers are building products on the latest g=
reatest NodeJS release (which this isn&#39;t, latest is 21), many may not e=
ven be on the latest LTS (18 vs.16). While we can have a floating &quot;lat=
est&quot; recipe, we should keep an LTS recipe.<br>
&gt; We tried to do this for Django in meta-python, but later commits wiped=
 out the comments and the upstream check.<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-=
python/recipes-devtools/python?id=3D961755a7bd17f7347f7dd0f2de3d2400a9c36f0=
9" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-o=
penembedded/commit/meta-python/recipes-devtools/python?id=3D961755a7bd17f73=
47f7dd0f2de3d2400a9c36f09</a><br>
&gt;<br>
<br>
20.x is next LTS and we already branched nanbield with 18.x, for<br>
master and upcoming yocto LTS release in April 2024, I would like to<br>
see up move to 20.x and figure out<br>
problems during this time early enough so we can stick to 20.x for<br>
yocto LTS. Unless we run into blocker issues.<br>
<br></blockquote><div><br></div><div>For anyone else trying to catch up, in=
 the &quot;Active LTS Start&quot; column you can see when a given release w=
ill become an LTS:</div><div><a href=3D"https://github.com/nodejs/Release">=
https://github.com/nodejs/Release</a><br></div><div>=C2=A0</div><div>It is =
also in the release announcement for 21:</div><div><a href=3D"https://nodej=
s.org/en/blog/announcements/v21-release-announce">https://nodejs.org/en/blo=
g/announcements/v21-release-announce</a><br></div><div>&quot;Node.js 21 wil=
l replace Node.js 20 as our =E2=80=98Current=E2=80=99 release line when Nod=
e.js 20 enters long-term support (LTS) later this month. As per the release=
 schedule, Node.js 21 will be =E2=80=98Current&#39; release for the next 6 =
months, until April 2024&quot;</div><div><br></div><div>Unfortunately, the =
nodejs landing page doesn&#39;t have any indication.=C2=A0<a href=3D"https:=
//nodejs.org/en">https://nodejs.org/en</a></div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt; On Mon, Oct 2, 2023 at 7:08=E2=80=AFPM Martin Jansa via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, Sep 28, 2023 at 11:13=E2=80=AFAM Polampalli, Archana v=
ia <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_=
blank">lists.openembedded.org</a> &lt;archana.polampalli=3D<a href=3D"mailt=
o:windriver.com@lists.openembedded.org" target=3D"_blank">windriver.com@lis=
ts.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Update to latest release of latest LTS 20 release<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* node v20 introduces several new featu=
res and fixes many bugs and CVEs as shown in [1]<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* Refresh 0001-liftoff-Correct-function=
-signatures.patch against 20.5.1<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* License-Update:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Change zlib version 1.2.13, O=
ctober 13th, 2022 to version 1.2.13.1, October xxth, 2022 [2]<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Change Copyright 2023 from Ad=
a authors to Yagiz Nizipli and Daniel Lemire [4]<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* Remove big-endian.patch as it is merg=
ed in v20.x [5] [6]<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* Remove below list of patches since mi=
ps32 is deleted from v8 as part of update V8 to 10.7.193.13 [7] [8]<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - mips-less-memory.patch<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - 0001-mips-Use-32bit-cast-for-=
operand-on-mips32.patch<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* Update Using-native-binaries.patch fo=
r node_js2c, it resolved below do_compile error [9]<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /bin/sh: line 1: build/tmp/work=
/core2-64-poky-linux/nodejs/20.5.1/node-v20.5.1/out/Release/node_js2c: No s=
uch file or directory<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* Remove obsolete dtrace &amp; etw conf=
igure options (we had: --without-&lt;feature&gt;) from the recipe [10]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; FYI: (in case someone else are seeing similar issues now)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; With this upgrade I&#39;m seeing some files created during the=
 build with node not to be intercepted by pseudo and recorded in its databa=
se.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This results in sstate_report_unihash failure, because appinfo=
.json is now owned by 1026:1026 (my build UID/GID) instead of 0:0 as before=
:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; DEBUG: Executing python function sstate_report_unihash<br>
&gt;&gt;&gt; WARNING: KeyError in ./package/usr/palm/applications/<a href=
=3D"http://com.webos.app" target=3D"_blank">com.webos.app</a>.videoplayer/a=
ppinfo.json<br>
&gt;&gt;&gt; ERROR: Error executing a python function in exec_func_python()=
 autogenerated:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The stack trace of python calls that resulted in this exceptio=
n/failure was:<br>
&gt;&gt;&gt; File: &#39;exec_func_python() autogenerated&#39;, lineno: 2, f=
unction: &lt;module&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0001:<br>
&gt;&gt;&gt;=C2=A0 *** 0002:sstate_report_unihash(d)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0003:<br>
&gt;&gt;&gt; File: &#39;/OE/build/luneos-nanbield/openembedded-core/meta/cl=
asses-global/sstate.bbclass&#39;, lineno: 880, function: sstate_report_unih=
ash<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0876:=C2=A0 =C2=A0 report_unihash =3D geta=
ttr(bb.parse.siggen, &#39;report_unihash&#39;, None)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0877:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0878:=C2=A0 =C2=A0 if report_unihash:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0879:=C2=A0 =C2=A0 =C2=A0 =C2=A0 ss =3D ss=
tate_state_fromvars(d)<br>
&gt;&gt;&gt;=C2=A0 *** 0880:=C2=A0 =C2=A0 =C2=A0 =C2=A0 report_unihash(os.g=
etcwd(), ss[&#39;task&#39;], d)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0881:}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0882:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0883:#<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0884:# Shell function to decompress and pr=
epare a package for installation<br>
&gt;&gt;&gt; File: &#39;/OE/build/luneos-nanbield/bitbake/lib/bb/siggen.py&=
#39;, lineno: 659, function: report_unihash<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0655:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0656:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if &quot;.&quot; in self.method:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0657:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (module, method) =3D self.method.rsplit(&#39;.&#39;, 1=
)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0658:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 locs[&#39;method&#39;] =3D getattr(importlib.import_mo=
dule(module), method)<br>
&gt;&gt;&gt;=C2=A0 *** 0659:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 outhash =3D bb.utils.better_eval(&#39;method(path, sigfile, task=
, d)&#39;, locs)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0660:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0661:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 outhash =3D bb.utils.better_eval(self.method + &#39;(p=
ath, sigfile, task, d)&#39;, locs)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0662:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0663:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 try:<br>
&gt;&gt;&gt; File: &#39;/OE/build/luneos-nanbield/bitbake/lib/bb/utils.py&#=
39;, lineno: 434, function: better_eval<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0430:=C2=A0 =C2=A0 if extraglobals:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0431:=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx =3D c=
opy.copy(ctx)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0432:=C2=A0 =C2=A0 =C2=A0 =C2=A0 for g in =
extraglobals:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0433:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ctx[g] =3D extraglobals[g]<br>
&gt;&gt;&gt;=C2=A0 *** 0434:=C2=A0 =C2=A0 return eval(source, ctx, locals)<=
br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0435:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0436:@contextmanager<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0437:def fileslocked(files, *args, **kwarg=
s):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0438:=C2=A0 =C2=A0 &quot;&quot;&quot;Conte=
xt manager for locking and unlocking file locks.&quot;&quot;&quot;<br>
&gt;&gt;&gt; File: &#39;&lt;string&gt;&#39;, lineno: 1, function: &lt;modul=
e&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;&lt;string&gt;&quot;, line 1, in &lt;mo=
dule&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; File: &#39;/OE/build/luneos-nanbield/openembedded-core/meta/li=
b/oe/sstatesig.py&#39;, lineno: 649, function: OEOuthashBasic<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0645:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 process(root)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0646:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for f in files:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0647:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if f =3D=3D &#39;fixmepath&#39;:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0648:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;&gt;&gt;=C2=A0 *** 0649:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 process(os.path.join(root, f))<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0650:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0651:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for dir in dirs:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0652:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if os.path.islink(os.path.join(root, dir)):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0653:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process(os.path.join(root, dir))<br>
&gt;&gt;&gt; File: &#39;/OE/build/luneos-nanbield/openembedded-core/meta/li=
b/oe/sstatesig.py&#39;, lineno: 588, function: process<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError as e:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;KeyError in =
%s&quot; % path)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D (&quot;KeyError: %=
s\nPath %s is owned by uid %d, gid %d, which doesn&#39;t match &quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0587:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;any us=
er/group on target. This may be due to host contamination.&quot; % (e, path=
, s.st_uid, s.st_gid))<br>
&gt;&gt;&gt;=C2=A0 *** 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(msg).with_traceback(=
e.__traceback__)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0589:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if include_timestamps:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0591:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_hash(&quot; %10d&quot; % s.st_mti=
me)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0592:<br>
&gt;&gt;&gt; File: &#39;/OE/build/luneos-nanbield/openembedded-core/meta/li=
b/oe/sstatesig.py&#39;, lineno: 582, function: process<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0578:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0579:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_perm(stat.S_IXOTH, &#3=
9;x&#39;)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0580:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0581:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt;&gt;=C2=A0 *** 0582:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_hash(&quot; %10s&quot; % pwd.=
getpwuid(s.st_uid).pw_name)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0583:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_hash(&quot; %10s&qu=
ot; % grp.getgrgid(s.st_gid).gr_name)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError as e:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;KeyError in =
%s&quot; % path)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D (&quot;KeyError: %=
s\nPath %s is owned by uid %d, gid %d, which doesn&#39;t match &quot;<br>
&gt;&gt;&gt; Exception: Exception: KeyError: &#39;getpwuid(): uid not found=
: 1026&#39;<br>
&gt;&gt;&gt; Path ./package/usr/palm/applications/<a href=3D"http://com.web=
os.app" target=3D"_blank">com.webos.app</a>.videoplayer/appinfo.json is own=
ed by uid 1026, gid 1026, which doesn&#39;t match any user/group on target.=
 This may be due to host contamination.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; martin@jama /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64=
-webos-linux/<a href=3D"http://com.webos.app" target=3D"_blank">com.webos.a=
pp</a>.videoplayer $ sqlite3 0.0.1-12+git-nodejs-20/pseudo/files.db &quot;s=
elect * from files where path like &#39;%yer/appinfo.json&#39;&quot;<br>
&gt;&gt;&gt; 1107|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-=
linux/com.webos.app.videoplayer/0.0.1-12+git/sstate-build-package/package/u=
sr/palm/applications/com.webos.app.videoplayer/appinfo.json|66305|41202418|=
1026|1026|33188|0|0<br>
&gt;&gt;&gt; 1192|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-=
linux/com.webos.app.videoplayer/0.0.1-12+git/sstate-build-package/packages-=
split/<a href=3D"http://com.webos.app" target=3D"_blank">com.webos.app</a>.=
videoplayer/usr/palm/applications/<a href=3D"http://com.webos.app" target=
=3D"_blank">com.webos.app</a>.videoplayer/appinfo.json|66305|41<br>
&gt;&gt;&gt; 202418|1026|1026|33188|0|0<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; martin@jama /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64=
-webos-linux/<a href=3D"http://com.webos.app" target=3D"_blank">com.webos.a=
pp</a>.videoplayer $ sqlite3 0.0.1-12+git-nodejs-18/pseudo/files.db &quot;s=
elect * from files where path like &#39;%yer/appinfo.json&#39;&quot;<br>
&gt;&gt;&gt; 56|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-li=
nux/<a href=3D"http://com.webos.app" target=3D"_blank">com.webos.app</a>.vi=
deoplayer/0.0.1-12+git/image/usr/palm/applications/com.webos.app.videoplaye=
r/appinfo.json|66305|42878067|0|0|33188|0|0<br>
&gt;&gt;&gt; 374|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-l=
inux/<a href=3D"http://com.webos.app" target=3D"_blank">com.webos.app</a>.v=
ideoplayer/0.0.1-12+git/package/usr/palm/applications/com.webos.app.videopl=
ayer/appinfo.json|66305|42878641|0|0|33188|0|0<br>
&gt;&gt;&gt; 459|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-l=
inux/<a href=3D"http://com.webos.app" target=3D"_blank">com.webos.app</a>.v=
ideoplayer/0.0.1-12+git/packages-split/<a href=3D"http://com.webos.app" tar=
get=3D"_blank">com.webos.app</a>.videoplayer/usr/palm/applications/<a href=
=3D"http://com.webos.app" target=3D"_blank">com.webos.app</a>.videoplayer/a=
ppinfo.json|66305|42878641|0|0|33188|0|0<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ll provide more details when I debug this further.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105585): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105585" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/105585</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10109843=
0/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101098430/1997914</a><br>
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

--000000000000e0b0d3060812aa84--

