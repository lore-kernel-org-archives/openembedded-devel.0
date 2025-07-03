Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7C3C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 08:43:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.17571.1751532197964516728
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 01:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xpdum6N6;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so8940229a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532196; x=1752136996; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNNzvjDQ3iJk8BXOF1bnuGbsKp2zjeJ85XgtifzE6yI=;
        b=Xpdum6N6Nxp95m7T/tyU35DcoG+QG+oErKsudD3eLgOYRNlTFXOKznSaeC+W6leb51
         0Qkqu9R9PtYYnfpmitUcnhmYXdDWW3SHYxTwrsvH8+CqOjcoagQq7XD31yaKwXNCdfE8
         quCp+9ibS2cgVMoyFIB6WZCST00uNIt6p7dDlVIvmqRM87qOnNiphcCKx7Ewc/LNaSD4
         nhJ5tAAk4EnQTkdx50ge1hTq/G19ifmwWxdQmmTc633wLcIXtscRdmoMQJ21hTV3JIWV
         CTSknIMV79f+OxKAKjqVf+zYrttgpZQb6Y3Wh//TOYl1cKg4KudFQ3AYFOd/wyNIpzhN
         faww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532196; x=1752136996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNNzvjDQ3iJk8BXOF1bnuGbsKp2zjeJ85XgtifzE6yI=;
        b=OdMQ1tEd1XnkWNtwXYfdFWtFpj68OaUHXpxOIOVfK0DuSSiNZmYyl6Y2TvrzP3MiZ6
         RapTnrWnnblVRLKMDtJh9iH9zRYefdD7Tt0Abuqn9Xg7tLP+fb404uPGGneTB+wVHFQq
         k5a04kCtSxhSpnaKEcpAB7rBLjs+9HofvX9WoUA/E/P2W+X1BiIT1HZV0dl8EoL6eV8X
         rIwLvaAA4Un1W4azO0exjFp37psQhSs0weYdD9026QiYTZWAkfGY//va+rm+Ia9xvtu0
         b6yGjkS6BHGthT0bjl/crqY91Q5PH1zELGUGjjvuYCHNlz0E8MyPbKajDemVWCVk8h7K
         NqJA==
X-Gm-Message-State: AOJu0YxGWZLz7f/dymEjx3GYH79dCvlTGIR/QWrbwtxZ36YyO0bDgTZf
	l75+AdGFRBmZ8dWjk1PBJair+7BZ5QBKOOMFlqvXEnAVdIq3EIxVwuaso2abUg==
X-Gm-Gg: ASbGncudRovviwPTyYvV01di7N9ij7IgayLjKSo2hf3i8WitgIgv7TpfKjvqo9Xruut
	nfso3dOi5NvJwLKHWuCzuTPE1V94bpK6zvkk/M+k3uWR+oKpz6nS5C4W43PIyieR/PxTohfATtp
	vyqRq7SKYeXrgvDDLgHc04nV3bXeaJi4gXD+9ti0Jtu9JIcBETmWqG8851ua4RHsl3bRgavUSdb
	s8WdfA9Y8IvaY4y/4B1QXYqzofbSnBEJWEjlNl+bHl1rF6fDI1Rb8hU4e1Jma+nXBqipa379NcN
	8Rcp+1SqTvflePiVRBclDyeyFixq+a7t92sKV+1+2SrWgC7rbDvR6gf5CHH9/jzst1dn8ffM5pG
	H+qNM
X-Google-Smtp-Source: AGHT+IHqFJdUqAICZl00pG+dLvhgKTt+Nnoz40JeUQFtADaIXvoEWyHE7HAO8nqQOnAY8Kt9Gtefsw==
X-Received: by 2002:a05:6402:42c8:b0:607:f31f:26de with SMTP id 4fb4d7f45d1cf-60e52cc6eb2mr5254914a12.1.1751532196048;
        Thu, 03 Jul 2025 01:43:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828de47csm10139731a12.17.2025.07.03.01.43.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:43:15 -0700 (PDT)
Message-ID: <5042bc5b-59ad-4ec8-9e6c-7bb1b55c7c08@gmail.com>
Date: Thu, 3 Jul 2025 10:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] mozjs-128: avoid using build host's rust
 toolchain
To: openembedded-devel@lists.openembedded.org
References: <184EB1345CA463A8.15677@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <184EB1345CA463A8.15677@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 08:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118214

Alternatively, instead of inheriting rust class, cargo class could be
inherited. This would set up the correct environment also, but would
also need to override the do_compile task, with something like

do_compile(){
    oe_runmake
}

Though IMO it is technically slightly more correct, I find the two
variables in the patch easier to grasp. But if someone would prefer this
(or an other solution), I can submit a v2.

