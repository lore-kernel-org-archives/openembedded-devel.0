Received: from [64.18.0.26] (helo=exprod5og113.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1LerzL-00064Z-Mv
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 15:22:24 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob113.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSa6NoJ5fyN06XWM/8Qias5TKyLE1TaWg@postini.com;
	Wed, 04 Mar 2009 06:18:12 PST
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip06.e2k.ad.ge.com with ESMTP; 04 Mar 2009 09:17:51 -0500
Received: from ind-3n4b83jh1.amer.consind.ge.com (HELO [192.168.219.128])
	([3.138.54.81])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 04 Mar 2009 09:17:46 -0500
Message-ID: <49AE8DAC.30504@gefanuc.com>
Date: Wed, 04 Mar 2009 14:18:20 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
Organization: GE Fanuc Intelligent Platforms Ltd.
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>	<1236119119.10602.62.camel@andromeda>	<49ADB183.5070709@balister.org>	<1236120999.10602.70.camel@andromeda>	<49AE5117.5020806@gefanuc.com>
	<golk8b$52t$1@ger.gmane.org>
In-Reply-To: <golk8b$52t$1@ger.gmane.org>
Cc: no2spam@nospam.arcornews.de
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Wed, 04 Mar 2009 14:22:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 04-03-09 10:59, Martyn Welch wrote:
>> Michael 'Mickey' Lauer wrote:
>>> Am Dienstag, den 03.03.2009, 17:38 -0500 schrieb Philip Balister:
>>>> Michael 'Mickey' Lauer wrote:
>>>>> Am Dienstag, den 03.03.2009, 21:49 +0100 schrieb GIT User account:
>>>>>> Module: openembedded.git
>>>>>> Branch: org.openembedded.dev
>>>>>> Commit: eee859a9c348871d6d644ece76bc57b151cc80e8
>>>>>> URL:
>>>>>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=eee859a9c348871d6d644ece76bc57b151cc80e8 
>>>>>>
>>>>>>
>>>>>>
>>>>>> Author: Koen Kooi <koen@openembedded.org>
>>>>>> Date: Tue Mar 3 21:47:57 2009 +0100
>>>>>>
>>>>>> angstrom 2009.X: bump automake-native to 1.10.2 since some idiot
>>>>>> deleted 1.10
>>>>> Ah, are we in that mood again? Take more pills.
>>>> We need to have a serious discussion about deleting recipes. I know
>>>> the deletion of python 2.5 will force me to address the 2.5->2.6
>>>> upgrade in gnuradio before the upstream developers are ready.
>>>>
>>>> We need a way to remove recipes, but doing it as part of adding a new
>>>> recipe is causing problems for OE users.
>>>
>>> Yes, we need to have a serious discussion about lots of things
>>> surrounding the OpenEmbedded project, before the popularity kills the
>>> project. Judging from the amount of interest though, I don't see that
>>> happening -- neither short term nor long term.
>>>
>>
>> Ok, so if a serious discussion is out of the question, lets just have a
>> normal discussion.
>>
>> I see this issue to be partially related to the on going discussions
>> regarding submissions. I assume that the "Commit_Policy"[1] on the wiki
>> is either unofficial, out-of-date or optional as it states:
>>
>> * Changes to core toolchain components need review (gcc, binutils,
>> libtool, pkgconfig, automake, autoconf etc.)
>>
>> Where:
>>
>> "Review" is defined as posting it on the mailing lists and getting
>> positive agreement from two or more core developers.
>> Now a quick check of my OpenEmbedded mail folder doesn't chuck up any
>> messages with automake in the title that have a patch with this commit.
>> Maybe I'm looking on the wrong mailing list.
> 
> I haven't seen anything like that either, and upgrading automake *did* 
> break, since a lot of apps now do 'install -s' which calls host strip :(
> This is exactly why we did extensive testing the last time we touched 
> automake.
> 

TBH, I think that the commit policy seems to have evolved over time to include a number of tips as well as policies.

Rolf: it seems that you are the maintainer of this part of the wiki. Would you please consider the following version which I have re-ordered to try and bring greater clarity to what requires a review, what requires the consultation of the maintainer or interested party and what are tips rather than policy?:

----

Making changes to the core infrastructure can impact many other users and
developers. Whilst we don't want to discourage people hacking on and improving
the core infrastructure, more care is needed in those areas compared to recipes
with no dependants.

Above all else, commits are based on a gentleman's agreement. The following
rules are not hard fast rules and the changes a developer is allowed to commit
without review will depend on their experience. Anyone found to be committing
inappropriate changes could have their access to the repository revoked (at 
the discression of the core team).

More draconian review and commit policies may exist for topic branches, such as
the stable branch. Should these policies exist, they should be documented in a
README file in the root of the branch or a link provided in the README to the
location of the policies.

Developers without commit access should post their changes as patches to the
OpenEmbedded Developer mailing list (openembedded-devel@openembedded.org).

The following changes require a review:

  * Changes to class files (classes/*)
  * Changes to global .conf files (e.g. bitbake.conf)
  * Changes to core toolchain components (gcc, binutils, 
    libtool, pkgconfig, automake, autoconf, etc.)

A "review" is defined as posting the proposed change as a patch to the
OpenEmbedded Developer mailing list (OpenEmbedded-Devel) and receiving agreement
from two or more core developers.

Where present, the apropriate maintainer should be consulted before the
following changes are made:

  * Machine configs (machine maintainer)
  * Distro configs (distribution maintainer)
  * Recipes (recipe maintainer)

It's fine to fix a recipe you don't maintain, however an attempt should be made
to contact anyone else actively maintaining that recipe (the git logs show when
and who made changes to the file in question). Try to contact the maintainer, if
contact details can not be found (see MAINTAINERS), send a note to the
OpenEmbedded Developer mailing list. 

Please try to comply with the following rules when committing changes to
OpenEmbedded:

  * Split your changes into their logical subparts. It's easier to track down
    problems afterwards when developers have stuck to the "one change, one
    patch" approach. This also makes it possible to cherrypick suitable changes
    into other branches (such as a stable branch).

  * Provide a clear commit message (see the [[commit log example|example]]):
     - The first line of commit is a summary of the changes and start with the
       name of the affected recipe.
     - Provide concise details of the change made and it's affect as
       appropriate.
     - If appropriate, mention the bug number(s) that the patch resolves.
     - Give credit where credit is due. If you commit someone else's work more
       or less verbatim, you should use ''git commit --author $mail-of-author''.
       If pulling changes from somewhere like Poky or OpenMoko there is no
       problem with that but mention where the changes came from.
     - Include a Signed-off-by: line to provide the commit with a valid
       certificate of origin [http://lwn.net/Articles/139916/ as per the Linux kernel]

Other tips for making good commits:

  * Think twice before using an override, usually overrides can be 
    avoided, especially ones like this:
 
      do_compile() {
          oe_runmake
      } 
 
      do_compile_myfirstdisto() {
          oe_runmake -D_GNU_SOURCE
      }
 
    In 99% of the cases your fix will resolve issues in other distros rather
    than breaking them. An override will only resolve the issue for a subset of
    users, forcing others to duplicate the effort of resolving the problem.  

    If an override is really needed, its probably useful to document why its
    been added and why most people wouldn't want to use it.

  * If working in your own branch, sync early, sync often. Nobody likes to
    reinvent the wheel. Merging is easy with git, so don't hesitate to run sync
    just before your plane takes off and your wifi gets disconnected.


-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 729849476


