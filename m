Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.48.1616606341997481041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WJ50UW8i;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so1575911pjv.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 10:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6A2YtboNqoWVyOOeSVbMZHLEl13ZBe15xwYIYJTtHlg=;
        b=WJ50UW8iHfYT1e0ha+x7uZLkqvuvFun3/KjCMuDuzeG+IkRrvapFRwscvuBCpnR+ud
         b9ndWh3v++3fKMeBDhCVUzT+h2FhDvWWwP5zKZoya26/YGqyLgjSiBD+oXZrEKWqsw0s
         sTQusy1nYTSKzcscDxaBVGugePFzUrdvNZGI44UVlnRaN9XwN8rLZ7rdK6LOsfwxK6Nf
         fe4mX6xxzrh8FV8fRWlgLOcVb5qiSNuWHm54GiwEdxNHrTUhTN0QEnEy4t3CJcMbLbOB
         Bt58K92bhkWWgCwZXbcNqoDo93yx7Ac/vWUZAvVBdPKGfPiey8fcxNyUUnk55hLgGXrr
         8Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6A2YtboNqoWVyOOeSVbMZHLEl13ZBe15xwYIYJTtHlg=;
        b=ZFw6nJ+s+Wg72AGSwDyWjL5kv083MO5/263qUnbi2LDQ1dOeVRLLm3eNgeU7+SsUKZ
         EwYjO0YwfGghdoMj9XIqUMmmR1JyG9oRsY5hl/ZB4GrFs5FmbZHAk4TNoHDu1fVmfVed
         TS26xjATn6jqaixeDXR2niX3WjbCcQxOU5bWpJtg7Kac9log3AEgSvzM8xLU7JqPB3zu
         ARDrwtS+qqItgY/LTNUSRRtvoTHjebmEpMQiggrR6QMshst0F5OmPoZy1o7PUlLPMDpo
         CxqmQsuF0Oy9W4880jtFkt5k8TQDgTN6IdervtnsU86zGF5EJxV0XhYtOU5VDXUKSxpi
         d/Vw==
X-Gm-Message-State: AOAM5302uIOfvg4/56uqJA/35r+awavUnnVipFOm7FEUTu2NfvVvE2dJ
	sU8Eqt1WJd+HYrajwmeWF7g=
X-Google-Smtp-Source: ABdhPJzPcqyZdEvXqFmXuPtQCJ8yUhuIyr1kxQ0hqSYPsBLpHe74+cblH29X4PSofi/6Hedn4w1cOg==
X-Received: by 2002:a17:902:da91:b029:e5:e7cf:d737 with SMTP id j17-20020a170902da91b02900e5e7cfd737mr4599975plx.24.1616606341289;
        Wed, 24 Mar 2021 10:19:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:2da1:1afd:1712:ea8b? ([2601:646:9200:a0f0:2da1:1afd:1712:ea8b])
        by smtp.gmail.com with ESMTPSA id x4sm3062635pfn.134.2021.03.24.10.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 10:19:00 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] guider: Upgrade 3.9.7 -> 3.9.8
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Peace Lee <iipeace5@gmail.com>
References: <20210323211230.1639990-1-raj.khem@gmail.com>
 <CA+chaQfR+Fp2B10=fLT9rDpMVgUb6nxe_xcE47eAMWJYC_q4WA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ed275b86-aa59-efa3-68f8-46a920092d85@gmail.com>
Date: Wed, 24 Mar 2021 10:18:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfR+Fp2B10=fLT9rDpMVgUb6nxe_xcE47eAMWJYC_q4WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

sad but true

On 3/24/21 9:42 AM, Martin Jansa wrote:
> The PR on github changed SRCREV couple times (while calling it 3.9.8 
> whole time) and the currently latest version on github says
> 
> SRCREV = "bab995ce718b58d4b5fee594771884dea238d70a"
> 
> On Tue, Mar 23, 2021 at 10:12 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     From: Peace Lee <iipeace5@gmail.com <mailto:iipeace5@gmail.com>>
> 
>     Upgrade to release 3.9.8
> 
>     Signed-off-by: Peace Lee <iipeace5@gmail.com
>     <mailto:iipeace5@gmail.com>>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     ---
>       .../guider/{guider_3.9.7.bb <http://guider_3.9.7.bb> =>
>     guider_3.9.8.bb <http://guider_3.9.8.bb>}             | 6 +++---
>       1 file changed, 3 insertions(+), 3 deletions(-)
>       rename meta-oe/recipes-devtools/guider/{guider_3.9.7.bb
>     <http://guider_3.9.7.bb> => guider_3.9.8.bb
>     <http://guider_3.9.8.bb>} (78%)
> 
>     diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>     <http://guider_3.9.7.bb>
>     b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
>     <http://guider_3.9.8.bb>
>     similarity index 78%
>     rename from meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>     <http://guider_3.9.7.bb>
>     rename to meta-oe/recipes-devtools/guider/guider_3.9.8.bb
>     <http://guider_3.9.8.bb>
>     index 88fad936ba..91693d8626 100644
>     --- a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>     <http://guider_3.9.7.bb>
>     +++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
>     <http://guider_3.9.8.bb>
>     @@ -1,4 +1,4 @@
>     -SUMMARY = "runtime performance analyzer"
>     +SUMMARY = "performance analyzer"
>       HOMEPAGE = "https://github.com/iipeace/guider
>     <https://github.com/iipeace/guider>"
>       BUGTRACKER = "https://github.com/iipeace/guider/issues
>     <https://github.com/iipeace/guider/issues>"
>       AUTHOR = "Peace Lee <ipeace5@gmail.com <mailto:ipeace5@gmail.com>>"
>     @@ -6,10 +6,10 @@ AUTHOR = "Peace Lee <ipeace5@gmail.com
>     <mailto:ipeace5@gmail.com>>"
>       LICENSE = "GPLv2+"
>       LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> 
>     -PV = "3.9.7+git${SRCPV}"
>     +PV = "3.9.8+git${SRCPV}"
> 
>       SRC_URI = "git://github.com/iipeace/${BPN}
>     <http://github.com/iipeace/$%7BBPN%7D>"
>     -SRCREV = "459b5189a46023fc98e19888b196bdc2674022fd"
>     +SRCREV = "f2e6d84ffa341728daf0cc2ba2736d58008ea9f1"
> 
>       S = "${WORKDIR}/git"
> 
>     -- 
>     2.31.0
> 
> 
>     
> 
