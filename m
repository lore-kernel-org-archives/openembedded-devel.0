Return-Path: <prvs=653f3e6c3=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 45F6C60167
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 07:25:21 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApwEAIAKw1WsEApK/2dsb2JhbABbhFgGxQ4Cgg4BAQEBAQGBC4QkAQEEbgoRCw0LCRYPCQMCAQIBRQYNBgICiC/MawEBCCKLIS6FEBeEFQEEhxqGYYcGjh6EI4J1FpB6hCVtgUiBBAEBAQ
X-IPAS-Result: ApwEAIAKw1WsEApK/2dsb2JhbABbhFgGxQ4Cgg4BAQEBAQGBC4QkAQEEbgoRCw0LCRYPCQMCAQIBRQYNBgICiC/MawEBCCKLIS6FEBeEFQEEhxqGYYcGjh6EI4J1FpB6hCVtgUiBBAEBAQ
Message-ID: <55C30BCC.2090309@skidata.com>
Date: Thu, 6 Aug 2015 09:25:00 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <556EA59A.8010007@skidata.com>
	<CAP9ODKpB0A9JZbWdS80Dq2bNX1VG5e3PKTpSpCvdvCrwD4965g@mail.gmail.com>
	<55ACECA1.10102@skidata.com>
In-Reply-To: <55ACECA1.10102@skidata.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH] openjdk-7: 75b13-2.5.4: fix xawt build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Aug 2015 07:25:24 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hello,
any updates on this patch?

best regards,
Richard L

On 07/20/2015 02:42 PM, Richard Leitner wrote:
> Hello,
> 
> On 07/07/2015 03:57 PM, Otavio Salvador wrote:
>> On Wed, Jun 3, 2015 at 3:58 AM, Richard Leitner
>> <richard.leitner@skidata.com> wrote:
>>> The icedtea-jdk-nio-use-host-cc.patch disabled the build of xawt.
>>> Therefore all awt based java application which were run on X11 failed
>>> starting the GUI with an java.awt.HeadlessException.
>>>
>>> This patch enables xawt again by adapting
>>> icedtea-jdk-nio-use-host-cc.patch.
>>>
>>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>>> ---
>>> This patch was only tested with yocto-1.6.3 (daisy) on an armv7a
>>> cortexa9 with vfpv3d16. Please test it on further platforms!
>>>
>>> This is my first patch to this mailinglist so hopefully I got everything
>>> right. If not please give me some feedback on what to improve for the
>>> next one ;-)
>>> ---
>>
>> Sorry for the long time to get to this patch. I would like to ask if
>> you could run a test in master so we avoid surprises. If you confirm
>> it works I am fine in commiting it.
>>
> 
> I successfully compiled and tested openjdk with the patch on an armv7a
> cortexa9 cpu with vfpv3d16 using following layers:
> 
> poky/meta{,-yocto}
> 	@ master (0f8d89ce66cfffccc9911d6c61470a585173b79d)
> 
> meta-java
> 	@ master (4aea395deed99b2725b56d4a86fb4712fcf504d7)
> 	+ my patch
> 
> meta-openembedded/meta-oe
> 	@ master (c12b9596afd236116b25ce26dbe0d793de9dc7ce)
> 
> best regards,
> Richard L
> 

