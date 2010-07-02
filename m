Received: from pegasus.russound.com ([63.139.215.218])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jims@RUSSOUND.COM>) id 1OUluB-0002nI-Gn
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 21:28:09 +0200
Received: from Powerhog.RUSSOUND.COM (10.0.0.8) by pegasus.RUSSOUND.COM
	(10.0.0.15) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Fri, 2 Jul 2010 15:22:06 -0400
Received: from Powerhog.RUSSOUND.COM ([127.0.0.1]) by powerhog ([127.0.0.1])
	with mapi; Fri, 2 Jul 2010 15:22:06 -0400
From: Jim Sheldon <jims@RUSSOUND.COM>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Jul 2010 15:22:03 -0400
Thread-Topic: [oe] [PATCH] allow KERNEL_IMAGEDEST to be redefined
Thread-Index: AcsaGwNmmcBJILrvSLG31yjKL1Gh+AAABBeA
Message-ID: <7941E07E1E020448937ACA7D4279E6327B86D27E47@powerhog>
References: <> <1278091939-24947-1-git-send-email-jims@russound.com>
	<4C2E3A92.7010504@mentor.com>
In-Reply-To: <4C2E3A92.7010504@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 63.139.215.218
X-SA-Exim-Mail-From: jims@RUSSOUND.COM
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] allow KERNEL_IMAGEDEST to be redefined
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
X-List-Received-Date: Fri, 02 Jul 2010 19:28:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was hoping someone would ask :)

I'm working on a product that will need updates in the field, which means p=
otentially updating u-boot or the kernel.  Right now I'm trying to keep all=
 of my files in one hierarchy for various reasons, so I would rather not us=
e /boot.

Thanks!

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Tom Rini
Sent: Friday, July 02, 2010 3:14 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] allow KERNEL_IMAGEDEST to be redefined

Jim Sheldon wrote:
> Signed-off-by: Jim Sheldon <jims@russound.com>
> ---
>  classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index b0c6534..d9c9eed 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -59,7 +59,7 @@ KERNEL_LD =3D "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL=
_ARCH}"
> =20
>  # Where built kernel lies in the kernel tree
>  KERNEL_OUTPUT ?=3D "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> -KERNEL_IMAGEDEST =3D "boot"
> +KERNEL_IMAGEDEST ?=3D "boot"
> =20
>  #
>  # configuration

OK, so there's nothing wrong with how this or the u-boot one are done,=20
but why?  Thanks!

--=20
Tom Rini
Mentor Graphics Corporation

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


