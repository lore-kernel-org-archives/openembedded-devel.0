Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NU29n-00027I-SL for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 19:04:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NU27j-0004zv-MP
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 19:02:47 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 19:02:47 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 19:02:47 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 10 Jan 2010 19:02:25 +0100
Message-ID: <hid4ng$12q$1@ger.gmane.org>
References: <1263143433.3710.34.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100104 Shredder/3.0.1pre
In-Reply-To: <1263143433.3710.34.camel@utx.utx.cz>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] disable static libraries in Angstrom
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
X-List-Received-Date: Sun, 10 Jan 2010 18:04:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-01-10 18:10, Stanislav Brabec wrote:
> Attached patch disables build of major part of static libraries in the
> Angstrom distribution.

NAK

> Rationale:
> 
> Angstrom distribution is intended for project that are typically based
> on multiple packages and use of shared libraries.

Yes, but...

> In such environment,
> static libraries are mostly only a waste of space.

Static libs are packaged in seperate packages, so they only 'waste'
space on the feed server.

> Disabling static libraries seems to be a smart default.

It isn't there are a lot of people using the static libs we provide for
the applications. No need to stab them in the eye.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLShYxMkyGM64RGpERAhSSAJ4/lJ0EOSLpe5YZoFBpeam6hVqc5ACfUcuA
V+XGBg2Hnxl1w74iJ9Oglug=
=yY8p
-----END PGP SIGNATURE-----



