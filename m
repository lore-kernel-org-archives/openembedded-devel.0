Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id DBD367F79C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 12:28:54 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id m30so986958lfp.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 04:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=t9TJU10m/UgWJMkFk6pP/odbbjfat7sAm9wUaNCM9vw=;
	b=bjcyUNxvrhrPeuC4gxHBBSf2VELxXx1NJ5q1tTdnce6jXcZQ/u0WM1bSPm0ig/Dz6O
	il+mWegS4MQA/pv2rmyNCpxrxTj/3bF8B6SUBsGZq/hKKd+V+omAgst4kClVqjZcWxIh
	OxJ9OW3gBIOYwG2Yipxgwc2TdANe6mT6LppZ8uZWKrOBXDSP3hxMyeCHAvydUntamsKj
	ltXKrgvGf9bRfzHlBHrUlKPKAyY9aaV7jPRbP7/iKvBKF/jkof3Apra1j5J+qc0xB+i9
	7N/BDl+cyqi7eZI+NJf+txzZTfJ1u3CQ6XT+C24Bevxu4ZS4jwsMTnRininEU28ln/ig
	8o9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=t9TJU10m/UgWJMkFk6pP/odbbjfat7sAm9wUaNCM9vw=;
	b=nxBhCzFAaQuQoMBG2XShSpCEmpNn21LYoQnYbr5QyL1XMgNRk2o0de+tUDwWxcxRQL
	MrSvk8qxlMNd97h/nFA3zGVePYBubmVgHQ0nKwAiewcLtvuKtCXGqatrXEv2jDLUaSrl
	WwYZ3tWZJywuK+7ZhensOFXgzbsxXDZUZBu19K+h9VEVphp75Khkwfi1sMmyGDhihg7c
	p1kF4Wapi1GPs8q5L4A/0tAJjcOnpbO1VO5pLhDaybJbI1S2zmJgoaik0yVBRQXGmUKC
	RNls822tCUy4MnZSwe2VfKk027LyK58cAJ8mQ5r4Mp+oJsh1IF2Rh5XT/TJUoGwRVyby
	vYYg==
X-Gm-Message-State: APjAAAUHyTDUgLT0XsT7Whv7Fb7rNwYvjSjQ6t+BF/LTUYAuwnbfb250
	ZkGUx7hKTqK/KLKhQSPxHrlF/K0i
X-Google-Smtp-Source: APXvYqxzFQ8i3KmiFV9RBvh4MDwxuaqukBk9Pl1+sOSZXv1j9A8nOvJqM4vw1cTu7BUb5e+zVZ/7Ew==
X-Received: by 2002:ac2:4833:: with SMTP id 19mr1301033lft.211.1579868934125; 
	Fri, 24 Jan 2020 04:28:54 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id t9sm2611403lfl.51.2020.01.24.04.28.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jan 2020 04:28:53 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
	<9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
	<20200124103621.GA10765@brokenbit>
	<538daee7-cba4-8b54-6264-dce44ebcf34c@gmail.com>
	<20200124114446.GB10765@brokenbit>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <95411b04-c9f2-ee4c-6004-110037325976@gmail.com>
Date: Fri, 24 Jan 2020 13:28:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124114446.GB10765@brokenbit>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] openjre-8: java from master/master-next crashes on startup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jan 2020 12:28:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/24/20 12:44 PM, Richard Leitner wrote:
> On Fri, Jan 24, 2020 at 12:37:58PM +0100, Jacob Kroon wrote:
>> On 1/24/20 11:37 AM, Richard Leitner wrote:
> 
> ...
> 
>>> I've just pushed a temporary branch named "g0hl1n/wip-jdk8u242ga" to
>>> the meta-java repository [1]. It contains (as you might have guessed)
>>> the update to openjdk 8u242ga.
>>>
>>> Can you please give it a try if it works for you?
>>>
>>
>> I tried but I get a linker error during openjre-8_242.bb:do_compile:
>>
>> Making adlc
>> ...
>> /tmp/ramdisk/build/hosttools/ld: cannot find -lstdc++
>> collect2: error: ld returned 1 exit status
>>
>> This is using MACHINE=qemux86-64.
>>
>> Gonna try and fix and get the build going.
> 
> Do you have "libstdc++ static" installed on your buildhost as stated in
> the README? ...the error let me suggest you don't have it ;-)
> 

Oops, yeah I missed that. That got me further, but I got a new linking 
error:

> | Linking executable genSocketOptionRegistry
> | gensrc/GensrcMisc.gmk:75: Building /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry  (from /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegi
> stry.o) (/tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry.o  newer)
> | + /tmp/ramdisk/build/hosttools/gcc /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genUnixConstants/genUnixConstants.o -o /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genUnixConstants/genUnixConstants
> | + /tmp/ramdisk/build/hosttools/ld /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry.o -o /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocket
> OptionRegistry
> | /tmp/ramdisk/build/hosttools/ld: warning: cannot find entry symbol _start; defaulting to 0000000000401000
> | /tmp/ramdisk/build/hosttools/ld: /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry.o: in function `out':
> | genSocketOptionRegistry.c:(.text+0x14): undefined reference to `puts'
> | /tmp/ramdisk/build/hosttools/ld: /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry.o: in function `emit':
> | genSocketOptionRegistry.c:(.text+0x47): undefined reference to `printf'
> | /tmp/ramdisk/build/hosttools/ld: genSocketOptionRegistry.c:(.text+0x5e): undefined reference to `printf'
> | make[2]: *** [gensrc/GensrcMisc.gmk:75: /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | Note: Some input files use unchecked or unsafe operations.
> | Note: Recompile with -Xlint:unchecked for details.
> | + /tmp/ramdisk/build/hosttools/mv /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btclasses/_the.BUILD_TOOLS_batch.tmp /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btclasses/_the.BUILD_TOOLS_batch
> | make[1]: *** [BuildJdk.gmk:55: gensrc-only] Error 2
> | make: *** [/tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/jdk8u-jdk8u242-ga//make/Main.gmk:117: jdk-only] Error 2
> | WARNING: /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/temp/run.do_compile.384980:1 exit 1 from 'exit 1'



