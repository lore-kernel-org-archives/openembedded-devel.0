Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OGDeI-0008Ik-1F for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 18:03:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OGDaJ-0006fg-9B for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 17:59:27 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 17:59:27 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 17:59:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 23 May 2010 17:59:14 +0200
Message-ID: <htbjci$p3q$1@dough.gmane.org>
References: <4BF69D04.5060506@mlbassoc.com> <htas5g$q1h$1@dough.gmane.org>
	<AANLkTikD-rYl148gtkJZB859Q-hOdV0AXYxuyBdpodpY@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <AANLkTikD-rYl148gtkJZB859Q-hOdV0AXYxuyBdpodpY@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: staging problem
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
X-List-Received-Date: Sun, 23 May 2010 16:03:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-05-10 17:17, Khem Raj wrote:
> On Sun, May 23, 2010 at 2:22 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 21-05-10 16:47, Gary Thomas wrote:
>>>> Trying a clean build
>>>>   MACHINE="beagleboard"
>>>>   DISTRO="angstrom-2008.1"
>>>>   org.openembedded.dev 2c153f33b8ebb807a622ad9ae92ed5341a356740
>>>>
>>>> I get failures like this (in many packages):
> 
> I pushed a fix:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=104b91c471125482eb83893425fb031557e892b4
> 
> That seems to solve the duplicate header problem for me and tk still
> builds. As the commit says, do a 'bitbake glibc' afterwards to have
> packaged-staging restore the headers.
> 
>> hmm. Its deleting the libc header file isn't it. why cant they co-exist.?

packaged-staging reaps all files the recipe staged, so if the recipe is
*overwriting* headers like it was doing you will have missing headers
till you reinstall them. Your glibc regexp.h was gone already.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL+VDSMkyGM64RGpERAlE+AJ0ZLmcPYIy4SymSufBGwDefYY9HJQCfSfsz
cCbXntNX8XdT8vxA5cdPUd8=
=C3cu
-----END PGP SIGNATURE-----



