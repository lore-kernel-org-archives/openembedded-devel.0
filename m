Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J3H1r-0005UV-1o
	for openembedded-devel@openembedded.org; Fri, 14 Dec 2007 21:21:03 +0100
Received: from Powerbook-2.local (vpn006016.vpn.utwente.nl [130.89.6.16])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBEKGM0k016532 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 21:16:23 +0100
Message-ID: <4762E496.1040806@student.utwente.nl>
Date: Fri, 14 Dec 2007 21:16:22 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4762095D.4060505@protium.com>
In-Reply-To: <4762095D.4060505@protium.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: Renaming uboot-utils
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
X-List-Received-Date: Fri, 14 Dec 2007 20:21:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andy Wilcox schreef:
> Since uboot-utils builds a native binary (mkImage) it should really be 
> called
> uboot-utils-native.

That part makes sense. FWIW, we already have a uboot-mkimage-native
recipe in OE.

> My motivation is (a) I'd really like to build a few tools from uboot
> which are cross-compiled

And now you're talking about uboot-utils-cross, not uboot-utils-native

regards,

Koen

> (notably, fw-setenv/printenv, which allow R/W
> access to the u-boot configuration space), and (b) it's the "right"
> thing to do (-;
> 
> The following files would be updated:
> 
> ./conf/distro/foonas.conf
> ./conf/distro/include/angstrom-2007-preferred-versions.inc
> ./packages/linux/em-x270_2.6.23.bb
> ./packages/linux/linux-bd-neon-2.6_2.6.22.bb
> ./packages/linux/linux-gumstix_2.6.15.bb
> ./packages/linux/linux-omap.inc
> ./packages/linux/linux-storcenter_2.6.12.6.bb
> ./packages/linux/linux-turbostation_2.6.20.2.bb
> ./packages/tasks/task-base.bb
> 
> Any objection or comment?
> 
> Thanks!
> Andy
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHYuSWMkyGM64RGpERAs4YAJ40EIfK6AK1hfVn1jv/Lz85XSr0JgCfUXBS
6e2moAwqoeJBN0kqjXnPhX4=
=KWpO
-----END PGP SIGNATURE-----


