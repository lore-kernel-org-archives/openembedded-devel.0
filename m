Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C0EC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 16:48:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.51293.1669394902523270742
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 08:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GxPjvFWF;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso3819689wmo.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bSa9CYmRID5tag24O9NAf8yWoReAGdIaimJDTlgVkls=;
        b=GxPjvFWF8sW944l66eFKv5XXEMasbl2XRqhX+azFjEW5J6a/Mcpssba8PpXGYQ4Qa5
         y7hrcPI/7R/UJLjGUZFu+DvKvXaUK1s5PScT03xZy6jy1OJsvu1K5Lj21LxWpmUS7k6N
         OporaxQJDmW/SqEuyFFHP9YLHh4QFsQ1cB3vNoP3sVIahM+/zdhZydu8txDRzW4ElNHu
         9sxzZDh5V7KwhK9/44uF4cQ8ibztG7z5VCac+KcfHVlof3xMFCgN9i3efLxGNt+Uies9
         KlxWz1ROgehPFAngcGMZyFopBQw+/gAaglKPQ0mckfzi9YjJbEtMqr1ldcrd/uYhOKK/
         2mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSa9CYmRID5tag24O9NAf8yWoReAGdIaimJDTlgVkls=;
        b=uUjaoTDUOVhujCgfUrCVw1qGFlrpxCMmZeqRttBgqtCUpDy630yaIeGSInUYb58rSV
         NRADzdIgrtTVm17177kkC2khgN/e4HqcrjCJXD3jQQqKCesdF1fSwfpuKIjyqN3VHxHO
         dcm0a7x3xoRZ/SZ8KQ0/dc1pPLic+0mEe7jWg68mMdOxmCeXa6qvAbzDwxBaJ6HyBMyH
         6PhqK61sVnREY0IwYlQVTZOSvD2S+3JWEp3d7kOuy2vIGVt0KcRuFZ6tEWVO2M5CiGBL
         iCN16OaSyd76VEzqVk+3UzEYhZDvLZhqgmp8jxAa43c/edq642z4dz/d9ipBpNjvew+R
         lnrA==
X-Gm-Message-State: ANoB5pnot5ayY9ftCtnGwtuvz35wEgOgMo2HNgcIV3vOsa0mjjAZ7mYC
	5KGOBoSzsyuk+1YN3okPSlyjxv1KF2I57IaNh3Y=
X-Google-Smtp-Source: AA0mqf65DOj8wulC+3N8L1X3ZtDFvKuPWBUp4+jmwurr/tCrVEY65LhHp+ajKQN4/TDKaFVsPQs95eZsY3a8rg0+5y8=
X-Received: by 2002:a7b:cb4d:0:b0:3cf:b2a6:267d with SMTP id
 v13-20020a7bcb4d000000b003cfb2a6267dmr28807332wmj.67.1669394900804; Fri, 25
 Nov 2022 08:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
 <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
 <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com> <172A9B76A49D60E9.11309@lists.openembedded.org>
In-Reply-To: <172A9B76A49D60E9.11309@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Nov 2022 17:48:07 +0100
Message-ID: <CA+chaQeTzsGnx0YFcFPRjV12euPtbK5OEb4u0N5zQqhVbhDyDQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
To: Martin.Jansa@gmail.com
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	"Polampalli, Archana" <archana.polampalli@windriver.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
Content-Type: multipart/alternative; boundary="0000000000000d6a9105ee4e4ae0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 16:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99734

--0000000000000d6a9105ee4e4ae0
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 24, 2022 at 8:19 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> There is one more failing from public layer:
>
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-webos/localization-tool/localization-tool-native.bb
> but that's different issue, caused by the sysroot_stage_all:append() and
> new nodejs now installing node_gyp_bins with symlink to python3 causing:
>
> ERROR: localization-tool-native-1.7.0-r7 do_populate_sysroot: sstate found
> an absolute path symlink
> /OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/sysroot-destdir/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/recipe-sysroot-native/opt/js-loctool/node_modules/node-expat/build/node_gyp_bins/python3
> pointing at /OE/hosttools/python3. Please replace this with a relative link.
>
> But I haven't narrowed it down yet to see which exact nodejs/npm change
> caused this.
>

This change was introduced in:
https://github.com/nodejs/node-gyp/commit/b9ddcd5bbd93b05b03674836b6ebdae2c2e74c8c


and again, not sure how many node recipes might get broken by this, in my
layers it was just one (and as work around I've deleted this new
node_gyp_bins directory for now).

--0000000000000d6a9105ee4e4ae0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Nov 24, 2022 at 8:19 PM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:</div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div>There is one more failing from public layer:</di=
v><div><a href=3D"https://github.com/webosose/meta-webosose/blob/master/met=
a-webos/recipes-webos/localization-tool/localization-tool-native.bb" target=
=3D"_blank">https://github.com/webosose/meta-webosose/blob/master/meta-webo=
s/recipes-webos/localization-tool/localization-tool-native.bb</a><br></div>=
<div>but that&#39;s different issue, caused by the=C2=A0sysroot_stage_all:a=
ppend() and new nodejs now installing=C2=A0node_gyp_bins with symlink to py=
thon3 causing:</div><div><br><span style=3D"color:rgb(0,0,0);font-family:Ro=
boto,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,=
sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;S=
egoe UI Symbol&quot;;font-size:14px;white-space:pre-wrap">ERROR: localizati=
on-tool-native-1.7.0-r7 do_populate_sysroot: sstate found an absolute path =
symlink /OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/sysroot-des=
tdir/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/recipe-sysroot-=
native/opt/js-loctool/node_modules/node-expat/build/node_gyp_bins/python3 p=
ointing at /OE/hosttools/python3. Please replace this with a relative link.=
</span><br></div><div><br></div><div>But I haven&#39;t narrowed it down yet=
 to see which exact nodejs/npm change caused this.</div></div></div></block=
quote><div><br></div><div>This change was introduced in:</div><div><a href=
=3D"https://github.com/nodejs/node-gyp/commit/b9ddcd5bbd93b05b03674836b6ebd=
ae2c2e74c8c">https://github.com/nodejs/node-gyp/commit/b9ddcd5bbd93b05b0367=
4836b6ebdae2c2e74c8c</a>=C2=A0</div><div><br></div><div>and again, not sure=
 how many node recipes might get broken by this, in my layers it was just o=
ne (and as work around I&#39;ve deleted this new node_gyp_bins directory fo=
r now).</div></div></div>

--0000000000000d6a9105ee4e4ae0--

