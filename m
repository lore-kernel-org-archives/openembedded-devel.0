Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Of9Q8-0008CG-UU for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 12:36:01 +0200
Received: from f053040133.adsl.alicedsl.de ([78.53.40.133]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Of9Pp-0001Y6-NQ for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 10:35:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1280504555-3633-1-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1280504555-3633-1-git-send-email-aalonso00@gmail.com>
Date: Sat, 31 Jul 2010 12:35:39 +0200
Message-ID: <1280572539.3721.32.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 01/10] xilinx-bsp: handle more xilinx targets
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
X-List-Received-Date: Sat, 31 Jul 2010 10:36:01 -0000
X-Groupsio-MsgNum: 21675
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Sy58ZUDOtdRAqytv0+XM"

--=-Sy58ZUDOtdRAqytv0+XM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Adrian,


somehow your MUA is broken. It is setting the following lines in the
mail header, which in my opinion is wrong for =E2=80=9Cthread starting=E2=
=80=9D message.

        In-Reply-To: <openembedded-devel@lists.openembedded.org>
        References: <openembedded-devel@lists.openembedded.org>

I checked with other patches sent to the list list and they do not do
this as far as I can see.

Am Freitag, den 30.07.2010, 10:42 -0500 schrieb Adrian Alonso:

I think the preferred subject line is.

xilinx-bsp.bbclass: Rewrite to handle xilinx =C2=BBenter new models=C2=AB

> * Rewrite for handling most xilinx platforms
> * Add helper functions for configuring the target board
> * User must add in local.conf:
>   TARGET_ARCH =3D "powerpc" | "microblaze"
>   XILINX_BOARD =3D "ml401" | "ml403" | "ml410" | "ml507" | "ml510"
>   whit this varibales u-boot and the linux kernel gets configured

s/whit/with/
s/varibales/variables/

>   for a selected board.
>=20
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  classes/xilinx-bsp.bbclass |  109 +++++++++++++++++++++++++++++++++++---=
------
>  1 files changed, 87 insertions(+), 22 deletions(-)
>=20
> diff --git a/classes/xilinx-bsp.bbclass b/classes/xilinx-bsp.bbclass
> index d32c60e..35f7108 100644
> --- a/classes/xilinx-bsp.bbclass
> +++ b/classes/xilinx-bsp.bbclass
> @@ -14,6 +14,47 @@
>  #Xilinx ML403
>  #Xilinx ML507
>  #More to come soon ;)
> +#oenote "ML403 board setup"
> +# Treat this as legacy substitution find when xparatemer was deprecated =
in favor of dts
> +#cp -pPR ${XILINX_BSP_PATH}/ppc405_0/libsrc/linux_2_6_v1_00_a/linux/arch=
/ppc/platforms/4xx/xparameters/xparameters_ml40x.h \
> +#${S}/arch/ppc/platforms/4xx/xparameters/xparameters_ml403.h

Is the commented stuff needed?

> +def map_target(a, d):
> +	import re
> +	board =3D bb.data.getVar('XILINX_BOARD', d, 1)
> +
> +	if re.match('powerpc', a):
> +		cpu =3D bb.data.getVar('TARGET_CPU', d, 1)
> +		return 'ppc' + cpu + '-' + board
> +	else:
> +		return 'system'
> +
> +
> +def uboot_machine(a, d):
> +	import re
> +
> +	board =3D bb.data.getVar('XILINX_BOARD', d, 1)
> +
> +	if board in ['ml300', 'ml401', 'ml405', 'ml507']:
> +		return board + '_config'
> +	elif re.match('powerpc', a):
> +		return 'xilinx-ppc' + bb.data.getVar('TARGET_CPU', d, 1) + '-generic_c=
onfig'
> +	else:
> +		return 'microblaze-generic_config'
> +
> +def uboot_target(a, d):
> +	import re
> +
> +	board =3D bb.data.getVar('XILINX_BOARD', d, 1)
> +	target =3D bb.data.getVar('TARGET_CPU', d, 1) + '-generic'
> +
> +	if board in ['ml300', 'ml401', 'ml405', 'ml507']:
> +		return board
> +	elif re.match('powerpc', a):
> +		return 'ppc' + target
> +	else:
> +		return target
> +
> =20
>  do_configure_prepend() {
> =20
> @@ -21,27 +62,47 @@ do_configure_prepend() {
>  #now depending on the board type and arch do what is nessesary
> =20
>  if [ -n "${XILINX_BSP_PATH}" ]; then
> -	case "${XILINX_BOARD}" in
> -		ml403 | ML403)
> -			oenote "ML403 board setup"
> -			cp -pPR ${XILINX_BSP_PATH}/ppc405_0/libsrc/linux_2_6_v1_00_a/linux/ar=
ch/ppc/platforms/4xx/xparameters/xparameters_ml40x.h \
> -                ${S}/arch/ppc/platforms/4xx/xparameters/xparameters_ml40=
3.h
> -		;;
> -		ml507 | ML507)
> -			oenote "Xilinx ML507 board setup"
> +	if [ -n "${XILINX_BOARD}" ]; then
> +		if [ -d "${S}/arch/${TARGET_ARCH}/boot" ]; then
>  			dts=3D`find "${XILINX_BSP_PATH}" -name *.dts -print`
> -			if [ -n "$dts" ]; then
> -				oenote "Replacing device tree with ${dts}"
> -				cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex440-ml507.dts
> +			if [ -e "$dts" ]; then
> +				oenote "Replacing device tree to match hardware model"

If you care, you could add full stops at the end of sentences.

> +				if [ "${TARGET_ARCH}" =3D=3D "powerpc" ]; then
> +					cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex${TARGET_BOARD}.dts
> +				else
> +					cp -pP ${dts} ${S}/arch/microblaze/platform/generic/${TARGET_BOARD}=
.dts
> +				fi
>  			else
> -				oenote "Device tree not found in project dir"
> +				oefatal "No device tree found, missing hardware ref design?"
> +				exit 1
>  			fi
> -		;;
> -		*)
> -			oefatal "! Unknow Xilinx board ! Exit ..."
> -			exit 1
> -		;;
> -	esac
> +		elif [ -d "${S}/board/xilinx" ]; then
> +			oenote "Replacing xparameters header to match hardware model"
> +			#xparam=3D`find "${XILINX_BSP_PATH}" -name xparameters.h -print`

Can this commented line be removed?

> +			if [ "${TARGET_ARCH}" =3D=3D "powerpc" ]; then
> +				xparam=3D"${XILINX_BSP_PATH}/ppc${TARGET_CPU}_0/include/xparameters.=
h"
> +				cpu=3D"PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
> +			else
> +				xparam=3D"${XILINX_BSP_PATH}/${TARGET_CPU}_0/include/xparameters.h"
> +				cpu=3D`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`
> +			fi
> +			if [ -e "$xparam" ]; then
> +				cp ${xparam} ${S}/board/xilinx/${UBOOT_TARGET}
> +				echo "/*** Cannonical definitions ***/
> +#define XPAR_PLB_CLOCK_FREQ_HZ XPAR_PROC_BUS_0_FREQ_HZ
> +#define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_${cpu}_CORE_CLOCK_FREQ_HZ
> +#ifndef XPAR_DDR2_SDRAM_MEM_BASEADDR
> +# define XPAR_DDR2_SDRAM_MEM_BASEADDR XPAR_DDR_SDRAM_MPMC_BASEADDR
> +#endif
> +#define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >> ${S}/board/xilinx/${UBOOT_TARG=
ET}/xparameters.h
> +			else
> +				oefatal "No xparameters header file found, missing hardware ref desi=
gn?"
> +			fi
> +		fi
> +	else
> +		oefatal "XILINX_BOARD not defined ! Exit"
> +		exit 1
> +	fi
>  else
>  	oefatal "XILINX_BSP_PATH not defined ! Exit"
>  	exit 1
> @@ -49,7 +110,11 @@ fi
> =20
>  }
> =20
> -
> -
> -
> -
> +do_deploy_prepend() {
> +# Install u-boot elf image
> +if [ -d "${XILINX_BSP_PATH}" ]; then
> +	if [ -e "${S}/u-boot" ]; then
> +		install ${S}/u-boot ${XILINX_BSP_PATH}
> +	fi
> +fi
> +}


Thanks,

Paul

--=-Sy58ZUDOtdRAqytv0+XM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxT/HsACgkQPX1aK2wOHViO3ACgg59u2oJKe90IzHjiFXMQhmZg
ORUAnjXza7n3fJ0N4N1oBtZYS5cCHUMR
=9sMz
-----END PGP SIGNATURE-----

--=-Sy58ZUDOtdRAqytv0+XM--
