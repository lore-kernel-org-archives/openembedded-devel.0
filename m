Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB6FC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 10:03:11 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.9351.1654768984231291813
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 03:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lgKfZq/6;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id y15so20153343ljc.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 03:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=jIWS/sN/DVgUXn0KpdZoaZybY6e+O5OuSVrxknby1bg=;
        b=lgKfZq/6iq4X2n1IITP6cUF7+T5BmODQ10l6SLoyLS5HJ1KWizADl9pd35+kgy6AeM
         +MT3WzJa/pxaQg3PXBMlx53ClTlTj/6He8VaZs5G3QUN6JKC2b2tMDRAbWXjzIpXHxnM
         Q6QFOS1h4wUakr0k3gYSLcYJydrFDciYgMqgqOuRbp+xQAbrTFq2MRm38TEe8GRHUbn3
         I8vGZxnz2qDz8sJP651deWYe9/+DwlAsDGls1BJdsjSHeb3XyxOjC5ZyBnhT4n1eaJCn
         F1MSlr2q6FBSOp9HnygQt4VWfGclOb42yueqpoMctUyhdrRzvDmyMFien3EcZu+KtLII
         5IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jIWS/sN/DVgUXn0KpdZoaZybY6e+O5OuSVrxknby1bg=;
        b=HbWUpIV3gcUL1eTSlPZweUB6uQoXktlYEx4XyWgMt6IAAZzb/k4MJ3MVAwLF9eBb0Z
         jB6vmzTDu9gNQl0022J/DRJSdZhrbzdNPjIVgVUx5nnfdPMRcjXHqOv2vaYmI/zymszC
         4febPtyn7SfMp6xwlyA+44nBbyLvZeXz+yu/buoopUN8i/3biguzAjvVrIuvpis2sDVT
         bMEo8ZVyziOK5ku6r/s7tTkOl5gHnNQu03+7BPpQJlemACzeNnItxFWk9KcuEPL/R9zB
         5N3Io2rN2hElBrHfr5dqlfYPq+qQWm5QAKKAfQUbL104Tlfa36JZOyIW/NpoNLtR8D1x
         3ubw==
X-Gm-Message-State: AOAM5302thqxqp51b4vkOgKVVDu3kiWzOkkWi0K7REmlvuZcrs3+R39v
	YFa5KeaPtLQLIw3VVA+jjdmWV6rdopsHJA==
X-Google-Smtp-Source: 
 ABdhPJxthVsXjxJAJMbzf6g80OhONpkHOapD1s8rqYOUROl4oWsAv04EA4uOiQLBrIVOCP9Am1zarA==
X-Received: by 2002:a2e:9d09:0:b0:253:e189:5a44 with SMTP id
 t9-20020a2e9d09000000b00253e1895a44mr53776597lji.225.1654768982272;
        Thu, 09 Jun 2022 03:03:02 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 t28-20020a05651c205c00b00253b24a90b6sm3659380ljo.17.2022.06.09.03.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 03:03:01 -0700 (PDT)
Message-ID: <bd2ba09c-82f3-dd29-c839-ad6926abe42b@gmail.com>
Date: Thu, 9 Jun 2022 12:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [OE-core] [meta-java] icedtea7-native build fails on kirkstone
 and in master
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Henning Heinold <henning@itconsulting-heinold.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Richard Leitner <richard.leitner@skidata.com>
References: 
 <CAMRc=Md3LRW3OZ-AOkG5g1iNrH_k_gQdP3y03cKahgMN7aXF0A@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <CAMRc=Md3LRW3OZ-AOkG5g1iNrH_k_gQdP3y03cKahgMN7aXF0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 10:03:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97464

On 6/9/22 11:28, Bartosz Golaszewski wrote:
> Hi!
> 
> I'm trying to build java support with the following configuration:
> 
> Build Configuration:
> BB_VERSION           = "2.0.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "4.0.1"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky            = "kirkstone:45d7615dfef8093a2467d52ca1130e62db6a1187"
> meta-oe              = "kirkstone:fcc7d7eae82be4c180f2e8fa3db90a8ab3be07b7"
> meta-java            = "kirkstone:1a8059f6b257ebe6fcae6416e499784d976afd24"
> 
> ---
> 
> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
> PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> 
> ---
> 
> The build fails for icedtea7-native but it's hard to tell why exactly
> from the logs. Here is the full output: https://pastebin.com/3dRt6J0Y
> 
> It seems to be failing here:
> 
> | Checking for mapfile use in:
> /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so
> | Library loads for:
> /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so
> | make[5]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/java/management'
> | make[5]: *** [../../common/Library.gmk:225:
> /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so]
> Error 1
> | make[4]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/java'
> | make[4]: *** [Makefile:63: all] Error 1
> | make[3]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make'
> | make[3]: *** [Makefile:247: all] Error 1
> | make[2]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot'
> | make[2]: *** [make/jdk-rules.gmk:79: jdk-build] Error 2
> | make[1]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot'
> | make[1]: *** [Makefile:244: build_product_image] Error 2
> | make: *** [Makefile:2252: stamps/icedtea-boot.stamp] Error 2
> 
> But not sure why.
> 
> Thanks in advance for any help.

> Bart
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166766): https://lists.openembedded.org/g/openembedded-core/message/166766
> Mute This Topic: https://lists.openembedded.org/mt/91641852/4454410
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jacob.kroon@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

I gave up building icedtea7-native on my Fedora 36 system due to first:

https://sourceware.org/bugzilla/show_bug.cgi?id=28868

That one is fixed now, but then I ran into:

https://mail.openjdk.java.net/pipermail/distro-pkg-dev/2022-May/042638.html

so for now I'm using podman for building in a Fedora 35 container image.

Jacob

