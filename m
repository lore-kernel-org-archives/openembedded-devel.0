Return-Path: <paulo@eero.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF203C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:44:39 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.234.1663166671934423006
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 07:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@eero.com header.s=google header.b=HCoDZ0U6;
 spf=pass (domain: eero.com, ip: 209.85.217.49, mailfrom: paulo@eero.com)
Received: by mail-vs1-f49.google.com with SMTP id c3so16136002vsc.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eero.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Z2BE3vSMtzZXrcIqM7OEwxj5w9Of5YLsNVctJYfiHFg=;
        b=HCoDZ0U6+cq3f/nMJ3WEpSFTJ1AhU6eLOwyeqAmlKy44RVNMGGDaJNuv5pPlcU7wrf
         g0yBV6QdpAoZUHyMqYVZtQdWB8gHs9T6FNeHetJVBENYgl7wAzyPajNftjdcL6KIFQk2
         guwjct1Zxw2MbuKYNGLYzbIZvNY5v+lMLB6cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Z2BE3vSMtzZXrcIqM7OEwxj5w9Of5YLsNVctJYfiHFg=;
        b=D3HozckzZtUns2Yils3aDMTU3RhSooQyJwdyGAQiH8CUOm+H9lZ9GAQY0L7Y/c1SGW
         /VlS6ejxKlZnv/G0SUc5mQu5LCiVxYs8JrAOkpoPvP+gnD3BGd/u95tv5Fb92jbd0RkY
         8E8kBxYUrKJZtAjgPaQDGC99WwAeudxC3PZoKm/qp6QI6AYXosde6Wz0hWaGn5QZ++g7
         ejQh1JrEoQltsU+kDuPmS6NcMSkxjU+QaSCoeyy8mCDYGVl4A9QCLSKx444nT1SIPCi9
         LDreyw7hQcE861WnuLPKnln/IxS7c874HvwJkZ1sDJ8+C1D+NpTZHHHQ0PyT3uRrAwV3
         +68Q==
X-Gm-Message-State: ACgBeo3siNQeNv5qKRY9cPNLL99An9QgAHGXjzgKgXJzQnxFk2hP1VdC
	Gs9rrzaEmkM9PpYGI8NyfOF0vdZf/pmDRXlh381Alw==
X-Google-Smtp-Source: 
 AA6agR4ElPy7UCE8PLGWV/oegYAWKU8BcsSLgO1QnSpBfIagKGfBUKK6ChOTe/tpWAbgOt3EJ8ivSijPddIJpa+Wq+c=
X-Received: by 2002:a67:c988:0:b0:390:1f73:b3ad with SMTP id
 y8-20020a67c988000000b003901f73b3admr12739564vsk.16.1663166670267; Wed, 14
 Sep 2022 07:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220914142120.53537-1-paulo@eero.com>
 <Groupsio.1.20220914142120.53537-1-paulo@eero.com>
 <CA+chaQfMcGzwC6K=aht8MS-H-ZYwT5M8hyv-F1bVSNmWU5SRgg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfMcGzwC6K=aht8MS-H-ZYwT5M8hyv-F1bVSNmWU5SRgg@mail.gmail.com>
From: Paulo Vitor Becker Ayrosa Monteiro de Andrade <paulo@eero.com>
Date: Wed, 14 Sep 2022 10:44:17 -0400
Message-ID: 
 <CADgnPrRhnMMJ70cQ56Tic_PgkpE2Pq9atR5Z7UOQNuR_h9PS4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][add-npm-commit-from-main-to-kirkstone]
 nodejs-oe-cache-native: initial checkin
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000957d6105e8a42af4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 14:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98806

--000000000000957d6105e8a42af4
Content-Type: text/plain; charset="UTF-8"

Awesome!

I tried sending it earlier, but had some problems. Thanks a bunch, then!

On Wed, Sep 14, 2022 at 10:27 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> I've already sent this backport request yesterday.
>
> On Wed, Sep 14, 2022 at 4:26 PM Paulo Vitor Becker Ayrosa Monteiro de
> Andrade <paulo@eero.com> wrote:
>
>> [Edited Message Follows]
>>
>> This is a commit from the master branch which is already merged.
>> In order to get yocto's build working on kirkstone branch, this commit is
>> necessary on meta-openembedded as well.
>> I ran into npm issues when doing some work here and stumbled upon
>> Enrico's solution to this, and it worked perfectly. If this was already
>> merged to kirkstone branch, I believe more people would benefit.
>>
>> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>
>> This implements an 'npm cache add' like functionality but allows to
>> specify the key of the data and sets metadata which are required to
>> find the data.
>>
>> It is used to cache information as done during 'npm install'.
>>
>> Keyformat and metadata are nodejs version specific.
>>
>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77 +++++++++++++++++++
>>  .../nodejs/nodejs-oe-cache-native_16.14.bb    | 21 +++++
>>  2 files changed, 98 insertions(+)
>>  create mode 100755
>> meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>>  create mode 100644 meta-oe/recipes-devtools/nodejs/
>> nodejs-oe-cache-native_16.14.bb
>>
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>> b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>> new file mode 100755
>> index 000000000..f59620764
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>> @@ -0,0 +1,77 @@
>> +#!/usr/bin/env node
>> +
>> +/// Usage: oe-npm-cache <cache-dir> <type> <key> <file-name>
>> +///    <type> ... meta - metainformation about package
>> +///               tgz  - tarball
>> +
>> +const process = require("node:process");
>> +
>> +module.paths.unshift("@@libdir@@/node_modules/npm/node_modules");
>> +
>> +const cacache = require('cacache')
>> +const fs = require('fs')
>> +
>> +// argv[0] is 'node', argv[1] is this script
>> +const cache_dir = process.argv[2]
>> +const type      = process.argv[3]
>> +const key       = process.argv[4]
>> +const file      = process.argv[5]
>> +
>> +const data = fs.readFileSync(file)
>> +
>> +// metadata content is highly nodejs dependent; when cache entries are
>> not
>> +// found, place debug statements in
>> 'make-fetch-happen/lib/cache/policy.js'
>> +// (CachePolicy::satisfies())
>> +const xlate = {
>> +    'meta': {
>> +       'key_prefix': 'make-fetch-happen:request-cache:',
>> +       'metadata': function() {
>> +           return {
>> +               time: Date.now(),
>> +               url:  key,
>> +               reqHeaders: {
>> +                   'accept': 'application/vnd.npm.install-v1+json;
>> q=1.0, application/json; q=0.8, */*',
>> +               },
>> +               resHeaders: {
>> +                   "content-type": "application/json",
>> +                   "status": 200,
>> +               },
>> +               options: {
>> +                   compress: true,
>> +               }
>> +           };
>> +       },
>> +    },
>> +
>> +    'tgz': {
>> +       'key_prefix': 'make-fetch-happen:request-cache:',
>> +       'metadata': function() {
>> +           return {
>> +               time: Date.now(),
>> +               url:  key,
>> +               reqHeaders: {
>> +                   'accept': '*/*',
>> +               },
>> +               resHeaders: {
>> +                   "content-type": "application/octet-stream",
>> +                   "status": 200,
>> +               },
>> +               options: {
>> +                   compress: true,
>> +               },
>> +           };
>> +       },
>> +    },
>> +};
>> +
>> +const info = xlate[type];
>> +let opts = {}
>> +
>> +if (info.metadata) {
>> +    opts['metadata'] = info.metadata();
>> +}
>> +
>> +cacache.put(cache_dir, info.key_prefix + key, data, opts)
>> +    .then(integrity => {
>> +       console.log(`Saved content of ${key} (${file}).`);
>> +})
>> diff --git a/meta-oe/recipes-devtools/nodejs/
>> nodejs-oe-cache-native_16.14.bb b/meta-oe/recipes-devtools/nodejs/
>> nodejs-oe-cache-native_16.14.bb
>> new file mode 100644
>> index 000000000..a61dd5018
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>> @@ -0,0 +1,21 @@
>> +DESCRIPTION = "OE helper for manipulating npm cache"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM =
>> "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>> +
>> +SRC_URI = "\
>> +    file://oe-npm-cache \
>> +"
>> +
>> +inherit native
>> +
>> +B = "${WORKDIR}/build"
>> +
>> +do_configure() {
>> +    sed -e 's!@@libdir@@!${libdir}!g' < '${WORKDIR}/oe-npm-cache' >
>> '${B}/oe-npm-cache'
>> +}
>> +
>> +do_install() {
>> +    install -D -p -m 0755 ${B}/oe-npm-cache ${D}${bindir}/oe-npm-cache
>> +}
>> +
>> +RDEPENDS:${PN} = "nodejs-native"
>> --
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#98804):
>> https://lists.openembedded.org/g/openembedded-devel/message/98804
>> Mute This Topic: https://lists.openembedded.org/mt/93678585/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> Martin.Jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--000000000000957d6105e8a42af4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Awesome!</div><div><br></div><div>I tried sending it =
earlier, but had some problems. Thanks a bunch, then!<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep =
14, 2022 at 10:27 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.=
com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr">I&#39;ve already sent this back=
port request yesterday.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Sep 14, 2022 at 4:26 PM Paulo Vitor Becker A=
yrosa Monteiro de Andrade &lt;<a href=3D"mailto:paulo@eero.com" target=3D"_=
blank">paulo@eero.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">[Edited Message Follows]<br>
<br>
This is a commit from the master branch which is already merged.<br>
In order to get yocto&#39;s build working on kirkstone branch, this commit =
is necessary on meta-openembedded as well.<br>
I ran into npm issues when doing some work here and stumbled upon Enrico&#3=
9;s solution to this, and it worked perfectly. If this was already merged t=
o kirkstone branch, I believe more people would benefit.<br>
<br>
From: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma-chemnitz.de" =
target=3D"_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
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
index 000000000..f59620764<br>
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
index 000000000..a61dd5018<br>
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
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98804): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98804" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98804</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93678585/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93678585/3617156</a><br>
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
</blockquote></div>

--000000000000957d6105e8a42af4--

