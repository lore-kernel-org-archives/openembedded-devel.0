Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9514C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 08:33:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.21269.1664958796473539726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=hS+jx2bv;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.46,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f46.google.com with SMTP id bq9so24823521wrb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LmnL/DTewneTfdNMwWWCsngjAByq0zOI5yf0ee5g6o=;
        b=hS+jx2bvfv7cG+c7lUFwkYJlAQFjljtLh6zH5kRwj04X2vqXoweaffm6++RolNuZtY
         xWmWltQPbnNUfdNm28azy1B2Jm64HtCgNLYM442NMXPulysoXX/RPw8JMLv4PG/WdcdT
         GrqVebMjpXJ0/gTMpYPhlVWY4KkeDRJ611tjkLeQO7ibt9GiAxo0OY9hh5gUUb1ibGW1
         ge8GPF3Y8W/ugiH8WEpEZJ9G4A1+W3D+WCxhL/hJxjBbuO0Zdor06ATA+T5AKYfzV0UI
         T5SI8xZ61vHV5qvEkjzFwY1o5pN1X6XNrJUtzZ62mBGbDzN+ii5DyBvFQxtt02tzk26p
         RGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LmnL/DTewneTfdNMwWWCsngjAByq0zOI5yf0ee5g6o=;
        b=tLgvjRRKjWRpvO4kVtuu3iLhCRF1pIoY/vy8XhY4VzQ9GBi8a70dYJ+C+fCbuONMim
         5cIWD/OR+nw4jMlj96ETCm/0c7Uw7kolu8O04sGK3gjbE9EUeXSrs9NzepN0kvYnZ/DE
         WzkzYeJSldhne0Ptn2gj9YTWSn36SIx86tGYosn/eTveknvG4FGhJVxP4r34+Lz6KZSJ
         amXqHfZKWAp8qQ3DHxG3tu/CishJEuo+fDDutpSXh5wNr6NsOjpfWI0y+fOeDWyBLUuh
         7R7kOHNntSMwtjHFTW4jn41ky4H/kP0vo+ZFR9GdgVVhHMRjfN6NEo+HV5w+EJxoVML/
         Pfkg==
X-Gm-Message-State: ACrzQf2XBm21M03eRLRwsKRQJYP+8Y98SfZB2244MK1U5H9PLzORZY4A
	FwZAWVG9YMU6kqhju1bRv4Sn8vUv1k6yXQ==
X-Google-Smtp-Source: 
 AMsMyM5aS4vSeyOmrmVW79qK7WLWsYApG7jQ3C+PUlHhv2OJvDVfa5PNKKySbRk982rr+5bCSDAZtA==
X-Received: by 2002:a5d:6301:0:b0:226:d87b:b55c with SMTP id
 i1-20020a5d6301000000b00226d87bb55cmr17853171wru.560.1664958794491;
        Wed, 05 Oct 2022 01:33:14 -0700 (PDT)
Received: from WIPC21110265 ([2a04:cec0:1006:1467:6ef8:be4e:165f:95d0])
        by smtp.gmail.com with ESMTPSA id
 l9-20020a056000022900b0022b315b4649sm13989427wrz.26.2022.10.05.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 01:33:14 -0700 (PDT)
Date: Wed, 5 Oct 2022 10:33:12 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Cc: Ross Burton <Ross.Burton@arm.com>
Subject: Re: [oe] [meta-networking][dunfell][PATCH 4/4] mbedtls: Whitelist
 CVE-2021-43666
Message-ID: <Yz1BSPlKkB+YXoZj@WIPC21110265>
References: <20221004062843.2541778-1-mbriand@witekio.com>
 <171AC9D81EA1BDC1.13098@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171AC9D81EA1BDC1.13098@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 08:33:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99064

On Tue, Oct 04, 2022 at 08:28:43AM +0200, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
> ---
>  .../recipes-connectivity/mbedtls/mbedtls_2.16.12.bb            | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
> index 264e8abc15fc..7c61b1bfa7cf 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
> @@ -49,3 +49,6 @@ FILES_${PN}-programs = "${bindir}/"
>  BBCLASSEXTEND = "native nativesdk"
>  
>  CVE_PRODUCT = "mbed_tls"
> +
> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5311
> +CVE_CHECK_WHITELIST += "CVE-2021-43666"
> -- 
> 2.34.1
> 

On the equivalent patch set against master branch, Ross Burton suggested to not add the CVE to the white list but instead get the CPE modified. We might want to do the same thing here.

Best regards,
Mathieu

