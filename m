Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B80FC32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 18:23:47 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web08.1481.1661279022211705385
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PuiqGybc;
 spf=pass (domain: gmail.com, ip: 209.85.128.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-31f445bd486so401311537b3.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=umjN2OTig6mYPFx9dleHKdNwAP0lVQ8lMn3L+X8p6eA=;
        b=PuiqGybcddCkMkXQb4QFzVpiSJ8tO7+WMbC20gCiHAalznAFNR5x5JC0B++8siI9Hv
         wjGUxRdqQ5G/QfKTKnq6cRf3ZrttfOzJPzc52I42vIbQJ7Xexw2eL7E8WdEdDoBZFQJg
         4JSPByaibrbeGk0Gy/IUDpeLSnLA5pwJ/59Gmk0bjD20b/TG7mF+gFCDfhabFb0QHqKI
         TThA8hFXkbl1doC99rDGqsE9/Rlvo7U3aYeaWvrgpykfmbhNugcaVwc6CiydybGNKBXk
         7/HVl9mvSXqPWiObqzYCFs2dXWDOM8UaBF16Eg6D1WRRj5CMscnDBY400A1EZ31z0LEp
         hWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=umjN2OTig6mYPFx9dleHKdNwAP0lVQ8lMn3L+X8p6eA=;
        b=BeQqTjTMrfgllyq9evyVM9S2DDHjglTOXnFxhy9BdRuoAzFVTZ1KhVhgOvVOqoGCIa
         bObe8w/5voc5caW8/LtR3ZaZuyfbt+x380Rcvc8OdT3kmXTsPOEdx1kZoaf575mB88EZ
         gx3fsv/Q9gH2TCJBaNYPUUd6H03YqCTAhKnd4jU02YCPRvRgj5XGbyl8erq1qQXBooQT
         0SHfLX9ihHuwDDvKaWWONvH8nKVPaaEjLinstJH/tTgv6Bp/2DlgLEh6C7WPgYC1xRoA
         HX0DJiqss0jO3EDbrGc7wSy7iCQ1v4lWf367o4WgtkfrWV6RrOFE6W/O/T/fkzCQECde
         coLQ==
X-Gm-Message-State: ACgBeo1eK0Ter/+RyDPMKPXfmbeCsNUm0O7nBpHXSKria7pBr/5VYFXj
	O73cVgo+qJ3auxieCW1xAVoZJXlpcTShEWQZ4Mw=
X-Google-Smtp-Source: 
 AA6agR6FNdB47bWKLdJHqEkmgQ+bVEC7U/rVlu7QgNFELYYbTyoROuHqNqmY//nK8XQEWGQ1npwzHfCBeS0Glopxlho=
X-Received: by 2002:a0d:edc2:0:b0:338:957:a719 with SMTP id
 w185-20020a0dedc2000000b003380957a719mr22964744ywe.132.1661279021326; Tue, 23
 Aug 2022 11:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220823172602.212-1-workjagadeesh@gmail.com>
 <20220823172602.212-2-workjagadeesh@gmail.com>
In-Reply-To: <20220823172602.212-2-workjagadeesh@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Aug 2022 11:23:15 -0700
Message-ID: 
 <CAMKF1soKDpxbLY9DgHRkiAHGey_oL29Fb242byujb3WZt3sAcg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-django: make 3.2.x as
 default version
To: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 18:23:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98403

On Tue, Aug 23, 2022 at 10:26 AM Jagadeesh Krishnanjanappa
<workjagadeesh@gmail.com> wrote:
>
> According to https://www.djangoproject.com/download/ python3-django
> 3.2.x has LTS support upto 2024, hence make it as default version
> to build.

It seems 2.2 LTS went EOL  on April 11, 2022, can you also send a
patch to remove those recipes while you are here.

> Also, add runtime dependency on python3-asgiref as the "django-admin"
> script needs asgiref module.
>
> More info: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14888
>
> Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> ---
>  .../recipes-devtools/python/python3-django_3.2.12.bb        | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> index adbc498bd..17d402d65 100644
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> @@ -5,9 +5,5 @@ SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad6
>
>  RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-sqlparse \
> +    ${PYTHON_PN}-asgiref \
>  "
> -
> -# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
> -# default. To build the 3.x branch,
> -# PREFERRED_VERSION_python3-django = "3.2.2" can be added to local.conf
> -DEFAULT_PREFERENCE = "-1"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98398): https://lists.openembedded.org/g/openembedded-devel/message/98398
> Mute This Topic: https://lists.openembedded.org/mt/93209460/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

