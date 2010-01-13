Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NV0vy-0004sU-FP for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 11:58:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NV0tt-00077Z-0e
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 11:56:33 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 11:56:33 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 11:56:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 11:56:10 +0100
Message-ID: <hik8s9$iop$1@ger.gmane.org>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>	<20100110123923.GB6363@rhein.zuhause.netz>	<1263156477.3423.6.camel@mattotaupa.wohnung.familie-menzel.net>	<1263249767.3308.236.camel@mattotaupa.wohnung.familie-menzel.net>	<1263296160.20557.136.camel@mattotaupa.wohnung.familie-menzel.net>	<20100113102738.GA15906@gmail.com>
	<1263379487.3228.23.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100110 Shredder/3.0.1pre
In-Reply-To: <1263379487.3228.23.camel@mattotaupa.wohnung.familie-menzel.net>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [vdr] TARGET_CXXFLAGS do not include CXX_FLAGS from Makefile
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
X-List-Received-Date: Wed, 13 Jan 2010 10:58:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-01-10 11:44, Paul Menzel wrote:

> I did not define any CXXFLAGS. It looks like BitBake is setting them and
> not respecting those in the Makefile.

In 99.99% of the cases OE knows a while lot better which flags to use :)
If upstream has the need for a specific flag, they should append it to
CXXFLAGS in the makefile, not redefine CXXFLAGS.

/me hugs make -e

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTabKMkyGM64RGpERAon4AJ9rWJTYCUn4qY2SeFb4e1epmS0BNgCgjAIe
c9o7aF5uxPwToxWmksTi9ng=
=Y6/z
-----END PGP SIGNATURE-----



