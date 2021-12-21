Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1665CC433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 04:15:06 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.2082.1640060105274193183
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 20:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iBzKYkCA;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c2so10512384pfc.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 20:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=/v+0q+CZ7/JFDGNQGX1aXpxUtQf7yJtK+Jr98cPjW4c=;
        b=iBzKYkCAuqswdMyc4Y226jJmjWiNmp66KtoWfUDgDiMG3j9O+o2r1yHUUGW1Td66w3
         91148CCKxFNk/HXlOeFBudgvSuyB56dHwRIg7uMX/+VlN5gAYTmck9rKZZvmbfNJPqyc
         l5MXzrqOwXBOrCjSFDdaQPz9+kOR2EBxrE1h1gzDfNZ2BD5scHOzYEWiCDnSLKve9aWm
         fTXgX1cJo+rn7KiL0D7d8v2pSXO0Xn/g3ThlaJ4V9uvW8iTo3x6Gyt3InUK/emqY/NR8
         BpZlFDcyO9jDNFK5Y7z0gFPg0JPYVYXpyh2vIytam1Ga+bn50B3swd69FunE3lp21TFC
         nTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=/v+0q+CZ7/JFDGNQGX1aXpxUtQf7yJtK+Jr98cPjW4c=;
        b=fOU/93+XXw07/7R3O1lyvEMpIOd5fkPYiQQhKQjtLrg7wdKmt3XJeooX3gpp1ZpRiG
         9NjmMCTwXY1S5qzehJOnIfZLSZJLkA0I2zbH784KgqukCHgJSkz/GqO/vXuB7J77qySR
         s5Pcpvzjp/kVktO8JIFzZ55eK6N8UHTs9caeWMeGU0rRXqjOtPXk5wWHiOB2qLMuPkgR
         0C9lDFlcL6sZzp6gr3fWFjWtq3SEDEBaT+WmOds8zc+5XC1W8Sprrh9sMmeOE6cYtYXs
         kzF9bgtBG6K7FFWv7cjA/H52Kuc3RA0rIOCl8BbZVdgkaXItueG86r2X4yECQhRkk3eR
         2u/Q==
X-Gm-Message-State: AOAM533ABUWSkTfuiz9PdNEr4od1WIFlN7e/ShAKN/iw8H1Y739P+eMZ
	SuAsju0oMi4jxZLQT89a9Hs=
X-Google-Smtp-Source: 
 ABdhPJyPwOjrNPuFE0ce1vfJEnUy9I+qknYHnHGzSD/xfDkjzqC55wazO5kn1vx3nk3fA85rhpcRCw==
X-Received: by 2002:a63:e555:: with SMTP id z21mr1255075pgj.555.1640060104575;
        Mon, 20 Dec 2021 20:15:04 -0800 (PST)
Received: from [192.168.147.134] (rrcs-98-153-100-131.west.biz.rr.com.
 [98.153.100.131])
        by smtp.gmail.com with ESMTPSA id
 cm20sm856951pjb.28.2021.12.20.20.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 20:15:04 -0800 (PST)
Message-ID: <cfbfdc6b-6ddb-2e04-ff4a-7ded6dc5a2fc@gmail.com>
Date: Mon, 20 Dec 2021 20:15:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [meta-oe]
Content-Language: en-US
To: Claus Stovgaard <claus.stovgaard@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <c27eabd5b0c9c7606367152cc3dc8e3ac7e1dc8e.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <c27eabd5b0c9c7606367152cc3dc8e3ac7e1dc8e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 04:15:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94461



On 12/20/21 1:37 PM, Claus Stovgaard wrote:
> Hi Khem
> 
> Have 3 commits, I think will be a good match for meta-oe
> 
> usbip-tools is the userspace tool from the kernel for controlling
> USB/IP.
> I started with what Chuck Kamas had done
> https://lists.yoctoproject.org/g/yocto/topic/86249103?p=,,,20,0,0,0::recentpostdate/sticky,,,20,0,0,86249103
> But ended up rewriting all the logic inside the recipe, to make it much
> simpler. A very nice utility.
> 
> Gutenprint - I wrote about that earlier - and thanks for your reply.
> I updated to new style of override, but kept the native part in its own
> recipe - as the purpose for the native part is only to generate a
> header, used by the cross compilation part.
> 
> pycups - is for controlling cups from python. Among others also used by
> system-config-printer.
> https://github.com/OpenPrinting/system-config-printer
> A recipe for this is also on the way - it is just not completely ready
> for review yet.
> 
> Looking forward to feedback on this.
> 
> Do you prefer to include patch text in the request-pull?


this looks good. Also check at layers.openembedded.org to see if some 
other layer is maintaining them already. If not then send it as patches

> 
> Regards
> Claus Stovgaard
> 
> 
> The following changes since commit
> de83f98070eeba02f465fe739d9418dd60f749da:
> 
>    python3-graphviz: upgrade 0.19 -> 0.19.1 (2021-12-16 08:14:04 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/frosteyes/meta-openembedded.git
> 
> for you to fetch changes up to
> 2bbf94fc34942ed0665ce8af6e9e4f2850fa4889:
> 
>    Add pycups - python bindings for CUPS (2021-12-20 21:59:10 +0100)
> 
> ----------------------------------------------------------------
> Claus Stovgaard (3):
>        Added usbip-tools for kernel USB/IP
>        Add gutenprint to meta-oe
>        Add pycups - python bindings for CUPS
> 
>   meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb      | 19
> +++++++++++++++++++
>   meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb            | 69
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb | 43
> +++++++++++++++++++++++++++++++++++++++++++
>   meta-oe/recipes-printing/gutenprint/gutenprint.inc           | 23
> +++++++++++++++++++++++
>   meta-oe/recipes-printing/gutenprint/gutenprint_git.bb        | 47
> +++++++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 201 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/python/python3-
> pycups_2.0.1.bb
>   create mode 100644 meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
>   create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint-
> native_git.bb
>   create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint.inc
>   create mode 100644 meta-oe/recipes-
> printing/gutenprint/gutenprint_git.bb
> 
> 

