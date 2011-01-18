Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PfIU4-0004LN-Js
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 21:48:56 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PfITQ-0000JX-MR from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 12:48:16 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 18 Jan 2011 12:48:16 -0800
Received: from [172.30.80.246] ([172.30.80.246]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 18 Jan 2011 13:48:15 -0700
Message-ID: <4D35FC8B.1090404@mentor.com>
Date: Tue, 18 Jan 2011 13:48:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>
In-Reply-To: <ih4s84$gbj$1@dough.gmane.org>
X-OriginalArrivalTime: 18 Jan 2011 20:48:15.0199 (UTC)
	FILETIME=[073EEEF0:01CBB751]
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Tue, 18 Jan 2011 20:48:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2011 01:12 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-01-11 17:54, Tom Rini wrote:
>> On 01/18/2011 01:05 AM, Otavio Salvador wrote:
>>> On Tue, Jan 18, 2011 at 05:21, Graeme Gregory<dp@xora.org.uk>   wrote:
>>>> On 17/01/2011 19:01, Frans Meulenbroeks wrote:
>>>>> - where possible stick to one recipe per package. This reduces the
>>>>> maintenance work and reduces the QA nightmare of lots of different
>>>>> permutations.
>>>>> I feel one recipe per package should be the common case for
>>>>> applications, and preferably also for libs (although I am well aware
>>>>> that especially in the latter case multiple versions cannot always be
>>>>> avoided).
>>>>
>>>> OE is not a distro so this is a non starter already, please don't bog
>>>> down this discussion by re-opening this again. Angstrom 2008, Angstrom
>>>> 2010, kaelios and slugos are all released distributions with different
>>>> versions of apps just as a starter and they arent even near the total
>>>> number of distros in OE.
>>>
>>> I disagree. I think having too many versions of a package just makes
>>> difficult to get things done:
>>>
>>>    - it increases the amount of maintainence work;
>>>    - has a bigger time to get bugs spoted;
>>>
>>> Users of old distros ought to use a specific repository and branch.
>>> Master ought to be kept clean for 'next distro release'.
>>
>> I agree, at least going forward.  We must make it easier for
>> distributions to say "here is my 'stable' release" and "here is my
>> development release".
>>
>> First, I'm not picking on Angstrom here, really, I swear.  It's just a
>> good example.
>>
>> But we also don't want to be unreasonable or unbending here.  We'll have
>> to have multiple udevs (due to having different kernel versions as some
>> HW isn't on the latest and greatest).  And if DistroA says they really
>> want to stick to busybox 1.17.4 for a while, we should let that happen
>> too.  But I don't think we want to have to carry on the recipes that
>> angstrom-2008.1 wants and angstrom-2010.x wants and angstrom-2011.x
>> wants and angstrom-2012.x want into 2013, in master.
>
> And noone says you should. At some point 2010.x works well enough to
> force 2008.1 into hiding and start 201Y.x. The current situation where
> the "unstable" 2010.x ended up in a product is largely due to the gcc
> people breaking the NEON intrinsics interface API in between 4.3 and 4.5.

ick, I didn't know about that...

>> For example, at some point we want to switch to libtool 2.4 only.  And
>> that would certainly be a headache for angstrom-2008.1 (but we're glad,
>> really! for angstrom-2010.x using 2.4 and testing and fixing things). So
>> wouldn't it be a good thing to be able to say that if you want
>> angstrom-2008.1 you do ... this ... and get the layers that give a good
>> stable 2008.1, based on whatever policy Angstrom wants for doing updates?
>
> In the past the angstrom people created a stable branch and supported
> that for a given release. The same can be done in the layering script,
> where it would just lock down to certain revisions of various layers.

So, I think we agree.  Distros should be saying "if you want our stable 
release you should be over here..." and if you want our development WIP, 
you should be over here.

> But in the end if boils down to "Does OE wants to make life hard for
> DISTROs or easy". Frans is firmly in the "make it hard" camp, I hope
> others have a saner point of view.
>
> If you're forcing 90% of your users to put e.g. udev_162.bb in their
> layer you're doing it wrong. But you're also doing it wrong if you have
> 20 udev recipes :)

I think we also agree here.  But what's the rule of thumb(s) we want to 
have, to provide enough choice without too much headache?  As I said 
elsewhere, .inc files should probably be used a whole lot more, to help 
with the problem of recipe bugfixing and N recipes for an app with the 
problem.  We should probably also say that in addition to the "keep the 
last GPLv2+ version around" rule of thumb we should also have a "keep 
the latest stable release" around too.  But what else?  To use busybox 
as an example, do we really need to keep 1.18.0 and 1.18.1 around when 
we have 1.18.2?  How about if we make the delta between the 3 be just 
the SRC_URI + checksums?

-- 
Tom Rini
Mentor Graphics Corporation


