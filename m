Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URS7u-0007IA-BF
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 20:58:18 +0200
Received: by mail-ee0-f45.google.com with SMTP id c50so1875314eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 11:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c5FwJZA66MZwXEvc3/xWd7ue0aOvXWjVJE7/zzxjkmo=;
	b=qj7nSNPnTl36dWT0zHnSRzarMAnHh0GMhOLpfSDWzW1DsER83Geu0lyBvKm/UbG/C7
	K+nXiKNrUKHd9HFAd7mfKW7Pnn7xSHVyYH4xMI67Jc168IZdUYMQS3PxOAOGf3CnWC3F
	lTPojquTwPpTqkHkaRc69yBivWFb7T17/26rru1pwtUe9oKkNXNHBVk/PysvexqCfPd3
	tp7HC7em0+m0vHJeTf7P9sQRHV/pIpVldbh7eMIkjwkbgk2xpso8wThGzflPpV4gMZkM
	LZh4AKf3xYJ1YnETgKjY17OEErjisWSqmOaCHDuEg0dtkdAqlAdo2quGu/ueVrVv2g4q
	w+Cw==
X-Received: by 10.14.110.198 with SMTP id u46mr53558709eeg.41.1365964842677;
	Sun, 14 Apr 2013 11:40:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bk42sm22884435eeb.3.2013.04.14.11.40.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 11:40:41 -0700 (PDT)
Date: Sun, 14 Apr 2013 20:40:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130414184047.GJ2475@jama>
References: <1365961831-6466-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1365961831-6466-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.8: remove patch already upstream
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
X-List-Received-Date: Sun, 14 Apr 2013 18:58:40 -0000
X-Groupsio-MsgNum: 44177
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sT9gWZPUZYhvPS56"
Content-Disposition: inline

--sT9gWZPUZYhvPS56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2013 at 07:50:31PM +0200, Andrea Adami wrote:
> * the spitz_pm patch was pushed upstream with commit
> * id 510fcb0d331f314cd20d0067d56f29302846f47b
> *
> * remove it to unbreak do_patch

Now it builds with latest oe-core, but still doesn't boot for me.

> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-yocto-3.8/akita/akita.scc          |  1 -
>  .../linux/linux-yocto-3.8/spitz/spitz.scc          |  1 -
>  .../linux/linux-yocto-3.8/spitz_pm.patch           | 53 ----------------=
------
>  3 files changed, 55 deletions(-)
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
>=20
> diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/recip=
es-kernel/linux/linux-yocto-3.8/akita/akita.scc
> index e1549ef..bad38c4 100644
> --- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
> +++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
> @@ -6,6 +6,5 @@ include ../zaurus-common.scc
>  include ../zaurus-usb-host.scc
> =20
>  patch sharpsl_param.patch
> -patch spitz_pm.patch
>  patch pxa27x-sa1100-rtc.patch
>  patch spi-pxa2xx-fix-mem.patch
> diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/recip=
es-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> index fe6aac8..f9f9381 100644
> --- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> +++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> @@ -5,6 +5,5 @@ include ../zaurus-common.scc
>  include ../zaurus-usb-host.scc
> =20
>  patch sharpsl_param.patch
> -patch spitz_pm.patch
>  patch pxa27x-sa1100-rtc.patch
>  patch spi-pxa2xx-fix-mem.patch
> diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch b/recipe=
s-kernel/linux/linux-yocto-3.8/spitz_pm.patch
> deleted file mode 100644
> index 34bcb9d..0000000
> --- a/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -Subject: [PATCH] [ARM] pxa/spitz_pm.c: Fix hang under certain conditions=
 when resuming from STR.
> -
> -Devices that use spitz_pm.c will fail to resume
> -from STR (Suspend To Ram) when the charger plug is inserted
> -or removed when a device is in STR mode. The culprit is
> -a misconfigured gpio line - GPIO18. GPIO18 should be configured as a
> -regular GPIO input but it gets configured as an alternate function
> -GPIO18_RDY. And then later in postsuspend() it gets configured as
> -a regular GPIO18 input line.
> -
> -Fix this by removing the GPIO18_RDY configuration so that GPIO18
> -only gets configured as a regular gpio input.
> -
> -Signed-off-by: Marko Katic <dromede@gmail.com>
> ----
> - arch/arm/mach-pxa/spitz_pm.c |    8 ++------
> - 1 files changed, 2 insertions(+), 6 deletions(-)
> -
> -diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
> -index 438f02f..842596d 100644
> ---- a/arch/arm/mach-pxa/spitz_pm.c
> -+++ b/arch/arm/mach-pxa/spitz_pm.c
> -@@ -86,10 +86,7 @@ static void spitz_discharge1(int on)
> - 	gpio_set_value(SPITZ_GPIO_LED_GREEN, on);
> - }
> -=20
> --static unsigned long gpio18_config[] =3D {
> --	GPIO18_RDY,
> --	GPIO18_GPIO,
> --};
> -+static unsigned long gpio18_config =3D GPIO18_GPIO;
> -=20
> - static void spitz_presuspend(void)
> - {
> -@@ -112,7 +109,7 @@ static void spitz_presuspend(void)
> - 	PGSR3 &=3D ~SPITZ_GPIO_G3_STROBE_BIT;
> - 	PGSR2 |=3D GPIO_bit(SPITZ_GPIO_KEY_STROBE0);
> -=20
> --	pxa2xx_mfp_config(&gpio18_config[0], 1);
> -+	pxa2xx_mfp_config(&gpio18_config, 1);
> - 	gpio_request_one(18, GPIOF_OUT_INIT_HIGH, "Unknown");
> - 	gpio_free(18);
> -=20
> -@@ -131,7 +128,6 @@ static void spitz_presuspend(void)
> -=20
> - static void spitz_postsuspend(void)
> - {
> --	pxa2xx_mfp_config(&gpio18_config[1], 1);
> - }
> -=20
> - static int spitz_should_wakeup(unsigned int resume_on_alarm)
> ---=20
> -1.7.4.1
> --=20
> 1.8.1.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sT9gWZPUZYhvPS56
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFq+C8ACgkQN1Ujt2V2gBwjkwCfTinQX0ubOSz/7vOEe8dK5Bz6
JawAn3njLkeEqnaprGCxGgST1ZGwykm9
=u0Bd
-----END PGP SIGNATURE-----

--sT9gWZPUZYhvPS56--
