Received: from [68.230.241.14] (helo=fed1rmpop110.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LDm2D-0000iy-LF
	for openembedded-devel@openembedded.org; Fri, 19 Dec 2008 21:33:22 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081219200303.QCHK12838.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 19 Dec 2008 15:03:03 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id t8301a0071E665w04830ZB; Fri, 19 Dec 2008 15:03:02 -0500
X-Authority-Analysis: v=1.0 c=1 a=1m_oifkihzenxza1RgcA:9
	a=IH-vff-yNWfZU9CogL_GXWpPf9sA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 19 Dec 2008 13:03:19 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081219200318.GZ4287@smtp.west.cox.net>
References: <20081218071901.GB2135@buddha.tw.openmoko.com>
	<20081218150517.GI2135@buddha.tw.openmoko.com>
	<gidpuk$29d$1@ger.gmane.org>
	<1229619255.9166.66.camel@mill.internal.reciva.com>
	<gie3e0$6th$1@ger.gmane.org>
	<20081219053858.GQ2135@buddha.tw.openmoko.com>
	<494B7C10.8090407@xora.org.uk>
	<ae9c9a1c0812191146w57c68982vbdaf345e833a0710@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ae9c9a1c0812191146w57c68982vbdaf345e833a0710@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: openmoko-merges
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
X-List-Received-Date: Fri, 19 Dec 2008 20:33:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 19, 2008 at 04:46:03PM -0300, Ricardo Salveti de Araujo wrote:
> On Fri, Dec 19, 2008 at 7:48 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> > John Lee wrote:
> >> I'll keep working on the fastboot branch (need the help of original
> >> author on this one.  since this will become general changes, it's not
> >> going to be easy), and reorganize the om-merge branch a bit.  Is this
> >> the first time of such a big merge ?  I think Graeme and I both did
> >> some merge back before, but this one seems to be bigger...
> >>
> > I used to use a process similar to what koen suggested where I would
> > only merge back into OE the final changes to a .bb not all the
> > mistakes/fuckups/typos that got us to that result. Then evaluate each
> > change on its own to judge its level of controversy.
> 
> Yep, this is something I was thinking about this week, where I decided
> to reorganize the Mamona patches to merge it back to OE.
> 
> Merging related modifications in just one patch helps a lot to review
> the code and also to merge it upstream, the bad part is that we lose
> all the history behind those patches. Adding a message telling that
> the patch came from Mamona helps this issue, as the user could see it
> at the Mamona own repository, but still don't know what's the
> preferred way.
> 
> What are your suggestions? Should I create branches and rebase Mamona
> repo to do the merge with all the history or just merging related
> commits in one is enough (also with branches and review)?

IMHO, a lot of history is worthless sometimes.  The important things to
encapsulate from a big history are the tricky things that you should
comment on, or elaborate on in the final commit message (We had to do
... because ...).  So long as the hard to get right / complex / etc bits
are explained, you don't need 10 commits showing how it was almost
right, you just need the correct solution explained.

-- 
Tom Rini


