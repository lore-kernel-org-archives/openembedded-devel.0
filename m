Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.764.1602008426696377149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 11:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xavcrmvz;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id g10so6267110pfc.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2020 11:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=h3BbII92s3lwmfsXqqrjk9w3TcuE8O6DPsX4AuoLJfI=;
        b=XavcrmvzvUrmyVgagICwSZB5PnLyLoWhq/9c2ffMZTCZrZ4X7KGDKNfFY7w8mywKRq
         1EOMToKV77NZyG1EWyF4/EwweF2J19cURBmkDnohltHhlt2kq0W/m5U9dDJzwqKHEKwB
         Wz/ffwNwlujdxLBgLDr901ylac0d7C21oNJ+eQmxFQxVF0QYuXiXI+YRk10iQM/C25AH
         tl0R9tV94mBQGVs/UwlapZbBOiuYMLdk+Rmgy+vicv65iiOIVFCQuJII6QTTov3+HP/3
         R1NPwtuNM886PsMdrrVXgAYqTp5KMECOYZ7G5mKM+K+DdPQzcnJ1QiiCmGaRlSZ7PQLb
         mmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=h3BbII92s3lwmfsXqqrjk9w3TcuE8O6DPsX4AuoLJfI=;
        b=eTuMSuj+neEzMQDCF9J81UmJRvaOAIKbTJdt37xGfAVLeDTbuCDbqRAK2hQto3YKXD
         rUzJ0ot3fVMc3AdrgMCwq8kWxXM4274FTFxh99vykVan8Y7Mtiy2QJHjYpCLYpJYU8R4
         1PwhMl+fc/g90NX3hd/y5kfdNV09K6hdfMjT3VX6Eq7QVcajOWX/QG+jYFA2P5VVi19N
         FbFnUvTDHU1/RhH9zJ6MxJaDNn+X1q9ihi7PZe7C7XucUQz63OH4XHYJGZShED2RysRq
         /poxLWWjeqX+AdxMSlR5mya1F/BnqFDGW59XfEeqBz/Dwfc1ptJ3ONnKRW4KkgsBnQJb
         +JlQ==
X-Gm-Message-State: AOAM531eaLVJw+nlkxixnFSItTkibwZPsFu9o/4+gc6oKUC6O2c3/jv9
	izDyEhkWzHkdoGmcVgBU6N39QNUvkOE=
X-Google-Smtp-Source: ABdhPJweXZDtJrEvb1E+scEmzr6D1F4BDVypTyXA6v2205TaERY24ZhZG1/VN27LMf707qMzK/3/sA==
X-Received: by 2002:a62:92ca:0:b029:13e:d13d:a07e with SMTP id o193-20020a6292ca0000b029013ed13da07emr5652749pfd.21.1602008425718;
        Tue, 06 Oct 2020 11:20:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2470:323d:eaed:9986? ([2601:202:4180:a5c0:2470:323d:eaed:9986])
        by smtp.gmail.com with ESMTPSA id q2sm4266869pfu.193.2020.10.06.11.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 11:20:25 -0700 (PDT)
Subject: Re: [oe] wireguard-module broken in dunfell
To: veilleux.cedric@gmail.com, openembedded-devel@lists.openembedded.org
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
 <10765.1602004777092046892@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <7783209f-0e7e-fc17-d7ab-49cc9ba1afee@gmail.com>
Date: Tue, 6 Oct 2020 11:20:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <10765.1602004777092046892@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/6/20 10:19 AM, veilleux.cedric@gmail.com wrote:
> I had the same issue and could not figure out what broke the
> wireguard-module package.
>
> I had to resort to bissecting changes in meta-yocto.
>
> I finally isolated the change that breaks wireguard-module:
>
> 87c9d29635 package: get_package_mapping: avoid dependency mapping if
> renamed package provides original name
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=87c9d296357638082f5a7131a87365285fc813c4
>
> It seems the package renaming that wireguard-module does (PKG_${PN} =
> "kernel-module-${MODULE_NAME}") no longer works after the above commit.

I have not seen this on any of my dunfell world builds.

Do you mind providing a reproducer e.g local.conf ?

-armin
>
> At this point I do not understand the change regarding renamed package
> names and dependencies enough to recommend the appropriate fix to
> wireguard-module. I have been able to workaround the issue by renaming
> the package kernel-module-wireguard and thus avoiding the rename
> altogether.
>
> 
>

