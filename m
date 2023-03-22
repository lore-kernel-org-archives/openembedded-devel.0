Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491FFC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 08:18:52 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.37466.1679473126803844847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 01:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VjcdhH4P;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id w9so69472193edc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 01:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679473125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JpHJKGsi9N7dQiTGZYXfPvy2BN/iRMh7QeRdHCfNbY=;
        b=VjcdhH4P+JHWaque48KHtI0m8W64Y7jii7sNQXiiF6lEo6Moyp5MnLsSPyWFS5IV/v
         NI0eCJ2Tf2KKzPBhDouu1S0TcsTZe4A2ZA0Fb21UGokrhBWti0mIqNlkw+d8LyTgjSuT
         VSJkjGz0DbO88FWaW46TCQL/teuTTbQzxZkxcThpPa8IqgHOMWUmBla4OocvcTZgouKq
         p1M7S6InZf5YNVKxy2qDZC1yS5mT63KwKuUijSAYjfeyZtYILP43WsEh7YHqHK5+wsTn
         PUBTQFcukC2MncYPf0ODbXkDD3yxuliVudFeQPPIO+AgnqVylJXQea6Nw5JxkYBd9GEL
         CkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679473125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JpHJKGsi9N7dQiTGZYXfPvy2BN/iRMh7QeRdHCfNbY=;
        b=wpGDt7HWwUKGxHUGnAjJ4prNrUFJIVB6cOfpIggJH9L7A81/7LCe6ZvRFtwPnMRYsO
         /DPNvHVl5ovVJ7AkYfKPyUT+O5s0cZ9wCqGzYvoTxd82P2apGK4lgMg5/dyKt8W7dt92
         +1kyCO7b/sLDiO3JZQ3tNpziEQGVIpi9FLymX2cjhu29HyBlCdSUOnIi1F/wEJ557TYP
         G/ZX0iqWXHE2AnbSp8q4U6U0kQ8neWt3w4fFIZvx49LmcqWRwtfycxuE8HCgCVnZ0Oo9
         AF6xSO8Xnn8IyRLOxXa0vpdWwrZ+pylV8YyE/SwUG4prGumm01F3513ht9F2WJMPGwYf
         jpmg==
X-Gm-Message-State: AO0yUKWHRL/1EU+wOEt+YRQkP6lSoczUlVnoZ+fxzkwm1HqjQMzVfZ4J
	N285kDCQsIfDzeukJXn1LEw=
X-Google-Smtp-Source: AK7set8VxFLaYXWbtympbIYocJjVqkifQWQRm2mXLf6Gv240ZEJcDi6kwx981aCJ8JZ0HwjKbNpJGg==
X-Received: by 2002:a17:906:b847:b0:933:4a3e:c625 with SMTP id ga7-20020a170906b84700b009334a3ec625mr5616824ejb.40.1679473125024;
        Wed, 22 Mar 2023 01:18:45 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906310c00b00926d614b890sm6737904ejx.204.2023.03.22.01.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:18:44 -0700 (PDT)
Message-ID: <aa1e32fb-dce8-826b-92a2-37f74c484989@gmail.com>
Date: Wed, 22 Mar 2023 09:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [meta-python][PATCH v2 1/4] python_mesonpy.bbclass: New
 class
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230317072547.1031123-1-zboszor@gmail.com>
 <6646B534-8948-4706-9E8A-DAEA4111B694@arm.com>
 <14fa0c81-90ec-18c0-9bbf-a1769cfb743f@gmail.com>
 <39A18BD0-B6AD-4EF0-806B-578EDB2D3DC4@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <39A18BD0-B6AD-4EF0-806B-578EDB2D3DC4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 08:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101630

2023. 03. 20. 17:26 keltezéssel, Ross Burton írta:
> On 20 Mar 2023, at 15:01, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2023. 03. 20. 15:46 keltezéssel, Ross Burton írta:
>>> On 17 Mar 2023, at 07:25, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>>>> +inherit setuptools3-base python3targetconfig python_pep517 meson-common
>>> I still don’t see why you need to split the meson class up.
>> See the other thread. For some reason, meson always wins
>> regardless of the inheritance order, so do_configure has
>> meson_do_configure instead of pep517_do_configure, etc.
> Add a new do_configure to your class which simply calls the right one.

It still doesn't work. meson_do_qa_configure fails with this:

ERROR: python3-meson-python-native-0.13.0.pre0-r0 do_configure: Error executing a python 
function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
      0001:
  *** 0002:meson_do_qa_configure(d)
      0003:
File: 
'/data2/dtd-yocto-4.2/conf/../layers/openembedded-core/meta/classes-recipe/meson.bbclass', 
lineno: 163, function: meson_do_qa_configure
      0159:
      0160:python meson_do_qa_configure() {
      0161:    import re
      0162:    warn_re = re.compile(r"^WARNING: Cross property (.+) is using default value 
(.+)$", re.MULTILINE)
  *** 0163:    with open(d.expand("${B}/meson-logs/meson-log.txt")) as logfile:
      0164:        log = logfile.read()
      0165:    for (prop, value) in warn_re.findall(log):
      0166:        bb.warn("Meson cross property %s used without explicit assignment, 
defaulting to %s" % (prop, value))
      0167:}
Exception: FileNotFoundError: [Errno 2] No such file or directory: 
'/data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/python3-meson-python-native/0.13.0.pre0-r0/build/meson-logs/meson-log.txt'

ERROR: Logfile of failure stored in: 
/data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/python3-meson-python-native/0.13.0.pre0-r0/temp/log.do_configure.3235105
ERROR: Task 
(virtual:native:/data2/dtd-yocto-4.2/conf/../layers/meta-sicom/recipes-support/python3/python3-meson-python_0.13.0.pre0.bb:do_configure) 
failed with exit code '1'

Naturally, as running meson's configure stage went from
do_configure to do_compile indirectly via "nativepython3 -m build ..."

Sorry, there seems to be no way around it but splitting out the
environment setup from meson.bbclass into meson-common class.
If you don't like the "-common" naming, I can rename it to
meson-env.bbclass or something like that.

I will still rework python3-meson-python to not require
the dummy patchelf python module and review other
comments and make necessary changes.

Thanks.


