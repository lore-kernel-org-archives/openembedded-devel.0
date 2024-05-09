Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8168DC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 06:34:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3954.1715236449030441252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 23:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VkX5k2yx;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41b79451153so3995195e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 23:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715236447; x=1715841247; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARoauE+rsN5v9jS/Slj39HFJOVKA6bjio+Q+TTbLjGI=;
        b=VkX5k2yxoZZHccYTD+avrHDnsCP83cFHcjWGqQE1Ty/CAg6ChfC2g6BIskb4JKeObT
         aZLSKAMGxfpvle5lffR8eDJPKnCR9eXYK4NsPL+6M2C1DQUtNqx+o2PEdVFqKUu/hxYY
         oTqzYZBKbJySOx40/WhulUg1zr72gSC9FFzR7bDxUeUk+qVEux69ZBz3bC0VWdkLxRk8
         sLV/OamKtUbOupVlNQmgQaV9QW2cuYoF4LR5kThvFfKPu7FPf2TIfurOaVQGydL4jmRA
         +bZmZ/ZUcVB++Yk028bGqvuVaocOkZuO1hNFdMS8Z6hCJGNlIgvITl+Sr0m3DaXevX0Q
         aIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715236447; x=1715841247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARoauE+rsN5v9jS/Slj39HFJOVKA6bjio+Q+TTbLjGI=;
        b=nB8VG6raNTnGqVTqfHRQU8QmTxoT4Dd04Ffqb/Zp9+9iIFByy9/3dLXt0Eyf8hkWbJ
         hjNMW84xot797jFQpjeoBgnOdbZmr+bSilntalR5z9hGOzmUlMlXpVc2FjYsd7sDXPWY
         T/mcqnq8u4E8itf6cpUai/gjc4x519TE9NVb4yifj828WTLOMTZmFOrIawiW61rPwBpq
         0Q+cLdqWGIWMQml8U6UMXY291NomhHyJOc9X/nMCAN1Ym3dfQkXsDSMdldEIm45nuLff
         jdGMzx6Uv7U08NAQff6buahzDMB+k7vrpQuB20aCEUJ5ptsXRrKl/vxCYGCKYrAGCNN9
         5Siw==
X-Gm-Message-State: AOJu0YyFOTTbPiys9t8vViowXbjMwG8aWIls+fVhyE5fruInNppsf3Ed
	8hhRXqHU4X8Btmeivvc/EmQjJX6iSWzDMq/o/k8IWHIaPG1l0Iil
X-Google-Smtp-Source: AGHT+IFQv0bLNC1V+QoOfv9Sq+uG7NzIqJe6QGATctmQ66pQ2W0CzP7tZJyMsZxzvjd8pr9PosttfA==
X-Received: by 2002:adf:f148:0:b0:343:8d1b:b12d with SMTP id ffacd0b85a97d-34fca718396mr3464407f8f.46.1715236446917;
        Wed, 08 May 2024 23:34:06 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbf08sm789481f8f.96.2024.05.08.23.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 23:34:06 -0700 (PDT)
Message-ID: <ec88ae58-e93e-4277-8e5f-78b2b00a39e7@gmail.com>
Date: Thu, 9 May 2024 08:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uw-imap: Add a patch to support newer than
 TLSv1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240509060755.3072961-1-zboszor@gmail.com>
 <CAMKF1soh_kJQe=_cVp3uDK0shNq49WBbbsXrf_FS8TUvcW54sQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1soh_kJQe=_cVp3uDK0shNq49WBbbsXrf_FS8TUvcW54sQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 06:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110284

2024. 05. 09. 8:12 keltezéssel, Khem Raj írta:
> On Wed, May 8, 2024 at 11:08 PM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>> The patch 0001-Support-OpenSSL-1.1.patch enabled building
>> uw-imap against OpenSSL 1.1.0 or later.
>>
>> However, TLSv1_client_method() and TLSv1_server_method()
>> restricts uw-imap to TLSv1.0.
>>
>> These APIs, along with explicitly versioned APIs like
>> TLSv1_1_*_method() and TLSv1_2_*_method() are deprecated
>> in OpenSSL 1.1.0 or later. The replacements are unversioned
>> API functions: TLS_client_method() and TLS_server_method()
>> which support TLS version autonegotiation.
>>
>> This allows the PHP IMAP extension to work with IMAP servers
>> that enforce TLSv1.2 or higher.
>>
>> Fixes: https://bugs.php.net/bug.php?id=76928
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   .../uw-imap/uw-imap/uw-imap-newer-tls.patch   | 29 +++++++++++++++++++
>>   .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  1 +
>>   2 files changed, 30 insertions(+)
>>   create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
>>
>> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
>> new file mode 100644
>> index 000000000..958abc90f
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
>> @@ -0,0 +1,29 @@
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +Upstream-Status: Pending
>> +
> I think it will be good to submit this patch upstream to uw as well,

Is upstream maintained?

The complaints at https://bugs.php.net/bug.php?id=76928 indicate that it's not and the 
situation of forks is a mess. For one, the seemingly most uptodate fork at 
https://repo.or.cz/alpine.git contains changes that break building the PHP IMAP extension.
>
>> +--- imap-2007f/src/osdep/unix/ssl_unix.c.old   2024-05-08 09:41:06.183450584 +0200
>> ++++ imap-2007f/src/osdep/unix/ssl_unix.c       2024-05-08 09:43:38.512931933 +0200
>> +@@ -220,7 +220,11 @@
>> +   if (ssl_last_error) fs_give ((void **) &ssl_last_error);
>> +   ssl_last_host = host;
>> +   if (!(stream->context = SSL_CTX_new ((flags & NET_TLSCLIENT) ?
>> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000
>> ++                                     TLS_client_method () :
>> ++#else
>> +                                      TLSv1_client_method () :
>> ++#endif
>> +                                      SSLv23_client_method ())))
>> +     return "SSL context failed";
>> +   SSL_CTX_set_options (stream->context,0);
>> +@@ -703,7 +707,11 @@
>> +   }
>> +                               /* create context */
>> +   if (!(stream->context = SSL_CTX_new (start_tls ?
>> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000
>> ++                                     TLS_server_method () :
>> ++#else
>> +                                      TLSv1_server_method () :
>> ++#endif
>> +                                      SSLv23_server_method ())))
>> +     syslog (LOG_ALERT,"Unable to create SSL context, host=%.80s",
>> +           tcp_clienthost ());
>> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>> index dcb59f4ea..17faa3aa6 100644
>> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>> @@ -15,6 +15,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
>>              file://0001-Do-not-build-mtest.patch \
>>              file://0002-tmail-Include-ctype.h-for-isdigit.patch \
>>              file://0001-Fix-Wincompatible-function-pointer-types.patch \
>> +           file://uw-imap-newer-tls.patch \
>>              "
>>
>>   SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
>> --
>> 2.45.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110281): https://lists.openembedded.org/g/openembedded-devel/message/110281
>> Mute This Topic: https://lists.openembedded.org/mt/105996685/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


