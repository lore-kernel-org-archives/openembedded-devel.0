Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 006426E7D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:59:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WO2Pl-0006RS-Nl for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2014 10:59:01 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:59:01 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:59:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 13 Mar 2014 10:59:38 +0100
Message-ID: <lfrvgd$3bd$1@ger.gmane.org>
References: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>
X-Enigmail-Version: 1.6
Subject: Re: Correct versioning of unversioned source in git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 09:59:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tomas Novotny schreef op 13-03-14 10:08:
> Hi all,
> 
> there is a recipe sunxi-board-fex in meta-sunxi layer. That recipe
> fetches sources from unversioned git which contains definitions of some
> boards (in fact it is something like a store). I'm not sure with correct
> versioning in OE. Is that: PV = "1.0+git${SRCPV}" SRCREV =
> "<some_gitrev_I_want>" correct? Will be change of SRCREV (only) catched
> by build system (I'm curious how OE handles age of the rev in git)? Or do
> I need to raise PV to 1.1 and so on with every change to SRCREV?

The answer changes if you have more than one buildhost. If you have only one
buildhost and don't care about other people rebuilding the exact same
versions, 1.0+git${SRCPV} will work.

If you have more than one buildhost and/or care about other people
rebuilding the exact same, you'll need to increase PR (or PV) everytime
SRCREV changes. That will still cause some discrepancies if someone rebuilds
after >1 SRCREV change, but upgrade paths should work when increasing PV
(not with PR!).

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTIYGKMkyGM64RGpERAtHvAJ96mw6U8PacUt+DOagTFjWtwsNd2wCbB3nr
KSym/Y5aAMUbEKx61oNDiH0=
=Qvq7
-----END PGP SIGNATURE-----


