Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1747D00E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 02:45:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5B2jGIa007011
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Jun 2019 19:45:18 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 10 Jun 2019 19:45:15 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20190610071310.15157-1-mingli.yu@windriver.com>
	<20190610133529.GA18219@localhost>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CFF16F7.90003@windriver.com>
Date: Tue, 11 Jun 2019 10:50:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20190610133529.GA18219@localhost>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] kea: replace -Og with -O
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
X-List-Received-Date: Tue, 11 Jun 2019 02:45:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年06月10日 21:35, Adrian Bunk wrote:
> On Mon, Jun 10, 2019 at 12:13:10AM -0700, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> With below logic in local.conf:
>> MACHINE ??= "qemumips64"
>> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>> MULTILIBS ?= "multilib:lib32 multilib:libn32"
>> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>> require conf/multilib.conf
>> DEBUG_BUILD = "1"
>>   $ bitbake lib32-kea
>> [snip]
>> {standard input}: Assembler messages:
>> {standard input}:305030: Error: branch out of range
>> {standard input}:305041: Error: branch out of range
>> {standard input}:305432: Error: branch out of range
>> {standard input}:305443: Error: branch out of range
>> Makefile:707: recipe for target 'dhcp4_parser.lo' failed
>> make[6]: *** [dhcp4_parser.lo] Error 1
>> [snip]
>>
>> When DEBUG_BUILD enabled, -Og pass to compiler,
>> replace -Og with -O to fix the above compile error.
>> ...
>
> This sounds like a toolchain bug in gcc or binutils that should
> be fixed there.
>
> I've opened #13387 in bugzilla so that this doesn't get lost.

Could you help to post the link here about the issue you opened?

Thanks,

>
> cu
> Adrian
>

