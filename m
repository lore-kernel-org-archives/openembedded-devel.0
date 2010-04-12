Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1OT7-0007ow-Ov for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 20:34:46 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1OPp-0005cO-0U for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 20:31:21 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 20:31:20 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 20:31:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 12 Apr 2010 20:31:12 +0200
Message-ID: <hpvotg$au0$1@dough.gmane.org>
References: <AB16E937-B599-4A4A-8F81-7107E7C8DAD2@mac.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <AB16E937-B599-4A4A-8F81-7107E7C8DAD2@mac.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Modifying Ralink RT3070 STA wifi driver for OpenEmbedded
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
X-List-Received-Date: Mon, 12 Apr 2010 18:34:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-04-10 20:08, Elvis Dowson wrote:
> Hi,
>        I would like to modify the Ralink RT3070 STA wifi driver, so that the Makefile can compile with openembedded. 
> 
> At the moment, on line 132, I have to explicity set the source path 
> 
> LINUX_SRC = /tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.29-r51/git
> CROSS_COMPILE = arm-angstrom-linux-gnueabi-
> 
> What modification should I make to the following make file to make it compatible with OpenEmbedded?

Have a look at the existing rt3070 recipe:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/rt2x00/rt3070_2.1.1.0.bb?id=bb3c6f24758b490366543e7392dd13cdcb200b6f

And FWIW, with 2.6.32 you can use the in-kernel rt28xx driver with
rt3070 hw, but you still need the firmware

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLw2bwMkyGM64RGpERAvLHAKCCa0z5bZlnKylGebqJ9IVhvnxPCQCfWwW8
DYhhZFj2kb6OewZLDKh8388=
=C1TA
-----END PGP SIGNATURE-----



