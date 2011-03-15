Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzWb2-0002Wv-To
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 16:55:45 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PzWZP-00070E-8c from Tom_Rini@mentor.com ;
	Tue, 15 Mar 2011 08:54:03 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Mar 2011 08:53:47 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 15 Mar 2011 08:54:02 -0700
Message-ID: <4D7F8B8A.2040501@mentor.com>
Date: Tue, 15 Mar 2011 08:53:46 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D7E3B34.5050100@mentor.com>	<AANLkTikqSLJd90dhRx8NwoEb37B-ZSQ4NcfKe_vVXpm2@mail.gmail.com>	<20110314163639.GA3375@jama.jama.net>	<AANLkTi=VL3kWZwKnzEao5iDUEA_F_-fMkx=m0astpSG3@mail.gmail.com>	<4D7EA326.2000902@mentor.com>
	<AANLkTimjL1ohV7vMkG=2WMVZqC-vH+NNndjGi+K49k4P@mail.gmail.com>
In-Reply-To: <AANLkTimjL1ohV7vMkG=2WMVZqC-vH+NNndjGi+K49k4P@mail.gmail.com>
X-OriginalArrivalTime: 15 Mar 2011 15:53:47.0537 (UTC)
	FILETIME=[2BA1A810:01CBE329]
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Tue, 15 Mar 2011 15:55:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2011 02:38 AM, Frans Meulenbroeks wrote:
> Tom, thanks for the reply.
>
> 2011/3/15 Tom Rini<tom_rini@mentor.com>:
>> On 03/14/2011 11:52 AM, Frans Meulenbroeks wrote:
>>>
>
> [cut out large part of text]
>
>>> Overall this seems like a fine proposal to me. Thanks a lot for drafting
>>> it.
>>>
>>> There are a few minor suggestions I would like to make.
>>>
>>> First is to define which components are considered to be critical, as
>>> for what is non-critical for one person might be critical for someone
>>> else.
>>> Leaving this open is bound to lead to discussion and disagreement
>>> later on, perhaps better be clear about it upfront.
>>
>> We see that as outside of the scope of this policy but I agree it needs to
>> be settled up, at least as a starting point sooner rather than later.  So
>> that we don't forget, please ask us to put this on the agenda.
>
> I agree that that is outside the policy (but within the TSC domain).
> I'll bring it up when I see the agenda.
> Note that I am quite busy tomorrow so it might be (my) thursday
> morning before I get to that.

Thanks.

>>> Second is the location of deprecated recipes.
>>> As far as I know we haven't clearly defined what goes into meta-oe.
>>
>> Well, that's up to OE at large, including how it's run.  We're just setting
>> out how the core should work right now.
>
> I understand, but as said before this is also a topic for the TSC

One more agenda topic :)

>>> I have assumed that this is one layer that will (also) contain recipes
>>> that are not part of oe-core.For example a recipe for a UPnP server or
>>> a CD recording program.
>>
>> Correct.  We expect meta-oe to continue to hold things that are not
>> essential but are useful and not distribution specific.
>>
>>> Mixing deprecated oe-core and mainline non-core recipes in the same
>>> tree will probably lead to confusion and perhaps even to people trying
>>> to upgrade deprecated recipes in meta-oe.
>>
>> Why?  If meta-oe doesn't need something that's deprecated in the core it
>> shouldn't take it on.  If it does need something deprecated, we should try
>> and figure out what can be done about that in order to fix that, or live
>> with it (which is to say, if package A depends on package B no newer than
>> version 2.0 and package B is now up to 3.2, is package A something that's
>> really worth keeping?  Or should it perhaps go away?
>
> Well there are two things I like to avoid.
> First one is someone seeing a deprecated OE-core recipe in meta-oe.
> Say this recipe is at 1.X. The person seeing this knows that upstream
> is at 1.Y (Y>  X), but is not aware that this recipe (and maybe 1.Y)
> is in oe-core and starts to work at it.
> Only later (e.g. when submitting changes) (s)he learns that actually
> the newer version is in OE-core, and that all the work is wasted
> timel. This is not an encouraging experience).
> I think it would help if people are alerted that a newer version
> exists in oe-core)

I don't see this happening as you don't use meta-oe by itself but 
oe-core + meta-oe (+ possibly more).

> The second one is that we have many versions of the same recipe and no
> one really cares or maintains these old versions. (if they are
> maintained and used I have no objections against multiple versions,
> but I am somewhat allergic to recipes that are kinda orphaned and
> sometimes do not even build).

Right.  The default case isn't "throw it in meta-oe" when there's a new 
version but "is someone volunteering to take this into meta-oe because 
they need it".

> Btw that raises the following question: if a distro wants to pin (for
> whatever reason) a certain recipe, but that version is not really
> needed by other packages or so, does it still live in meta-oe? or
> should it then eventually move into a distro specific overlay? I'm
> especially thinking about distro's that are not too active in updating
> their pinnings

It's up to however meta-oe wants to run things.  It sounds like the 
desire is that if people are active and things work, it's fine to have 
things in meta-oe.

>>> In order to avoid that confusion is is probably better to give the
>>> deprecated oe-core recipes their own layer (e.g. old-oe-core).
>>
>> If something isn't needed, we don't want to have to carry it anywhere other
>> than in the scm history.  If it's needed, it should be somewhere active so
>> it can be used.  We can re-evaluate this at a later point in time if it's
>> not working, but we discussed this and that was our conclusion (that's my
>> recollection at least, the log can be checked over if needed).
>
> I'm not sure if I saw the last log.
> Key in your remark is what defines "needed".
> Also what I often see is that things are needed, but after a while
> become unneeded and become somewhat orphaned.

So, using a recent example.  policykit dropped needing eggdus build. 
And if we had (we didn't for various reasons) dropped the older versions 
and nothing else needed eggdbus, it too should have been brought up to 
the ML for removal.

But, no policy will be perfect in keeping the metadata from having no 
out of date / unused recipes and I'm sure we'll still run into "tried X, 
it didn't work and turns out to be real old and unmaintained."

>>> Apart from the above I feel it would be good if the TSC would discuss
>>> the location of OE recipes that are non-core, and also draft a
>>> retention policy for that location.
>>
>>> This might of course be similar or identical to the oe-core one.
>>
>> So that we don't forget, please reply to the next TSC meeting agenda (which
>> should be sent out sometime Wednesday, iirc) and it'll get put on the list.
>
> will do.

Thanks again. :)

-- 
Tom Rini
Mentor Graphics Corporation


