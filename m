Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F8ACD98F0
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 21:25:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29679.1781817905269932526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 14:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EZ8WsVgF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso25058405e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781817903; x=1782422703; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9qi2vg0dmIq4n3aA7qBvd4uay9fay5zyKA2IqCE7sxI=;
        b=EZ8WsVgFsG5zt3wRwqeIe1CGFSt83xEY5aYARcLQdP4PliOZBBDI8gbsA0bxUY214p
         +njWyfQo8afSj1iZQ2IKY2eQBDcYEXOkdoV1BFaTIYa21P3WoD2uqH/JXYERWYxntMD1
         zdATtyQcmiHHNgrH406vVGJchERUDhnO40ZGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781817903; x=1782422703;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qi2vg0dmIq4n3aA7qBvd4uay9fay5zyKA2IqCE7sxI=;
        b=cN7HNz5UwuueTV2h83fL6XJNPjp8jsIeq4VuH0mPIPFARJpQbU+hQdC8C3Tdhl0oki
         05eiq2IaxpbOT722gyglhgieZ/SRFs3Pc/f0RL+5IetEXAA3EW8IyeDA4gWu6/1jmboC
         PyiM8WsDnb/SrbMC17LpQkAomVxh4Cyd6cbRKY9i4PeUk88veouOyEdW0Ek37oSme7Xg
         Kn6rHCUaJEf65Hj8VUxCMd48rxQZEboJKWNU0YXqTjXkrezuvmOO1DA1XoTNB2fOsmpv
         qqJ7GtYon0SvOVsG4aK0tbOkf0Kod8kMJLuFbJOHb2R6HglU97dK1tC+Gr8t97m7a3/Q
         gPWg==
X-Gm-Message-State: AOJu0YwXJa6M5iOHPiheaGmm5LvxRQclRsqGAv13Ozstj11O6HdP5kI3
	oZjKGXyOMrI68I/yw0F2WhxW3wWWhIkArJaYQODOfpUTU/jEcSwkvNgDPsxbbZBKgJo=
X-Gm-Gg: AfdE7cmTBhI1gJSepeUXIsPEridn17M4oAfvpWC+qSwt6kLsDQOyZ1trUf+6rrxrL2u
	2thJjRROszop/A36n4NTZK5p08cuxnWdrRPgmfuJYEKGjZ24CMrJd6oDLEpwuSQ3SbOk2t9Cu3L
	h60UH2DG9JtP6552y5VU8AgVkI3q9TVU7uHbPUu0H0kyRFp69UFX2qJhJtw9geI8K9a0b/UZcub
	dH3lfXqdGmVDSMXLH5b+A3Of9I3CYDnsaDG1E0QpaUjeMBDW/DitbFkx54L8YN+vyZE1jzKe854
	DBmL3s0dNVaZ7o9yjYpR5NMKreEjyWMotb2b68NANCoViMoF0ObSS/yXxT4X4RpqSjcetZCt85m
	ytJBz22RBo4UYg20G4DPCVq+kGdGrvnAUcgGUTxE0y86zQVAxIOT+XcpTrmWGSO2grRa9HwIL7f
	6tPPFC7/elyl8DFe1rRv+1EVzl7Jdh/Wujoff4XfzU5sEAYlnfabzuf8s/WJPtpuEshO8HfJaHy
	x/P9A==
X-Received: by 2002:a05:600c:46ce:b0:492:3767:6973 with SMTP id 5b1f17b1804b1-49240a34552mr8631085e9.9.1781817903488;
        Thu, 18 Jun 2026 14:25:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:89a8:c636:4ee4:5fa5? ([2001:8b0:aba:5f3c:89a8:c636:4ee4:5fa5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15535sm18524915e9.3.2026.06.18.14.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:25:02 -0700 (PDT)
Message-ID: <8184bb05c42064c2caad601d3372560a295dc585.camel@linuxfoundation.org>
Subject: Re: [oe] [meta-oe][PATCH] libpcre: move recipe from oe-core
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2026 22:25:02 +0100
In-Reply-To: <CAMKF1sox1_5DZEy5XKrwa=m=2A0Hn+b-3o6JZ-fPrm_YwrrpOg@mail.gmail.com>
References: <20260618113029.1051020-1-peter.marko@siemens.com>
	 <CAMKF1sox1_5DZEy5XKrwa=m=2A0Hn+b-3o6JZ-fPrm_YwrrpOg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 21:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127670

On Thu, 2026-06-18 at 08:31 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> how many recipes in meta-oe need it? how many of them really need it
> and not use libpcre2? I would like to not have it in meta-oe if
> possible.

You could make all of the recipes depending on libpcre become skipped,
then if people use them, they'll fix them. If they don't in some
timeframe, they'd be candidates to be removed.

We somehow need to identify the pieces people use vs the pieces they
don't...

I do feel bad about meta-oe when core does things like this, equally,
getting obsolete stuff out of core is a good first step in addressing
the issue.

Cheers,

Richard

