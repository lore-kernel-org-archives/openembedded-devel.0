Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57374C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 19:19:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.31903.1669317545331541310
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 11:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BvVXJT1y;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id n3so3767458wrp.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 11:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2yj79P4tcdUA/lqp63afMLebkqb12Dg7nX8PldIMfT0=;
        b=BvVXJT1yLVx4IBOdT5JPfVfdG4Z8NxtM93QX6q7fr9TNnpgZlQ2XJE2sY1J260U443
         M+R0EOE3ZoZaRdEeUWiNCBzQq948nD/ue0luPyjtXbrFhFTtRGZENVQcSpttI5reeMYh
         PY4wfTre9+x9IlUP3JVxsKOvrta972aohnz60QHVt6/SWNsDSv90+CXgp3wfX6rEpgVP
         c0oMABZaZyQ/9r9PnK5gn6iFRslEtClCu8Dd3j9PK42I4nYl0J89nIZtUVxv6AnEx9aN
         Pd+rqVwj7eK61aGnUrk75G5A0n8eaTARr0Q5fLSZMNKkShoeW/jPcsXPVnX4ItnY+fad
         FXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yj79P4tcdUA/lqp63afMLebkqb12Dg7nX8PldIMfT0=;
        b=sqW0xexqy9HV1ptN30RzO+o6Le8FOtTKPnr8nk/2bnou92o0M+0gVdQFcCUZBi1bkB
         YauguDZMLoaOXAHGL3t/t1IPISJaoLG+lOX64lOclJijilUNYYE55UAxs8Y0j/RZA4Oq
         Nl1uoeI8fPZh2PXNaL3+gGT+TrQJKY4YR9w3lsgi5QTv51zvBdv5VKJ6oZGlWr0kqD9B
         ZrzejZflapiSUr3Tx+u9mkQLV1P0fl/kvNFwvNxAywuN0ya1HlV6yUGgssnrYHvAqg/L
         k2LbDOnHPX/6nyas2u6HNpC0MWItY/FnQdjc2GXRQE/NYoigACJzWBdQdgBm6UBeioo5
         URAQ==
X-Gm-Message-State: ANoB5plJvzBk753Cy+mbhM+vEyq6hwoqmPD4zIS+Yd2jbPcn4hHQfowL
	jdXEq2haM3NV2GDt8Nbk9T+AG7/KNX2++CSWlZU=
X-Google-Smtp-Source: AA0mqf4nfNMRN0fksQ3oQlkJN+qMcrEw5yRMw0aEi+vWJfzCZybZ0QTuUFPiNY/o387Vxxl6lsf5s4OxVAnVj76gRgA=
X-Received: by 2002:adf:bb04:0:b0:241:f868:578e with SMTP id
 r4-20020adfbb04000000b00241f868578emr4121032wrg.516.1669317543431; Thu, 24
 Nov 2022 11:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
 <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com> <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com>
In-Reply-To: <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 24 Nov 2022 20:18:51 +0100
Message-ID: <CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Polampalli, Archana" <archana.polampalli@windriver.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
Content-Type: multipart/alternative; boundary="00000000000031933305ee3c47f0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 19:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99722

--00000000000031933305ee3c47f0
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 24, 2022 at 7:06 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Add Armin to ensure he seems this once he recovers from US Thanksgiving
> indulgences.
>
> On 2022-11-24 12:05, Martin Jansa wrote:
>
> I see this is now queued in kirkstone-next
>
> https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&id=08b6b6846a84d9a0459f42d1d730c9ea1d50c43f
> <https://urldefense.com/v3/__https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&id=08b6b6846a84d9a0459f42d1d730c9ea1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDWE$>
>
> I see bunch of recipes failing since this upgrade landed in master, mostly
> due to npm dependency resolution being more strict now and builds failing
> with
>
> npm ERR! code ERESOLVE
> npm ERR! ERESOLVE could not resolve
> ...
> npm ERR! Fix the upstream dependency conflict, or retry
> npm ERR! this command with --force, or --legacy-peer-deps
> npm ERR! to accept an incorrect (and potentially broken) dependency
> resolution.
>
> Can we please delay backporting to kirkstone and langdale a bit more?
>
> Seconded!
>
> What recipes encounters this bug?
>

I've seen it in ~10 recipes, but all are internal and not available in any
public layer. I've added --force to them as work around to see how many
other recipes will start failing now.

There is one more failing from public layer:
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-webos/localization-tool/localization-tool-native.bb
but that's different issue, caused by the sysroot_stage_all:append() and
new nodejs now installing node_gyp_bins with symlink to python3 causing:

ERROR: localization-tool-native-1.7.0-r7 do_populate_sysroot: sstate found
an absolute path symlink
/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/sysroot-destdir/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/recipe-sysroot-native/opt/js-loctool/node_modules/node-expat/build/node_gyp_bins/python3
pointing at /OE/hosttools/python3. Please replace this with a relative link.

But I haven't narrowed it down yet to see which exact nodejs/npm change
caused this. And yes this recipe has other issues as well and doesn't even
use npm.bbclass nor npmsw:// fetcher.


> And if others are seeing similar failures please share them here as well.
>
> The older nodejs was using npm@8.5.0, now its npm@8.19.2 more details
> about this change in behavior from 8.6.0 in
> https://github.com/npm/cli/issues/4998
> <https://urldefense.com/v3/__https://github.com/npm/cli/issues/4998__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMZmTsAyk$>
>
>
> Someone in the linked issue thread said:
>
>        "We rolled back to Node v16.15.0, which has a working version of
> npm 8.5.5."
>
> Should we drop the 16.18.x update and stick with 16.15.1 for
> kirkstone/langdale?
>

I don't mind keeping it in master, once I figure out how to fix it in
master I wouldn't mind it getting backported to kirkstone and langdale as
well.

This was just warning that this isn't just simple minor upgrade for some
and at least some longer delay would be useful.


> For master, I'd like to update to 18, 19, or ideally 20 if it's available
> before the end of M3.
>
> Martin,
>
> What version of node make sense to you for master?
>

I don't have strong opinion, we have a lot of ugly npm/nodejs recipes in
webOS which need to be re-worked first, independently on nodejs version
used.

> Do you agree that we should leave master on 16.18.x and people should fix
> their
> 'broken' npm dependencies?
>

Yes, from that npm bug it looks, that the old behavior was even worse than
the current clear failure and the --force as work around seems to work
reasonably well, so I don't mind keeping it in master and even eventually
backporting it to kirkstone a bit later.

Cheers,

--00000000000031933305ee3c47f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Nov 24, 2022 at 7:06 PM Randy Mac=
Leod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windr=
iver.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">

 =20
  <div>
    <div>Add Armin to ensure he seems this once
      he recovers from US Thanksgiving indulgences.</div>
    <div><br>
    </div>
    <div>On 2022-11-24 12:05, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>I see this is now queued in kirkstone-next</div>
        <div><a href=3D"https://urldefense.com/v3/__https://git.openembedde=
d.org/meta-openembedded/commit/?h=3Dkirkstone-next&amp;id=3D08b6b6846a84d9a=
0459f42d1d730c9ea1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0M=
AiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDWE$" target=3D"_bla=
nk">https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-ne=
xt&amp;id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f</a><br>
        </div>
        <div><br>
        </div>
        I see bunch of recipes failing since this upgrade landed in
        master, mostly due to npm dependency resolution being more
        strict now and builds failing with
        <div><br>
        </div>
        <div>npm ERR! code ERESOLVE<br>
          npm ERR! ERESOLVE could not resolve<br>
        </div>
        <div>...</div>
        <div>npm ERR! Fix the upstream dependency conflict, or retry<br>
          npm ERR! this command with --force, or --legacy-peer-deps<br>
          npm ERR! to accept an incorrect (and potentially broken)
          dependency resolution.<br>
        </div>
        <div><br>
        </div>
        <div>Can we please delay backporting to kirkstone and langdale a
          bit more?</div>
      </div>
    </blockquote>
    <p>Seconded!</p>
    <p>What recipes encounters this bug?<br></p></div></blockquote><div><br=
></div><div>I&#39;ve seen it in ~10 recipes, but all are internal and not a=
vailable in any public layer. I&#39;ve added --force to them as work around=
 to see how many other recipes will start failing now.</div><div><br></div>=
<div>There is one more failing from public layer:</div><div><a href=3D"http=
s://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-webos/=
localization-tool/localization-tool-native.bb">https://github.com/webosose/=
meta-webosose/blob/master/meta-webos/recipes-webos/localization-tool/locali=
zation-tool-native.bb</a><br></div><div>but that&#39;s different issue, cau=
sed by the=C2=A0sysroot_stage_all:append() and new nodejs now installing=C2=
=A0node_gyp_bins with symlink to python3 causing:</div><div><br class=3D"gm=
ail-Apple-interchange-newline"><span style=3D"color:rgb(0,0,0);font-family:=
Roboto,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Aria=
l,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot=
;Segoe UI Symbol&quot;;font-size:14px;white-space:pre-wrap">ERROR: localiza=
tion-tool-native-1.7.0-r7 do_populate_sysroot: sstate found an absolute pat=
h symlink /OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/sysroot-d=
estdir/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/recipe-sysroo=
t-native/opt/js-loctool/node_modules/node-expat/build/node_gyp_bins/python3=
 pointing at /OE/hosttools/python3. Please replace this with a relative lin=
k.</span><br></div><div><br></div><div>But I haven&#39;t narrowed it down y=
et to see which exact nodejs/npm change caused this. And yes this recipe ha=
s other issues as well and doesn&#39;t even use npm.bbclass nor npmsw:// fe=
tcher.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div><blockquote type=3D"cite"><div dir=3D"ltr"><div><br>
        </div>
        <div>And if others are seeing similar failures please share them
          here as well.</div>
        <div><br>
        </div>
        <div>The older nodejs was using=C2=A0<a href=3D"mailto:npm@8.5.0" t=
arget=3D"_blank">npm@8.5.0</a>, now its <a href=3D"mailto:npm@8.19.2" targe=
t=3D"_blank">npm@8.19.2</a>
          more details about this change in behavior from 8.6.0 in=C2=A0<a =
href=3D"https://urldefense.com/v3/__https://github.com/npm/cli/issues/4998_=
_;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaC=
xBstk-GtvN-eKnWtaUipHYjAMZmTsAyk$" target=3D"_blank">https://github.com/npm=
/cli/issues/4998</a></div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Someone in the linked issue thread said:<br>
    </p>
    <p dir=3D"auto">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;We rolled ba=
ck to Node v16.15.0, which has a
      working version of npm 8.5.5.&quot;</p>
    <p dir=3D"auto">Should we drop the 16.18.x update and stick with
      16.15.1 for kirkstone/langdale?</p></div></blockquote><div><br></div>=
<div>I don&#39;t mind keeping it in master, once I figure out how to fix it=
 in master I wouldn&#39;t mind it getting backported to kirkstone and langd=
ale as well.</div><div><br></div><div>This was just warning that this isn&#=
39;t just simple minor upgrade for some and at least some longer delay woul=
d be useful.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><p dir=3D"auto"><br>
    </p>
    <p dir=3D"auto">For master, I&#39;d like to update to 18, 19, or ideall=
y
      20 if it&#39;s available before the end of M3.<br>
    </p>
    <p dir=3D"auto">Martin,<br>
    </p>
    <p dir=3D"auto">What version of node make sense to you for master?<br><=
/p></div></blockquote><div><br></div><div>I don&#39;t have strong opinion, =
we have a lot of ugly npm/nodejs recipes in webOS which need to be re-worke=
d first, independently on nodejs version used.=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><p dir=3D"auto">
      Do you agree that we should leave master on 16.18.x and people
      should fix their <br>
      &#39;broken&#39; npm dependencies?<br></p></div></blockquote><div><br=
></div><div>Yes, from that npm bug it looks, that the old behavior was even=
 worse than the current clear failure and the --force as work around seems =
to work reasonably well, so I don&#39;t mind keeping it in master and even =
eventually backporting it to kirkstone a bit later.</div><div><br></div><di=
v>Cheers,</div></div></div>

--00000000000031933305ee3c47f0--

