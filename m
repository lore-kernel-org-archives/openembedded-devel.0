Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.13771.1631301110569837084
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Sep 2021 12:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PAcfuiri;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id y17so2684066pfl.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Sep 2021 12:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=CHEBU2NE62CAakvCaqH3Z7D+VMqZG/9U2KAQLsXrJgQ=;
        b=PAcfuirilcHKhiT3VxO4eSW7dox97XwNVFMVXDX2Lhwx+JbsRdXYRHN/Um731YtrFW
         GuIn0c+HJYWa+TulUbdXvUi6nSmJCPICqwbFeyu0pCL1RZNx6kNcpOEmp5gBsEFjpcjZ
         7qtaa4YwgzMTwqHpWhN9yxh+59FknUFTtfHFAU63FfthbqTKvzH9JBC3xRvhiXDP5JhM
         lJdXKInl9tgZXoF11v9SW/0CkSPymlrE02d/UKZ9lyhRSoPtPNKa3NDZTs0u9C0Hlfn9
         O8jVJJMXUBUgrZPLbAQr7nEKRbLWkgpf+9LVPLCNpl4vM8z1Y03U/qE1E/UAlQvVtrSv
         DSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CHEBU2NE62CAakvCaqH3Z7D+VMqZG/9U2KAQLsXrJgQ=;
        b=cdXW4vbnrdPe5gkUlXyFbbcmUVGfu3clNOCoOLKqouDYIgKgFBeauPUKyisiJYYMUu
         Fi0utx/C8AH5XryOE/w9NjhE9TQpQ4AOMFvA+51VJuvQzYiLN9VpAMzqq5q+hjK8KMkW
         VV4w5syOckTdJEL02TbFBraC8lXSWrA87dF3D9UQZew/PkPdyN4J+6tu+f3gkRVtLrwW
         Y69WVDvUzR8/79lU2cj2NoW7wi7YF/MQ90BtdCpcEphs0CAJoy9qO4TKLvmrS9udYmAL
         0CV2tzHqwCIy34pTEGWAbwZ9kS9xLbR+0kUZ8TFQGa1i1WuN2CjBBkbKrRHT+gSkcQp0
         EK2g==
X-Gm-Message-State: AOAM533Crl2d+SA2PLIrcfc8JEqGlITbVkE7XX9dpUdNoo7/yVW9T6mw
	MINEKy1t+szmoadC016/4mfBo1L9U2Y=
X-Google-Smtp-Source: ABdhPJxeDz4uE+UwIBAXNtttVIXqkJliMEOlbU+wMdZJ0/SgX9Q7z59oGtL3BdD9D0FIKLdxiYhFDQ==
X-Received: by 2002:a62:61c1:0:b0:414:5e28:d8 with SMTP id v184-20020a6261c1000000b004145e2800d8mr9594310pfb.45.1631301109632;
        Fri, 10 Sep 2021 12:11:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9fd1:b728:fff3:766f? ([2601:202:4180:a5c0:9fd1:b728:fff3:766f])
        by smtp.gmail.com with ESMTPSA id 21sm5467748pfh.103.2021.09.10.12.11.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 12:11:49 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] Remove patch that produces a segfault in the ptest of lua
To: openembedded-devel@lists.openembedded.org
References: <20210910162949.3732-1-dl9pf@gmx.de>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <b7a54a10-9ac5-14da-a292-540dc4ae85c1@gmail.com>
Date: Fri, 10 Sep 2021 12:11:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910162949.3732-1-dl9pf@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/10/21 9:29 AM, Jan-Simon Möller wrote:
> From: Jan-Simon Moeller <dl9pf@gmx.de>
>
> The patch file CVE-2020-15945.patch does cause a segfault in the lua ptest (db.lua test).
> According to upstream developers the patch is not correct and causes the segfault.
Their patch or the one ported to meta-oe as in a incomplete backport?


-armin

 
>
> Reproduce: build core-image-minimal with lua and ptest-pkgs on .
> Run: ptest-runner lua
>
> This test passes if the patch is removed.
>
> Please also backport to dunfell as well.
>
> Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
> ---
>  meta-oe/recipes-devtools/lua/lua_5.3.6.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> index f830e0925..af3054dcb 100644
> --- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> +++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> @@ -8,7 +8,6 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
>             file://lua.pc.in \
>             file://0001-Allow-building-lua-without-readline-on-Linux.patch \
>             file://CVE-2020-15888.patch \
> -           file://CVE-2020-15945.patch \
>             file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
>             "
>
> --
> 2.32.0
>
>
> 
>

