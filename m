Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NmtCb-0002jv-5c
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 19:21:45 +0100
Received: from [192.168.1.5] (e180141032.adsl.alicedsl.de [85.180.141.32])
	by drlauer-research.com (Postfix) with ESMTP id 9792158413C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 19:19:03 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267633819.4739.343.camel@trini-m4400>
References: <1267633819.4739.343.camel@trini-m4400>
Organization: Vanille-Media
Date: Wed, 03 Mar 2010 19:18:50 +0100
Message-ID: <1267640330.21528.6.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big changes right after next stable
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
X-List-Received-Date: Wed, 03 Mar 2010 18:21:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 03.03.2010, 09:30 -0700 schrieb Tom Rini:
> As many people know, there's a lot of "odd" internal things that OE
> does, that if we had it to do over, we would do differently.  What I
> would like to propose is that in time for the next stable branch we:
> 1: Define a set of DISTROs/MACHINEs/build targets that need to stay
> working
> 2: In a separate branch (per big change), get one of these big, going to
> leave some stuff broken changes
> 3: Define / document what needs to be done before these branches can be
> merged back (something like #1 is working still, and if applicable a
> guide to the common problems/how to fix people are going to run into).
> 
> What I'm getting at is that this would let us do things like rework the
> "this is where we place things that we build other recipes with" concept
> so that sysroot just works (and otherwise makes more sense again).  Or
> "let us have more consistency in build with compared to what could end
> up on device".  And so on.
> 
> What do people think?  And what would people work on?

I think that's a very good idea. Phil wanted to branch off a new stable
branch lately, so we can coordinate the right point of time with him.

I'd revamp EFL packaging, which is somewhat inflexible, and take a look
at bringing the Python recipes up to par.

Cheers,

-- 
:M:



