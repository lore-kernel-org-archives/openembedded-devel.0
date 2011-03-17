Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1Q0JMl-0005DL-LY
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 21:00:18 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id 4F30324EC460
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 20:58:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ay3TpsTO-S4f
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 20:58:29 +0100 (CET)
Received: from [192.168.1.189] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by zmta01.irigo.dk (Postfix) with ESMTPSA id DDF1524C0402
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 20:58:28 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300385153.9054.44.camel@phil-desktop>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
Organization: DoreDevelopment ApS
Date: Thu, 17 Mar 2011 20:58:27 +0100
Message-ID: <1300391907.2175.23.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Eliminating dependency race-conditions (was Re: [PATCH] net-snmp: disable libnl use)
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
X-List-Received-Date: Thu, 17 Mar 2011 20:00:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 18:05 +0000, Phil Blundell wrote:
> On Thu, 2011-03-17 at 18:52 +0100, Esben Haabendal wrote:
> > Well, it might be possible to minimize the disruption for a transitional
> > period by carefully specifying some catch-all build-time package
> > dependencies pulling in all packages for recipes not ported yet.
> 
> Yes, that's the sort of thing I was thinking of.  It isn't even totally
> obvious to me that specifying individual packages is any better than
> "all packages from recipe X", since with the former you then have a
> potential maintenance headache if files get moved from one package to
> another.

There is a number of ways that I believe package based build
dependencies are better than recipe based.

a) It is possible to depend on parts of a recipe, which fx. is useful
when a recipe provides more than 1 library, where you might not want all
of them.

b) To build a recipe, you depend on some stuff which you don't need to,
or perhaps even really don't want to pass on to recipes depending on
this recipe.

c) KISS. Using the actual target packages for satisfying build-time
dependencies are a very simple approach, which I strongly believe will
make OE a better tool in the long run, by reducing complexity, and thus
lowering the bar for contributing to OE archictural work.

The maintenance headache you talk about is already there.  In OE-lite
build-time dependency 95% of the time just follow the run-time
dependencies, perhaps making it easier to maintain than OE, as we don't
have to think about another type of "item names" to depend on.

/Esben




