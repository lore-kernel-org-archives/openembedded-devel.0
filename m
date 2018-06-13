Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 883A678B1F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:35:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5D6ZX80007134
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jun 2018 23:35:33 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 12 Jun 2018 23:35:32 -0700
To: Richard Leitner <richard.leitner@skidata.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180607092459.33931-1-wenlin.kang@windriver.com>
	<6bd2359a-5d58-f11e-9900-88f5de733d7f@skidata.com>
	<4c52ac95-ccac-2e87-2874-18436eccbcb5@windriver.com>
	<071d4904-44a0-bab1-7892-b969ab215db6@windriver.com>
	<996c37ae-eb35-18ee-3d87-ec9b9f59fa5d@skidata.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <b24f33ec-c9d9-5fd0-6edc-c3e0d9ab5e69@windriver.com>
Date: Wed, 13 Jun 2018 14:35:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <996c37ae-eb35-18ee-3d87-ec9b9f59fa5d@skidata.com>
X-Originating-IP: [128.224.162.186]
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
X-List-Received-Date: Wed, 13 Jun 2018 06:35:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年06月12日 20:47, Richard Leitner wrote:
> On 06/12/2018 02:02 PM, Wenlin Kang wrote:
>> On 2018年06月12日 19:35, Wenlin Kang wrote:
>>> On 2018年06月12日 19:09, Richard Leitner wrote:
>>>> Hi Wenlin,
>>>>
>>>> On 06/07/2018 11:24 AM, Wenlin Kang wrote:
>>>>> We need remove previous debuglink before add it if it has existed,
>>>>> because it may have a different file name with this that we will add.
>>>> I'm sorry but I don't get the reason why we need this...
>>>> It would be great if you may please explain it in a little more detail for me ;-)
>>> Hi Richard
>>>
>>> In openjdk-8, its debug file is xxx.debuginfo, and when execute openjdk's makefile, it will add
>>> libjvm.debuginfo as libjvm.so's debuglink section's file name, this name is different  with that
>>> we will add in splitdebuginfo() of package.bbclass, this makes we can't get symbol information
>>> when debug libjvm.so in gdb.
>>>
>> When a executable file or library file has contained the debuglink section, it will not be changed when added again,
>> so we must remove it after add new one.
>>
>> In OE-core, debug file name is the same with the executable file or library file.
>>
> Thank you for that explanation!
>
> Maybe you can add this (or a shortened version of it) to the commit message.
> Otherwise this patch is fine with me.

Hi Richard

What about changing the comments as below ?

openjdk-8: remove debuglink

During openjdk-8 compiling, its debug file is xxx.debuginfo, and it will
add libjvm.debuginfo as libjvm.so's debuglink section's file name, this
name is different with that we will create and add in splitdebuginfo()
of package.bbclass, in oe-core, the debug file name is the same with the
corresponding executable file or library file, this will make we can't get
symbol information when debug libjvm.so in gdb, so we must remove the
previous debuglink before add it if it has existed(if a file has contained
the debuglink section, it will not be changed when add again).

>
> So please send a v2 of this series whenever you like!
>
> regards;Richard.L
>

-- 
Thanks,
Wenlin Kang


