Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E46C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 17:28:10 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.350.1642008489327725911
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FolboG2n;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so13517893pjj.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=XuCVBBls2m+vTALwBlqnuoBEsBhOp1LevYsBmBR/NSs=;
        b=FolboG2n11TQibQ7AigecRDONXysTUJoo4dqilM/jx/Cly4JOv8ytwCydFLHmTRnL+
         +JKySK/PB7CCTN0QdJadjYCYQd2UpbARmM17kTpND/c4Oz//78RRl280c73/izlAKXur
         qIZIM5T8yLl9RfHqRb2AEq7iJyuZ12u+ln1LJOX6l3Vq2y8WYpy3bU6boVb+Zd2WD8LY
         6HCItJ091uCbYaJU4oDqS/hA/cSu5lTq4wBdh7dIUZGyU7ahK/nIYjaWrczRSuViG6LY
         TTpKLkJrjrM6ieiNg0ut2toifpqP2TIpEtGwAr01LK+pDuzG8n0Uo/fIhlzkFMNyZRSX
         7dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=XuCVBBls2m+vTALwBlqnuoBEsBhOp1LevYsBmBR/NSs=;
        b=mbbdGZE1BQeUtK9UHOAuzZ/OpXHImTBdbXBrJVqbv2OARAb+PVNfN4SXTvttlQz5Va
         C4bK75aBesHpXb59uyUmxhWiETe2rvCEN1E54iauIoGtJrGOwVT/wxuj1XmuMVAel2oi
         eEQPi3g3lXKzqJfFFIYVzgVmrmu1yjoBtTEuVIFzrYLR9WwP3c71z6wnphUjAQz26X3k
         1tbOLZlKIkp8w7v5tj/MzS+JPe33+17Kw0imCQJqNdjvs5gIaMk5Iam4bQ72L77oags1
         wHrRjbfQxp+3hbosljulg7hbkbnpCWmfkhZpKAkHtEbSrK2q95kptxErBQiiykZeSb/a
         EDjA==
X-Gm-Message-State: AOAM530BCbulUiLayYfSIy8mrx47tfmWt3usVpQUXeICUD/Ghjm3CncQ
	+Ss3Z+9yU8U67hs1xGMeUjs=
X-Google-Smtp-Source: 
 ABdhPJymZAXRKM8T4fpO9qDtC/Wlb1oToHtlPawjMQbRb6KxW44NZLCCx2v3M9+u3PskvzyYtvl3Cg==
X-Received: by 2002:a17:90b:3b49:: with SMTP id
 ot9mr649940pjb.110.1642008488823;
        Wed, 12 Jan 2022 09:28:08 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:9932:4bf6:8df9:9596?
 ([2601:646:9200:a0f0:9932:4bf6:8df9:9596])
        by smtp.gmail.com with ESMTPSA id
 w5sm197369pfu.214.2022.01.12.09.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 09:28:08 -0800 (PST)
Message-ID: <dd63dd36-1b3d-7f1a-b77d-b090f02ba93b@gmail.com>
Date: Wed, 12 Jan 2022 09:28:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [meta-oe][master][PATCH 1/2] nodejs_12.21.0.bb: only handle npm
 if configured
Content-Language: en-US
To: Nisha Parrakat <nishaparrakat@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20220112091529.4853-1-nishaparrakat@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220112091529.4853-1-nishaparrakat@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 17:28:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94788



On 1/12/22 1:15 AM, Nisha Parrakat wrote:
> npm-cli.js should be symlinked only when the file is present
> the file may not be available if the configure option is --without-npm
> 
> Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> ---
>   meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb | 8 ++++++--


we do not have nodejs 12.21.0 on master, is it meant for some other 
release branch ?

>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> index b9e382177..22191a157 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> @@ -133,7 +133,9 @@ do_install_append_class-native() {
>       # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
>       # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
>       # npm-cli.js continues to use old shebang
> -    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
> +        sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    fi
>   
>       # Install the native binaries to provide it within sysroot for the target compilation
>       install -d ${D}${bindir}
> @@ -147,7 +149,9 @@ do_install_append_class-native() {
>   }
>   
>   do_install_append_class-target() {
> -    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
> +        sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    fi
>   }
>   
>   PACKAGES =+ "${PN}-npm"

