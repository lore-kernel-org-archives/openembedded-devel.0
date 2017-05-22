Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 536 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 May 2017 15:05:09 UTC
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 336B977DE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 15:05:09 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 6368168A019; Mon, 22 May 2017 15:56:14 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 10E6768A019;
	Mon, 22 May 2017 15:56:12 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id BD3D667403CA;
	Mon, 22 May 2017 16:56:11 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <6b90bfd5-3dd1-572c-9a63-2f9399737824@ubiant.com>
	<CAHUNapRhwKpbR0nXyre4nV+fPgC6XR3QFNq4DhtfSO0zzRv7=Q@mail.gmail.com>
	<122c5ac1-7191-17f6-0f88-0a9b4fea64ba@ubiant.com>
	<CANx9H-CbvQnPCuRYXXYxOrJrtg7C-AVDA9COYuFJFAwR5LFqwA@mail.gmail.com>
	<e08a6c25-e743-2274-abe7-bea0b570c04d@ubiant.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <f1c5abe0-313b-5a69-93d1-33e64bc8a8bb@mlbassoc.com>
Date: Mon, 22 May 2017 16:56:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e08a6c25-e743-2274-abe7-bea0b570c04d@ubiant.com>
Subject: Re: [meta-java] rxtx fails to build because of upstream website dead
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
X-List-Received-Date: Mon, 22 May 2017 15:05:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2017-05-22 16:34, Romain Bazile wrote:
> Yeah, it just keeps on going online and offline every few weeks, that's why I was asking about the source mirrors.
> We have been stuck for a week while the website was down.
>
> That seems to me like a viable alternative to use the mirrors, in case it goes down again.

You could also set up your own local mirror which can also speed builds considerably.
Just look at the documentation for 'own-mirrors'

>
>
> Do you know where can I put the request to add this file to the mirrors?
>
> Romain Bazile
>
> Le 22/05/2017 à 16:29, Tim Orling a écrit :
>> I just tried and upstream was available. Maybe it was just down for maintenance?
>> On Mon, May 22, 2017 at 12:23 AM Romain Bazile <romain.bazile@ubiant.com <mailto:romain.bazile@ubiant.com>> wrote:
>>
>>     The source package is about 1.5MB big, so that's not really heavy.
>>
>>
>>     But I perfectly understand the rationale behind it, which was my fear.
>>
>>
>>     I didn't know about the source mirror. This would make perfect sense,
>>     since this is the exact thing we in fact are looking for (having the
>>     sources in the layer is only a fix).
>>
>>     How does that work to get the source mirrored here?
>>
>>     I supposed there would need to be some changes to the recipe too?
>>
>>     Romain Bazile
>>
>>     Le 20/05/2017 à 17:21, Trevor Woerner a écrit :
>>     > On Fri, May 19, 2017 at 11:07 AM, Romain Bazile
>>     > <romain.bazile@ubiant.com <mailto:romain.bazile@ubiant.com>> wrote:
>>     >> Due to the chronic instability of this website, would it make
>>     sense to
>>     >> include the source file directly into the meta-java layer as a
>>     zip file?
>>     > My guess is the project would not be happy about a large zip
>>     file in a
>>     > git repository. If a patch becomes too big, or if a recipe needs too
>>     > many patches, the general consensus is to create a repository
>>     with the
>>     > patches and keep the metadata small. On the other hand, exceptions
>>     > abound.
>>     >
>>     >> I don't know about best practices surrounding this, I kindly
>>     apologize if
>>     >> it's strictly forbidden! Otherwise, I'm happy to submit a PR
>>     including the
>>     >> file and the necessary changes to the recipes (in concerned
>>     branches).
>>     > The yoctoproject maintains a source mirror, the best bet is to ask
>>     > that the sources be mirrored there. The recipe will probably be
>>     > expected to stay as-is, and the yocto backup used if/when the
>>     primary
>>     > is down.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

