Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1ImSjt-0000R7-DX
	for openembedded-devel@openembedded.org; Mon, 29 Oct 2007 12:25:01 +0100
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B04B5B487 for openembedded-devel@openembedded.org;
	Mon, 29 Oct 2007 12:15:59 +0100
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Mon, 29 Oct 2007 13:17:14 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHEEJIMKAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <4725AE82.30401@student.utwente.nl>
Importance: Normal
Subject: Re: [oe-commits] org.oe.dev	conf/machine/include/tune-ppc405.inc : Move	TARGET_FPU =	"soft" to the tune file so its
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2007 11:25:02 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Although this is getting OT :)

Buidling with hardfloat for a cpu that does not have an fpu means that
1) You need to have a kernel that supports fp emulation (and actually
provides correct fp results)
2) Have it enabled by default in OE
3) Be prepared to pay the processing penalty as every fp instruction is
going to generate an exeption that needs to be handled by the kernel.

IMHO when you tune to a specific cpu then you make a decision what
"features" you want and let it up to the distro/local.conf to change
something if they have a reason to do so.

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of Koen Kooi
> Sent: Monday, October 29, 2007 11:57 AM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] [oe-commits] org.oe.dev
> conf/machine/include/tune-ppc405.inc : Move TARGET_FPU = "soft"
> to the tune file so its
>
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Stelios Koroneos schreef:
> > ok, point taken.
> > It should default to TARGET_FPU = "soft" only if the
> > distro/machine/local.conf don't define it differently
> > i.e TARGET_FPU ?= "soft"
>
> In OE when TARGET_FPU is unset, it means 'hardfloat', so their shouldn't
> be any mention of TARGET_FPU in a machine.conf.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFHJa6CMkyGM64RGpERAt3gAJkBYy9k1Dl0eAwzVXc8zP7H0elnSACeOhBZ
> j3XmEsMtX8NkgZyI1OT7WiY=
> =2DFG
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




