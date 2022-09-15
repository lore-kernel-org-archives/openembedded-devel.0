Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B93ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 06:18:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.6997.1663222683095007042
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 23:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OsdhqM4s;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so3253164wmb.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 23:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zr3+Xk6KEWHx0XZouU7nRuEVd4kEaVAutHr60mmG1pk=;
        b=OsdhqM4s+pX6EpgXWe/O01X+Gy+r+XiFyp6XyrxP/iEZSG8RPHUckRjvlihxcgWnka
         56H5gjX0VSoLXw7sRliq65tybsMxec9oDlg7a0Ozp5PUeoEHj2oWb3aI+R7MGL2x9SvE
         MWQ5QW0sGqfi/41meFNrYS0NFB273RUHMcvGfkN+4xDYGFwc66iolHFcmoHx9khM9i4l
         n10WTqZVS/PO7SGmel7EuUWC5gBKxQvSxlWScZYWo8XreM4RphuQ83plr/xy9Y+426Fz
         rO1xLYErbSm3i9Hjwl0+Jt2kJbpaAebsIrx6X+RiRbAuKr31sjTUSjLKIGXRqSwTdvuY
         8g5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zr3+Xk6KEWHx0XZouU7nRuEVd4kEaVAutHr60mmG1pk=;
        b=2HjW0+kihF2t7ZQTiWI15QLKiioa0xXI18MM9rf6Tar9KyDhpr11vHzl530j9IAgB4
         sZaqmnTyiMy/QPr6CbwuryMvqrrg5d9kwxGsbiS8OCF+J/5ElMLBeaxywhi5N1LGmyzq
         puGYoiyRxsaTFmjIiym6jR9ExC6A1JuyY5RZhBVajJMWjMDqpXPlehjEDowAjNbdGibA
         TlsQDoDpq/xc1gW2qrxCFeiu1iVxvSgwlB0tsoFMlQkk3KnWVjLQYu9hu8xUBaIbM34a
         6ok8n6JcCzrmEodTbTitjAQ0MRTnRDJcejETLmOdaaCJKAk5TZ9BVW6TY0zY6e1NPUrU
         dZMQ==
X-Gm-Message-State: ACgBeo2g8HhYor2dcD1p3YJXnupHX0FEnhUWz2J09tNkR3mkdfwHG6/r
	mMxddz6rrgD+mRTR1U9omq3BD+/oseZn2QZfsrE=
X-Google-Smtp-Source: 
 AA6agR7RB7x1/trabjP3zmJeO4C6PaPRxFzdSfFblFHIFqdCrOHTwKJHdD/nHFs8bl46SxWM1sezVvf5ccG7b/Xap3A=
X-Received: by 2002:a05:600c:418a:b0:3b4:6708:1e3b with SMTP id
 p10-20020a05600c418a00b003b467081e3bmr5427581wmh.67.1663222681347; Wed, 14
 Sep 2022 23:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220913153428.1610984-1-Martin.Jansa@gmail.com>
 <4f3c5ba3-9de9-2da7-04d5-f7873bcf9b30@gmail.com>
In-Reply-To: <4f3c5ba3-9de9-2da7-04d5-f7873bcf9b30@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Sep 2022 08:17:49 +0200
Message-ID: 
 <CA+chaQc6j59V1RShNOkmnqE-qd=cKhkGwWrX5siwiR+4u_rhtQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone] nodejs-oe-cache-native: initial checkin
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001aac5605e8b135d6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 06:18:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98814

--0000000000001aac5605e8b135d6
Content-Type: text/plain; charset="UTF-8"

oe-core kirkstone already added the dependency on it, so I guess it
justifies the exception

On Wed, Sep 14, 2022 at 10:19 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 9/13/22 11:34, Martin Jansa wrote:
> > From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> >
> > This implements an 'npm cache add' like functionality but allows to
> > specify the key of the data and sets metadata which are required to
> > find the data.
> >
> > It is used to cache information as done during 'npm install'.
> >
> > Keyformat and metadata are nodejs version specific.
>
> Isn't this adding a new recipe to a Stable branch?
>
> - armin
> >
> > Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77 +++++++++++++++++++
> >   .../nodejs/nodejs-oe-cache-native_16.14.bb    | 21 +++++
> >   2 files changed, 98 insertions(+)
> >   create mode 100755
> meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> >   create mode 100644 meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.14.bb
> >
> > diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> > new file mode 100755
> > index 0000000000..f596207648
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> > @@ -0,0 +1,77 @@
> > +#!/usr/bin/env node
> > +
> > +/// Usage: oe-npm-cache <cache-dir> <type> <key> <file-name>
> > +///    <type> ... meta - metainformation about package
> > +///               tgz  - tarball
> > +
> > +const process = require("node:process");
> > +
> > +module.paths.unshift("@@libdir@@/node_modules/npm/node_modules");
> > +
> > +const cacache = require('cacache')
> > +const fs = require('fs')
> > +
> > +// argv[0] is 'node', argv[1] is this script
> > +const cache_dir = process.argv[2]
> > +const type      = process.argv[3]
> > +const key       = process.argv[4]
> > +const file      = process.argv[5]
> > +
> > +const data = fs.readFileSync(file)
> > +
> > +// metadata content is highly nodejs dependent; when cache entries are
> not
> > +// found, place debug statements in
> 'make-fetch-happen/lib/cache/policy.js'
> > +// (CachePolicy::satisfies())
> > +const xlate = {
> > +    'meta': {
> > +     'key_prefix': 'make-fetch-happen:request-cache:',
> > +     'metadata': function() {
> > +         return {
> > +             time: Date.now(),
> > +             url:  key,
> > +             reqHeaders: {
> > +                 'accept': 'application/vnd.npm.install-v1+json; q=1.0,
> application/json; q=0.8, */*',
> > +             },
> > +             resHeaders: {
> > +                 "content-type": "application/json",
> > +                 "status": 200,
> > +             },
> > +             options: {
> > +                 compress: true,
> > +             }
> > +         };
> > +     },
> > +    },
> > +
> > +    'tgz': {
> > +     'key_prefix': 'make-fetch-happen:request-cache:',
> > +     'metadata': function() {
> > +         return {
> > +             time: Date.now(),
> > +             url:  key,
> > +             reqHeaders: {
> > +                 'accept': '*/*',
> > +             },
> > +             resHeaders: {
> > +                 "content-type": "application/octet-stream",
> > +                 "status": 200,
> > +             },
> > +             options: {
> > +                 compress: true,
> > +             },
> > +         };
> > +     },
> > +    },
> > +};
> > +
> > +const info = xlate[type];
> > +let opts = {}
> > +
> > +if (info.metadata) {
> > +    opts['metadata'] = info.metadata();
> > +}
> > +
> > +cacache.put(cache_dir, info.key_prefix + key, data, opts)
> > +    .then(integrity => {
> > +     console.log(`Saved content of ${key} (${file}).`);
> > +})
> > diff --git a/meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.14.bb b/meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.14.bb
> > new file mode 100644
> > index 0000000000..a61dd5018f
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
> > @@ -0,0 +1,21 @@
> > +DESCRIPTION = "OE helper for manipulating npm cache"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
> > +
> > +SRC_URI = "\
> > +    file://oe-npm-cache \
> > +"
> > +
> > +inherit native
> > +
> > +B = "${WORKDIR}/build"
> > +
> > +do_configure() {
> > +    sed -e 's!@@libdir@@!${libdir}!g' < '${WORKDIR}/oe-npm-cache' >
> '${B}/oe-npm-cache'
> > +}
> > +
> > +do_install() {
> > +    install -D -p -m 0755 ${B}/oe-npm-cache ${D}${bindir}/oe-npm-cache
> > +}
> > +
> > +RDEPENDS:${PN} = "nodejs-native"
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#98787):
> https://lists.openembedded.org/g/openembedded-devel/message/98787
> > Mute This Topic: https://lists.openembedded.org/mt/93657958/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> akuster808@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

--0000000000001aac5605e8b135d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">oe-core kirkstone already added the dependency on it, so I=
 guess it justifies the exception</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 14, 2022 at 10:19 PM akuster80=
8 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 9/13/22 11:34, Martin Jansa wrote:<br>
&gt; From: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma-chemnitz=
.de" target=3D"_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
&gt;<br>
&gt; This implements an &#39;npm cache add&#39; like functionality but allo=
ws to<br>
&gt; specify the key of the data and sets metadata which are required to<br=
>
&gt; find the data.<br>
&gt;<br>
&gt; It is used to cache information as done during &#39;npm install&#39;.<=
br>
&gt;<br>
&gt; Keyformat and metadata are nodejs version specific.<br>
<br>
Isn&#39;t this adding a new recipe to a Stable branch?<br>
<br>
- armin<br>
&gt;<br>
&gt; Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma=
-chemnitz.de" target=3D"_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0.../nodejs/<a href=3D"http://nodejs-oe-cache-native_16.14.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-native_16.14.bb</a=
>=C2=A0 =C2=A0 | 21 +++++<br>
&gt;=C2=A0 =C2=A02 files changed, 98 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100755 meta-oe/recipes-devtools/nodejs/nodejs-=
oe-cache-16.14/oe-npm-cache<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/<a href=
=3D"http://nodejs-oe-cache-native_16.14.bb" rel=3D"noreferrer" target=3D"_b=
lank">nodejs-oe-cache-native_16.14.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-=
npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-ca=
che<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..f596207648<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cac=
he<br>
&gt; @@ -0,0 +1,77 @@<br>
&gt; +#!/usr/bin/env node<br>
&gt; +<br>
&gt; +/// Usage: oe-npm-cache &lt;cache-dir&gt; &lt;type&gt; &lt;key&gt; &l=
t;file-name&gt;<br>
&gt; +///=C2=A0 =C2=A0 &lt;type&gt; ... meta - metainformation about packag=
e<br>
&gt; +///=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tgz=C2=A0 -=
 tarball<br>
&gt; +<br>
&gt; +const process =3D require(&quot;node:process&quot;);<br>
&gt; +<br>
&gt; +module.paths.unshift(&quot;@@libdir@@/node_modules/npm/node_modules&q=
uot;);<br>
&gt; +<br>
&gt; +const cacache =3D require(&#39;cacache&#39;)<br>
&gt; +const fs =3D require(&#39;fs&#39;)<br>
&gt; +<br>
&gt; +// argv[0] is &#39;node&#39;, argv[1] is this script<br>
&gt; +const cache_dir =3D process.argv[2]<br>
&gt; +const type=C2=A0 =C2=A0 =C2=A0 =3D process.argv[3]<br>
&gt; +const key=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D process.argv[4]<br>
&gt; +const file=C2=A0 =C2=A0 =C2=A0 =3D process.argv[5]<br>
&gt; +<br>
&gt; +const data =3D fs.readFileSync(file)<br>
&gt; +<br>
&gt; +// metadata content is highly nodejs dependent; when cache entries ar=
e not<br>
&gt; +// found, place debug statements in &#39;make-fetch-happen/lib/cache/=
policy.js&#39;<br>
&gt; +// (CachePolicy::satisfies())<br>
&gt; +const xlate =3D {<br>
&gt; +=C2=A0 =C2=A0 &#39;meta&#39;: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;key_prefix&#39;: &#39;make-fetch-happen:requ=
est-cache:&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;metadata&#39;: function() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time: Date.now(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url:=C2=A0 key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reqHeaders: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ac=
cept&#39;: &#39;application/vnd.npm.install-v1+json; q=3D1.0, application/j=
son; q=3D0.8, */*&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resHeaders: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;c=
ontent-type&quot;: &quot;application/json&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;s=
tatus&quot;: 200,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compres=
s: true,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 },<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 &#39;tgz&#39;: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;key_prefix&#39;: &#39;make-fetch-happen:requ=
est-cache:&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;metadata&#39;: function() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time: Date.now(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url:=C2=A0 key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reqHeaders: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ac=
cept&#39;: &#39;*/*&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resHeaders: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;c=
ontent-type&quot;: &quot;application/octet-stream&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;s=
tatus&quot;: 200,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compres=
s: true,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 },<br>
&gt; +};<br>
&gt; +<br>
&gt; +const info =3D xlate[type];<br>
&gt; +let opts =3D {}<br>
&gt; +<br>
&gt; +if (info.metadata) {<br>
&gt; +=C2=A0 =C2=A0 opts[&#39;metadata&#39;] =3D info.metadata();<br>
&gt; +}<br>
&gt; +<br>
&gt; +cacache.put(cache_dir, info.key_prefix + key, data, opts)<br>
&gt; +=C2=A0 =C2=A0 .then(integrity =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0console.log(`Saved content of ${key} (${file}).`)=
;<br>
&gt; +})<br>
&gt; diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs-=
oe-cache-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-ca=
che-native_16.14.bb</a> b/meta-oe/recipes-devtools/nodejs/<a href=3D"http:/=
/nodejs-oe-cache-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">node=
js-oe-cache-native_16.14.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a61dd5018f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs-oe-cach=
e-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-nat=
ive_16.14.bb</a><br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +DESCRIPTION =3D &quot;OE helper for manipulating npm cache&quot;<br>
&gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0;md=
5=3D89aea4e17d99a7cacdbeed46a0096b10&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 file://oe-npm-cache \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +inherit native<br>
&gt; +<br>
&gt; +B =3D &quot;${WORKDIR}/build&quot;<br>
&gt; +<br>
&gt; +do_configure() {<br>
&gt; +=C2=A0 =C2=A0 sed -e &#39;s!@@libdir@@!${libdir}!g&#39; &lt; &#39;${W=
ORKDIR}/oe-npm-cache&#39; &gt; &#39;${B}/oe-npm-cache&#39;<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 install -D -p -m 0755 ${B}/oe-npm-cache ${D}${bindir}/o=
e-npm-cache<br>
&gt; +}<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} =3D &quot;nodejs-native&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#98787): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/98787" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/98787</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93657958=
/3616698" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/93657958/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000001aac5605e8b135d6--

