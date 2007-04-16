Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HdYyz-0005T4-OI
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2007 23:43:33 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 2E416216D87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2007 17:43:34 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 16 Apr 2007 17:43:33 -0400
X-Sasl-enc: oBUC6TzJSpcIuGinnDVA6/38EvtJ7ecMlLv+CAweqhfR 1176759812
Received: from [192.168.18.22] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 1ED8E1C2AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2007 17:43:31 -0400 (EDT)
From: "Rod Whitby" <rod@whitby.id.au>
Date: 17 Apr 2007 07:14:00 +0930
To: <openembedded-devel@lists.openembedded.org>
X-Mailer: ChatterEmail+ for Treo 600/650 (2.0.1rc4)
Message-ID: <3259638856.300263@mail.messagingengine.com>
Subject: Re: [oe-commits] org.oe.dev conf/*: remove all MACHINE_TASK_PROVIDER definitions that were simply forcibly defining it to the	default value set in bitbake.conf. Approved by hrw and RP.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2007 21:43:34 -0000

Apologies Koen, I thought that the positive response from hrw and RP on the -devel mailing list for making the change globally (and the lack of objections from anyone to their comments saying to go and do it) was enough.
Should I have negotiated one on one with every machine maintainer too?  If that is the case, then I simply wouldn't have bothered doing the change at all - what do I care if other distro and machine maintainers would rather do all their own cleanup?  What do I care if historical cruft builds up in OE?
This type of response to a helpful change to OE is *exactly* why I (and I expect others too) prefer to create a new distro for stuff instead of using Angstrom distro directly - it's just no fun being part of someone else's draconian fiefdom (Angstrom distro with Koen as the overlord) as opposed to being part of a group-maintained distro where positive changes are appreciated when approval of changes that bring improvements and cleanup are sought globally (as was done in this case).
-- Rod
(Apologies for formatting, sent on the road from Treo650)

-----Original Message-----
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sunday, Apr 15, 2007 4:57 pm
Subject: Re: [oe] [oe-commits] org.oe.dev conf/*: remove all   MACHINE_TASK_PROVIDER definitions that were simply forcibly defining it to   the	default value set in bitbake.conf. Approved by hrw and RP.

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rwhitby commit schreef:
 conf/*: remove all MACHINE_TASK_PROVIDER definitions that were simply forcibly defining it to the default value set in bitbake.conf.  Approved by hrw and RP.
 
 Author: rwhitby@nslu2-linux.org

> conf/distro/include/angstrom.inc

Could you please consult with the distro maintainers before making such changes next time? The line was left in there to fix angstrom for people with a bogus MACHINE_TASK_PROVIDER entry in their local.conf.
OTOH, people now get what they deserve now when putting bogus entries in local.conf :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGIdPOMkyGM64RGpERAgKrAKCupbjJDnWTtoaTTBjuMueZH5kznwCggqkl
MdRJ7LalRiiqwU6I9rlCK4M=
=Yvo4
-----END PGP SIGNATURE-----

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





