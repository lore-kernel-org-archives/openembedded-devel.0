Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47037CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 15:34:21 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.1475.1757432058079967347
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 09 Sep 2025 08:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WInRgboR;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-624fdf51b44so3542004a12.1
        for <Openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 08:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757432056; x=1758036856; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4CuMDwAhbH45Jg3u7cx/P8xLCtj9VBRZ03AAtMKCE0=;
        b=WInRgboRkVhACRev4AJeU/pqPorQ9ZRj87eqr7y+VF4KhT9wHVoqt561xnbCMe1GUK
         DfbiFkfMgPGtn+dDCaLUSLvgoIVOIKmvMcl4amaE0IP9GzLBenEMRhvRdUn5SK6LDPso
         nyZmwMkCJ0wi0ATdcqo+8KC2QaPdEKYXLVhAhn5wAs8MMefd0zEOPAzluQaMEtdSTWoy
         NJjRxToZfCbE0jmMdSpwPPSX5N+WFUbgnwzQPtMp3bqYxdcvhyTTUT/zJU7F6hSJyT5C
         ZRI7aAHzZkeToriX1KpGosOaQ1l1sntLAKa16p4LuUB9kA9c4hZkvziZ7ZKiDfDIeFg7
         wJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757432056; x=1758036856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4CuMDwAhbH45Jg3u7cx/P8xLCtj9VBRZ03AAtMKCE0=;
        b=liBZeE7pj2CcHRsK+QLStCB4GVTDXpZTIaE9iw2e+fTSfgeST1LMulCOPu9JP0Iepj
         ZqyhTkmJkaXmt0c0YDG8JkPLM6NZiQCx7JZML8NNg7iAiGsaNMMuGttdtCwr46H3vR6v
         ybWQnDwRu4w0cZXWRrhWjjCpnZcL4lL7jBsiUWTKv3N8DupZAFfE/S7YSLlkUnS40t41
         S/W2FSfnBGKRRIf9eBP7PcQlcHG9JgqIrtnlq3v/DtzKgvj4vQmhXmPHaIKMICO8844R
         4YgI7XpVkiiZee6qcfdf7+U4xxJe+2QOtu8emaKOvgrCQEKbUSeRGGCAEdwmTV+80akX
         asAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8rahL+TQDy0zbYTC99umTRMcLoEiBBHe3KEAf9B1KeF/S8+4/ZPZhJp8IVySIAwcyZKeXvltDvR28MMploRJxhCs=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy8tSMvOQZWJevisFqhsqzlsBU5TdUtMZTikx//q0Gdbur4X29r
	GGWTq5tCYvXfxkaLO9F076EcR1cbFQgL6BsFvL26ZBxKXhrKzhl3VHSO
X-Gm-Gg: ASbGnctHZcW+woDEf5JuI0CXFrcWdVFfgIxHwrKep9L6JluEVAcWJTM+14lOxwfp1PC
	gsZ+TGijeVeHLFGzO1E589FuyXeDv1GDkwcbuHfA4nWK7MuDZIDP31xjsUfa4nGCwMs0Hew/N/5
	MQZmYudZYrkymyqlBq6mPx39ctM8ijJZD17Wm1w+KwHNiYIKv5IQg9LdSQej8jsagkm88Hb1qKi
	LYIswp3REb9/8A8Os3JR8HsYuqBxFBEiU16EHPsGEdyKOueAFHylNf6ZHlH19xo2ppyb1XsBT+2
	kwBulrLBu55QMeFGzwWUrIDXkYPENdeUEbNLZSBn8A8U6/sLxb4HhpHOG0BmvRvdmbDbXXVnMQE
	DEQg5IGfrH3TASurqsJRCozetCkUa3TslSLsWIa7BLw==
X-Google-Smtp-Source: AGHT+IG/OlwtGXExmUcDuEdP2wqHWHAG6DVkMIErVJ6aIvMvnyG9lHUmR+hW1Vu9V1S6p9K/Tk/5MQ==
X-Received: by 2002:a17:907:3f21:b0:afc:cc64:86da with SMTP id a640c23a62f3a-b04b14f5015mr1179546866b.26.1757432056246;
        Tue, 09 Sep 2025 08:34:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334a852sm6945666b.71.2025.09.09.08.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 08:34:15 -0700 (PDT)
Message-ID: <ccec1b2e-b095-4385-96b2-03489a6325a4@gmail.com>
Date: Tue, 9 Sep 2025 17:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Stable branch maintainership
To: raj.khem@gmail.com,
 openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 15:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119344

I would be also interested in trying myself as a stable maintainer,
unless someone has any strong opinion against it (in which case you
should speak up).


On 9/8/25 23:47, Khem Raj via lists.openembedded.org wrote:
> Dear Community members,
>
> Armin has been doing awesome work in maintaining stable release for
> meta-openembedded layers for many releases, however his situation has
> changed such that he is not able to continue the meta-oe stable
> maintenance.
>
> We have three branches in maintenance, kirstone, scarthgap and
> walnascar at the moment and
> a backlog has been piling up. Several members have raised concerns on
> mailing lists on pending
> updates for the stable branches
>
> I would love to have someone step up to help with the stable
> maintainers role. Which would
> be looking for stable branch patches on mailing lists and reviewing
> them and creating a staging
> branch ( like contrib/stable/kirkstone-nut etc ), testing and
> preparing final pull.
>
> Armin used his own machines to run the CI, we now do have a machine
> available for OE CI
> which we should be able to use for the CI loops for these branches if needed.
>
> Looking forward to hearing from you
>
> Thank you
> -Khem
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119335): https://lists.openembedded.org/g/openembedded-devel/message/119335
> Mute This Topic: https://lists.openembedded.org/mt/115139938/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


