Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862A1C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 16:45:31 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.142.1646671530084474262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nc84oTxQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id b67so1560848qkc.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=irhLeaLaA1ZGSCuZAS1YdPA7Rkv3aNrdprW/U0zYwwM=;
        b=nc84oTxQwI/A7Hd63x3VnzOtLafIWYaP0bCSg/8HffNS6OEx16crH/LYzIjXfxK2H4
         T3Ks2emYEbzX6gPY9wzGivi+q5qxlsOOSoetclZFf2sgaHx8u0VXfCVAhNez0QhsnN4i
         +yk2BpCazUBclgd7EXeqgGUtMpND4xEwu9QD4zUObGuffBK/dAca8KE0kXc1cFw6Da9j
         Bzb5E/keGHIDBoxnydeinhLTMdaeL7Uer8YlG+HZS2LajsyBQzSYKV080TabkJmeLs+N
         emxr3qOYYnhGyrW39I6hfQvlzgoe4pLE51DKCALwrFDKGQBZbeqyZxT+7N+8+Wp9UPKP
         6zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=irhLeaLaA1ZGSCuZAS1YdPA7Rkv3aNrdprW/U0zYwwM=;
        b=ZPlGtZKpGtq332AdHmUePMtQrdB++AcAnoHtbTpKHATONSS6s6BhSoASI5OSxDy95X
         l+z5tSwhTqJhBzrcIi+gb39ueyvVMgMA4excM/c8eOAdkh7FHy0gHzG6PReryXogmQmf
         qHGS8YVQjupLlJ9TXg+OEMuV2b7Ftj60q7r5CzDeJWhvb90YU0cplG7t8fdR5H+jC6HF
         /6NUXdHhvmtcm4aDB7fWYe6o+SSy30Q2sAOVXDBXgT/WReGVND5trqJ8+bAPaaWd9UUj
         ueISGgffDaN0yT9T99KRHl51Zd9D03gKFWo8JEskKRQ7S+M/Scm2ddmf4WUpbqxRh7Ey
         3upw==
X-Gm-Message-State: AOAM531L/jglx9unpB8Tjui/B8AvP2se9pgzazP0zh3t1SsYKmm4688f
	GeKCdAVigs9egdFI6WhaJX0fVgda9WyvNnD66h4=
X-Google-Smtp-Source: 
 ABdhPJyN4Jr3a2JxtK8yxO4uxursjBmvd+FOsphmraE2l69Ip1TBTyXjT7hzZVxIQggp4QMS6Z7ncXaDhdhyImpfZnE=
X-Received: by 2002:a05:620a:45a7:b0:67a:ec24:d3fc with SMTP id
 bp39-20020a05620a45a700b0067aec24d3fcmr7222060qkb.180.1646671529066; Mon, 07
 Mar 2022 08:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20220307131120.3899473-1-leon.anavi@konsulko.com>
 <20220307131120.3899473-2-leon.anavi@konsulko.com>
In-Reply-To: <20220307131120.3899473-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2022 08:45:03 -0800
Message-ID: 
 <CAMKF1sr9A08dT3YR0x3eQmdZdkvcjb+Ve5p-teA+2oeP4DiXPw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-waitress: Upgrade 2.0.0 ->
 2.1.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 16:45:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95864

this was proposed earlier today as well. I have taken that patch instead

On Mon, Mar 7, 2022 at 5:11 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 2.1.0:
>
> - Python 3.6 is no longer supported by Waitress
> - Python 3.10 is fully supported by Waitress
> - wsgi.file_wrapper now sets the seekable, seek, and tell
>   attributes from the underlying file if the underlying file is
>   seekable. This allows WSGI middleware to implement things like
>   range requests for example
> - In Python 3 OSError is no longer subscriptable, this caused
>   failures on Windows attempting to loop to find an socket that
>   would work for use in the trigger.
> - Fixed an issue whereby BytesIO objects were not properly closed,
>   and thereby would not get cleaned up until garbage collection
>   would get around to it.
> - When the WSGI app starts sending data to the output buffer, we
>   now attempt to send data directly to the socket. This avoids
>   needing to wake up the main thread to start sending data.
>   Allowing faster transmission of the first byte.
> - Add REQUEST_URI to the WSGI environment. REQUEST_URI is similar
>   to request_uri in nginx. It is a string that contains the
>   request path before separating the query string and decoding
>   %-escaped characters.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-waitress_2.0.0.bb => python3-waitress_2.1.0.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-waitress_2.0.0.bb => python3-waitress_2.1.0.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
> index 490dcee6c..99e483962 100644
> --- a/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
> @@ -6,6 +6,6 @@ SECTION = "devel/python"
>  LICENSE = "ZPL-2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>
> -SRC_URI[sha256sum] = "69e1f242c7f80273490d3403c3976f3ac3b26e289856936d1f620ed48f321897"
> +SRC_URI[sha256sum] = "ec8a8d9b6b15f3bb2c1a82b8f3929a029c333c35fcafb08c185a9e562d8cc9c2"
>
>  inherit setuptools3 pypi
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95859): https://lists.openembedded.org/g/openembedded-devel/message/95859
> Mute This Topic: https://lists.openembedded.org/mt/89611305/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

