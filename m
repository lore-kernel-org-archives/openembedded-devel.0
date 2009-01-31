Received: from [65.254.253.80] (helo=mailout10.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <SRS0=i4+37W=6D=ngndg.com=tim@yourhostingaccount.com>)
	id 1LTKbL-0001UL-L7; Sat, 31 Jan 2009 19:29:56 +0100
Received: from mailscan03.yourhostingaccount.com ([10.1.15.3]
	helo=mailscan03.yourhostingaccount.com)
	by mailout10.yourhostingaccount.com with esmtp (Exim)
	id 1LTKTk-0005nu-NN; Sat, 31 Jan 2009 13:22:04 -0500
Received: from impout03.yourhostingaccount.com ([10.1.55.3]
	helo=impout03.yourhostingaccount.com)
	by mailscan03.yourhostingaccount.com with esmtp (Exim)
	id 1LTKTk-0002nC-DY; Sat, 31 Jan 2009 13:22:04 -0500
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8])
	by impout03.yourhostingaccount.com with NO UCE
	id AJN41b0020ASqTN0000000; Sat, 31 Jan 2009 13:22:04 -0500
X-EN-OrigOutIP: 10.1.18.8
X-EN-IMPSID: AJN41b0020ASqTN0000000
Received: from 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
	([92.237.114.21] helo=[192.168.1.104])
	by authsmtp08.yourhostingaccount.com with esmtpa (Exim)
	id 1LTKTj-0003Mo-OP; Sat, 31 Jan 2009 13:22:04 -0500
Message-Id: <8145A528-65C8-4B2A-B7BB-D006779396B8@ngndg.com>
From: Tim Ellis <tim@ngndg.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <498473E8.1010707@dls.net>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Sat, 31 Jan 2009 18:22:00 +0000
References: <97574E2A-03E4-421C-8C29-21A6556D4F7E@ngndg.com>
	<EE7737BC-A57D-402B-A4A5-6CB0271716C8@ngndg.com>
	<498473E8.1010707@dls.net>
X-Mailer: Apple Mail (2.930.3)
X-EN-UserInfo: b8ae887d91300d60195f6ea73d56f3bc:43527cee0c82d0ab5dc2dc3726f6afdf
X-EN-AuthUser: tim@ngndg.com
Sender: Tim Ellis <tim@ngndg.com>
X-EN-OrigIP: 92.237.114.21
X-EN-OrigHost: 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
Cc: openembedded-devel@openembedded.org
Subject: Re: samba-3.2.5 missing
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
X-List-Received-Date: Sat, 31 Jan 2009 18:29:56 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


On 31 Jan 2009, at 15:53, Mike (mwester) wrote:

> Tim Ellis wrote:
>>> Calm down, thanks. I authored 3.2.5 for use in foonas which NAiL
>>> pushed for me originally, and created the 3.2.7 build with active
>>> directory support also for foonas - I tested this on multiple arches
>>> and libcs in my target distributions and they work fine. I had
>>> presumed when I started working on stuff here that I could  
>>> maintain my
>>> packages as I see fit
>
> No.  Once you add a package, it is available for others to use, and  
> you
> need to take into consideration that others may, in fact, be using it!


>>> and have ensured the older samba versions have
>>> not included this functionality
>
> What does that mean?  Are you saying that because you added 3.2.5 that
> you feel entitled to remove it, and replace it with one that adds
> significant additional dependencies?  So I should set my
> PREFERRED_VERSION back to a 3.0.x version of Samba?  That's  
> ridiculous.

>>> - and I followed the dev guidelines on
>>> the wiki and moved to the upgrade - was this wrong?
>
> Yes.  Let me expound on the problem.
>
> 3.2.5 included a specific set of features, with a specific set of
> dependencies.
>
> There are many cases where additional features should be enabled in a
> package -- and it is often the case that these additional features can
> cause trouble for other distros or users, perhaps because they have
> dependencies that may be unbuildable (as in this case), or perhaps the
> dependencies are undesirable (dbus pulling in all of the X libs was  
> such
> a case, recently), or perhaps the dependencies are just too big (opkg
> had that problem).
>
> S*** happens -- people have to move forward.  But there's no need to
> break it for an entire distro; simply leaving the original version
> pre-additional-dependencies about is sufficient to avoid it.  And  
> that's
> what's happened here -- 3.2.7 won't build because the dependencies  
> won't
> configure.  Yet neither can I go back to the old working 3.2.5 --
> because it was REMOVED!
>
> I further suggest, after looking at krb a bit, that it might be wise  
> to
> create 3.2.7 as a feature-for-feature upgrade of 3.2.5, and have a
> samba_with_extra_features_3.2.7.bb package that hauls in the extra
> dependencies.  But historically speaking, in most of the previous  
> cases,
> the OE gods seem to prefer the other way around.  I'm ok with that  
> -- I
> have no particular pain with changing SlugOS to depend upon (for
> example) "samba-nokrb" until the krb problem gets sorted.
>
> But I can't easily do that in this case, because the refactoring work
> removed 3.2.5 altogether, so I would have to play all sorts of fun  
> games
> with git to bring back an old copy in order to name it
> "samba-nokrb_3.2.5.bb" or such.
>

I read all the OE policies before starting here so as not have issues,  
including this one:

http://wiki.openembedded.net/index.php/Upgrading_Packages

If this is incorrect maybe a core dev can update it. I've been trying  
to stick to all the OE policies, and because this page is wrong this  
has now caused an issue.

Is it right that you will want every single point release of samba I  
add then? Keeping the most recent of each major version is fair  
enough, as well as any packages that are preferred by distros.  
Hoarding every single version ever is pointless and just creates extra  
cruft in OE no-one is going to use and will lead to lots of duplicate  
stuff and retained packages with security issues and bugs.

I checked before the commit and no-one preferred this version in any  
distro. I had presumed again that since no distribution in dev  
actually prefers 3.2.5 that a minor version increment with mostly just  
security and bug fixes would be moved to. Also, I can't tell if  
someone has set a PREFERRED_VERSION in their local copy.

Ultimately adding and retaining every single point release going  
forward is going to create unnecessary mess and make it more of a pain  
to maintain. Where does it end? I guess at some point it will have to.  
I will however take your comments on board and not remove insecure  
buggy point releases of the same major version in the future.

>>> Anyway here is what I had been thinking about previously as you are
>>> right, the changes are significant; create a separate samba-ads  
>>> build
>>> this weekend and revert the changes to samba. I will do this at some
>>> point this weekend. Sorry if updating my packages upsets you, if you
>>> don't see AD client support as a worthy feature just dont use the  
>>> new
>>> package at the other side of the weekend.
>
> Oh, I see the advantages of AD client support.  I love features,  
> good stuff.
>
> What I hate is when I finally have some free time, and find that the
> autobuilders are broken and that instead of working on the distro's
> priority list items, I end up having to spend that time sorting out
> completely unrelated breakage.  Pardon me for being frustrated -- free
> time is a precious commodity, and we're short a few developers it  
> seems.


>>> Please dont touch the samba
>>> builds - I had presumed as the maintainer of this that other people
>>> wouldn't mess with it.
>
> I do not understand this line at all.  Your changes have broken the
> autobuilder - I can no longer build samba.  And the way you changed it
> has taken away my ability to simply use a "PREFERRED_VERSION" to  
> select
> the old, working version in the interim.  Given this untenable
> situation, why would I or anyone else not be permitted to fix it?  For
> example, we had a problem with busybox the other day -- Koen stepped  
> in
> with a very nice fix that resolved the issue nicely; nobody questioned
> who "owned" busybox.bb?


I hope you can see from the autobuilder logs I tested my changes  
thoroughly on multiple platforms/libcs before the 3.2.7 push - I'm  
happy to try and recreate this issue if you tell me what distro you  
are working with as it works for all the distros I tried it on,  
however this is a dev branch right? Occasional breakage happens  
sometimes, despite best efforts. I hope you can see the benefit in the  
samba cleanup as it was very messy and repetitive before.

Again this stems from the guidelines in the wiki (New_Dev 3) - it  
looked pretty much like you were just going to push your changes  
without allowing time for discussion or consideration for the recent  
samba cleanup and you were clearly unsure in your irresponsible  
sounding first email "I'm going to re-create samba-3.2.5 as best as I  
can (it's way late,
maybe I'll screw it up and nobody's builds will work, who knows". I  
hope you can see I've pretty much been trying to stick with the wiki  
guidelines to try and not create issues - I expect to be given the  
same consideration or whats the point in having rules/guidelines at all?

I will probably be able to push changes discussed at some point today,  
but after I'm happy they are all working. Normally if I get a blocker  
I would try and talk to the maintainer and remove the package until  
its fixed - I suggest you do that unless you are testing samba.

Thanks,

Tim


