Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E964BCAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 05:50:55 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.6590.1758952252612272727
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 22:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EYaAkUFq;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3331adeadbso582029566b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 22:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758952251; x=1759557051; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zibNs52RPTzCHB+WHKdFpSMMjmTa3d21H2KYfPDyiKw=;
        b=EYaAkUFqsKhYzfd9A2r2zjLAX2bIBVNWZK5leVw10NN/0p/m8YmHcN+TYj124CxuBV
         DK3Dkk+epGAuZD5JoZOWsMv+dJwleq+hvuM4KBuQG6wTKzKkonqBccvtUPPklvCVCgTq
         XDvCTc2dC2amioygDXoEzfjnSRNrNfrGrhPRKkg8u4fIqyV6n0FH7pKWqJsaoU9X5A40
         OPLryRXyJiffAVpP8wa6eDzWf/Jsy84+jcawOdZhhrj6NbKZzJAhzBFBw/BRyRgt9O1/
         JX48jxL8ddmS3qIhCgnYmqelp16ogA3JrBK60AdvjBCWrg8zfP/51PuXtSN/a6laxkZP
         coNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758952251; x=1759557051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zibNs52RPTzCHB+WHKdFpSMMjmTa3d21H2KYfPDyiKw=;
        b=Jmg4NNaEF3X87A8MervGa/p7xLYQp/2DRfkqSY/vOH33e/GjjKYUptCGXrPENkHkKZ
         RsoXR9mHHu0VOE4/ZcA2zEr22RhH+SEdtYvSn+AIR1pm2GCcRIL+Wr04wJD5bgkYUV5o
         K15vAkEDQnd0hs2CMCDvSm2SEu19lw46bM2Be5n8Y+R4g+xvdV+DlkjlJ+c8fUr747se
         zAhBVuIDa0DCYdfos2J/UjVgUsAuXDpjjoudJP3M/Ge6OSMapFz7maIC0d2NVWlB+diW
         oxL+tnrWUcRG3+8zCDQ2QqTXuI9jaQySm6z3gOWDZb+gRdDZbA1TD/DfRJ3odYEqWiT3
         U17g==
X-Forwarded-Encrypted: i=1; AJvYcCUKi27MrUCW2fIGyls9dTx5sXgTpbMA3EpFILm1VyhHgq7lkkqkKKevibltg8WfDr8xUYWwjV1A30AzzT93DEjo9rQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3m7xdU1VpVTcNMXnNgZAPet70C/4aiQJT/Ibx4gWEU2aCu+xG
	UdyO+NS8rnR3XKlfHXB6BNlCZOhznahdUsNMdk7oKbCrZCuU+F+bivCLEpp5QQ==
X-Gm-Gg: ASbGncuehCmwaKSnk4cnmqDu3u9wkt97rxUAcNLViMnCAvALbtzErwIAyihBGZsxpkq
	3xmrDzLRD5y8jetNLOxo+4yXPDweJvZdtDBKBaKu+lkH/BZmvLvzQCTbPbg8XGHYHjXdETh2ePd
	WG/Ns9+ZC1ZStKkzv73cR2QH56e40gSlO8Qk+vFlCAkWnOg6Fn9S3gqZ8t0+Co4gWYET+qtheoR
	+hzErSFDtfSywIwjZJWO94AI7NkefUWQz15mPHgSQazwPotfO385AJVgaj9yHcRyjHvOuX0rck6
	o1A+skShuxJiGpqCh8T9GYot5KHJWuy5EwiOW0iQa4dz9B2IjK2XPtMU1fO79SBELtKlQnzmjNQ
	OQNj17lr79GwbGWYGLH5Fka4GccEF3bU=
X-Google-Smtp-Source: AGHT+IGkIXVbX0phx/oCEp3N5oNJPcy3KfbiWRlY8KGsVRnQXQtSWCMsFairZL3uJ6mxCixROIT2lA==
X-Received: by 2002:a17:907:9484:b0:b04:3402:391c with SMTP id a640c23a62f3a-b3a12355d11mr190330966b.24.1758952250771;
        Fri, 26 Sep 2025 22:50:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f76b4sm495054466b.64.2025.09.26.22.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 22:50:50 -0700 (PDT)
Message-ID: <9886facb-f449-4b23-99ff-a376d2694c73@gmail.com>
Date: Sat, 27 Sep 2025 07:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] package pipx
To: mo.krautwald@mailbox.org, openembedded-devel@lists.openembedded.org
References: <20250926142922.627071-1-mo.krautwald@mailbox.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250926142922.627071-1-mo.krautwald@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 05:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119952

On 9/26/25 16:28, Mo Krautwald via lists.openembedded.org wrote:
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=35c8e045b3a9ac6e7b19f25cb6cc08bd"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b2d8ecec3b363659695a29c2d11c8a88"
> +
>
The second line overwrites the first one. If there are multiple license
files, the second line could use the "+=" operator. Otherwise, if there
is only one, then the incorrect line should be removed.

