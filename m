Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JZ4kx-0001oo-KB
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 14:43:11 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JZ4j2-0004uC-2Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 08:41:04 -0500
Message-ID: <47D68C67.1010306@dls.net>
Date: Tue, 11 Mar 2008 08:43:03 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org> <47D64717.3050804@gmail.com>
	<20080311113256.461ad5d1@widy.localdomain>
In-Reply-To: <20080311113256.461ad5d1@widy.localdomain>
X-SA-Exim-Connect-IP: 216.145.245.199
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2008 13:43:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Hello,
> 
> On Tue, 11 Mar 2008 09:47:19 +0100
> Esben Haabendal <EsbenHaabendal@gmail.com> wrote:
> 
> []
> 
>>> comments? agreement?
>>>   
>> Without going into the specifics of the SCM tools discussion, I would
>> just like to say that I would REALLY REALLY love to see branches being
>> used actively in OE development, 
> 
> Oh really? Because I would think that loving to see them makes little
> sense. It makes sense only to use them. And who will use them?
> Because if people wanted to use them, they would do that already.
> Actually, people who want, do.

Hogwash!  It is true that there are a set of people who do not and will 
not use SCM tools.  However, there are numerous others, right here on 
this list, who have *attempted* to use that abomination known as "mtn" 
and discovered that branching with mtn is easy, but merging anything 
"real" is an absolute nightmare.  I will not go into the specific list, 
but merging with mtn is a "cross your fingers and pray" experience.

This is made worse by the fact that there is no culture around mtn. 
Hence there's no sense of "mtn is goodness" as there is developing 
around git.  That's important.  Perhaps not for you, but for many others 
the community help and wisdom around git that's lacking for mtn is what 
will make using branches practical and make merges sucessful.

>> especially for feature development
>> (such as sysroot, packaged-staging, and so on) and for release
>> engineering.
>>
>> For OE to really reach it's potential we have to be able add even more
>> features while at the same time delivering stable releases/branches
>> for distro and product developers to work from.
>>
>> When Joe-average-embedded-product-developer comes along, shopping for
>> which embedded Linux tool to use for his embedded product, he really
>> should be able to checkout a stable version of OE and be able to
>> build a toolchain and a simple image for all supported targets. And
>> this is certainly not the situation right now.
> 
> Typical mistake. There's stable branch in OE, and based on the
> experience with the previous branches, best-practices change control
> procedure was applied to it. Now, based on 2.5 month existence of that
> branch, I have following observations:
> 
> 1. People don't know about that branch.
> 2. Once made known, people still pretend that there's none, and
> continue to complain about stability.
> 3. Most of the rest of people don't put slightest effort into
> maintenance of that branch.
> 4. Those who try, complain that the change control procedure is ...
> complex! But it is only a separate branch + pre-review of changes + "all
> changes are merged from main branch" rule of thumb.

The issue is *not* the stable branch; the issue is that individual 
developers cannot reasonably go off an work on a branch, merge when they 
are satisified, and expect that it will just work.  This is NOT about 
the stable branch.

> 
> Having more branches is not going to help with this at all. 

Quite wrong!  Unstable broken stuff happens in .dev because developers 
dare not venture into the dark horrors of mtn to make their 
destabilizing changes in isolation on a private branch.

>> /Esben
> 
> []
> 

Mike (mwester)


