Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObGF2-0002FC-29 for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 19:04:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObGEs-00056H-9x for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 19:04:18 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 19:04:18 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 19:04:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 20 Jul 2010 19:04:08 +0200
Message-ID: <i24ku9$5b7$1@dough.gmane.org>
References: <201007201654.41292.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <201007201654.41292.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omap3/powervr-drivers: Cleanups & fixes
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
X-List-Received-Date: Tue, 20 Jul 2010 17:04:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-07-10 16:54, Andreas Mueller wrote:
> From ee328e5f8b905ec8a2c3de1664679ff1c442e7fa Mon Sep 17 00:00:00 2001
> From: Andreas Mueller <schnitzeltony@gmx.de>
> Date: Tue, 20 Jul 2010 16:15:37 +0200
> Subject: [PATCH] omap3/powervr-drivers: Cleanups & fixes
> 
> 1. Merge omap3-sgx-modules -> libgles-omap3:
>       Reduce memory & built time consumption.
>       Note: By 'inherit module' all libgles packages
>       get machine specific.

NAK on that, the split is done this way on purpose. Making the libs
machine specific is NOT acceptable.

> 2. Work around the missing (??) function omap_rev_lt_3_0()

It's not missing, it's present in all omap3 kernels in .dev that are
supported. This incarnation of the test wasn't accepted upstream, but
it's easy enough to patch in.

>       Reading the comment leads to the following
>       interpretation: return true for SGXVersion less than
>       3.x.

It's not SGX rev, since that would be something like 121 or 125, but ES
revision of the omap3.


> 3. Make kernel modules buildable for kernel 2.6.33
>       (fix-1.4.14.2616-for-kernel-gt-2.6.32.patch)
> 4. Install script 'cpu-sgx-rev' returning the SGX version
>       supported by CPU (2.x / 3.x / 5.x)

And NAK on that as well, the existing script handles that already. I
know that since I have all those ES revisions on my desk :)

So basically only 3) and maybe 2) would be acceptable.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRdcIMkyGM64RGpERAndHAKCW5HVAukQqRT1aH51J9UqHXFvbwgCfSiOm
s3L0AyWIfpmPjZcWuM5opTk=
=7yr9
-----END PGP SIGNATURE-----



