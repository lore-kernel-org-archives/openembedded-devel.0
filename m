Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E91C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 13:46:11 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.16388.1667742363366601375
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Nov 2022 05:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DOfmlQwn;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id v81so9751576oie.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Nov 2022 05:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laLqkSmrFFNyPtrR/15UQflsgHy4I4c3D0sioLjnMpU=;
        b=DOfmlQwnZHEMEVNQf+lH3dFWALwuif9FZEDNGy7rYVel2P3tX78UmQyhiPNUK2y5nS
         x9/6c8v3BJXcYNDHA1L4o7A35qkDLkoeCIhry+pnNE1grP15mhycMHTHGcMwY/m7Y3F3
         pWM5+crg7KI6pQxa6CU4xEVTalyL/wN2Bdp5QOmqtxY3hc2eDTkc1PeDUpp7UG29mXvy
         b543dgHr99FEcEd/tQPRcDvpIucg+kF2Fb3M3wpbs7SOze6q05fZNQue8ftwxU6jZSaD
         tO8/SmwNEQ9Y3PelalqNmJF5TuhuVof2XBdfHa6c2cqQLg0UP3AKA+k1lu4YIp738BSo
         Defw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=laLqkSmrFFNyPtrR/15UQflsgHy4I4c3D0sioLjnMpU=;
        b=s1SDAm/gQ+Mz3EsC06ylaghBM4osR9cPx/lUvOOIxAW/UcBswopmR8feJ/d5MwWPnB
         c5AzH+OhXHnnyzgpoKSBmzXwmUgo0XbIsl+/VmUV0ltc5lxLzu1nDs3x7ZilKL77lgQW
         cFlgm2w4jsKAH4N5sK2Q38FIiaID7VOXVd5en8zfM/kSfgKdoJlQ3wn+ohSYstUDUjOu
         SbbU8PMUq9IW0fvVPF9E3pMy/QOTaGv6eBkJIlp0IzTnpmTrbm0GkX65YyCsyeDQaXUd
         /QvlbkjXdjIv+D37d24peWsgWsppTV66UajJO5OhEodxHy49crcvLfxcYAReIBrCKRml
         3o2Q==
X-Gm-Message-State: ACrzQf0+Qb7G8lQxTfKXEpPyUyL2P7E0ViubY4+QUg+NqlwhThQ0YdGB
	2BmDp/W9xtvtGrNcSXD4HK72St7hzCj0cg==
X-Google-Smtp-Source: AMsMyM7yQ1GzX+O5Sjdq6jRoCSpw0DZ2reaSWG7upGsTu082LhdRgF1B0p1X+/ztuwnq3ahVNYvc4Q==
X-Received: by 2002:a05:6808:20a7:b0:35a:eb3:de37 with SMTP id s39-20020a05680820a700b0035a0eb3de37mr19921620oiw.3.1667742362026;
        Sun, 06 Nov 2022 05:46:02 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:b2f4:9028:9984:940f? ([2600:1700:9190:ba10:b2f4:9028:9984:940f])
        by smtp.gmail.com with ESMTPSA id h19-20020a9d6a53000000b0066aba96addbsm1880089otn.81.2022.11.06.05.46.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 05:46:01 -0800 (PST)
Message-ID: <7a81daa7-9062-6dc2-377f-5875bad23d1f@gmail.com>
Date: Sun, 6 Nov 2022 08:46:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: webserver Monkey package
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Nov 2022 13:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99433

Hello,


Is anyone interested in the "Monkey" webserver? if so listen up.

The Monkey package has not built for Langdale ever since I took over the 
branch. The main project website appears to be offline for weeks now.  
The version 1.6.9 was released 7 years ago. There is a github go this 
package and has many changes applied since 2016 but no new versions 
noted. The hash for the tag v16.9 does not exist in any branch. I cloned 
the repo and checkout the hash and it gave me a detached head.

For langdale, I plan on adding "SKIP_RECIPE". Updating it to the top up 
branch does not work for me as I don't use this package in any 
capacity.  Now, if someone does have an interest in making Monkey work 
in langdale, let me know. I am open to seeing how this might be achieved.

The tip of Monkey does not build in current master scenario so upgrading 
will need some work.

I don't know how the current master meta-openembedded CI is behaving for 
this package.

Please let me know if there is any feedback on this approach for Langdale.


BR,
Armin

