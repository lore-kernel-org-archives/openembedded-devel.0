Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OIiPE-0005sQ-Hz
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 15:18:41 +0200
Received: from [192.168.1.3] (e180151078.adsl.alicedsl.de [85.180.151.78])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 0FF18584160
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 15:21:40 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1078)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <4C025F4C.7010305@station51.net>
Date: Sun, 30 May 2010 15:14:10 +0200
Message-Id: <91EED1BF-B355-4D13-ACDC-4A6F8AA79897@vanille-media.de>
References: <htqn9k$gvu$1@dough.gmane.org>	<AANLkTinPePxmIwOptgdFv-4CkJWzixbLvB26pxBw1dec@mail.gmail.com>
	<4C01BFA7.5040800@freyther.de> <4C025F4C.7010305@station51.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Broken recipes
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
X-List-Received-Date: Sun, 30 May 2010 13:18:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Bill,

> Can someone tell me the reason for keeping broken recipes in the tree?

Define 'broken'; some packages only build for a certain combination of =
$MACHINE and $DISTRO,
and sometimes perhaps even $OUT_OF_TREE_OVERLAY.

If a package is definitely broken, we should move it to 'broken' (if =
there is still
any interest in it), or remove it altogether. Most of the time it's =
maintainers disappearing
and who knows when or if they will appear again, so why annoy them by =
removing the recipe?

There's also lack of manpower to throw into the equation.

Which concrete recipes do you mean? I'd agree with removing a dozen of =
openmoko ones
for distributions that noone works on any longer (i.e. Openmoko 2007.2 =
and Openmoko 2008),
but please tell me exactly which ones.

Cheers,

:M:



