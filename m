Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4941CF9C69
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 17:07:32 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.632.1727197650536205102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 10:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mATghdms;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6c358b72615so48993996d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727197649; x=1727802449; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHuj3CjpqSvWQiZBfyTDTHyde5nLc3JfJTAvF0O90i4=;
        b=mATghdmsW7SjQBl5CA4VINusP0RVbke5MHyHv47LY91kp7YVy546tlxCePCp0ynEaa
         JGnMudLtGZwjwXRxyE6/+TkgMVgVuUybLPzXyLnCPZXqayQftJ5+6uXeXBy7bVse00vA
         EtUO4eLaIFiArsp9XLAgxaj73sehiS2G1zGpPn1tmLuwQL+jgmz+9dCm7WiPtV9cRPmo
         luVXKg5QCG7oqtqIVgfq9LUqXQjwGAQ6iQLSx9Zd1PmircZIRRhNX3352TYdwTGdLGhp
         ljNarmU9U3ueB1aai4kA2Vg1GcA/u823dX4N+UWpYC+vtWXTxqnOV99z5Go71aZOot/k
         GmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727197649; x=1727802449;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHuj3CjpqSvWQiZBfyTDTHyde5nLc3JfJTAvF0O90i4=;
        b=iYuS5sy39A0YrI/ctPfIYMCCYzFZLF3dw9VApfM2SFbY148TFVFiPjpKnCRdKs7u9d
         c9UflGvwFewGKZOeHjkZVihZk81iaEOeTf8Sa+bJIyE9Z6e0GKQYeTf2SFGaRIvUhhtA
         WZTGewx7OiCg2sstFGK0cnQfw3zFan8ltQfn7Y0FjYYo5EYUj++dKTOSGfL1w50KoEXL
         FrHr8/3xDUavYsRF8ukt2kR7HmT17zg/9zJazOb9sbw8Leq03NM/TJRXucTOEcogW4xX
         coVZHwtBrk+8sKzd8HAQZMydMLvVGHxxxM1OGXh9eTiaeIdxxsVAR2tSjVq8vn0rwyl7
         i4NA==
X-Gm-Message-State: AOJu0YwqLF79+kGKUZqffnlSPmZMYat0StiP6ukt+pWzcroqe6BIMloR
	RVzE++huZm80bLvr7GHZgMRq4vyagsvVBsxkWWnu3Pr++0V3g53wDM7KjA==
X-Google-Smtp-Source: AGHT+IEP4pa9GIT8RUO8pq6hNruUW587CtMsREz6FH4eGJxyb1ZLMZ+0iNImXPbxnWY/24jnNcz43w==
X-Received: by 2002:a05:6214:390c:b0:6c5:12aa:6dd2 with SMTP id 6a1803df08f44-6c7bc8600c7mr180843526d6.51.1727197648733;
        Tue, 24 Sep 2024 10:07:28 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb0f55437csm8136006d6.103.2024.09.24.10.07.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 10:07:27 -0700 (PDT)
Date: Tue, 24 Sep 2024 13:07:24 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [scarthgap][meta-webserver][PATCH] apache2: use
 update-alternatives for httpd
Message-ID: <20240924170724.GA7320@localhost>
References: <17E37E645367D680.19344@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17E37E645367D680.19344@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 17:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112481

Could this please be also added to scarthgap?

On Thu 2024-07-18 @ 11:07:26 PM, Trevor Woerner via lists.openembedded.org wrote:
> Busybox can optionally provide an httpd server, but by default The Yocto
> Project defconfig for busybox does not enable it. If it is enabled,
> busybox puts the resulting /usr/sbin/httpd object under the control of
> update-alternatives.
> 
> apache2, on the other hand, does not put /usr/sbin/httpd under the control
> of update-alternatives. Therefore, in the off chance a user enables the
> busybox httpd server, it does not play well with apache2.
> 
> Add update-alternatives information to apache2 so that it plays nicely with
> busybox which can optionally provide an httpd server at /usr/sbin/httpd.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
> index ab19ff1dc337..0c26a421c786 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
> @@ -190,6 +190,9 @@ INITSCRIPT_PARAMS = "defaults 91 20"
>  SYSTEMD_SERVICE:${PN} = "apache2.service"
>  SYSTEMD_AUTO_ENABLE:${PN} = "enable"
>  
> +ALTERNATIVE:${PN} = "httpd"
> +ALTERNATIVE_LINK_NAME[httpd] = "${sbindir}/httpd"
> +ALTERNATIVE_PRIORITY[httpd] = "60"
>  ALTERNATIVE:${PN}-doc = "htpasswd.1"
>  ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
>  
> -- 
> 2.44.0.501.g19981daefd7c
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111410): https://lists.openembedded.org/g/openembedded-devel/message/111410
> Mute This Topic: https://lists.openembedded.org/mt/107429240/900817
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


