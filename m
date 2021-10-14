Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F31C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:33:49 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.9287.1634218428710326815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Ll8Hhncv;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id j21so27437512lfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=82qaHA/XUyAIokOmI+El//kRgYlyOY0jgyz0EpTV7yM=;
        b=Ll8HhncvhknSPtotMmb51dOjcsLp7+127vaU90/554sQq82fpK4bEy3QidGivMIP+l
         H91/FwBALqhbUaNooy3eghsdXByzbtlrSZWAaZxL9Xi4FCdKlbCKU9YVKidkITIixqr4
         GUgXiyhOYqap6FHWszavA4Y6PkHjUG4qYBxtE4FXDu9Siq24MsTQxSGHdo+v83YsPE3v
         ANZ/7wTFl4hT5Psnd4krU5mEtrJGcS8uNH9a+Hj0ZHAZtdResQwjhJa0rSFzkVMsfTGx
         /JPdhHiXuXM/b4SsWy6JGdFAtwaTlC9m+/l6A24RlshKQMwm1ufC8LOYDJp7aaA8uMrF
         SyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=82qaHA/XUyAIokOmI+El//kRgYlyOY0jgyz0EpTV7yM=;
        b=Iy/tWX953wSZegt1NffVY+xlexUAdteR1uqee5jthCTIOnD2yvICMcc8SdgSHpzVAN
         LhbRsVn9HRoPUhVsqhCAYzYC1HwQHCX6RhMrfNhArlh+Av/QtZRfEKtWJRdlAFt7hdfr
         dHsKIryI/jThAMMXKi1JdHYCnHw9Fi+GrkW7gn9XDKDHVtFzqdiRGhizQHwZrx6C7qkA
         M6frBIIIfkjUVoT1tSpgG37ZkDdXpwOSprpWa80dzOn13xz474LzregMYh3aMhUbUkKy
         RpkZEmT0wVGM05CyVwqNSpSJEQ5G9Nzg1kqamwlOoH0YFidFlIJ/UqAblWBoUecFQp8I
         Wacg==
X-Gm-Message-State: AOAM532YY8wPffCFXjN705o9faNi8ffaw6oIWADtqdwPF2H4yDKX0DZD
	wXy+iJGtBdNH7kUDjt7ufXRcRo7UohPrPDZM
X-Google-Smtp-Source: 
 ABdhPJxUEjctIfoodygNLA1iT40/YLSIdD9QtTrDR4zxe5FueigXYgjVMMoPQtXiO7pzHmdWX4Y81A==
X-Received: by 2002:a2e:9549:: with SMTP id t9mr6175164ljh.154.1634218426350;
        Thu, 14 Oct 2021 06:33:46 -0700 (PDT)
Received: from [192.168.50.157]
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 p16sm227207lfe.166.2021.10.14.06.33.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 06:33:45 -0700 (PDT)
Message-ID: <79ab2078-eb87-7d37-9935-77dd56929e87@oleksandr-kravchuk.com>
Date: Thu, 14 Oct 2021 15:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [meta-oe][PATCH 1/2] packagegroup-meta-python: remove
 python3-anyjson
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20211014133200.2547975-1-open.source@oleksandr-kravchuk.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211014133200.2547975-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 13:33:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93296

ignore

On 14/10/2021 15:31, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-meta-python.bb      | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index f0159f823..b660cc9a8 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -25,7 +25,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
>       python3-alembic \
>       python3-ansi2html \
>       python3-ansicolors \
> -    python3-anyjson \
>       python3-appdirs \
>       python3-apply-defaults \
>       python3-argcomplete \
> @@ -478,7 +477,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
>       python3-jinja2-ptest \
>       python3-markupsafe-ptest \
>       python3-ansicolors-ptest \
> -    python3-anyjson-ptest \
>       python3-appdirs-ptest \
>       python3-backports-functools-lru-cache-ptest \
>       python3-bcrypt-ptest \

