Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LTIHK-0007Vl-Eh
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 17:01:06 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LTI9i-00089U-PV
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 09:53:15 -0600
Message-ID: <498473E8.1010707@dls.net>
Date: Sat, 31 Jan 2009 09:53:12 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <97574E2A-03E4-421C-8C29-21A6556D4F7E@ngndg.com>
	<EE7737BC-A57D-402B-A4A5-6CB0271716C8@ngndg.com>
In-Reply-To: <EE7737BC-A57D-402B-A4A5-6CB0271716C8@ngndg.com>
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
X-List-Received-Date: Sat, 31 Jan 2009 16:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tim Ellis wrote:
>> Calm down, thanks. I authored 3.2.5 for use in foonas which NAiL
>> pushed for me originally, and created the 3.2.7 build with active
>> directory support also for foonas - I tested this on multiple arches
>> and libcs in my target distributions and they work fine. I had
>> presumed when I started working on stuff here that I could maintain my
>> packages as I see fit

No.  Once you add a package, it is available for others to use, and you
need to take into consideration that others may, in fact, be using it!

>> and have ensured the older samba versions have
>> not included this functionality 

What does that mean?  Are you saying that because you added 3.2.5 that
you feel entitled to remove it, and replace it with one that adds
significant additional dependencies?  So I should set my
PREFERRED_VERSION back to a 3.0.x version of Samba?  That's ridiculous.

>> - and I followed the dev guidelines on
>> the wiki and moved to the upgrade - was this wrong?

Yes.  Let me expound on the problem.

3.2.5 included a specific set of features, with a specific set of
dependencies.

There are many cases where additional features should be enabled in a
package -- and it is often the case that these additional features can
cause trouble for other distros or users, perhaps because they have
dependencies that may be unbuildable (as in this case), or perhaps the
dependencies are undesirable (dbus pulling in all of the X libs was such
a case, recently), or perhaps the dependencies are just too big (opkg
had that problem).

S*** happens -- people have to move forward.  But there's no need to
break it for an entire distro; simply leaving the original version
pre-additional-dependencies about is sufficient to avoid it.  And that's
what's happened here -- 3.2.7 won't build because the dependencies won't
configure.  Yet neither can I go back to the old working 3.2.5 --
because it was REMOVED!

I further suggest, after looking at krb a bit, that it might be wise to
create 3.2.7 as a feature-for-feature upgrade of 3.2.5, and have a
samba_with_extra_features_3.2.7.bb package that hauls in the extra
dependencies.  But historically speaking, in most of the previous cases,
the OE gods seem to prefer the other way around.  I'm ok with that -- I
have no particular pain with changing SlugOS to depend upon (for
example) "samba-nokrb" until the krb problem gets sorted.

But I can't easily do that in this case, because the refactoring work
removed 3.2.5 altogether, so I would have to play all sorts of fun games
with git to bring back an old copy in order to name it
"samba-nokrb_3.2.5.bb" or such.

>> Anyway here is what I had been thinking about previously as you are
>> right, the changes are significant; create a separate samba-ads build
>> this weekend and revert the changes to samba. I will do this at some
>> point this weekend. Sorry if updating my packages upsets you, if you
>> don't see AD client support as a worthy feature just dont use the new
>> package at the other side of the weekend.

Oh, I see the advantages of AD client support.  I love features, good stuff.

What I hate is when I finally have some free time, and find that the
autobuilders are broken and that instead of working on the distro's
priority list items, I end up having to spend that time sorting out
completely unrelated breakage.  Pardon me for being frustrated -- free
time is a precious commodity, and we're short a few developers it seems.

>> Please dont touch the samba
>> builds - I had presumed as the maintainer of this that other people
>> wouldn't mess with it.

I do not understand this line at all.  Your changes have broken the
autobuilder - I can no longer build samba.  And the way you changed it
has taken away my ability to simply use a "PREFERRED_VERSION" to select
the old, working version in the interim.  Given this untenable
situation, why would I or anyone else not be permitted to fix it?  For
example, we had a problem with busybox the other day -- Koen stepped in
with a very nice fix that resolved the issue nicely; nobody questioned
who "owned" busybox.bb?

Mike (mwester)


