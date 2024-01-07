Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6F7C47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 18:21:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.20835.1704651681723057916
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 10:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBskmIns;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5f0c0ca5ef1so9329007b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 10:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704651681; x=1705256481; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ5CmRShi9GdGMMtyI79NBuq6/iVFK+32A3jzU43Bwg=;
        b=XBskmInsxXMRFxLTmH/WmdTVhBbbFmlW82xz1I3MlIuXNh91Qc27FQZb07Vjq9db0F
         9SWbOBNo0+ReVw2FHP7eAOBacNXF+9wMCuPzxdEycBT3y2BcSksM/dNlq4cBoFGDz1gv
         6Q4DTox/qZQ6No3m8YVo7wL/6BMcYxYeRO8jyOYfWLPL3m0l9vnUdN1J2hXhpZsnlCOU
         5wYXY6Th5OmJRs/7Ixy9dipehKJOpakMhSV5Ir+EZD69LTQyp+e7es8tpE5E2Knksfa9
         uc1It52VSLQAdEsvvjADE1ZIlkXst6kVgIwuSkB1JLRoJ6Z226e6PlOpMsmjrYePr8h1
         8Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704651681; x=1705256481;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ5CmRShi9GdGMMtyI79NBuq6/iVFK+32A3jzU43Bwg=;
        b=wzUtY0tkKZXzzhrHdT2czOKdOpqd2ZVs1OSZtIJRuPyDS63rmgKFndlqu8rMAiW7er
         60sHypUbd76Z5Sv9f730Zn+gF04fY7N2+HmufUzmG/3rB4LKnX8+UWRlnR9gXyN5Rku/
         ZSwld5eNWL7yU7DQYWt712pQrWyBHoK1U55E5OkOY+BQ7yw3JDoGWkDLJDi/4RXHvt1k
         hPHKf8lfvdkt7n/oOxsS02e0418mXxQhvkErWTO+JljcqBsqDH3vrgUvoNQo/gkAjrpv
         DI11LqvD56axAE4arZ9iIM4yYynBRcTkYA4UTG1gI7sJ1HyEtRdxWb+CNYq098vTBcFs
         vnrA==
X-Gm-Message-State: AOJu0YyO5fnGqSBS8iA1QZ/58C/X9Juki4bha6XeQ631crYzuf8sCoUX
	nQdd8I/qfXfdryuO3oWo2Bs=
X-Google-Smtp-Source: AGHT+IEtAmp5OL2Q9jIxNB+1So7+OmXgOSv91Qtjt0lF+tsovzR9L4bIpyBwG1zZxMl9r2KYI3XDJQ==
X-Received: by 2002:a0d:cc05:0:b0:5d7:1940:dd8d with SMTP id o5-20020a0dcc05000000b005d71940dd8dmr1382074ywd.99.1704651680833;
        Sun, 07 Jan 2024 10:21:20 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10::29? ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id a9-20020a81bb49000000b005d6f34893dfsm2460211ywl.135.2024.01.07.10.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 10:21:20 -0800 (PST)
Message-ID: <2ff316e5-1456-4b3f-967b-d4e7f63c9096@gmail.com>
Date: Sun, 7 Jan 2024 13:21:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request: Jan 7th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108075

The following changes since commit f29290563cb821fae95340ba959749641c69ed7f:

   python3-django: move to version 4.2.7 (2023-12-04 09:47:03 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 8e1f0fa6bfac0e96fedc666fe9066f92c85afb27:

   nginx: fix CVE-2023-44487 (2024-01-07 13:15:11 -0500)

----------------------------------------------------------------
Alexandre Belloni (1):
       poco: fix branch

Meenali Gupta (1):
       nginx: fix CVE-2023-44487


