Return-Path: <prvs=268147e20=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 2E37F7FBBD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 06:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1578377554; x=1609913554;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=lpyapRzUVZMdLjrPrbt42oPf22YdfuZJneOVnOZILLg=;
	b=e44R9wC0BBQ6DDenQfPu0cy25eo1vOD/7SAL2kWKepvIIu6xuT73ObOk
	Fw0V+1QuVCBUP86/DuVZdCdiyufzg1C6m3dktVp84srxP5uNW9P7Nf/A/
	e1ws7r/8HD5MSS04AL9koipttZSh0mS62TvX97gDrBBSHp1/ggABMUcZ/
	htmSFueg7jXhdms2j+ULDHTpyApZVtxZNOBT9+5Q4JuH7sdVznzuJHnQS
	uhp0lAamXbwuwdRXQsJc3bMIpGZLRNT4Mq+9l8fl8bHojyrwzDfTsgF+o
	e48hfd4JChUEKpY3yFrRV7ZT/E50rkkYx3edXzSKyrwDIntqwjzB0JJ7x A==;
IronPort-SDR: 4UvRHqGrigFZMademCX3piYpDYog0gtxbgF3IAebQdB9+zhvq5K4IpuQGvmiUWlpjk3aD27QC5
	ivnN1ihHP8m7zpt8scqIfDruTxV0o7TV6GdHp6hKZA0MJ3LHRS0/908VVHbmxTxXAJ8J3WH8tz
	BCmzORWAZcOmxGW0nJuwQ6NKIHLI0IWM4JQYDGx/Cln/uTo0rkT+2TSQ+H7nFHIYG0IgrvCPzz
	aPL3OJQDy2Ro1PvSPPeCNhVtHGORJie+i3h/f0JyWkZQULIbndfHh3G1aOpLdcY4euz2XHNSY7
	g8Q=
X-IronPort-AV: E=Sophos;i="5.69,404,1571695200"; 
   d="scan'208";a="2479263"
To: Khem Raj <raj.khem@gmail.com>
References: <e41daa42-7588-c966-9121-1478afd8b869@skidata.com>
	<CAMKF1sr4dadjU+=qMnc-XT_UQVGutN=ffZP=uMtcfs=J4D3vdA@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <c478e005-9d39-9715-f62f-c4019b1ed405@skidata.com>
Date: Tue, 7 Jan 2020 07:12:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr4dadjU+=qMnc-XT_UQVGutN=ffZP=uMtcfs=J4D3vdA@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: Darcy Watkins <dwatkins@sierrawireless.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][warrior][PATCH] Revert "openjdk-8: disable, stringop-overflow compiler errors"
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
X-List-Received-Date: Tue, 07 Jan 2020 06:12:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 04/01/2020 03:29, Khem Raj wrote:
> On Fri, Jan 3, 2020 at 2:24 PM Richard Leitner

...

>> -# WORKAROUND: disable the "specified bound depends on the length of the
>> source argument"
>> -# compiler error until we update openjdk8 to a fixed version
>> -BUILD_CFLAGS_append = " -Wno-error=stringop-overflow"
>> -TARGET_CFLAGS_append = " -Wno-error=stringop-overflow"
>> -
> 
> perhaps as distro integrator, its better for us to disable all
> warning-as-error settings
> which should work across all gcc versions and warnings will still be
> there if someone
> is interested in fixing them.
> 
> something like below might work.
> 
> BUILD_CFLAGS_append = " -Wno-error"
> TARGET_CFLAGS_append = " -Wno-error"

If that's acceptable for a OE/YP layer I'll gladly do this for meta-java.
I always wondered why so much effort is put into fixing new warnings in
"old" versions of software.

Thanks & regards;rl

> 
> other options is to add -Wno-unknown-warning which will not break
> build when a warning is not known

...

