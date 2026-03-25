Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F0B109E528
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 23:30:14 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36287.1774481412711604602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 16:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZznGd/4I;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d556c1a79eso340889a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 16:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774481412; x=1775086212; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNa8AoD97K9tNhqFUboO4xLqUNoudOS42IK6NVj+nGk=;
        b=ZznGd/4IaMPxDOcgFGx3q3I2dbD+GgakIGzNYAsm7S7n+uy3/V6xEEKGSMkgcASOIt
         12rMUKlNHQNCZ8bXxhKy7PDALdjosJeSkILtRoIirtLmCPPywmlAHdtT7q5GufP9rF1T
         VAfu/5iqjAFh+4lmxHOH/KZJLRzsgjmGSEKpytjmZb86J9vrjqITqg8AK+Im/JAcGTMP
         qCJ/8ngJLZ3okP1RRrZPm32F4K9bD3b/JMgp5+xs91Mxc5HMRU0XtczyYEY2ZcoYK6Ea
         imCYCdqs1f+DkZBYus3QinkmaZoMibfMpvr/QqAyTXP+7HMw3cMsv2PuA00Morcjxk/F
         aBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774481412; x=1775086212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNa8AoD97K9tNhqFUboO4xLqUNoudOS42IK6NVj+nGk=;
        b=TAu8BKC5H0P6rfJZZwVyRH3mnHWh74EVPeRdYcQjjpAdIpfEH/6A/BW0bcYwSShpC2
         HDymIv2tEr+6Q85zhmmaKTP44xFcZaicjtyD0Zzi2VXJYwsamvKFLlMOm+iP+QEbTC81
         egxzwwPWzQPXwFy8VUtddzXuW5I9qV0WARrzin+ZyHjyu/2ANYEvcHX5WvZxZr+w9VME
         PeQlob5b3J25unDxvJrUBnbBEo0awP82AAA6KnYgDzo8lUVB81kEPJv3msTc2uQqVA6R
         IevCODWhsKkA6MHVBjMx2FwMqkDTBnH/PcXw3miMJxGBfcHC165Z7JMN/L6rGJ3pJoRH
         AiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK9PJKqKWdeTYuoSml07y2maIRTKhM+oQS1PU07AWkOGCYc97lv7ZUDp93IIGwrLmmSnMRUockPrSE+CWsOIJiJss=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yws4YskbI3uG6paaq4IxVVQudIr8b4n0ku5aE3YBUgD8kRZYQE6
	nFjQ8xg9ypEle6adhkFyukMKXhvlLpfLqo5nvBdQp3kA7sDa+8ExPvOa
X-Gm-Gg: ATEYQzxWPxpSP8yXd9N7KRa1u3F1Y297ARrzTGcQVnYONG7c+qzghtvZVDMmdqmOryh
	t1a6VocT94Q+5oTjASfN4zj3tjcIg0YpctYHX/HePbH9gW3P4dABKB842NyCjL4pqfDw4KWcfUo
	QTJ6Rt4/37ptFqK7dTJ6Jtkynz3WY2jNtms4sZ4qN4DniEJ1duMG2zr1Nq68YRJxBhmU60zjBs/
	NZfm1L0S9dAITAk7B11ePjDJYqkiNYXHQpxW95Uqo7EgX8/0hqeDxZ2vlozjVeheS2VhfpDdGu1
	07vh+KT4PpoGVAK2zo6tzi8njIihfCR5rXtobunNXB3yuLtScl6cHlMttVVI3hVptRMCSMXhu9/
	VS183Y1zk7hkAFQVHP3PZ5E2LgDJhutH2pIVgdbnnnsjAXC9j2dQBa4re2ukHp4NhMoXfmP6iqL
	fFEOOVF5jJN45/lGDZGqQmAwL8wyrrJs19U9WrwdMfVe5D2q+DQvLqdBifa6OdLR+d5HwzCIbF0
	9X0
X-Received: by 2002:a05:6830:7009:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7d9d661ee7fmr3397999a34.5.1774481411948;
        Wed, 25 Mar 2026 16:30:11 -0700 (PDT)
Received: from [172.26.252.3] (97-118-253-141.hlrn.qwest.net. [97.118.253.141])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e6fde0d1sm1149622a34.7.2026.03.25.16.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 16:30:11 -0700 (PDT)
Message-ID: <082ff4bf-e4f7-4f51-a403-a862d4551b83@gmail.com>
Date: Wed, 25 Mar 2026 17:30:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] coreutils over uutils-coreutils when selinux in
 DISTRO_FEATURES
To: Vincent Davis Jr <vince@underview.tech>,
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <13199.1728590787704780404@lists.openembedded.org>
 <22763.1730654002300290010@lists.openembedded.org>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <22763.1730654002300290010@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 23:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125629

Vincent-
I changed my workaround to BBMASK
"meta-openembedded/meta-oe/recipes-core/uutils-coreutils/".

Raj/all-

This is an issue at parse time:
uutils-coreutils has a conditional dependency ("selinux") on
"clang-native" [1], which is provided by meta-clang [2] 

This issue could likely be resolved via BBFILES_DYNAMIC[3].

[1] https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb?h=scarthgap&id=cc425a989b68fc9b52ab37d5178d13d21ee92f39#n32
[2] https://github.com/kraj/meta-clang/blob/b9ef02282197380ef05edbd0eb852e1934ceb59b/recipes-devtools/clang/clang_git.bb#L306
[3] https://docs.yoctoproject.org/scarthgap/ref-manual/variables.html#term-BBFILES_DYNAMIC

Clayton Casciato

