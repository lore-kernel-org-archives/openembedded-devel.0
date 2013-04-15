Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URgEi-00073H-Hd
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 12:02:10 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so2060853ead.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rwQuUy2usdOaTpgY1ZDEj+9SzjIeyQwPTPavb4k2L44=;
	b=j0HX7Mh/sUcsuU0xonqBVOpBOiW6R6LluQdFGIRPDMPce92e/AC/Dl5DurrNmMxszq
	r2qiDBhaSc44tMZsCRx9kTelDu8PEGwWMraeSdvKtnqO7y2RYDgHvU5PDU+OTwxr5JY7
	ER94f3K4UowWaj5DPz6Th30gl6XcPvxaJHqluiLDJ7WQgIn2foiRZESEaarh8f8q2Gdh
	v4zYYQTkWcPIev+LZbNYkmCfFTf+gT9YNXjjoeBjpqt7yBXHIy1BIcteR+MSb80z563q
	2eITXCSk3ZhDozbl5gWK68szMIXarKz3bWpha7IOhC7+PP59KOCFBJLxMqbIMHvz36LS
	2zGg==
X-Received: by 10.14.107.69 with SMTP id n45mr60294543eeg.23.1366019080111;
	Mon, 15 Apr 2013 02:44:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u44sm25894435eel.7.2013.04.15.02.44.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 02:44:39 -0700 (PDT)
Date: Mon, 15 Apr 2013 11:44:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130415094445.GL2475@jama>
References: <1365961831-6466-1-git-send-email-andrea.adami@gmail.com>
	<20130414184047.GJ2475@jama>
	<CAAQYJAuk0bW6Sg871Zs__PhcTLZq04xJtGJN8VYKuciZxVAnbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAuk0bW6Sg871Zs__PhcTLZq04xJtGJN8VYKuciZxVAnbg@mail.gmail.com>
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
X-List-Received-Date: Mon, 15 Apr 2013 10:02:10 -0000
X-Groupsio-MsgNum: 44188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oOpJzULQ70+PGW7h"
Content-Disposition: inline

--oOpJzULQ70+PGW7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 11:20:18AM +0200, Andrea Adami wrote:
> On Sun, Apr 14, 2013 at 8:40 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Sun, Apr 14, 2013 at 07:50:31PM +0200, Andrea Adami wrote:
> >> * the spitz_pm patch was pushed upstream with commit
> >> * id 510fcb0d331f314cd20d0067d56f29302846f47b
> >> *
> >> * remove it to unbreak do_patch
> >
> > Now it builds with latest oe-core, but still doesn't boot for me.
>=20
> There is an outstanding regression due to the power regulators rework:
> boot from SD/CF card is atm impossible on pxa Zaurus (and on collie
> too, until refresh of thesing's locomo_spi patch). We are working on
> it.
>=20
> Thanks for your testings

Could you prepare some easy way to enable debug in all 3 components
(linux-kexecboot, kexecboot itself, linux)?

Something like we had in=20
http://git.openembedded.org/meta-handheld/commit/?id=3D584e66b8e21a0f40b26f=
0a1d2fa5907856996336

It would be nice of occasional testers (which don't like l-y) to just=20
flip one switch, rebuild and get useful output on serial line.

Cheers,

>=20
> Cheers
>=20
> Andrea
>=20
> >
> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >> ---
> >>  .../linux/linux-yocto-3.8/akita/akita.scc          |  1 -
> >>  .../linux/linux-yocto-3.8/spitz/spitz.scc          |  1 -
> >>  .../linux/linux-yocto-3.8/spitz_pm.patch           | 53 -------------=
---------
> >>  3 files changed, 55 deletions(-)
> >>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
> >>
> >> diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/re=
cipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
> >> index e1549ef..bad38c4 100644
> >> --- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
> >> +++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
> >> @@ -6,6 +6,5 @@ include ../zaurus-common.scc
> >>  include ../zaurus-usb-host.scc
> >>
> >>  patch sharpsl_param.patch
> >> -patch spitz_pm.patch
> >>  patch pxa27x-sa1100-rtc.patch
> >>  patch spi-pxa2xx-fix-mem.patch
> >> diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/re=
cipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> >> index fe6aac8..f9f9381 100644
> >> --- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> >> +++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> >> @@ -5,6 +5,5 @@ include ../zaurus-common.scc
> >>  include ../zaurus-usb-host.scc
> >>
> >>  patch sharpsl_param.patch
> >> -patch spitz_pm.patch
> >>  patch pxa27x-sa1100-rtc.patch
> >>  patch spi-pxa2xx-fix-mem.patch
> >> diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch b/rec=
ipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
> >> deleted file mode 100644
> >> index 34bcb9d..0000000
> >> --- a/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
> >> +++ /dev/null
> >> @@ -1,53 +0,0 @@
> >> -Subject: [PATCH] [ARM] pxa/spitz_pm.c: Fix hang under certain conditi=
ons when resuming from STR.
> >> -
> >> -Devices that use spitz_pm.c will fail to resume
> >> -from STR (Suspend To Ram) when the charger plug is inserted
> >> -or removed when a device is in STR mode. The culprit is
> >> -a misconfigured gpio line - GPIO18. GPIO18 should be configured as a
> >> -regular GPIO input but it gets configured as an alternate function
> >> -GPIO18_RDY. And then later in postsuspend() it gets configured as
> >> -a regular GPIO18 input line.
> >> -
> >> -Fix this by removing the GPIO18_RDY configuration so that GPIO18
> >> -only gets configured as a regular gpio input.
> >> -
> >> -Signed-off-by: Marko Katic <dromede@gmail.com>
> >> ----
> >> - arch/arm/mach-pxa/spitz_pm.c |    8 ++------
> >> - 1 files changed, 2 insertions(+), 6 deletions(-)
> >> -
> >> -diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_p=
m.c
> >> -index 438f02f..842596d 100644
> >> ---- a/arch/arm/mach-pxa/spitz_pm.c
> >> -+++ b/arch/arm/mach-pxa/spitz_pm.c
> >> -@@ -86,10 +86,7 @@ static void spitz_discharge1(int on)
> >> -     gpio_set_value(SPITZ_GPIO_LED_GREEN, on);
> >> - }
> >> -
> >> --static unsigned long gpio18_config[] =3D {
> >> --    GPIO18_RDY,
> >> --    GPIO18_GPIO,
> >> --};
> >> -+static unsigned long gpio18_config =3D GPIO18_GPIO;
> >> -
> >> - static void spitz_presuspend(void)
> >> - {
> >> -@@ -112,7 +109,7 @@ static void spitz_presuspend(void)
> >> -     PGSR3 &=3D ~SPITZ_GPIO_G3_STROBE_BIT;
> >> -     PGSR2 |=3D GPIO_bit(SPITZ_GPIO_KEY_STROBE0);
> >> -
> >> --    pxa2xx_mfp_config(&gpio18_config[0], 1);
> >> -+    pxa2xx_mfp_config(&gpio18_config, 1);
> >> -     gpio_request_one(18, GPIOF_OUT_INIT_HIGH, "Unknown");
> >> -     gpio_free(18);
> >> -
> >> -@@ -131,7 +128,6 @@ static void spitz_presuspend(void)
> >> -
> >> - static void spitz_postsuspend(void)
> >> - {
> >> --    pxa2xx_mfp_config(&gpio18_config[1], 1);
> >> - }
> >> -
> >> - static int spitz_should_wakeup(unsigned int resume_on_alarm)
> >> ---
> >> -1.7.4.1
> >> --
> >> 1.8.1.5
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oOpJzULQ70+PGW7h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFrzA0ACgkQN1Ujt2V2gBzpZACdGRsR2HGYBhKjs1CQzSSac7zL
Wj4AnRKj7HpUI6uG1gpZfoYu9aHbYzKf
=jR4z
-----END PGP SIGNATURE-----

--oOpJzULQ70+PGW7h--
