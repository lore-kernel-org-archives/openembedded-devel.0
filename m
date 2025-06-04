Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D41C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 10:33:31 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.13495.1749033211081753483
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 03:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+l2xUvf;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad8a8da2376so1096221766b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 03:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749033209; x=1749638009; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DM1vHlJMn6PhGGOxMvAFxGSSzNP+qrWxa0+gSkRH9g4=;
        b=I+l2xUvfZ+KdmeiATCIZZpM9GV9iuyybxx/cN+iUkN6bq5dNYSu/6ezED3/CQzB5kz
         BMeOxNn4siraBva8r6uElTHd0GJO8USRUY6PgXzUo+oaIrg8vRwhSAxDCC1AnYWgy84I
         G7xv9wBw/Wj/NhKaXd+tYCkika8veWNVGTlgU0puSXu1JBMDd5EmIBaHS0ebxZoxhVmz
         e2Tw2DTgYuA14xzdw5QwcURz805q02aLGgknObxJE6KDc7eht4zKygbtGJ8GMtJI1bCW
         c+dDtTaTnfYjvRtgAgQIA8iogVJ468FsQgqWDvOwUxobc0g4qkGyOqxPOCpTlIVL7qZ3
         7OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749033209; x=1749638009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DM1vHlJMn6PhGGOxMvAFxGSSzNP+qrWxa0+gSkRH9g4=;
        b=YCJBXfsd0M7mX0N8JCBck2sbyqcH4t1pZeUeJ/n7v8SA/s3TuA97ygYdsp7g+lQzL6
         nI7R+LJNOfypK6dEOh7xuj8yQ5Ed7W6Sgy3w04z3/Z3UWJTwhQEC4+ozwBhl5joEnsCM
         ghiVSGB914w3007uO4tgH6EmI/8qUdPSR3hjYkTqGUy2ATIOX/xKXZUOYl3Ni265jy5v
         7XbVKTMI38DudSVr9pgUnDeU26kHtkuy+5Vsj4qEQPM38hrX4YYMMD00KJVKvf60I+91
         sv82BbFr1DLrWCp2ovSdrcor2oRji3pKWywQdn8ZsEaNmnwXWmskVfKrrvKuslalQR1g
         AP8w==
X-Forwarded-Encrypted: i=1; AJvYcCWmjBFhtPOW0JPOeht2HiJEh3a0t6kSAzuAHRyfr2bCEr0F3jYhteM43Rh9j2cE8btQT/5I+fE7hFvpKN3xiERkVZc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwiP9wNVr2Damz058z67HiIgLoZY8f0f0AmrZddvFJUlGcNf4t7
	Ab5yK8Bm3RszTyxK4vIt7iy8oSgdcAfzBB+or7mTaT4uDeWCUjgGiPb+
X-Gm-Gg: ASbGnctuZyYKEevZCOFa8B9rPIcr85Tre5Pkv0zmrFlc31PVnW04zjZnToqqkc6myso
	ga9oLlsbVQHj+fQN+QevjXPeIJ851cd6PhxLuxMYslyIP1jlvmDPomNws+AjHxZyAcx/gPl9iwK
	rH6OkSeMWhujqOiA3/4Tbm5QIygEvr2Iqmr5tpTkP2m2vQYZaEzt828CTuvF2XVIQgn9bS+9HWm
	8rNW69gd5C4EMBCEyDCTZ8fqLOTApJs/kjHLregtG3ozR/1jDXWYWro5O1ExiFr2WyAiB4r8vJs
	LgSE/QLDqNrP/nIqhRhKmh4m4rfHpNE+/SMEtF27IDnq0QR3/RdZEPyXUGs=
X-Google-Smtp-Source: AGHT+IEnEnd98NzWDdpwxfLKluM/bhrR6+lJ9ySTWjPSDz4Kjzxw6eC0BZEQTygNZjoBzySDdEUOmQ==
X-Received: by 2002:a17:907:72ca:b0:ad9:85d3:e141 with SMTP id a640c23a62f3a-addf8fb3162mr189963366b.53.1749033209238;
        Wed, 04 Jun 2025 03:33:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fecf6sm1066881966b.30.2025.06.04.03.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 03:33:28 -0700 (PDT)
Message-ID: <2cf31147-fa1a-4277-892d-a6b89648ed5e@gmail.com>
Date: Wed, 4 Jun 2025 12:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe PATCH v4] cryptopp: add a recipe for version 8.9.0
To: antonin.godard@bootlin.com, openembedded-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Jansa <martin.jansa@gmail.com>
References: <20250604-add-cryptopp-v4-1-9e9400a9e877@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250604-add-cryptopp-v4-1-9e9400a9e877@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 10:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117736

On 6/4/25 10:54, Antonin Godard via lists.openembedded.org wrote:
> Cryptopp is a library of cryptographic schemes written in C++.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Note: I had no issue building with MACHINE to "qemux86-64" and TCLIBC =
> "musl", as reported here:
> https://lore.kernel.org/r/CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ9=94g@mail.gmail.com
> Any extra steps to reproduce the issue would be appreciated.
Looking at the linked logs, Khem was using clang - and indeed,
'TOOLCHAIN = "clang"' reproduces the error on my end.
If there will be a v5, could you also add "tag" to the SRC_URI?

