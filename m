Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119EFC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 20:19:47 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web09.2099.1663186771945891229
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 13:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=inFCab/v;
 spf=pass (domain: gmail.com, ip: 209.85.160.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-1225219ee46so44163962fac.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 13:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=e5ncuaWOW0WWU5l87YXTDdkm3CFu+WgysDqvBSFipEY=;
        b=inFCab/vV8jKAuiJ1HfohHKutamDmJpqgJ47rRyfPoflBTQ1vDr4BQs7Vu/HfFRCgg
         Gijxz1GpMOjWfsYAWOTZxl4fuZOLZK8K1Nyu4UQVKFmTq2Yfln6r7e/CjGVeodB8pGJ2
         kYSNu8Gs6taa8sXsUaOYpVosRORKnU/ZIfTkEdMGwMab4FTpxmmvC8bNPVpsw1jwCUzq
         ZSgVQNlIUjc2wKeNdxd9yiSAM4C+awF60x6APVOZBrbhqzqsbxySbkt3wo90xmUTGzeo
         bGtljTNdVfr7iA43hw020mwnpbFPfpvHj+Pq1HqxfF0BW1rv/EfgX3BZSD5EU20F6yDQ
         wIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=e5ncuaWOW0WWU5l87YXTDdkm3CFu+WgysDqvBSFipEY=;
        b=YYze1kIuHA/IbGKW5pVgsQS2iIZkQUZRiy/zudUUAO1lCb9Bk2NaRd1wzyjNKZox3n
         qKVk2pY9CniufO5sIVnwGO3n9jflYU5ier1QlkY3aFSxnAuYSp+Prmhrw3++pwPxW10S
         AoY3WM5N5aDFuQO7r02t3NZZIbOTAaRThN4IPrTtupFtpdVSppC1utOZtOYYCK55RxNq
         Ev45dMYkxHYAeSEzXixkL5uybCGMUoGM5Fc+x904p7wVM3ixVXKAlmFDzma+kNZ3Beqd
         6oF8TDU0EkONDKIFDwBhdKEdJKocas/VQgtyjLp/pdqMbFH7vQ/XgwRop7uTh2lNIJV3
         W2Fw==
X-Gm-Message-State: ACgBeo3ozwxYlrjNdRM1KUxt5Hn2XIDEVlG2qKI368wlCcHwavuksGfC
	nf0IWwlZxdF13UbzImNxp6k=
X-Google-Smtp-Source: 
 AA6agR6YivTsu0LHcaNJegTfJRMABfyZYrtk5pIMwGok283pfEFY97vQ+f7gEihU4hRLbRmqKRyUrA==
X-Received: by 2002:a05:6808:16a0:b0:345:e7a9:7d68 with SMTP id
 bb32-20020a05680816a000b00345e7a97d68mr2795097oib.187.1663186771214;
        Wed, 14 Sep 2022 13:19:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:4e7c:424d:5360:e5d8?
 ([2600:1700:9190:ba10:4e7c:424d:5360:e5d8])
        by smtp.gmail.com with ESMTPSA id
 y4-20020a056870428400b0010d5d5c3fc3sm141790oah.8.2022.09.14.13.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 13:19:30 -0700 (PDT)
Message-ID: <4f3c5ba3-9de9-2da7-04d5-f7873bcf9b30@gmail.com>
Date: Wed, 14 Sep 2022 16:19:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-oe][kirkstone] nodejs-oe-cache-native: initial checkin
Content-Language: en-US
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
 Khem Raj <raj.khem@gmail.com>
References: <20220913153428.1610984-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220913153428.1610984-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 20:19:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98809



On 9/13/22 11:34, Martin Jansa wrote:
> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>
> This implements an 'npm cache add' like functionality but allows to
> specify the key of the data and sets metadata which are required to
> find the data.
>
> It is used to cache information as done during 'npm install'.
>
> Keyformat and metadata are nodejs version specific.

Isn't this adding a new recipe to a Stable branch?

- armin
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77 +++++++++++++++++++
>   .../nodejs/nodejs-oe-cache-native_16.14.bb    | 21 +++++
>   2 files changed, 98 insertions(+)
>   create mode 100755 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
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
> +// found, place debug statements in 'make-fetch-happen/lib/cache/policy.js'
> +// (CachePolicy::satisfies())
> +const xlate = {
> +    'meta': {
> +	'key_prefix': 'make-fetch-happen:request-cache:',
> +	'metadata': function() {
> +	    return {
> +		time: Date.now(),
> +		url:  key,
> +		reqHeaders: {
> +		    'accept': 'application/vnd.npm.install-v1+json; q=1.0, application/json; q=0.8, */*',
> +		},
> +		resHeaders: {
> +		    "content-type": "application/json",
> +		    "status": 200,
> +		},
> +		options: {
> +		    compress: true,
> +		}
> +	    };
> +	},
> +    },
> +
> +    'tgz': {
> +	'key_prefix': 'make-fetch-happen:request-cache:',
> +	'metadata': function() {
> +	    return {
> +		time: Date.now(),
> +		url:  key,
> +		reqHeaders: {
> +		    'accept': '*/*',
> +		},
> +		resHeaders: {
> +		    "content-type": "application/octet-stream",
> +		    "status": 200,
> +		},
> +		options: {
> +		    compress: true,
> +		},
> +	    };
> +	},
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
> +	console.log(`Saved content of ${key} (${file}).`);
> +})
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
> new file mode 100644
> index 0000000000..a61dd5018f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "OE helper for manipulating npm cache"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
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
> +    sed -e 's!@@libdir@@!${libdir}!g' < '${WORKDIR}/oe-npm-cache' > '${B}/oe-npm-cache'
> +}
> +
> +do_install() {
> +    install -D -p -m 0755 ${B}/oe-npm-cache ${D}${bindir}/oe-npm-cache
> +}
> +
> +RDEPENDS:${PN} = "nodejs-native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98787): https://lists.openembedded.org/g/openembedded-devel/message/98787
> Mute This Topic: https://lists.openembedded.org/mt/93657958/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


