Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB10C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:21:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.8583.1741699276704386301
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 06:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaNWzQxH;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac25313ea37so802065466b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741699275; x=1742304075; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=waySN//z/gCM6ohpO69CHlEWabOHGvSpnU3Ng6VXxwQ=;
        b=ZaNWzQxHUJ5D4S2+u0nc1ewAyugKy837d0AzPgSUOxBHKdxHmSOoI93yewLMLOTWiA
         nA+fRt55UEVhZP5H3UGFnQWUcARY++q1I8KGtfsHEsajzULDfO7EFAIBoch2JN9fH0TO
         NIhGrpgdjTkXhZWhSk22Oj844anhUfJYzERQ4dcBFrd+RBP9z/k6Sw7J9uvcxJ8rarWc
         s1Oy86owZRCmCESS/8P+E5igLxQb3d2UQiL/DJuQQi83PJXvqLuR1irTPxY1+sXOOfdJ
         DoQ7RQj5ANaM25YXRn3ePWCfPpMQTO5a/kiWK6kmckL5Xp/unLGX2ykJRQbuYTI1wNqy
         oU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699275; x=1742304075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waySN//z/gCM6ohpO69CHlEWabOHGvSpnU3Ng6VXxwQ=;
        b=AdFTxtEe8RcWyb54eVMf6nD2cGpUn3gSPRJ8tG2l0PLhlNpUMgL4+VEwjFwAwURefn
         oLUeRObzCAOyDEBQHhtBgJWRhP6QFIVJTWDHHBDchQ2KJUiEEksDDmFZVKaW5ZV3nwXk
         HY9C3al5BsnZZrlqQplh2WruhbDBmzLtTcU5FAV2GvsbnGjx9fQYehM3WTvQVmlhBrSD
         wqg52e8qr2C4Y21UQQRJk9EA3ZGqX2EZYOIUSC7bitDBNrUendIGd43kPAgmbb93azDF
         D03JbhPBeFvCSs9PLrO4RPR9E02SYCCn6WGpZa39us6l7LqHj5uurAwp7qCkvEZsR9CK
         JZfA==
X-Forwarded-Encrypted: i=1; AJvYcCWwtU09cLRkhWYkfFzzT1RO4IdceadMiiFv38w1zF+w4gaC9v7yIAyrrBBLNV1AZ1bozvDRCaHYf6Wx+xmEBSIMPPA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyX7CUqeVc086Dy9V4wvwXqQ8j48WM9v8kv/oslwGETjkdBXZj6
	xgQ0brD0DHLcV5dltxegXPm9EtaijIhw/l+SzIXIsY0JRCUb0oMBQW5L5A==
X-Gm-Gg: ASbGncskIR9IyJOhN4jES4Z0hFiEVG1Ux5x4Gczv75HS/prxfouHdLmfq5MuOqRCPNh
	mUOs4Az93kxP0ZA3uJtlKLKvgfiwbpdQOoPORDZei/3d7pK3R5XnFYmwbkpsRlZa0Zt7/oGI4+K
	vNnuDMKWnrf5XxxpUumm/JyDRk73CTF6xOOHqSqxJoNi+KL6iv8YDBzOmo2UAFbCxMNASM8CYHI
	J5EZdILDiJWLDBonLB9Id+5hrCg11nXbrvHDTnbeSQqlCdO/dzzPWKlBNF6ukxbhM7bEEM0kbEZ
	U3uNFn6FuiB6c0Io+zy+jK5OQYR3QsO4GuG2AtmJV3lcpng72hiN
X-Google-Smtp-Source: AGHT+IEWhSjKDtLt/0r26XOqq1SDUBieGVHWesLAn5tUPLkl0RsZwKu6COs1ow8GJyDksXUDZY9rkw==
X-Received: by 2002:a17:907:72d5:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac252ef65e0mr1718875966b.55.1741699274685;
        Tue, 11 Mar 2025 06:21:14 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988bd34sm932535666b.140.2025.03.11.06.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 06:21:14 -0700 (PDT)
Message-ID: <8f52a73f-71a9-4a57-8abf-82ce93aa4b35@gmail.com>
Date: Tue, 11 Mar 2025 14:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libgpiod: fix gpiod-cxx-test
 failed test case
To: libo.chen.cn@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20250311022445.2203047-1-libo.chen.cn@eng.windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250311022445.2203047-1-libo.chen.cn@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 13:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115890

On 11.03.25 03:24, libo.chen.cn via lists.openembedded.org wrote:
>  ...ts-set-direction-when-reconfiguring-.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
Did you forget to add the patch to SRC_URI, or am I missing something?

