Return-Path: <sean@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1AA7C75E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 09:03:11 +0000 (UTC)
Received: from [192.168.100.161] (unknown [95.138.208.137])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 2683D1C3F7B;
	Thu,  7 Mar 2019 10:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com;
	s=hundeboll; t=1551949392;
	bh=bVrulEQ4xgE8hr3rNxw4h7ZKzaU3fulXj0yyOSVQQuU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=EtZd9kypK/9InUB25/jY1MvMl3uvf0gwxQ+u0n7o8VqmCABuVW8lYKKaknskJrKib
	yjh1x3ABuGleOIYsNnFc87Um8fImZ3HsS5JuRnoMKNpp48kmAKDO0aRYKCi2ZLZKRN
	PdDGf9o9Yg2T4P6xX5EjpBKCFsySbU/+rWmKEyWWNaJUGhCBkvPw7ldqpb+CMX+a6G
	JwjZ9K3RDy9uQ78rciHagRy2fRQrqQ4BI2k9do8oalI5gekZorgCudQ5UM0UNZvphF
	Ras6YYPK+J5gkSmveX3f25G+RVVmxxw5ydXGPepCHHNTfezcdZfw0MILtugjwXgg7t
	4rR0tuEyARmEw==
To: Adrian Bunk <bunk@stusta.de>
References: <20190307082917.18118-1-sean@geanix.com>
	<20190307085338.GA28605@localhost>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <c15ece8b-c647-34ca-8f5b-17fac9518081@geanix.com>
Date: Thu, 7 Mar 2019 10:03:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307085338.GA28605@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] asio: add PACKAGECONFIG boost
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
X-List-Received-Date: Thu, 07 Mar 2019 09:03:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit



On 07/03/2019 09.53, Adrian Bunk wrote:
> On Thu, Mar 07, 2019 at 09:29:17AM +0100, Sean Nyekjaer wrote:
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>>   meta-oe/recipes-support/asio/asio_1.12.2.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/asio/asio_1.12.2.bb b/meta-oe/recipes-support/asio/asio_1.12.2.bb
>> index ee548fd3a..ec705c275 100644
>> --- a/meta-oe/recipes-support/asio/asio_1.12.2.bb
>> +++ b/meta-oe/recipes-support/asio/asio_1.12.2.bb
>> @@ -20,3 +20,7 @@ SRC_URI[md5sum] = "312e53385e2daad10f08d57f91ad3431"
>>   SRC_URI[sha256sum] = "4e27dcb37456ba707570334b91f4798721111ed67b69915685eac141895779aa"
>>   
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
>> +
>> +PACKAGECONFIG ??= "boost"
>> +
>> +PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost,boost"
> 
> Adding an RDEPENDS in the PACKAGECONFIG looks wrong.
> boost should also be removed from the DEPENDS above when it is disabled.
> 
> This would be on top of your patch:
> -DEPENDS = "boost openssl"
> +DEPENDS = "openssl"
> -PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost,boost"
> +PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
> 
> cu
> Adrian
> 
Hi Adrian,

I missed the DEPENDS, thanks :-)
But why does the extra RDEPENDS looks wrong?

I'll send a PATCHv2

/Sean

