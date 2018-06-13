Return-Path: <prvs=695dffe1c=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id A3F2678961
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:43:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,217,1526335200"; d="scan'208";a="10819694"
To: Wenlin Kang <wenlin.kang@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180607092459.33931-1-wenlin.kang@windriver.com>
	<6bd2359a-5d58-f11e-9900-88f5de733d7f@skidata.com>
	<4c52ac95-ccac-2e87-2874-18436eccbcb5@windriver.com>
	<071d4904-44a0-bab1-7892-b969ab215db6@windriver.com>
	<996c37ae-eb35-18ee-3d87-ec9b9f59fa5d@skidata.com>
	<b24f33ec-c9d9-5fd0-6edc-c3e0d9ab5e69@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <5a4429c9-f38d-f0e4-6197-d1eb2c66f565@skidata.com>
Date: Wed, 13 Jun 2018 08:43:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <b24f33ec-c9d9-5fd0-6edc-c3e0d9ab5e69@windriver.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH 1/2] openjdk-8: remove debuglink
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
X-List-Received-Date: Wed, 13 Jun 2018 06:43:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06/13/2018 08:35 AM, Wenlin Kang wrote:
> On 2018年06月12日 20:47, Richard Leitner wrote:
>> On 06/12/2018 02:02 PM, Wenlin Kang wrote:

...

>>
>> Maybe you can add this (or a shortened version of it) to the commit
>> message.
>> Otherwise this patch is fine with me.
> 
> Hi Richard
> 
> What about changing the comments as below ?

That's fine with me. Thanks!

> 
> openjdk-8: remove debuglink
> 
> During openjdk-8 compiling, its debug file is xxx.debuginfo, and it will
> add libjvm.debuginfo as libjvm.so's debuglink section's file name, this
> name is different with that we will create and add in splitdebuginfo()
> of package.bbclass, in oe-core, the debug file name is the same with the
> corresponding executable file or library file, this will make we can't get
> symbol information when debug libjvm.so in gdb, so we must remove the
> previous debuglink before add it if it has existed(if a file has contained
> the debuglink section, it will not be changed when add again).
> 
>>
>> So please send a v2 of this series whenever you like!

