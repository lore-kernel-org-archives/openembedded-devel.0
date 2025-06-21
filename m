Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD2CC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 11:31:33 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.5626.1750505489160112640
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 04:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K7MZPJsA;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad891bb0957so481100066b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750505487; x=1751110287; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mc0BBTrgSS6WDu9OlawlNZxH8Nvp8f1/JU0BIBuEiS0=;
        b=K7MZPJsAe3MhAQEwdJRRR3aGoBgM3mgx7NszYCxQwQwZuyY0ThKEWhcxJC02zPqChp
         st1s6eSYX/i5EsB8DyRDAgpVp1qKsruVY9i47o1S3LapITpkNOWGDoXR0M23CX5e6x92
         FGjr29uNfUwFYv4P+XOO7CFIUsdYgRrJUSPUzktw9Z7P+/LtWd3tU1DGQFtYzh1DHn1Y
         EUDCvCVMIfsnVLgg5dQmSbrTYZhsFnGrCOg6zD2rOVDWjPVhK9r1UNKUW3HNt2m9IXAk
         4Y26lLI0RpflFKA7GBwkgEOlGO/KEVKO2uOqk5ZfL3AAXB1POnH6z7UPlBpZqi31Nxyh
         PVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750505487; x=1751110287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mc0BBTrgSS6WDu9OlawlNZxH8Nvp8f1/JU0BIBuEiS0=;
        b=BfSAOWI2F1+pRT+M4iTZvKHqJR+DQpjOAiKgPfe+RCsmENUeLHnbjJxOXfnYFsU6zw
         BHmzTkE0V3VCXtSy+zLBqtaFP54XCP2GZWY43oA2vlw4S3AE+I1U0zZebhNetpDIxexn
         XcSuomBe72+if7EmE83C039nOsk1QeYOYxPAGpOB7G4hI6eWqK3mJAqwgDQD3DNO+fHt
         BY4Aqzk6QChChgOUMslhc9ECrX9J4oCiE6zfppj+6EisEe7IUUenIFaH6846ET5PrnMi
         uu/TfEBu+VQWxXMXWODqVPUqqMpPqwj5Z3JMGaZ+kdfQ3Z4GYTvCdgT29SE1aapn6Y70
         w6bg==
X-Forwarded-Encrypted: i=1; AJvYcCUARCTZYKS2PdhMFLrPvg9KwHeDu+CHT0/W9YnLr8t5oCHPJf076Bfm3v3Dg8KJiVwYP3I7h8ZwAQRjKyR1FAYF1cA=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6sqfezJeo9t0F9g8ulNkmf2S1JiUZvHhLrpwfQliOdvZTh85i
	fnJXlgkLogmpwCVuT6iV8xiEqUwmkkWHU6Tf5MoqjXnLO+dMmudE5H64
X-Gm-Gg: ASbGnct79KqeGTr0m4xM7NF+CSZvyZMeUpZiXf672Gj4QoyoPKywX67i/FTCgqWz0ij
	4tu64c+1VYH+K3dmP+W6axASUXzZ15CTUQ8OCfjxSezEFQbsSCKVp2Tyt8oJbiZQxr994ySN/+Z
	hhUfN+071l2iZ/f660b+WLjoVgtSRn9iZwMMyjnvprrwixQTp9RSycl3iF0f9sNj4n4mCcSh4d+
	MjxvRZRaMfKVTeoVbeduIA2y4lLgL1kp0nnYapUGrl8J/pGw5nhbl0I+6jTisk8Muo9IDShQZKM
	1dACprq3czp3WeoNlISDeEEQVs3VH6aYDfirHXLAPKJu/EXasJk/lPJ7j8W7fUoQk0UuLA==
X-Google-Smtp-Source: AGHT+IFBWih1IT+PWr9/vRGh50J7dtBlL8F/5Vxr69l1x9IHTpJrPcXvGGLUrLyj7OOMqI7K1G34kw==
X-Received: by 2002:a17:906:c115:b0:ae0:5fb7:c9d5 with SMTP id a640c23a62f3a-ae05fb7caf3mr447141966b.1.1750505486751;
        Sat, 21 Jun 2025 04:31:26 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083caasm349216566b.87.2025.06.21.04.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 04:31:26 -0700 (PDT)
Message-ID: <1b4ae87e-8f6f-4297-9e22-3d4d4e9d796a@gmail.com>
Date: Sat, 21 Jun 2025 13:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Allow network access during
 do_compile
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250621095506.1484044-1-alperyasinak1@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250621095506.1484044-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 11:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118004

On 6/21/25 11:55, Alper Ak via lists.openembedded.org wrote:
> +do_compile[network] = "1"
> +
>
This was just removed yesterday[1], it hasn't found its way to the
master branch yet. It would be better if the original patch trying to
fix this could be tweaked - if that is possible.

[1]: https://lists.openembedded.org/g/openembedded-devel/message/117947

