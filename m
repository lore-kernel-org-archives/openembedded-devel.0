Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953CAECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 06:51:00 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web08.7174.1663224653671679491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 23:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rbkwo/E1;
 spf=pass (domain: gmail.com, ip: 209.85.167.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id n83so1116047oif.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 23:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5m8yXyxM4UwUIDD+Y9yeHHFEX1naZlLQGhU54u4NzBI=;
        b=Rbkwo/E1nGu1HpCylW0gQrv8/tRvt7Xwa03AFu3vyT4YSaTBrtfiPeFHcFHwmf9W5B
         wClVXPqxkaIOnPEVyksUan6hsRUM+5sIxljL7BTn49/ySqZNrJYX0RbnF4dn45iAkWyG
         AU4WOii9+rMery2ygL+lP8Bxjm9np775rgDc5fF1+GXGDARmTSz9Hl5x3cmR0yICCClI
         81qcZE508sJ/MC/CE2lZfnq8Wmm4MLohOpOTpuAwVzGFmVZ/yzrr9BtHj3AXZXWjQhtJ
         7a39Ofxk3eysk7WJG4yi+svVqXVotkPIfQUIyPuUB7+HRlGAHV77W4hLbrzeHE6314zB
         I50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5m8yXyxM4UwUIDD+Y9yeHHFEX1naZlLQGhU54u4NzBI=;
        b=Qk+3wvdjRlfCsX9kl3O9ZyySL9URpbv7xrZgAoWn9eIk7A+L3TcSLmIlB5H89hgZED
         XjffJ9tNcCHAyI+ouwDaLcxDLFJNeLrw9pxDPUiwhdUQJvqiUUyF8hy1bY+IA0QBaXMT
         nQ6i2lUTqIVSyTrpzt1tjlyU/q/syJ4VfCURzCg1Ww8MgZXfkG0QGdzjIfEgKxjdCJYZ
         tu9idNnzltKAkVswSx7K3+pkmiw+IGK52ooyNE51g3A6L0L2oWbV/cCBBaVI4nj+v1fQ
         WtLYPBjf8BHuNsh8nzy8IzkWFlg+7t51gYHF7cFuLY0UFHl/xlPaR4MpCXllC9XBrsV5
         fuyQ==
X-Gm-Message-State: ACgBeo1FJG2/qGnjZzyvTheeyMGh4qsds37CjqFUDsWd3aMeMg9YpJjd
	nMoTDcWzUwh8VTWagjD8X2ybivvOegcjtwQiv3g=
X-Google-Smtp-Source: 
 AA6agR6y6si+JqLn4QOVUGttRY0jp0XRorIQUKGkake2PE4f/tKyxkpc2jDSq/WLFdSgugAVlgj70NNxhPMvScRZRaw=
X-Received: by 2002:a05:6808:17a6:b0:344:eaa9:24e8 with SMTP id
 bg38-20020a05680817a600b00344eaa924e8mr3399509oib.55.1663224652918; Wed, 14
 Sep 2022 23:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220913153428.1610984-1-Martin.Jansa@gmail.com>
 <4f3c5ba3-9de9-2da7-04d5-f7873bcf9b30@gmail.com>
 <CA+chaQc6j59V1RShNOkmnqE-qd=cKhkGwWrX5siwiR+4u_rhtQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQc6j59V1RShNOkmnqE-qd=cKhkGwWrX5siwiR+4u_rhtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Sep 2022 23:50:26 -0700
Message-ID: 
 <CAMKF1so6QKLE+A5fCVcoxnqkAbcb-zgbx0hFAaSMhv27cCH4AA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone] nodejs-oe-cache-native: initial checkin
To: Martin Jansa <martin.jansa@gmail.com>
Cc: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 06:51:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98815

On Wed, Sep 14, 2022 at 11:18 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> oe-core kirkstone already added the dependency on it, so I guess it justifies the exception
>

agreed

> On Wed, Sep 14, 2022 at 10:19 PM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 9/13/22 11:34, Martin Jansa wrote:
>> > From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> >
>> > This implements an 'npm cache add' like functionality but allows to
>> > specify the key of the data and sets metadata which are required to
>> > find the data.
>> >
>> > It is used to cache information as done during 'npm install'.
>> >
>> > Keyformat and metadata are nodejs version specific.
>>
>> Isn't this adding a new recipe to a Stable branch?
>>
>> - armin
>> >
>> > Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >   .../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77 +++++++++++++++++++
>> >   .../nodejs/nodejs-oe-cache-native_16.14.bb    | 21 +++++
>> >   2 files changed, 98 insertions(+)
>> >   create mode 100755 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>> >   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>> >
>> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>> > new file mode 100755
>> > index 0000000000..f596207648
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>> > @@ -0,0 +1,77 @@
>> > +#!/usr/bin/env node
>> > +
>> > +/// Usage: oe-npm-cache <cache-dir> <type> <key> <file-name>
>> > +///    <type> ... meta - metainformation about package
>> > +///               tgz  - tarball
>> > +
>> > +const process = require("node:process");
>> > +
>> > +module.paths.unshift("@@libdir@@/node_modules/npm/node_modules");
>> > +
>> > +const cacache = require('cacache')
>> > +const fs = require('fs')
>> > +
>> > +// argv[0] is 'node', argv[1] is this script
>> > +const cache_dir = process.argv[2]
>> > +const type      = process.argv[3]
>> > +const key       = process.argv[4]
>> > +const file      = process.argv[5]
>> > +
>> > +const data = fs.readFileSync(file)
>> > +
>> > +// metadata content is highly nodejs dependent; when cache entries are not
>> > +// found, place debug statements in 'make-fetch-happen/lib/cache/policy.js'
>> > +// (CachePolicy::satisfies())
>> > +const xlate = {
>> > +    'meta': {
>> > +     'key_prefix': 'make-fetch-happen:request-cache:',
>> > +     'metadata': function() {
>> > +         return {
>> > +             time: Date.now(),
>> > +             url:  key,
>> > +             reqHeaders: {
>> > +                 'accept': 'application/vnd.npm.install-v1+json; q=1.0, application/json; q=0.8, */*',
>> > +             },
>> > +             resHeaders: {
>> > +                 "content-type": "application/json",
>> > +                 "status": 200,
>> > +             },
>> > +             options: {
>> > +                 compress: true,
>> > +             }
>> > +         };
>> > +     },
>> > +    },
>> > +
>> > +    'tgz': {
>> > +     'key_prefix': 'make-fetch-happen:request-cache:',
>> > +     'metadata': function() {
>> > +         return {
>> > +             time: Date.now(),
>> > +             url:  key,
>> > +             reqHeaders: {
>> > +                 'accept': '*/*',
>> > +             },
>> > +             resHeaders: {
>> > +                 "content-type": "application/octet-stream",
>> > +                 "status": 200,
>> > +             },
>> > +             options: {
>> > +                 compress: true,
>> > +             },
>> > +         };
>> > +     },
>> > +    },
>> > +};
>> > +
>> > +const info = xlate[type];
>> > +let opts = {}
>> > +
>> > +if (info.metadata) {
>> > +    opts['metadata'] = info.metadata();
>> > +}
>> > +
>> > +cacache.put(cache_dir, info.key_prefix + key, data, opts)
>> > +    .then(integrity => {
>> > +     console.log(`Saved content of ${key} (${file}).`);
>> > +})
>> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>> > new file mode 100644
>> > index 0000000000..a61dd5018f
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>> > @@ -0,0 +1,21 @@
>> > +DESCRIPTION = "OE helper for manipulating npm cache"
>> > +LICENSE = "Apache-2.0"
>> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>> > +
>> > +SRC_URI = "\
>> > +    file://oe-npm-cache \
>> > +"
>> > +
>> > +inherit native
>> > +
>> > +B = "${WORKDIR}/build"
>> > +
>> > +do_configure() {
>> > +    sed -e 's!@@libdir@@!${libdir}!g' < '${WORKDIR}/oe-npm-cache' > '${B}/oe-npm-cache'
>> > +}
>> > +
>> > +do_install() {
>> > +    install -D -p -m 0755 ${B}/oe-npm-cache ${D}${bindir}/oe-npm-cache
>> > +}
>> > +
>> > +RDEPENDS:${PN} = "nodejs-native"
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#98787): https://lists.openembedded.org/g/openembedded-devel/message/98787
>> > Mute This Topic: https://lists.openembedded.org/mt/93657958/3616698
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >
>>

