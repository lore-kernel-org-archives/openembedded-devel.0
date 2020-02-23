Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 35FF86167D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:23:54 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 18so3917483oij.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 10:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=mCr7O9VjkJlUuhBdo6/URkXVV2p+fFZ4alXWfYEpI+4=;
	b=GC5H0IxiIUIg/ua0uSxCkUhUbs2suJvJPsGWMoJf6Booq5tEO03fzpRa2sFPHyJ2MK
	fPUXYXj9SuGsGUTe+7TiFzaTQrVkrGGY9023xaR7ofyEC8ccITZ7ifLouCUfJO4Xjzal
	hjBVjiDQQmP9bHpKUIRnCmKfLoiuRDAcu4nQJIwf0IIdOQHDJADQWTf8zaRpKCw9ieS9
	/j2PqFZ8Fjje5d+15htcATwm/MWfXUhsmLDIBS600lNgJspXtAK9wT1QtUa1Rkg8BjJD
	DDHvS4bxIJfdv+lbDrz3wSLuwknecCjDR10UMctBm1/Kgtot46qj/cPj+f1R58NOnZxR
	z4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mCr7O9VjkJlUuhBdo6/URkXVV2p+fFZ4alXWfYEpI+4=;
	b=ZYbG1Wx1KwWOwLUxP8W1dE6Stw6gqBDnAtNKySyierQ+3GO3lLckEJDx6GSzSKUIFB
	kZADUwTexs7libcI+dip23JTgOzkwXVVuZP0oZj+etZpiZKvbyTK15abIXLs64UVU9zv
	TVRcUjyc3xHFcEePLmJfac5kKEYWea9bCHXb1yxVffOYkjaQZ9+5kM7KoiIcNXlur5UX
	nuuZcf7YLXH0OwD5OWvpC1DCPxqZsvkA+gyQScrJ6K54AKij3X644RXSMiGDNH827xSN
	K7Gdy6gPT07qGdYSYL1z5DKLRH5t6iLUq3AZDsRe3Pf2p5HDVDEcMN+8r/6EcIY//VpQ
	SVqw==
X-Gm-Message-State: APjAAAU0eVE3cnzcTJ0oWz8Swl5anOQk2BvU/sf6KbGyVGv9GiOqlUFN
	fNuxNI3DVvCNeFOWrMha5VrHNm4vZaI=
X-Google-Smtp-Source: APXvYqw1i3vkw0jkMQkw6dDmHpQFpVaQaI+GYUBepn3rwAC4cO26W4lY7Gbif1CyXqMYi8jnVYnkrg==
X-Received: by 2002:aca:37c3:: with SMTP id
	e186mr10262005oia.155.1582482234643; 
	Sun, 23 Feb 2020 10:23:54 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:90ba:d6d6:a4f7:d5eb?
	([2600:1700:4c90:60a0:90ba:d6d6:a4f7:d5eb])
	by smtp.gmail.com with ESMTPSA id
	j140sm3244974oib.46.2020.02.23.10.23.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 23 Feb 2020 10:23:54 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200222052935.19762-1-jpuhlman@mvista.com>
	<55c135f4-f708-bacd-889f-23f7b1e7d889@gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <463ee6f2-787f-b536-229b-9ce4718df026@mvista.com>
Date: Sun, 23 Feb 2020 10:23:48 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <55c135f4-f708-bacd-889f-23f7b1e7d889@gmail.com>
Subject: Re: [meta-oe][PATCH] ipmiutil: gzip man pages with out timestamp
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
X-List-Received-Date: Sun, 23 Feb 2020 18:23:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2/23/2020 12:15 AM, Khem Raj wrote:
> fails with clang
>
> https://errors.yoctoproject.org/Errors/Details/392235/

Its a hosttools issue. I was using hosttools tarball that uses pigz
as its gzip. Just needs a depends on pigz-native. Ill respin it.

> On 2/21/20 9:29 PM, Jeremy A. Puhlman wrote:
>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>
>> A timestamp was getting encoded into the gzip header. This
>> causes multilib conflicts when installed together, and would
>> likely fail reproducablity tests.
>> ---
>>   ...ess-times-from-changing-resulting-gzip-md.patch | 25 ++++++++++++++++++++++
>>   meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb  |  1 +
>>   2 files changed, 26 insertions(+)
>>   create mode 100644 meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
>>
>> diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
>> new file mode 100644
>> index 000000000..82d0e99d0
>> --- /dev/null
>> +++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
>> @@ -0,0 +1,25 @@
>> +From da668e5bf1a721797361ab866d09913ee8e157c4 Mon Sep 17 00:00:00 2001
>> +From: Jeremy Puhlman <jpuhlman@mvista.com>
>> +Date: Sat, 22 Feb 2020 04:37:04 +0000
>> +Subject: [PATCH] Prevent access times from changing resulting gzip md5sum
>> +
>> +Upstream-Status: Pending
>> +https://sourceforge.net/p/ipmiutil/support-requests/40/attachment/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
>> +---
>> + doc/Makefile.am | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/doc/Makefile.am b/doc/Makefile.am
>> +index b792762..2c52ce6 100644
>> +--- a/doc/Makefile.am
>> ++++ b/doc/Makefile.am
>> +@@ -59,5 +59,5 @@ install:
>> + 	${INSTALL_DATA_SH} iuser.8 	 ${manto}
>> + 	${INSTALL_DATA_SH} iseltime.8 	 ${manto}
>> + 	${INSTALL_DATA_SH} bmclanpet.mib ${datato}
>> +-	cd ${manto}; gzip -f *.8
>> ++	cd ${manto}; gzip -Tf *.8
>> + 	
>> +--
>> +2.13.3
>> +
>> diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
>> index 3e2634028..d0f3688a2 100644
>> --- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
>> +++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
>> @@ -21,6 +21,7 @@ PARALLEL_MAKE = ""
>>   
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
>>              file://fix_systemd_path.patch \
>> +           file://0001-Prevent-access-times-from-changing-resulting-gzip-md.patch \
>>             "
>>   SRC_URI[md5sum] = "292d6df25cad678bb27e5c8cdc6748f9"
>>   SRC_URI[sha256sum] = "58ccdbd5755d7dd72478756715af09e9c73330dfad2b91dbf03d2ac504b301a3"

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


