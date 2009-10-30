Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N3uoU-0004xr-Il
	for openembedded-devel@openembedded.org; Fri, 30 Oct 2009 17:59:01 +0100
Received: (qmail 18507 invoked by uid 813007); 30 Oct 2009 16:57:51 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 30 Oct 2009 16:57:51 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2009 18:00:38 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
References: <ac9c93b10910300837j764eea76l7f9412be1d2bfeca@mail.gmail.com>
In-Reply-To: <ac9c93b10910300837j764eea76l7f9412be1d2bfeca@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200910301800.45304.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: sheevaplug u-boot
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
X-List-Received-Date: Fri, 30 Oct 2009 16:59:01 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 30 pa=C5=BAdziernika 2009 o 16:37:58 Frans Meulenbroeks n=
apisa=C5=82(a):
> Just noticed this commit:
>=20
> commit 04bf7d5d151173ac058f4aff2e4be3ae0f98216e
> Author: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> Date:   Fri Oct 30 11:38:49 2009 +0100
>=20
>     u-boot: added Sheevaplug support
>=20
>     Marvell devices needs u-boot.kwb instead of u-boot.bin due to header
>  for first stage bootloader. UBOOT_BINARY variable was introduced due of
>  that.
>=20
>=20
> Any particular reason not to call it u-boot.bin? I know the first
> stage bootloader needs to be prefixed but as this is device specific
> and ends up in the sheeva dirs only, I see no need for  a name change
> (but feel free to enlighten me).

During building of U-Boot for Sheevaplug you will get uboot.bin and uboot.k=
wb=20
files. Kirkwood first stage bootloader require uboot.kwb to be flashed. I=20
chosed original names to make that clear. Feel free to change.
=20
> BTW: is there already also work being done for openrd u-boot?

Give me openrd device and I will try :) But it looks like openrd-base is=20
supported in that branch but not openrd-client.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




