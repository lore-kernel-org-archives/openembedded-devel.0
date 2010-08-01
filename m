Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Ofdb6-0005Eu-85
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 20:49:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o71Imvxb000797
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Aug 2010 19:48:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32713-09 for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Aug 2010 19:48:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o71Imq4T000791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Aug 2010 19:48:52 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C557F47.2080901@balister.org>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
	<i2u23e$97d$1@dough.gmane.org>
	<AANLkTimUYuJBUa5Hz=N_dM-DOe6qPoCDbqCEs2LHTpab@mail.gmail.com>
	<1280617976.1297.85.camel@rex>  <4C557F47.2080901@balister.org>
Date: Sun, 01 Aug 2010 19:48:44 +0100
Message-ID: <1280688524.1297.105.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
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
X-List-Received-Date: Sun, 01 Aug 2010 18:49:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-08-01 at 10:05 -0400, Philip Balister wrote:
> On 07/31/2010 07:12 PM, Richard Purdie wrote:
> > On Fri, 2010-07-30 at 10:34 +0200, Frans Meulenbroeks wrote:
> >> 2010/7/30 Koen Kooi<k.kooi@student.utwente.nl>
> >>> On 30-07-10 09:21, Esben Haabendal wrote:
> >>>> On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister<philip@balister.org>
> >>> wrote:
> >>>>> On 07/29/2010 05:45 AM, Koen Kooi wrote:
> >
> >>>>>> I would actually advocate removing the 'world' feature from bitbake/OE
> >>>>>> to stop people from wasting time on looking at bitbake world and have
> >>>>>> them fix actual problems.
> >>>>>
> >>>>> bitbake world seems to be the source of pointless listserv discussions.
> >>> Does
> >>>>> it serve any purpose?
> >>>>
> >>>> Pointless or not really depends on how you look at quality.
> >>>>
> >>>> If you look at it as you, Koen and other OE long-timers, yes, it looks
> >>>> rather pointless to have bitbake world.
> >>>> But for those of us who have a different view on what quality is, then
> >>>> bitbake world serves a purpose.
> >>>
> >>> As Thomas points out, as soon as you start blacklisting things (which
> >>> actually increases quality), bitbake world doesn't work anymore.
> >>
> >> Blacklisting does *NOT* increase quality. It just hides the problem and as
> >> such it is ostrich behaviour.
> >>
> >> Instead of masking the problem, better fix things. That is what improves
> >> quality!
> >>
> >> For me a non building recipe is a sign of poor quality.
> >>
> >> BTW: to avoid the blacklisting issue, I've restarted my test with minimal
> >> distro.
> >> Results will probably be available after the weekend.
> >
> > "world" is used by Poky quite successfully. In Poky we expect everything
> > to build with a known list of things that don't. Our aim is to have that
> > list consisting of zero items and I intend to see that happens :).
> 
> But Poky operates under different conditions than the main OE meta-data. 
> Since you more focus on what Poky builds, you do not need to support the 
> variety of recipes in the OE meta-data.

Totally. I was mainly responding to the "world is useless, we should
remove it" comment and also showing that blacklists are used by others
too, in general with success.

Cheers,

Richard





