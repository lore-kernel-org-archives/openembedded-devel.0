Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PzW6Z-0001JI-B6
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 16:24:16 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2FFG5rk028026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Mar 2011 10:16:05 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p2FFG5RI010812;
	Tue, 15 Mar 2011 10:16:05 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2FFG55v024109;
	Tue, 15 Mar 2011 10:16:05 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Tue, 15 Mar 2011 10:16:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Mar 2011 10:16:03 -0500
Thread-Topic: [PATCH] u-boot.inc: allow variable make targets
Thread-Index: AcvjHykhaFo1c+YYRUu8TL4Y/2rnywABJBuQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803409A86B3@dlee06.ent.ti.com>
References: <1300200121-31822-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1300200121-31822-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Tue, 15 Mar 2011 15:24:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I should have probably clarified that this was intended for the 2011.03-mai=
ntenance branch.  Tom, I have also submitted this to the oe-core.  Would yo=
u be willing to pick this up?

Sincerely,
Chase Maupin
Open Platforms
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Tuesday, March 15, 2011 9:42 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH] u-boot.inc: allow variable make targets
>=20
> * Later versions of u-boot sometimes have top level make targets
>   such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
>   u-boot.ti.
> * These targets define different calls to the mkimage tool to
>   change the images created, such as changing the load address.
> * This change allows recipes to change the default make target
>   of "all" to something like u-boot.ti or u-boot.imx by setting
>   the UBOOT_MAKE_TARGET variable.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes/u-boot/u-boot.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/u-boot/u-boot.inc b/recipes/u-boot/u-boot.inc
> index 88c6a4d..ffd1e1e 100644
> --- a/recipes/u-boot/u-boot.inc
> +++ b/recipes/u-boot/u-boot.inc
> @@ -16,6 +16,7 @@ UBOOT_MACHINE ?=3D "${MACHINE}_config"
>  UBOOT_BINARY ?=3D "u-boot.bin"
>  UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.bin"
>  UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.bin"
> +UBOOT_MAKE_TARGET ?=3D "all"
>=20
>  do_configure () {
>  	oe_runmake ${UBOOT_MACHINE}
> @@ -25,7 +26,7 @@ do_compile () {
>  	unset LDFLAGS
>  	unset CFLAGS
>  	unset CPPFLAGS
> -	oe_runmake all
> +	oe_runmake ${UBOOT_MAKE_TARGET}
>  	oe_runmake tools env HOSTCC=3D"${CC}"
>  }
>=20
> --
> 1.7.0.4



