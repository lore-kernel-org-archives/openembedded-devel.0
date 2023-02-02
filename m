Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B470C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 13:05:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.13911.1675343136468854377
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YSKTuh8I;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1329688wms.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 05:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nl8JAfWG7ghenubcXX7fABc5QijlxtvBfWJYLX2GGc=;
        b=YSKTuh8IdeTKLdxnsAF7MOKZJRNaw3wo0l2mwMhGnWsTbhon5efu38DQ7zeOnFmy0P
         6qoVf2p55LLAXhF6krgkKiZJX6b04qLuFSzX0F1CGzg/Bv9kEvMfoKaFdJIWBONUjz99
         o9EJXMA2GkPOx7XrrqgeEAIWlSdx5Pszk6PxTWSUmuI//kE0TRAqDjIj3r3GewkIhK0M
         acbiHET+umsqpVD13kyPVJo3KKBKQZ3NBCha0nVw1vS2vFZMpHGxzJX0HWJc2rGlYxnX
         IEoc6zFZV9xFgZkyCsLJTvm7Wl1fTz56a93SPf4ppxHqorvyxQjt+vpuQ1de7FJmOWMT
         QXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Nl8JAfWG7ghenubcXX7fABc5QijlxtvBfWJYLX2GGc=;
        b=73+n+w/dhJK1YfviQM32kEjtNCLcPLkSJdFolmwmoGM9Y/43isR+hQWh0J5kAcQ/4R
         nASBrJdwR4CSvWso8o1d8Lh1eN01a7LuXvith8KoDli9Fi1LKdl8vR5NDJjhKTJ9m6xr
         4NxMBe+VAuizK3/ka4fxBwGxTT88FkakkhP7jVTT+SVV4K8E6k8+23WDowF8JSmCTC1a
         mwQABGOiIdZO2fZR1dn097D/BC87TdWBq9gpBgz3hp8MpiSLSCmHSQqWw9Tncg6siuJC
         OUU1vGP+seRDU8uCH/CwV4jjpVwGt/70hopbMJr+ncBYvwFP83ptDw1aM4icYJqCYnvZ
         azJQ==
X-Gm-Message-State: AO0yUKXHebuImctTmmNAz/yHDwnIoP6VivlaEdNQQ+81yGsuSMsrrjcU
	Ardg/6ZUfP9hLNOG9wXIEeKwRWhJkQ3BT29woHA=
X-Google-Smtp-Source: AK7set+PNY6g7jt49z0cyEoB+BVVudXHCsN8ViIivkoSuQEzq5XLiE+awOxY1FOh9WS+5VAikir2xHxKU7/4C5temYo=
X-Received: by 2002:a1c:f209:0:b0:3db:f34:e9f2 with SMTP id
 s9-20020a1cf209000000b003db0f34e9f2mr168666wmc.102.1675343134602; Thu, 02 Feb
 2023 05:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20230202125924.3771885-1-akuster808@gmail.com>
In-Reply-To: <20230202125924.3771885-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 Feb 2023 14:05:20 +0100
Message-ID: <CA+chaQdFAQ8VH-FqcyKgTnoU4GJsXH+Ae_UM7eiibAcN7M3Vaw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] nodejs-oe-cache-native: initial checkin
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006a37dd05f3b7385b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100914

--0000000000006a37dd05f3b7385b
Content-Type: text/plain; charset="UTF-8"

How is this different from
https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone&id=035d9c61e81b32cb62706cfdbfae08b1bac7ae88
?

On Thu, Feb 2, 2023 at 1:59 PM Armin Kuster <akuster808@gmail.com> wrote:

> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>
> This implements an 'npm cache add' like functionality but allows to
> specify the key of the data and sets metadata which are required to
> find the data.
>
> It is used to cache information as done during 'npm install'.
>
> Keyformat and metadata are nodejs version specific.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 035d9c61e81b32cb62706cfdbfae08b1bac7ae88)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77 +++++++++++++++++++
>  .../nodejs/nodejs-oe-cache-native_16.14.bb    | 21 +++++
>  2 files changed, 98 insertions(+)
>  create mode 100755
> meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>  create mode 100644 meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.14.bb
>
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> new file mode 100755
> index 0000000000..f596207648
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> @@ -0,0 +1,77 @@
> +#!/usr/bin/env node
> +
> +/// Usage: oe-npm-cache <cache-dir> <type> <key> <file-name>
> +///    <type> ... meta - metainformation about package
> +///               tgz  - tarball
> +
> +const process = require("node:process");
> +
> +module.paths.unshift("@@libdir@@/node_modules/npm/node_modules");
> +
> +const cacache = require('cacache')
> +const fs = require('fs')
> +
> +// argv[0] is 'node', argv[1] is this script
> +const cache_dir = process.argv[2]
> +const type      = process.argv[3]
> +const key       = process.argv[4]
> +const file      = process.argv[5]
> +
> +const data = fs.readFileSync(file)
> +
> +// metadata content is highly nodejs dependent; when cache entries are not
> +// found, place debug statements in
> 'make-fetch-happen/lib/cache/policy.js'
> +// (CachePolicy::satisfies())
> +const xlate = {
> +    'meta': {
> +       'key_prefix': 'make-fetch-happen:request-cache:',
> +       'metadata': function() {
> +           return {
> +               time: Date.now(),
> +               url:  key,
> +               reqHeaders: {
> +                   'accept': 'application/vnd.npm.install-v1+json; q=1.0,
> application/json; q=0.8, */*',
> +               },
> +               resHeaders: {
> +                   "content-type": "application/json",
> +                   "status": 200,
> +               },
> +               options: {
> +                   compress: true,
> +               }
> +           };
> +       },
> +    },
> +
> +    'tgz': {
> +       'key_prefix': 'make-fetch-happen:request-cache:',
> +       'metadata': function() {
> +           return {
> +               time: Date.now(),
> +               url:  key,
> +               reqHeaders: {
> +                   'accept': '*/*',
> +               },
> +               resHeaders: {
> +                   "content-type": "application/octet-stream",
> +                   "status": 200,
> +               },
> +               options: {
> +                   compress: true,
> +               },
> +           };
> +       },
> +    },
> +};
> +
> +const info = xlate[type];
> +let opts = {}
> +
> +if (info.metadata) {
> +    opts['metadata'] = info.metadata();
> +}
> +
> +cacache.put(cache_dir, info.key_prefix + key, data, opts)
> +    .then(integrity => {
> +       console.log(`Saved content of ${key} (${file}).`);
> +})
> diff --git a/meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.14.bb b/meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.14.bb
> new file mode 100644
> index 0000000000..a61dd5018f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "OE helper for manipulating npm cache"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
> +
> +SRC_URI = "\
> +    file://oe-npm-cache \
> +"
> +
> +inherit native
> +
> +B = "${WORKDIR}/build"
> +
> +do_configure() {
> +    sed -e 's!@@libdir@@!${libdir}!g' < '${WORKDIR}/oe-npm-cache' >
> '${B}/oe-npm-cache'
> +}
> +
> +do_install() {
> +    install -D -p -m 0755 ${B}/oe-npm-cache ${D}${bindir}/oe-npm-cache
> +}
> +
> +RDEPENDS:${PN} = "nodejs-native"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100913):
> https://lists.openembedded.org/g/openembedded-devel/message/100913
> Mute This Topic: https://lists.openembedded.org/mt/96698965/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006a37dd05f3b7385b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How is this different from=C2=A0<a href=3D"https://git.ope=
nembedded.org/meta-openembedded/commit/?h=3Dkirkstone&amp;id=3D035d9c61e81b=
32cb62706cfdbfae08b1bac7ae88">https://git.openembedded.org/meta-openembedde=
d/commit/?h=3Dkirkstone&amp;id=3D035d9c61e81b32cb62706cfdbfae08b1bac7ae88</=
a> ?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Feb 2, 2023 at 1:59 PM Armin Kuster &lt;<a href=3D"mailto:akust=
er808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Enrico Scholz &lt;<a href=3D"mai=
lto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz@sigma-=
chemnitz.de</a>&gt;<br>
<br>
This implements an &#39;npm cache add&#39; like functionality but allows to=
<br>
specify the key of the data and sets metadata which are required to<br>
find the data.<br>
<br>
It is used to cache information as done during &#39;npm install&#39;.<br>
<br>
Keyformat and metadata are nodejs version specific.<br>
<br>
Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma-chem=
nitz.de" target=3D"_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
(cherry picked from commit 035d9c61e81b32cb62706cfdbfae08b1bac7ae88)<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" tar=
get=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77 ++++++++++++++++++=
+<br>
=C2=A0.../nodejs/<a href=3D"http://nodejs-oe-cache-native_16.14.bb" rel=3D"=
noreferrer" target=3D"_blank">nodejs-oe-cache-native_16.14.bb</a>=C2=A0 =C2=
=A0 | 21 +++++<br>
=C2=A02 files changed, 98 insertions(+)<br>
=C2=A0create mode 100755 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16=
.14/oe-npm-cache<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/<a href=3D"http://=
nodejs-oe-cache-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodej=
s-oe-cache-native_16.14.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-c=
ache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache<b=
r>
new file mode 100755<br>
index 0000000000..f596207648<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache<br=
>
@@ -0,0 +1,77 @@<br>
+#!/usr/bin/env node<br>
+<br>
+/// Usage: oe-npm-cache &lt;cache-dir&gt; &lt;type&gt; &lt;key&gt; &lt;fil=
e-name&gt;<br>
+///=C2=A0 =C2=A0 &lt;type&gt; ... meta - metainformation about package<br>
+///=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tgz=C2=A0 - tarb=
all<br>
+<br>
+const process =3D require(&quot;node:process&quot;);<br>
+<br>
+module.paths.unshift(&quot;@@libdir@@/node_modules/npm/node_modules&quot;)=
;<br>
+<br>
+const cacache =3D require(&#39;cacache&#39;)<br>
+const fs =3D require(&#39;fs&#39;)<br>
+<br>
+// argv[0] is &#39;node&#39;, argv[1] is this script<br>
+const cache_dir =3D process.argv[2]<br>
+const type=C2=A0 =C2=A0 =C2=A0 =3D process.argv[3]<br>
+const key=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D process.argv[4]<br>
+const file=C2=A0 =C2=A0 =C2=A0 =3D process.argv[5]<br>
+<br>
+const data =3D fs.readFileSync(file)<br>
+<br>
+// metadata content is highly nodejs dependent; when cache entries are not=
<br>
+// found, place debug statements in &#39;make-fetch-happen/lib/cache/polic=
y.js&#39;<br>
+// (CachePolicy::satisfies())<br>
+const xlate =3D {<br>
+=C2=A0 =C2=A0 &#39;meta&#39;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;key_prefix&#39;: &#39;make-fetch-happen:re=
quest-cache:&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;metadata&#39;: function() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time: Date.now(),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url:=C2=A0 key,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reqHeaders: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
accept&#39;: &#39;application/vnd.npm.install-v1+json; q=3D1.0, application=
/json; q=3D0.8, */*&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resHeaders: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;content-type&quot;: &quot;application/json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;status&quot;: 200,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compr=
ess: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 },<br>
+<br>
+=C2=A0 =C2=A0 &#39;tgz&#39;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;key_prefix&#39;: &#39;make-fetch-happen:re=
quest-cache:&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;metadata&#39;: function() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time: Date.now(),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url:=C2=A0 key,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reqHeaders: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
accept&#39;: &#39;*/*&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resHeaders: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;content-type&quot;: &quot;application/octet-stream&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;status&quot;: 200,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compr=
ess: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+const info =3D xlate[type];<br>
+let opts =3D {}<br>
+<br>
+if (info.metadata) {<br>
+=C2=A0 =C2=A0 opts[&#39;metadata&#39;] =3D info.metadata();<br>
+}<br>
+<br>
+cacache.put(cache_dir, info.key_prefix + key, data, opts)<br>
+=C2=A0 =C2=A0 .then(integrity =3D&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0console.log(`Saved content of ${key} (${file}).=
`);<br>
+})<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs-oe-ca=
che-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-n=
ative_16.14.bb</a> b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://node=
js-oe-cache-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe=
-cache-native_16.14.bb</a><br>
new file mode 100644<br>
index 0000000000..a61dd5018f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs-oe-cache-nat=
ive_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-native_1=
6.14.bb</a><br>
@@ -0,0 +1,21 @@<br>
+DESCRIPTION =3D &quot;OE helper for manipulating npm cache&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D8=
9aea4e17d99a7cacdbeed46a0096b10&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 file://oe-npm-cache \<br>
+&quot;<br>
+<br>
+inherit native<br>
+<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
+<br>
+do_configure() {<br>
+=C2=A0 =C2=A0 sed -e &#39;s!@@libdir@@!${libdir}!g&#39; &lt; &#39;${WORKDI=
R}/oe-npm-cache&#39; &gt; &#39;${B}/oe-npm-cache&#39;<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -D -p -m 0755 ${B}/oe-npm-cache ${D}${bindir}/oe-npm=
-cache<br>
+}<br>
+<br>
+RDEPENDS:${PN} =3D &quot;nodejs-native&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#100913): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/100913" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/100913</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96698965/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96698965/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000006a37dd05f3b7385b--

