Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Qg4F5-0008Rl-UP
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 02:20:55 +0200
Received: by bwf20 with SMTP id 20so3345410bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2011 17:17:00 -0700 (PDT)
Received: by 10.204.84.154 with SMTP id j26mr2255598bkl.94.1310343420341;
	Sun, 10 Jul 2011 17:17:00 -0700 (PDT)
Received: from mail-bw0-f47.google.com (mail-bw0-f47.google.com
	[209.85.214.47])
	by mx.google.com with ESMTPS id af13sm858922bkc.40.2011.07.10.17.16.58
	(version=SSLv3 cipher=OTHER); Sun, 10 Jul 2011 17:16:59 -0700 (PDT)
Received: by bwf20 with SMTP id 20so3345393bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2011 17:16:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.205.80.141 with SMTP id zu13mr1294093bkb.216.1310343417996;
	Sun, 10 Jul 2011 17:16:57 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Sun, 10 Jul 2011 17:16:57 -0700 (PDT)
In-Reply-To: <1309968166-23347-1-git-send-email-agnel.joel@gmail.com>
References: <1309968166-23347-1-git-send-email-agnel.joel@gmail.com>
Date: Sun, 10 Jul 2011 20:16:57 -0400
Message-ID: <CA+T6QPnxUh964Mdv4ENmhppf58gdRiovaFg4rH7ZntftT9wneA@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, k-kooi@ti.com,
	Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com, beagle@list.ti.com
Subject: Re: [PATCH v3] linux-omap-psp: Fix the user button GPIO to the correct value for a BeagleBoard-xM
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
X-List-Received-Date: Mon, 11 Jul 2011 00:20:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 6, 2011 at 12:02 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> The user-button wasn't working for me with the the linux-omap-psp-2.6.32 =
kernel, this change fixes it. I noticed the correct value in the linux-omap=
-2.6.39 sources
>
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> Changes since v2:
> * Bumped PR
> * Made the commit summary more descriptive, removed full stop

Acked-by: Jason Kridner <jkridner@beagleboard.org>

I confirmed by looking at the schematics that this is the correct
logic.  GPIO4 for BeagleBoard-xM and GPIO7 for BeagleBoard.

>
> =A0conf/machine/include/omap3.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
> =A0...agle-cleaned-up-board-revision-conditions.patch | =A0 =A04 ++--
> =A02 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.=
inc
> index c762d41..f806a32 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -4,7 +4,7 @@ TARGET_ARCH =3D "arm"
> =A0require conf/machine/include/tune-cortexa8.inc
> =A0PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap"
> =A0# Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR =3D "r102"
> +MACHINE_KERNEL_PR =3D "r103"
>
> =A0KERNEL_IMAGETYPE =3D "uImage"
>
> diff --git a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-oma=
p3-beagle-cleaned-up-board-revision-conditions.patch b/recipes/linux/linux-=
omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision=
-conditions.patch
> index 513a101..fb91cb6 100644
> --- a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beag=
le-cleaned-up-board-revision-conditions.patch
> +++ b/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beag=
le-cleaned-up-board-revision-conditions.patch
> @@ -143,8 +143,8 @@ index 4bde54b..664a9c6 100644
> =A0 =A0 =A0 =A0omap3_beagle_i2c_init();
>
> =A0- =A0 =A0 =A0if (cpu_is_omap3630()) {
> -+ =A0 =A0 =A0if ((omap3_beagle_get_rev() !=3D OMAP3BEAGLE_BOARD_XMAB) &&
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0(omap3_beagle_get_rev() !=3D OMAP3BEAGLE_BO=
ARD_XMC)) {
> ++ =A0 =A0 =A0if ((omap3_beagle_get_rev() =3D=3D OMAP3BEAGLE_BOARD_XMAB) =
||
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0(omap3_beagle_get_rev() =3D=3D OMAP3BEAGLE_=
BOARD_XMC)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpio_buttons[0].gpio =3D 4;
> =A0 =A0 =A0 =A0}
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


