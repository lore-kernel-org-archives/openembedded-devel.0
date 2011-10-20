Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGmlo-0001Rt-Nm for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 09:10:28 +0200
Received: from g225081054.adsl.alicedsl.de ([92.225.81.54]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGmgI-0007uw-CQ for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 07:04:46 +0000
Message-ID: <1319094271.3663.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Oct 2011 09:04:31 +0200
In-Reply-To: <4E9F4B2A.9030908@telia.com>
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
	<1319037014-29473-3-git-send-email-ulf_samuelsson@telia.com>
	<1319057924.12686.10.camel@mattotaupa> <4E9F4B2A.9030908@telia.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] Update checksums for binutils-2.20.1.tar.bz2
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
X-List-Received-Date: Thu, 20 Oct 2011 07:10:28 -0000
X-Groupsio-MsgNum: 34916
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Iziaicn3exNL5tvsj1zf"

--=-Iziaicn3exNL5tvsj1zf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 20.10.2011, 00:11 +0200 schrieb Ulf Samuelsson:
> 2011-10-19 22:58, Paul Menzel skrev:

> > Am Mittwoch, den 19.10.2011, 17:10 +0200 schrieb ulf_samuelsson@telia.c=
om:
> >> From: Ulf Samuelsson<ulf_samuelsson@telia.com>
> > again, please comply with our commit policy [1].
> >
> > binutils: Update from 2.20.1 to 2.20.1a
> >
> >> Tarball is updated to 2.20.1b so checksums have changed.
> > I am not aware of any binutils version 2.20.1b. Do you mean 2.20.1a?
> Maybe, twas from memory.
> >
> > Please create a new recipe since doing it this way the already
> > downloaded sources would be made invalid and archives on mirrors would
> > cause problems too.
> The recipe is not working, if the source is not downloaded yet.
> Maybe a better idea is to change the URI to something useful.
> Anyone knows where the original source can be downloaded?

        lftp ftp.gnu.org:/gnu/binutils> ls binutils-2.20.1*
        lrwxrwxrwx    1 3003     3003           24 Sep 01 08:40 binutils-2.=
20.1.tar.bz2 -> binutils-2.20.1a.tar.bz2
        -rw-r--r--    1 3003     3002     17591527 Aug 26 07:56 binutils-2.=
20.1a.tar.bz2
        -rw-r--r--    1 3003     3002          194 Aug 26 07:56 binutils-2.=
20.1a.tar.bz2.sig

Just take a look at the commit Martin referenced in his reply.

> > Please see commit f4faecdb [2] as an example and take a look at the lis=
t
> > discussion [3].
> >
> >> Signed-off-by: Ulf Samuelsson<ulf.samuelsson@telia.com>
> >>
> >> ---
> >>   recipes/binutils/binutils_2.20.1.bb |    7 ++++---
> >>   1 files changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/bi=
nutils_2.20.1.bb
> >> index 5154e2d..0497675 100644
> >> --- a/recipes/binutils/binutils_2.20.1.bb
> >> +++ b/recipes/binutils/binutils_2.20.1.bb
> >> @@ -1,7 +1,7 @@
> >>   require binutils.inc
> >>   LICENSE =3D "GPLv3"
> >>
> >> -PR =3D "${INC_PR}.4"
> >> +PR =3D "${INC_PR}.5"
> >>   EXTRA_OECONF +=3D "--disable-werror"
> >>
> >>   #COMPATIBLE_TARGET_SYS =3D "."
> >> @@ -24,10 +24,11 @@ SRC_URI_append_nios2 =3D" \
> >>   	file://binutils-nios2.patch \
> >>   	"
> >>
> >> -SRC_URI[tarball.sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab52=
3a0800a7d53df906498afe6f6f8"
> >> -SRC_URI[tarball.md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
> >> +SRC_URI[tarball.sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bb=
b27397dc06281905d9717c8ed64"
> >> +SRC_URI[tarball.md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> >>
> >>   # powerpc patches
> >>   SRC_URI +=3D "\
> >>        file://binutils-2.16.1-e300c2c3.patch \
> >>        "
> >> +
> > Please remove the newly added line.


Thanks,

Paul


> > [1] http://www.openembedded.org/wiki/Commit_Policy
> > [2] http://git.openembedded.org/openembedded/commit/?id=3Df4faecdbd0b7c=
83e5787735ef1495a34aca861e4
> > [3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-Septem=
ber/034885.html

--=-Iziaicn3exNL5tvsj1zf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6fx/8ACgkQPX1aK2wOHVhbywCgjS+vPxdbf/MaZcG62XJu/GyW
HtEAn2n1q+dytDJ7JHdfy4qqbRv8RjhN
=wpXL
-----END PGP SIGNATURE-----

--=-Iziaicn3exNL5tvsj1zf--
