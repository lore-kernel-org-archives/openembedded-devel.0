Return-Path: <romain.bazile@ubiant.com>
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
	[46.105.63.230])
	by mail.openembedded.org (Postfix) with ESMTP id B410677DE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 15:10:14 +0000 (UTC)
Received: from player763.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id EC63B5447C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 17:10:14 +0200 (CEST)
Received: from [192.168.0.191] (LMontsouris-657-1-193-111.w90-63.abo.wanadoo.fr
	[90.63.225.111]) (Authenticated sender: romain.bazile@ubiant.com)
	by player763.ha.ovh.net (Postfix) with ESMTPSA id 473FB3C00FA;
	Mon, 22 May 2017 17:10:13 +0200 (CEST)
From: Romain Bazile <romain.bazile@ubiant.com>
To: Gary Thomas <gary@mlbassoc.com>
References: <6b90bfd5-3dd1-572c-9a63-2f9399737824@ubiant.com>
	<CAHUNapRhwKpbR0nXyre4nV+fPgC6XR3QFNq4DhtfSO0zzRv7=Q@mail.gmail.com>
	<122c5ac1-7191-17f6-0f88-0a9b4fea64ba@ubiant.com>
	<CANx9H-CbvQnPCuRYXXYxOrJrtg7C-AVDA9COYuFJFAwR5LFqwA@mail.gmail.com>
	<e08a6c25-e743-2274-abe7-bea0b570c04d@ubiant.com>
	<f1c5abe0-313b-5a69-93d1-33e64bc8a8bb@mlbassoc.com>
Organization: Ubiant
Message-ID: <c30f361b-99b8-efc4-1123-c6bdca6edc4c@ubiant.com>
Date: Mon, 22 May 2017 17:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <f1c5abe0-313b-5a69-93d1-33e64bc8a8bb@mlbassoc.com>
X-Ovh-Tracer-Id: 18398893327907969864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrvdejgdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 22 May 2017 15:10:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I will do that too then!

But I also wated to help others get an easier access to the 
rxtx-2.2pre2.zip file!

Thanks guys!

Romain Bazile

Le 22/05/2017 à 16:56, Gary Thomas a écrit :
> On 2017-05-22 16:34, Romain Bazile wrote:
>> Yeah, it just keeps on going online and offline every few weeks, 
>> that's why I was asking about the source mirrors.
>> We have been stuck for a week while the website was down.
>>
>> That seems to me like a viable alternative to use the mirrors, in 
>> case it goes down again.
>
> You could also set up your own local mirror which can also speed 
> builds considerably.
> Just look at the documentation for 'own-mirrors'
>
>>
>>
>> Do you know where can I put the request to add this file to the mirrors?
>>
>> Romain Bazile
>>
>> Le 22/05/2017 à 16:29, Tim Orling a écrit :
>>> I just tried and upstream was available. Maybe it was just down for 
>>> maintenance?
>>> On Mon, May 22, 2017 at 12:23 AM Romain Bazile 
>>> <romain.bazile@ubiant.com <mailto:romain.bazile@ubiant.com>> wrote:
>>>
>>>     The source package is about 1.5MB big, so that's not really heavy.
>>>
>>>
>>>     But I perfectly understand the rationale behind it, which was my 
>>> fear.
>>>
>>>
>>>     I didn't know about the source mirror. This would make perfect 
>>> sense,
>>>     since this is the exact thing we in fact are looking for (having 
>>> the
>>>     sources in the layer is only a fix).
>>>
>>>     How does that work to get the source mirrored here?
>>>
>>>     I supposed there would need to be some changes to the recipe too?
>>>
>>>     Romain Bazile
>>>
>>>     Le 20/05/2017 à 17:21, Trevor Woerner a écrit :
>>>     > On Fri, May 19, 2017 at 11:07 AM, Romain Bazile
>>>     > <romain.bazile@ubiant.com <mailto:romain.bazile@ubiant.com>> 
>>> wrote:
>>>     >> Due to the chronic instability of this website, would it make
>>>     sense to
>>>     >> include the source file directly into the meta-java layer as a
>>>     zip file?
>>>     > My guess is the project would not be happy about a large zip
>>>     file in a
>>>     > git repository. If a patch becomes too big, or if a recipe 
>>> needs too
>>>     > many patches, the general consensus is to create a repository
>>>     with the
>>>     > patches and keep the metadata small. On the other hand, 
>>> exceptions
>>>     > abound.
>>>     >
>>>     >> I don't know about best practices surrounding this, I kindly
>>>     apologize if
>>>     >> it's strictly forbidden! Otherwise, I'm happy to submit a PR
>>>     including the
>>>     >> file and the necessary changes to the recipes (in concerned
>>>     branches).
>>>     > The yoctoproject maintains a source mirror, the best bet is to 
>>> ask
>>>     > that the sources be mirrored there. The recipe will probably be
>>>     > expected to stay as-is, and the yocto backup used if/when the
>>>     primary
>>>     > is down.
>


