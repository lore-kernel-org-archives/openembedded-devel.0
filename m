Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nwalc-0008Ah-Hf for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 14:42:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NwaiT-0008Ax-CQ for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 14:38:45 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 14:38:45 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 14:38:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 30 Mar 2010 14:38:33 +0200
Message-ID: <hosrca$7qu$1@dough.gmane.org>
References: <1269730499.4033.176.camel@mattotaupa>	<hon5i2$8iq$1@dough.gmane.org>
	<1269797481.8018.80.camel@mattotaupa>	<hooat6$p3d$1@dough.gmane.org>
	<1269949824.4103.38.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1269949824.4103.38.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autotool.bbclass: Remove `EXTRA_AUTORECONF = "--exclude=autopoint"`.
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
X-List-Received-Date: Tue, 30 Mar 2010 12:42:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-03-10 13:50, Paul Menzel wrote:
> In commit 0f235b0f42575bfb50dd891cf44aa08c2e404a67 [1] `autotools.bbclass` was imported from BitKeeper. According to rwhitby on IRC the original author of `autotool.bbclass` cannot be found out anymore, so the reason why Autopoint has to be excluded not known.
> 
> Having `EXTRA_AUTORECONF = "--exclude=autopoint"` in `autotools.bbclass` forces the usage of same hacks to prevent failure of `do_configure` [2].
> 
>     configure.ac:35: required file `./config.rpath' not found
> 
> I ran a build from scratch with `EXTRA_AUTORECONF = "--exclude=autopoint"` from `autotools.bbclass` and did not see any regressions.

I wonder if we only should run autopoint if there are AM_GNU_GETTEXT*
macros in configure.{in,ac}, or does autopoint take care of that
automagically?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLsfDIMkyGM64RGpERAr5dAKCl8GLU8pRCw+IkXw4cWyoII2S27wCguWQG
IdFWfa67U2/EDL5UZu5+4Sc=
=7vtE
-----END PGP SIGNATURE-----



