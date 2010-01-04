Received: from p3plsmtpa01-09.prod.phx3.secureserver.net ([72.167.82.89])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NReON-0000eD-DB
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 05:18:10 +0100
Received: (qmail 372 invoked from network); 4 Jan 2010 04:09:23 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-09.prod.phx3.secureserver.net (72.167.82.89) with ESMTP;
	04 Jan 2010 04:09:23 -0000
Message-ID: <4B4169E4.5080909@mwester.net>
Date: Sun, 03 Jan 2010 22:09:08 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>	<201001040357.33204.holger+oe@freyther.de>
	<op.u5zofpdimn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u5zofpdimn1qzu@guohr-laptop-ubuntu>
X-SA-Exim-Connect-IP: 72.167.82.89
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why we don't setup a buildbot for openembedded QA?
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
X-List-Received-Date: Mon, 04 Jan 2010 04:18:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Guo Hongruan wrote:
> 在 Mon, 04 Jan 2010 10:57:33 +0800，Holger Hans Peter Freyther
> <holger+oe@freyther.de> 写道:
> 
>> On Monday 04 January 2010 02:42:42 Guo Hongruan wrote:
>>> Hi guys,
>>>    I think we had better set up a continuous integration tool
>>> buildbot to
>>> automate the compile/test cycle required to validate changes to the
>>> project code base.
>>>
>>> It can help openembedded user to save time on failed building.
>>
>> You make one assumption. You assume that the user config is the same
>> as the
>> build slaves (this includes different host distros, host machine, target
>> machine, target distro and packages to be built).
> 
> Yes, you are right. it is impossible to cover every combinations.
> But I think it is better that nothing. We can classify the varioubles
> which affect the building and make a test plan. Of course, we can not
> make it perfect at the first time. But we can make it better and better.

To what end, though?

I suggest that there are only a small set of configurations that matter,
and for each of those, the maintainers should be running their own
buildbots, on hosts that they intend to support.  To test any other
combinations simply makes no sense; nobody is using them.

>>> Without buildbot, any volunteers can provide their available machine as
>>> buildslave and the continuous integration environment will be really
>>> scalable.
>>
>> This is not different from the tinderbox setup. On top of the buildbot
>> we do
>> get much more information about the build, including the log files of
>> each and
>> every task.
> 
> With buildbot, we can still use tinderbox to record every task and their
> log files. buildbot and tinderbot can work together smoothly.
> 
>>
>>
>> The basic problem is there are so many different possible
>> configurations that
>> they can not be tested with each commit. What can be done and is done
>> is that
>> the paths that are walked frequently will work better than the paths
>> that are
>> not walked as frequently. E.g. creating a new distribution will be a lot
>> harder than building Angstrom for the Beagleboard.
>>
> 
> If there are enough buildslavers, we can test most of different possible
> configurations with each commit. After all, it is distributed and can
> scale dynamically.
> 
>> Now what one should do if one is interested in a specific path is to
>> user the
>> tinderclient and regularily build, test (and fix) the path one is
>> interested
>> in. For me this includes the meta-toolchain-qte target.
>>
>>
>> The other is the tinderbox setup will soon gain a waterfall view and
>> then it
>> becomes a s social problem to fix the (selected) builds whenever they
>> break.

But, as we've seen already, people don't fix builds that nobody cares
about.  Everyone has enough to do of their own -- from my perspective I
see a small group of developers active with OE day-to-day who fix
problems and bugs for a small set of distros that they know are actively
being used.  To add more broken builds to the list will only result in
the active distros being drowned out, and the result will be that each
distro owner will end up tracking and fixing issues independently again.

> builtbot can also show a waterfail view and through periodic building,
> we can find the bug as early as possible. everyone can access the
> buildbot website to get to know which building failed and to get to know
> which how to reproduce the failed building. Throught tinderbox, it is
> difficutl to do that, for some developers build openembedded at their
> own branches, and tinderbox can not record the complete local
> modification and setting.

The tools are not the problem.  Time and motivation is the issue here -
people have time and motivation only to solve issues and problems that
are causing huge pain, or where a resolution will provide much benefit.
 Neither is true for stale distros, or for combinations of build hosts,
distros, and machines that nobody uses.

The best way, clearly, is for each person who values a particular
combination to set up a buildbot for that combination.  VMs and disk are
cheap.

-Mike (mwester)


