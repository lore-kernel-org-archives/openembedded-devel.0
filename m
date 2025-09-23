Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E77CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:46:34 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.18728.1758638792335657290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JFZD8iXl;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fce8b75a3so7213838a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638791; x=1759243591; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1mmFWoK9Ff4LKMfLfcj7rH2nhBd+HEGZ/btUzZadWZI=;
        b=JFZD8iXlWMh/gNeLru7uI1jkYsxx+ym7mrTAMOG4ojfEg7wgK+swXcrKL8q6MpxSWo
         hMZd3fZyGv13sQYdHgBEme4AWm3yC4rG6CDUb6k0VwBAxw1MQfXPkIrU5D2TNOPnv2/v
         w4JVAAobjxpVNBOx4Jftdr+CmC2w1Ug+lg8E8SwmoklViD1g3X7pcdgboercm9A/SjKJ
         wiu91RocFWyCFed1KVsrtsd9geisZ6tbAylPHsGlN6a+rRigwTQYfsoeL5wjKepC5OLz
         luWj2mz+ir32OX8r8b6YTg2eMNZb9tQ3vUTumGV52r16rj/1n48fJ+Hk3BqGXY7+9twk
         AuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638791; x=1759243591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mmFWoK9Ff4LKMfLfcj7rH2nhBd+HEGZ/btUzZadWZI=;
        b=JDnkv9AJD/hV/TuQ1MgM2xuKDGlImTmp0RokriKbRze+1jGnZC5DCIVBOKpnOnd5sY
         DZzjuw8mJsNTggu1+q5FOIqwEEI9Quv+SM4Lm/1rrv2SieD+PYaaRoCKP6vQXa73W5iy
         t/RfhRuW1d9yogTTd6MVpDxKW5FY0X7y06RaozRIIZiGaG9mtNoB5ZfznETwmmacd1lp
         XMWmfcMljMJKKGYbDGg9S2z9ewYzT8FqQM8yHmRpAsw95oYig5rmjYXarFB9ZydhaKYe
         5DgcSzwodvCI74xspdM6DojgFu+Y+5RudLkFzVx5gGm95qpZ6Gh3PhMT9r9+D/6DFEkI
         qq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2oUjMJ4B0Mu6AHRQeK0mNeFom4+QqKiWrCOkmUgM8D5s07iNlEcxUHYMO0cZ4zjBcLRz0r+MJS9V7lrqqmEMzKpI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6gix6jH0bv4wtY7+qLakcpbBrIbyqP7VHwq1MvQP5/BLwsU28
	51t8d+4sI0jQSfReom7qNvQJqrNTWHh01SXJPrkQM2t4LRcKPXZr4lsc
X-Gm-Gg: ASbGnctt8V8Ru0y5dqieJoKl4tus+4ERp9GA3EL7H/fCQCKEAbpcDNYzbpHcJFgooLm
	c0f57oGFgJRkwbF+y6GL6q1erl8Hc6slUhfRGqib8aarN3/lqm4E3r3dsdFe8IBdwaZcRgRCbN4
	tIxAG8H/z/mfceO9Fg/xh4ckV2Ace8YOtAk4Ob0sTPBEoAIKQWEHnHcvVMHFPZI5+cnBD7RI+5F
	0LiVwuRjdRNz7Vg3xKpF5vD4/1Jf257m8iw6VRoMXEoKKsBij8LGNBa3gptFua7E4C8qHFuyb0R
	IAugEy50SsUkN2XCadYsjmaSNUurrDfX6EpOD5RAXNmnge5Uf1dkaVzciMs85UZZ7kDSy/Ktbyd
	FtKWYgTByqLj3DFYy4NOiY7OF+YtkZ/4=
X-Google-Smtp-Source: AGHT+IEkHrRYLhGM8xTSzcn6jVEbL5RxJ260V5urQ/zB51697q09TNmzl4psUqmSHCTSj/eymOs7Fw==
X-Received: by 2002:a05:6402:4389:b0:634:5fb4:10e6 with SMTP id 4fb4d7f45d1cf-634677e963amr2526147a12.23.1758638790619;
        Tue, 23 Sep 2025 07:46:30 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63375cd1603sm4547941a12.18.2025.09.23.07.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 07:46:30 -0700 (PDT)
Message-ID: <6def8d74-347f-400c-94da-1360b625013e@gmail.com>
Date: Tue, 23 Sep 2025 16:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][PATCH 00/24] Scarthgap pull request
To: anuj.mittal@intel.com, openembedded-devel@lists.openembedded.org
References: <cover.1758626365.git.anuj.mittal@intel.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 14:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119715

On 9/23/25 13:57, Anuj Mittal via lists.openembedded.org wrote:
> Please consider merging these changes for scarthgap. Tested with
> autobuilder and locally with qemux86-64 and qemuarm64:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/944
>

Is this the correct link? This build has failed.

