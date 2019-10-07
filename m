Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 758926011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 11:53:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x97Brdw3022090
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Oct 2019 04:53:40 -0700 (PDT)
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 7 Oct 2019 04:53:38 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20191004152018.32461-1-Trevor.Gamblin@windriver.com>
	<20191004190528.GA15666@localhost>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <1520a6f1-d1ce-4d85-4e5a-6f7d75646dcb@windriver.com>
Date: Mon, 7 Oct 2019 07:53:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004190528.GA15666@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] freeradius: mark as incompatible with armv5
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
X-List-Received-Date: Mon, 07 Oct 2019 11:53:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10/4/19 3:05 PM, Adrian Bunk wrote:

> On Fri, Oct 04, 2019 at 11:20:18AM -0400, Trevor Gamblin wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> Freeradius fails to build for armv5:
>>
>> | *** Warning: Linking the executable build/bin/local/radeapclient against the loadable module
>> | *** libfreeradius-server.so is not portable!
>> |
>> | *** Warning: Linking the executable build/bin/local/radeapclient against the loadable module
>> | *** libfreeradius-eap.so is not portable!
>> path -Wl,/yow-lpggp31/tgamblin/freeradius.build/tmp-glibc/work/armv5e-oe-linux-gnueabi/freeradius/3.0.19-r0/git/build/lib/local//.libs
>> /arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_compare_exchange_8'
>> /arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_load_8'
>> /arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_store_8'
>> | collect2: error: ld returned 1 exit status
>> | scripts/boiler.mk:630: recipe for target 'build/bin/local/radeapclient' failed
>>
>> gcc does not supply 64-bit atomic operations,
> This is not true.
>
>> so freeradius cannot be built. Marking as incompatible for armv5.
>> ...
> What is needed is linking with -latomic, as is already done for other
> architectures.
>
> cu
> Adrian
>
Sorry for the delay. I'll make the correction.

