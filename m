Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE36CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 11:46:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.37112.1756986374394361763
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 04:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gp9LIvx0;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3cdc54cabb1so381271f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 04:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986373; x=1757591173; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKmGxKO1w1KmWGIVLFsGKX3LPtreUxfitJwUbjpSRDU=;
        b=Gp9LIvx04bbzbXOpZEg2iNN+FavBCAbbN290wbq+GodBTidPvkf7j5hCblZ4P1BVRs
         11uZKyop8+cX9VrMfZRZy81e77Zb+ZwwaGf1h7JvKCkBq9QgT725erJ3jnBFy2UL1eBx
         Z4p+ZmMmarb26xacv4lMfMFOs6cqpW9/P0wFZQ8mw6xUXsQdS8ISGbgYeQoJnPLyT72X
         Qfq18M5yIAd5Z9jNz2wlMbW8eXpet8+KhQsdHksT4BciiMKQQSP6+7ltPdjnhn88zatK
         4FAdLjQFi9esM7DFh8/9yPqFH7is8JcVi7aSUD64rPM3VSKBhX317ghysumUvPmwTJDQ
         CxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986373; x=1757591173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKmGxKO1w1KmWGIVLFsGKX3LPtreUxfitJwUbjpSRDU=;
        b=u0AaKbzskdytdizOs24FLYuNQF4xW7QeA/3rRMfiOaiww367ym6KqI2ajsVC1w+j2c
         lX724DmCtQ6ESIKhKBdtqtQLlVcCLLj3CJ8cnslesXwPocYCHkC5p1BOiu3zP5aWVTZF
         m0G2ofTAMio2AHQQ5X+zsF5ciP+eQivQ2s5JMwfMwFwDINaPWtBO6f5EHzueeFzRY7CX
         R88xL77gxp3SPwBDsWHoCmeDiosc8SC7tvy71r1g8dG2sTFgTy/3g6tcBAM7TQrw4iYO
         Fa0OpFIfzAJZraHgkQDgKfloPrOkp6mI7f8774EuAbYewHiXA5FWQgU0ngDWZaehQj0n
         BOYg==
X-Forwarded-Encrypted: i=1; AJvYcCWnyVwRLWdQPY916d9dOmFks5VdmPnHIe9fn5uSU+kr2ZsOqxQF9u0+XnfvZLCjllgXpFNF+S76cPOy+tFSU0GG2pY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHJ41lQ8KlkOXX42UPNIg7HdaIuikb/FkoaZqW4It/xqTJwrmM
	jpUCLRZr339I2vkVXqUcMdVQszH7t/5ZaQSDCcn4ymGiSHjCWeJZePcp
X-Gm-Gg: ASbGncvZ8w9OVlDonJYTCeB1QbuwtPp4ITGwzHMsCahDub6HI08afA4RHJs/+sKxPqk
	uW3JDEA960ayOphVktCCGm1+Y54/vKfI0RPW2z8WpFgu37tGdhWf3+YV54Hn5a8q+qb9VJjQ+iW
	rCYqDUERfGU/TP4GyvwyAfX2n/Y2JzhcWLICbWqa+EWTeIR33FxLgQ0oNkVq6XJdu59sgT9klhI
	+Wy/D+DjAauM4Gms2zmdL6sZtHc8H51HhgM2MiGz5wd6JF69xo3mmva9ibg9wu7rXWEup68EWQ2
	V3FCCObsQ19bwdkX1IgHfeYy1IyhNBLoww48jmiZdGJpu23N8LJuFg3NOTjsmg9w4RlDtMHhpkY
	6I9otuGi4b+GFjV/OJumHz+J3LpgHYmo=
X-Google-Smtp-Source: AGHT+IGGnKpTwEDbqyOttORRJiskCxjbQNMeTkwh6ybwAM8U2qxAhDiCUKIlKAR/LX1JhLzvDQioSg==
X-Received: by 2002:a05:6000:400b:b0:3d9:4cc4:50e with SMTP id ffacd0b85a97d-3d94cc40e25mr8232773f8f.52.1756986372722;
        Thu, 04 Sep 2025 04:46:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d66b013b7dsm16383129f8f.28.2025.09.04.04.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:46:12 -0700 (PDT)
Message-ID: <cfce5336-e3d1-4303-a02c-4006e9fb6028@gmail.com>
Date: Thu, 4 Sep 2025 13:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-gnome][PATCH v2] sysprof: upgrade 48.0 -> 48.1
To: psaavedra@igalia.com, openembedded-devel@lists.openembedded.org
References: <18620AE64DAF0C95.8194@lists.openembedded.org>
 <20250904114233.2451466-1-psaavedra@igalia.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250904114233.2451466-1-psaavedra@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 11:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119285

Thanks a lot for the new version, it looks okay to me.

