Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D59C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 20:23:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.22865.1632687795265902727
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 13:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GFc6AASE;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id t4so10372379plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 13:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Llyde9GGrWnQSMfEI6eDHxSrN+jm4Q0O9vBrk4JUZHw=;
        b=GFc6AASEu3crpVkd30Yk0F4pMSQvkd8UkrHfKfMHgLzkAE8BvYV7rsWLsk+rJ2AojY
         6RPoDlk1PM3c6xKpuDbjvke2Ks2twmFsGNwT5oSbUOVabzQIUvDU36fOkdZKEEIpwhmA
         Yhidn4oGrUsUimCa9lJlPc72DxNFC79vtViSV4wNDdlsURPQromES9J8rFjJ8MuqCZqE
         VeF3dVE3VNM6Too+ml5hBGMNqMsX17iJMD7kRFiv7m6BwVe6gAw3WFIgmYqkSJKExOpJ
         BByOdyWSfyVYpLDF7mLUqqFzoN1b7Yf8rD9dSlvlIIlsPISZUNgTBmZpBQgsLu4dZAHr
         guDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Llyde9GGrWnQSMfEI6eDHxSrN+jm4Q0O9vBrk4JUZHw=;
        b=cR6j/P8Vdb8HidSQw+O6Fht7zBjAY9zmMB3IEfCrnwBeiu8ud9lNHKC8dxFnJ9zdXl
         9LppBzRv32V0exIxMQpsOFOf1I/34IleBPgKjXrjnhiN3jKwuRv4IYu83pZqvnZTm8S/
         PWi7D5bKxnWb6oaaZclRgeD7fNLqvcOuLbDlvTwZXsYoWH5sgAnLDaHZeWRlCj9++fEd
         ygiBT4CYiSB3AB73Lk0R0+fcCdfHeTNfha4t0MhyVfQSHgJesOWvhNhCgBPpR5VVUZSB
         R2bX9I3K+60zO0LdAUAMjOxHagULf0L+LXKDc5Mg6LKg1751An9l2JA8pcWot4jkUuuM
         ElJw==
X-Gm-Message-State: AOAM530FNwyfF91MTUNHZUDQcTnxLHfeiobuaNCczHdTU2R/GyKhT1xh
	DLnAtkcGk032nBTth4Z6v/FYI50NWMU=
X-Google-Smtp-Source: 
 ABdhPJwJ323b6whgGVWBdJU4sIcZsHC/iHOhpNInP12yz4K7rRH0W85RiBJEGU3PXBNUQeuWqI62Jg==
X-Received: by 2002:a17:90b:4d90:: with SMTP id
 oj16mr15623603pjb.170.1632687794318;
        Sun, 26 Sep 2021 13:23:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:87f2:a984:b0d3:3684?
 ([2601:202:4180:a5c0:87f2:a984:b0d3:3684])
        by smtp.gmail.com with ESMTPSA id
 g11sm16597677pgn.41.2021.09.26.13.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Sep 2021 13:23:13 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH] gd: upgrade 2.3.2 -> 2.3.3
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210921200820.8490-1-sakib.sajal@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <12ad9aa4-8ab9-6197-9e85-5f3a89eab5f2@gmail.com>
Date: Sun, 26 Sep 2021 13:23:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921200820.8490-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Sep 2021 20:23:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93130



On 9/21/21 1:08 PM, Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>


> ---
>  ...-of-bands-in-reading-tga-header-file.patch | 33 -------------------
>  .../gd/{gd_2.3.2.bb => gd_2.3.3.bb}           |  7 ++--
>  2 files changed, 3 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
>  rename meta-oe/recipes-support/gd/{gd_2.3.2.bb => gd_2.3.3.bb} (84%)
>
> diff --git a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
> deleted file mode 100644
> index 649b9b744..000000000
> --- a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
> -From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
> -Date: Mon, 19 Jul 2021 10:07:13 +0430
> -Subject: [PATCH] fix read out-of-bands in reading tga header file
> -
> -CVE: CVE-2021-38115
> -Upstream-Status: Backport [8b111b2b4a4842179be66db68d84dda91a246032]
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/gd_tga.c | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/gd_tga.c b/src/gd_tga.c
> -index cae9428..286febb 100644
> ---- a/src/gd_tga.c
> -+++ b/src/gd_tga.c
> -@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
> - 			return -1;
> - 		}
> - 
> --		gdGetBuf(tga->ident, tga->identsize, ctx);
> -+		
> -+		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
> -+			gd_error("fail to read header ident");
> -+			return -1;
> -+		}
> - 	}
> - 
> - 	return 1;
> --- 
> -2.25.1
> -
> diff --git a/meta-oe/recipes-support/gd/gd_2.3.2.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
> similarity index 84%
> rename from meta-oe/recipes-support/gd/gd_2.3.2.bb
> rename to meta-oe/recipes-support/gd/gd_2.3.3.bb
> index 557b45dc4..e129dc5a9 100644
> --- a/meta-oe/recipes-support/gd/gd_2.3.2.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
> @@ -9,15 +9,14 @@ HOMEPAGE = "http://libgd.github.io/"
>  
>  SECTION = "libs"
>  LICENSE = "GD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=8e5bc8627b9494741c905d65238c66b7"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ace63adfdac78400fc30fa22ee9c1bb1"

Why did the LIC_FILES_CHKSUM change?

>  
>  DEPENDS = "freetype libpng jpeg zlib tiff"
>  
> -SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
> -           file://0001-fix-read-out-of-bands-in-reading-tga-header-file.patch \
> +SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1\
>            "

Why was the patch dropped? no mention in the commit message.

-armin
>  
> -SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
> +SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
>  
>  S = "${WORKDIR}/git"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93038): https://lists.openembedded.org/g/openembedded-devel/message/93038
> Mute This Topic: https://lists.openembedded.org/mt/85774777/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


