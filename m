Return-Path: <jbrunet@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40209C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:11:55 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.10073.1637169113056380840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=NNq7T95k;
 spf=pass (domain: baylibre.com, ip: 209.85.221.45,
 mailfrom: jbrunet@baylibre.com)
Received: by mail-wr1-f45.google.com with SMTP id d27so6052049wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=80jBnIr3swYBj2EeAU8A6mTVNv4RGZBXRn+UfPKg4PQ=;
        b=NNq7T95kB5cqBzBVUOU/q1RkgOCwofhtEErJqt9Vio5i2/NILWNZTwdGYRYM4Tq/F7
         S2boc/Nn+0cy2RpThr3HYkaViHkxMIxQgOnl67BVQs3h6ag4HhKMK/VDo/iXFx1nss6p
         EqddACEbCQhpHemFXfbL/a2EOTQVKLpEmlEgJZStvJ+6YcuH1+uZ2Z/Tk8qX0+D8cRHw
         7XukdO/ySHgSPxpqU9pYXbZbXRoYuo/l15AlJ2TQOzY1tuH5bJs2cKDJfFDLlXIAoFon
         mTKPcAtTzHUHz2Il99P8vsmyuNB5/qVDF6VGz/A5Wl/P6VN3u7HLYnqsTTCYcLJZODTp
         pnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=80jBnIr3swYBj2EeAU8A6mTVNv4RGZBXRn+UfPKg4PQ=;
        b=FP9Gd/okFe6kodtqMFwWEm6X0ux238YFguKrt+hJQmSgGg30b7CirUaLQaINBVDWxC
         bT1pKyV1JHinvFCWAN8CaXtIKLPnrgFaDEKZghDErjIcK38exXUZ4WSLCpFbUEeqzO37
         owKBYCLRYo37eoAa3q/O88PihE8I8/EMEJQY49SgczM706uchjsYOGe9C/1A6P9QiofL
         UTw8BCgxTFu5Qa5NdWlqZhr0oKOdHP6Rd69aFBtfg1jPj5O6UG8bCDhtEBdsSkWQDSlV
         ctVKWyz7YqHmCui8a30XWgLssxVEBXyUei9Sk1qXWWQuWhD/UT1NVmRxdweDXLIftSCw
         mWFQ==
X-Gm-Message-State: AOAM5309AlmMP5mTNK+Y8SkUUjQ6bhOQXFvgbDjVKF+/F8zqrpVWdMnL
	qO3t4V72t2ik29bcDxc0RwR67Q==
X-Google-Smtp-Source: 
 ABdhPJzSukGJ00N46GBEDLQ1/kT3kgOqK/Izk7xz56nHfgwidHVpUd6TtrYq1K0bafYMG84ZS2lF3g==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr21946186wrv.12.1637169111306;
        Wed, 17 Nov 2021 09:11:51 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id
 z5sm7348898wmp.26.2021.11.17.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 09:11:50 -0800 (PST)
References: <20211022151212.268140-1-jbrunet@baylibre.com>
 <YZUsu/w5bRkoZdG4@ltleri2>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH] openjdk-build-helper: fix arm64 build
Date: Wed, 17 Nov 2021 18:10:02 +0100
In-reply-to: <YZUsu/w5bRkoZdG4@ltleri2>
Message-ID: <1jilwqpuzu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 17:11:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94007


On Wed 17 Nov 2021 at 16:24, Richard Leitner - SKIDATA <Richard.Leitner@skidata.com> wrote:

> Hi Jerome,
>
> thanks for the patch! I've just applied it to master-next and if everything
> goes well it will be merged to master after some testing.
> If you want to see it backported to other branches please let me know!

It would be great to have an hardknott branch and have it on it.
Having an hardknott branch would help with override syntax change coming
with honister

>
> lg;rl
>
> On Fri, Oct 22, 2021 at 05:12:12PM +0200, Jerome Brunet via lists.openembedded.org wrote:
>> When trying to build for an arm64 machine, such as qemuarm64, parsing of
>> the recipes fails with the following messages:
>> 
>> WARNING: /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb: Exception during build_dependencies for LLVM_CONFIGURE_ARCH
>> WARNING: /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb: Error during finalise of /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
>> ERROR: ExpansionError during parsing /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
>> Traceback (most recent call last):
>>   File "Var <LLVM_CONFIGURE_ARCH>", line 1, in <module>
>>   File "/meta-java/classes/openjdk-build-helper.bbclass", line 86, in openjdk_build_helper_get_llvm_configure_arch(d=<bb.data_smart.DataSmart object at 0x7f08fed017c0>):
>>          else:
>>     >        if 'shark' in d.getVar('PACKAGECONFIG').split():
>>                  bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN'), arch) );
>> bb.data_smart.ExpansionError: Failure expanding variable LLVM_CONFIGURE_ARCH, expression was ${@openjdk_build_helper_get_llvm_configure_arch(d)} which triggered exception AttributeError: 'NoneType' object has no attribute 'split'
>> 
>> Using 'bb.utils.contains' solves the problem.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  classes/openjdk-build-helper.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
>> index 4e334c26c166..5f838b4f8a17 100644
>> --- a/classes/openjdk-build-helper.bbclass
>> +++ b/classes/openjdk-build-helper.bbclass
>> @@ -83,7 +83,7 @@ def openjdk_build_helper_get_llvm_configure_arch(d):
>>      elif arch == "arm":
>>          arch = "arm"
>>      else:
>> -        if 'shark' in d.getVar('PACKAGECONFIG').split():
>> +        if bb.utils.contains('PACKAGECONFIG', 'shark', True, False, d):
>>              bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN'), arch) );
>>  
>>      return arch
>> -- 
>> 2.33.0
>> 


