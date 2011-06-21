Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QZ267-0004Ky-Qg
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 16:38:36 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p5LETxoK030409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 21 Jun 2011 09:29:59 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p5LETwqG027782;
	Tue, 21 Jun 2011 09:29:58 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p5LETwr7019568;
	Tue, 21 Jun 2011 09:29:58 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Tue, 21 Jun 2011 09:29:58 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jun 2011 09:29:55 -0500
Thread-Topic: [PATCH] kernel bbclass: add the crypto directory to staging
Thread-Index: AcwsW6tgDZfh+SUhTpKO4eVF+e+mvADO2ASg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B416E85@dlee06.ent.ti.com>
References: <1308252543-24363-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1308252543-24363-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Turner, Greg" <gregturner@ti.com>
Subject: Re: [PATCH] kernel bbclass: add the crypto directory to staging
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
X-List-Received-Date: Tue, 21 Jun 2011 14:38:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ping on this patch.  I've seen one ACK so far.

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
> Sent: Thursday, June 16, 2011 2:29 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase; Turner, Greg
> Subject: [PATCH] kernel bbclass: add the crypto directory to staging
>=20
> * Add the include/crypto directory from the kernel to the list
>   of directories to be staged.
> * This directory contains the cryptodev.h file required by other
>   drivers and applications.
> * Not including this directory leads to build errors of being
>   unable to find the cryptodev.h file.
>=20
> Signed-off-by: Greg Turner <gregturner@ti.com>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 8817186..bd7b23f 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -188,7 +188,7 @@ sysroot_stage_all_append() {
>  	mkdir -p $kerneldir/include/asm-generic
>  	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
>=20
> -	for entry in drivers/crypto drivers/media include/generated
> include/linux include/net include/pcmcia include/media include/acpi
> include/sound include/video include/scsi include/trace include/mtd
> include/rdma include/drm include/xen crypto/ocf; do
> +	for entry in drivers/crypto drivers/media include/generated
> include/linux include/net include/pcmcia include/media include/acpi
> include/sound include/video include/scsi include/trace include/mtd
> include/rdma include/drm include/xen crypto/ocf include/crypto; do
>  		if [ -d $entry ]; then
>  			mkdir -p $kerneldir/$entry
>  			cp -fR $entry/* $kerneldir/$entry/
> --
> 1.7.0.4



