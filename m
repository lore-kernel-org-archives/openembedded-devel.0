Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jbcrd-0004n5-C3
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 15:32:35 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbcrV-0002R2-VO
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 14:32:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 14:32:21 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 14:32:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 18 Mar 2008 15:32:11 +0100
Message-ID: <frojpb$m6j$1@ger.gmane.org>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
	<200803180849.21108.geoffrey@pager.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803180849.21108.geoffrey@pager.net>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Mar 2008 14:32:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Geoffrey Wossum schreef:
| On Tuesday 18 March 2008 03:55:01 am Koen Kooi wrote:
|
|> Poky just switched to opkg and removed ipkg completely, which I think
|> is a good thing, but here's a less drastic patch for OE.
|>
|> Executive summary: you still get .ipk packages, just as before, only
|> your rootfs ends up with opkg.  Things like sharprom-compat and wrt54g-
|> oe will continue to work just as before.
|
| I understand that opkg is a fork of ipkg, since ipkg was unmaintained.
  But
| could someone explain what, if anything, this means to me as someone
| currently building a product using OpenEmbedded for the underpinning?

It means that after this gets applied you login to your product:

ssh user@mytarget
$ su -
Password:
# ipkg update
sh: ipkg: : command not found
# opkg update
<output of opkg downloading stuff from feeds>

So from a device user POV you need to type 'opkg' instead of 'ipkg'.
~From a developer POV you gain PGP signed packages.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH39JrMkyGM64RGpERAmKCAJ9TEa1Lc14I+56/kG1VJzoMxIK/YACgsoSj
kqU/F8b00r1UGO/BsO9HwXE=
=G4ag
-----END PGP SIGNATURE-----



