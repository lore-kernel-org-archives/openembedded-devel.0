Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UJ2E5-0005km-9X
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 14:41:46 +0100
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2MDNmao019425
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 08:23:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2MDNm7c022427
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 08:23:48 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 22 Mar 2013 08:23:47 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 22 Mar 2013 08:23:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][PATCH][for-danny] kernel bbclass: return to
	original directory in do_deploy
Thread-Index: AQHOJAEX/S6brAnqy0ybqt9akN2IRpixuNDQ
Date: Fri, 22 Mar 2013 13:23:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159492B24@DLEE11.ent.ti.com>
References: <1363629028-6920-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1363629028-6920-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH][for-danny] kernel bbclass: return to original directory in do_deploy
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
X-List-Received-Date: Fri, 22 Mar 2013 13:41:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ping on this patch.  I did not submit for master since the master branch ha=
s already removed the kernel.bbclass.


> -----Original Message-----
> From: Maupin, Chase
> Sent: Monday, March 18, 2013 12:50 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [oe][meta-oe][PATCH][for-danny] kernel bbclass: return
> to original directory in do_deploy
>=20
> * During the base kernel_do_deploy function the directory is
>   changed to DEPLOYDIR in order to do some cleanup and
> symlinking.
>   However, the directory is not changed back to the original
>   starting directory ${S} at the end.  For append functions this
>   means that the starting directory is not ${S} as expected but
>   instead ${DEPLOYDIR}.
>=20
>   For functions like the do_deploy_append in
>   recipes-kernel/linux/linux-dtb.inc there is an assumption that
>   you are still in the source directory and not the DEPLOYDIR.
>   Without this change the .dtb files are not copied because the
>   check for the existence of ${DTS_FILE} which is a relative
>   path from the ${S} directory fails.  This means that the .dtb
>   files are not copied into the deploy directory and subsequently
>   the deploy/images directory.
>=20
>   In the log.do_deploy file you will see lines like:
>=20
>     Warning: arch/arm/boot/dts/xxxxx.dts is not available!
>=20
>   This fix has also been picked up in the oe-core kernel.bbclass:
>=20
>   http://cgit.openembedded.org/openembedded-
> core/commit/?id=3Dfd5d80ab1a405cb4ef94f2cde25f8c251da490f0
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta-oe/classes/kernel.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/classes/kernel.bbclass b/meta-
> oe/classes/kernel.bbclass
> index 25c5f64..a0f67f9 100644
> --- a/meta-oe/classes/kernel.bbclass
> +++ b/meta-oe/classes/kernel.bbclass
> @@ -546,6 +546,7 @@ kernel_do_deploy() {
>  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
>=20
>  	cp ${COREBASE}/meta/files/deploydir_readme.txt
> ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +	cd -
>  }
>  do_deploy[dirs] =3D "${DEPLOYDIR} ${B}"
>=20
> --
> 1.7.0.4



