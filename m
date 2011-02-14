Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pov3c-00043F-OE
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 10:49:24 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pov2V-00086g-VH by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 10:48:18 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pov2Q-0006G0-Mh
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 10:48:10 +0100
Date: Mon, 14 Feb 2011 10:48:10 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110214094810.GE14931@excalibur.local>
References: <ij8d1t$cd9$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ij8d1t$cd9$1@dough.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: TSC agenda items for the next meeting
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
X-List-Received-Date: Mon, 14 Feb 2011 09:49:24 -0000
X-Groupsio-MsgNum: 29154
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2011-02-13 at 11:50, Koen Kooi wrote:
> 
> The new TSC is holding a meeting next week and we wanted to see if
> anyone wants to suggest items we put in the agenda for the meeting.
> 
> If you have such items, please let us know by replying to this mail.

All items brought up here until now should be available in the final agenda now.
Please see the attchment for it.

Sometimes items may cover parts of the same topic. I did not work them into one
to keep the original text of the submitters. Not sure if this is a good way to
deal with this overlaps.

With 18 items this is a lot of topics and I'm not ure we can cover this all in
one meeting. We are aiming for weekly but shorter meetings to keep thins moving
and not pilling up to much.

regards
Stefan Schmidt

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="TSC-2011-02-14-Agenda.txt"

Agenda 2011-02-14 meeting
-------------------------

01) Agree on meeting date, time and meeting lead. [Proposed: Stefan]

02) Setup oe-core repo and import yocto with history but without bitbake.
    Decide who will take this action item. [Proposed: Koen, Khem]

03) Discuss how we get OE metadata into the oe-core repo without loosing to
    much histroy and credits of the original authors. [Proposed: Stefan]

04) Access model for OE core and other layers [Proposed: Koen]

05) Guidelines for layers, e.g. encourage distro layers or not [Proposed: Koen]

06) Timeline for changes, e.g. OE releases, yocto milestones, etc [Proposed:
    Koen]

07) Definition of OE core [Proposed: Koen]

08) OE goals and guarantees for OE-core, which distros and machines to we
    recommend and 'test'? [Proposed: Koen]

09) Quickly discuss if we are fine with having the IRC meeting (read-only) open
    for interested community member. (Interest expressed from several ones)
    [Proposed: Stefan]

10) Definitive guidelines for creating board support packages. This should address:
    1) Where to define toolchains and versions.
    2) How to create kernel bb files. (Per board, or per kernel version)
    3) Same for u-boot, how to pin u-boot versions for BSP's.

    Basically, we should identify all the BSP's issues that create
    discussions on the list and work out a best practices document so we can
    have more consistency.

    A similar set of guidelines defining what a a distro's responsibility
    would also be good. [Proposed: Philip Balister]

11) Re-inforcement of the "don't delete all old versions" policy, make sure
    this is in the wiki somewhere. [Proposed: Graeme]

12) Rough Yocto integration plan. [Proposed: Graeme]

13) Start to think about the Policies section on wiki and whether it is
    relevant/correct now, and also what needs to change going forward to Yocto.
    [Proposed: Graeme]

14) Come to a set of minimal quality requirements for our recipes/packages
    (e.g. must fetch, minimal required headers etc).
    My proposal would be to use the yocto requirements as a starter

15) Splitting our metadata into multiple layers
    I can think of the following:
    - oe core layer (shared with yocto
    - oe layer (or oe extra's or whatever you want to call it; containing
    recipes that are generic, not in oe-core and considered to be of
    common use)
    - maybe oe-old or so layer (recipes that are not maintained any more)
    - layer per distro for distro specific stuff
    - layer per machine (or maybe soc family, I can imagine it makes sense
    to keep BB and BB-XM together; similarly for the kirkwoord variants)
    - vendor specific layers (if needed), e.g. ti (although maybe that
    stuff could also go into a machine layer)
    Rationale is that users can pull in only those layers that they need. [Proposed:
    Frans]

16) Consider a version based release mechanism
    yocto has a release model, intermediate versions are aiming to build
    but are considered to be less mature.
    If our core recipes follow this model, I can imagine it is a good
    strategy to follow in oe too. [Proposed: Frans]

17) Discuss future of our infrastructure (oestats, autobuilder,run-time testing)
    [Proposed: Yury]

18) What immediate infrastructure changes are needed to work on integrating
    better with Yocto. [Proposed: Tom King]

--uAKRQypu60I7Lcqm--
