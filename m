Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606FBC05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:09:43 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.29605.1675271377108080428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wv826DWs;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-169b190e1fdso3304028fac.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 09:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=As3Kc4JSYR0oiodO7sEBpPunTtB5HLAodz2kfQSDyUw=;
        b=Wv826DWsK/x+e5DJyyaq8IkPImnpay28rGZN7Ph/2KZEwn+7UqVeysgG2otAA4P6T8
         RPIUpxFtuBRT99cmoFnPNYQqeH4vxS8i3hc206zqm2N2JSoavm63JjXGTXnTI/H5XiOd
         u6oJXhMK1U8TixnkKjjow2NdO8Or/Bd/x+BoUb3xDol/UvSx2zFLM29vKFw1Kd2nsUyz
         CM+OoDv6hRs0Sin0+bKmzYu31QEEqskLfKOhKyhq5O+6SFiQnhn2xlEhec18O3lNZ4Ob
         dE9qD8EeakJ1KWeA4iXYTAG5rDuTOGrb9BOvMVUY6qlQo6LMo60ESCBRAwjLb14G6ye7
         WXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=As3Kc4JSYR0oiodO7sEBpPunTtB5HLAodz2kfQSDyUw=;
        b=gLg5gTkRMmpglOEA1pglGU6jj91kwhGwXfMCPKVOdyheTBa0bvsPwVh5Qik1wzPyYI
         74SSYEh9KbF+SqV7jzJdpB6f8JTQf9Zccky/sB02CZxmJ0TzIJDsSTuXUJZXmF/7eUxh
         H9RLHJzrx3qaybPj6TziKa4wsL7mNBCJOyxpERvik/ibQcveMO6KzB47I+oQDPe0QaXr
         vEz8txyuZNMYwhyu7Lil0u9XhaTwqRddTtOw1rxTIIBB5r46VogKjoZe32fnPvYu6RMQ
         MzXmD0nSr32CI0vCLfoGIhMa9lekLzXmkShfW4Mme7gb1QON/5tETaXjR4hrJcu8YkDx
         YIZg==
X-Gm-Message-State: AO0yUKXSjoex2q4qbeEs7gQd70Im0/d59bmSrE8/k4xMVo858isg4Y1/
	jKTFivDqlGL558JB3fKUgV9zg8q/sy/J4COI7u8=
X-Google-Smtp-Source: AK7set/ZgPcFr++Q7P3ZaRxjVc4Vid99UK8crW4e26Ka2M8R3SSOshVrzVLDaWASdoux6uGjsoyIXYKLxnQvXh1JAJQ=
X-Received: by 2002:a05:6870:ac27:b0:163:b85e:f1ca with SMTP id
 kw39-20020a056870ac2700b00163b85ef1camr272666oab.262.1675271376144; Wed, 01
 Feb 2023 09:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20230130050909.133727-1-raj.khem@gmail.com> <20230130050909.133727-12-raj.khem@gmail.com>
 <CA+chaQc2R=VC7=K-59jH6h4oXNY2czyOm=j435QRS1_c-R6vyQ@mail.gmail.com>
In-Reply-To: <CA+chaQc2R=VC7=K-59jH6h4oXNY2czyOm=j435QRS1_c-R6vyQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2023 09:09:10 -0800
Message-ID: <CAMKF1sofKa3abNX2ZMRovBOz44cHY7PzJj0R9x7ez4a33ohstg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 12/12] nodejs: Fix build with gcc13
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 17:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100907

On Wed, Feb 1, 2023 at 3:14 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Mon, Jan 30, 2023 at 6:09 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../nodejs/nodejs/gcc13.patch                 | 28 +++++++++++++++++++
>>  .../recipes-devtools/nodejs/nodejs_18.12.1.bb |  1 +
>>  2 files changed, 29 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
>> new file mode 100644
>> index 0000000000..7268c5e64f
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
>> @@ -0,0 +1,28 @@
>> +Add missing <cstdint>
>> +
>> +gcc 13 moved some includes around and as a result <cstdint> is no longer transitively included [1]. Explicitly include it for uint{32,64}_t.
>> +
>> +[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> You can add:
> Upstream-Status: Backport [https://github.com/nodejs/node/commit/0be1c5728173ea9ac42843058e26b6268568acf0]
>

Thanks for reviewing and providing this info. I have taken the
original patch and replaced mine.

>>
>> +
>> +--- a/deps/v8/src/base/logging.h
>> ++++ b/deps/v8/src/base/logging.h
>> +@@ -5,6 +5,7 @@
>> + #ifndef V8_BASE_LOGGING_H_
>> + #define V8_BASE_LOGGING_H_
>> +
>> ++#include <cstdint>
>> + #include <cstring>
>> + #include <sstream>
>> + #include <string>
>> +--- a/deps/v8/src/inspector/v8-string-conversions.h
>> ++++ b/deps/v8/src/inspector/v8-string-conversions.h
>> +@@ -5,6 +5,7 @@
>> + #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
>> + #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
>> +
>> ++#include <cstdint>
>> + #include <string>
>> +
>> + // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}. You may
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> index e96913e563..e96412fecc 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> @@ -25,6 +25,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>>             file://system-c-ares.patch \
>>             file://0001-liftoff-Correct-function-signatures.patch \
>>             file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
>> +           file://gcc13.patch \
>>             "
>>
>>  SRC_URI:append:class-target = " \
>> --
>> 2.39.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#100856): https://lists.openembedded.org/g/openembedded-devel/message/100856
>> Mute This Topic: https://lists.openembedded.org/mt/96622215/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Martin.Jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

