Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 4C42D6FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 05:53:02 +0000 (UTC)
Received: from [192.168.178.170] (pD95EF8B4.dip0.t-ipconnect.de
	[217.94.248.180])
	by mail.bugwerft.de (Postfix) with ESMTPSA id C5DB7280910;
	Fri, 27 Oct 2017 05:49:55 +0000 (UTC)
To: Denys Dmytriyenko <denis@denix.org>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
	<8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
	<20171026125505.GW9221@denix.org>
	<689fd8ec-97bf-2451-0c7a-1bc4606458e5@zonque.org>
	<20171026133646.GX9221@denix.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <50f1d37c-2b92-e26b-2403-57c438b43381@zonque.org>
Date: Fri, 27 Oct 2017 07:53:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171026133646.GX9221@denix.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"Chris E. Rallis" <Chris.Rallis@ravenind.net>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Fri, 27 Oct 2017 05:53:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On Thursday, October 26, 2017 03:36 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 26, 2017 at 03:07:36PM +0200, Daniel Mack wrote:
>> On Thursday, October 26, 2017 02:55 PM, Denys Dmytriyenko wrote:
>>> On Tue, Oct 24, 2017 at 03:33:10PM +0200, Daniel Mack wrote:
>>>> Hi,
>>>>
>>>> On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
>>>>> Either this or the ptest change seems to cause:
>>>>> http://errors.yoctoproject.org/Errors/Details/157417/
>>>>
>>>> FTR, I see the same error locally. Reverting both 8fd20e8b1
>>>> ("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
>>>> ("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master-next
>>>> branch of meta-qt5 fixes things for me.
>>>
>>> Have you tried bisecting by any chance?
>>
>> bisect what exactly? If I take your patch out of my stack, qtbase
>> builds. If I don't it doesn't. Can I provide more information somehow?
> 
> That's not what you said above - we are trying to figure out which of the 2 
> (*two*) patches causes the breakage, hence the question about bisecting...

Ah, sorry, my bad.

Only reverting "qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY" fixes a
build that does not have a native sdk target. I assume the 2nd patch
would break a native sdk, but I can't tell.

I can provide full build logs if you want.


Thanks,
Daniel

