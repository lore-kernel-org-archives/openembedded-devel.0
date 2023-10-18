Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7BDCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 20:41:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.12263.1697661670496756172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 13:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwifiZbY;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so66872115e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 13:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697661669; x=1698266469; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2Kyme8juwcwWZ1zQNNNsX4qy7bV51m3/w5yifNYvaw=;
        b=UwifiZbYvwP0w7DShp5Wj4P9MhzFghAEycN904pcFBi3xrp2VpzZb/UXIK3E4Ba50E
         /lJeIGBAhaOPaT1jbuUTVhPWNDuwvq5sHa5745SNx1xC3V+pkG+Ee2FxjP0hKnQh9PuE
         Su3A3rzuiT50AUnW3kro65zRN/uTxXOpY0wL+x+NyKi0m49SKTGe9V2GkaWypXWwczxd
         vIiuN7dhZFSalzt1YMTv0EBL8VruNqps+J7VXwlm5W9jxGznPZL1XgRmJoQWro67rGtv
         edLWhc7i0WgZzn1zZx4nvfHsnI10AjqRQFbx0iT2d9f9rNlaZw0rSXo2ojDdkC5ZDIKK
         ccfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697661669; x=1698266469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2Kyme8juwcwWZ1zQNNNsX4qy7bV51m3/w5yifNYvaw=;
        b=YiGDb35fAvzADFeU5NLi5M7/SpTb082/2+Td0vbEi1Cw4d47dLi/93erg1JOgBBtVi
         XMhJ/wID6TEyBsncVQ16m+0FJ2WeLuRdWp3VuuSzf+bMgzsOarR1d/TebU6RhTd7K4sX
         y/301C4mVx+PGOZ+053EGALZXwnw04yIqsLwuG2ORKH3Akl38nxmv74x2tv3MfHbU/Ea
         hIxvFYsNEpEOKnqWV2e8qh2iMhrfF+KVSziOaXcuhsN3W4PiPeb1YbajFNR5ocPGc7dK
         JRprdLb8msDqHbnUeK8CecCuOv1CXWwp/Gial6IDPGjEg/2DYGEGSz9GECSJh2w7EEOB
         BP1g==
X-Gm-Message-State: AOJu0YwSETHaaJ4t1zOG7/eCDTpM1wHtN6BYp7BJXrELlU438P0oeu0o
	QyQQVI4MIGyNwdVRzA+dErFJlYpblI8tios0s2k=
X-Google-Smtp-Source: AGHT+IHPh3YjB8sePIdnqOn+H1gerbGpxOsfifuB3ZY5AGJeWSHh8ZUqNi1b0YV08FtU5DcqH7fD5aGvBFzBnuEEdUw=
X-Received: by 2002:a05:600c:1c06:b0:405:4776:735a with SMTP id
 j6-20020a05600c1c0600b004054776735amr375232wms.2.1697661668529; Wed, 18 Oct
 2023 13:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230928091304.4000026-1-archana.polampalli@windriver.com> <178A59668B8F4A5C.9230@lists.openembedded.org>
In-Reply-To: <178A59668B8F4A5C.9230@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Oct 2023 22:40:56 +0200
Message-ID: <CA+chaQfec515o-qNEYWWhsnAxcwDy2fKeo9ShM1up61HaNMW_w@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1
To: martin.jansa@gmail.com
Cc: archana.polampalli@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b39b86060803a889"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 20:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105583

--000000000000b39b86060803a889
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've narrowed this down to simple reproducer with webpack creating pack
with "hello world" as shown in:
https://github.com/shr-project/com.webos.app.minimal/tree/recipes

Then with this reproducer I've bisected it to nodejs-20.3.0 with libuv
upgrade 1.45.0 which brings support for io_uring which doesn't work with
pseudo in:
https://github.com/libuv/libuv/pull/3952/commits/26c79a942b92573a1388c0ee8a=
6ad4397f009318

Now we have 3 options:

1) either every use of nodejs-native where io_uring might be used (like in
webpack) needs to export UV_USE_IO_URING=3D0 before using node, but be awar=
e
that the PR says it's only temporary and this variable might be removed in
future. Unfortunately many people are lucky enough not to know what pseudo
even is, so they might not realize that host-user-contamination QA issues
or "KeyError: 'getpwuid(): uid not found" might be related to this (and
they probably won't find this e-mail as well).

2) revert the io_uring changes from bundled libuv, I've already verified
this with nodejs-20.3.0, for 20.8.1 it would need couple more commits to be
reverted as 20.8.1 uses even newer libuv-1.46.0. The changes are massive
and it will be PIA to update them for every nodejs release, patch for
keeping UV_USE_IO_URING support after it's removed from upstream libuv will
be much smaller, but PIA to use UV_USE_IO_URING whenever using
nodejs-native during build.

3) fix pseudo to correctly work with io_uring calls, definitely best
long-term solution as more and more tools will now switch to io_uring, but
without active maintainer of pseudo it might be _very_ difficult to
implement this and there aren't many people willing to touch this beast.

Any opinions?

On Mon, Oct 2, 2023 at 7:08=E2=80=AFPM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> On Thu, Sep 28, 2023 at 11:13=E2=80=AFAM Polampalli, Archana via
> lists.openembedded.org <archana.polampalli=3D
> windriver.com@lists.openembedded.org> wrote:
>
>> Update to latest release of latest LTS 20 release
>>
>>     * node v20 introduces several new features and fixes many bugs and
>> CVEs as shown in [1]
>>
>>     * Refresh 0001-liftoff-Correct-function-signatures.patch against
>> 20.5.1
>>
>>     * License-Update:
>>        - Change zlib version 1.2.13, October 13th, 2022 to version
>> 1.2.13.1, October xxth, 2022 [2]
>>        - Change Copyright 2023 from Ada authors to Yagiz Nizipli and
>> Daniel Lemire [4]
>>
>>     * Remove big-endian.patch as it is merged in v20.x [5] [6]
>>
>>     * Remove below list of patches since mips32 is deleted from v8 as
>> part of update V8 to 10.7.193.13 [7] [8]
>>        - mips-less-memory.patch
>>        - 0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
>>
>>     * Update Using-native-binaries.patch for node_js2c, it resolved belo=
w
>> do_compile error [9]
>>        Error:
>>        /bin/sh: line 1:
>> build/tmp/work/core2-64-poky-linux/nodejs/20.5.1/node-v20.5.1/out/Releas=
e/node_js2c:
>> No such file or directory
>>
>>     * Remove obsolete dtrace & etw configure options (we had:
>> --without-<feature>) from the recipe [10]
>
>
> FYI: (in case someone else are seeing similar issues now)
>
> With this upgrade I'm seeing some files created during the build with nod=
e
> not to be intercepted by pseudo and recorded in its database.
>
> This results in sstate_report_unihash failure, because appinfo.json is no=
w
> owned by 1026:1026 (my build UID/GID) instead of 0:0 as before:
>
> DEBUG: Executing python function sstate_report_unihash
> WARNING: KeyError in
> ./package/usr/palm/applications/com.webos.app.videoplayer/appinfo.json
> ERROR: Error executing a python function in exec_func_python()
> autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure
> was:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:sstate_report_unihash(d)
>      0003:
> File:
> '/OE/build/luneos-nanbield/openembedded-core/meta/classes-global/sstate.b=
bclass',
> lineno: 880, function: sstate_report_unihash
>      0876:    report_unihash =3D getattr(bb.parse.siggen, 'report_unihash=
',
> None)
>      0877:
>      0878:    if report_unihash:
>      0879:        ss =3D sstate_state_fromvars(d)
>  *** 0880:        report_unihash(os.getcwd(), ss['task'], d)
>      0881:}
>      0882:
>      0883:#
>      0884:# Shell function to decompress and prepare a package for
> installation
> File: '/OE/build/luneos-nanbield/bitbake/lib/bb/siggen.py', lineno: 659,
> function: report_unihash
>      0655:
>      0656:            if "." in self.method:
>      0657:                (module, method) =3D self.method.rsplit('.', 1)
>      0658:                locs['method'] =3D
> getattr(importlib.import_module(module), method)
>  *** 0659:                outhash =3D bb.utils.better_eval('method(path,
> sigfile, task, d)', locs)
>      0660:            else:
>      0661:                outhash =3D bb.utils.better_eval(self.method +
> '(path, sigfile, task, d)', locs)
>      0662:
>      0663:            try:
> File: '/OE/build/luneos-nanbield/bitbake/lib/bb/utils.py', lineno: 434,
> function: better_eval
>      0430:    if extraglobals:
>      0431:        ctx =3D copy.copy(ctx)
>      0432:        for g in extraglobals:
>      0433:            ctx[g] =3D extraglobals[g]
>  *** 0434:    return eval(source, ctx, locals)
>      0435:
>      0436:@contextmanager
>      0437:def fileslocked(files, *args, **kwargs):
>      0438:    """Context manager for locking and unlocking file locks."""
> File: '<string>', lineno: 1, function: <module>
>   File "<string>", line 1, in <module>
>
> File:
> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
> lineno: 649, function: OEOuthashBasic
>      0645:                process(root)
>      0646:            for f in files:
>      0647:                if f =3D=3D 'fixmepath':
>      0648:                    continue
>  *** 0649:                process(os.path.join(root, f))
>      0650:
>      0651:            for dir in dirs:
>      0652:                if os.path.islink(os.path.join(root, dir)):
>      0653:                    process(os.path.join(root, dir))
> File:
> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
> lineno: 588, function: process
>      0584:                    except KeyError as e:
>      0585:                        bb.warn("KeyError in %s" % path)
>      0586:                        msg =3D ("KeyError: %s\nPath %s is owne=
d
> by uid %d, gid %d, which doesn't match "
>      0587:                            "any user/group on target. This may
> be due to host contamination." % (e, path, s.st_uid, s.st_gid))
>  *** 0588:                        raise
> Exception(msg).with_traceback(e.__traceback__)
>      0589:
>      0590:                if include_timestamps:
>      0591:                    update_hash(" %10d" % s.st_mtime)
>      0592:
> File:
> '/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
> lineno: 582, function: process
>      0578:                    else:
>      0579:                        add_perm(stat.S_IXOTH, 'x')
>      0580:
>      0581:                    try:
>  *** 0582:                        update_hash(" %10s" %
> pwd.getpwuid(s.st_uid).pw_name)
>      0583:                        update_hash(" %10s" %
> grp.getgrgid(s.st_gid).gr_name)
>      0584:                    except KeyError as e:
>      0585:                        bb.warn("KeyError in %s" % path)
>      0586:                        msg =3D ("KeyError: %s\nPath %s is owne=
d
> by uid %d, gid %d, which doesn't match "
> Exception: Exception: KeyError: 'getpwuid(): uid not found: 1026'
> Path
> ./package/usr/palm/applications/com.webos.app.videoplayer/appinfo.json is
> owned by uid 1026, gid 1026, which doesn't match any user/group on target=
.
> This may be due to host contamination.
>
> martin@jama
> /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos.=
app.videoplayer
> $ sqlite3 0.0.1-12+git-nodejs-20/pseudo/files.db "select * from files whe=
re
> path like '%yer/appinfo.json'"
>
> 1107|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.w=
ebos.app.videoplayer/0.0.1-12+git/sstate-build-package/package/usr/palm/app=
lications/com.webos.app.videoplayer/appinfo.json|66305|41202418|1026|1026|3=
3188|0|0
>
> 1192|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.w=
ebos.app.videoplayer/0.0.1-12+git/sstate-build-package/packages-split/com.w=
ebos.app.videoplayer/usr/palm/applications/com.webos.app.videoplayer/appinf=
o.json|66305|41
> 202418|1026|1026|33188|0|0
>
> martin@jama
> /OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos.=
app.videoplayer
> $ sqlite3 0.0.1-12+git-nodejs-18/pseudo/files.db "select * from files whe=
re
> path like '%yer/appinfo.json'"
>
> 56|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.web=
os.app.videoplayer/0.0.1-12+git/image/usr/palm/applications/com.webos.app.v=
ideoplayer/appinfo.json|66305|42878067|0|0|33188|0|0
>
> 374|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.we=
bos.app.videoplayer/0.0.1-12+git/package/usr/palm/applications/com.webos.ap=
p.videoplayer/appinfo.json|66305|42878641|0|0|33188|0|0
>
> 459|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.we=
bos.app.videoplayer/0.0.1-12+git/packages-split/com.webos.app.videoplayer/u=
sr/palm/applications/com.webos.app.videoplayer/appinfo.json|66305|42878641|=
0|0|33188|0|0
>
> I'll provide more details when I debug this further.
>
> Regards,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105308):
> https://lists.openembedded.org/g/openembedded-devel/message/105308
> Mute This Topic: https://lists.openembedded.org/mt/101098430/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b39b86060803a889
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve narrowed this down to simple reproducer with webp=
ack creating pack with &quot;hello world&quot; as shown in:<div><a href=3D"=
https://github.com/shr-project/com.webos.app.minimal/tree/recipes">https://=
github.com/shr-project/com.webos.app.minimal/tree/recipes</a><br></div><div=
><br></div><div>Then with this reproducer I&#39;ve bisected it to nodejs-20=
.3.0 with libuv upgrade 1.45.0 which brings support for io_uring which does=
n&#39;t work with pseudo in:</div><div><a href=3D"https://github.com/libuv/=
libuv/pull/3952/commits/26c79a942b92573a1388c0ee8a6ad4397f009318">https://g=
ithub.com/libuv/libuv/pull/3952/commits/26c79a942b92573a1388c0ee8a6ad4397f0=
09318</a><br></div><div><br></div><div>Now we have 3 options:</div><div><br=
></div><div>1) either every use of nodejs-native where io_uring might be us=
ed (like in webpack) needs to export=C2=A0UV_USE_IO_URING=3D0 before using =
node, but be aware that the PR says it&#39;s only temporary and this variab=
le might be removed in future. Unfortunately many people are lucky enough n=
ot to know what pseudo even is, so they might not realize that host-user-co=
ntamination QA issues or &quot;KeyError: &#39;getpwuid(): uid not found&quo=
t; might be related to this (and they probably won&#39;t find this e-mail a=
s well).</div><div><br></div><div>2) revert the io_uring changes from bundl=
ed libuv, I&#39;ve already verified this with nodejs-20.3.0, for 20.8.1 it =
would need couple more commits to be reverted as 20.8.1 uses even newer lib=
uv-1.46.0. The changes are massive and it will be PIA to update them for ev=
ery nodejs release, patch for keeping UV_USE_IO_URING support after it&#39;=
s removed from upstream libuv will be much smaller, but PIA to use=C2=A0UV_=
USE_IO_URING whenever using nodejs-native during build.</div><div><br></div=
><div>3) fix pseudo to correctly work with io_uring calls, definitely best =
long-term solution as more and more tools will now switch to io_uring, but =
without active maintainer of pseudo it might be _very_ difficult to impleme=
nt this and there aren&#39;t many people willing to touch this beast.</div>=
<div><br></div><div>Any opinions?</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 2, 2023 at 7:08=E2=80=AF=
PM Martin Jansa via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr">On Thu, Sep 28, 2023 at 11:13=E2=80=AFAM Polampalli, Arch=
ana via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.o=
penembedded.org</a> &lt;archana.polampalli=3D<a href=3D"mailto:windriver.co=
m@lists.openembedded.org" target=3D"_blank">windriver.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Update to latest release of latest LTS 20 =
release<br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105308): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105308" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105308</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101098430/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101098430/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b39b86060803a889--

