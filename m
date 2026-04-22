Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A22DFA1FE2
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 18:28:44 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89561.1776882517678738244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 11:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fa89ms77;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so75642305e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776882516; x=1777487316; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbVUYyuoJTRadt7BRLxJp1F3r6xSVADdYXX17A4HCuI=;
        b=fa89ms77HXdKlAuFnzU6cm+ggW5Qw+LugZV6C1nelx4+kfPyOeaKTHrZ9N6/N/Hg1S
         dG+06bGBFAtGWrhIN6/8ETwShjESZzJsi8li1gvBc3eWRv6wIRViHHl8NvcAHKWpvh0f
         gapPxuZE+IO9unCDUZQ/xd0J5b/8frJpIudIN1KwqEEnYhTgO6uUxv2tofx+rxVriT1O
         xUDDaimZlY8JB15YrVdqakQUCFNpcTvU7PL09NFYF4CQo7wJMeuSRHYjcjsUYJ4mB/7o
         g8cAbS/SSVdBOfXIdUviqI99TJnamAl0ophDK1+PzPp1n/9w8TpymwekrdVQyDZ4hLjC
         UhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882516; x=1777487316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbVUYyuoJTRadt7BRLxJp1F3r6xSVADdYXX17A4HCuI=;
        b=k+gDR3RV9EkMG/LoG28OSA8Zt9SxBecYgi16AvVrnMtoJuZFQyy/NYoWTjRgJjZPza
         2xqNw6PU39X/zCGBeW+CNc/gJ87KPTd3ytMhNWyTMYgbeGc///km6TsmMMxenDGSgrmi
         0sCERiYsvK2DE6d4Fjmr2s8xtVxIaqy6FAqxOhibG3fdybO1RwfIcBYixYuMJ482UAun
         gf+3dUxJp8XnjfPvjYnQMxjDezZBod/bMATCCbSxH5If8RMunxVri/HL8n/Ik9L5iYe1
         86dAEgD97Fk46TpJnp3oGw4MGe3uKPe5wzeXyhk85B8JlxnlEcIaaMltYXwZhiPhPfW9
         tq3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/UObuZAkEbCrilRLhFHQ5cu404Fxz/Ls+KAMWlJnCBpIM/JJA3QQvUH4kHLSjXIvP4HYMtIqcL0aQcHLC44mSgX5Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0YySB3ex23FRqhHROOxQgvxgapYawwCD3dXxkOBlZVFotYLavDSX
	GZgDMpUCrg4PEdejDkg6vwGR/EilwwFR+BTuIpULjzE/90YlcW3YYeiM
X-Gm-Gg: AeBDieu9/IT7O/4R6Y9GMwy4BjO+2o/3WPAgkkWWjbinjFFCyh0Uu0V4wgC4ZAJTgHG
	/sWqnwyH6CoN/YkSVSSNZ4XOOFDJPxOkNxxibg3nLLHF03yAzmXhEYotnXOj+SMKdMe89zEEPvP
	wZNSgPngfVtqpW+RdRoxiDD/4CtLziGYnaPQCkQmDRaYcfLCbfJzqqmvzY3nlEeFmkSsmISVEau
	oLSYENfbIhSToTB7xcQtUW0QJAydGBFCH7Y5kssBAwB8BMwafd0tKtTdMxj9o/57W6BSQQjYgZ9
	zfQ+gbf8K6ZSbtEzI+JIbbqojZA2Q5D6mN9GdilVk3VRQXRpomWur/6Bp0zcpiN57uoGUbrywLz
	+IKXurkLJDgt2yhCg3Cqbhi3c6bF8/Nf0NOPqg5jjziyBFY0g4lq+iRNvPGXPy5sktDsrj0E+KE
	JjTbYgmOVrdld6RSjdMs8FYy8UGW+QIFmcpNGAlygFOA==
X-Received: by 2002:a05:600c:a108:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488fb78a0famr293099245e9.26.1776882515756;
        Wed, 22 Apr 2026 11:28:35 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2716sm146108555e9.30.2026.04.22.11.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:28:35 -0700 (PDT)
Message-ID: <e866a139-f30c-49c5-ad1f-d384c3ead7e4@gmail.com>
Date: Wed, 22 Apr 2026 20:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to version 2.02+git
To: mail@michael-fitzmayer.de, openembedded-devel@lists.openembedded.org
References: <20260422104646.7769-1-mail@michael-fitzmayer.de>
 <18A8C01E5DF8C3EC.1516946@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <18A8C01E5DF8C3EC.1516946@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126555

On 4/22/26 20:08, Gyorgy Sarvari via lists.openembedded.org wrote:
> I think you forgot to include the deleted old recipe in this patch.
> 

Sorry for the spam, one more thing that I just noticed now: it is not
recommended to include "v" at the start of PV, because the next time
when it is updated, and this value is removed, then it will look like
that the version is going backwards - which might cause problems with
updating the package on a running system for example.

It is really enough just to set `PV .= "+git"` in the recipe, verbatim.
Yocto will take care of the rest - there are many examples, like
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/ne10/ne10_1.2.1.bb#n13

> 
> On 4/22/26 12:46, Michael Fitzmayer via lists.openembedded.org wrote:
>> - Introduced a new API function: print_result()
>> - Added support for configuring a dynamic number of filters when
>>   executing replay.lua
>> - Added script to interact with the STM32 CAN bootloader (stm32.lua)
>> - Add Unified Diagnostic Services (ISO 14229-1) script written in Lua
>>   (uds.lua)
>> - Various updates and fixes required by the Debian package and to be able
>>   to get certified by Microsoft
>> - Added manpages
>>
>> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
>> ---
>>  .../canopenterm/canopenterm_2.02.bb           | 31 +++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
>>
>> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb b/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
>> new file mode 100644
>> index 0000000000..b544fc4a9f
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
>> @@ -0,0 +1,31 @@
>> +
>> +SUMMARY = "CANopenTerm is a versatile software tool to analyse and \
>> +          configure CANopen devices. \
>> +          "
>> +DESCRIPTION = "CANopenTerm is an open-source software tool designed for the \
>> +              development, testing, and analysis of CANopen CC networks and \
>> +              devices.  It extends its capabilities to support other CAN CC \
>> +              protocols, including SAE J1939 and OBD-II. \
>> +              "
>> +HOMEPAGE = "https://canopenterm.de"
>> +BUGTRACKER = "https://github.com/CANopenTerm/CANopenTerm/issues"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=bd2edc721b4a0289efe949bdbe7dda79"
>> +
>> +DEPENDS = "canvenient cjson isocline libinih libsdl3 lua pocketpy"
>> +
>> +PV = "v2.02+git${SRCPV}"
>> +
>> +SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;branch=main;protocol=https"
>> +
>> +SRCREV  = "7a9466029a6e88345e65e794ff1779f778c9358a"
>> +
>> +
>> +inherit cmake ptest
>> +
>> +EXTRA_OECMAKE += "-DUSE_SYSTEM_LIBS=ON"
>> +
>> +FILES:${PN} += "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
>> +
>> +RDEPENDS:${PN} = "canvenient cjson libinih libsdl3 lua pocketpy"
>>
>>
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126554): https://lists.openembedded.org/g/openembedded-devel/message/126554
> Mute This Topic: https://lists.openembedded.org/mt/118952637/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


