Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeX7p-00029d-GM for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 19:42:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeX7R-0005zu-4z for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 19:42:09 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 19:42:09 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 19:42:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 29 Jul 2010 19:41:54 +0200
Message-ID: <i2seh2$mrf$1@dough.gmane.org>
References: <1280406377-23902-1-git-send-email-chase.maupin@ti.com>	<1280406377-23902-2-git-send-email-chase.maupin@ti.com>
	<0d6a01cb2f30$47a0b040$d6e210c0$@Distant-earth.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <0d6a01cb2f30$47a0b040$d6e210c0$@Distant-earth.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] x-load: add signGP to sourceipk
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
X-List-Received-Date: Thu, 29 Jul 2010 17:42:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-07-10 17:11, John Willis wrote:
>> * When creating a source ipk for the x-load program copy the
>>   signGP binary as well as this is needed when rebuilding.
>> * Bump the PR for x-load-omap3pandora recipe.
>>
>> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> 
> Nack, this seems totally pointless, signGP is in the tree (signgp-native) so
> is it not better to bring that in?
> 
> Out of interest, what is the problem you see with the current setup, the
> recipes as they stand will give people signed and unsigned X-Loader binaries
> for just about all purposes you could want them on the OMAP3. Or is this
> patch aimed at using source IPK's for use in another non-OE SDK?
> 
> Shipping binaries in a source IPK seems very wrong regardless of the need,
> it's not really source at that point ;-).

What Chase actually needed was an -sdk package, so:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=962d52ae8358d8fd11ae8a7054fa785d102cf274

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMUb1iMkyGM64RGpERArLhAJoD27ERUKmy2OrmVZNK5kzEzVWi8QCgmIpZ
s2B/iRmjYI0hrFSLpiz9SBY=
=4MXC
-----END PGP SIGNATURE-----



