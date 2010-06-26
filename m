Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OSXOC-0007VX-2q for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 17:33:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OSXJh-0005tG-4W for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 17:29:13 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 17:29:13 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 17:29:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 26 Jun 2010 17:29:05 +0200
Message-ID: <i056c1$k7t$1@dough.gmane.org>
References: <E1OSU21-0002Hi-E6@melo.openembedded.org>
	<20100626123700.GM17650@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <20100626123700.GM17650@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Koen Kooi : libdrm.inc: fix packaging regression that cause ${PN} to go from libdrm2 to libdrm
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
X-List-Received-Date: Sat, 26 Jun 2010 15:33:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-06-10 14:37, Martin Jansa wrote:

> Just noticed the problem too and seems like this solution wasn't enough,
> would you add ${PN}-kms package? Or do you have an idea why it ignored
> LEAD_SONAME?

It doens't build a libkms for me, so it looks safe to add such a
package. No idea on the LEAD_SONAME, sorry.

regards,

Koen

> 
> NOTE: Multiple libraries (libkms.so.1, libdrm.so.2) found and LEAD_SONAME not defined
> 
> Packaged contents of libdrm-drivers into
> /home/shr/shr-unstable/tmp/deploy/ipk/armv4t/libdrm-glamo1_2.4.20+gitr4566+9411b0ca002b34d2d13a132038170c2e7b08945c-r4.0.5_armv4t.ipk
> Packaged contents of libdrm-dbg into
> /home/shr/shr-unstable/tmp/deploy/ipk/armv4t/libdrm-dbg_2.4.20+gitr4566+9411b0ca002b34d2d13a132038170c2e7b08945c-r4.0.5_armv4t.ipk
> Packaged contents of libdrm into
> /home/shr/shr-unstable/tmp/deploy/ipk/armv4t/libdrm_2.4.20+gitr4566+9411b0ca002b34d2d13a132038170c2e7b08945c-r4.0.5_armv4t.ipk
> Packaged contents of libdrm-dev into
> /home/shr/shr-unstable/tmp/deploy/ipk/armv4t/libdrm-dev_2.4.20+gitr4566+9411b0ca002b34d2d13a132038170c2e7b08945c-r4.0.5_armv4t.ipk
> 
> Regards,
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMJhzBMkyGM64RGpERAoo8AJ9nSuiwuayM+rWgfqQkWUjFW86MFgCggmxF
YXh6aO1xz7JyI9YajSCohvw=
=2j1c
-----END PGP SIGNATURE-----



