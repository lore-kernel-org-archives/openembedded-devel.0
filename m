Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67FBC369BD
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 13:24:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.7768.1745069048307064564
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 06:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K983IJVn;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1835810f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745069047; x=1745673847; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7rZZllONu7PgBeQpkL8ISxAQGD3n9YsJBeLKbTWxsU4=;
        b=K983IJVnuWdDHd3xhC6hYT0L3U2BtIhDKXVl2cfZvTkUZ75qUKeVPM3//16836mslf
         Jh5M4BWHKt8PKnvVc66OgAqfXCBt1gI9tBzYOEt7yg/pB9Fvd1mIsw2l1f8NOYjMDIsZ
         ZRmnFxIekJvOi/coW2eNim8E+8HK4R7fa/bbStdTxSF15UrWMP4Cz/FEj71zBe+1+cIV
         TBFtnDEeu7oMzf6wq9j3yd32j4WLrJOdySgJCHuRAwu5NugNgNrqZRRwMI2Mrv5n/Mqv
         eV2v6hqWXRg/7ZpiLps9n/zn9hXuhoj/B5RAw6GHKsKH0GddACCpiNf5JHd7oUX15Ki6
         PwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745069047; x=1745673847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rZZllONu7PgBeQpkL8ISxAQGD3n9YsJBeLKbTWxsU4=;
        b=seuEshOHzQ8z7YpWdGQmqRK+g7Veq/u+88fWZeiCfHU2BtxLv9Rop5cXszhBUOHcdp
         Pldc5X0gCLy6OR5/GhMz7CEEObv+p9sA9+1mEBS7i2qt2VU3+zDRElKXAGjnH3JmdvXs
         /GuwOmr6Dis0nee5nls8LPA9T5Hg/QWaeCD441Phw2Od3+zHY5OskmmKTT0/9+thJmzT
         WbVlam+qpWDgUXfW2g37/QYDpYMkgNmK+uZe2EklKNnrEQhteD7xK1QmnDWwBVicrvxb
         lPmODoiO5aWHZQSjMl74yqdnDMffj+jo8u/3HeSm6+DmZxT3bxQri4Loo63tlKlf6LAE
         hiYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQn2Z8r3H4QESFJC0obTM+P2zTe8TWzTSdPFKG5yGs/Zzg9Wy+C3LdOL9m/m0PnUTHd+S7rleVyn840wzH2KDFtPo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKCyIrW3DW7L4OCHJjScTzWjsOCUFianbaIPNvhNtW3UqWhGMr
	MDZfSizrhpACuT2iqKy5getqtOeO6rEaX18iyli0f0/cGoWI89qm
X-Gm-Gg: ASbGnculJdepPMq8iNtQrnptwFpd9InGsCQNitt6YATXg79jBP1NTckHwInTbbZDBBs
	ZWBnGAxV0xKwcZhnoyoqcqA6dj4vw9uLxxLvDHn0PpaP0hMeW7BjT/IrZeP6qGFPtSrE0sbfqCT
	AWDgXH08POXukY+2fmMEDHH95/nK0I47jpNxte/KF5lksFH8J5qAofgg1NQJ4JkqpCf43a6d0i9
	daCM4h1huSPBc63DSNpNegLLtS2/XRU9xA644DHnbQHGzEzdWE6tmfmI/LjGE01vdbKP/Xs30H6
	VjU8iulVlnvZ/fbsQEU2HMHCD2exzYtd4dn2zobZqSKqRIhw
X-Google-Smtp-Source: AGHT+IGL3m1bgnoP28X2dK503Z1X2C33UP2AhS0DCwneAGcbEezJtUOU2bpTTQvqglfAT6eQMes5RA==
X-Received: by 2002:a5d:59a5:0:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39ef8ba608amr5660068f8f.11.1745069046466;
        Sat, 19 Apr 2025 06:24:06 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4f06sm5920826f8f.92.2025.04.19.06.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 06:24:06 -0700 (PDT)
Message-ID: <29310b77-a1e9-477b-9e29-f56a37a17051@gmail.com>
Date: Sat, 19 Apr 2025 15:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/4] gphoto2: Use :space: to identify space
 characters
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250419073327.2468160-1-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250419073327.2468160-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 13:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116980

>  
>  do_configure:append() {
> -	sed -i 's/--sysroot[^ "]*//g' ${B}/config.h
> +	sed -i -E 's/--sysroot=[^"'"'"' ]+//g' ${B}/config.h
>  }
The summary claims to use :space: characters, but in the change there is
no [:space:] here.

That regex isn't too easy to parse with those quote-marks. Isn't it
equivalent to
sed -i -E "s/--sysroot=[^'\" ]+//g" ${B}/config.h
?


