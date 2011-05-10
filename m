Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QJkxA-0005HU-DZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:18:12 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 10 May 2011 13:15:27 +0200
X-TM-IMSS-Message-ID: <0bf4d2110000456c@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0bf4d2110000456c ;
	Tue, 10 May 2011 13:15:27 +0200
Message-ID: <4DC91E4E.3070109@nedap.com>
Date: Tue, 10 May 2011 13:15:26 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DC8F3A2.2090005@nedap.com>
	<20110510100020.GA10493@mx.loc>	<1305022004.8000.149.camel@phil-desktop>
	<4DC91B33.9080807@nedap.com>
	<1305025696.8000.155.camel@phil-desktop>
In-Reply-To: <1305025696.8000.155.camel@phil-desktop>
X-OriginalArrivalTime: 10 May 2011 11:15:27.0544 (UTC)
	FILETIME=[90CAF380:01CC0F03]
Subject: Re: x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 11:18:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>>>>> is there any support for 64 bit intel/amd machines?
>>>>> And if so, how to build for them?
>>>> Can we settle on a name please for i want to add a qemu machine for
>>>> testing x86_64?
>>>>
>>>> x8664
>>>> amd64
>>>> ...
>>>>
>>>> Opinions?
>>> "x86_64" seems to be what's currently used as the architecture name.  If
>>> you want a value for ${MACHINE} then I guess something like
>>> "x86_64-generic" would do.  I don't think there's any prohibition
>>> against underscores in machine names.
>>>
>>> p.
>> So I'm guessing it is not possible at this very moment?
> Depends what you mean by "not possible".  There doesn't seem to be any
> existing machine config file which targets x86_64, but I don't think
> there is any reason that you couldn't trivially create one; something
> along the lines of:
>
> $ cat>conf/machine/x84_64-generic.conf<<EOF
> TARGET_ARCH = "x86_64"
> GLIBC_ADDONS = "nptl"
> GLIBC_EXTRA_OECONF = "--with-tls"
> PREFERRED_PROVIDER_virtual/kernel = "linux"
> KERNEL_IMAGETYPE = "bzImage"
> EOF
> $
>
> p.
Will try that; is there any 64 bit output to be expected?
Jaap.


