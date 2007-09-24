Received: from [74.93.1.97] (helo=azazel.hughes-family.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <craig@gumstix.com>) id 1IZsrV-0000MG-U5
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Sep 2007 20:40:54 +0200
Received: from [192.168.1.107] (adsl-70-231-246-194.dsl.snfc21.sbcglobal.net
	[70.231.246.194])
	by azazel.hughes-family.org (Postfix) with ESMTP id BAD6F9D4B4;
	Mon, 24 Sep 2007 11:36:32 -0700 (PDT)
X-Habeas-Swe-9: mark in spam to <http://www.habeas.com/report/>.
X-Habeas-Swe-6: email in exchange for a license for this Habeas
X-Habeas-Swe-3: like Habeas SWE (tm)
Date: Mon, 24 Sep 2007 11:36:34 -0700
X-Habeas-Swe-8: Message (HCM) and not spam. Please report use of this
From: Craig Hughes <craig@gumstix.com>
X-Habeas-Swe-5: Sender Warranted Email (SWE) (tm). The sender of this
X-Habeas-Swe-2: brightly anticipated
In-Reply-To: <46F587F7.4060501@balister.org>
References: <46F587F7.4060501@balister.org>
To: openembedded-devel@lists.openembedded.org
X-Image-Url: http://www.hughes-family.org/craig/craig64.jpg
X-Habeas-Swe-7: warrant mark warrants that this is a Habeas Compliant
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Habeas-Swe-4: Copyright 2002 Habeas (tm) 
X-Habeas-Swe-1: winter into spring
Message-Id: <44EBF4F5-87CD-45B4-B24F-09BEDB948197@gumstix.com>
X-Mailer: Apple Mail (2.752.3)
Cc: openembedded-devel@openembedded.org
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 18:40:54 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

On Sep 22, 2007, at 2:24 PM, Philip Balister wrote:

> Recently, I've been spending some time thinking how people use OE  
> for building software. It seems like there are several groups of  
> people interested in and actually using OE for serious work (by  
> serious I mean, there is real money involved). At OEDEM, I would  
> like to see some discussion how the PE project can improve  
> interaction with outside developers and vendors.
>
> As an example, how should OE interact with the company that sells  
> gumstix? Currently, they have a copy of buildroot they use to  
> create software for their product. The buildroot solution is not a  
> perfect one for them, see:
>
> http://sourceforge.net/mailarchive/forum.php? 
> thread_name=65AAF154-3C05-4836-952B-E5FF2E40E34C% 
> 40ecs.soton.ac.uk&forum_name=gumstix-users
>
> Understanding that gumstix has a large customer base, how should  
> they use OE? I do not think a solution that has their customer base  
> working against .dev would be an improvement (stability wise) from  
> their "private" buildroot system. Also, the idea of adding that  
> entire user community to the oe-dev/user listservs would drown out  
> other, equally worthy lines of hardware.

My current plan is to do something similar (but more tightly meshed  
with upstream) to what we're doing with buildroot.  Actually, the  
buildroot we use has been more-or-less forked from the main one with  
not a lot of back-and-forth between ours and upstream for a while now  
because they've drifted so much over time.  My plan more specifically  
with OE is to create my own monotone repo which we'll point gumstix  
users/developer at.  We'll have a "org.gumstix.oe" branch in there  
which will be the recommended branch for gumstix folks to pull from.   
I (or anyone who wants to live through the pain) can always pull/ 
propagate/merge from org.openembedded.dev, and I'll do so over time  
into say a org.gumstix.dev; when stuff is stable enough, I'll then  
propagate it over to org.gumstix.oe which the users will then get.   
In theory, monotone will make this multi-branch, multi-repository  
approach somewhat manageable.  One downside with monotone appears to  
be that as the revision DB grows, it's really pretty painfully slow.   
Hopefully that won't get a lot worse if there are lots of these inter- 
branch updates going on.

I then also plan to set up a .ipkg repo with tons of stuff pre-built  
so folks can just download/install the binaries and not have to mess  
with compiling themselves at all, which is a big win vs buildroot.

> Anyway, this is what has started me thinking. What I would like to  
> do, is create a list of how people use OE, and what concerns they  
> have about interactions with outside development teams. Once we  
> have this list, then we can have a conversation about what we can  
> do to make things work well for all OE developers and users.

The one main high-level issue I've had so far with OE is the notion  
of "machine" vs "distro" vs "image", which doesn't cleanly overlap  
with the existing concepts we use for gumstix.  For gumstix, a  
machine is a motherboard (with varying amounts of flash storage) +  
some combo of daughtercards (not a fixed list of features).  Distro  
kinds of makes sense.  "image" kind of makes sense too, but has some  
problems where package selection overlaps with the concepts of  
"machine" which don't quite make sense in the gumstix situation.  I  
don't think these problems are insoluble though, and partly they're  
I'm sure just a matter of my own misunderstanding and lack of deep- 
sightedness on the situation.  For example, different "flavors" of  
gumstix verdex have different amounts of flash on them.  I'd like to  
have one "type this and it'll work" command for gumstix users where  
they can answer a minimal number of questions like "which  
motherboard?", "how much flash?", and "which daughtercards?" and then  
it'll go ahead and figure out which machine/image to build.

> Here are my preliminary thoughts:
>
> How do people use OE?
>
>  * Basic install image and user adds packages

Yes, our "factory image" will be OE generated.  We'll have a ipkg  
archive online for folks to be able to just grab and install pkgs.

>  * Install image that user does not change, part of a "product"

Yes.  Our factory image will work well enough for many people that  
they won't need extra pkgs.

> Why is it important work effectively with third party developers
>
>  * Enhance projects (both OE and third parties)
>  * Create jobs for OE devs (that want them)

Yeah, good luck with that :)  We're a poor, low-margin hardware  
company ;P  I wish we paid *ourselves*....

>  * Reduce friction
>  * Eliminate FUD
>
> Basic issues for third party users of OE to build systems:
>
>  * What is OE? A distribution, or a distribution creation tool?

I'm 95% certain at this point that I'm going to be building a  
"gumstix distro" on top of angstrom, ie import angstrom and modify  
some stuff to get a bit tighter on the specific hardware/software we  
want included/left out.  So it's kind of both a distro and a distro  
creation tool :)

>  * Need to build product with a stable base.

Definitely.  I think the way to do that cleanly-ish is to use the  
multi-repo/multi-branch features of monotone effectively.

>  * A way to keep proprietary content separate from OE.

Not a problem for us; we have nothing "proprietary".  Every line of  
code we write is "open".  There will always be content which isn't  
technically "proprietary" but which makes no sense outside of a  
gumstix (like say, our fbcon splash logo or something, or some of our  
default config files) which would fall in this category though probably.

>  * How do software developers use OE to write/debug code?

Right now actually, this part's pretty painful.  Figuring out a nice  
way to have the .bb patch-applicator interact nicely with quilt  
series files instead of having to copy/paste/sed~^~file://~;~ 
$~;patch=1~ is a real PITA.  I had a similar issue with buildroot  
which I basically fixed on the packages I care about by replacing  
their patch-applicator script with a call to quilt to apply my series  
files instead.  Then doing actual development is just a matter of  
cd'ing to the build directory, making changes using quilt, and then  
the build scripts are automagically updated via the magic of quilt.   
I haven't yet taken a look at what'd be involved in doing that within  
OE, but if anyone's tried, or looked at it, or has any pointers on  
where to start looking, lmk.

>  * What is the right way to support hardware?

The right way is y'all write all my code for me (for free, remember),  
and I go on vacation to Hawaii for a few months :)

> Issues for OE developers:
>
>  * Third parties need to feed bug fixes and new work into .dev.

An early issue I've had (partly due to my not understanding OE before  
starting to whack away at some code) is rapid drift between my  
codebase, my submitted patches, and what actually gets into .dev  
eventually.  This leads to a propagate/merge nightmare which is not  
made much easier by OE's habit of not telling you which file it's  
showing you the 3-way diff for if you're not working in a GUI  
enviroment but it's just launching vi to do the diff3's.  That  
probably just means I need to get used to running X all the time and  
using some graphical diff tool, but it's still annoying that the  
filenames are in a separate window from where the diff's showing.

>  * How to not overwhelm OE devs with support requests.

In the gumstix case, I'm thinking that the best way of dealing with  
this is to basically buffer .dev with org.gumstix.oe and  
org.gumstix.dev -- our  users will "not necessarily know" that  
they're using OE.  Our support wiki etc will mention that OE is under  
the hood, but it'll try and divert all support stuff to us first, not  
to openembedded.org; the danger here is that OE doesn't know what's  
going on with a big chunk of its (indirect) users, and pressure gets  
applied to effectively fork (this is what's basically happened with  
buildroot for us).  On the other hand, you guys really don't want  
7,000 gumstix users (some of whom have @aol.com email addresses and  
stuff) to start spamming the OE dev lists and bugtracker.

>  * How does OE scale to large numbers of users?

Well, I think there are going to be 2 questions here actually: How  
does OE scale, and how well does monotone scale.  I'm not sure  
monotone's ever had a project as large as OE with as many users pull/ 
sync'ing as it might face with the OE+gumstix combination of size +  
developer base.  Evidence so far shows that monotone might have some  
serious issues.  The concurrency-of-access one is the most  
noticeable, given how slow monotone repo ops are.  If one person is  
pull'ing and it takes 5 minutes to do so, and locks the DB so nobody  
else can pull at the same time, that's really really not going to  
work.  From my subversion logs for the gumstix buildroot, we get as  
many as 400-600 "svn update"/"svn checkout" operations per day, most  
of which are during office hours in the US.  The most-hit hours  
actually have over 100 in a single hour.  The most-hit minutes  
frequently get dozens and sometimes (rarely) even hundreds.  If those  
ops become mutually locked-out and take 5-10 minutes each now, it's  
going to seriously piss off quite a few of our customers/users.  Some  
of that traffic appears to be messed-up scripts trying to pull the  
whole repo lots of times in a single minute, but we actually deal  
with that not too badly today.  Getting DoS'd by those badly written  
scripts would be not good.

C


