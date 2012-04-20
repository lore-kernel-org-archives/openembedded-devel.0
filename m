Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SL22X-0000ml-9N
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 02:49:33 +0200
Received: by vcbfl13 with SMTP id fl13so6808958vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=xqEdGfK29WB5+n8xbogUFPoejEdUCbovTKYHAZbzkww=;
	b=Vf9trwu8G1zi3LRS+k4fAU4VQR255Qrm4d85BfB/i2dAeH8su1nXpH52mOo3AKy8vL
	rfh+G6nXT9yKVRfdAW8PAopKDVsqnt87hszQkBg+uoyEcASTSN9z/cvYtxcCUtgw/QbY
	Zjdopd0d+dHW5AagwTVnZ2IpNfbncdRTriT4qYdlp5gvLOWa5VopKIUy3WrMb7xLCbbJ
	9fioNpNs+zkQ39zg17G1wXOX5EP3K4tJrVZIS3SvC1SeFe794WjHtjyXRxq1W7ZiMhSh
	ts4A4dcTSclw9f/yAIgotCKUU27mftqyhDtzDDjIJa3ESu7H0SQcv3+7AltAqWIpAYm/
	dX5A==
Received: by 10.220.38.8 with SMTP id z8mr2666452vcd.68.1334882403814;
	Thu, 19 Apr 2012 17:40:03 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id e4sm4639033vdh.10.2012.04.19.17.39.59
	(version=SSLv3 cipher=OTHER); Thu, 19 Apr 2012 17:40:02 -0700 (PDT)
Message-ID: <4F90B056.5020209@gmail.com>
Date: Thu, 19 Apr 2012 17:39:50 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
In-Reply-To: <CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Fri, 20 Apr 2012 00:49:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2012 11:24 PM, Khem Raj wrote:
> On Wed, Apr 18, 2012 at 8:32 PM, j<vwyodapink@gmail.com>  wrote:
>>> on ubuntu edit /etc/security/limits.conf on build host and then add
>>> *         soft    core    unlimited
>
> btw. reboot your machine after this change is made
>
>>> that should generate core files. After this search for core* files in
>>> build tree
>>> and see if there are any then debug them with gdb to diagnose it further
>>>
>>> Now I am not sure if those segfaults directly relate to malfunction of
>>> image
>>> if thats the case but its likely. You should also try to explore the
>>> reasons why
>>> the image fails to behave as expected.
>> I will do as suggested as well as do a full image build again and see if I
>> can find out all that is not working. Thank you for the extra debugging info
>> and suggestions. Are there any keywords to search through all the files for
>> including the normal log files, it may help me track down things even
>> further.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

did the reboot went through the build but yet did not produce any core 
files. But I noticed ulimit was still 0 so changed it to unlimited now 
and building again, hopefully that will get some core dumps. Will post 
back once I have more info and will separate anything by which machine 
as even the 2nd borrowed machine segfaults in the same way.

Thanks again for the help


