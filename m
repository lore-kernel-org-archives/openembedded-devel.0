Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <saul.wold@intel.com>) id 1PQTPz-0000FZ-5p
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 00:27:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Dec 2010 15:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.59,318,1288594800"; d="scan'208";a="685290781"
Received: from unknown (HELO [10.255.13.4]) ([10.255.13.4])
	by orsmga001.jf.intel.com with ESMTP; 08 Dec 2010 15:25:38 -0800
Message-ID: <4D0013F1.3000607@intel.com>
Date: Wed, 08 Dec 2010 15:25:37 -0800
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
References: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>	<4CFD68A2.20408@intel.com>	<20101206225236.GD29253@denix.org>	<4CFD9E17.5070209@intel.com>
	<AANLkTikHxJ=4iWnx=-afTjj8Y6=qca2jv5y7yovqzAMe@mail.gmail.com>
In-Reply-To: <AANLkTikHxJ=4iWnx=-afTjj8Y6=qca2jv5y7yovqzAMe@mail.gmail.com>
X-SA-Exim-Connect-IP: 134.134.136.20
X-SA-Exim-Mail-From: saul.wold@intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [poky] libcdaudio license issue
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
X-List-Received-Date: Wed, 08 Dec 2010 23:27:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2010 01:23 AM, Frans Meulenbroeks wrote:
> Replying to 3 replies in this one
>
>
> 2010/12/7 Saul Wold<saul.wold@intel.com>:
>> On 12/06/2010 02:52 PM, Denys Dmytriyenko wrote:
>>>
>>> On Mon, Dec 06, 2010 at 02:50:10PM -0800, Saul Wold wrote:
>>>>
>>>> On 12/06/2010 11:48 AM, Frans Meulenbroeks wrote:
>>>>>
>>>>> I was checking libcdaudio for LICENSE info.
>>>>> recipe says GPL
>>>>> COPYING file is the GPLv2 one
>>>>> README file says:
>>>>>
>>>>> libcdaudio is distributed under the GNU Library General Public
>>>>> License, included in this package under the top level source directory
>>>>> in the file COPYING
>>>>>
>>>>> C files also mention LGPL. but say v2 or later
>>>>>
>>>>> What to do with this in the LICENSE field? LGPLv2+ ?
>>>>>
>>>> This seems reasonable, you should also include the header chunk in the
>>>> LIC_FILES_CHKSUM, you can specify start and end lines for the checksum.
>
> Yes, I'm aware of this. Would you want to add all the header chunks
> that state this, or only e.g. the most important one (assuming such a
> file can be identified)
> I've seen the text in different files.
>

I would suggest the most important one as mostly those headers would be 
the same. Picking something like a common header file or the file that 
contains main() would make sense.

> Also is poky planning to take this recipe? If not, it is kind-a
> pointless for me to update it, so I'd rather waste time on something
> else :-)

At this point I think the work you are doing is valuable but better 
suited to live in a layer.  The core is really targeted to be as generic 
as possible to allow for a broad variety of devices.

Richard recently suggested that a repo be created for such meta layers. 
We are working out the details on creating and opening up that repo.

Sau!

>>>
>>> Saul,
>>>
>>> We don't have this feature in OpenEmbedded yet... But it would be nice to
>>> port
>>> it from Poky though! :)
>
> Note that adding/using  LIC_FILES_CHKSUM in OE should be harmless as
> it is a var, which is not used.
> So if we wnat to move into that dir we might consider keeping the
> field in the OE recipes (currently for libaudio it is not there)
>>>
>> Denys, sorry I saw this via my poky email and did not notice it was OE also,
>> I will what what I cross post next time!
>
> The recipe is also in OE and of course suffers from the same issue.
> That's why I posted to both lists.
>>
>> Glad to hear that you like the idea!  We will have all Poky recipes
>> checksummed this week!
>
> Cool!
>
> Frans
>



