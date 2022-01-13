Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBA2C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 08:14:05 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.6290.1642061645478991200
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 00:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JoSgAMMh;
 spf=pass (domain: gmail.com, ip: 209.85.166.53,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id w9so7322492iol.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 00:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PkJ3dyFnCbHWUrefLhOdyqYEBIxF8orbrXlePwJHSIA=;
        b=JoSgAMMhFYbgkIttMSk1J3gm6D/c9I57EPPQxuXjugONizFPCt79xbgmew/aQzCXVN
         AWnA5NfQORyhCssHqP+EC7QeUN/QLCGOpfdgPmWXcf2UouanTMdL+vRIp0OdgIrQ63YM
         3e538SuHZnHWiL7F5lkhBIqTYdM5uMJSfaqQUXvROGtQ7b0fTArtU9BKMbY1/+IQQc9c
         XbbQWBdeuKitTRnllhCulBH0g5heTH711Qx0si0kIFwirdgBUvosaH71v2nkoOHm/ZWm
         ebB+d8M8vXBrkeSMWkZPDqxtCToaT6ZLCRDrBQXJQ4/3RR75Do4SviPSzeLnwCtUdsyL
         BfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PkJ3dyFnCbHWUrefLhOdyqYEBIxF8orbrXlePwJHSIA=;
        b=KCMqxdOm/CNKo/VQv9dOFWez/XUQsD68v0K1C1paHY0GH7ZvH6FIVzrKEg1iHQKDz2
         a4zEBo6BhPxjsGQPPq2vioL7KN1v4m5sYZH37V03ifWlE9DwzWq7qBa3k32lc4W0Ybln
         Y2IB6JRARevL8Cp8VLgHexzCaYkL0hR+xfzuNxtIKC6o27cuo+KsO9Q9r3wp7IRYlBVR
         f+/zhSqSIHkE9wa4n1PKsTIont/7EIs2CfxrqN/shEHP08G1QLtQ6TlHUUY+U+sMuvDP
         YpRqHvzg3Y1i7Vcvk3i7/PcIjgPqdt2AZLi012ePvFLmiWadNBp3iMdIbZxLNnqpfgeb
         DRIw==
X-Gm-Message-State: AOAM530u7I1/zTQ1l1/Qw3BjrkXX+e30n+NndPhZgENv6UaGSMCGF9SA
	AUQUFmSpccoS9sFUC84vF0E7xyVRF/6kBMd0u3w=
X-Google-Smtp-Source: 
 ABdhPJxFiSk240CoA6zySVGXhYF77OrjQQOMK7icNK7N7OhhFggdNWL/HIW8xEwqnNHzGyTmu9i1uqyGMMNddk5XP7U=
X-Received: by 2002:a05:6638:32a5:: with SMTP id
 f37mr1451159jav.208.1642061644886;
 Thu, 13 Jan 2022 00:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20220112091529.4853-1-nishaparrakat@gmail.com>
 <dd63dd36-1b3d-7f1a-b77d-b090f02ba93b@gmail.com>
In-Reply-To: <dd63dd36-1b3d-7f1a-b77d-b090f02ba93b@gmail.com>
From: Nisha Parrakat <nishaparrakat@gmail.com>
Date: Thu, 13 Jan 2022 09:13:54 +0100
Message-ID: 
 <CAMR+Pi=4GxfiME691_DTZTXkdmJqcuZ-qDWVaAK1yeb7KyS13g@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH 1/2] nodejs_12.21.0.bb: only handle npm
 if configured
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000af44205d5724564"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 08:14:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94803

--0000000000000af44205d5724564
Content-Type: text/plain; charset="UTF-8"

Sorry Sent for dunfell again now.

regards
Nisha

On Wed, 12 Jan 2022 at 18:28, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 1/12/22 1:15 AM, Nisha Parrakat wrote:
> > npm-cli.js should be symlinked only when the file is present
> > the file may not be available if the configure option is --without-npm
> >
> > Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> > ---
> >   meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb | 8 ++++++--
>
>
> we do not have nodejs 12.21.0 on master, is it meant for some other
> release branch ?
>
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> > index b9e382177..22191a157 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> > @@ -133,7 +133,9 @@ do_install_append_class-native() {
> >       # /usr/bin/npm is symlink to
> /usr/lib/node_modules/npm/bin/npm-cli.js
> >       # use sed on npm-cli.js because otherwise symlink is replaced with
> normal file and
> >       # npm-cli.js continues to use old shebang
> > -    sed "1s^.*^#\!/usr/bin/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> > +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js"
> ]]; then
> > +        sed "1s^.*^#\!/usr/bin/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> > +    fi
> >
> >       # Install the native binaries to provide it within sysroot for the
> target compilation
> >       install -d ${D}${bindir}
> > @@ -147,7 +149,9 @@ do_install_append_class-native() {
> >   }
> >
> >   do_install_append_class-target() {
> > -    sed "1s^.*^#\!${bindir}/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> > +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js"
> ]]; then
> > +        sed "1s^.*^#\!${bindir}/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> > +    fi
> >   }
> >
> >   PACKAGES =+ "${PN}-npm"
>

--0000000000000af44205d5724564
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry Sent for dunfell again now.</div><div><br></div=
><div>regards</div><div>Nisha <br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 12 Jan 2022 at 18:28, Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 1/12/22 1:15 AM, Nisha Parrakat wrote:<br>
&gt; npm-cli.js should be symlinked only when the file is present<br>
&gt; the file may not be available if the configure option is --without-npm=
<br>
&gt; <br>
&gt; Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:nishaparrakat@gmai=
l.com" target=3D"_blank">nishaparrakat@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_1=
2.21.0.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_12.21.0.bb</a> | 8 +=
+++++--<br>
<br>
<br>
we do not have nodejs 12.21.0 on master, is it meant for some other <br>
release branch ?<br>
<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_=
12.21.0.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_12.21.0.bb</a> b/me=
ta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_12.21.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">nodejs_12.21.0.bb</a><br>
&gt; index b9e382177..22191a157 100644<br>
&gt; --- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_12.21.0=
.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_12.21.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_12.21.0=
.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_12.21.0.bb</a><br>
&gt; @@ -133,7 +133,9 @@ do_install_append_class-native() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# /usr/bin/npm is symlink to /usr/lib/node_m=
odules/npm/bin/npm-cli.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# use sed on npm-cli.js because otherwise sy=
mlink is replaced with normal file and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# npm-cli.js continues to use old shebang<br=
>
&gt; -=C2=A0 =C2=A0 sed &quot;1s^.*^#\!/usr/bin/env node^g&quot; -i ${D}${e=
xec_prefix}/lib/node_modules/npm/bin/npm-cli.js<br>
&gt; +=C2=A0 =C2=A0 if [[ -f &quot;${D}${exec_prefix}/lib/node_modules/npm/=
bin/npm-cli.js&quot; ]]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;1s^.*^#\!/usr/bin/env node^g&qu=
ot; -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Install the native binaries to provide it =
within sysroot for the target compilation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
&gt; @@ -147,7 +149,9 @@ do_install_append_class-native() {<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_install_append_class-target() {<br>
&gt; -=C2=A0 =C2=A0 sed &quot;1s^.*^#\!${bindir}/env node^g&quot; -i ${D}${=
exec_prefix}/lib/node_modules/npm/bin/npm-cli.js<br>
&gt; +=C2=A0 =C2=A0 if [[ -f &quot;${D}${exec_prefix}/lib/node_modules/npm/=
bin/npm-cli.js&quot; ]]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;1s^.*^#\!${bindir}/env node^g&q=
uot; -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGES =3D+ &quot;${PN}-npm&quot;<br>
</blockquote></div>

--0000000000000af44205d5724564--

