Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AB1C41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 10:59:29 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.35811.1697194766542336568
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 03:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TWRkkrXG;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-504427aae4fso3682910e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 03:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697194765; x=1697799565; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=591kowGSdcZVxssMn+66RthecwMxR1w1KN5lKHzCIB0=;
        b=TWRkkrXGhYXd7A51VX/lTTezUpAtVLOnubGcJ2Txm0bAZf2uuQynDz6hgiQoKltlAb
         ytw1khm2e6oRLHqeo+34XoI6xoIe+AOzaGkrjZp8wacFmihe+XEwYyInKAOegAreLlpv
         Ikl0p2YlZ06uuCXSVmvzbHxqmN+LU92xbWm7QGb68esSXpr84VCmXLLsqRanHfFIAcnB
         +tJx7nZVDB/IVSxnPfr4Z5qtRrJDh9YrZYY266Q24dOHKR32JOfHlL3wAwYQIoXkq7CR
         m7hT1r2kZRWHEA7grmw5YuGGe+Jyxvf9ZKKiq/OuDjBNV3YAGd9RRMc6roM9wkxollcd
         38ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697194765; x=1697799565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=591kowGSdcZVxssMn+66RthecwMxR1w1KN5lKHzCIB0=;
        b=tjUZ/yvP9nhrDs2itqo2cCRbP3cFOk7WmKGUFfSwpj7kT6g6BvLEpsY4N86qzH5zrr
         idaV3GKRJi7vwxeEIxzjlkPdlCv0wWchsulkPrTa2Z3qD1jUwjQX5wGZTXcTyluUFCpg
         lJz0J4oueHGrEHU2a3AQ8xdnogY9iXDkHTzd14/qkWbxjgAkiEPS5DUq43XGEzbeKKMj
         QxnWdxpS0JV7CgcYFIU372Rl2gGwc8BmXCcYOpB/zAvsdSZ6J4ue+1zWBq4NyAda4qIi
         OUKeBmwpKz7J9qsezaSWzUYNGTXy4pfgTdo/PUTFCtsQiNSVV7QuJj4WD9QEkaMks1cz
         lxnw==
X-Gm-Message-State: AOJu0Yx1XOpKgvpg40i1LDp5WrWIpqdWYz4gtZ51RyM8B/PlIfYPxqE0
	QCFpT4QeD3qDJNAUyW14AagWXA==
X-Google-Smtp-Source: AGHT+IEmLkIhnKKO7PbrKIRGKlz6troHpbDfMXfIWlDSvp4oBJR6+jmBhhk94WxxOETpPgz/BqiRrw==
X-Received: by 2002:a19:2d17:0:b0:4fe:4896:b6ab with SMTP id k23-20020a192d17000000b004fe4896b6abmr16598334lfj.15.1697194764590;
        Fri, 13 Oct 2023 03:59:24 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhpt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::199])
        by smtp.gmail.com with ESMTPSA id 28-20020ac25f5c000000b005068d6de988sm3026192lfz.226.2023.10.13.03.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 03:59:24 -0700 (PDT)
Date: Fri, 13 Oct 2023 13:59:19 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: upgrade 3.4.1 -> 3.5.0
Message-ID: <ZSkjB9xdaORRYM_6@nuoska>
References: <20231013091644.314001-1-beniaminsandu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013091644.314001-1-beniaminsandu@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105464

Hi,

On Fri, Oct 13, 2023 at 10:16:44AM +0100, Beniamin Sandu wrote:
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>

Would be nice to have some kind of change log entry here. For example that
this fixes https://nvd.nist.gov/vuln/detail/CVE-2023-43615
and that there are some API behavior changes noted in
ChangeLog.

Cheers,

-Mikko

