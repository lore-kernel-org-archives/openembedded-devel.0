Received: from smtpauth03.prod.mesa1.secureserver.net ([64.202.165.183])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1Oj2Zh-0004VQ-Gk
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 06:05:59 +0200
Received: (qmail 32419 invoked from network); 11 Aug 2010 03:59:03 -0000
Received: from unknown (209.242.7.184)
	by smtpauth03.prod.mesa1.secureserver.net (64.202.165.183) with ESMTP;
	11 Aug 2010 03:59:03 -0000
Message-ID: <4C62200C.8070702@mwester.net>
Date: Tue, 10 Aug 2010 22:59:08 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
	<AANLkTin83G-uHv8oC1P0eQSxwddzAx406wjYV5jSqoZG@mail.gmail.com>
In-Reply-To: <AANLkTin83G-uHv8oC1P0eQSxwddzAx406wjYV5jSqoZG@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.183
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 04:05:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/8/10 Graham Gower <graham.gower@gmail.com>:
>> On 10 August 2010 04:31, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>>> 2010/8/9 Chris Larson <clarson@kergoth.com>:
>>>> On Mon, Aug 9, 2010 at 6:26 AM, Hauser, Wolfgang (external) <
>>>> Wolfgang.Hauser.external@eads.com> wrote:
> 
>>>> PREFERRED_VERSION_<package>_local = "xxx" is how you use the override.
>>> The real solution woud be to either temporary store the
>>> PREFERRED_VERSION and apply it later on.
>>> Alternately we could parse local.conf twice, the first time ignoring
>>> the PREFERRED lines, and the 2nd time only looking at these.
>>> Yet another solution could be to split local.conf into two pieces, one
>>> with settings like MACHINE and DISTRO, the other one with the
>>> overrides.
>> Wouldn't it be far simpler to fix the distro conf file(s)? E.g. apply
>> something like this:
>> s/^PREFERRED_VERSION_\([a-z]*\) =/PREFERRED_VERSION_\1 ?=/
> 
> Yeah.
> Didn't really think about that one, but if distro's want to change and
> adhere to it, that would be the simplest solution
> Machines that pin something should probably also use weak binding.
> Conceptually it is probably marginally less desirable than a solution
> where local.conf has *always* control.
> 
> What do the distro's think about this?

I think it is the decision of EACH DISTRO to make, and not something to
be dictated by OE in general.

Mind you, I appreciate the general recommendation -- it's a sound idea
to make it so that a knowledgeable developer's local.conf overrides most
distro preferred version settings.  I use the technique frequently.

But on the other hand, I appreciate the ability to lock down some
preferred versions where I feel that it simply doesn't make sense to let
local.conf override.  For example, there's usually a LOT more to
changing the kernel version for SlugOS than just setting
PREFERRED_VERSION.  By the time a developer has figured out OE well
enough so they can find the distro conf files and understand how they
work, then I expect they also understand what extra stuff they need to
do for the kernel as well.  (Not to mention that I could - and should -
add some comments in the distro conf file to explain how that all works,
which is something I can't do in a generic local.conf file quite so well.)

It's a trivial point; if the community wants to begin to dictate such
little nuances to distros, it's not important enough to me to argue.
But you asked what the distros think, so I answered. :)

-Mike (mwester)


