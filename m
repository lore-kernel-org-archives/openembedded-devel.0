Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678D0C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:15:41 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.16314.1740676533817862022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RoIXu9c8;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb9709b5b5so217108066b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 09:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740676532; x=1741281332; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B6VeQy4B9KQ3mB4/CqLVxoKEu+ds/may6Qoq2ZkwBSQ=;
        b=RoIXu9c8fc8DySqQ7pyydnervKwJDxwEggDRPx0Aig9xendzGYN410vtZ0PnYl2kx6
         W9QsUvBUbZ5U0U5y5NW6Mu2+VdEcxMnM3aGdAm5Y+WvZSq8dg6PuBHrgTjg5hC4fX/jN
         yKQyjU+WL6DJl9C2bK5jm7nrK3ZCr1vZOJk022pG7mApHDNws9QSVVge7zKFWBqS+jXI
         Ld2OpfhdQ6KTeyUFEnCu+CrUxe8xC/QCLmLFR6ylyBdnnIJbpILp5TBpbhcy+x1x3/tr
         cP8b6ejvKNvKnb+AwsBM6WTE4pAdDPRKQFlatXr67Oxa+CKIfXbWElpUi/LyMGwYBHAI
         qWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740676532; x=1741281332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6VeQy4B9KQ3mB4/CqLVxoKEu+ds/may6Qoq2ZkwBSQ=;
        b=m/2MGOc24b39ynK9xfIfiFh4MiLiuUg0dWdokyGdpXtgqh1vtTlzjdoJivu3y2/dQx
         st3U6A6b33cJdAWn5u5JE4JyPch6ygPpvrTJYU4P1LaRsWQTGYZi/7N/Uh2hudKS/l20
         3/yN2cBuuXc7GI8qcCouUx/N+LiwngCVhgl8RYfih2QLruv4nelroXXRI2xZ6+m6ZL2R
         o0wJulTtOnZg5F2PC1ltNZ8i3aoFnuQuFbGSc1t7x0+6mdQNPLdgGO6dORZB41J0lOWf
         nXDQHymYWDtTcupWeVmHHwlRx3gAtG5RwN4d0uezYQJ1rbfgDBjh7tcDfKgnM13wj0zq
         6iZw==
X-Forwarded-Encrypted: i=1; AJvYcCVN0xHaAb0UvvODv1bVah1F2NMdh2t5ZegSnJtdjMsufN6jeQTENZ5yHyr1hkGdjNN4mTnpl6HQuicTpSU4Z/+Spms=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+5MP2N1uLnO986mIbCDCgvpo7uos5wtYaId+MgT4uTt41HbXb
	zLhiGpA5LY+X5AP+U/KwX7q0rfEkeHcjJNCkaFsTEKwovXE6Khgm
X-Gm-Gg: ASbGncskK3IpKxF6py3VhhWev8B62/Mz/uJgOUTA8FnhZWkdHP1hG75/SDvv5FiiFda
	d+ePYezrX81IKadCynSYXaQfrHfturmJgduOBdAlXLYY9q63s8fWdtOSGYW0wUf/5CLWVnBfQuh
	KNkqpudH67bN8ZO2uHiVHtf1maaJyTHAqj0JXuaWpOfkgJ5I7oIHmeoK+3WRIbjBEs/3cWAz1NO
	y4ab+V6zOgBiPpnU/T7o7O1isOA7ksh5UpycY+R9Jc2mU/B92cC36QKLfLM0pd2ZSCxQcUp2sJB
	Uiim/mKt66CLT+MUitZYzJzYglBSjr7KVg==
X-Google-Smtp-Source: AGHT+IF3DonH9yjN2itHYM8j+C+wr9rEqufcAR9aaF2WQylPHcHiWKEtc81J2GcAN5+DEWHLhcerxQ==
X-Received: by 2002:a17:907:868a:b0:abb:b422:a47b with SMTP id a640c23a62f3a-abf26857b25mr25498066b.48.1740676531892;
        Thu, 27 Feb 2025 09:15:31 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0ba58asm152216966b.31.2025.02.27.09.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 09:15:31 -0800 (PST)
Message-ID: <d290aab6-a3cd-402d-a1dc-a6ab2278e377@gmail.com>
Date: Thu, 27 Feb 2025 18:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gnuplot: add x11 PACKAGECONFIG
To: paul.leguendekerneizon@savoirfairelinux.com,
 openembedded-devel@lists.openembedded.org
References: <20250227153529.82380-1-paul.leguendekerneizon@savoirfairelinux.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250227153529.82380-1-paul.leguendekerneizon@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 17:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115696

On 27.02.25 16:35, Paul Le Guen de Kerneizon via lists.openembedded.org
wrote:
> +PACKAGECONFIG[x11] = ",,virtual/libx11"
You could also pass --with-x/--without-x to explicitly control the
inclusion of x11-specific parts (though I'm writing this without trying
the resulting package - if this config options not the wisest thing to
do, then I won't push it any further...)

