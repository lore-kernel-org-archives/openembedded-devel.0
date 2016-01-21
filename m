Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id A09476057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 09:35:51 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4D6AD68A01C; Thu, 21 Jan 2016 09:35:52 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 782CA68A019;
	Thu, 21 Jan 2016 09:35:51 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 966A06742014;
	Thu, 21 Jan 2016 10:35:50 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <56A071BB.6070608@mlbassoc.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C79ADFA@ALA-MBA.corp.ad.wrs.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56A0A676.5090706@mlbassoc.com>
Date: Thu, 21 Jan 2016 10:35:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C79ADFA@ALA-MBA.corp.ad.wrs.com>
Subject: Re: [meta-java] unversioned source files
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
X-List-Received-Date: Thu, 21 Jan 2016 09:35:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2016 10:08 AM, Huang, Jie (Jackie) wrote:
>
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Gary Thomas
>> Sent: Thursday, January 21, 2016 1:51 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-java] unversioned source files
>>
>> I just built the latest openjdk-7 and noticed that there are
>> a number of source files downloaded that have no version
>> information:
>>     sources/corba.tar.bz2
>>     sources/hotspot.tar.bz2
>>     sources/jaxp.tar.bz2
>>     sources/jaxws.tar.bz2
>>     sources/jdk.tar.bz2
>>     sources/langtools.tar.bz2
>>     sources/openjdk.tar.bz2
>
> The original download file doesn' t have version in the name:
> http://icedtea.wildebeest.org/download/drops/icedtea7/2.7.0/corba.tar.bz2
>
>>
>> This seems very problematic to me - how is this expected to work,
>> especially when there are changes?
>
> Yeah, there is potential issue, we should fix it by using "downloadfilename"
> in SRC_URI to rename those files.
>

Yes, this should really be the case.  As it is, it's not possible
to build openjdk-7 and then build openjdk-8 as the files clash :-(

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

