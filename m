Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jutfw-0002A4-VO
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 20:20:05 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jutey-0003tx-Og
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 18:19:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 10 May 2008 18:19:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 10 May 2008 18:19:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 10 May 2008 20:18:49 +0200
Message-ID: <g04oua$cnm$1@ger.gmane.org>
References: <g049dg$2ks$1@ger.gmane.org>
	<20080510174005.GA28630@deadlock.dhs.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008042803)
In-Reply-To: <20080510174005.GA28630@deadlock.dhs.org>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 10 May 2008 18:20:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sergey 'Jin' Bostandzhyan wrote:
> Hi,
>
> On Sat, May 10, 2008 at 03:53:52PM +0200, Rolf Leggewie wrote:
>> I am concerned about the loss of reputation that OE is incurring because
>> the .stable guys are willfully ignoring the official bug tracker.  I
>> think it should be renamed back to angstrom$whateveritwasbefore.  We
>> can't seriously be telling guys all the time "report your problems to
>> the BTS" and then have the "official" stable branch completely and
>> willfully ignore it.  I'd go as far as requesting it should be denied
>> the org.openembedded.* namespace in monotone.
>>
>> http://thread.gmane.org/gmane.comp.handhelds.openembedded/18400/focus=18462
>>
>
> I've been following the threads on oe.stable and this leads to some questions:
>
> what is the "official" definition of the oe.stable branch?
>
> at first I had the impression that it is intended for product development
> (hence - stable), is this the case or was this a misconception?
>
> is there any point in submitting bugs to BTS vs. oe.stable (i.e. can at least
> some help regarding those bugs be expected)?

Yes, as has been said, the canonical place to submit bugs is the BTS. 
Just don't expect that patches will get applied without review on the 
mailinglist. We take "stable" seriously. Applying random shit just to 
keep bugs from being closed by an overzealous bugmaster is not taking 
"stable" seriously[2].

> is the stable branch actively maintained (well, the answer to this probably
> results from the anwer to the previous question)?

I do a build from scratch every week from the stable branch to see if it 
still builds and functions on the targets.  For the distro (angstrom 
2007) and targets (various arm and ppc boards) I'm pretty satisfied with 
the current status. Combine that with limited time to work on OE stuff, 
I have no real incentive to actively go looking for bugs (or fixes) 
outside my "area of testing". I suspect that's true for the other 
stablebranch maintainers as well.

> Please don't get me wrong, it is not my intention to get in the middle of the
> discussion about reversing names or whatever. I use OE for product development
> and I ultimately need to know what branch I should base my work on.

"stable" is a branch that has know issues and features an coupled with 
the review policy we try to avoid introducing regressions. So if your 
product is (nearly) ready for the market, it makes sense to use 
"stable". If you want things as packaged-staging or RPs toolchain 
improvements, you want .dev, but that may break anytime (it is broken 
for me atm. with the recent .lai uniqueness check. I like the check, 
just need to fix breakages associated with it (stupid EFL stuff)), and 
moves very quickly ("API and ABI unstable" in code speak).

> It would also be nice if the status of the branches gets clearly communicated
> once this discussion is over. I think it's important that people who do
>product dev know where to start and what to expect.

The status of the stable branch is still the same, so the top news item 
on http://www.openembedded.org is still valid and accurate. The 
mailinglist archive is also open to the public and have a real good 
signal/noise ratio.

>  Again, just to make it clear: my argument is not about usage of
> BTS/maintenance/naming/etc., it's about a clear communication on the status
> of things, so that people know what branch to choose.

I think more people should read the news on http://www.openembedded.org 
and spread less FUD, but that's just the cynic in me acting up. Also 
typing "oe stable branch" or "oe stablebranch" into google returns good 
info. People, it's not rocket science[1].


[1] Even if it is, it's just blowing stuff up and throwing it out the back.
[2] Nor making bugzilla more usefull. Closing bugs that haven't been 
fixed just because your lollypop got stolen actually decreases the value 
of bugzilla.



