Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OyujO-0002Dn-NU
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 00:57:38 +0200
Received: (qmail invoked by alias); 23 Sep 2010 22:57:28 -0000
Received: from p50882BA8.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.43.168]
	by mail.gmx.net (mp009) with SMTP; 24 Sep 2010 00:57:28 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19CrB0UF91CYD0CC0oF9eDKf1gr4/45hHz6NJtWLZ
	PvDEol2O0I7uAU
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 00:55:34 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <1285248897-5198-1-git-send-email-schnitzeltony@gmx.de>
	<201009232126.35996.schnitzeltony@gmx.de>
	<AANLkTikzbm2zfbDbXc2a6AJTHuvQC9FaZYmw65udiJq-@mail.gmail.com>
In-Reply-To: <AANLkTikzbm2zfbDbXc2a6AJTHuvQC9FaZYmw65udiJq-@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009240055.34347.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] clutter-gtk: Bump to 0.10.8
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
X-List-Received-Date: Thu, 23 Sep 2010 22:57:38 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 23 September 2010 09:44:30 pm Frans Meulenbroeks wrote:
> Frans (btw still interested to learn how it is tested)

My configuration (untouched since I started with OE)

MACHINE = "overo"
DISTRO = "angstrom-2008.1"
#ANGSTROM_MODE = "uclibc" -> glibc

I did 

'bitbake clutter-gtk' with org.openembedded.dev / the *.ipk are installed on overo-machine.

and 

a full image on gumstix.overo branches containing all clutter recipes.

Tested are the example applications shipped with *-examples package. All were working fine. The only application which was working 'weak' was 
gtk-clutter-multistage mentioning that there was an icon missing in the current theme.

meanwhile Paul did further build tests - also omap3 based.

Andreas


