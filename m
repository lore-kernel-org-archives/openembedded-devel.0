Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.66.1623774905426294547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 09:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bz9l3C6e;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id z26so13675889pfj.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UEfWh6Fk6bPHuPMxgJnu2a3KXQYkP26g8h+slREzSmA=;
        b=Bz9l3C6erlaMvwFLHlE/MfnwYrMrxqYJmCXZIcCNugTnVQ/m8NLGmt16xiJchmVZz3
         40dt4+WM7oDJHNUvOgOdpmHnJ/Ibuvj57Wyllu4k7vFyoybFbi6Gr1a1Ctaw92EPDvtC
         EMLzfsTOGKxTQ0AIFZ6M3M39TQNI6CL0BfPysAy5fW/1eYxCzYcvIuCksobLtAHH8zFK
         fo2Jl63mAhvQ7tp9Up1rNAoLcGcqbJcgFh2gJdwkvt59p/zeRlgJVCU/gcFWDpMDoxYy
         I/IpkevyP3GI1iA10LMfLnRUXG5a80Ji5kmL4YA8uBfWMmod4ibzNvyDhxySka9NsZL0
         4HHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UEfWh6Fk6bPHuPMxgJnu2a3KXQYkP26g8h+slREzSmA=;
        b=SJp+4qGyO2Rk6wmsMa0iwuAlTewQzTHeLi89dQzYpdCL567kDSBLoaRSUnk1Xg725K
         90TUMDfnMKUik5vrwC0XRsrBpmzC9rzvy93HmcrIdFSCAlC5Vhv5IqsQOH6cHvtHohMx
         fxz2HaFxDqDnkBALMUKgbrm/c5+LoQlA9s34mBpedJeBeRGr2G/rqKkCnCYPF3UJA+5/
         LeS00MY9LqpI7f5AhER44XcTWGBYyg8ihQziFEh5wc1h5XTy9FbeuooeqQPv4NVwrxxz
         xxYI5vj9BLLUrpwfa4LFUgA54vw/jcH9iMn7xxB4B/XVju6VrPO5PmE4blyooBCV4nsF
         dnuA==
X-Gm-Message-State: AOAM530vVvZkDnPzKC8T8sPOq0z8HNT+b0BjsGPWvj3VWgRg3iq1lxUa
	C4XrzBAVTSSeivnlYNSpbws=
X-Google-Smtp-Source: ABdhPJzYdrU+htZysKg45pOWB49LKvtV1l88MDkSxgcr7xh/FArzZhEiwsveOmzSmZBmWTDZkipCLg==
X-Received: by 2002:aa7:9515:0:b029:2e9:c6f4:2c44 with SMTP id b21-20020aa795150000b02902e9c6f42c44mr5419974pfp.28.1623774904686;
        Tue, 15 Jun 2021 09:35:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d088:fa89:ac40:a9cc? ([2601:646:9200:a0f0:d088:fa89:ac40:a9cc])
        by smtp.gmail.com with ESMTPSA id x36sm15951362pfu.39.2021.06.15.09.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 09:35:04 -0700 (PDT)
Subject: Re: [meta-openwrt][PATCH 0/7] Use meta-openwrt for i.MX6 with Poky
To: Mark Jonas <mark.jonas@de.bosch.com>,
 openembedded-devel@lists.openembedded.org
Cc: kevin.zhang3@cn.bosch.com
References: <20210615154049.173769-1-mark.jonas@de.bosch.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <fbdcc3ca-e4d4-732a-f1a4-5d0a6fe79f38@gmail.com>
Date: Tue, 15 Jun 2021 09:35:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615154049.173769-1-mark.jonas@de.bosch.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/15/21 8:40 AM, Mark Jonas wrote:
> We made an experiment to build OpenWRT using meta-openwrt and Poky
> Dunfell on a i.MX6 Solo platform. For making it build and run we had to
> apply the following patches. We hope that the patches help the further
> development of meta-openwrt and maybe we get helpful feedback in return.
> 
> Kevin Zhang (7):
>    layer.conf: Add dunfell to compatible releases
>    netifd: Remove dependency on bridge module
>    base-files: Do not use /etc/group from OpenWrt
>    base-files: Create /run/lock directory
>    busybox: Supply patches for different versions
>    lucihttp: Add recipe
>    luci: Fix error module 'luci.util' not found
> 
>   conf/layer.conf                               |  2 +-
>   recipes-core/netifd/netifd_git.bb             |  1 -
>   recipes-extended/luci/luci/cmake.patch        | 15 +++++-
>   recipes-extended/luci/luci_git.bb             |  2 +-
>   recipes-extended/lucihttp/lucihttp.bb         | 23 +++++++++
>   .../base-files/base-files_3.%.bbappend        |  8 +++-
>   ...t_misdetection_triggered_without_LFS.patch | 47 +++++++++++++++++++
>   ...t_misdetection_triggered_without_LFS.patch |  0
>   ...t_misdetection_triggered_without_LFS.patch | 46 ++++++++++++++++++
>   recipes-tweaks/busybox/busybox_%.bbappend     |  1 -
>   .../busybox/busybox_1.31.%.bbappend           |  7 +++
>   .../busybox/busybox_1.32.%.bbappend           |  7 +++
>   .../busybox/busybox_1.33.%.bbappend           |  7 +++
>   13 files changed, 160 insertions(+), 6 deletions(-)
>   create mode 100644 recipes-extended/lucihttp/lucihttp.bb
>   create mode 100644 recipes-tweaks/busybox/busybox-1.31.%/z300-fix_off_t_misdetection_triggered_without_LFS.patch
>   rename recipes-tweaks/busybox/{busybox => busybox-1.32.%}/z300-fix_off_t_misdetection_triggered_without_LFS.patch (100%)
>   create mode 100644 recipes-tweaks/busybox/busybox-1.33.%/z300-fix_off_t_misdetection_triggered_without_LFS.patch
>   create mode 100644 recipes-tweaks/busybox/busybox_1.31.%.bbappend
>   create mode 100644 recipes-tweaks/busybox/busybox_1.32.%.bbappend
>   create mode 100644 recipes-tweaks/busybox/busybox_1.33.%.bbappend
> 

Looks good. Can you create a GH pull for this please ?
