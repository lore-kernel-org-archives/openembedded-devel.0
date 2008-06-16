Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1K8Nek-0007z8-1U
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jun 2008 00:58:34 +0200
Received: from andromeda.vanille.de (e180145204.adsl.alicedsl.de
	[85.180.145.204])
	by drlauer-research.com (Postfix) with ESMTP id DFB1A584C32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2008 01:00:32 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2008 00:57:47 +0200
User-Agent: KMail/1.9.9
References: <20080616142816.5346618928D@amethyst.openembedded.net>
	<200806161641.50186.mickey@vanille-media.de>
	<g360lp$bkf$2@ger.gmane.org>
In-Reply-To: <g360lp$bkf$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200806170057.47876.mickey@vanille-media.de>
Subject: Re: org.oe.dev sane-srcrev: wind back opkg-native to 4452 *again*
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 16 Jun 2008 22:58:34 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Montag 16 Juni 2008 17:25:44 schrieb Koen Kooi:
> Michael 'Mickey' Lauer wrote:
> > Am Montag 16 Juni 2008 16:28:16 schrieb koen commit:
> >> sane-srcrev: wind back opkg-native to 4452 *again*
> >
> > Koen, what kind of problem are you seeing? If it's the "could not create
> > administrative lock", this has been fixed by me days ago.
>
> The "could not create administrative lock" is still present with
> packaged-staging yesterday evening.

Ok, then I suggest fixing it modelled after the fix I did to 
rootfs_ipk.bbclass: 
http://git.openembedded.net/?p=org.openembedded.dev.git;a=commitdiff;h=91b5ad2ddfa2322165d90e6cedece480bd38d18b                

The alternative is pinpointing it 4452 forever since it's unlikely the 
behaviour of needing its libdir during 'update' will be changed.

> > If not, please point me to the bug entry for your problem?
>
> No bug entry, since bugs get closed on an arbitrary basis anyway

Oh, sure. *yawn*

-- 
:M:


