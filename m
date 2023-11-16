Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21133C5AE4A
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:51:31 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.19047.1700171485061384503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FnVvn3F2;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c194b111d6so1009323a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171484; x=1700776284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXL4c7Y7qyOuK1jDRALcWwDCkLgbHtOOlLwb/IbTatc=;
        b=FnVvn3F2SnnVBXawzzL9senZnIlK/9oPASQGc4yjPEjGukjHNXi/zzgFSEiMwOQtfw
         LtlhCVuO1vFJKlzOqtzXxZzem17HPfGQf+2SZ3OpcTofNN3P7zlp5ojJ45wuoMWJ1txv
         T2ZEFbZ2BZR6RWgQEHdMJ7NikVcrgfvxIpxiPZ6uK5+9idTidOrmkSOTpej4Y4ejcA4H
         baQKXJ7SK+f1hLYclb8vReBpq3W+eRQrXgf2KN6cRy/lBXqX3uHDa5R/OPzjXwAaBzCk
         7kQySTEtWaNK2VOHJpPnveifFYe7g1QiMVGw5bxsu0gOqRdyC2HN6b6dzXKzLQ1lnWNb
         EELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171484; x=1700776284;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXL4c7Y7qyOuK1jDRALcWwDCkLgbHtOOlLwb/IbTatc=;
        b=BoyVWHkYqKhbqG4vJA5FwyXn/koBGF1Tex0jtS+2HPvYUVuyPriFQEN9AjElO8qfox
         MrVdD0GcHPaTqGcOm+C2vSTHIJjatXoBsHShbLWAaLzuQgmhjaukQKem8leC2p0qVEKh
         idc95ebAeF4FDb0M5In74p9FlyV5QZazRoR36HdMG7iToUjA/yjT/O1tOYEdtn3AkZZI
         qaGaFzW7rjG1QvOSxo42BiIo6o4YhywLnHAzruC7lz9AXgHk/9S0HWxIjAJzB3TcPdNZ
         NZKR8UgKZlwX96PV9x57zrkOzg5RMJCyKBQrMpaCZ34KRIDqLNn81aTVE6sopuOJJf76
         Ri3Q==
X-Gm-Message-State: AOJu0YwKKE1eRg2/h0nRRlzBTwPM2cdrxAXlklIgSIsKI93L4OXr5lnu
	nd1mBKafRl+UdYh5RXrP87U=
X-Google-Smtp-Source: AGHT+IGijKBAI+pQAUuaaViTT0s8fVWTnewED3YgOLr+i1S6N/ALQ3+6Jyqmm9/4lTtRmrwlICn+6w==
X-Received: by 2002:a05:6a21:6d9c:b0:187:c5c5:3369 with SMTP id wl28-20020a056a216d9c00b00187c5c53369mr2746623pzb.55.1700171484473;
        Thu, 16 Nov 2023 13:51:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090ab89100b00280469602bcsm1997692pjr.2.2023.11.16.13.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:51:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Phil Howard <phil@gadgetoid.com>, Martin Jansa <martin.jansa@gmail.com>, 
 openembedded-devel@lists.openembedded.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20231115164704.2932248-1-brgl@bgdev.pl>
References: <20231115164704.2932248-1-brgl@bgdev.pl>
Subject: Re: [meta-python][PATCH] python3-gpiod: setup target config in
 ptest compile
Message-Id: <170017148362.249256.15768266495903754516.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:51:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106837


On Wed, 15 Nov 2023 17:47:04 +0100, Bartosz Golaszewski wrote:
> The python3targetconfig class does not setup the build config for target
> in do_ptest_compile_base so we need to do this manually. While at it: use
> the provided nativepython3 command instead of using the full path.
> 
> 

Applied, thanks!

[1/1] python3-gpiod: setup target config in ptest compile
      commit: 936ae8ef2e7943a8bc9fba33ef099901e59a028f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


