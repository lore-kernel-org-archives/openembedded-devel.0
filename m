Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A551C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 16:31:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.11007.1642091470181826183
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 08:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UuUkXiWH;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so19430589pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=2sXDjzw+d5gTQviLTS93YOc7geUgncMElOf1cEV3DIU=;
        b=UuUkXiWHOdIU79ijhP4RXpZkWNkeNPxjr7EByDRgyKO9KQQmWeKRQ/RNXfN6lqA7Kl
         j7Zd8DKmDIecx49EJBwgsq/HrPiXVyvLOdpX209HyFUEmqNAVU2/x46Lw8N49XYeM1gi
         A23VNLCWcCrOic8wrD0iSlbG5T9myZz/0Eme25fdeGZVY7XKADoZeCAeAUxVIsmwTs0U
         jQI1ocODEPkPmLoD5qZjeKXa/+d6p1D2DBMFhnev4X7gVZtsarL5383jFtqvZeJ4CHE1
         Bha0Qi8P4hv743jWDZrqVeC6k04Y3E6XVkDDqsDMLY6lApvG4CfkMMHEnmNwcS5G0Nu2
         hoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=2sXDjzw+d5gTQviLTS93YOc7geUgncMElOf1cEV3DIU=;
        b=Pde7P/h6ESUpjRqCbJeXfMRyOgdl58QrXxdezynrBOnH51nff+OpsIPBdg9kr92TEm
         Xwt9GFGOm1kFE2MHOHtmrLUA7IyvUFeCDTNMTNfzLlmM7WWVVOjsztLqDam3590IWUQJ
         cZgPTwaKi9cSXabKiQzCz+aKDTJsyXuP2J991IXK/OgTvWZDTfYVNMUX+wY0tRqL63FP
         DZp/av96nHK/5oSbKVfGxpTUqce/WW0QUea6NCsRAYsh/tHAs++1dAMgpUL1aD/eUp4f
         IzM4G8RBxSGClrPCbsJYLmZiV2T9ahWbIJ5ZYPG7KFVJ/RGYTQqCMFbqp2/iz4NuvqDF
         m6Lw==
X-Gm-Message-State: AOAM532kbWtBj5j96++SlAWIe7eG0f/KbZqbOJbL7v+NhHTUFPlzXgCM
	fTiQa7U7/U3jTBQmlPSnMcE=
X-Google-Smtp-Source: 
 ABdhPJy31CkYoVV2OP8s+jCETJoJJkAZhohbWyUnccwWbkkMYR3ATjb8WoZo7vhuLwXGosuoMOXUMw==
X-Received: by 2002:a17:902:76c6:b0:149:ece8:fbfa with SMTP id
 j6-20020a17090276c600b00149ece8fbfamr5206786plt.86.1642091469528;
        Thu, 13 Jan 2022 08:31:09 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:adf9:92d2:354f:44e7?
 ([2601:646:9200:a0f0:adf9:92d2:354f:44e7])
        by smtp.gmail.com with ESMTPSA id
 x19sm2668236pgi.19.2022.01.13.08.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 08:31:08 -0800 (PST)
Message-ID: <89b50a2b-d40b-35ea-3cbf-64b64847c100@gmail.com>
Date: Thu, 13 Jan 2022 08:30:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-regex: Upgrade 2021.10.8 ->
 2021.11.10
Content-Language: en-US
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20220113132544.779928-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220113132544.779928-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 16:31:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94810



On 1/13/22 5:25 AM, Leon Anavi wrote:
> Upgrade to release 2021.11.10:
> 
> - Minor changes to some tests
> - Removed unused functions
> - Fuzzy regex matching doesn't seem to test insertions correctly
> 
> License-Update: Use LICENSE.txt
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   ...python3-regex_2021.10.8.bb => python3-regex_2021.11.10.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-regex_2021.10.8.bb => python3-regex_2021.11.10.bb} (58%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb b/meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb
> rename to meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb
> index e7978970c..dce232ba6 100644
> --- a/meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb
> @@ -1,11 +1,11 @@
>   SUMMARY = "Alternative regular expression module, to replace re."
>   HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c046c93d45d8e4bc"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"

I hope the license terms and conditions are still same as it was before 
using LICENSE.txt ?

>   
>   inherit pypi setuptools3
>   
> -SRC_URI[sha256sum] = "26895d7c9bbda5c52b3635ce5991caa90fbb1ddfac9c9ff1c7ce505e2282fb2a"
> +SRC_URI[sha256sum] = "f341ee2df0999bfdf7a95e448075effe0db212a59387de1a70690e4acb03d4c6"
>   
>   RDEPENDS:${PN} += " \
>   	python3-stringold \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94806): https://lists.openembedded.org/g/openembedded-devel/message/94806
> Mute This Topic: https://lists.openembedded.org/mt/88396262/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

