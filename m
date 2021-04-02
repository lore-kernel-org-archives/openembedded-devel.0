Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.20567.1617388297548329641
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 11:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bBKp0dyu;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id c17so4071289pfn.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Apr 2021 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B4rZwxc5Si2jIK99VKbDFage5cpzO1+CAckkVmjUF5U=;
        b=bBKp0dyuout7H2Zx1oYvafqn3C9PWjxK15fuL9t+WCz1ozQ33vZTiLesoOUBscfLmi
         O0AROQXqkCuCuCWwx/uW6rx8KxUvOSWBQlTuJHTqvz0p2cjFUGmN2KUyMV4Xus4UOAa6
         94lqAHcO0qqBnIz5DReLDpBIChI6b8M2dT/0pYuyLulZfG57GImd1iRFD9kxuvqeAS5E
         Oucy5EFh3CC7GgjTBfnnYJ+KzJJrjMG5TYv1tNfebwImHu6koFimc51Yc36i3nsIfFCw
         ttOyQCqH4vzdfU1t+w7f9K96t/7r1V+OclA7NC5BIN9lvLUYI8fIAr5ae8riMc3d+qNz
         Jk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=B4rZwxc5Si2jIK99VKbDFage5cpzO1+CAckkVmjUF5U=;
        b=MTO1EjAgbWkGeT+Onjb02c5TL45zOvBxVp3zbJ7xD1ibXe//EP9//Ohr+UMcQ05zUk
         8RSwv5JzHJNwfcyyL8krQYDGBKCZPuFW164t8c2+wCTfI/opsS+8ldoTNfky3l8QLFQx
         hneMvnBbbZorAJtYF3e+zhyJklHV6ZIT870qbyQE3wwKyOS+oP1oLfGFx5B6IjXrEFg7
         g9ii57Zy5q+t/3xfnkDLyt16toIP8zVP9wZDk2BqDkFv1FPqB9Ix6UykBscq0i0oyLd5
         4E/KgeX+dHnIe8YrgolfSHqPVp8M6uNGT6dr7uCqEc+G1zrCPR+Ew/NkBuGokdwR01gf
         Qn5Q==
X-Gm-Message-State: AOAM531l0cOFFNn12swSnhDirvZPJJk43lHbG7r+QAknPl2XjnZzYvpU
	XM6FkvzbXBx2jYNa/kqtBOlgJal0thoOVw==
X-Google-Smtp-Source: ABdhPJzRTVfpl77cUNbIpW3qT3W4l2lZb+UM+B/eGo08W/3O0tCvX7Nz3+0qw//4zd+6CaLCGzQ9Lg==
X-Received: by 2002:a63:5361:: with SMTP id t33mr12896124pgl.439.1617388296549;
        Fri, 02 Apr 2021 11:31:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:8564:e4a5:b7a6:9dee? ([2601:646:9200:a0f0:8564:e4a5:b7a6:9dee])
        by smtp.gmail.com with ESMTPSA id e3sm8823569pfm.43.2021.04.02.11.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 11:31:36 -0700 (PDT)
Subject: Re: [oe] [meta-perl][PATCH] libnet-ssleay-perl: add rdep on perl-module-autoloader
To: Awais Belal <Awais_Belal@mentor.com>,
 openembedded-devel@lists.openembedded.org
References: <20210330081327.2667-1-awais_belal@mentor.com>
 <31669.1617365102303250650@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5829492e-0562-cb01-9b48-bef601e7efed@gmail.com>
Date: Fri, 2 Apr 2021 11:31:34 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <31669.1617365102303250650@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

always check in master-next if its there then it will land in master 
shortly.

On 4/2/21 5:05 AM, Awais Belal wrote:
> ping!
> 
> 
> 
> 
