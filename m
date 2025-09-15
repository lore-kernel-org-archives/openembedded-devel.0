Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19F8CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 16:59:44 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.104.1757955579250240808
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 09:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PkWTN7id;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so1165573a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757955577; x=1758560377; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFapG9vmI1KJTTWe26e8i0v2QRvQz5HjOjwE0LRjqQI=;
        b=PkWTN7idj4SSyBXAhyVpiN56NS2h5j3VaTYTHHYLWKV63fVTI/0XjVNaBjFgR7OZET
         tWeeeK4gaX8ZgdW5OWeSB/2qPRTMe1LsNH5J+nEwlhkuotX8Z4bEdh8DIzgI1wf2GuNh
         NwSozjKgls6ElPXyCMimALbDlTBpTZN87twNjOiWjJedLFQDV/SkueUaTssBS2EIScMK
         ZcjNdF9zgUVGeB223VA9defOrjtc5t23Tj0TPBdWvdy9xm9jbYoJOmmyNEZGH81hwoSh
         /4zJRJ2o7USyWxjf3jYzvavfq+QfSq2FgQY4AbC2mQkC0VHHlayDbm9Lm4/Dk7RgD5ov
         43iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955577; x=1758560377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFapG9vmI1KJTTWe26e8i0v2QRvQz5HjOjwE0LRjqQI=;
        b=vkeidZhuglahDr7MY9wdz8kgAaI2wnbuzXLymxfx4+H33nJ7xZXIDYsiC3LP0oAn/a
         Wm05+923XG7uG4veD8aR0GrWOxa9rLVKSE+rrgHa4/7YaYZ+bQuBERVV3+Wor89qo/k9
         L4XKO4ApwLhjdiu29/ngf3HIWWN/YRSyFQEWuEpZk/JMS6d6ZpDcxNP8Ba85TjTAKUyd
         rfamWgaWGtf6+uEvjtZFd/g+IOr1JIQhnholSowtd5u8RCepkm0Qd4UqHJmE4NDeB2WT
         +Z2VlPn8WDp7MhIvsFpehJEX7Kr3SGy+dutQsOGcxC7JLLQVah1dWqM5Q2S2GT1xAh5L
         y5wg==
X-Gm-Message-State: AOJu0YzFHbYraVGlZYylzL2Ec2I1NJn2bC00oLJkLyM4xaSBZtyLUwcY
	QwEG4Eumkqn0Szk8GZJgpqk0PmvdEYdWvjg9hSNd62w0a7LQs+shxin4
X-Gm-Gg: ASbGncuA8EtUvGd1imOh4822jG7+ooUuBtOc1vOYGwzbSUQJ6KPIntScaZgV03RvVjZ
	hqx7dohxSEJnhuhOEOUzIsILhMGHO1zkkw/vNQKIhus4D2G58muuJZ9UZtSuiWQIdCQ0oNqf6O5
	qpO7Lv79S/PmbB5q17sKIt5YHSZkTzTL/u2JPlJgGgfv+MSkZd7jNUSlR8tISDCpSa9uNr/3Xyc
	xTtkdyEM8Ejhu4ErRSh0AkeAMxzJ4Y5Sq1nf4Vc2vf8JMjL/xu79+pOn+IVh7CXhDwrxQPY3nFY
	xX8xdq7EOi+JdSl8aC1XYeHrKXcBJrDhNaDmAKrqZVLkCNt7pCO75/ychHA4hByOxgXsHvFrZkF
	7rvDslaVUVG0r3RQq8KCFeqKqBIfzSN1LML6JF+K10Q==
X-Google-Smtp-Source: AGHT+IFG//5tHj0napyDnUh5NU415JHg3JC35p1FcdIPw/1Vi9KgdwUzkPDei+ZMKF6ch0af0x94QA==
X-Received: by 2002:a05:6402:52c7:b0:628:6fc1:a3f with SMTP id 4fb4d7f45d1cf-62ed8271abdmr11918023a12.17.1757955577225;
        Mon, 15 Sep 2025 09:59:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f5c248742sm306655a12.8.2025.09.15.09.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 09:59:36 -0700 (PDT)
Message-ID: <100fc9bd-06ed-4d79-89ba-36544568bb45@gmail.com>
Date: Mon, 15 Sep 2025 18:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: upgrade 0.4.0 -> 0.5.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250913172226.3215251-1-skandigraun@gmail.com>
 <CAMKF1srStOszN6yzPCZ+gPs4eabtq2XMuS+js1eVDngyBK3QNA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1srStOszN6yzPCZ+gPs4eabtq2XMuS+js1eVDngyBK3QNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119411

On 9/15/25 18:03, Khem Raj wrote:
> It ends up with build failures where its trying to fetch a sub module
> during configure, we either need to do it during fetch or disable use
> of it.
>
> https://errors.yoctoproject.org/Errors/Details/882653/

Right, I was testing it along with meta-rpi, which has a bbappend which
suppresses this... will check and fix it. Thanks for testing.

>
> On Sat, Sep 13, 2025 at 10:22 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> Dropped 0001-media_device-Add-bool-return-type-to-unlock.patch, because
>> the issue has been solved by upstream.
>>
>> Dropped 0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch,
>> because it is included in this release.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  ...evice-Add-bool-return-type-to-unlock.patch | 59 -------------------
>>  ...ssing-stdint.h-include-to-dma_buf_al.patch | 38 ------------
>>  ...{libcamera_0.4.0.bb => libcamera_0.5.2.bb} |  6 +-
>>  3 files changed, 2 insertions(+), 101 deletions(-)
>>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
>>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
>>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.4.0.bb => libcamera_0.5.2.bb} (90%)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
>> deleted file mode 100644
>> index 12f034effd..0000000000
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
>> +++ /dev/null
>> @@ -1,59 +0,0 @@
>> -From 6914c4fd3d53c0c6ea304123bf57429bb64ec16f Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 31 Jan 2024 21:01:27 -0800
>> -Subject: [PATCH 1/2] media_device: Add bool return type to unlock()
>> -
>> -unlock uses lockf which is marked with __attribute__
>> -((warn_unused_result)) and compilers warn about it and some treat
>> --Wunused-result as error with -Werror turned on, It would be good to
>> -check if lockf failed or succeeded, however, that piece is not changed
>> -with this, this fixes build with clang++ 18
>> -
>> -    ../git/src/libcamera/media_device.cpp:167:2: error: ignoring return value of function declared with 'warn_unused_result' attribute [-Werror,-Wunused-result]
>> -      167 |         lockf(fd_.get(), F_ULOCK, 0);
>> -          |         ^~~~~ ~~~~~~~~~~~~~~~~~~~~~
>> -    1 error generated.
>> -
>> -Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040380.html]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - include/libcamera/internal/media_device.h | 2 +-
>> - src/libcamera/media_device.cpp            | 6 +++---
>> - 2 files changed, 4 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/include/libcamera/internal/media_device.h b/include/libcamera/internal/media_device.h
>> -index eb8cfde4..b09dfd16 100644
>> ---- a/include/libcamera/internal/media_device.h
>> -+++ b/include/libcamera/internal/media_device.h
>> -@@ -33,7 +33,7 @@ public:
>> -       bool busy() const { return acquired_; }
>> -
>> -       bool lock();
>> --      void unlock();
>> -+      bool unlock();
>> -
>> -       int populate();
>> -       bool isValid() const { return valid_; }
>> -diff --git a/src/libcamera/media_device.cpp b/src/libcamera/media_device.cpp
>> -index 2949816b..eaa2fdb0 100644
>> ---- a/src/libcamera/media_device.cpp
>> -+++ b/src/libcamera/media_device.cpp
>> -@@ -159,12 +159,12 @@ bool MediaDevice::lock()
>> -  *
>> -  * \sa lock()
>> -  */
>> --void MediaDevice::unlock()
>> -+bool MediaDevice::unlock()
>> - {
>> -       if (!fd_.isValid())
>> --              return;
>> -+              return false;
>> -
>> --      lockf(fd_.get(), F_ULOCK, 0);
>> -+      return lockf(fd_.get(), F_ULOCK, 0) == 0;
>> - }
>> -
>> - /**
>> ---
>> -2.43.0
>> -
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
>> deleted file mode 100644
>> index 18ba353de2..0000000000
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From 91de550243121056984e5b9b693b486860655d31 Mon Sep 17 00:00:00 2001
>> -From: Sergei Trofimovich <slyich@gmail.com>
>> -Date: Sat, 28 Dec 2024 19:11:19 +0000
>> -Subject: [PATCH] libcamera: Add missing <stdint.h> include to
>> - dma_buf_allocator.h
>> -
>> -Without the change the build fails on upcoming `gcc-15` as:
>> -
>> -    In file included from ../src/libcamera/dma_buf_allocator.cpp:9:
>> -    ../include/libcamera/internal/dma_buf_allocator.h:66:19: error: 'uint64_t' has not been declared
>> -       66 |         void sync(uint64_t step);
>> -          |                   ^~~~~~~~
>> -
>> -Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
>> -Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> -Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> -Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> -
>> -Upstream-Status: Backport [https://git.libcamera.org/libcamera/libcamera.git/commit/?id=91de550243121056984e5b9b693b486860655d31]
>> ----
>> - include/libcamera/internal/dma_buf_allocator.h | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/include/libcamera/internal/dma_buf_allocator.h b/include/libcamera/internal/dma_buf_allocator.h
>> -index d26f8a74..13600915 100644
>> ---- a/include/libcamera/internal/dma_buf_allocator.h
>> -+++ b/include/libcamera/internal/dma_buf_allocator.h
>> -@@ -8,6 +8,7 @@
>> - #pragma once
>> -
>> - #include <memory>
>> -+#include <stdint.h>
>> - #include <string>
>> - #include <vector>
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
>> similarity index 90%
>> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
>> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
>> index c7fe631a43..d1b4af2d90 100644
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
>> @@ -9,12 +9,10 @@ LIC_FILES_CHKSUM = "\
>>  "
>>
>>  SRC_URI = " \
>> -        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
>> -        file://0001-media_device-Add-bool-return-type-to-unlock.patch \
>> -        file://0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch \
>> +        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
>>  "
>>
>> -SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
>> +SRCREV = "096c50ca881f72d858aca19757a5e73b4775a7cc"
>>
>>  PE = "1"
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119388): https://lists.openembedded.org/g/openembedded-devel/message/119388
>> Mute This Topic: https://lists.openembedded.org/mt/115226223/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


