Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.39929.1629210121344016779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Aug 2021 07:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iiEey0zn;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id q2so25023865plr.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Aug 2021 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=bVZ3Wn0Sv2uRivg8uqSeg5UkhcxezaIS36g0cltw0tU=;
        b=iiEey0znifkd0pq0XgE3HCsJ8ATxNL3O8rKsL4wT6IMCDaq7He9g/nFPMaIhyexRg4
         wArhtbXqRy9qFG72JBAtyu4ypqvpLq024V4vIbhRH+JGWmTXex7dFnSW3mPlp6TCvlqb
         OrnPktQ/wy9RSjT5UWDKlcryIfCsE9HtXR4cWVtYxDmic0lxpWAMN0Q6tgBZ42JUgWOd
         VE4pIWtGsgsUrYkSk9AjpYsIzvRRxfeu88hdVKWQtpVkcwmwDdbJeC5Cxftveo0rfTdv
         UzJlb3WgKBVNW1jeaNE0FM/5JQBpctiWQPdWzIPFuxvCwnMegOoQVzowzu8sLJ/2dIMg
         kdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bVZ3Wn0Sv2uRivg8uqSeg5UkhcxezaIS36g0cltw0tU=;
        b=JFUj9EMuFgEStKwsXNHtd1NRi8J8ArdC3I8adxXmK7c54KXv6K8IvF2F2gkuhRJa3Q
         XrMQJbfo6SA/ZE2Jt8gABwpnP2b8GbPjY9nsuEjR/fMTjO0ahbSiTwQnSktb8qlY3YZ3
         Gtg3lst0Sc/FXjRgyJ6reqoOeEEXF3ghA8gqFlNf71cUOG2kSHVLWeWDUxojdMs/fjau
         Yx/A7CVS61lc1+YfnAvncnikre7/38N8ZkWMrN/l+bwaBe34NMo3u14YGhn3/DhG/UWC
         hWbUnXWYpYnr3+3b+NqTmdvdYggUuekStr1oBtd3EqO6fYAYIUhAuzC25v8ShBzXoFOw
         f+ig==
X-Gm-Message-State: AOAM532eucE6v/4WoXdEVlyOowkcARvJ6g2MwCjOWtuBl6IEriQjFSgl
	iHEKIpB9ahCQl3fZnk6VHHrDvt5PB/8=
X-Google-Smtp-Source: ABdhPJyQzQUVJdmu3eRdfMdnl9uIFziAdcHaoq4gZWMwcbKL/5eb/SBFeZbE4fZRpS5TKwQcplJn/g==
X-Received: by 2002:a05:6a00:1989:b0:3e2:a387:e1d9 with SMTP id d9-20020a056a00198900b003e2a387e1d9mr1873364pfl.64.1629210120632;
        Tue, 17 Aug 2021 07:22:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:642:c401:56fa:2754:6458:9fb2:c7c? ([2601:642:c401:56fa:2754:6458:9fb2:c7c])
        by smtp.gmail.com with ESMTPSA id z131sm2985646pfc.159.2021.08.17.07.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 07:22:00 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] backport: xmlsec1: Fix configure QA error caused by host lookup path
To: =?UTF-8?Q?Jan-Simon_M=c3=b6ller?= <dl9pf@gmx.de>,
 openembedded-devel@lists.openembedded.org
References: <20210811123943.32085-1-dl9pf@gmx.de>
 <27614.1629203089074878790@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <1748135f-e547-ac98-8caf-1b98e46e0845@gmail.com>
Date: Tue, 17 Aug 2021 07:21:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <27614.1629203089074878790@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/17/21 5:24 AM, Jan-Simon Möller wrote:
> Ping.
its in my test branch
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/dunfell-nut&id=b472160c77dcfdf46e4d4eca69428b971238f4a9

takes a long time to build dunfell on my system.

-armin


> 
>

