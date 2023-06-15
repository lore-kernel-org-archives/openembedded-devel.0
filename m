Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C89BEB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 03:29:38 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.10470.1686799773544208584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 20:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LmfjbsvP;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-54f75f85a17so2794127a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 20:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686799773; x=1689391773;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbEBno/Fk1LH14K1ocuDRnyLMatoais+WB3XmB1jDTg=;
        b=LmfjbsvP5tx0paCzKcgWXRDUQ09/UoayRGcnvabKGwkjFZ0qgHkm7BBW/exqqujEJV
         XnBCvnJ4j5/7XPiqsT3e+NRD+I93ddv8ybKrvJD88lqSWMBsw42OnS+I7ikWPcKt5CDC
         U+WHfjb49AL5sDTJdHlTbVBU9wX6w/LkPNLJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686799773; x=1689391773;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fbEBno/Fk1LH14K1ocuDRnyLMatoais+WB3XmB1jDTg=;
        b=ePPVHQF1WnI+iseI6iGA8VE0nW9qXmbioieOEvlJe/BDIairSojTWD1aueXpvikv4h
         NK6R/Re7QUldqcWFiaBuEos/UazW7ujgB2bGQ1RM2VAQhmU35BVPpl8lc78sw6sTeBos
         tx/mbb/EhoAvqBOSST45m8srdvcmABI5A2JNBZAG3zOVaknV4ZavBQIOetbvKCZ15Dll
         L22wMIAKjWYK3Jq/CX4fbkRPMkO453uTa+TdQSbuKy5NS4nhvtW1tDVxYfYMl0F0fX78
         INr9eU8XouVCPly1gDrn3LwkfuZ8WvueXN6QVhTXfen/XbwWL80ozqdINkZ2VbMUqYRt
         CVng==
X-Gm-Message-State: AC+VfDwoYr5sFX2E0MdUP5RTdPV0uiBf3V0DK9xGbbTE/Te1mKKepIs0
	e0w+6rGkJMbmt67bwqAjocgBVQ==
X-Google-Smtp-Source: ACHHUZ7u9S3/zkGWkIHyg5l5MqTB9vcf2iOdtW0zythbMcQbz02peiFkao//X5X0V8vWkirKMCTjUw==
X-Received: by 2002:a05:6a20:3cab:b0:114:dd7d:ce0c with SMTP id b43-20020a056a203cab00b00114dd7dce0cmr3633833pzj.48.1686799772820;
        Wed, 14 Jun 2023 20:29:32 -0700 (PDT)
Received: from ?IPV6:2409:4041:2d04:69ef:fb0a:bb62:7354:1c66? ([2409:4041:2d04:69ef:fb0a:bb62:7354:1c66])
        by smtp.gmail.com with ESMTPSA id jc9-20020a17090325c900b001b3c2f4c9casm298902plb.253.2023.06.14.20.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 20:29:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------MrnTlKJxVn0Tkpg7H8SbjM7n"
Message-ID: <ff37285c-4118-db9d-2638-fd64a081d732@mvista.com>
Date: Thu, 15 Jun 2023 08:59:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-qt5][kirkstone][PATCH] qt: CVE-2023-32763 Fix Integer
 overflow
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230614113800.34975-1-hprajapati@mvista.com>
 <CA+chaQeF3wfKui6k6mr7pv-vNi5hG8X-J2ZM2XL+chM9CKejrA@mail.gmail.com>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <CA+chaQeF3wfKui6k6mr7pv-vNi5hG8X-J2ZM2XL+chM9CKejrA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 03:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103290

This is a multi-part message in MIME format.
--------------MrnTlKJxVn0Tkpg7H8SbjM7n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

It is not included in the 5.15.9 release used in mickledore.

I'll try to work on that branch .

On 14/06/23 19:50, Martin Jansa wrote:
> 5.15.9 release used in mickledor
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
--------------MrnTlKJxVn0Tkpg7H8SbjM7n
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>It is not included in the 5.15.9 release used in mickledore.</p>
    <p>I'll try to work on that branch .<br>
    </p>
    <div class="moz-cite-prefix">On 14/06/23 19:50, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQeF3wfKui6k6mr7pv-vNi5hG8X-J2ZM2XL+chM9CKejrA@mail.gmail.com">5.15.9
      release used in mickledor</blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000ff">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
      </font></div>
  </body>
</html>

--------------MrnTlKJxVn0Tkpg7H8SbjM7n--

