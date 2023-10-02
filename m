Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D45E748FC
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 17:08:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.87897.1696266506128744341
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 10:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGbNnxQp;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3247cefa13aso22427f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696266504; x=1696871304; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y/5wmDc6R6drjcYxZBwl7r1ien+i0ipOWy5i18r/muQ=;
        b=JGbNnxQp4c28n/KWa7KcrXejvig3pcW28Wd1+Yp7nWdIkReijARr/YKbyo60fZzJ4E
         Fp7K4WUe5DuR3JGI/fu6nWk98uXps5JpL4pWXdWw3+xevw1OEN9cIi0FUR291QlUZ7jt
         IgH7Wla3hcfdY0okHOPitHjzMK2agwAHexMtPnKt7E6dgF4DESdzunjzyy84teKaAzAh
         zfaZG9swyJRjVMAwt6RuudgMdZQkR53REy0OM2QV5ADnx1hAbx858eSwq5Wn/ymJvTRS
         LlLYGPrvV/iRc4xtRQCNfQQwPy4IP4hQljWznSYcJpDTIH8NSN1xo6LY9bSNmstxHkOD
         CN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696266504; x=1696871304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/5wmDc6R6drjcYxZBwl7r1ien+i0ipOWy5i18r/muQ=;
        b=GL4+Fm4qPgNvHSniNDMOc8+zUGVfOJuzKxu6zI7iW+66auXjBsDX00fV2RfogE6xAL
         M+Qn6b97NsgHXje1WjkhBlT+dcd3p4VGGEaZhjiPxaukbAzITARHWA05vzluNZUIQujZ
         IzliqXGDIHgl7NppJjnSfMI2HlEcg1SEigTDGh+Pk5HbhPaiacsz6Ufufon45cNjg/gv
         nb2G4HBIwpy+QD3nR7RoiMcj41O6FbTPI/5navqacTaHQelbIvDDk481bltL28Aig+ZI
         Y+qY/GpwtJrew8C/6SicLou9Fhgdkff7Dyv+FcJiJGK9QMV0Nqctc1fHZDAdRbG8rtQV
         grgg==
X-Gm-Message-State: AOJu0YyIwdt3wnDUYZc3+EPrNIcL2aFmzgpzU9zia4W6n6V+oOS9tlo6
	ANV/qxYmyFBxJYDs0hCqOLHAhv8a6avatnsAOzg=
X-Google-Smtp-Source: AGHT+IEBtQLYWiFOCL2Ef9/GCm67f1kW0icNSxs2BtE5cw30ozrTlex1L9aBEGqBIyzQ62n2/IbXB0QF8Tp8Pop/kGU=
X-Received: by 2002:a5d:45c4:0:b0:321:504a:bc9a with SMTP id
 b4-20020a5d45c4000000b00321504abc9amr9848621wrs.71.1696266504087; Mon, 02 Oct
 2023 10:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230928091304.4000026-1-archana.polampalli@windriver.com>
In-Reply-To: <20230928091304.4000026-1-archana.polampalli@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Oct 2023 19:08:12 +0200
Message-ID: <CA+chaQfcB59O8xDJiQW_rLWPz_zymU3YMxH8pqOsprLB0hNCfA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1
To: archana.polampalli@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006bc3360606bed244"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 17:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105308

--0000000000006bc3360606bed244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 11:13=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org <archana.polampalli=3D
windriver.com@lists.openembedded.org> wrote:

> Update to latest release of latest LTS 20 release
>
>     * node v20 introduces several new features and fixes many bugs and
> CVEs as shown in [1]
>
>     * Refresh 0001-liftoff-Correct-function-signatures.patch against 20.5=
.1
>
>     * License-Update:
>        - Change zlib version 1.2.13, October 13th, 2022 to version
> 1.2.13.1, October xxth, 2022 [2]
>        - Change Copyright 2023 from Ada authors to Yagiz Nizipli and
> Daniel Lemire [4]
>
>     * Remove big-endian.patch as it is merged in v20.x [5] [6]
>
>     * Remove below list of patches since mips32 is deleted from v8 as par=
t
> of update V8 to 10.7.193.13 [7] [8]
>        - mips-less-memory.patch
>        - 0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
>
>     * Update Using-native-binaries.patch for node_js2c, it resolved below
> do_compile error [9]
>        Error:
>        /bin/sh: line 1:
> build/tmp/work/core2-64-poky-linux/nodejs/20.5.1/node-v20.5.1/out/Release=
/node_js2c:
> No such file or directory
>
>     * Remove obsolete dtrace & etw configure options (we had:
> --without-<feature>) from the recipe [10]


FYI: (in case someone else are seeing similar issues now)

With this upgrade I'm seeing some files created during the build with node
not to be intercepted by pseudo and recorded in its database.

This results in sstate_report_unihash failure, because appinfo.json is now
owned by 1026:1026 (my build UID/GID) instead of 0:0 as before:

DEBUG: Executing python function sstate_report_unihash
WARNING: KeyError in
./package/usr/palm/applications/com.webos.app.videoplayer/appinfo.json
ERROR: Error executing a python function in exec_func_python()
autogenerated:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:sstate_report_unihash(d)
     0003:
File:
'/OE/build/luneos-nanbield/openembedded-core/meta/classes-global/sstate.bbc=
lass',
lineno: 880, function: sstate_report_unihash
     0876:    report_unihash =3D getattr(bb.parse.siggen, 'report_unihash',
None)
     0877:
     0878:    if report_unihash:
     0879:        ss =3D sstate_state_fromvars(d)
 *** 0880:        report_unihash(os.getcwd(), ss['task'], d)
     0881:}
     0882:
     0883:#
     0884:# Shell function to decompress and prepare a package for
installation
File: '/OE/build/luneos-nanbield/bitbake/lib/bb/siggen.py', lineno: 659,
function: report_unihash
     0655:
     0656:            if "." in self.method:
     0657:                (module, method) =3D self.method.rsplit('.', 1)
     0658:                locs['method'] =3D
getattr(importlib.import_module(module), method)
 *** 0659:                outhash =3D bb.utils.better_eval('method(path,
sigfile, task, d)', locs)
     0660:            else:
     0661:                outhash =3D bb.utils.better_eval(self.method +
'(path, sigfile, task, d)', locs)
     0662:
     0663:            try:
File: '/OE/build/luneos-nanbield/bitbake/lib/bb/utils.py', lineno: 434,
function: better_eval
     0430:    if extraglobals:
     0431:        ctx =3D copy.copy(ctx)
     0432:        for g in extraglobals:
     0433:            ctx[g] =3D extraglobals[g]
 *** 0434:    return eval(source, ctx, locals)
     0435:
     0436:@contextmanager
     0437:def fileslocked(files, *args, **kwargs):
     0438:    """Context manager for locking and unlocking file locks."""
File: '<string>', lineno: 1, function: <module>
  File "<string>", line 1, in <module>

File:
'/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
lineno: 649, function: OEOuthashBasic
     0645:                process(root)
     0646:            for f in files:
     0647:                if f =3D=3D 'fixmepath':
     0648:                    continue
 *** 0649:                process(os.path.join(root, f))
     0650:
     0651:            for dir in dirs:
     0652:                if os.path.islink(os.path.join(root, dir)):
     0653:                    process(os.path.join(root, dir))
File:
'/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
lineno: 588, function: process
     0584:                    except KeyError as e:
     0585:                        bb.warn("KeyError in %s" % path)
     0586:                        msg =3D ("KeyError: %s\nPath %s is owned =
by
uid %d, gid %d, which doesn't match "
     0587:                            "any user/group on target. This may
be due to host contamination." % (e, path, s.st_uid, s.st_gid))
 *** 0588:                        raise
Exception(msg).with_traceback(e.__traceback__)
     0589:
     0590:                if include_timestamps:
     0591:                    update_hash(" %10d" % s.st_mtime)
     0592:
File:
'/OE/build/luneos-nanbield/openembedded-core/meta/lib/oe/sstatesig.py',
lineno: 582, function: process
     0578:                    else:
     0579:                        add_perm(stat.S_IXOTH, 'x')
     0580:
     0581:                    try:
 *** 0582:                        update_hash(" %10s" %
pwd.getpwuid(s.st_uid).pw_name)
     0583:                        update_hash(" %10s" %
grp.getgrgid(s.st_gid).gr_name)
     0584:                    except KeyError as e:
     0585:                        bb.warn("KeyError in %s" % path)
     0586:                        msg =3D ("KeyError: %s\nPath %s is owned =
by
uid %d, gid %d, which doesn't match "
Exception: Exception: KeyError: 'getpwuid(): uid not found: 1026'
Path ./package/usr/palm/applications/com.webos.app.videoplayer/appinfo.json
is owned by uid 1026, gid 1026, which doesn't match any user/group on
target. This may be due to host contamination.

martin@jama
/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos.ap=
p.videoplayer
$ sqlite3 0.0.1-12+git-nodejs-20/pseudo/files.db "select * from files where
path like '%yer/appinfo.json'"
1107|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.web=
os.app.videoplayer/0.0.1-12+git/sstate-build-package/package/usr/palm/appli=
cations/com.webos.app.videoplayer/appinfo.json|66305|41202418|1026|1026|331=
88|0|0
1192|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.web=
os.app.videoplayer/0.0.1-12+git/sstate-build-package/packages-split/com.web=
os.app.videoplayer/usr/palm/applications/com.webos.app.videoplayer/appinfo.=
json|66305|41
202418|1026|1026|33188|0|0

martin@jama
/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos.ap=
p.videoplayer
$ sqlite3 0.0.1-12+git-nodejs-18/pseudo/files.db "select * from files where
path like '%yer/appinfo.json'"
56|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webos=
.app.videoplayer/0.0.1-12+git/image/usr/palm/applications/com.webos.app.vid=
eoplayer/appinfo.json|66305|42878067|0|0|33188|0|0
374|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webo=
s.app.videoplayer/0.0.1-12+git/package/usr/palm/applications/com.webos.app.=
videoplayer/appinfo.json|66305|42878641|0|0|33188|0|0
459|/OE/build/luneos-nanbield/tmp-glibc/work/corei7-64-webos-linux/com.webo=
s.app.videoplayer/0.0.1-12+git/packages-split/com.webos.app.videoplayer/usr=
/palm/applications/com.webos.app.videoplayer/appinfo.json|66305|42878641|0|=
0|33188|0|0

I'll provide more details when I debug this further.

Regards,

--0000000000006bc3360606bed244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, Sep 28, 2023 at =
11:13=E2=80=AFAM Polampalli, Archana via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;archana.polampalli=3D<a href=3D"mail=
to:windriver.com@lists.openembedded.org">windriver.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Update to latest release of latest LTS 20 rele=
ase<br>
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

--0000000000006bc3360606bed244--

