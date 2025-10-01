Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F79ECAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:26:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.17729.1759325210155860137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iWOb+ikf;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63667e8069aso3949369a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759325208; x=1759930008; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=va0bzUhu7MUL2oxxYHIpGQz2ZoX4BPNfBLkokR2wF6I=;
        b=iWOb+ikfk6rKTY1ij/AZXKisYa0LWZQ6sKzd8Z3zbAkmi5WbIRkE2lKoSAAhttod5r
         wrpmP/6kjh2orXo5H8kU5hE1CIbiB/Gf0RNLcTji/eq5P6/ifM041EUp+N1HHNLp1ida
         N3CM1XF0dBgyjjlwcdCQXoeV3y+iYgKuMPdbT5Vnz5wplhcag10acpfHI/Tv0PxjMhQ0
         P5RYpP6l8DC4MKPfRYolPYt2F0yU4RCRNdDpNQ3qmMRQN/S877x7smWmUjIHVJC1jT7K
         4egtSB1tmv2Q6xl8/N/76mN0BN3eg4LUP7zqOce1vlinQgSj+Uv04HMPODIM5Z0aNUrD
         RHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759325208; x=1759930008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=va0bzUhu7MUL2oxxYHIpGQz2ZoX4BPNfBLkokR2wF6I=;
        b=DL47dzCs8uftGwrKx0qWHCXHPbO7accjqAItHhOEJ0jnaHCoSXgwt/2+ASz6Bg9U+U
         ZW6PHf5cWhkBRszGjBRxxKxr0ZiFHzwTvHaBoekmQ+Cg9HaQyB3FjEp6ZeUt3AedE1+w
         Uj5vKSPA9tkrMrlgAKc5aMgSjpeWgLtTT7ajF5SkoIgBuO205UOB8g+s4no+3Ac7vQtK
         CunbZ1FIC1XdoS8FbCtMDqcaVCKbThLe7Ig/IJwd7pY3R9brR+bpwyiQUvqbaFCNNHXT
         Fd/uZhRlem6dnXCzUEKXKpzSYqwCNELU8PeQLWZuB+Ea1G+2E8Oqza+uw2uYZ/8prsmX
         aiQw==
X-Forwarded-Encrypted: i=1; AJvYcCVTNKt6APElYJaaAFhU8T5lnMdnWBVCff9ARNXhaoTtXQD7riWN1uLMPwblsd4/oin0S+W+BhU5jA9GZNhiGqx1ASA=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0WLfwgfI35qdNc4GMqwO4ln8zgveFllmvW8LUjgusqbGraJdH
	07yWQyARUbXvyCTvW20qhK5QERhky30g5prGlH97W+msgUwYdvnK6E85
X-Gm-Gg: ASbGncvuiAEqe6D5FKoI/O1ozaXcpoq3ElImwLQAhN1NEB61+Xqmchp2IZspF+p9a81
	q9Fkw+mzVpB7EMrLNMitEPQPXA5KEWIVZ+0L5zjwEEJjj4h3ZIMhIl7BVcErTpmQHq2IFE766cN
	yyAQhCzZNFg/j2FL6qB8LI63RV8zcZIarGMbMnqBgV7g0t0m9dgvZqEWar1wQI9qNuyL98vD8xU
	pc0okZI2bZmDfwbGLbfveaSYFJsp7i/VqdqKdcavxCbEOK1Mb4TCcKN3qiULths29s837IEzFBR
	zV2cRs2oV4O+3mP+pqns6C+0YqkvoqEXpJPbKQsg5O5TzSpB+siqQO4WreLLTGiK3pUG5YszDr4
	HIHOaE+0fYKhJZxGnORhBNpoYJ9BZ9y1CRe3vbqWtJvKY3wJpqJxWWrg=
X-Google-Smtp-Source: AGHT+IGfXRct2P8+gyd+Wmkeek6njIvcNLaCZvyw//ZYPWIsG/M7IGv7qHxCYZ2lWkzt4YI3mqBcMw==
X-Received: by 2002:a17:907:3d03:b0:b3d:c47c:7ce9 with SMTP id a640c23a62f3a-b46e95759d8mr486774466b.54.1759325208339;
        Wed, 01 Oct 2025 06:26:48 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b432788d967sm391152466b.66.2025.10.01.06.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:26:47 -0700 (PDT)
Message-ID: <645f9835-148d-4f15-9438-003643a6f6d6@gmail.com>
Date: Wed, 1 Oct 2025 15:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] 2/2] p11-kit: backport fix for handle USE_NLS
 from master
To: AshishKumar Mishra <emailaddress.ashish@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20250926164850.40701-1-emailaddress.ashish@gmail.com>
 <20250926164850.40701-2-emailaddress.ashish@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250926164850.40701-2-emailaddress.ashish@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120108

Same as for systemd - this should go to the other ML.

On 9/26/25 18:48, AshishKumar Mishra wrote:
> From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
>
> Disable NLS in the build when USE_NLS is off.
>
> (From OE-Core rev: b94798ecd535956ef4565663710ea9a701ff21ed)
>
> This change corresponds to upstream eeb3974472429a99a724f324dc8a63e435741f68
> from master .
> Since the p11-kit version are different between master & kirkstone
> applied the patch manually
>
> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
> ---
>  meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> index 72b446204a..62aca0cfee 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> @@ -18,6 +18,7 @@ PACKAGECONFIG ??= ""
>  PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
>  PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
>  
> +EXTRA_OEMESON:append = " -Dnls=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'}"
>  GTKDOC_MESON_OPTION = 'gtk_doc'
>  
>  FILES:${PN} += " \


