Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SbwUY-0006yh-8K
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 18:20:23 +0200
Received: by bkcjm2 with SMTP id jm2so4908258bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8VRDXkfvofV3qK92xya2XGfQQxoZUIXe5SpvBkmCN1Q=;
	b=GhKH1Ur4hQgstxcHsCBfGjg/v2zA9WlQREnMczQMIohSlDP/pvOb/ERCMn9ZxZmmnM
	DN8krv8GruqKhvsedUQ6XMKuEGqm3/OLrtmDn02iu3y2BZboP8ZJ2B46FElAArgMRnH4
	SYLpQSloUKxC84pEQuxEXvlwprLxohYGHNvt2qtuyhyMTh7uSKlnmg9WvBx7StCrY/B7
	kHVKPtPS1aDtBuYAQWeIbLmDpGIR34YqD0DZ0FRRDZLncTiVHlWJOHOi6r6+2qJzeod1
	hDOoJ5dZ5cpZ2REklhqTIrS3+Xy/Y3XuCfW/9HaMjTm89KOsr/OQKlmVWgVSRKtzvc/n
	+h0A==
Received: by 10.204.149.208 with SMTP id u16mr10012338bkv.81.1338912596189;
	Tue, 05 Jun 2012 09:09:56 -0700 (PDT)
Received: from [192.168.1.129] ([37.191.128.59])
	by mx.google.com with ESMTPS id gw6sm2626737bkc.16.2012.06.05.09.09.54
	(version=SSLv3 cipher=OTHER); Tue, 05 Jun 2012 09:09:54 -0700 (PDT)
Message-ID: <4FCE2F51.3030003@gmail.com>
Date: Tue, 05 Jun 2012 18:09:53 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.4) Gecko/20120501 Thunderbird/10.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FCC5A7B.8040204@gmail.com>
	<CAMKF1spW20v28PG+Te=5nfiGR0upuRqTRTr7G3w3SZTeR1zi7w@mail.gmail.com>
In-Reply-To: <CAMKF1spW20v28PG+Te=5nfiGR0upuRqTRTr7G3w3SZTeR1zi7w@mail.gmail.com>
Subject: Re: gcc-crosssdk-initial can not compile. Get message: this target does not support --with-float
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
X-List-Received-Date: Tue, 05 Jun 2012 16:20:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sure. Will do it first thing in the morning. Think this actually happens 
in compile though, for some reason. Do you want me to paste it and give 
a link, or is it ok with an attachment?

- Martin

On 06/04/12 18:32, Khem Raj wrote:
> On Sun, Jun 3, 2012 at 11:49 PM, Martin Ertsås<martiert@gmail.com>  wrote:
>> Hi.
>>
>> When trying to compile meta-toolchain, it crashes during
>> gcc-cross-initial with the error:
>>
>> this target does not support --with-float
>> Valied --with options are: arch arch_32 arch_64 cpu cpu_32 cpu_64 tune
>> tune_32 tune_64
>
> can you post log.do_configure of this package somewhere ?
>
>> The reason for this is a commit that happened 2012-05-01 in openembedded
>> core, called "gcc: Grok for callconvention-hard to enable hard float".
>> Reverting this patches makes it compile, and still I get the
>> --mfloat-abi=hard when compiling with the resulting toolchain.
>>
>> I'm compiling on a x64 Linux machine, with the target being a cortexa9
>> processor. I have the DEFAULTTUNE set to cortexa9hf-neon. What should
>> the patch do, and what will happen if I disable it?
>>
>> Best regard
>> Martin
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



