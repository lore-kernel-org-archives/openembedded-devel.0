Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Oekzt-0008Bd-8U
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:31:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 3D08EA5A3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 09:30:58 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id qjlL2ESAxMBG
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 09:30:57 +0100 (BST)
Received: from [192.168.1.119] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id C8D4AA5AEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 09:30:56 +0100 (BST)
Message-ID: <4C528DC6.9060408@xora.org.uk>
Date: Fri, 30 Jul 2010 09:31:02 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Lightning/1.0b2 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>	<i2rik7$ds1$1@dough.gmane.org>	<4C516EF8.3080804@balister.org>	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
	<i2u23e$97d$1@dough.gmane.org>
In-Reply-To: <i2u23e$97d$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Fri, 30 Jul 2010 08:31:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 30/07/10 09:22, Koen Kooi wrote:
> On 30-07-10 09:21, Esben Haabendal wrote:
> > On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister
> <philip@balister.org> wrote:
> >>
> >>
> >> On 07/29/2010 05:45 AM, Koen Kooi wrote:
> >>>
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>>
> >>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
> >>>>
> >>>> Dear all,
> >>>>
> >>>> Given the discussions on quality that sometimes pop up (and also
> >>>> triggered
> >>>> by Robert's message), I decided to kick off a bitbake -k world.
> >>>
> >>> Could you first explain to me why 'bitbake world' is a good way to
> >>> measure quality?
> >>>
> >>> I would think that building something like console-image and
> looking at
> >>> the following would be a much better metric:
> >>>
> >>> * does it build?
> >>> * are all the rootfs types working?
> >>> * does the image do what it is supposed to do?
> >>> * Are all the licenses of the output packages correct?
> >>> * Do the output packages have any spurious deps?
> >>> * Is the content of the output packages correct?
> >>> * Are there any known CVEs in the resulting packages?
> >>> * Did packaged-staging do its job?
> >>> * What kind of QA errors and warnings were raised?
> >>> * Did all recipes pass recipe_sanity?
> >>> * Did all recipes conform to oe-stylize.py?
> >>>
> >>> etc
> >>>
> >>> I would actually advocate removing the 'world' feature from bitbake/OE
> >>> to stop people from wasting time on looking at bitbake world and have
> >>> them fix actual problems.
> >>
> >> bitbake world seems to be the source of pointless listserv
> discussions. Does
> >> it serve any purpose?
>
> > Pointless or not really depends on how you look at quality.
>
> > If you look at it as you, Koen and other OE long-timers, yes, it looks
> > rather pointless to have bitbake world.
> > But for those of us who have a different view on what quality is, then
> > bitbake world serves a purpose.
>
> As Thomas points out, as soon as you start blacklisting things (which
> actually increases quality), bitbake world doesn't work anymore.
> That alone should be enough to kill it.
Time to jump in the cage here.

"Quality" is achieved by comparing a set of known specifications against
a known data set. In the software case this means we need a good set of
specifications which we are testing against. We also need to know in
detail what we are testing against this set of specifications.

bitbake world meets neither of these criteria. You have no idea what
your testing against, you also have no idea what you are submitting for
test. A random selection of 8500 files in OE. It also doesn't take into
account known combinations which always fail. Angstrom took care of
these known failures by creating the concept of a blacklist.

In fact if you tell me bitbake world fails, I would actually suggest
that is a test pass, it is an expected fail.

Graeme




