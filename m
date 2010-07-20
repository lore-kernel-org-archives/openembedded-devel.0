Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObHtM-0006mc-1w for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:50:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObHtE-0003fm-1V for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:50:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 20:50:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 20:50:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 20 Jul 2010 20:46:31 +0200
Message-ID: <i24qu7$qc6$2@dough.gmane.org>
References: <201007201654.41292.schnitzeltony@gmx.de>	<i24ku9$5b7$1@dough.gmane.org>
	<201007201944.05812.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <201007201944.05812.schnitzeltony@gmx.de>
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
X-List-Received-Date: Tue, 20 Jul 2010 18:50:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-07-10 19:44, Andreas Mueller wrote:

>> It's not missing, it's present in all omap3 kernels in .dev that are
>> supported. This incarnation of the test wasn't accepted upstream, but
>> it's easy enough to patch in.
> All the guys sitting on the gumstix tree like me are missing it. The latest driver is simply diabled with a commit msg. like 'does not build for kernel > 2.6.32'

And there's your problem, you're using some unsupported crazy vendor
branch. If you build from .dev, you'll get a perfectly working 2.6.32
kernel with support for cpufreq, cpuidle, latest sgx drivers, dsp
support, etc. I use it on all my overos daily.

I see zero gain in uglifying the current recipe to support crazy vendor
branches that will never get merged. Time is better spent on getting
those vender changes upstream first.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRe8HMkyGM64RGpERAgyQAJoD6BrNE/GXQTBnRqOnTuNgIPwOwQCfcwgW
3HgBIj7R8MngEviSwoK5IV4=
=Afz0
-----END PGP SIGNATURE-----



