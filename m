Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D78C47F298
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:01:06 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q8so1685914ljj.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Dd44chqT/za7Z6nkDgWbl9PQ634+JazBVuMzz8qM3ZI=;
	b=DtYyhGNhvIm0KsJjg4xVauryRqD2njZrnJUwXQFHJfwqayQrv/2l59G9jBCGsp572U
	yaLquRCe9EddIdWYkXTGLNc6YYvyjZBmjxohieSTRDBr0LC0LEw4tsN8G63kK3iBLVS7
	V7+GA7eux2dGszsTeDCUeHfZgGMv1uelcxsPc47Mo/rYsI3jo6PCdCri5/vPCU3lMcmu
	ooVY1HZT1o+IgXwHTMUo+51AN7bsRNR3B++aBv4UgUBGuX2rla84YhExcuG5rMRlH4tt
	fnai3qG4oa9MQJkViCqxLkBMO2yboHSAgpu10ibVHZypXZmPS8CI0lMPbD4ChAxmklSm
	kohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Dd44chqT/za7Z6nkDgWbl9PQ634+JazBVuMzz8qM3ZI=;
	b=jF5g6/1pYN2d8PfrrE1r4lzj/cgdeELyZfQD9OjYSz1tGB//gTpLUVB8bCdObkBiLo
	Vz6165q3uN+FwUC2SG4G0T2h2V1rzl66jxFSRt7MzM0mUHTAnaBv5EDKUf/w1rY3+Cr7
	dydq9I9v2stryI6EjPLy+b2XF54L+3Uq4msiqZIqkV3iz8OJxylqT4mEX3rg4qsXEiWm
	22M5ay2Vh6OgZ7vPFVCZSkcj78Vp156oBrynm57UdhvoBUfkeIDULEu5GVaSnqHUlWsN
	DX9cAPO4Xnooagx5XT8EPNjolgkIol4fCn3Zh26KVWc7hoYRM/HVlqD+wqbbC4kmKbyQ
	HjuA==
X-Gm-Message-State: APjAAAXosqtorHvuAGqEtLbGY4AanZ425YNXDZDNzL9KWu5y4m3iQYU1
	mGdvMjYCxjHi7/SPmnwUJNwTp38i
X-Google-Smtp-Source: APXvYqyW5m5Z7VluveOdaRAXoN5Czlp0dwXog9kjvtOUmHG9pLeMuCxJcGAuM/1CBAEyJfp/beAY1Q==
X-Received: by 2002:a2e:9b05:: with SMTP id u5mr15649963lji.59.1579593667218; 
	Tue, 21 Jan 2020 00:01:07 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	u7sm18326803lfn.31.2020.01.21.00.01.03
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 21 Jan 2020 00:01:06 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
Date: Tue, 21 Jan 2020 09:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121071238.GB1567918@pcleri>
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
X-List-Received-Date: Tue, 21 Jan 2020 08:01:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

On 1/21/20 8:12 AM, Richard Leitner wrote:
> Hi Jacob,
> 
> On Tue, Jan 21, 2020 at 08:00:48AM +0100, Jacob Kroon wrote:
>> Hi Richard,
>>
>> I still can't use openjre-8 in either warrior, zeus or master builds, due to
>> the crash below. I wonder, is anyone successfully using openjre-8 in either
>> of these releases ?
> 
> I'm doing tests for the machine/distro combinations stated in the README
> before pushing to master. Therefore it should have worked back then.
> 
> Nonetheless I'm currently working on updating openjdk-8 to the latest ga
> and implementing continous (e.g. nightly/weekly) builds/tests on qemu to
> make sure nothing broke over time.
> 
> So maybe I could get something out of this.
> 

Thanks for doing this work.

>>
>> I see the crash both in my custom machine and in qemux86-64. If it makes a
>> difference, I'm using
>>
>> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
>> PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
>>
>> since building with jamvm has always been broken for me.
>>
>> Any hints ?
> 
> Nothing that comes to my mind directly, but I'll take a look into this.
> 
> So your "custom machine" is also x86-64?

The custom machine .conf file is just:
------------------------------------------
require conf/machine/include/tune-i686.inc
require conf/machine/include/x86-base.inc
------------------------------------------

So 32bit x86.

Cheers,
Jacob

