Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OccJA-0004sT-CL for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 12:50:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OccIu-0002S7-00 for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 12:50:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 12:50:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 12:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 24 Jul 2010 12:47:45 +0200
Message-ID: <i2egch$e0p$2@dough.gmane.org>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Sat, 24 Jul 2010 10:50:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-07-10 11:32, Khem Raj wrote:
> Hi
> 
> Following three patches are for making multi-machine toolchains co-exist with
> new cross staging for toolchain.
> 
> It changes the toolchain triplet from TARGET_ARCH-VENDOR-OS to TARGET_SUB_ARCH-VENDOR-OS
> 
> which means that a toolchain for armv7 is called armv7-oe-linux-gnueabi-*
> and for armv5te its called armv5te-oe-linux-gnueabi-*
> 
> They can coexist in same native sysroot. The symlinks would mean that
> gcc will not accidently mix the assemblers or linkers.
> 
> I have booted a minimal-image on qemuarm successfully. The build for 
> beagleboard in same sysroot is underway.
> 
> Please give it a shot in your environments (especially Koen's env)

Khem,

Thanks for working on this! I'm not sure if I'll have the time to test
this over the weekend, but I'll surely give it a go on monday at the latest.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMSsTRMkyGM64RGpERAmkhAKCI1Q/i9+jdejsAreSm36tbw/c1AQCgrAmt
6odQta5VzOiXWcWnFVBT4II=
=uvvj
-----END PGP SIGNATURE-----



