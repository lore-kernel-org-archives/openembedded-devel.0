Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDOGz-0008Nv-Ga for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 22:20:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDOG9-0000vU-D1 for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 22:19:13 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 22:19:12 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 22:19:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Nov 2010 22:19:01 +0100
Message-ID: <iapv85$kch$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org>	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>	<iaptb1$bpb$1@dough.gmane.org>
	<4CD07F3E.7040703@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <4CD07F3E.7040703@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Tue, 02 Nov 2010 21:20:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-11-10 22:14, Eric Bénard wrote:
> Hi,
> 
> Le 02/11/2010 21:46, Koen Kooi a écrit :
>> I do fear that pulling things into seperate layers too much will make it
>> harder to propagate fixes...
>>
> yes, in your example, the fines in conf/machine/include are common to
> all omap boards (and even all cortexa8 for tune-cortexa8.inc) and thus
> when fixing one BSP you have to think to fix the others (and to
> communicate the fix to other BSP maintainers).
> The same apply for most of the .inc in recipes-bsp/*/.
> 
> Do you think the following setup is possible ?
> 
> - ARM overlay (containing all generic files for ARM achitecture :
> conf/machines/include for example)
> 
> - OMAP3 overlay (containing all generic files for OMAP3 SOC :
> conf/machines/include/omap* + recipes/linux u-boot x-load base files for
> omap3 architecture,
> 
> - specific board overlay (conf/machine/themachine.conf + board specific
> additions in recipes/linux u-boot & x-load (with patches based on top of
> the OMAP3 overlay).

That was pretty much what I was thinking, the angstrom-layers stuff is
something I need to get working before thursday, so it is a bit hacky.
It will get cleaned up after I get back from my holiday :) Hopefully
more people have tried different setups and we can bang out a decent RFC.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM0IBFMkyGM64RGpERAhVvAJ98xHlzrMSjH/d6a5//GQimg89j0wCgnVIs
ASfxeRULybqKbDAjBMlwkXg=
=tE/N
-----END PGP SIGNATURE-----



