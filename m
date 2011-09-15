Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R47xY-000179-2A for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:10:16 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R47sf-000394-Qy for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 09:05:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:05:04 +0200
In-Reply-To: <1316073352-27826-1-git-send-email-sledz@dresearch-fe.de>
References: <1316072892-27367-1-git-send-email-sledz@dresearch-fe.de>
	<1316073352-27826-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316077506.4523.10.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v4] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernel
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
X-List-Received-Date: Thu, 15 Sep 2011 09:10:16 -0000
X-Groupsio-MsgNum: 34239
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-rb1i2U07RpAaGa06PMlq"

--=-rb1i2U07RpAaGa06PMlq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Steffen,


unfortunately I still have something to add. :(

Am Donnerstag, den 15.09.2011, 09:55 +0200 schrieb Steffen Sledz:

1. Please do not use `recent` but write the correct version. In this
case it would be 2.6.26 (see below).

> Enables building of OpenJDK which uses HWCAP_THUMBEE that is not present
> in 2.6.24 headers and was introduced with
>=20
>   commit 4baa9922430662431231ac637adedddbb0cfb2d7
>   Author: Russell King <rmk@dyn-67.arm.linux.org.uk>
>   Date:   Sat Aug 2 10:55:55 2008 +0100
>=20
>       [ARM] move include/asm-arm to arch/arm/include/asm

2. Of course that is not correct and I asked that in my last response
why a move should introduce new code lines.

Using

        git log --follow 4baa9922430662431231ac637adedddbb0cfb2d7 -- arch/a=
rm/include/asm/hwcap.h

I found the following commit

        commit d7f864be8323e5394040e2877594645b0e7da85d
        Author: Catalin Marinas <catalin.marinas@arm.com>
        Date:   Fri Apr 18 22:43:06 2008 +0100
       =20
            ARMv7: Add support for the ThumbEE state saving/restoring
           =20
            This patch adds the detection and handling of the ThumbEE exten=
sion on
            ARMv7 CPUs.
           =20
            Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>

introduced in 2.6.26.

        $ git describe --contains
        d7f864be8323e5394040e2877594645b0e7da85d
        v2.6.26-rc1~1090^2~27

Please note that this commit contains not only the addition of
HWCAP_THUMBEE to the header but a lot more. So is OpenJDK doing
something incorrectly then? Does it detect the wrong architecture?

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  .../arm-hwcap-add-new-entries.patch                |   26 ++++++++++++++=
++++++
>  .../linux-libc-headers_2.6.24.bb                   |    6 +++-
>  2 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/=
arm-hwcap-add-new-entries.patch

[=E2=80=A6]

Please update the relevant parts and send it to the list again. You can
commit it the next day if nobody else objects.


Thanks,

Paul


PS: It is hard for reviewers to see what changed in your patch
iterations. For example between v3 and v4. Please add a short note below
the commit message and separate that with an additional `---`. `git am`
will not pick that comment up then.

--=-rb1i2U07RpAaGa06PMlq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5xv8AACgkQPX1aK2wOHVjmCQCePYVoloWsowXaO+0r8q89XHcq
H/0An2D3CXUZu6/1mbVeZOS4NG/zVZvv
=XRd0
-----END PGP SIGNATURE-----

--=-rb1i2U07RpAaGa06PMlq--
