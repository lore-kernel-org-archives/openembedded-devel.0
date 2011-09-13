Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3RF4-0003CB-E2 for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 13:33:30 +0200
Received: from f053041096.adsl.alicedsl.de ([78.53.41.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3RA9-0001ll-I4 for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 11:28:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Sep 2011 13:28:21 +0200
In-Reply-To: <1315907128.4195.8.camel@mattotaupa>
References: <4E6E2161.3070004@juszkiewicz.com.pl>
	<1315841184-4706-1-git-send-email-sledz@dresearch-fe.de>
	<1315907128.4195.8.camel@mattotaupa>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315913302.4195.26.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Tue, 13 Sep 2011 11:33:30 -0000
X-Groupsio-MsgNum: 34204
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-QujjclKdypx6qJchZgJJ"

--=-QujjclKdypx6qJchZgJJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Steffen, dear Marcin,


Am Dienstag, den 13.09.2011, 11:45 +0200 schrieb Paul Menzel:

> Am Montag, den 12.09.2011, 17:26 +0200 schrieb Steffen Sledz:
> > This patch is similar to the one in linux-libc-headers 2.6.23 [1] and
> > enables building of OpenJDK which uses HWCAP_THUMBEE which normally
> > are not present in 2.6.24 headers.
> >=20
> > [1] commit 41cd62ffbac7d272d46a4b39faf8a97c0850dd10
>=20
> thank you for updating the patch and the commit message.
>=20
> > Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> > ---
> >  .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++=
++++++++
> >  .../linux-libc-headers_2.6.24.bb                   |    5 ++-
> >  2 files changed, 24 insertions(+), 2 deletions(-)
> >  create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.2=
4/arm-hwcap-add-new-entries.patch
> >=20
> > diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-h=
wcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-=
2.6.24/arm-hwcap-add-new-entries.patch
> > new file mode 100644
> > index 0000000..6975317
> > --- /dev/null
> > +++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-ad=
d-new-entries.patch
> > @@ -0,0 +1,21 @@
>=20
> I am not sure about the policy in oe.dev, but could you add a patch
> header, please [1].
>=20
> Upstream-Status: Backport [2.6.(which one?)]

Looking at your patch and the relevant Linux kernel commits, I do not
see how this can come from mainline Linux.

> > +---
> > + include/asm-arm/hwcap.h |    4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +--- linux-2.6.24.orig/include/asm-arm/hwcap.h
> > ++++ linux-2.6.24/include/asm-arm/hwcap.h
> > +@@ -13,10 +13,14 @@
> > + #define HWCAP_VFP	64
> > + #define HWCAP_EDSP	128
> > + #define HWCAP_JAVA	256
> > + #define HWCAP_IWMMXT	512
> > + #define HWCAP_CRUNCH	1024
> > ++#define HWCAP_THUMBEE	2048

This is already there in the original file creation.

        commit 4baa9922430662431231ac637adedddbb0cfb2d7
        Author: Russell King <rmk@dyn-67.arm.linux.org.uk>
        Date:   Sat Aug 2 10:55:55 2008 +0100
       =20
            [ARM] move include/asm-arm to arch/arm/include/asm

        $ git describe --contains 4baa9922
        v2.6.27-rc2~72^2~2

> > ++#define HWCAP_NEON	4096

        commit 2bedbdf4148ebbe48c7a89449ab52e475a788f42
        Author: Catalin Marinas <catalin.marinas@arm.com>
        Date:   Thu Nov 6 13:23:07 2008 +0000
       =20
            Add HWCAP_NEON to the ARM hwcap.h file

        $ git describe --contains 2bedbdf4
        v2.6.29-rc1~559^2~84^2~7

> > ++#define HWCAP_VFPv3	8192
> > ++#define HWCAP_VFPv3D16	16384

        commit 7279dc3e914635ab4b288ec39383272a06c466f3
        Author: Catalin Marinas <catalin.marinas@arm.com>
        Date:   Wed Feb 11 13:13:56 2009 +0100
       =20
            [ARM] 5388/1: Add hwcap bits for VFPv3 and VFPv3D16

After figuring that out I would just put these commit messages excerpts
into the patch header.

By the way, the Linux kernel version the last patch was merged is
therefore 2.6.30.

        $ git describe --contains 7279dc3e
        v2.6.30-rc1~636^2~52^2~24

So the commit summary could be updated to be more specific.

> > +
> > + #if defined(__KERNEL__) && !defined(__ASSEMBLY__)
> > + /*
> > +  * This yields a mask that user programs can use to figure out what
> > +  * instruction set this cpu supports.

[=E2=80=A6]


Thanks,

Paul

--=-QujjclKdypx6qJchZgJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5vPlUACgkQPX1aK2wOHVgYRgCfemPBadyZfwFUTpJOM4dJZBPx
X+UAn00RlsCZCvv081n5e3AMySBCR2q3
=D+zV
-----END PGP SIGNATURE-----

--=-QujjclKdypx6qJchZgJJ--
