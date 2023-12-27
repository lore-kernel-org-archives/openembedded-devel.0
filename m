Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C5BC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.98073.1703665316622800735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGNCkTfe;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6dc00dbb560so453990a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665316; x=1704270116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZVLV7stQ1bjypI62VLGUXbBpeJ3A9MhbsjycipUCxY=;
        b=KGNCkTfeUi3UIcZMoD8oo6BwEXikJpt3urVuffqvZ19cH49DOLLThSZX75C4pTi11z
         qFS7COqzn8ILgCkL/F8FFM8wS4r9u5j5lbjhQshIoUCKSWNaz4kBfCdtUPayDLOxyelK
         7iTMcHoHe5g3vudLPoPzcKYL1bA013PlE/FNBwMT6l0mVAfj+258M4ipLYWqFUIvsh/r
         vJ8G29qsQPvMWHy4nAgNiflhJA+1PJxb40pl/iO68vaGSysp4MC5jIDM07KkK+DslHmu
         Z8l0mv7IwOHS0jCFs/b/jXEmo+KTc1Y6yy3e2ljQy9vEdDV6vyWLMn97jYYS2hkKGgqW
         gAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665316; x=1704270116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZVLV7stQ1bjypI62VLGUXbBpeJ3A9MhbsjycipUCxY=;
        b=ALMj3jXHigj4BJkupHb06YdOGP7YwJrqbwt3iFgIqX7LU3V8qQwbLY4vxcPvZR1STM
         uzFHtQ/dU7LPGOX043zd46TF+8oKoDKNmJQf6gN/acGo6HutIKxhKeib7SqJzSxqzgm4
         uTl0rTBMjk8WeJdGVa02UB6ZH4jBe6PluosntZqH2n3inZ+jKc67Diqdf/EXo43SLEtm
         aiGKN0b8JzptklM0x/mbl3MCZLsqFIAI/en9rw3BM/8YkOZbsE1n9aQ8gPl/jH2MoXqH
         Z3i8rKEEgdiHTSha6EsiCLuwRSQecw3Fj/9QgDDHszDJm/sF6q/gcRQ+K/VxthBnt5Q+
         v+nA==
X-Gm-Message-State: AOJu0YyYnKHxLd1M3lMiuwMJt4v2DPXDmYLsHu4n/LZgpAkpLuunVSQT
	89A/CJit8rEq/eY3bD0xSmY=
X-Google-Smtp-Source: AGHT+IHPSnHk5f5k1D4hK3a2d9lnhtRe5RSZuwfNsXx/kRaJn0lGW5tU+sgs/1ZQKzal2akORUo4rA==
X-Received: by 2002:a05:6358:926:b0:174:fb0e:6aa4 with SMTP id r38-20020a056358092600b00174fb0e6aa4mr2863434rwi.11.1703665315807;
        Wed, 27 Dec 2023 00:21:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231222051608.8896-1-alperyasinak1@gmail.com>
References: <20231222051608.8896-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] dool: upgrade 1.1.0 -> 1.3.1
Message-Id: <170366531511.1947762.14636898210648242616.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107864


On Fri, 22 Dec 2023 08:16:08 +0300, alperak wrote:
> * Patches removed because fixed in the new version
> * License-Update: GPL-2.0 -> GPL-3.0
> 
> Changelog:
> 
> * Fix help of vmstat (as it includes sys instead of swap)
> * Fix multiple SWAP's breaks output
> * Better support for NVME drives
> * Support for Python v3.12
> * Shorter and more concise device names
> * add support for terminals with only 16 colors
> * Correctly report disk stats for NVME drives
> * Capture VM name for top-cpu
> * Properly capitalize unit letters for real this time
> * Add a \n to output when using a count
> * Fix the NTP plugin for Python 3.x
> * Massive internal naming change dstat -> dool
> * Fix bits/bytes in CSV file output
> * Add a --devel logging option to assist in future developementg
> * Update Github templates to simplify them and reflect the Dool name
> * Lots of comments in the code as I slowly learn more about how it works
> * --output now correctly writes to files cleanly
>     Introduced --display to allow outputting to both screen and file
> * Fix building docs with make docs
> * Update the .spec file to allow building RPMs for Dool on modern systems
> * Fix potential crashes from "OverflowError: cannot convert float infinity to integer"
> * Updated Lustre plugin for modern versions
> * Cleaned up output of sub frames in table output
> * Add a plug-in for Linux bonding devices
> * Add signal handling to better close down things when dool quits
> * Added an option for --diskset to group drives together
> 
> [...]

Applied, thanks!

[1/1] dool: upgrade 1.1.0 -> 1.3.1
      commit: 4929a3c44755dcc856c0b83f53a4cbd7359f670d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


