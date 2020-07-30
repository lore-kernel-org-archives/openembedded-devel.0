Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.2181.1596086632115074374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 22:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LpFo70mm;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id j19so15875573pgm.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 22:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=QuaHVg5II70TUizVr17FQOdnGbbk2CsFL1iSvktSGMw=;
        b=LpFo70mmidO25YBWRMWWxjfQINO4YYtlV4y8yOtmLIUPaknFTj/bPVMuHa7+xhdKC6
         c7RaCeB4/qP5/M8Us1AEkbd38NyO4dzVAOUkYD/b2juwFhnVw9RNJIWW2jIaoosJW1fT
         uoyIQvr+NGr8LrT+xgD4jnV73dP7gsnbinPn4pPJG0/0Hgr/XQxIXr/Y1ZLgBJwUWC21
         oKaAITwdNSY9nUghvF0XZ4YaB19tQpOxUzVyqhSpkiZRv9D4I27A+DUfn8OeGLHh9Nfk
         sH20MUEjiBHJ1SphZM62LvmNa6vbROa9i6bxjsANYgqpzFEkrUq6vxHTrnzpeJrH41gb
         /ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QuaHVg5II70TUizVr17FQOdnGbbk2CsFL1iSvktSGMw=;
        b=S/QhrcZ21cNCUF3UK8EuMNMUKa152vl9egkVUk4fGtv4c4wb73FitGV8Slu9zuKCck
         zTutkt72Fv7pgDV+hF+x9g/nb3MUhxlfXXr+m4Fs8LF/uMMCpFtx8LzbenmTK/nYkjZZ
         VPjeG1PUfnK0K8ogIiY+8i2Xyzs68zX/LOG2pY2xJu+6ck7Wtlyy8Iw79ehQ243MKYfo
         qQ6e0/E5JO5zTPWdhC5+JEGRIvgEbyDhf7tXJqjvbRKp9vSIkJyEZfrz/wBPQU2/oawd
         ESb6mdXow3Q9GlKXR589OCckb5V8j4u6PFViFelud5gKQko+ek2Ky+h5TPqni8huwk/X
         3MBg==
X-Gm-Message-State: AOAM532vVkQgQ8x1KGHQgbCcoe4DIp0FEAGOUr/X4hkYPoW1wDRyFdzI
	k++koSf7tZmyZV43CzsEbhe5WSKwtYI=
X-Google-Smtp-Source: ABdhPJyH7p4mzXeAPeNXq4zELXu9yj7q3uI4EVBe/PJ9pjI/xry18bjJBDgDijJqnruowqh0i+vtiw==
X-Received: by 2002:a63:2946:: with SMTP id p67mr32857778pgp.227.1596086631220;
        Wed, 29 Jul 2020 22:23:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5ba:2655:68eb:112e? ([2601:646:9200:4e0:5ba:2655:68eb:112e])
        by smtp.gmail.com with ESMTPSA id 22sm4142009pfh.157.2020.07.29.22.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 22:23:50 -0700 (PDT)
Subject: Re: [oe] [PATCH][meta-oe] fmt: update to 7.0.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20200729154126.21163-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <1af0f1d4-5bb5-3914-8140-d7e8b2075ee0@gmail.com>
Date: Wed, 29 Jul 2020 22:23:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200729154126.21163-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

its already proposed see
https://git.openembedded.org/meta-openembedded/commit/?id=b7b0339c7873d7dd473a5b406ccb0888541fc010

so please rebase it on top of master-next and resend the remaining delta

On 7/29/20 8:41 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   meta-oe/recipes-support/fmt/{fmt_6.2.0.bb => fmt_7.0.1.bb} | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-support/fmt/{fmt_6.2.0.bb => fmt_7.0.1.bb} (69%)
> 
> diff --git a/meta-oe/recipes-support/fmt/fmt_6.2.0.bb b/meta-oe/recipes-support/fmt/fmt_7.0.1.bb
> similarity index 69%
> rename from meta-oe/recipes-support/fmt/fmt_6.2.0.bb
> rename to meta-oe/recipes-support/fmt/fmt_7.0.1.bb
> index 05dc94a99..0467544b4 100644
> --- a/meta-oe/recipes-support/fmt/fmt_6.2.0.bb
> +++ b/meta-oe/recipes-support/fmt/fmt_7.0.1.bb
> @@ -1,11 +1,13 @@
>   SUMMARY = "open-source formatting library for C++"
> -DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
> +DESCRIPTION = "{fmt} is an open-source formatting library for C++. \
> +               It can be used as a safe and fast alternative to \
> +               (s)printf and iostreams."
>   HOMEPAGE = "https://fmt.dev"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
>   
>   SRC_URI += "git://github.com/fmtlib/fmt"
> -SRCREV = "9bdd1596cef1b57b9556f8bef32dc4a32322ef3e"
> +SRCREV = "f19b1a521ee8b606dedcadfda69fd10ddf882753"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
