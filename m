Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D9BC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 09:01:35 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.14118.1745917286598858016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 02:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UsSlMAcQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so1027483966b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 02:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745917285; x=1746522085; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsL/Vjp/ETGdB17gTOEiJwFe4RjW024GWLyUo7f11rU=;
        b=UsSlMAcQlYp9E0kLnv2H3twx+TJYUVyQehnqNg/t/JwscEgmDkSNZneBfQbw3uRUdH
         2Rgp2nWUqVq4uq5V/XHrI/i6CKq79UgxUOehIP3FhcfVMgFX6Pn+qJMc4BZP9VVOZkci
         LWmuFu+JeAZgPHSukgJscsDi+GQKKjSHPgshQ+VIYGXYXujxCYuNeZqC2A5I7TunMv5G
         JMM7V5nzllFA2MYvxDRATaB3ZSEJi6n+WcEexSFiv/rqBILnnJoDU7gGvq6wfQfF8XzP
         0QE72p9Uu/L/vxScaKZphI6Jk9O4XUhKvp0KPYqtgWqPA2EHREuyWJFw2getSlSsNOBb
         Ae7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917285; x=1746522085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsL/Vjp/ETGdB17gTOEiJwFe4RjW024GWLyUo7f11rU=;
        b=UncKjkcisCZ2nlGnaJa2H0u77c+rhowIWz8GD0YSlMq6AHqQYoFxwmaAWVvouVdCOv
         VtrzmbmyQQtIMMJO9jMiCYOXNIJsnCZQ8tiorLr/vOgKbyYDPy71QAVGHbNkw0MKpoxB
         +TbIXoo1jr/fH7KprKL4oY+SsD/3gtlanyZuFjvlLTr2Fu5V35frbkxYNpFXmIojO2q8
         BaFgj7ya9+3woyzTVWUweIDfj3YYtZ4FpgaCxw/gzlWfFOLdu6mZKKWXhYlmeqTf6dO2
         +293KGqJ27QtFQn+kRI6QCH6ZOW3ExV2ze/YZOO+Olkb2jXCEd6NoL2i3/ML94DaoOzB
         YnXw==
X-Forwarded-Encrypted: i=1; AJvYcCWD7Zh+50qVdOz7UAqhYGmU6YuYf7xZyYw7vDZ2Rpz7xMV+6gL79gJci10ZOypHUSC6ensmRnm6yVGGofeANz4nOrc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyki6LRcq2xBUgNKsEcyVgqbNXpQE5vgC7bqH4gKs1aBHJlqJyi
	+RDIsPUR7m36VNI5HZ74LYBufleHzPGdYypv9dVl2+q+sesKjMTQ
X-Gm-Gg: ASbGncs+X9SCd/AG3jTZ9XiRpzEHDxdsMOCn29BkcegcO0TxCm8glxjeJs1t8UjnQ7u
	TARxUZI+yS8uBz8Lfd9mwyxGzucf5IdkxFkPfh/VWRIpzW+dY9nvFXA7KFe42FPSKivAybGWXtT
	bGgC/KQn0f4CIffRa0xTaziU7ydmy7+28D96U/gv8Z2wX7Fz1efFk2a8ipSuibqJv9VkgatRpkf
	9k8mjiFMBX9ugdo8mw4eSnhuYccNsxrn1y8cq9QBfLdP5lvqSwHfSEMtvLIhtg1XZK3GKCwodLs
	+6p8+4E/y0h51UBubzb0RDiyO8Dd7RadH4XyFp9SoVU7nA2/
X-Google-Smtp-Source: AGHT+IHpq/hrdngK1vJzrQ6QD64kilNUgRMYXfm4sHLPDUzCqE6iX2duAZlgyBoYQ+F/nBt5DfvHpg==
X-Received: by 2002:a17:907:7d9f:b0:aca:a161:f113 with SMTP id a640c23a62f3a-acec8525e67mr199849366b.33.1745917284696;
        Tue, 29 Apr 2025 02:01:24 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec0530c37sm149990866b.136.2025.04.29.02.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:01:24 -0700 (PDT)
Message-ID: <8141f838-4736-4f8f-86d4-b8caa0ec56c4@gmail.com>
Date: Tue, 29 Apr 2025 11:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH] procmail: Add -Wno-implicit-int to fix
 error of do_compile
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <1745911273-27541-1-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1745911273-27541-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 09:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117234

> -    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
> +    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"

Could you please add some note in the commit message, why is this change
needed?

