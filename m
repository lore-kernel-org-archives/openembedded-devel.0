Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWOyH-0004OU-E9 for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 09:23:06 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWOtZ-0003nI-Or for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 09:18:13 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 09:18:13 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 09:18:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 07 Jul 2010 09:17:59 +0200
Message-ID: <i119n7$ej7$1@dough.gmane.org>
References: <i108p5$hd$1@dough.gmane.org> <4C33B301.7010006@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <4C33B301.7010006@mentor.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4d6a63850b4dc7ca2f060aedda26ddf4efa0e5cc
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
X-List-Received-Date: Wed, 07 Jul 2010 07:23:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-07-10 00:49, Tom Rini wrote:
> Koen Kooi wrote:
> 
>> +PREFERRED_VERSION_gcc-cross = "4.1.2"
>> +PREFERRED_VERSION_gcc-cross-initial = "4.1.2"
>> +PREFERRED_VERSION_gcc-cross-intermediate = "4.1.2"
>> +PREFERRED_VERSION_binutils = "2.17.50.0.12"
>> +PREFERRED_VERSION_binutils-cross = "2.17.50.0.12"
> [snip]
>> do NOT belong in a machine.conf (or machine include). Those belong in
>> the distro (or local.conf), not in the machine.
> 
> Just putting this out there (and it's indeed _not_ how things are
> today).  Why would we not want to move towards having this kind of stuff
> be in the tune-ARCH.inc file, when a specific version is really needed
> (more avr32 or new'ish core on an existing overall arch) ?

Putting it in a tune-arch is not a problem, just put it in
conf/distro/include.
Experience has shown that putting it the machine includes is a bad idea,
It rots and after a while a new machine gets added that doesn't use said
machine include.
And not to mention the need to change DISTRO_PR for editing a
machine.conf, that's just backwards.

> Yes, it
> should be up to the distro to say "we want 4.4.x + 2.20.x" or whatever,
> but then we also get the downside of "special case, XXXX only works well
> with 4.3.4 + 2.19.x" or what have you, and those special cases get
> introduced in one place and copy/pasted elsewhere.

So you have an include file in conf/distro that people can optionally
use or copy/paste. Not all distros can/want to support all machines in
OE. Angstrom tries to, but that's because it's the reference implemention :)

It boils down to this:

The distro needs to make a decision to do strange stuff to support a
platform. Silently forcing it is bad.

In this specific case no distro except angstrom has expressed interest
in supporting nios2, so we could even but this in an angstrom.inc.
Seriously, can the distro maintainers that are willing to support nios2
please raise their hands?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMNConMkyGM64RGpERAon3AJ9keLb8YBEVmCsvWzhEqb3qtLCWKgCfcX+4
kuDgy1Jqhl4qdAIVEWkiTfc=
=0Lny
-----END PGP SIGNATURE-----



