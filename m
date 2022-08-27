Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844C6ECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 07:57:01 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.47032.1661587010911663942
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 00:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MTxWxkn0;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id h5so4220383wru.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 00:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=CMOsB2Ok8t+WCkSTzwr/LNaq8dVunaUrYXsf7t/vwv8=;
        b=MTxWxkn0gfYq6xjMA37ULP4/X/Y61kn5luHC5lFN84v0EbiFYAj6knzbvPiPkEBd5n
         FsAQBt5Anlz01pcoekwcViQNkcQaGjBHjjH3Dr6/i4ok88aFM4voVCcO8smmg/56VxSJ
         KdMRmja8+JnIJGiPGvs+7PMic8nsINAXHNxdFmpfPa0Uno38rwvic+QiM8+GXYq6aUtE
         Vo1IpLRSBWwuEnmGGY6EDTvcajfBzpH+3nq/P4rwk0l3mtY9034H7zFWe+wncPV7gHp1
         lTj+CkzvuR7V8PDgQ9+u0hLjvHzgBv1cWBv+07hGvn73JRX5bYbqXzL628OivVWeghLj
         p/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=CMOsB2Ok8t+WCkSTzwr/LNaq8dVunaUrYXsf7t/vwv8=;
        b=KFUYEqfzq8bIjU6RrQivQzlhBYiz5hUzuF30sRSINpj3JELMvRF0zoVgbUyAIHheTV
         7Bu0ssBDCCtuYZZzXX4NS7Uu2WjX9tA+w/tlGnI0+myZVTsMXGKZNWRdc3Jq1m6ZDkDs
         xD9eqmxkF/q8BXHNASiwvv36RFPWV7LfU2dERHkL14WqMMdyGjmwSvPJioFOTrd/XOma
         F/yV5o0uomkQ4JGAGieBuj+KHTP+y3hsKfBttcIeShdbw6uTCCx/onOXSUB79cU77mJX
         jZu+xRcxb1DxfZFMA8YQprrShKLi1NoH3Jwi1pfGlvJd7gpHCGdzETWzvARLmuC8ARio
         /0QQ==
X-Gm-Message-State: ACgBeo2S1yDgDDAMUKoBwZrtZMVMEQnEgZkYcsGCYYfRVQ8dr4K7GM+g
	elL9ORbYs6NKOafIwju46ZOVuA4Kcs3Veg==
X-Google-Smtp-Source: 
 AA6agR6mw0P/rKhdjalNHyfHJ9+axstM4OyH0BHLc14CNdgfXgcyPI3XFCigfhMidkcd38zKo0wOAg==
X-Received: by 2002:a5d:43d1:0:b0:225:2707:dee with SMTP id
 v17-20020a5d43d1000000b0022527070deemr1560575wrr.25.1661587009182;
        Sat, 27 Aug 2022 00:56:49 -0700 (PDT)
Received: from [10.135.81.85] ([37.120.204.195])
        by smtp.gmail.com with ESMTPSA id
 e3-20020adfe383000000b0021ef34124ebsm1719128wrm.11.2022.08.27.00.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 00:56:48 -0700 (PDT)
Message-ID: <4bba1a03-8702-978d-4ccc-2a7eb1c2e395@gmail.com>
Date: Sat, 27 Aug 2022 09:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [oe] [meta-oe][PATCH] protobuf: disable protoc binary for targe
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <170F24865BB99975.22386@lists.openembedded.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <170F24865BB99975.22386@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 07:57:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98485

On master-next please

Thanks,
Vyacheslav

On 27.08.2022 09:55, Vyacheslav Yurkov via lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> When applications want to use protoc during the build, the target binary
> has to be disabled in order to avoid following error:
>
> |   The imported target "protobuf::protoc" references the file
> |
> |      "<application build dir>/recipe-sysroot/usr/bin/protoc-<protobuf version>"
> |
> |   but this file does not exist.  Possible reasons include:
> |
> |   * The file was deleted, renamed, or moved to another location.
> |
> |   * An install or uninstall procedure did not complete successfully.
> |
> |   * The installation package was faulty and contained
> |
> |      "<application build dir>/recipe-sysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake"
> |
> |   but not all the files it references.
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>   meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> index 83dabc9f8..e36179363 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> @@ -34,6 +34,13 @@ EXTRA_OECMAKE += "\
>       -Dprotobuf_BUILD_EXAMPLES=OFF \
>   "
>   
> +# Configuration below allows to cross-compile protobuf applications
> +# and use native protoc binary in your recipes. In order to use protoc
> +# on the target, set protobuf_BUILD_PROTOC_BINARIES to ON in your bbappend
> +EXTRA_OECMAKE:append:class-target = " \
> +     -Dprotobuf_BUILD_PROTOC_BINARIES=OFF \
> +"
> +
>   TEST_SRC_DIR = "examples"
>   LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98484): https://lists.openembedded.org/g/openembedded-devel/message/98484
> Mute This Topic: https://lists.openembedded.org/mt/93286108/4455192
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



