Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGvzX-0002Ru-Hu for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 18:29:00 +0200
Received: from f053036031.adsl.alicedsl.de ([78.53.36.31]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGvy0-00005K-46; Mon, 02 May 2011 16:27:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4dbed1f4.0bf98e0a.0637.7f2b@mx.google.com>
References: <4dbed1f4.0bf98e0a.0637.7f2b@mx.google.com>
Date: Mon, 02 May 2011 18:26:22 +0200
Message-ID: <1304353582.3949.76.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: nagendra@mistralsolutions.com, srinath@mistralsolutions.com
Subject: Re: [PATCH] Ethernet macid display fix
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
X-List-Received-Date: Mon, 02 May 2011 16:29:00 -0000
X-Groupsio-MsgNum: 31568
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-awu67HhEL88sl7BJtNjN"

--=-awu67HhEL88sl7BJtNjN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Anil,


thank you for your patch.

Am Montag, den 02.05.2011, 21:16 +0530 schrieb Anil Kumar:
> >From c832c7142d5f351e4e0eabba5f51ec9bba921354 Mon Sep 17 00:00:00 2001
> From: Anil Kumar <anilm@mistralsolutions.com>
> Date: Mon, 2 May 2011 20:56:13 +0530
> Subject: [PATCH] Ethernet macid display fix

`git format-patch` creates a mbox file you can directly with Mutt.

> Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
> ---
>  .../0004-Ethernet-MACID-display-fix.patch          |  124 ++++++++++++++=
++++++
>  recipes/u-boot/u-boot_git.bb                       |    3 +-
>  2 files changed, 126 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-=
MACID-display-fix.patch
>=20
> diff --git a/recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-MACID-d=
isplay-fix.patch b/recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-MAC=
ID-display-fix.patch
> new file mode 100644
> index 0000000..246aa14
> --- /dev/null
> +++ b/recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-MACID-display-=
fix.patch
> @@ -0,0 +1,124 @@
> +From 76d9a5352c1a4abf2911ea2643e4372d30c10d32 Mon Sep 17 00:00:00 2001
> +From: Anil Kumar M <anilm@mistralsolutions.com>
> +Date: Mon, 2 May 2011 11:04:20 +0530
> +Subject: [PATCH] Ethernet MACID display fix

Is this patch taken from upstream? Could you please tell us a URL so it
can be tracked.

Additionally it would be nice to briefly describe what the problem is.
In this case, =C2=BBEthernet MACID display fix=C2=AB is not enough. In what
instance is the mac address(?) displayed incorrectly?

What machines are affected by this patch?

> +
> +Signed-off-by: Anil Kumar M <anilm@mistralsolutions.com>
> +---
> + board/ti/am3517crane/am3517crane.c |   43 +++++++++++++++++++++--------=
-------
> + board/ti/am3517crane/am3517crane.h |    9 ++++---
> + include/configs/am3517_crane.h     |    2 +-
> + 3 files changed, 31 insertions(+), 23 deletions(-)
> +
> +diff --git a/board/ti/am3517crane/am3517crane.c b/board/ti/am3517crane/a=
m3517crane.c
> +index 40e8b91..1914c25 100644
> +--- a/board/ti/am3517crane/am3517crane.c
> ++++ b/board/ti/am3517crane/am3517crane.c
> +@@ -38,7 +38,7 @@
> + #if defined(CONFIG_DRIVER_TI_EMAC)
> + #define AM3517_IP_SW_RESET    0x48002598
> + #define CPGMACSS_SW_RST               (1 << 1)
> +-#define ETHERNET_NRST         34
> ++#define ETHERNET_NRST         65
> + #define EMACID_ADDR_LSB       0x48002380
> + #define EMACID_ADDR_MSB       0x48002384
> + #endif
> +@@ -204,30 +204,37 @@ int misc_init_r(void)
> + int cpu_eth_init(bd_t *bis)
> + {
> + #if defined(CONFIG_DRIVER_TI_EMAC)
> +-      char mac_buf_lsb[8];
> +-      char mac_buf_msb[16];
> +-      char mac_id[24];
> +-      const unsigned char separator =3D ':';
> ++      /* Check for efficient way of code*/
> ++      u8 mac_id[32];
> ++
> ++      u16 aa, bb, cc, dd, ee, ff;
> ++      u32 emac_lsb, emac_msb;
> ++
> ++      memset(mac_id, '\0', sizeof(mac_id));
> +=20
> +       printf("davinci_emac_initialize\n");
> +       davinci_emac_initialize();
> +=20
> +-      memset(mac_buf_lsb, '\0', sizeof(mac_buf_lsb));
> +-      memset(mac_buf_msb, '\0', sizeof(mac_buf_msb));
> +-      memset(mac_id, '\0', sizeof(mac_id));
> ++      emac_lsb =3D readl(EMACID_ADDR_LSB);
> ++      emac_msb =3D readl(EMACID_ADDR_MSB);
> +=20
> +-      sprintf(mac_buf_msb, "%x", readl(EMACID_ADDR_MSB));
> +-      sprintf(mac_buf_lsb, "%x", readl(EMACID_ADDR_LSB));
> +-      strcat(mac_buf_msb, mac_buf_lsb);
> +-      sprintf(mac_id, "%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",
> +-                      mac_buf_msb[0], mac_buf_msb[1], separator,
> +-                      mac_buf_msb[2], mac_buf_msb[3], separator,
> +-                      mac_buf_msb[4], mac_buf_msb[5], separator,
> +-                      mac_buf_msb[6], mac_buf_msb[7], separator,
> +-                      mac_buf_msb[8], mac_buf_msb[9], separator,
> +-                      mac_buf_msb[10], mac_buf_msb[11]);
> ++      printf("EMAC LSB =3D 0x%08x\n",emac_lsb);
> ++      printf("EMAC MSB =3D 0x%08x\n",emac_msb);
> +=20
> ++      cc  =3D (emac_msb & 0x000000FF) >> 0;
> ++      bb  =3D (emac_msb & 0x0000FF00) >> 8;
> ++      aa  =3D (emac_msb  & 0x00FF0000) >> 16;
> ++
> ++      ff  =3D (emac_lsb & 0x000000FF);
> ++      ee  =3D (emac_lsb & 0x0000FF00) >> 8;
> ++      dd  =3D (emac_lsb & 0x00FF0000) >> 16;
> ++
> ++      sprintf(mac_id,"%02x:%02x:%02x:%02x:%02x:%02x",aa,bb,cc,dd,ee,ff)=
;
> ++
> ++      printf("-----------------------------\n");
> +       printf("EMAC ID %s\n", mac_id);
> ++      printf("-----------------------------\n");
> ++
> +       setenv("ethaddr", mac_id);
> + #endif
> +       return 0;
> +diff --git a/board/ti/am3517crane/am3517crane.h b/board/ti/am3517crane/a=
m3517crane.h
> +index 83fe858..cdb0542 100644
> +--- a/board/ti/am3517crane/am3517crane.h
> ++++ b/board/ti/am3517crane/am3517crane.h
> +@@ -88,10 +88,10 @@ const omap3_sysinfo sysinfo =3D {
> +       MUX_VAL(CP(STRBEN_DLY0),        (IEN  | PTD | EN  | M0)) \
> +       MUX_VAL(CP(STRBEN_DLY1),        (IEN  | PTD | EN  | M0)) \
> + /* GPMC */\
> +-      /* GPIO_34 ETHERNET_nRST */ \
> +-      MUX_VAL(CP(GPMC_A1),            (IDIS | PTU | EN  | M4)) \
> ++      /* GPIO_34 NC */ \
> ++      MUX_VAL(CP(GPMC_A1),            (M7)) \
> +       /* GPIO_35 USB1_HOST_EN */ \
> +-      MUX_VAL(CP(GPMC_A2),            (IDIS | PTU | EN  | M4)) \
> ++      MUX_VAL(CP(GPMC_A2),            (IDIS | PTU | DIS | M4)) \
> +       /* GPIO_36 USB0_OVER_CURRENT*/ \
> +       MUX_VAL(CP(GPMC_A3),            (IDIS | PTU | EN  | M4)) \
> +       /* GPIO_37 USB1_OVER_CURRENT */ \
> +@@ -140,7 +140,8 @@ const omap3_sysinfo sysinfo =3D {
> +       MUX_VAL(CP(GPMC_WAIT0),         (IEN  | PTD | DIS | M0)) \
> +       MUX_VAL(CP(GPMC_WAIT1),         (M7)) \
> +       MUX_VAL(CP(GPMC_WAIT2),         (M7)) \
> +-      MUX_VAL(CP(GPMC_WAIT3),         (M7)) \
> ++      /* GPIO_65 ETHERNET_nRST */ \
> ++      MUX_VAL(CP(GPMC_WAIT3),         (IDIS | PTU | EN  | M4)) \
> + /* DSS */\
> +       MUX_VAL(CP(DSS_PCLK),           (IDIS | PTD | DIS | M0)) \
> +       MUX_VAL(CP(DSS_HSYNC),          (IDIS | PTD | DIS | M0)) \
> +diff --git a/include/configs/am3517_crane.h b/include/configs/am3517_cra=
ne.h
> +index f059dc7..3a5f919 100644
> +--- a/include/configs/am3517_crane.h
> ++++ b/include/configs/am3517_crane.h
> +@@ -187,7 +187,7 @@
> + #define CONFIG_JFFS2_PART_SIZE                0xf980000       /* sz of =
jffs2 part */
> +=20
> + /* Environment information */
> +-#define CONFIG_BOOTDELAY      1
> ++#define CONFIG_BOOTDELAY       3     =20
> +=20
> + #define CONFIG_BOOTFILE               uImage
> +=20
> +--=20
> +1.7.2.3
> +
> diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
> index 2cf5b12..e11bbba 100644
> --- a/recipes/u-boot/u-boot_git.bb
> +++ b/recipes/u-boot/u-boot_git.bb
> @@ -1,5 +1,5 @@
>  require u-boot.inc
> -PR =3D "r75"
> +PR =3D "r76"
> =20
>  FILESPATHPKG =3D. "u-boot-git:"
> =20
> @@ -138,6 +138,7 @@ SRC_URI_am3517-crane =3D "git://arago-project.org/git=
/projects/u-boot-omap3.git;pr
>                          file://0001-OMAP2-3-I2C-Add-support-for-second-a=
nd-third-bus.patch \
>                          file://0002-ARMV7-Restructure-OMAP-i2c-driver-to=
-allow-code-shar.patch \
>                          file://0003-craneboard-add-expansionboard-suppor=
t.patch \
> +                       file://0004-Ethernet-MACID-display-fix.patch \
>  "
> =20
>  SRCREV_am3517-crane =3D "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
> --=20
> 1.7.0.4=20


Thanks,

Paul

--=-awu67HhEL88sl7BJtNjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2+2y4ACgkQPX1aK2wOHVi7qgCfc70tgW72lCAI8opSEZJ0dj5M
7b8AnRCMlvbcmOJXTp8TMoochNmX4UNO
=y/BM
-----END PGP SIGNATURE-----

--=-awu67HhEL88sl7BJtNjN--
