Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nr40L-0006ys-9G
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 07:42:27 +0100
Received: (qmail 23804 invoked by uid 813007); 15 Mar 2010 06:39:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 15 Mar 2010 06:39:21 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 07:38:21 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <1268608696-31002-1-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1268608696-31002-1-git-send-email-ulf.samuelsson@atmel.com>
MIME-Version: 1.0
Message-Id: <201003150738.22158.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] linux-2.6.30: Add linux4sam patches
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
X-List-Received-Date: Mon, 15 Mar 2010 06:42:27 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 15 marca 2010 o 00:18:15 Ulf Samuelsson napisa=C5=
=82(a):

> " +KERNEL_MINOR_0 =3D " "
> +KERNEL_MINOR_10 =3D "
> ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.10.bz2;patch=3D1 " +
> +AUFS =3D " file://aufs2-30.patch;patch=3D1 "

> +SRC_URI_append_calamari        =3D " ${KERNEL_MINOR_10} ${AUFS} "
> +SRC_URI_append_i686    =3D " ${KERNEL_MINOR_10} ${AUFS} "=20
> +SRC_URI_append_kixrp435        =3D " ${KERNEL_MINOR_10} ${AUFS} "=20
> +SRC_URI_append_mx27ads =3D " ${KERNEL_MINOR_10} ${AUFS} "=20
> +SRC_URI_append_tosa    =3D " ${KERNEL_MINOR_10} ${AUFS} "=20
> +
> +SRC_URI_append_mpc8315e-rdb =3D " \
> +       ${KERNEL_MINOR_10} ${AUFS}      \
> +       file://mpc8315erdb-add-msi-to-dts.patch;patch=3D1 \
> +       "

> +AT91_EXP_PATCHES =3D " \
> +       ${KERNEL_MINOR_0} \
> +       http://maxim.org.za/AT91RM9200/2.6/2.6.30-at91.patch.gz;patch=3D1=
 \
> +       ftp://www.at91.com/pub/buildroot/2.6.30-exp.2.patch.bz2;patch=3D1=
 \
> +       file://at91/linux-2.6.30-001-configurable-partition-size.patch.pa=
tc
> h;patch=3D1 \
> +       file://at91/linux-2.6.30-002-mach-at91-Kconfig.patch;patch=3D1 \
> +       file://at91/linux-2.6.30-003-sam9m10g45ek.patch;patch=3D1 \
> +       "
> +
> +SRC_URI_append_at91sam9g10ek           =3D       " ${AT91_EXP_PATCHES} "

Please look at linux_2.6.28.bb and how nokia900 SRC_URI is created. This wa=
y=20
you will not alter other machines but only set for your ones. Hint: set=20
SRC_URI for at91 boards instead of using SRC_URI_append.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




