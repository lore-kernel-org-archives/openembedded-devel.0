Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JbfFx-0000s7-PZ
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 18:05:47 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbfFt-0002RF-Uz
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 17:05:42 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 17:05:41 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 17:05:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 18 Mar 2008 18:05:35 +0100
Message-ID: <frosov$c0b$1@ger.gmane.org>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803180849.21108.geoffrey@pager.net>
	<frojpb$m6j$1@ger.gmane.org>
	<1205858910.7500.39.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1205858910.7500.39.camel@dax.rpnet.com>
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
X-List-Received-Date: Tue, 18 Mar 2008 17:05:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| On Tue, 2008-03-18 at 15:32 +0100, Koen Kooi wrote:
|> Geoffrey Wossum schreef:
|> | I understand that opkg is a fork of ipkg, since ipkg was unmaintained.
|>   But
|> | could someone explain what, if anything, this means to me as someone
|> | currently building a product using OpenEmbedded for the underpinning?
|>
|> It means that after this gets applied you login to your product:
|>
|> ssh user@mytarget
|> $ su -
|> Password:
|> # ipkg update
|> sh: ipkg: : command not found
|> # opkg update
|> <output of opkg downloading stuff from feeds>
|>
|> So from a device user POV you need to type 'opkg' instead of 'ipkg'.
|> ~From a developer POV you gain PGP signed packages.
|
| That isn't the full story since the config files moved
| from /usr/lib/ipkg to /usr/lib/opkg and distro maintainers need to be
| wary of the transition. I think Angstrom has something to help with this
| but I'm not sure?

There is opkg-ipkg-compat.bb and angstrom-feed-configs.bb to help with a
dual system, and opkg-r10.patch moves angstrom over to opkg completely.

| While I think about this, would now be a good time to move the config
| files to /var instead of /usr?

I have no strong opinion on that.

regards,

Koen

| Poky can't do that yet since we don't have the var changes in OE but I
| think most of /var in OE is persistent now?
|
| Cheers,
|
| Richard

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFH3/ZfMkyGM64RGpERAp/pAKCBr14wI9/P6z9tc38Xa2w/dIXZZQCXUx6i
L5hGyxpIf+jsTbuI54y8MA==
=eF5Z
-----END PGP SIGNATURE-----



