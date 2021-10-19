Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CC3C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 04:03:19 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.5114.1634616198227318288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SNO3Rxcy;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id np13so13681704pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=XpoZ1Mci08a2RwK6wRAxW6RzYx67fw8qNoPrU5aWvrI=;
        b=SNO3Rxcyf2U6XqwBM/scEx78J0wwvY334mWQBztIWs59/Hv+JmWWgOayBHxiy2N3GL
         mc/t3oWfFnuqEKpX7rn6xGJU91tbbublDynG4pnJAd1aw9YsqhsXBgNzcj812nxRKc44
         J/btkdQk0Nppu69YB4Xjd9Kvn7uJ3bFVA5yRIkxiSbvepwd45qbcUj1hemEHPRoBTiLO
         UML7RKg2a25H/9h2UJ3EihOoKvBwScrXaBIX1KQorng4KTk+AUnGUDQYM648iDV5Mgkm
         5vt1jD6gbnSPP5u9DoG3Yi/gWlXdLfbnj6aA3JL9Ezk52a3/HFnPByhCtEn3A27gwL+N
         tkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=XpoZ1Mci08a2RwK6wRAxW6RzYx67fw8qNoPrU5aWvrI=;
        b=8OTO5v9drhSOx2flUY9/BfTJlRgtg82j1dE2K/QZKoVJY9BPuoZhy00xj86rMuUJ5R
         voSKQtfNFeLrTKlnCg3f1lg453aAvCJkwqib4yyBaWqL/PG/q0DsiCx2WqRN4kg7IRXo
         RKa1LSjp0W6eJlAPj71HeakSFgZR3DHvqJuPwvzMslGFw4Oi7sEKz5n5Nod3t1luYHte
         u2fIfYrccWUGvB8x5fJ84YA4o1DQrc/NoxthQTmPGHJu+L0w7vYbkAjxSLv4N18xeSIu
         Mk9InrXk+osgKmUOh0wPwmPsqsEBOUNBjrsmRUd/qpcOw8V6i7CTLjedePHvcY4yKMOe
         q1iw==
X-Gm-Message-State: AOAM533au+web+Fvxm1e/lO+2qWPCWmxq0EJbhbvF8fcX5AqGSQK4zUj
	jjgxXPp4wc5m5HO4KWuLLmc=
X-Google-Smtp-Source: 
 ABdhPJyL6OietiO1wieSK6inrkx5AbgB67H/D0JU+LFVU5Avmi59StoFjFTVQO3ZMvy0umNw89dL+Q==
X-Received: by 2002:a17:902:8f90:b0:13e:a44e:2d3c with SMTP id
 z16-20020a1709028f9000b0013ea44e2d3cmr31349548plo.85.1634616197435;
        Mon, 18 Oct 2021 21:03:17 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::f3c? ([2601:646:9200:a0f0::f3c])
        by smtp.gmail.com with ESMTPSA id
 c15sm14677757pfo.178.2021.10.18.21.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 21:03:16 -0700 (PDT)
Message-ID: <57f7af15-830f-690c-d864-960105686bad@gmail.com>
Date: Mon, 18 Oct 2021 21:03:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [oe] [OE-core] [PATCH] libgit2: upgrade 1.2.0 -> 1.3.0
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 04:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93450

this patch should go to oe-core mailing list.

On 10/18/21 19:17, wangmy wrote:
> New Features
> Support custom git extensions by @ethomson in #6031
> Introduce git_email_create; deprecate git_diff_format_email by @ethomson in #6061
> Deprecated APIs
> git_oidarray_free is deprecated; callers should use git_oidarray_dispose
> Bug fixes
> remote: Mark git_remote_name_is_valid as GIT_EXTERN by @lhchavez in #6032
> Fix config parsing for multiline with multiple quoted comment chars by @basile-henry in #6043
> indexer: Avoid one mmap(2)/munmap(2) pair per git_indexer_append call by @lhchavez in #6039
> merge: Check file mode when resolving renames by @ccstolley in #6060
> Allow proxy options when connecting with a detached remote. by @lrm29 in #6058
> win32: allow empty environment variables by @ethomson in #6063
> Fixes for deprecated APIs by @ethomson in #6066
> filter: use a git_oid in filter options, not a pointer by @ethomson in #6067
> diff: update GIT_DIFF_IGNORE_BLANK_LINES by @ethomson in #6068
> Attribute lookups are always on relative paths by @ethomson in #6073
> Handle long paths when querying attributes by @ethomson in #6075
> Code cleanups
> notes: use a buffer internally by @ethomson in #6047
> Fix coding style for pointer by @punkymaniac in #6045
> Use typeof GNUC keyword for ISO C compatibility by @duncanthomson in #6041
> Discover libssh2 without pkg-config by @stac47 in #6053
> Longpath filter bug by @lrm29 in #6055
> Add test to ensure empty proxy env behaves like unset env by @sathieu in #6052
> Stdint header condition has been reverted. by @lolgear in #6020
> buf: common_prefix takes a string array by @ethomson in #6077
> oidarray: introduce git_oidarray_dispose by @ethomson in #6076
> examples: Free the git_config and git_config_entry after use by @257 in #6071
> CI Improvements
> ci: pull libssh2 from www.libssh2.org by @ethomson in #6064
> Documentation changes
> Update README.md by @shijinglu in #6050
> New Contributors
> @basile-henry made their first contribution in #6043
> @duncanthomson made their first contribution in #6041
> @stac47 made their first contribution in #6053
> @shijinglu made their first contribution in #6050
> @ccstolley made their first contribution in #6060
> @sathieu made their first contribution in #6052
> @257 made their first contribution in #6071
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../libgit2/{libgit2_1.2.0.bb => libgit2_1.3.0.bb}            | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-support/libgit2/{libgit2_1.2.0.bb => libgit2_1.3.0.bb} (80%)
> 
> diff --git a/meta/recipes-support/libgit2/libgit2_1.2.0.bb b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
> similarity index 80%
> rename from meta/recipes-support/libgit2/libgit2_1.2.0.bb
> rename to meta/recipes-support/libgit2/libgit2_1.3.0.bb
> index 6df42e473f..580fa41c21 100644
> --- a/meta/recipes-support/libgit2/libgit2_1.2.0.bb
> +++ b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73fa96e40ce64f79bab087c7e1deeacd"
>   
>   DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
>   
> -SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main"
> -SRCREV = "4fd32be01c79a5c003bb47674ac1d76d948518b7"
> +SRC_URI = "git://github.com/libgit2/libgit2.git;nobranch=1"
> +SRCREV = "b7bad55e4bb0a285b073ba5e02b01d3f522fc95d"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93444): https://lists.openembedded.org/g/openembedded-devel/message/93444
> Mute This Topic: https://lists.openembedded.org/mt/86431067/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

