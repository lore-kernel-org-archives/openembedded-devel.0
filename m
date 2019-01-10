Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 63AAE7BFB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 19:56:43 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-1-8921-123.w193-250.abo.wanadoo.fr
	[193.250.63.123])
	by koncepto.io (Postfix) with ESMTPSA id A568B60566;
	Thu, 10 Jan 2019 20:56:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1547150202;
	bh=rpDNvxdZvycp1IVVdpjFyJCBzlWSq2QjOA+Liv30b/I=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=UbuGXB74dHcAwcyIZx4u1Z4DLPQt3uGc30EU8D9fmCPX7eGLnI9ZOpHzRJJkw7sda
	acyDNZ/WGbE8bIdkCn8LrSl4zsRb+c0gUpU2aoX9yTumy4tU4ob2kt2/45ORddRRoj
	Bldd8Z5yk0pJSWYuhn1TZVBtmvg6/Q9nkizypd9SlHPkorn4GA/gAAyVSAUydNref4
	tOPv6lJ/CyDxY2Ch+V+3UPyIOrNpGFvML0ldWjP7DPInRKC7nUCZ8kTkp3C74cSCiW
	/AJVTwTP1P9w6xdLzVgyPZCmKMTROBTfdgXP2xRwgRjSvs7lB61tL1v8HViEuBiB+x
	g3GcEUB5LepCA==
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <1546982720-31704-1-git-send-email-pjtexier@koncepto.io>
	<6613407c-f7e7-38d3-c373-270ce55376bc@windriver.com>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <f78b6ce2-6a5f-86ce-5313-8d7bb46826ee@koncepto.io>
Date: Thu, 10 Jan 2019 20:56:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <6613407c-f7e7-38d3-c373-270ce55376bc@windriver.com>
Subject: Re: [meta-oe][PATCH 1/2] minicoredumper: Update to 2.0.1
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
X-List-Received-Date: Thu, 10 Jan 2019 19:56:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Randy,

Le 08/01/2019 à 22:44, Randy MacLeod a écrit :
> Please add a few words to the long log to explain why
> the COPYING chksum needed to be changed.

No problem, I will send a V2

> Was it just copyright date changes?

Indeed you are right, plus a convertion to SPDX Format.

Regards,

Pierre-Jean

>
> Thanks,
> ../Randy
>
>>
>> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
>> ---
>>   .../{minicoredumper_2.0.0.bb => 
>> minicoredumper_2.0.1.bb}             | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>   rename 
>> meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.0.bb => 
>> minicoredumper_2.0.1.bb} (88%)
>>
>> diff --git 
>> a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb 
>> b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
>> similarity index 88%
>> rename from 
>> meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
>> rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
>> index bae5cf4..50dab8d 100644
>> --- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
>> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
>> @@ -1,7 +1,7 @@
>>   SUMMARY = "minicoredumper provides an alternate core dump facility 
>> for Linux \
>>   to allow minimal and customized crash dumps"
>>   LICENSE = " LGPLv2.1 & BSD-2-Clause"
>> -LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=aa846ae365f71b69e9fa0d21a56391ec \
>> +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=71827c617ec7b45a0dd23658347cc1e9 \
>> file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
>> file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
>>                      "
>> @@ -9,14 +9,13 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 
>> dbus-glib util-linux json-c"
>>     inherit autotools pkgconfig systemd update-rc.d
>>   -SRCREV = "1c0d5960b0bb4bac7566e6afe8bc9705399cc76b"
>> +SRCREV = "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
>>     PR .= "+git${SRCPV}"
>>     SRC_URI = 
>> "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
>>              file://minicoredumper.service \
>>              file://minicoredumper.init \
>> - 
>> file://0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch \
>>              "
>>     S = "${WORKDIR}/git"
>>
>
>

