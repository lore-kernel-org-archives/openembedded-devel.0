Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PObYu-0007Bz-4g
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 20:44:57 +0100
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id oB3JhUEh022569
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Dec 2010 13:43:30 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id oB3JhUu5017878;
	Fri, 3 Dec 2010 13:43:30 -0600 (CST)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oB3JhUW8027713;
	Fri, 3 Dec 2010 13:43:30 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 3 Dec 2010 13:43:30 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Melissa Watkins <mwatkins.ti@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Dec 2010 13:43:28 -0600
Thread-Topic: [PATCH 6/6] defconfig: Add omapl138 defconfig file
Thread-Index: AcuTISlfQld13Mo6RXGugPArn7usNwAALS5A
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329CC1EDC@dlee06.ent.ti.com>
References: <1291390869-14422-1-git-send-email-m-watkins@ti.com>
In-Reply-To: <1291390869-14422-1-git-send-email-m-watkins@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Watkins, Melissa" <m-watkins@ti.com>
Subject: Re: [PATCH 6/6] defconfig: Add omapl138 defconfig file
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
X-List-Received-Date: Fri, 03 Dec 2010 19:44:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

My main comment here is that these patches might be better in a different o=
rder.  Currently if they were applied one at a time they would fail because=
 of the dependency order.  I would suggest re-ordering the existing patches=
 into the following order:

0005
0006
0004
0003
0002
0001

Sorry that I didn't notice this the first time I looked at these patches.

> -----Original Message-----
> From: Melissa Watkins [mailto:mwatkins.ti@gmail.com]
> Sent: Friday, December 03, 2010 9:41 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Watkins, Melissa; Maupin, Chase
> Subject: [PATCH 6/6] defconfig: Add omapl138 defconfig file
>=20
> * Add defconfig file for omapl138 machines
>=20
> Signed-off-by: Melissa Watkins <m-watkins@ti.com>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  recipes/linux/linux-davinci/omapl138/defconfig |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/linux/linux-davinci/omapl138/defconfig
> b/recipes/linux/linux-davinci/omapl138/defconfig
> index 8462139..ad52484 100644
> --- a/recipes/linux/linux-davinci/omapl138/defconfig
> +++ b/recipes/linux/linux-davinci/omapl138/defconfig
> @@ -1383,6 +1383,7 @@ CONFIG_USB_MUSB_HDRC=3Dy
>  CONFIG_USB_MUSB_SOC=3Dy
>  CONFIG_USB_MUSB_HOST=3Dy
>  # CONFIG_USB_MUSB_PERIPHERAL is not set
> +# CONFIG_USB_MUSB_DUAL_ROLE is not set
>  # CONFIG_USB_MUSB_OTG is not set
>  CONFIG_USB_MUSB_HDRC_HCD=3Dy
>  # CONFIG_MUSB_PIO_ONLY is not set
> @@ -1557,7 +1558,12 @@ CONFIG_RTC_INTF_DEV=3Dy
>  CONFIG_RTC_DRV_OMAP=3Dy
>  # CONFIG_DMADEVICES is not set
>  # CONFIG_AUXDISPLAY is not set
> -# CONFIG_UIO is not set
> +CONFIG_UIO=3Dy
> +# CONFIG_UIO_PDRV is not set
> +# CONFIG_UIO_PDRV_GENIRQ is not set
> +# CONFIG_UIO_SMX is not set
> +# CONFIG_UIO_SERCOS3 is not set
> +CONFIG_UIO_PRUSS=3Dm
>=20
>  #
>  # TI VLYNQ
> --
> 1.7.0.4



