Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RO5L8-0004mL-9w for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 11:25:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RO5F7-0005s9-3v for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 11:18:53 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 11:18:53 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 11:18:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 09 Nov 2011 11:18:37 +0100
Message-ID: <j9dk1t$994$1@dough.gmane.org>
References: <loom.20111108T225635-677@post.gmane.org>
	<loom.20111109T001647-942@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <loom.20111109T001647-942@post.gmane.org>
X-Enigmail-Version: 1.3.2
Subject: Re: Anstrom boot hang with MACHINE=i686-generic and DISTRO=anstrom-2010.x
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
X-List-Received-Date: Wed, 09 Nov 2011 10:25:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-11-11 00:19, Greg Kogut schreef:
> Greg Kogut <gkogut <at> yahoo.com> writes:
> 
>> 
>> I've tried both console-image and x11-image.
> 
> 
> Edit:
> 
> I was able to to boot fully after appending "-o rw" to the "root" kernel
> parameter.
> 
> I suspect the issue was that the read-only mount was not allowing udev to
> correctly populate /dev with the tty devices passed to getty, and getty
> was flummoxed.
> 
> So I'm amending my question:  Help a n00b -what's the standard practice
> with respect to maintaining an embedded-safe read-only rootfs while
> allowing udev to do its thang?   Separate partition for /dev?

You're still following the deprecated OE-classic workflow. If you follow the
instructions at http://www.angstrom-distribution.org/building-angstrom you
will get the updated angstrom configs that work with RO /

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOulN9MkyGM64RGpERAgkLAJsHQ6t7GR+JUBu5BeaTVz/YYK/KpQCguTWU
XMTgjD846DcyqCIr9B7JUhc=
=3H0D
-----END PGP SIGNATURE-----



