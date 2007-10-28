Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Im1Fv-0001W1-IV
	for openembedded-devel@openembedded.org; Sun, 28 Oct 2007 07:04:15 +0100
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B04AA320E for openembedded-devel@openembedded.org;
	Sun, 28 Oct 2007 06:55:21 +0100
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Sun, 28 Oct 2007 07:56:36 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHGEIAMKAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
In-Reply-To: <47234FCF.4010204@student.utwente.nl>
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
Subject: Re: [oe-commits] org.oe.dev conf/machine/include/tune-ppc405.inc : Move	TARGET_FPU = "soft" to the tune file so its
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
X-List-Received-Date: Sun, 28 Oct 2007 06:04:16 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

ok, point taken.
It should default to TARGET_FPU = "soft" only if the
distro/machine/local.conf don't define it differently
i.e TARGET_FPU ?= "soft"

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of Koen Kooi
> Sent: Saturday, October 27, 2007 5:49 PM
> To: Using the OpenEmbedded metadata to build Distributions
> Subject: Re: [oe] [oe-commits] org.oe.dev
> conf/machine/include/tune-ppc405.inc : Move TARGET_FPU = "soft"
> to the tune file so its
>
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> ifaistos commit schreef:
> > conf/machine/include/tune-ppc405.inc : Move TARGET_FPU    =
> "soft" to the tune file so its
> > get used by all machines that have a amcc405 cpu
>
> If the ppc kernel has a floating point emulator, this setting should be
> moved to the distrobution, since it's policy.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFHI0/OMkyGM64RGpERAhaJAJ45iudeERW/KCWNIDG8trBIp0rFvgCfSb86
> XUXK0oRevc8E/wMXQPaRiRg=
> =O3km
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




