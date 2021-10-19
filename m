Return-Path: <koansoftware@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F85C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 12:14:08 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.8773.1634645647136225141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lAMbsNWY;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: koansoftware@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id z20so11901980edc.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xd0bZgxIVoeo7+rI9nMwdBaB+v7x5JxHGg5+2eglpNw=;
        b=lAMbsNWYhmpMdH4smwlRfLYP/Hwo9QTMzTocaQOe7pMybx8dUksPyweIq9UJ4eBD92
         Lpin+08ck/UnByc38mXqLDJ/ACtJuW22F17YYzx4Loq7gOl43/PRW4H9TyGEeV0HCVs1
         /mnADCNE5/LZU3jZ6w1T6Uqudqa2cJ11x5PIl/TQcrs46wqgwP3SCiU4waEQa6Qgx8C1
         7zvNtl9iJV+Fc3+/XArCtxs6XFrNgw8ewgtPIh1MvNzH1HJ+qFo0D/7G9/nY8Qp2r7/X
         /11+ZB4CoPBYZTWjb1xYEPT0yddFxO6Ic3wEJHp6YKF6w8OgdusMuCgafv+QwwLgNUj3
         LSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xd0bZgxIVoeo7+rI9nMwdBaB+v7x5JxHGg5+2eglpNw=;
        b=k6CmXII/nUaBECr0pKbB6hqCP6aAv2z+gJ1pLhPplnHKd+g0eLDNoJodfDhOIxinXe
         gVAjKo9L9GJ93YSWSSnZaXKtabpxciU9wjciq3WeslNRkYtgsT2y3BmT3hJcx2vAygXu
         egvZ+Yu4dR1nN8QmAkOAAimjg71OH9z28BWitC9wsCbKveCsV7n2VpoKCts9mLcL2JwH
         LSExfQGjpkcnqmNNaC79C0SerZ6gFJVpwWkfSx9k40Vujt+k6gFIYlg7WRaYRKfivwKY
         YKD+s1YosneIgKAja+iuv1MIuTxF3cSMGvewpxta5HZjRHQdDYQbmXXZ8tTHyNadNIPJ
         7tdg==
X-Gm-Message-State: AOAM531C022TqOkf2pRsWfkV/O/hW3PNeCQJB21JlEYSQqHr6gsaE2Ye
	nvt8diFTwMNGC8MzdFsmEzI=
X-Google-Smtp-Source: 
 ABdhPJxfHI7yGIUP1lrCKgXDjnPMveAb55R3uGkg5QtzkGaDGqVU8FNesiDnjq8pUa1pcXcgvO1W1Q==
X-Received: by 2002:a17:906:c186:: with SMTP id
 g6mr36657932ejz.259.1634645645224;
        Tue, 19 Oct 2021 05:14:05 -0700 (PDT)
Received: from [192.168.0.6] (host-79-3-92-72.business.telecomitalia.it.
 [79.3.92.72])
        by smtp.googlemail.com with ESMTPSA id
 d3sm10202877ejb.35.2021.10.19.05.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 05:14:04 -0700 (PDT)
Reply-To: koansoftware@gmail.com
Subject: Re: [oe] [meta-networking][PATCH] bluepy_git.bb: Added recipe for
 BluePy - Python interface to Bluetooth LE on Linux
To: Khem Raj <raj.khem@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
References: <20211018142247.32594-1-koansoftware@gmail.com>
 <1bfddba8-01e0-1bc7-c6d7-2a1f1ec65f7a@gmail.com>
 <3c6c68b7-f3c2-4259-5400-0e8a804f3fb8@gmail.com>
 <98970f4b-5513-43c3-225d-610e7c9606e3@gmail.com>
 <CAMKF1soE15JQtzANqxr1mZuNVJURzBgt514g2QxRuAe34yHm8Q@mail.gmail.com>
From: Marco <koansoftware@gmail.com>
Message-ID: <0722b956-5509-e42d-6aa0-61f8f4818e75@gmail.com>
Date: Tue, 19 Oct 2021 14:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1soE15JQtzANqxr1mZuNVJURzBgt514g2QxRuAe34yHm8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 12:14:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93461

On 19/10/21 06:34, Khem Raj wrote:
> this is failing to build also see
> 
> https://errors.yoctoproject.org/Errors/Details/613234/
> https://errors.yoctoproject.org/Errors/Details/613235/


Hi Khem,
I solved both issues.
Do I have to resend [PATCH v2] or simply comment the recipe here ?
Thanks


```
DESCRIPTION = "Python interface to Bluetooth LE on Linux"
HOMEPAGE = "https://github.com/IanHarvey/bluepy"
SECTION = "devel/python"

DEPENDS = "${PYTHON_PN} glib-2.0"
RDEPENDS_${PN} = "bluez5"

LICENSE = "GPLv2 & PD"
LIC_FILES_CHKSUM = 
"file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
LIC_FILES_CHKSUM = 
"file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"

inherit setuptools3 pkgconfig

SRC_URI = 
"git://github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09"
S = "${WORKDIR}/git"

TARGET_CC_ARCH += "${LDFLAGS}"
```

--
Marco

