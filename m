Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id ADE8B780A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:33:03 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id d8so15862782pgt.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=tV5QQxpGv9qJqi7OvsBgRE6/qL/GiZYd6P2BTTKS93M=;
	b=ZkUf87Luc/ZDk/ZK4gupL4VqjUNtXEggyX2RdkOAopGYD3uwb9704X6m6/hogqF9wQ
	Npb9PX7x7hU9FCLUAMxldIgCncN8w2ZzPsii4FONAwTpR64OAnOFNphPQTBAxOe7ZAsd
	XRMRk9VeboP+T9MrRIRqzenJB+RuDmpbWS2INI+udR/i43Uk9+5NcFEPjrwOiX5HP97s
	wXwRoiggzm9OOPodLgoMWm9KFw/guMKy/diGtixfl8/DiH/xcKwfCkfiGCx5McEV2R+G
	O7BEdvQRc3mggvDcoOkc88PXIH9VHgiu/LWFx/sg6CBcDXAcoDIDn9SV9QPvqQTEtK9R
	ul/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=tV5QQxpGv9qJqi7OvsBgRE6/qL/GiZYd6P2BTTKS93M=;
	b=porMMn1hQzcbKS2ivC5pUfDeOZbEEf5yZOvby33POBS+y4YnBDecn7oCDpiTuppf3F
	Y6uC8gt2/5BqCO8pdl/tsKrA+riDVQc14/rvAX32qO3KMuLDrCDPrfbtCbhysbypQd6M
	tFAJTTeBdbAI8vb+j1wPw7mqd7TdD8JOJFIBGZXIjLEmVAamw7V7oFGdAiTCgw7tmjW8
	Kg/SQULGvBYC651t7TOwzMQOS2IqWVsv6BjfEB7xuqjQII0gsL3U+lsV2qAF/94onPVS
	982eqsiZVZJTDFoNNGhhlC+MHQnkO4hz6V17Rmr3c7+fy7QRPsyvuZw5+dh8NSajkQhC
	OfOA==
X-Gm-Message-State: AHPjjUjGl1z30EkYu5eCkw99fAWGyUDTHArxh0lvxBRiVPhMe0jtHnF6
	+8no7ZQ/MAcNAC6o
X-Google-Smtp-Source: ADKCNb5dn1G7liK58UGzK6wPBZnmWrxg+f4btmq9ID/wzR5oiQRK65RHZnLiK9vvzMtxCRU53iBbLg==
X-Received: by 10.98.202.138 with SMTP id y10mr12177367pfk.151.1505143984693; 
	Mon, 11 Sep 2017 08:33:04 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d402:d3c9:ca3b:9b54?
	([2601:202:4001:9ea0:d402:d3c9:ca3b:9b54])
	by smtp.gmail.com with ESMTPSA id
	e87sm7980069pfl.46.2017.09.11.08.33.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 08:33:03 -0700 (PDT)
To: idealsim <idealsim@laposte.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <5d54504c-db22-0e0e-6a50-86a01702baac@gmail.com>
	<1679d779-cb3d-36cb-5ea3-808a04326609@laposte.net>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5e6ec1c1-f67f-6980-8bb7-4c34a773f962@gmail.com>
Date: Mon, 11 Sep 2017 08:33:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1679d779-cb3d-36cb-5ea3-808a04326609@laposte.net>
Subject: Re: [php]backport request pyro branch
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
X-List-Received-Date: Mon, 11 Sep 2017 15:33:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/17/2017 10:21 AM, idealsim wrote:
> Hi, in pyro to build php we need this backport (pointed by Khem Ra, 
> see under) :
>
> http://git.openembedded.org/meta-openembedded/commit/?id=6cd249225ecdd0a4592afe1844541378acae6cea 
>
Is included it today pyro next pull request.

- armin
>
> regards,
>
> Mickaël
>
> -------- Message transféré --------
> Sujet :     Re: [yocto] [php7] packageconfig apache2 error
> Date :     Thu, 17 Aug 2017 08:32:01 -0700
> De :     Khem Raj <raj.khem@gmail.com>
> Organisation :     HIMVIS LLC
> Pour :     idealsim <idealsim@laposte.net>, Yocto list discussion 
> <yocto@yoctoproject.org>
>
>
>
> On 8/17/17 1:55 AM, idealsim wrote:
>> Hi i would like to add modphp to my image (pyro branch). For this i add
>> this to my local.conf :
>>
>> PACKAGECONFIG_append_pn-php = "apache2 pam"
>> IMAGE_INSTALL_append = "\
>> apache2 \
>> php \
>> php-cli \
>> "
>>
>> But during the build of php (7.1.0 by default in pyro) i have this error
>> during install :
>>
>> /|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/php-7.1.0/build/shtool 
>>
>> install -c ext/phar/phar.phar
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/image/usr/bin// 
>>
>> //|   page: php-config.1//
>> //| ln -s -f phar.phar
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/image/usr/bin/phar// 
>>
>> //| Installing PDO headers:
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/image/usr/include/php/ext/pdo/// 
>>
>> //| //
>> //| Notice: unserialize(): Error at offset 394 of 2427 bytes in
>> phar:///media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/build/pear/install-pear-nozlib.phar/PEAR/Config.php 
>>
>> on line 1080//
>> //| ERROR: One of /home/modjo/.pearrc or
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/recipe-sysroot-native/usr/bin/../../etc//pear.conf 
>>
>> is corrupt, please remove them and try againInstalling header
>> files:
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/image/usr/include/php/// 
>>
>> //| install: cannot stat 'libs/libphp5.so': No such file or directory//
>> //| WARNING: exit code 1 from a shell command.//
>> //| ERROR: Function failed: do_install (log file is located at
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/temp/log.do_install.31439)// 
>>
>> //ERROR: Task
>> (/media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_7.1.0.bb:do_install) 
>>
>> failed with exit code '1'//
>> //NOTE: Tasks Summary: Attempted 1283 tasks of which 1276 didn't need to
>> be rerun and 1 failed./
>>
>> To resolve this i change this line (in php.inc) :
>>
>> /Line 179 install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules/
>>
>> by this one :
>>
>> /Line 179 install -m 755  libs/libphp7.so ${D}${libdir}/apache2/modules
>>
>> /Perhaps this recipe need a patch ?
>
> yes. Backport
> http://git.openembedded.org/meta-openembedded/commit/?id=6cd249225ecdd0a4592afe1844541378acae6cea 
>
>
> to pyro meta-openembedded repo.
>
> Also send a backport request to openembedded-devel mailing list so that
> the pyro maintainer for meta-openembedded notices it.
>>
>> Modjo
>>
>


