Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB76C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 06:56:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.4175.1715237761677117825
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 23:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCe/oHAk;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41b794510cdso4601005e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715237760; x=1715842560; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjiWte/oqjgLQpjdlwI/3pvF2wAOS1/xHXy5EjWvPZI=;
        b=YCe/oHAkEx68VC1MknqJBEJfo+IcQGWD1d4yjuS2F1VWpCnbrIWuaPxK06CVoPdXDn
         56XtMIp3LWY21PYr36Wp2nHxcHWwl/p/wqXc3x618/SXQngrTAK+yiEdnCNfUeF0SA36
         EJQ23YysNXrFgj8ihlu0hY3y88LlAN4wehtzbkVU6wgIQFBOaDs4GRggeORdFDLxObJH
         u5Vdr9bxwRh0YzRQEriOb5/nMVqxYYtEjtAN4KfaJNr715cvRIefxgoUtgQByi5mz/g3
         JfKWIEmI/Mjh9B3lujaRZQTSp9Xc1cDlRiAcs59M7K8mtmsAjABqVT0ALKntsin9IE7z
         i05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715237760; x=1715842560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjiWte/oqjgLQpjdlwI/3pvF2wAOS1/xHXy5EjWvPZI=;
        b=n+LwafJ7DLKxNEzugBkHXycxGbDDQoboCfly5ram/gla0mBoefEvUNXT/ID8vIg0MJ
         P4ucruG1PtaPw+Y0IvT8kL4Fr2PCKOellvN0eVGyvr/21wV53fnLn4NqXG9EVl6yX2rw
         UpYEL8pi5GjyINaneO+iX5YObeuZcu0+h019IyDRDw1/LPg5c5zjeT4l2L77vraNBNND
         sKD/ix1vq5i6AvBFGn8s/UyEyQyfSfhUAXZB6RFP05DE57Q0UAbak/RZkI5A9MSSfrsp
         2kIVGI2R7aDmaUdJx/fkbkJP0id1h2NP6bGz8nDEqKDGRjG6heAFjiC2IekRkOCrhXTR
         lDFA==
X-Gm-Message-State: AOJu0YyqNB/yPav43ps5RNU57zTAohk3XXOvLKITwwrRxtazS1jcZQ4K
	k7hNqeYIVOLpUcoxg7EsL7N2w0gl9Sbksk7SVwc43RFD9DyzE5iP
X-Google-Smtp-Source: AGHT+IEBQ80PmMfEBxPrCOR9OYytnY0XjJGn6Ivk03kyz50kt5KkfsoK1YRLWCz3ZtiG9khnqNE3iQ==
X-Received: by 2002:a05:600c:1d95:b0:41c:3e1:9db9 with SMTP id 5b1f17b1804b1-41f719d62c8mr33087315e9.27.1715237759722;
        Wed, 08 May 2024 23:55:59 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee9326sm13686535e9.35.2024.05.08.23.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 23:55:59 -0700 (PDT)
Message-ID: <7606b07a-2501-4a4c-9c46-731d45fe081c@gmail.com>
Date: Thu, 9 May 2024 08:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uw-imap: Add a patch to support newer than
 TLSv1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240509060755.3072961-1-zboszor@gmail.com>
 <CAMKF1soh_kJQe=_cVp3uDK0shNq49WBbbsXrf_FS8TUvcW54sQ@mail.gmail.com>
 <17CDBE76878542B7.5110@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <17CDBE76878542B7.5110@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 06:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110285

2024. 05. 09. 8:34 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2024. 05. 09. 8:12 keltezéssel, Khem Raj írta:
>> On Wed, May 8, 2024 at 11:08 PM Zoltan Boszormenyi via
>> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
>> wrote:
>>> The patch 0001-Support-OpenSSL-1.1.patch enabled building
>>> uw-imap against OpenSSL 1.1.0 or later.
>>>
>>> However, TLSv1_client_method() and TLSv1_server_method()
>>> restricts uw-imap to TLSv1.0.
>>>
>>> These APIs, along with explicitly versioned APIs like
>>> TLSv1_1_*_method() and TLSv1_2_*_method() are deprecated
>>> in OpenSSL 1.1.0 or later. The replacements are unversioned
>>> API functions: TLS_client_method() and TLS_server_method()
>>> which support TLS version autonegotiation.
>>>
>>> This allows the PHP IMAP extension to work with IMAP servers
>>> that enforce TLSv1.2 or higher.
>>>
>>> Fixes: https://bugs.php.net/bug.php?id=76928
>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> ---
>>>   .../uw-imap/uw-imap/uw-imap-newer-tls.patch   | 29 +++++++++++++++++++
>>>   .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  1 +
>>>   2 files changed, 30 insertions(+)
>>>   create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
>>>
>>> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch 
>>> b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
>>> new file mode 100644
>>> index 000000000..958abc90f
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
>>> @@ -0,0 +1,29 @@
>>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> +Upstream-Status: Pending
>>> +
>> I think it will be good to submit this patch upstream to uw as well,
>
> Is upstream maintained?
>
> The complaints at https://bugs.php.net/bug.php?id=76928 indicate that it's not and the 
> situation of forks is a mess. For one, the seemingly most uptodate fork at 
> https://repo.or.cz/alpine.git contains changes that break building the PHP IMAP extension.

Not sure how "upstream" https://github.com/uw-imap/imap is
(https://en.wikipedia.org/wiki/UW_IMAP mentions it)
but the patch is now submitted there.

Thanks.

>>
>>> +--- imap-2007f/src/osdep/unix/ssl_unix.c.old   2024-05-08 09:41:06.183450584 +0200
>>> ++++ imap-2007f/src/osdep/unix/ssl_unix.c       2024-05-08 09:43:38.512931933 +0200
>>> +@@ -220,7 +220,11 @@
>>> +   if (ssl_last_error) fs_give ((void **) &ssl_last_error);
>>> +   ssl_last_host = host;
>>> +   if (!(stream->context = SSL_CTX_new ((flags & NET_TLSCLIENT) ?
>>> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000
>>> ++                                     TLS_client_method () :
>>> ++#else
>>> +                                      TLSv1_client_method () :
>>> ++#endif
>>> +                                      SSLv23_client_method ())))
>>> +     return "SSL context failed";
>>> +   SSL_CTX_set_options (stream->context,0);
>>> +@@ -703,7 +707,11 @@
>>> +   }
>>> +                               /* create context */
>>> +   if (!(stream->context = SSL_CTX_new (start_tls ?
>>> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000
>>> ++                                     TLS_server_method () :
>>> ++#else
>>> +                                      TLSv1_server_method () :
>>> ++#endif
>>> +                                      SSLv23_server_method ())))
>>> +     syslog (LOG_ALERT,"Unable to create SSL context, host=%.80s",
>>> +           tcp_clienthost ());
>>> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb 
>>> b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>>> index dcb59f4ea..17faa3aa6 100644
>>> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>>> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>>> @@ -15,6 +15,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
>>>              file://0001-Do-not-build-mtest.patch \
>>> file://0002-tmail-Include-ctype.h-for-isdigit.patch \
>>> file://0001-Fix-Wincompatible-function-pointer-types.patch \
>>> +           file://uw-imap-newer-tls.patch \
>>>              "
>>>
>>>   SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
>>> -- 
>>> 2.45.0
>>>
>>>
>>>
>>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110284): https://lists.openembedded.org/g/openembedded-devel/message/110284
> Mute This Topic: https://lists.openembedded.org/mt/105996685/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


