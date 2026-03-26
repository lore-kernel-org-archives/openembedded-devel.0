Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A76610A62E8
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:16:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48455.1774534597370683791
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gxm9kubZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso10798265e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534595; x=1775139395; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PrVPxyRqlxlWgyhozFI1RlbyYC0jVb1NlL24ZopXqDc=;
        b=Gxm9kubZfMfKvP0p815AquVdLPDCU/Ya2Zoi6kMRerOfwk8Or3aNGD4HwX0Il+CJSd
         ojkCmi5n91P0Ghzc+H0RNJTIiKzAA/ujrOIYQJuq8JuNFNd8jQwpXsBeWIOXhIdtwnlR
         ht9Ak89cnt+G21AUAreNVFzBQ+xvPrCi7CW4yOWmdfcQSiFLsCN92Tc/rj0bpcKN+nyQ
         jLs67OptFQtgZZ77hB9DWNc4PjwmOnB9iuN19TwKlKBg/rcziffMPdwGgLyi1Meg+3G7
         C90EHBSNi3RLU1wkIGehxz43ds02VkS3/jbKzoHfAE5UAkWziGP1Co3zR5kIunadhXkj
         T4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534595; x=1775139395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrVPxyRqlxlWgyhozFI1RlbyYC0jVb1NlL24ZopXqDc=;
        b=leXpCk0IcywqVxxe3G+bPZzrbPHfQ0z5VRjhp7W9mvGzll942h5fP/3BgZgSuslgpK
         zidUm8mDqdtBFmH4FRKCAozuIwKMtwdULHY/C7G1p3ZUnsEeNDDB6seRwtELqsA2ZyBf
         Y2WrW5KpmBLn1/qQS9JlHtbMkVVYaH+OZQFOAUZI09OWOaxvcZ3z0HnCyNUcr5RiLOnH
         KaffPQXDsTmpLLNkQVG6F1mT21GsTc+V9KYaugRQr0hF/2JSsi9qhwAbDMTHzbK9+9N6
         c1mrf7D1daKNMpSmsfSbRpho13yps2opVzdMlJBwVn4xCrlzNwpF9WxBX+RyaAd5UM/p
         4BFw==
X-Forwarded-Encrypted: i=1; AJvYcCX4mG6s5FMzS1Bwf3QLHvZG5tS1RG6Y8ju6tciC5UdRa08wZNspHqJ5BQgvdq+Col/QyzUK4hqGBnXo3elMFo3qy0E=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxvY7b2lDZjRbrGMJPGgolo/L0pi3NZZfsr/OOiSGxf1ad5LS/t
	RePp3GaztcZO3vCt0G+ZsIhfQnwS9zfN3BEdoyUB4p/SZnQjAXQhnyX7h65+gA==
X-Gm-Gg: ATEYQzxEHjikn0wrGKNOaiqJSB/jdwkpPyZErUzlAl5rhq8EZDMH4ZKNi/YjZ2fbion
	As4zB/S/UfglFoZkk+NoeAQg3blFcar5/DhDxWHJlpJSLMxrdyO6bLQnhx7ppWJpB1b5hEjbf1h
	kye8CcD5vGREF87tNP8NnjQmYJc4QsxA6K14/MdMvNIbVjpCOZq+10LwVe40fgE594fBbyvI0eI
	yh2x5gENBcvHZFsmbI6viWouBHb6SGN4q0YoSIlrSsJSo+YNpcT0fNI+SL9TvTnkYSafbGmsOFP
	SWI5gGyPjn79j8ErJDtdVhitqTkh+VF/2sHRwIT4hcp2WyoAuScaw4MzTghP6OXPM0QcWnKmf4p
	XArtZRAf4LVEkXI5V9pg1lb8Dz6X9wjA6y9YnUxX6uY6j3OH93HyiEDC06o9v33sumQYBAP19zv
	66oIuEO8v+e0hdRdJSyC9MHdIoVc1Aft0=
X-Received: by 2002:a05:600c:8011:b0:485:3f65:94a1 with SMTP id 5b1f17b1804b1-4871605c226mr116763175e9.18.1774534595207;
        Thu, 26 Mar 2026 07:16:35 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb3d09dsm31450155e9.0.2026.03.26.07.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:16:34 -0700 (PDT)
Message-ID: <c9fb9a9a-59c8-4e75-9614-feb4d3dd589f@gmail.com>
Date: Thu, 26 Mar 2026 15:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2 01/12] python3: Add warning comment before
 PACKAGECONFIG[freethreading]
To: zboszor@gmail.com, openembedded-devel@lists.openembedded.org
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
 <20260326141213.2081121-2-zboszor@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260326141213.2081121-2-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125735

Wrong ML?


On 3/26/26 15:12, Zoltan Boszormenyi via lists.openembedded.org wrote:
> The warning comment is really needed. While Python 3.14 supports
> free-threading officially, the ecosystem around it does not yet.
> 
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.14.3.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
> index 7a1ad1e386..c23605f59c 100644
> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
> @@ -112,7 +112,14 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
>  
>  # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
>  PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
> +
> +# Some LLVM/CLANG subprojects (e.g. lldb) and many Python modules
> +# do not build when free-threading is enabled. Also, the support
> +# for free-threading in many Python modules is not yet production level,
> +# although they may build fine.
> +# This is highly experimental. Do not enable it!
>  PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
> +
>  PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
>  PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
>  # Use profile guided optimisation by running PyBench inside qemu-user
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125723): https://lists.openembedded.org/g/openembedded-devel/message/125723
> Mute This Topic: https://lists.openembedded.org/mt/118518888/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


