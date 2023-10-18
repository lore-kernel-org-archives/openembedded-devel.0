Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38878CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 23:19:16 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.15628.1697671152456642151
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 16:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOdO0AVI;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7c011e113so99219007b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 16:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697671151; x=1698275951; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aOAc0B/LdHM36JefMpZ/1MtwG7wVhjClMKdACK5i5/c=;
        b=AOdO0AVIqe/JQ6t42RudY0+ZFlVFHMcUQrnexC65jR6jx1SL/lst03/UGHRUU4JAct
         fgfdg2BjyESMfh3XsYDHeHzNj5ZjCCnnh6ePWD1w865Ukzusmq5oeuEbdeNCV9cyXJ/e
         p2OsBvpMw7g7RGV3l2/hfycnChcCP0/cWk4dzyjx+l3+WGPz9d+HUcCYjSiAU23cf6hN
         kmXvOXwIlmgwV3OQJiYtgTIad+QZUZa62wZTmxNnZb1ERF24y1cA3Qhv88mlKpsENa6q
         5Bx4UcYBwJyASgVKjB96HoHalEflIGfyTmHQnFUuSYyyLYAa6AM1IN8KcSC5dBTdQjx3
         Dwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697671151; x=1698275951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOAc0B/LdHM36JefMpZ/1MtwG7wVhjClMKdACK5i5/c=;
        b=UZ0mmd8ftLro4Vdo79gQwmJaK5UV8kUiSnimBT1cW365AxlaS6leMyWEwAlYV1oJAb
         IzqbXIeJgjJza55TlTdz2+3JffN/w9RMYlDMe9BGyuTNihfTu0HYqECJViYVUD8IgVyy
         2JX8yxaRq93oDllXVed5lhcoNQ/OtYjJa2VxUCjjKKi69YcWONWr8FCVN3bCwlOZnZuX
         kUI06kEuCgte4TCAPzNC77134PBGgCNc3VoBTIF9GthWUXxONMwKPbFfkT3OjHOeNDn5
         hzlmDXeATsM1Su+o2etEHVsMITYyk7m0bvP3dXaWMDb2bvbrt5/Izpq+P4z28h4OvCji
         zvKA==
X-Gm-Message-State: AOJu0YwWbfsLQ7nFal0Tzxgyb78BAucW7SNtgW5FVYXAl3aZ4wS6nd0o
	RNQhy9UcTlC2rDUt43rmxM2rlXp6fLoYxy/xQfQ=
X-Google-Smtp-Source: AGHT+IHIvytUTJyn3esMw9F7BX7XK22cX7o4OFZjpz68Nmu8n4H1k3mXZGld+FB1gpv8tB2ctBYdKHCeAtiTMuk+tPc=
X-Received: by 2002:a81:5d57:0:b0:5a7:b481:4dd2 with SMTP id
 r84-20020a815d57000000b005a7b4814dd2mr711064ywb.47.1697671151518; Wed, 18 Oct
 2023 16:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230928091304.4000026-1-archana.polampalli@windriver.com>
 <178A59668B8F4A5C.9230@lists.openembedded.org> <CA+chaQfec515o-qNEYWWhsnAxcwDy2fKeo9ShM1up61HaNMW_w@mail.gmail.com>
In-Reply-To: <CA+chaQfec515o-qNEYWWhsnAxcwDy2fKeo9ShM1up61HaNMW_w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 18 Oct 2023 16:19:00 -0700
Message-ID: <CANx9H-AzDAv-wnyBKGTpFu_+d6HXhp0pv2muABWhNf+GqUNxqQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: archana.polampalli@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ee87eb060805dd10"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 23:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105585

--000000000000ee87eb060805dd10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 1:41=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> I've narrowed this down to simple reproducer with webpack creating pack
> with "hello world" as shown in:
> https://github.com/shr-project/com.webos.app.minimal/tree/recipes
>
> Then with this reproducer I've bisected it to nodejs-20.3.0 with libuv
> upgrade 1.45.0 which brings support for io_uring which doesn't work with
> pseudo in:
>
> https://github.com/libuv/libuv/pull/3952/commits/26c79a942b92573a1388c0ee=
8a6ad4397f009318
>
> Now we have 3 options:
>
> 1) either every use of nodejs-native where io_uring might be used (like i=
n
> webpack) needs to export UV_USE_IO_URING=3D0 before using node, but be aw=
are
> that the PR says it's only temporary and this variable might be removed i=
n
> future. Unfortunately many people are lucky enough not to know what pseud=
o
> even is, so they might not realize that host-user-contamination QA issues
> or "KeyError: 'getpwuid(): uid not found" might be related to this (and
> they probably won't find this e-mail as well).
>
> 2) revert the io_uring changes from bundled libuv, I've already verified
> this with nodejs-20.3.0, for 20.8.1 it would need couple more commits to =
be
> reverted as 20.8.1 uses even newer libuv-1.46.0. The changes are massive
> and it will be PIA to update them for every nodejs release, patch for
> keeping UV_USE_IO_URING support after it's removed from upstream libuv wi=
ll
> be much smaller, but PIA to use UV_USE_IO_URING whenever using
> nodejs-native during build.
>
> 3) fix pseudo to correctly work with io_uring calls, definitely best
> long-term solution as more and more tools will now switch to io_uring, bu=
t
> without active maintainer of pseudo it might be _very_ difficult to
> implement this and there aren't many people willing to touch this beast.
>
> Any opinions?
>
>
I would advise we not be overly aggressive about updates for important
tools like NodeJS and Django.

I don't think many consumers are building products on the latest greatest
NodeJS release (which this isn't, latest is 21), many may not even be on
the latest LTS (18 vs.16). While we can have a floating "latest" recipe, we
should keep an LTS recipe.
We tried to do this for Django in meta-python, but later commits wiped out
the comments and the upstream check.
https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-d=
evtools/python?id=3D961755a7bd17f7347f7dd0f2de3d2400a9c36f09


On Mon, Oct 2, 2023 at 7:08=E2=80=AFPM Martin Jansa via lists.openembedded.=
org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
>> On Thu, Sep 28, 2023 at 11:13=E2=80=AFAM Polampalli, Archana via
>> lists.openembedded.org <archana.polampalli=3D
>> windriver.com@lists.openembedded.org> wrote:
>>
>>> Update to latest release of latest LTS 20 release
>>>
>>>     * node v20 introduces several new features and fixes many bugs and
>>> CVEs as shown in [1]
>>>
>>>     * Refresh 0001-liftoff-Correct-function-signatures.patch against
>>> 20.5.1
>>>
>>>     * License-Update:
>>>        - Change zlib version 1.2.13, October 13th, 2022 to version
>>> 1.2.13.1, October xxth, 2022 [2]
>>>        - Change Copyright 2023 from Ada authors to Yagiz Nizipli and
>>> Daniel Lemire [4]
>>>
>>>     * Remove big-endian.patch as it is merged in v20.x [5] [6]
>>>
>>>     * Remove below list of patches since mips32 is deleted from v8 as
>>> part of update V8 to 10.7.193.13 [7] [8]
>>>        - mips-less-memory.patch
>>>        - 0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
>>>
>>>     * Update Using-native-binaries.patch for node_js2c, it resolved
>>> below do_compile error [9]
>>>        Error:
>>>        /bin/sh: line 1:
>>> build/tmp/work/core2-64-poky-linux/nodejs/20.5.1/node-v20.5.1/out/Relea=
se/node_js2c:
>>> No such file or directory
>>>
>>>     * Remove obsolete dtrace & etw configure options (we had:
>>> --without-<feature>) from the recipe [10]
>>
>>
>> FYI: (in case someone else are seeing similar issues now)
>>
>> With this upgrade I'm seeing some files created during the build with
>> node not to be intercepted by pseudo and recorded in its database.
>>
>> This results in sstate_report_unihash failure, because appinfo.json is
>> now owned by 1026:1026 (my build UID/GID) instead of 0:0 as before:
>>
>> DEBUG: Executing python function sstate_report_unihash
>> WARNING: KeyError in
>> ./package/usr/palm/applications/com.webos.app.videoplayer/appinfo.json
>> ERROR: Error executing a python function in exec_func_python()
>> autogenerated:
>>
>> The stack trace of python calls that resulted in this exception/failure
>> was:
>> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>>      0001:
>>  *** 0002:sstate_report_unihash(d)
>>      0003:
>> File:
>> '/OE/build/luneos-nanbield/openembedded-core/meta/classes-global/sstate.=
bbclass',
>> lineno: 880, function: sstate_report_unihash
>>      0876:    report_unihash =3D getattr(bb.parse.siggen, 'report_unihas=
h',
>> None)
>>      0877:
>>      0878:    if report_unihash:
>>      0879:        ss =3D sstate_state_fromvars(d)
>>  *** 0880:        report_unihash(os.getcwd(), ss['task'], d)
>>      0881:}
>>      0882:
>>      0883:#
>>      0884:# Shell function to decompress and prepare a package for
>> installation
>> File: '/OE/build/luneos-nanbield/bitbake/lib/bb/siggen.py', lineno: 659,
>> function: report_unihash
>>      0655:
>>      0656:            if "." in self.method:
>>      0657:                (module, method) =3D self.method.rsplit('.', 1=
)
>>      0658:                locs['method'] =3D
>> getattr(importlib.import_module(module), method)
>>  *** 0659:                outhash =3D bb.utils.better_eval('method(path,
>> sigfile, task, d)', locs)
>>      0660:            else:
>>      0661:                outhash =3D bb.utils.better_eval(self.method +
>> '(path, sigfile, task, d)', locs)
>>      0662:
>>      0663:            try:
>> File: '/OE/build/luneos-nanbield/bitbake/lib/bb/utils.py', lineno: 434,
>> function: better_eval
>>      0430:    if extraglobals:
>>      0431:        ctx =3D copy.copy(ctx)
>>      0432:        for g in extraglobals:
>>      0433:            ctx[g] =3D extraglobals[g]
>>  *** 0434:    return eval(source, ctx, locals)
>>      0435:
>>      0436:@contextmanager
>>      0437:def fileslocked(files, *args, **kwargs):
>>      0438:    """Context manager for locking and unlocking file locks.""=
"
>> File: '<string>', lineno: 1, function: <module>
>>   File "<string>", line 1, in <module>
>>
>> File:
>> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
>> lineno: 649, function: OEOuthashBasic
>>      0645:                process(root)
>>      0646:            for f in files:
>>      0647:                if f =3D=3D 'fixmepath':
>>      0648:                    continue
>>  *** 0649:                process(os.path.join(root, f))
>>      0650:
>>      0651:            for dir in dirs:
>>      0652:                if os.path.islink(os.path.join(root, dir)):
>>      0653:                    process(os.path.join(root, dir))
>> File:
>> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
>> lineno: 588, function: process
>>      0584:                    except KeyError as e:
>>      0585:                        bb.warn("KeyError in %s" % path)
>>      0586:                        msg =3D ("KeyError: %s\nPath %s is own=
ed
>> by uid %d, gid %d, which doesn't match "
>>      0587:                            "any user/group on target. This ma=
y
>> be due to host contamination." % (e, path, s.st_uid, s.st_gid))
>>  *** 0588:                        raise
>> Exception(msg).with_traceback(e.__traceback__)
>>      0589:
>>      0590:                if include_timestamps:
>>      0591:                    update_hash(" %10d" % s.st_mtime)
>>      0592:
>> File:
>> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
>> lineno: 582, function: process
>>      0578:                    else:
>>      0579:                        add_perm(stat.S_IXOTH, 'x')
>>      0580:
>>      0581:                    try:
>>  *** 0582:                        update_hash(" %10s" %
>> pwd.getpwuid(s.st_uid).pw_name)
>>      0583:                        update_hash(" %10s" %
>> grp.getgrgid(s.st_gid).gr_name)
>>      0584:                    except KeyError as e:
>>      0585:                        bb.warn("KeyError in %s" % path)
>>      0586:                        msg =3D ("KeyError: %s\nPath %s is own=
ed
>> by uid %d, gid %d, which doesn't match "
>> Exception: Exception: KeyError: 'getpwuid(): uid not found: 1026'
>> Path
>> ./package/usr/palm/applications/com.webos.app.videoplayer/appinfo.json i=
s
>> owned by uid 1026, gid 1026, which doesn't match any user/group on targe=
t.
>> This may be due to host contamination.
>>
>> martin@jama
>> /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos=
.app.videoplayer
>> $ sqlite3 0.0.1-12+git-nodejs-20/pseudo/files.db "select * from files wh=
ere
>> path like '%yer/appinfo.json'"
>>
>> 1107|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.=
webos.app.videoplayer/0.0.1-12+git/sstate-build-package/package/usr/palm/ap=
plications/com.webos.app.videoplayer/appinfo.json|66305|41202418|1026|1026|=
33188|0|0
>>
>> 1192|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.=
webos.app.videoplayer/0.0.1-12+git/sstate-build-package/packages-split/com.=
webos.app.videoplayer/usr/palm/applications/com.webos.app.videoplayer/appin=
fo.json|66305|41
>> 202418|1026|1026|33188|0|0
>>
>> martin@jama
>> /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos=
.app.videoplayer
>> $ sqlite3 0.0.1-12+git-nodejs-18/pseudo/files.db "select * from files wh=
ere
>> path like '%yer/appinfo.json'"
>>
>> 56|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.we=
bos.app.videoplayer/0.0.1-12+git/image/usr/palm/applications/com.webos.app.=
videoplayer/appinfo.json|66305|42878067|0|0|33188|0|0
>>
>> 374|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.w=
ebos.app.videoplayer/0.0.1-12+git/package/usr/palm/applications/com.webos.a=
pp.videoplayer/appinfo.json|66305|42878641|0|0|33188|0|0
>>
>> 459|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.w=
ebos.app.videoplayer/0.0.1-12+git/packages-split/com.webos.app.videoplayer/=
usr/palm/applications/com.webos.app.videoplayer/appinfo.json|66305|42878641=
|0|0|33188|0|0
>>
>> I'll provide more details when I debug this further.
>>
>> Regards,
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105583):
> https://lists.openembedded.org/g/openembedded-devel/message/105583
> Mute This Topic: https://lists.openembedded.org/mt/101098430/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ee87eb060805dd10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 18, 2023 at 1:41=E2=80=AF=
PM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">I&#39;ve narrowed this down to simple reproduce=
r with webpack creating pack with &quot;hello world&quot; as shown in:<div>=
<a href=3D"https://github.com/shr-project/com.webos.app.minimal/tree/recipe=
s" target=3D"_blank">https://github.com/shr-project/com.webos.app.minimal/t=
ree/recipes</a><br></div><div><br></div><div>Then with this reproducer I&#3=
9;ve bisected it to nodejs-20.3.0 with libuv upgrade 1.45.0 which brings su=
pport for io_uring which doesn&#39;t work with pseudo in:</div><div><a href=
=3D"https://github.com/libuv/libuv/pull/3952/commits/26c79a942b92573a1388c0=
ee8a6ad4397f009318" target=3D"_blank">https://github.com/libuv/libuv/pull/3=
952/commits/26c79a942b92573a1388c0ee8a6ad4397f009318</a><br></div><div><br>=
</div><div>Now we have 3 options:</div><div><br></div><div>1) either every =
use of nodejs-native where io_uring might be used (like in webpack) needs t=
o export=C2=A0UV_USE_IO_URING=3D0 before using node, but be aware that the =
PR says it&#39;s only temporary and this variable might be removed in futur=
e. Unfortunately many people are lucky enough not to know what pseudo even =
is, so they might not realize that host-user-contamination QA issues or &qu=
ot;KeyError: &#39;getpwuid(): uid not found&quot; might be related to this =
(and they probably won&#39;t find this e-mail as well).</div><div><br></div=
><div>2) revert the io_uring changes from bundled libuv, I&#39;ve already v=
erified this with nodejs-20.3.0, for 20.8.1 it would need couple more commi=
ts to be reverted as 20.8.1 uses even newer libuv-1.46.0. The changes are m=
assive and it will be PIA to update them for every nodejs release, patch fo=
r keeping UV_USE_IO_URING support after it&#39;s removed from upstream libu=
v will be much smaller, but PIA to use=C2=A0UV_USE_IO_URING whenever using =
nodejs-native during build.</div><div><br></div><div>3) fix pseudo to corre=
ctly work with io_uring calls, definitely best long-term solution as more a=
nd more tools will now switch to io_uring, but without active maintainer of=
 pseudo it might be _very_ difficult to implement this and there aren&#39;t=
 many people willing to touch this beast.</div><div><br></div><div>Any opin=
ions?</div></div><br></blockquote><div><br></div><div>I would advise we not=
 be overly aggressive about updates for important tools like NodeJS and Dja=
ngo.</div><div><br></div><div>I don&#39;t think many consumers are building=
 products on the latest greatest NodeJS release (which this isn&#39;t, late=
st is 21), many may not even be on the latest LTS (18 vs.16). While we can =
have a floating &quot;latest&quot; recipe, we should keep an LTS recipe.</d=
iv><div>We tried to do this for Django in meta-python, but later commits wi=
ped out the comments and the upstream check.</div><div><a href=3D"https://g=
it.openembedded.org/meta-openembedded/commit/meta-python/recipes-devtools/p=
ython?id=3D961755a7bd17f7347f7dd0f2de3d2400a9c36f09">https://git.openembedd=
ed.org/meta-openembedded/commit/meta-python/recipes-devtools/python?id=3D96=
1755a7bd17f7347f7dd0f2de3d2400a9c36f09</a></div><div><br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 2, 2023 at 7:08=E2=
=80=AFPM Martin Jansa via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, Sep 2=
8, 2023 at 11:13=E2=80=AFAM Polampalli, Archana via <a href=3D"http://lists=
.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;archana=
.polampalli=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" targe=
t=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Update to latest release of latest LTS 20 release<br>
<br>
=C2=A0 =C2=A0 * node v20 introduces several new features and fixes many bug=
s and CVEs as shown in [1]<br>
<br>
=C2=A0 =C2=A0 * Refresh 0001-liftoff-Correct-function-signatures.patch agai=
nst 20.5.1<br>
<br>
=C2=A0 =C2=A0 * License-Update:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- Change zlib version 1.2.13, October 13th, 2022=
 to version 1.2.13.1, October xxth, 2022 [2]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- Change Copyright 2023 from Ada authors to Yagi=
z Nizipli and Daniel Lemire [4]<br>
<br>
=C2=A0 =C2=A0 * Remove big-endian.patch as it is merged in v20.x [5] [6]<br=
>
<br>
=C2=A0 =C2=A0 * Remove below list of patches since mips32 is deleted from v=
8 as part of update V8 to 10.7.193.13 [7] [8]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- mips-less-memory.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- 0001-mips-Use-32bit-cast-for-operand-on-mips32=
.patch<br>
<br>
=C2=A0 =C2=A0 * Update Using-native-binaries.patch for node_js2c, it resolv=
ed below do_compile error [9]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Error:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0/bin/sh: line 1: build/tmp/work/core2-64-poky-li=
nux/nodejs/20.5.1/node-v20.5.1/out/Release/node_js2c: No such file or direc=
tory<br>
<br>
=C2=A0 =C2=A0 * Remove obsolete dtrace &amp; etw configure options (we had:=
 --without-&lt;feature&gt;) from the recipe [10]</blockquote><div><br></div=
><div>FYI: (in case someone else are seeing similar issues now)</div><div><=
br></div><div>With this upgrade I&#39;m seeing some files created during th=
e build with node not to be intercepted by pseudo and recorded in its datab=
ase.</div><div><br></div><div>This results in=C2=A0sstate_report_unihash fa=
ilure, because appinfo.json is now owned by 1026:1026 (my build UID/GID) in=
stead of 0:0 as before:</div><div><br></div><div>DEBUG: Executing python fu=
nction sstate_report_unihash</div>WARNING: KeyError in ./package/usr/palm/a=
pplications/com.webos.app.videoplayer/appinfo.json<br>ERROR: Error executin=
g a python function in exec_func_python() autogenerated:<br><br>The stack t=
race of python calls that resulted in this exception/failure was:<br>File: =
&#39;exec_func_python() autogenerated&#39;, lineno: 2, function: &lt;module=
&gt;<br>=C2=A0 =C2=A0 =C2=A00001:<br>=C2=A0*** 0002:sstate_report_unihash(d=
)<br>=C2=A0 =C2=A0 =C2=A00003:<br>File: &#39;/OE/build/luneos-nanbield/open=
embedded-core/meta/classes-global/sstate.bbclass&#39;, lineno: 880, functio=
n: sstate_report_unihash<br>=C2=A0 =C2=A0 =C2=A00876: =C2=A0 =C2=A0report_u=
nihash =3D getattr(bb.parse.siggen, &#39;report_unihash&#39;, None)<br>=C2=
=A0 =C2=A0 =C2=A00877:<br>=C2=A0 =C2=A0 =C2=A00878: =C2=A0 =C2=A0if report_=
unihash: =C2=A0<br>=C2=A0 =C2=A0 =C2=A00879: =C2=A0 =C2=A0 =C2=A0 =C2=A0ss =
=3D sstate_state_fromvars(d)<br>=C2=A0*** 0880: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
report_unihash(os.getcwd(), ss[&#39;task&#39;], d)<br>=C2=A0 =C2=A0 =C2=A00=
881:}<br>=C2=A0 =C2=A0 =C2=A00882:<br>=C2=A0 =C2=A0 =C2=A00883:#<br>=C2=A0 =
=C2=A0 =C2=A00884:# Shell function to decompress and prepare a package for =
installation<br>File: &#39;/OE/build/luneos-nanbield/bitbake/lib/bb/siggen.=
py&#39;, lineno: 659, function: report_unihash<br>=C2=A0 =C2=A0 =C2=A00655:=
<br>=C2=A0 =C2=A0 =C2=A00656: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &=
quot;.&quot; in self.method:<br>=C2=A0 =C2=A0 =C2=A00657: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(module, method) =3D self.method.rspl=
it(&#39;.&#39;, 1)<br>=C2=A0 =C2=A0 =C2=A00658: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0locs[&#39;method&#39;] =3D getattr(importlib.im=
port_module(module), method)<br>=C2=A0*** 0659: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0outhash =3D bb.utils.better_eval(&#39;method(pa=
th, sigfile, task, d)&#39;, locs)<br>=C2=A0 =C2=A0 =C2=A00660: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>=C2=A0 =C2=A0 =C2=A00661: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outhash =3D bb.utils.better=
_eval(self.method + &#39;(path, sigfile, task, d)&#39;, locs)<br>=C2=A0 =C2=
=A0 =C2=A00662:<br>=C2=A0 =C2=A0 =C2=A00663: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0try:<br>File: &#39;/OE/build/luneos-nanbield/bitbake/lib/bb/ut=
ils.py&#39;, lineno: 434, function: better_eval<br>=C2=A0 =C2=A0 =C2=A00430=
: =C2=A0 =C2=A0if extraglobals:<br>=C2=A0 =C2=A0 =C2=A00431: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ctx =3D copy.copy(ctx)<br>=C2=A0 =C2=A0 =C2=A00432: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0for g in extraglobals:<br>=C2=A0 =C2=A0 =C2=A00433: =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx[g] =3D extraglobals[g]<br>=C2=A0*** =
0434: =C2=A0 =C2=A0return eval(source, ctx, locals)<br>=C2=A0 =C2=A0 =C2=A0=
0435:<br>=C2=A0 =C2=A0 =C2=A00436:@contextmanager<br>=C2=A0 =C2=A0 =C2=A004=
37:def fileslocked(files, *args, **kwargs):<br>=C2=A0 =C2=A0 =C2=A00438: =
=C2=A0 =C2=A0&quot;&quot;&quot;Context manager for locking and unlocking fi=
le locks.&quot;&quot;&quot;<br>File: &#39;&lt;string&gt;&#39;, lineno: 1, f=
unction: &lt;module&gt;<br>=C2=A0 File &quot;&lt;string&gt;&quot;, line 1, =
in &lt;module&gt;<br><br>File: &#39;/OE/build/luneos-nanbield/openembedded-=
core/meta/lib/oe/sstatesig.py&#39;, lineno: 649, function: OEOuthashBasic<b=
r>=C2=A0 =C2=A0 =C2=A00645: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0process(root)<br>=C2=A0 =C2=A0 =C2=A00646: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0for f in files:<br>=C2=A0 =C2=A0 =C2=A00647: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if f =3D=3D &#39;fixmepath&#39=
;:<br>=C2=A0 =C2=A0 =C2=A00648: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>=C2=A0*** 0649: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process(os.path.join(root, f))<br>=C2=A0=
 =C2=A0 =C2=A00650:<br>=C2=A0 =C2=A0 =C2=A00651: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0for dir in dirs:<br>=C2=A0 =C2=A0 =C2=A00652: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.islink(os.path.join=
(root, dir)):<br>=C2=A0 =C2=A0 =C2=A00653: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process(os.path.join(root, dir))<br>F=
ile: &#39;/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig=
.py&#39;, lineno: 588, function: process<br>=C2=A0 =C2=A0 =C2=A00584: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Ke=
yError as e:<br>=C2=A0 =C2=A0 =C2=A00585: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;KeyError =
in %s&quot; % path)<br>=C2=A0 =C2=A0 =C2=A00586: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D (&quot;K=
eyError: %s\nPath %s is owned by uid %d, gid %d, which doesn&#39;t match &q=
uot;<br>=C2=A0 =C2=A0 =C2=A00587: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;any user/grou=
p on target. This may be due to host contamination.&quot; % (e, path, s.st_=
uid, s.st_gid))<br>=C2=A0*** 0588: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Exception(msg).with_trac=
eback(e.__traceback__)<br></div><div class=3D"gmail_quote">=C2=A0 =C2=A0 =
=C2=A00589:<br>=C2=A0 =C2=A0 =C2=A00590: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0if include_timestamps:<br>=C2=A0 =C2=A0 =C2=A00591: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update=
_hash(&quot; %10d&quot; % s.st_mtime)<br>=C2=A0 =C2=A0 =C2=A00592:<br>File:=
 &#39;/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py&=
#39;, lineno: 582, function: process<br>=C2=A0 =C2=A0 =C2=A00578: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>=C2=
=A0 =C2=A0 =C2=A00579: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_perm(stat.S_IXOTH, &#39;x&#39;)<br>=C2=
=A0 =C2=A0 =C2=A00580:<br>=C2=A0 =C2=A0 =C2=A00581: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>=C2=A0*** 0582: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0update_hash(&quot; %10s&quot; % pwd.getpwuid(s.st_uid).pw_name)<br>=
=C2=A0 =C2=A0 =C2=A00583: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_hash(&quot; %10s&quot; % grp.getgr=
gid(s.st_gid).gr_name)<br>=C2=A0 =C2=A0 =C2=A00584: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except KeyError as e:<br>=
=C2=A0 =C2=A0 =C2=A00585: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;KeyError in %s&quot; % path=
)<br>=C2=A0 =C2=A0 =C2=A00586: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D (&quot;KeyError: %s\nPath =
%s is owned by uid %d, gid %d, which doesn&#39;t match &quot;<br>Exception:=
 Exception: KeyError: &#39;getpwuid(): uid not found: 1026&#39;<br>Path ./p=
ackage/usr/palm/applications/com.webos.app.videoplayer/appinfo.json is owne=
d by uid 1026, gid 1026, which doesn&#39;t match any user/group on target. =
This may be due to host contamination.<br></div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">martin@jama /OE/build/luneos-nanbield/=
tmp-glibc/work/corei7-64-webos-linux/com.webos.app.videoplayer $ sqlite3 0.=
0.1-12+git-nodejs-20/pseudo/files.db &quot;select * from files where path l=
ike &#39;%yer/appinfo.json&#39;&quot;<br>1107|/OE/build/luneos-nanbield/tmp=
-glibc/work/corei7-64-webos-linux/com.webos.app.videoplayer/0.0.1-12+git/ss=
tate-build-package/package/usr/palm/applications/com.webos.app.videoplayer/=
appinfo.json|66305|41202418|1026|1026|33188|0|0<br>1192|/OE/build/luneos-na=
nbield/tmp-glibc/work/corei7-64-webos-linux/com.webos.app.videoplayer/0.0.1=
-12+git/sstate-build-package/packages-split/com.webos.app.videoplayer/usr/p=
alm/applications/com.webos.app.videoplayer/appinfo.json|66305|41<br>202418|=
1026|1026|33188|0|0<br><br></div><div class=3D"gmail_quote">martin@jama /OE=
/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos.app.v=
ideoplayer $ sqlite3 0.0.1-12+git-nodejs-18/pseudo/files.db &quot;select * =
from files where path like &#39;%yer/appinfo.json&#39;&quot;<br>56|/OE/buil=
d/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos.app.videop=
layer/0.0.1-12+git/image/usr/palm/applications/com.webos.app.videoplayer/ap=
pinfo.json|66305|42878067|0|0|33188|0|0<br>374|/OE/build/luneos-nanbield/tm=
p-glibc/work/corei7-64-webos-linux/com.webos.app.videoplayer/0.0.1-12+git/p=
ackage/usr/palm/applications/com.webos.app.videoplayer/appinfo.json|66305|4=
2878641|0|0|33188|0|0<br>459|/OE/build/luneos-nanbield/tmp-glibc/work/corei=
7-64-webos-linux/com.webos.app.videoplayer/0.0.1-12+git/packages-split/com.=
webos.app.videoplayer/usr/palm/applications/com.webos.app.videoplayer/appin=
fo.json|66305|42878641|0|0|33188|0|0<br></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">I&#39;ll provide more details when I deb=
ug this further.</div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">Regards,</div></div></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105583): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105583" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105583</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101098430/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/101098430/924729</a><br>
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

--000000000000ee87eb060805dd10--

