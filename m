Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UNgzx-0007WE-Tk for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 12:02:26 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UNgji-0006ln-EJ for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 11:45:38 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 11:45:38 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 11:45:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 04 Apr 2013 11:45:00 +0200
Message-ID: <kjji2n$c31$1@ger.gmane.org>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C7D42.6070303@pseudoterminal.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <515C7D42.6070303@pseudoterminal.org>
X-Enigmail-Version: 1.5
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Thu, 04 Apr 2013 10:02:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-04-13 21:04, Carlos Rafael Giani schreef:
> On 2013-04-03 20:38, Koen Kooi wrote:
>> So how is this different from https://github.com/naguirre/meta-cubox ?
> 
> I am in contact with the author of that layer. My work started as a fork
> of that, since the layer did not work for me, but since I anyway was
> changing pretty much all of it from the ground up, I decided to start my
> own. Now, covers more features of the CuBox, and supports both soft- and
> hardfp in all recipes.
> 
>> 
>> Just like https://github.com/naguirre/meta-cubox you're mixing DISTRO
>> policy in the machine files by setting the tuning to hardfloat. Don't
>> do that. If you want hardfloat, set that in your distro config, not in
>> your machine config.
> 
> Do I understand it correctly that I should drop "marvellpj4hf" from 
> https://github.com/dv1/meta-cubox/blob/master/conf/machine/include/tune-marvell-pj4.inc
>
> 
, or at least not set it as DEFAULTTUNE, not even with the ?= operation, and
> just use "marvellpj4" instead ? Because it is the distros decision to add
> the "callconvention-hard" feature?

Exactly!

> The reason I ask that is because when I was writing the tune, I stumbled
> upon 
> https://github.com/openembedded/oe-core/blob/master/meta/conf/machine/include/arm/arch-armv7a.inc
>
> 
, which includes armv7a, armv7ahf . This confuses me. Why is it OK there to
> mix in the callconvention?

It isn't, that file just lists all the permutiations available.

> Finally, is there a way to give a distro a "hint" about what is preferred
> for a machine (soft/hardfp)? One that the distro is free to ignore or
> respect?

There isn't, apart from a note in the README of your BSP.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRXUucMkyGM64RGpERAlQFAKCpia9xhA+ldV8AdpH2F3GWAkptQwCgsCcd
2Tz5vaOMU9oX93XPNmAZE/E=
=fR8B
-----END PGP SIGNATURE-----



