Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92523C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 16:59:25 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web09.14248.1656521961822826822
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 09:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OjJHwNIp;
 spf=pass (domain: gmail.com, ip: 209.85.166.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id i17so10655037ils.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=JaJ9QkcKHyU2rAMO5oJT6C9KFYVjysS9IaFg9LDYPLw=;
        b=OjJHwNIp39irzPvYSLA4Lp6zjqj8tllfPlifjHsEmb02su1UgrT2Wyaf59tRfrXVYq
         17nPyvYXAUm+o+LZCKCbs5gEBeTW6/v43okmfFR2N3GqijY+K/i1Svma2k7xDXwLIX5m
         7baoUVf/w/a+/lZBoEugObsyJBgHrzgw5l/kOvuHz3tdBn+tQn2DBSTbTAH40Qba7HwH
         16UvoceLvsqexMFwN3evRE8vl33+LijKglMHiNbhR0H98KoIi5JLt62uDReAS5qqpAbX
         IF+1Kcn+925/o9O/XGAE3uz/tdzT5LdKnGp2Sd+a+uLon9XtUX9a3bqMk1XlDTTUNyx+
         mggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JaJ9QkcKHyU2rAMO5oJT6C9KFYVjysS9IaFg9LDYPLw=;
        b=HQNhjPF17CSv3dJaLMqetxGec/FHeyeHe15xPegR4rQvZdt+GhBXnKRBcT/ixmp4yu
         ne/N95mu/P1j4d26XYX4l7PGZqydLT7BTlHJgcsg6yuJXCjtSZZjPKjW2+1EXItRotpB
         oEkaGbdwVG8SMc3TOBz43zymyDNrQBNZxFgsQJSZFpy1TGsE+TQQUFNcO/vS9lqLuIAr
         d/XNWuIWKv1YleGQzNNk1BDSw5iSq5V1lL9cwLaWaMfF6O4QFjuULSjfAnpGNWFTuN7K
         CFPgOiTkCdkIj25EmWsbtj5JEWG1I6ngKEWApuSo0VJqGrsFWqREvUL+TArN/s8wezrN
         gJyQ==
X-Gm-Message-State: AJIora9W0TOVvAb/YljSri+KI0VqF1mRLXjubnEVrHqfrFG8O2eSC0mu
	irZ3/uqCEi1QLEZIxsQtiE8=
X-Google-Smtp-Source: 
 AGRyM1sfE0apOrZw7Klq4dtpr7mYHevXZU5EnNOWZMVmu70mtnlQH/4Qz2NmH6nxVgM1t+S91epdEQ==
X-Received: by 2002:a92:ddd1:0:b0:2d5:4877:65c8 with SMTP id
 d17-20020a92ddd1000000b002d5487765c8mr2517604ilr.267.1656521961174;
        Wed, 29 Jun 2022 09:59:21 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:6119:b422:792f:b68a?
 ([2607:fea8:95df:9730:6119:b422:792f:b68a])
        by smtp.gmail.com with ESMTPSA id
 z6-20020a05660217c600b006692192baf7sm8108608iox.25.2022.06.29.09.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 09:59:20 -0700 (PDT)
Message-ID: <0419e4ab-b1fb-0fb9-ee81-5c63bde5d469@gmail.com>
Date: Wed, 29 Jun 2022 12:59:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] python3-pybluez: fix a runtime issue with python 3.10
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20220614115906.37309-1-brgl@bgdev.pl>
 <CAMRc=MdFa+HK=UbDipA5rZD=0hUd7K6vUXXhdWeNbQo4gY-1Nw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: 
 <CAMRc=MdFa+HK=UbDipA5rZD=0hUd7K6vUXXhdWeNbQo4gY-1Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 16:59:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97620


On 6/22/22 4:59 PM, Bartosz Golaszewski wrote:
> On Tue, Jun 14, 2022 at 1:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> Add an upstream patch that's not part of any release yet that addresses
>> an issue with python 3.10 (related to a missing macro).
>>
>> Link: https://github.com/pybluez/pybluez/issues/426
>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> ---
> Hey, I think this got lost because I forgot the [meta-python] label.
>
> Should I resend or can you pick it up without it?


No need, I took care of it while staging.


> Bart

