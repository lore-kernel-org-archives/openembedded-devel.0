Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0B0C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 20:00:19 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.2275.1642104018880765952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 12:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lVeGBptm;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id 82so8710033qki.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 12:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1GM2Ptv838qibXDsurQmqhCCAi5DgsTcVngagclvgYU=;
        b=lVeGBptmk6uNFs+dQAPm2F/5PQ/MjIxuTHqwkQ6ZFqSvBJtOy/ZH3Hw7Cqu+6aDyEw
         2dlTx51AL7EEOZI/fmvMSTnuUm0DCJI1POSUzrvV+pEWek7npi6zdjEt2pxavNj/WjCS
         2+BOIyThPaoMk1WRfd4emT5i9lpLFhZd5CEvCHYGAJUZVgKZx9e+qGo77obsfz8LeKPJ
         ub1OiXco8g64vktcbQ0Xd22yG6lXL2yhTJnYPd25/+Kk9rTD0kzzG/+LjfSuk/5DkEUS
         6W2rz/HqeLkAZtoNaiRL68aQFMr3J1YlTagk/HEccqdZac8QxcN+xEUWO92dp3fdRRVD
         T9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1GM2Ptv838qibXDsurQmqhCCAi5DgsTcVngagclvgYU=;
        b=hQ68l2rxmqZu6duKaz1nlCQTXE7nVXPrk5M4BLGrwI5FRk6iuGoFxDT869k4RYFCVH
         FuwGDBRiyzCWBv14zbARZ9NZokcWRXn/fDfjwHo8QF3QJx1dL1oehkhmDbdZWsBORHlt
         6j0veTqK2S/kJo2BBZsR2epPstsvzc+pgL6SBHLcVU3h9MmtoFDQZLO410x2LjuddSOH
         EWCLEsmjDBzomgnn6w7biwS5yTATjnb7P+XEDK+pK3pWZCKd50OYXLgTC4rIEH14Wdb8
         /yUc+Hf0z7I4Wes6tHg/xGngOlz1jCZH8WqBEU5TsSZux14/cs1j79/QQIqSv25txiqw
         pqsw==
X-Gm-Message-State: AOAM5311XZw3o/1H3zEDyCr67sF/vAPcdgdZHDBMNgOP31dzGA8Kuag7
	U2KYO56KbOgkiMm4ZlJqhkBtsFSIyShMSaxQ9fo=
X-Google-Smtp-Source: 
 ABdhPJw8C+98Sfq0835+DjgtAcea3iTGwkJ+vAMs6HkLcVs3QoRL1ijXjesd3rbQKJhX+7qD8/3whgyvR/25MQgcEOM=
X-Received: by 2002:a05:620a:f06:: with SMTP id
 v6mr4463908qkl.149.1642104017870;
 Thu, 13 Jan 2022 12:00:17 -0800 (PST)
MIME-Version: 1.0
References: <1642067014-26574-1-git-send-email-xuhuan.fnst@fujitsu.com>
In-Reply-To: <1642067014-26574-1-git-send-email-xuhuan.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jan 2022 11:59:52 -0800
Message-ID: 
 <CAMKF1srHfNF+ZVg2N5NzPwouxumwgAh4z7Y1RnMv4ZJ4hm51tw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pystache: upgrade 0.5.4 ->
 0.6.0
To: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 20:00:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94812

this fails to patch
https://errors.yoctoproject.org/Errors/Details/622568/

On Thu, Jan 13, 2022 at 1:44 AM xuhuan.fnst@fujitsu.com
<xuhuan.fnst@fujitsu.com> wrote:
>
> From: Xu Huan <xuhuan.fnst@fujitsu.com>
>
> changelog:
> ===============================================================================
> Bump spec versions to latest => v1.1.3
> Modernize python and CI tools, update docs/doctests
> Update unicode conversion test for py3-only
> Add pep8speaks cfg, cleanup warnings
> Remove superfluous setup test/unused imports
> Add conda recipe/CI build
>
> Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
> ---
>  .../{python3-pystache_0.5.4.bb => python3-pystache_0.6.0.bb}   | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pystache_0.5.4.bb => python3-pystache_0.6.0.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb b/meta-python/recipes-devtools/python/python3-pystache_0.6.0.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
> rename to meta-python/recipes-devtools/python/python3-pystache_0.6.0.bb
> index 0ae5a19115..d64b806600 100644
> --- a/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pystache_0.6.0.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb4417802c56384aac71b34505528a60"
>
>  SRC_URI += "file://0001-Modernize-python-versions-remove-py2x-and-fix-tests-.patch"
>
> -SRC_URI[md5sum] = "485885e67a0f6411d5252e69b20a35ca"
> -SRC_URI[sha256sum] = "f7bbc265fb957b4d6c7c042b336563179444ab313fb93a719759111eabd3b85a"
> +SRC_URI[sha256sum] = "93bf92b2149a4c4b58d12142e2c4c6dd5c08d89e4c95afccd4b6efe2ee1d470d"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94805): https://lists.openembedded.org/g/openembedded-devel/message/94805
> Mute This Topic: https://lists.openembedded.org/mt/88393631/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

