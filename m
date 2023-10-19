Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8291ACDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 03:40:37 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.19567.1697686836550343360
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 20:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X3E/jUsT;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6cd1918afb2so584201a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 20:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697686836; x=1698291636; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpEZ1RWd1OntThjnwgRMUhwnphtcSfke1mKsH2Xpuhg=;
        b=X3E/jUsTZQjwA+ltN7mEHOQIScF5zS4ac06D4fRD1GLjZwJlMdkC2zlsV69YCjcsRI
         FbFfneHi5qvaYQqOt5n6IE2nOj6ZuVn5V7+qtWqm5xGT1S9zDnyshNnCjVoNAaN2c+sq
         yLH2/Y5ZF0gmWoxL+0jSeD0RJWstyUfmFw2v+gAus7RfMotujP3sNtTt0nH5EOafk1a2
         kPt+BPW3jP9J4q6UX9kTGaU/MRPETX5eQusrKyU5NiioisdOP0hlmMLPye2IiGtu69Wj
         G8uy/bPUhdDUc8D+0LG+UYIP8YgqwNrl4E4V7OsD53j34aGNGvJJKpnPW+T2azysrEBX
         UMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697686836; x=1698291636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpEZ1RWd1OntThjnwgRMUhwnphtcSfke1mKsH2Xpuhg=;
        b=ccf5Yrzmoex0ehDbWYdUdeBmDljts0XPL6AMqDYdHNXp1xmfc7IsLrJVAlZM82Kl92
         5ebEQJo9znn8sHXkTnz12pzdxRAIN3xYuDuEsh/M4Bh8Shkdriyuf1pgRgoXXzdpKVYl
         bWLTCCFGNFMI4WOnsSx87V4SqdqL0q0Syp5oLrid9LB1kx96YxKc0Z/ZO6GStLBJ0Dci
         VFrH3OVle0wr3oTyQsEaDluLR5fwnODk92rXmnEPUm1tDEtk4hajOTFeTGruzRuN5V5r
         OJMCHtPxajsJR+cUQhEglotKUEkpA5BKoofs1i10Ro7HPRZo7cDNK/IMyuRB2WFemPZf
         4syw==
X-Gm-Message-State: AOJu0YzOn9YGTsyY1z6veRagv/HK3F9l1d7u/kZGZsxCLdiNR1CnsnOc
	PtUqY37LI9DIlCYwci5/GMlZsiW/O/aC4KlGY3EMsPdIXjk=
X-Google-Smtp-Source: AGHT+IEUJfGANTbihdqDW0t7wxTDLd3oVxSGrh/gjhBLK86c4UXLpj7Cv/eFZGHZc4EUao8shxKu3Zj22Qlhpg9cS2I=
X-Received: by 2002:a05:6870:1258:b0:1e9:af81:54b6 with SMTP id
 24-20020a056870125800b001e9af8154b6mr1137935oao.55.1697686835633; Wed, 18 Oct
 2023 20:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230928091304.4000026-1-archana.polampalli@windriver.com>
 <178A59668B8F4A5C.9230@lists.openembedded.org> <CA+chaQfec515o-qNEYWWhsnAxcwDy2fKeo9ShM1up61HaNMW_w@mail.gmail.com>
 <CANx9H-AzDAv-wnyBKGTpFu_+d6HXhp0pv2muABWhNf+GqUNxqQ@mail.gmail.com>
In-Reply-To: <CANx9H-AzDAv-wnyBKGTpFu_+d6HXhp0pv2muABWhNf+GqUNxqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Oct 2023 20:40:09 -0700
Message-ID: <CAMKF1spqLUOCkywXgq9CsQZ3WZsoVniM-Q2p3LfToXtO83EjNQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1
To: Tim Orling <ticotimo@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, archana.polampalli@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 03:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105589

On Wed, Oct 18, 2023 at 4:19=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
>
>
> On Wed, Oct 18, 2023 at 1:41=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
>>
>> I've narrowed this down to simple reproducer with webpack creating pack =
with "hello world" as shown in:
>> https://github.com/shr-project/com.webos.app.minimal/tree/recipes
>>
>> Then with this reproducer I've bisected it to nodejs-20.3.0 with libuv u=
pgrade 1.45.0 which brings support for io_uring which doesn't work with pse=
udo in:
>> https://github.com/libuv/libuv/pull/3952/commits/26c79a942b92573a1388c0e=
e8a6ad4397f009318
>>
>> Now we have 3 options:
>>
>> 1) either every use of nodejs-native where io_uring might be used (like =
in webpack) needs to export UV_USE_IO_URING=3D0 before using node, but be a=
ware that the PR says it's only temporary and this variable might be remove=
d in future. Unfortunately many people are lucky enough not to know what ps=
eudo even is, so they might not realize that host-user-contamination QA iss=
ues or "KeyError: 'getpwuid(): uid not found" might be related to this (and=
 they probably won't find this e-mail as well).
>>
>> 2) revert the io_uring changes from bundled libuv, I've already verified=
 this with nodejs-20.3.0, for 20.8.1 it would need couple more commits to b=
e reverted as 20.8.1 uses even newer libuv-1.46.0. The changes are massive =
and it will be PIA to update them for every nodejs release, patch for keepi=
ng UV_USE_IO_URING support after it's removed from upstream libuv will be m=
uch smaller, but PIA to use UV_USE_IO_URING whenever using nodejs-native du=
ring build.
>>
>> 3) fix pseudo to correctly work with io_uring calls, definitely best lon=
g-term solution as more and more tools will now switch to io_uring, but wit=
hout active maintainer of pseudo it might be _very_ difficult to implement =
this and there aren't many people willing to touch this beast.
>>
>> Any opinions?
>>
>
> I would advise we not be overly aggressive about updates for important to=
ols like NodeJS and Django.
>
> I don't think many consumers are building products on the latest greatest=
 NodeJS release (which this isn't, latest is 21), many may not even be on t=
he latest LTS (18 vs.16). While we can have a floating "latest" recipe, we =
should keep an LTS recipe.
> We tried to do this for Django in meta-python, but later commits wiped ou=
t the comments and the upstream check.
> https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes=
-devtools/python?id=3D961755a7bd17f7347f7dd0f2de3d2400a9c36f09
>

20.x is next LTS and we already branched nanbield with 18.x, for
master and upcoming yocto LTS release in April 2024, I would like to
see up move to 20.x and figure out
problems during this time early enough so we can stick to 20.x for
yocto LTS. Unless we run into blocker issues.

>
>> On Mon, Oct 2, 2023 at 7:08=E2=80=AFPM Martin Jansa via lists.openembedd=
ed.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> On Thu, Sep 28, 2023 at 11:13=E2=80=AFAM Polampalli, Archana via lists.=
openembedded.org <archana.polampalli=3Dwindriver.com@lists.openembedded.org=
> wrote:
>>>>
>>>> Update to latest release of latest LTS 20 release
>>>>
>>>>     * node v20 introduces several new features and fixes many bugs and=
 CVEs as shown in [1]
>>>>
>>>>     * Refresh 0001-liftoff-Correct-function-signatures.patch against 2=
0.5.1
>>>>
>>>>     * License-Update:
>>>>        - Change zlib version 1.2.13, October 13th, 2022 to version 1.2=
.13.1, October xxth, 2022 [2]
>>>>        - Change Copyright 2023 from Ada authors to Yagiz Nizipli and D=
aniel Lemire [4]
>>>>
>>>>     * Remove big-endian.patch as it is merged in v20.x [5] [6]
>>>>
>>>>     * Remove below list of patches since mips32 is deleted from v8 as =
part of update V8 to 10.7.193.13 [7] [8]
>>>>        - mips-less-memory.patch
>>>>        - 0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
>>>>
>>>>     * Update Using-native-binaries.patch for node_js2c, it resolved be=
low do_compile error [9]
>>>>        Error:
>>>>        /bin/sh: line 1: build/tmp/work/core2-64-poky-linux/nodejs/20.5=
.1/node-v20.5.1/out/Release/node_js2c: No such file or directory
>>>>
>>>>     * Remove obsolete dtrace & etw configure options (we had: --withou=
t-<feature>) from the recipe [10]
>>>
>>>
>>> FYI: (in case someone else are seeing similar issues now)
>>>
>>> With this upgrade I'm seeing some files created during the build with n=
ode not to be intercepted by pseudo and recorded in its database.
>>>
>>> This results in sstate_report_unihash failure, because appinfo.json is =
now owned by 1026:1026 (my build UID/GID) instead of 0:0 as before:
>>>
>>> DEBUG: Executing python function sstate_report_unihash
>>> WARNING: KeyError in ./package/usr/palm/applications/com.webos.app.vide=
oplayer/appinfo.json
>>> ERROR: Error executing a python function in exec_func_python() autogene=
rated:
>>>
>>> The stack trace of python calls that resulted in this exception/failure=
 was:
>>> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>>>      0001:
>>>  *** 0002:sstate_report_unihash(d)
>>>      0003:
>>> File: '/OE/build/luneos-nanbield/openembedded-core/meta/classes-global/=
sstate.bbclass', lineno: 880, function: sstate_report_unihash
>>>      0876:    report_unihash =3D getattr(bb.parse.siggen, 'report_uniha=
sh', None)
>>>      0877:
>>>      0878:    if report_unihash:
>>>      0879:        ss =3D sstate_state_fromvars(d)
>>>  *** 0880:        report_unihash(os.getcwd(), ss['task'], d)
>>>      0881:}
>>>      0882:
>>>      0883:#
>>>      0884:# Shell function to decompress and prepare a package for inst=
allation
>>> File: '/OE/build/luneos-nanbield/bitbake/lib/bb/siggen.py', lineno: 659=
, function: report_unihash
>>>      0655:
>>>      0656:            if "." in self.method:
>>>      0657:                (module, method) =3D self.method.rsplit('.', =
1)
>>>      0658:                locs['method'] =3D getattr(importlib.import_m=
odule(module), method)
>>>  *** 0659:                outhash =3D bb.utils.better_eval('method(path=
, sigfile, task, d)', locs)
>>>      0660:            else:
>>>      0661:                outhash =3D bb.utils.better_eval(self.method =
+ '(path, sigfile, task, d)', locs)
>>>      0662:
>>>      0663:            try:
>>> File: '/OE/build/luneos-nanbield/bitbake/lib/bb/utils.py', lineno: 434,=
 function: better_eval
>>>      0430:    if extraglobals:
>>>      0431:        ctx =3D copy.copy(ctx)
>>>      0432:        for g in extraglobals:
>>>      0433:            ctx[g] =3D extraglobals[g]
>>>  *** 0434:    return eval(source, ctx, locals)
>>>      0435:
>>>      0436:@contextmanager
>>>      0437:def fileslocked(files, *args, **kwargs):
>>>      0438:    """Context manager for locking and unlocking file locks."=
""
>>> File: '<string>', lineno: 1, function: <module>
>>>   File "<string>", line 1, in <module>
>>>
>>> File: '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesi=
g.py', lineno: 649, function: OEOuthashBasic
>>>      0645:                process(root)
>>>      0646:            for f in files:
>>>      0647:                if f =3D=3D 'fixmepath':
>>>      0648:                    continue
>>>  *** 0649:                process(os.path.join(root, f))
>>>      0650:
>>>      0651:            for dir in dirs:
>>>      0652:                if os.path.islink(os.path.join(root, dir)):
>>>      0653:                    process(os.path.join(root, dir))
>>> File: '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesi=
g.py', lineno: 588, function: process
>>>      0584:                    except KeyError as e:
>>>      0585:                        bb.warn("KeyError in %s" % path)
>>>      0586:                        msg =3D ("KeyError: %s\nPath %s is ow=
ned by uid %d, gid %d, which doesn't match "
>>>      0587:                            "any user/group on target. This m=
ay be due to host contamination." % (e, path, s.st_uid, s.st_gid))
>>>  *** 0588:                        raise Exception(msg).with_traceback(e=
.__traceback__)
>>>      0589:
>>>      0590:                if include_timestamps:
>>>      0591:                    update_hash(" %10d" % s.st_mtime)
>>>      0592:
>>> File: '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesi=
g.py', lineno: 582, function: process
>>>      0578:                    else:
>>>      0579:                        add_perm(stat.S_IXOTH, 'x')
>>>      0580:
>>>      0581:                    try:
>>>  *** 0582:                        update_hash(" %10s" % pwd.getpwuid(s.=
st_uid).pw_name)
>>>      0583:                        update_hash(" %10s" % grp.getgrgid(s.=
st_gid).gr_name)
>>>      0584:                    except KeyError as e:
>>>      0585:                        bb.warn("KeyError in %s" % path)
>>>      0586:                        msg =3D ("KeyError: %s\nPath %s is ow=
ned by uid %d, gid %d, which doesn't match "
>>> Exception: Exception: KeyError: 'getpwuid(): uid not found: 1026'
>>> Path ./package/usr/palm/applications/com.webos.app.videoplayer/appinfo.=
json is owned by uid 1026, gid 1026, which doesn't match any user/group on =
target. This may be due to host contamination.
>>>
>>> martin@jama /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-li=
nux/com.webos.app.videoplayer $ sqlite3 0.0.1-12+git-nodejs-20/pseudo/files=
.db "select * from files where path like '%yer/appinfo.json'"
>>> 1107|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com=
.webos.app.videoplayer/0.0.1-12+git/sstate-build-package/package/usr/palm/a=
pplications/com.webos.app.videoplayer/appinfo.json|66305|41202418|1026|1026=
|33188|0|0
>>> 1192|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com=
.webos.app.videoplayer/0.0.1-12+git/sstate-build-package/packages-split/com=
.webos.app.videoplayer/usr/palm/applications/com.webos.app.videoplayer/appi=
nfo.json|66305|41
>>> 202418|1026|1026|33188|0|0
>>>
>>> martin@jama /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-li=
nux/com.webos.app.videoplayer $ sqlite3 0.0.1-12+git-nodejs-18/pseudo/files=
.db "select * from files where path like '%yer/appinfo.json'"
>>> 56|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.w=
ebos.app.videoplayer/0.0.1-12+git/image/usr/palm/applications/com.webos.app=
.videoplayer/appinfo.json|66305|42878067|0|0|33188|0|0
>>> 374|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.=
webos.app.videoplayer/0.0.1-12+git/package/usr/palm/applications/com.webos.=
app.videoplayer/appinfo.json|66305|42878641|0|0|33188|0|0
>>> 459|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.=
webos.app.videoplayer/0.0.1-12+git/packages-split/com.webos.app.videoplayer=
/usr/palm/applications/com.webos.app.videoplayer/appinfo.json|66305|4287864=
1|0|0|33188|0|0
>>>
>>> I'll provide more details when I debug this further.
>>>
>>> Regards,
>>>
>>>
>>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105585): https://lists.openembedded.org/g/openembedde=
d-devel/message/105585
> Mute This Topic: https://lists.openembedded.org/mt/101098430/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

