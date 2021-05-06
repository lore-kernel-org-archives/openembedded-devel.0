Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.1608.1620317606195145265
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 09:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dM827nF2;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id b21so3684906plz.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0ATGgn7sWfRn/zZC6wWEW+dnqsrKoWsVawRdpbu893w=;
        b=dM827nF24qdF6ynxTnTT9j9gXCM0Vz3ap5Youdq/5R7Mb0uUAVx2GIebSee0MpXK+w
         H1vr4N39K/HCfT4JQ+goId+h7G8O9vC0zya2Oqda3gU7b0HaeCUzSPXkgS0WM3478hl3
         GbHnxOMV8EWQ/hK4ZnlRkj+4cT/p6KkzQq3vDd6h3bXk69j3B6nGT7FbmpokvsLOTZU2
         boPIfQcrNLysgiZNpr3hUdhb52ImrKVml8EBxUFA4oDUuia0/34xeFq9kGe5U/4/e1Iw
         b2zzDLPw3ifpeCfvQQt7EBM59c9WTGHW4B1QGD/Trx9M3rlzoFoPItXVY+3jXMnyG/ET
         tSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0ATGgn7sWfRn/zZC6wWEW+dnqsrKoWsVawRdpbu893w=;
        b=n9PyvkHup3Sv9piLspg4GlzcG3NWGFWjPnEGh3AuJNGhglyV7P+EVAfGNoE/xw+PXp
         r3kUaI5aJ2apt0lceife79qKyzwY9Tloxv1AsN4+kb9lPXyUTlR32EqE9vO9JGQOrvwy
         XYC3+lHt0w7aXcIATjuZcLGXYhx0DzgI4Zn0WP9IKOeff8rfnsFguR2SzIVl9kBYBjVz
         j7GarcSJuxw2KsO3Vs55BZBOJRtwQ/6C+vGgAeuQ9Dfjg+rmXlazr3nKXnCOZcd+thp7
         GC+VciDtKA2yIxV2djiiOV9CIujd3sD73FVcgsrP1v1c44dCgFnftx80b+cNyn4cZvrZ
         /lrw==
X-Gm-Message-State: AOAM533EpJD8qqvzJvaNzSui3wiGwJ1bVqDqh7AC3CbsCaQAx8cwdsnr
	THg3kpQUcs9dUQ4HQ0WAUrZjFG/6IjXEDQ==
X-Google-Smtp-Source: ABdhPJwcw2RDYyqKY9fJG7wyv5dQQhoFF4+hs84LAUD812ra6Ep7eZLfa4zInS9Ym4bvpmvSLhK3Gg==
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr18332619pjp.220.1620317605438;
        Thu, 06 May 2021 09:13:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4c88:9139:83c4:7426? ([2601:646:9200:a0f0:4c88:9139:83c4:7426])
        by smtp.gmail.com with ESMTPSA id x13sm2837754pja.3.2021.05.06.09.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 09:13:25 -0700 (PDT)
Subject: Re: Gatesgarth-next merge request: May 6
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <1f41ca9d-1cd1-b4af-c107-5ca152360976@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <95965d73-f2e2-068f-8ab2-13789a660c69@gmail.com>
Date: Thu, 6 May 2021 09:13:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1f41ca9d-1cd1-b4af-c107-5ca152360976@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

merged thanks

On 5/6/21 6:31 AM, akuster808 wrote:
> The following changes since commit 29ca52c7826ad3044b53ccb5224016bd73abdb5c:
> 
>    gpsd: backport d-bus message time patch from upstream (2021-04-18
> 20:03:23 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded gatesgarth-next
> 
> for you to fetch changes up to 70ee7293017c4f38fee71ffdb60e4713fdc88bcf:
> 
>    nodejs: 12.20.2 -> 12.21.0 (2021-04-29 21:41:27 -0700)
> 
> ----------------------------------------------------------------
> Armin Kuster (2):
>        nostromo: Blacklist and exclude from world builds
>        packagegroup-meta-webserver: remove nostromo from pkg grp
> 
> Clément Péron (1):
>        nodejs: 12.20.2 -> 12.21.0
> 
> Sean Nyekjaer (1):
>        nodejs: 12.20.1 -> 12.20.2
> 
>   .../recipes-devtools/nodejs/{nodejs_12.20.1.bb => nodejs_12.21.0.bb}
> | 2 +-
>   .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb
> | 1 -
>   meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
> | 3 +++
>   3 files changed, 4 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb =>
> nodejs_12.21.0.bb} (98%)
> 
