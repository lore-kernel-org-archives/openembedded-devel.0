Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287EAC636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 17:03:32 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.10464.1675530206191183590
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Feb 2023 09:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o6Oi8R5L;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1636eae256cso10411994fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 09:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fQwh9lp5DR0IxrHfbJfbBzNA9lCmL6/TdgRSsps52X4=;
        b=o6Oi8R5Lehfw0a4yaQMP0fUs1ZO8fA/iw5OfYt9fCfGGpg67Ifb25othcLCPKL/rXw
         iiCvdl/ajxs2XxyG6QOUe5v4nhmksXJ0+p7y7MSogvmCuHrlCBNJQ8206xD97fUrAYXu
         UZXNIl6E5WQd1lNte4/ojcS8mZ8PlesIwMxL85FyJxdo2ToujXBEe/CTlu3HfyW0ag5v
         VfbWpnAAOAE8UcZG5o/Qr2xAZqLDUImFI6M+iUsKX0+hsMPd8SY28GDUBqarRDK7Wlic
         5cAOvKhWnlwU7bumsPSo5lJBj6PpF1wKS0UsJcuT4g3CnB+55mA2sxzM3nLo/ZhnzKdX
         /JIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQwh9lp5DR0IxrHfbJfbBzNA9lCmL6/TdgRSsps52X4=;
        b=CedJM8t/EpdBl4klO1RKi+Xc/EMTlE2p+LfugGMYlpEpIZZ9dAxGACoxUleSjYX5Gd
         JzsmS8z+aNhQJKpBFPnWM9sZ6QEl1h0eV/mbZnXyMJLpkiCkoafNc2SD/YBt1kS2j5Os
         6Ae2WxjCJbK02hOHw/9f4XPG+i2ilgulFr/xOab7DZc4CeQDUBYCErSu4coGLe0MruPj
         6yJTFE/V0IfqphhHdt21E0O9LNw/vM84GPRsZfaDXLgLlbuCleCIqeif3fInaVpbkLt9
         Ct+iapLyf/DV6q0VeZc0MZP36ZM6nDYUSFr0gYfUI3wwTaICRZgW52m1jYIoHogiMi5r
         JEKA==
X-Gm-Message-State: AO0yUKVrnT0ltZnAaqSujbpLPU5cXf8cdomg2xYPlIVNP3KSSTXsuLmt
	yIECjglqqjndYdYVBqMG8Cc=
X-Google-Smtp-Source: AK7set+EOt69N22m9VMUJh/02ThdLtfm5I/2SvkUFRF4z0q4VHJabSvGRq5phx1z5k7VM8WWADRLuw==
X-Received: by 2002:a05:6871:b23:b0:163:4947:6a28 with SMTP id fq35-20020a0568710b2300b0016349476a28mr4174238oab.58.1675530205298;
        Sat, 04 Feb 2023 09:03:25 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:f9c0:6c7:9951:7042? ([2600:1700:9190:ba10:f9c0:6c7:9951:7042])
        by smtp.gmail.com with ESMTPSA id cy41-20020a056870b6a900b0010c727a3c79sm1988665oab.26.2023.02.04.09.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 09:03:24 -0800 (PST)
Message-ID: <01c6c3a0-685f-4571-521e-082901cb7bc0@gmail.com>
Date: Sat, 4 Feb 2023 12:03:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] nodejs-oe-cache-native: initial
 checkin
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
 Khem Raj <raj.khem@gmail.com>
References: <20230202125924.3771885-1-akuster808@gmail.com>
 <CA+chaQdFAQ8VH-FqcyKgTnoU4GJsXH+Ae_UM7eiibAcN7M3Vaw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <CA+chaQdFAQ8VH-FqcyKgTnoU4GJsXH+Ae_UM7eiibAcN7M3Vaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 17:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100929



On 2/2/23 8:05 AM, Martin Jansa wrote:
> How is this different from 
> https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone&id=035d9c61e81b32cb62706cfdbfae08b1bac7ae88 
> <https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone&id=035d9c61e81b32cb62706cfdbfae08b1bac7ae88> 
> ?

its not.. that is weird, git allowed it to apply.

I drop it. Thanks,

Armin
>
> On Thu, Feb 2, 2023 at 1:59 PM Armin Kuster <akuster808@gmail.com> wrote:
>
>     From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>
>     This implements an 'npm cache add' like functionality but allows to
>     specify the key of the data and sets metadata which are required to
>     find the data.
>
>     It is used to cache information as done during 'npm install'.
>
>     Keyformat and metadata are nodejs version specific.
>
>     Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     (cherry picked from commit 035d9c61e81b32cb62706cfdbfae08b1bac7ae88)
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>     ---
>      .../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77
>     +++++++++++++++++++
>      .../nodejs/nodejs-oe-cache-native_16.14.bb
>     <http://nodejs-oe-cache-native_16.14.bb>   | 21 +++++
>      2 files changed, 98 insertions(+)
>      create mode 100755
>     meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>      create mode 100644
>     meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>     <http://nodejs-oe-cache-native_16.14.bb>
>
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>     b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>     new file mode 100755
>     index 0000000000..f596207648
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>     @@ -0,0 +1,77 @@
>     +#!/usr/bin/env node
>     +
>     +/// Usage: oe-npm-cache <cache-dir> <type> <key> <file-name>
>     +///    <type> ... meta - metainformation about package
>     +///               tgz  - tarball
>     +
>     +const process = require("node:process");
>     +
>     +module.paths.unshift("@@libdir@@/node_modules/npm/node_modules");
>     +
>     +const cacache = require('cacache')
>     +const fs = require('fs')
>     +
>     +// argv[0] is 'node', argv[1] is this script
>     +const cache_dir = process.argv[2]
>     +const type      = process.argv[3]
>     +const key       = process.argv[4]
>     +const file      = process.argv[5]
>     +
>     +const data = fs.readFileSync(file)
>     +
>     +// metadata content is highly nodejs dependent; when cache
>     entries are not
>     +// found, place debug statements in
>     'make-fetch-happen/lib/cache/policy.js'
>     +// (CachePolicy::satisfies())
>     +const xlate = {
>     +    'meta': {
>     +       'key_prefix': 'make-fetch-happen:request-cache:',
>     +       'metadata': function() {
>     +           return {
>     +               time: Date.now(),
>     +               url:  key,
>     +               reqHeaders: {
>     +                   'accept':
>     'application/vnd.npm.install-v1+json; q=1.0, application/json;
>     q=0.8, */*',
>     +               },
>     +               resHeaders: {
>     +                   "content-type": "application/json",
>     +                   "status": 200,
>     +               },
>     +               options: {
>     +                   compress: true,
>     +               }
>     +           };
>     +       },
>     +    },
>     +
>     +    'tgz': {
>     +       'key_prefix': 'make-fetch-happen:request-cache:',
>     +       'metadata': function() {
>     +           return {
>     +               time: Date.now(),
>     +               url:  key,
>     +               reqHeaders: {
>     +                   'accept': '*/*',
>     +               },
>     +               resHeaders: {
>     +                   "content-type": "application/octet-stream",
>     +                   "status": 200,
>     +               },
>     +               options: {
>     +                   compress: true,
>     +               },
>     +           };
>     +       },
>     +    },
>     +};
>     +
>     +const info = xlate[type];
>     +let opts = {}
>     +
>     +if (info.metadata) {
>     +    opts['metadata'] = info.metadata();
>     +}
>     +
>     +cacache.put(cache_dir, info.key_prefix + key, data, opts)
>     +    .then(integrity => {
>     +       console.log(`Saved content of ${key} (${file}).`);
>     +})
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>     <http://nodejs-oe-cache-native_16.14.bb>
>     b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>     <http://nodejs-oe-cache-native_16.14.bb>
>     new file mode 100644
>     index 0000000000..a61dd5018f
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>     <http://nodejs-oe-cache-native_16.14.bb>
>     @@ -0,0 +1,21 @@
>     +DESCRIPTION = "OE helper for manipulating npm cache"
>     +LICENSE = "Apache-2.0"
>     +LIC_FILES_CHKSUM =
>     "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>     +
>     +SRC_URI = "\
>     +    file://oe-npm-cache \
>     +"
>     +
>     +inherit native
>     +
>     +B = "${WORKDIR}/build"
>     +
>     +do_configure() {
>     +    sed -e 's!@@libdir@@!${libdir}!g' < '${WORKDIR}/oe-npm-cache'
>     > '${B}/oe-npm-cache'
>     +}
>     +
>     +do_install() {
>     +    install -D -p -m 0755 ${B}/oe-npm-cache
>     ${D}${bindir}/oe-npm-cache
>     +}
>     +
>     +RDEPENDS:${PN} = "nodejs-native"
>     -- 
>     2.25.1
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#100913):
>     https://lists.openembedded.org/g/openembedded-devel/message/100913
>     Mute This Topic: https://lists.openembedded.org/mt/96698965/3617156
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [Martin.Jansa@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


