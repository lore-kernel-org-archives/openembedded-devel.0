Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PhQUf-0007ho-B6
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 18:46:21 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PhQTu-0001wM-2X from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 09:45:34 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 24 Jan 2011 09:45:33 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 24 Jan 2011 10:45:32 -0700
Message-ID: <4D3DBABA.1080509@mentor.com>
Date: Mon, 24 Jan 2011 10:45:30 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>	<4D35FC8B.1090404@mentor.com>
	<ih52qr$l1v$1@dough.gmane.org>	<AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>	<AANLkTimHg3tkDnm93ycBGokAOsWomT6n+bfTduYPA=G+@mail.gmail.com>	<4D3B1F00.4040109@mentor.com>
	<AANLkTik7Ce9P79RB8d8Rh7uo4WZTYQmFAjbtbOVucuDg@mail.gmail.com>
In-Reply-To: <AANLkTik7Ce9P79RB8d8Rh7uo4WZTYQmFAjbtbOVucuDg@mail.gmail.com>
X-OriginalArrivalTime: 24 Jan 2011 17:45:32.0267 (UTC)
	FILETIME=[7F4EC3B0:01CBBBEE]
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
X-List-Received-Date: Mon, 24 Jan 2011 17:46:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2011 03:11 AM, Frans Meulenbroeks wrote:
> 2011/1/22 Tom Rini<tom_rini@mentor.com>:
[snip]
>> Here's what I worry about.  It shouldn't take an overly active maintainer
>> for most recipes.  Sure, some programs (and of course the toolchain) require
>> some care and knowledge.  But lots of things don't. I fear we're trying to
>> get to the point where if someone is going to submit a recipe for some
>> program they need to sign up to make sure it's always pointing to the most
>> up to date upstream and other mandates.  One of the strengths of OE today is
>> that it's not overly burdensome to submit changes back and have them
>> accepted.
>
> Tom, good points.
>
> We should not make it too difficult to submit recipes (but I would
> appreciate if submitted recipes adhere to some to-be-defined minimal
> set of QA rules).

That's fine, but again I want to point out that 95% of the time that 
means doing almost nothing special.

> But it would help to know if a recipe has an active maintainer or not.
> I think I would be more inclined to fix issues or update the recipe in
> case it is unmaintained.
> If a recipe is maintained, I would probably first see if the
> maintainer takes action (and trigger him/her). It also makes clear who
> to contact  if there is an issue. Now it is not always too clear who
> is working on what).

I have to disagree at least a little bit here.  I guess, if we're going 
to move towards more of a pull model we should try and move towards 
something like the kernel where yes, people submit changes (and not just 
bug reports) up along the chain.

> The issue is also that if you pick up a recipe that is (or seems)
> unmaintained and update it, and make a mistake there is always someone
> around the corner with some nasty remarks, making it not too
> interesting to work on these recipes.

So, OK.  Here's a problem.  I believe we must not make policy choices 
based on personality conflicts we're having within the community.  No, I 
don't know what we can do about this as I certainly see value in what 
everyone with write access is doing.  And No, I don't see killfiling 
people as a valid solution either.

> Wrt your coment on "submit changes back and have them accepted". I
> fear I see this not as a strength. The process is ok, but it does not
> work too well for those unmaintained recipes.
> Typically the unmaintained recipes are in some corner of OE and not
> many people care about those. So if you submit a patch to these, it is
> quite common to get no feedback at all.

And this is where I see people with general overall interest being in 
charge and applying stuff.

> A policy saying: submit patch, wait two weeks for feedback, if none
> given, send a ping, wait another two weeks still no feedback, does not
> work too well (but the scenario I sketchted happens too often.

I agree.  In fact, I wish more people felt empowered (or had the time) 
to say "this looks sane, applied".  But yes, this is also where that 
conflict sometimes comes into play.

> Now after this process I feel I can apply the patch (with 4 weeks
> delay, which seems quite a lot if the patch is small), but if the
> submitter has no commit rights it'll just land in patchwork waiting
> for someone to pick things up.
> Especially the latter scenario will cause that that person submitting
> the patch will give up after submitting one or two patches.
> Maybe I'm drawing a black scenario, but this is what I see happen.

I do agree that stuff isn't being applied quickly in some cases.

>>
>>>>
>>>> And yes, I have no problem in spending time to improve things, but if
>>>> there is no consensus on where we should go this is not going to be
>>>> effective (and actually makes it harder to improve quality wise).
>>>> To take the bikeshed analogy up again. It does not really help if
>>>> everyone start to paint in his own favourite color (unless maybe if
>>>> you are still stuck in the flower power era).
>>>>
>>>> Frans
>>>>
>>> I know it is fairly schizofrenic to reply on ones own post, but I just
>>> peeked into the meta-oe layer and found an excellent case on what we
>>> should try to avoid when bringing over recipes from oe to meta-oe.
>>> path: root/recipes-graphics/directfb
>>> Mode    Name    Size
>>> d---------      ++dfb   48      logplain
>>> -rw-r--r--      ++dfb_1.0.0.bb  588     logplain
>>> d---------      directfb-1.2.8  50      logplain
>>> d---------      directfb-1.4.6  41      logplain
>>> -rw-r--r--      directfb-examples_1.0.0.bb      406     logplain
>>> -rw-r--r--      directfb-examples_1.2.0.bb      409     logplain
>>> -rw-r--r--      directfb.inc    2038    logplain
>>> -rw-r--r--      directfb_1.4.6.bb       615     logplain
>>> d---------      files   415     logplain
>>> d---------      fusionsound-1.1.0+git20070709   54      logplain
>>> -rw-r--r--      fusionsound_1.1.0+git20070709.bb        1479    logplain
>>> -rw-r--r--      lite_0.9.26+cvs20070207.bb      1140    logplain
>>>
>>> Why is there a directfb-examples_1.0.0.bb? In OE no-one is pinning
>>> this version, and given the fact that these are examples there is
>>> probably little reason to keep it.
>>
>> They are example programs for directfb which also means they are handy demo
>> programs for "hey, is directfb working on my platform and looking right".
>
> I understand that. and I am not saying that the recipe should go. What
> I wanted to say is that if we have a 1.2.0 version (of a recipe for
> example progs) what is the point to keep also version1.0.0 around.
> It is unpinned so I see little reason to keep 1.0.0. Of course 1.2.0
> should be kept.

How much of a directfb person are you?  Dusting off some mental cobwebs 
here, but iirc, not everything one might want to do to show off directfb 
is ported up to the latest version.   ie you might well need 1.0.x in 
order to get the gtk+ (and then mozilla) stuff to the point where it 
does something now.  Yes, this probably isn't what everyone wants but 
it's useful in other cases.

>>> Something similar for directfb-1.2.8. Maybe I overlooked things but I
>>> could not find a the user of this dir. I guess it could be gone.
>>
>> I suppose it could be updated to 1.2.10, yes.  And directfb is enough by
>> itself, although it would be nice if we went and took a stab at making it an
>> option to use rather than X, when possible again.
>
> The issue at hand is that there is no recipe directfb 1.2.8 any more.
> We only have 1.4.6. However the patch files for 1.2.8 are still left,
> but there seem no users left of this dir.
> So basically unused files have been moved to meta-oe. I doubt that
> that is desirable.

Yeah, ok, a porting issue since mainline OE has 1.2.8 still.

>>> If we want to improve on quality it is probably not a bad idea to at
>>> least have a checklist with improvement actions that should be done
>>> when migrating recipes (e.g. remove stale patches, unused&    unpinned
>>> older versions etc etc). I know it takes time, but it can also
>>> increase the overall quality. Let's take that opportunity.
>>
>> OK, but what's wrong in this directory?  It's on known to work for someone
>> versions, I don't see legacy staging and iirc the pkg-config changes aren't
>> hacks but fixing upstream.
>
> As mentioned above there are files in it that are not used by any
> recipe, it contains a recipe that is probably better removed (the
> 1.0.0 version of the examples, keeping the 1.2.0 version as the sole
> version).
> I can also imagine the files dir could be renamed or split (I haven't
> really checked if the patches are for one recipe or shared, but I
> suspect the former).
> I did not peek into the recipes itself but I can imagine they could
> also be given a more standard layout (oe-stylize).
>
> Nothing dramatically, just some small changes that gives things a more
> constent look (both at the directory level and at the content level).
> I fee the move to meta-oe could be used to raise the bar a little bit.

OK, so your valid point here is that there's some work to bring it up to 
speed a bit more.  That's good and fine and I'll agree.  But the reason 
it's like this I imagine is that it's also really hard and not fun to 
have little to nothing building and trying to get everything perfect out 
of the gate isn't possible either.

> Wrt the LICENSE field and the recipe names (and your next post)..
> I was just coining an idea. I feel it is useful to have an indication
> why there are multiple versions of a recipe instead of one.
> Especially in the case of recipes that have no maintainer this seems
> useful information, as in that case someone who wants to change the
> recipe gets an idea why it is useful to fix the old recipe too.
> (the options for such a person are: fix old recipe too, if no one uses
> it, it is a waste of time, do not fix the recipe and leave a possibly
> broken recipe, or remove the old recipe and risk that there is a
> whiner who apparently does not care to fix the recipe, but does
> complain if someone does a best effort attempt to fix things.

I think this stems in part from another difference of opinion.  I say 
it's better to make a set of changes that've been not tested in every 
possible combination but tested in some / most cases.  So yes, you 
should always change all of the versions.  And say based on my 
libc-uclibc change be right about 85% of the time (which isn't as high 
as I would like sadly).  It's the dev branch and there's SCM.

> Encoding this in the name makes it very explicit what the reason is to
> have two versions and reduces the chance of errors.
>
> For gplv2/v3 LICENSE can be used, but that does not help if e.g. we
> want to keep an old version of foo because the footprint is much
> smaller.
> So either we need a different name, a comment in the recipe or a
> README like file describing the differences).

Changing the name introduces other overhead (like having to set 
PREFERRED_PROVIDERS) so yes, a comment (either in the file or where it's 
pinned) would be best.

> With LICENSE the chance is a little bit higher that someone accidently
> overlooks that that is the reason for having two versions. Name
> encoding makes it more visible.
> But if people feels relying only on LICENSE because otherwise the
> namespace becomes too cluttered, that is also fine with me.

Thanks :)

-- 
Tom Rini
Mentor Graphics Corporation


