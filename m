Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OUSOs-0000gb-UJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:38:31 +0200
Received: from [192.168.1.2] (e180160232.adsl.alicedsl.de [85.180.160.232])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 9F894584111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 00:43:59 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1278023342.4507.8.camel@lenovo.internal.reciva.com>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
	<i0iv84$7qt$1@dough.gmane.org>  <4C2D13AE.9030903@mentor.com>
	<1278023342.4507.8.camel@lenovo.internal.reciva.com>
Organization: Vanille-Media
Date: Fri, 02 Jul 2010 00:33:46 +0200
Message-ID: <1278023626.12473.22.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Thu, 01 Jul 2010 22:38:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 01.07.2010, 23:29 +0100 schrieb Phil Blundell:
> On Thu, 2010-07-01 at 15:16 -0700, Tom Rini wrote:
> > One of the issues with some form of USE flags, and I believe this is one 
> > of the big ones for Angstrom as well as any other public feed publishing 
> > distribution is that having a single recipe that does different things 
> > based on variables makes maintaining their feed (and allowing users to 
> > publish their own compatible feeds) a nightmare.
> 
> It's only a nightmare if the flags in question are user-frobbable.  If
> they are all nailed down in the DISTRO configuration (which
> DISTRO_FEATURES certainly ought to be), and those folks who want to
> build compatible binaries just leave them alone, then there oughtn't to
> be any real problem.  To that extent it doesn't really seem any
> different to the choice of compiler or tuning flags or glibc version or
> any of the other ways in which you can already produce incompatible
> binaries by flipping the wrong switches.

Agreed. I think we should be more open to this concept. At least for
packages with optional (but "infecting") X11 support -- such as EFL -- I
plan to use such a mechanism soon.

-- 
:M:



