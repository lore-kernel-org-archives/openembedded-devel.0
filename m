Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id CB42C6018C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 00:22:00 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so16835226pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 17:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Oe6Gcss3seI0I+qUKLsuyvr3+oeFYQOhpij4eoMbBKk=;
	b=MFEKp31Ex/+koxYELmewso3tXdJ1muZfPPDEhznRBOd8bWeXIHU6a1Oc2ptcz7i2ad
	vsuqWhy0cquYJFGwoyM2WLyBkPOxuLeWHtWrUmGouEinxBGPz2np1yKnYmVX9AvKnDMA
	P2ZWnXFB8+HWrEaZPGLUA80fcH/A4ptj3X77XDNb/YuYJ51iuma6PRtNaQ3rS3TG/PgC
	QZh8BAt515DVJstaOG1D3mb1oHqV4f6Q3j2PiRxwdtwh3Xh2YMcejTLeZEAoAkoGRT+S
	UJ/XE0uaJf7YZSWJ4oMvQCdLhcyIKgRUWyQEXEkjM6crETY7d6LK/8TZqhzItxMAqMNt
	7lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Oe6Gcss3seI0I+qUKLsuyvr3+oeFYQOhpij4eoMbBKk=;
	b=HDunsBRCkiqgxsNxj3FhtqfTnk6MQzbxou9NAoWiLRvqIiVgUFs/c1iIv9KgoXvTQR
	55QL3pW2P4zQleq97M6ai9uQ1PWjAswPQ8I+ShVh5rFwJuYLWFb5tnmwn9GRQjfcpZ30
	SGDBedk4BX++YTHNAM7PE3Z4T3A3Xf4jKiDhl4f0Uc3aso/xtByBaQo9MJKo9yp8XwGM
	1gMFcI2Uzaqby6n5DaJ1w6EK6G1GmmOlALirq/W5UG/P26eApTAwPRbyLAerbFJSJ1tL
	1mSqdfOMhWpvjnfQF+5xl84yafALC6tlMl+9WWgRloxKBriYm8jcq1Xr4U61AvjczL9i
	bmyg==
X-Gm-Message-State: AOPr4FX5PWjQh+82OS3Frt3fwrU3mzTB8r2ae1w+2aOG7SuPUYrLSpvGDHzN5+ETvCr6LQ==
X-Received: by 10.98.67.7 with SMTP id q7mr54605816pfa.70.1462839721415;
	Mon, 09 May 2016 17:22:01 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4000:1239:839:9ac2:c9fe:96e6])
	by smtp.googlemail.com with ESMTPSA id
	7sm43120664pfe.88.2016.05.09.17.21.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 17:22:00 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tom King <ka6sox@gmail.com>
References: <1462204748-3435-1-git-send-email-akuster808@gmail.com>
	<20160502161809.GD17714@mentor.com>
	<CAFSKS=P_CqdgrO_rcTpGQPNn7Vo1t9MAUmg2-D8RdANiFY9gGQ@mail.gmail.com>
	<20252BD2-C54A-402B-A8F1-A7D9C163BFF1@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <573129A6.3060100@gmail.com>
Date: Mon, 9 May 2016 17:21:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20252BD2-C54A-402B-A8F1-A7D9C163BFF1@gmail.com>
Subject: Re: [meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixes via update to 4.2.8p7
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
X-List-Received-Date: Tue, 10 May 2016 00:22:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/9/16 3:00 PM, Khem Raj wrote:
> Please work with Tom to get it cached at sources.openembedded.org

I have a local copy.

let me know where you want me to put it.

- armin

> 
>> On May 9, 2016, at 12:19 PM, George McCollister <george.mccollister@gmail.com> wrote:
>>
>> 4.2.8p7 appears to have been removed from:
>> https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/
>>
>> Not sure if this is temporary...
>>
>> Regards,
>> George McCollister
>>
>> On Mon, May 2, 2016 at 11:18 AM, Joe MacDonald <Joe_MacDonald@mentor.com> wrote:
>>> [[meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixes via update to 4.2.8p7] On 16.05.02 (Mon 08:59) Armin Kuster wrote:
>>>
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> CVE-2016-1551
>>>> CVE-2016-2516
>>>> CVE-2016-2517
>>>> CVE-2016-2518
>>>> CVE-2016-2519
>>>> CVE-2016-1547
>>>> CVE-2015-7704
>>>> CVE-2015-8138
>>>> CVE-2016-1550
>>>>
>>>> for more info see:
>>>> http://support.ntp.org/bin/view/Main/SecurityNotice#April_2016_NTP_4_2_8p7_Security
>>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>
>>> Acked-by: Joe MacDonald <joe_macdonald@mentor.com>
>>>
>>>> ---
>>>> .../recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb}            | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> rename meta-networking/recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb} (97%)
>>>>
>>>> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>>>> similarity index 97%
>>>> rename from meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
>>>> rename to meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>>>> index a7b998a..ff4ba64 100644
>>>> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
>>>> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>>>> @@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>>>>            file://ntpd.list \
>>>> "
>>>>
>>>> -SRC_URI[md5sum] = "60049f51e9c8305afe30eb22b711c5c6"
>>>> -SRC_URI[sha256sum] = "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048"
>>>> +SRC_URI[md5sum] = "46dfba933c3e4bc924d8e55068797578"
>>>> +SRC_URI[sha256sum] = "81d20c06a0b01abe3b84fac092185bf014252d38fe5e7b2758f604680a0220dc"
>>>>
>>>> inherit autotools update-rc.d useradd systemd pkgconfig
>>>>
>>> --
>>> -Joe MacDonald.
>>> :wq
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

