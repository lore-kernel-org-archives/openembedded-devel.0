Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.1160.1618867061122094000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 14:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cAdbysPj;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id nk8so5508135pjb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Apr 2021 14:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+Zwpb/JQ7gpMBsgJKbUbmBU4iPfs3RG4fmw0oYmvn2g=;
        b=cAdbysPj5Xf7HYH+SvQgvZ2Cgb/ppJ9vxxxD+djqPz5ujxNb42NxYc78QN4/MwTEKb
         QL6DjbOagBPTZKxKl+RdnW/w05uytxC6ZrBMgWSMwQroAYYEJAMYpEAmSXD7499VuZdw
         qUWzDVGlMi4CojatYs15PnQTD9t5RBRm5LmsVNwbnaiCoGi4ka1//d/BLyqnkVej01qV
         gX8zyYaHZRtBUeAr84mbCE/FZ20MT8rAe199wzdKANKK2aqQDO0ujaHbN5B3ngEGe4gb
         dbD6Os7l2gdi9zos8SW+lqEO4dLjLQSksLuCVITdS55xmfYZT45mfH9nvLr3jEC1VYNp
         3MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+Zwpb/JQ7gpMBsgJKbUbmBU4iPfs3RG4fmw0oYmvn2g=;
        b=N9y291UkLGYIsW/WWuCldc35pX9CETDUfB5Z76NiWKs3djAsmpREm7hmjy2HkIdpyh
         iJhnePhGsy+sDUp9D8p8G79t+QtznRMOSP0HI9TDFi2v5fS7YmIKit7NACwe9eQxjjvu
         MEJQknVAoGs8xNO7w+f/PaMQZfMjLvNCRz85raBRtS/2kf+bSFgB8UFalq04FS1y72yA
         l0ClUsRhP1P5FFcFQtqWhiUlZLHPUmRwjG/E3VxcJbiXGEQLj+xo8H0uApluoFKZbpIR
         bpoVZulfeNotor0UmbX+oD5KUl1Uc2MPOdLVOW+eg7KjyK6YgCqkYu4mCgNNvp9d2tL6
         Oc7g==
X-Gm-Message-State: AOAM531pMMpHNN9fuKF2FGeed34e61+SGZdCseccCclw03Tl56n4xbzR
	duW7dZJ5lRUkllh8APq9trc=
X-Google-Smtp-Source: ABdhPJwkxnQ9d2d7R6OnUmkYMSNt86MMAaiLmPD42HhHRQguM2GaIPuxSNHBq4qRkCnTMjrE8+MBNw==
X-Received: by 2002:a17:90a:2807:: with SMTP id e7mr1153990pjd.181.1618867060659;
        Mon, 19 Apr 2021 14:17:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:692a:2f5c:cdd4:70fe? ([2601:646:9200:a0f0:692a:2f5c:cdd4:70fe])
        by smtp.gmail.com with ESMTPSA id u21sm12574231pfm.89.2021.04.19.14.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:17:40 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 0/1] proftpd update
To: Andrej Kozemcak <andrej.kozemcak@siemens.com>,
 openembedded-devel@lists.openembedded.org,
 Armin Kuster <akuster808@gmail.comt>
References: <20210419075251.21268-1-andrej.kozemcak@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a06c5c87-e9c7-9014-a06c-ae6800f0fe85@gmail.com>
Date: Mon, 19 Apr 2021 14:17:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419075251.21268-1-andrej.kozemcak@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/19/21 12:52 AM, Andrej Kozemcak wrote:
> I would like to apply this update also to dunfell branch, if posible.
> Because there is lot of bugs which is not a posible fix with the easy
> way.

This is a leaf package so I think it might be ok from dependency point 
of view, I would leave this to Armin and other interested community 
members to weigh in for dunfell backport.

> 
> Andrej Kozemcak (1):
>    proftpd: Update to 1.3.7a release
> 
>   .../proftpd/files/build_fixup.patch           | 69 ++++++++-----------
>   .../proftpd/files/contrib.patch               | 29 ++++----
>   .../{proftpd_1.3.6.bb => proftpd_1.3.7a.bb}   | 12 ++--
>   3 files changed, 47 insertions(+), 63 deletions(-)
>   rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb => proftpd_1.3.7a.bb} (93%)
> 
> 
> 
> 
> 
