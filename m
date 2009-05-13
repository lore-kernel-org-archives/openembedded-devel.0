Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M42R7-0000Ne-Rb
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 02:35:06 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJK008VF3YY6ISK@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	12 May 2009 19:28:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6E08014AF5F; Tue,
	12 May 2009 20:28:10 -0400 (EDT)
Date: Tue, 12 May 2009 20:28:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090513002810.GB32320@denix.org>
References: <1242156773-26205-1-git-send-email-khimov@altell.ru>
MIME-version: 1.0
In-reply-to: <1242156773-26205-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] glibc 2.7/2.9: add march-i686.patch
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
X-List-Received-Date: Wed, 13 May 2009 00:35:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline
Content-transfer-encoding: quoted-printable

On Tue, May 12, 2009 at 11:32:53PM +0400, Roman I Khimov wrote:
> This patch is there for 2.6.1, but for some reason was not carried on to
> 2.7 and 2.9. Without it build for i686 machine fails.

Because at the time 2.7 was brand new and unstable and i686 is not a popula=
r=20
arch in OE... :)
http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&id=3D0f1aa=
27588234f2ecce8d52af478c44fa2c0d9a3

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/glibc/glibc_2.7.bb |    3 ++-
>  recipes/glibc/glibc_2.9.bb |    3 +++
>  2 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/glibc/glibc_2.7.bb b/recipes/glibc/glibc_2.7.bb
> index ec4b347..8ae84c1 100644
> --- a/recipes/glibc/glibc_2.7.bb
> +++ b/recipes/glibc/glibc_2.7.bb
> @@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET =3D "arm"
>  PACKAGES_DYNAMIC =3D "libc6*"
>  RPROVIDES_${PN}-dev =3D "libc6-dev virtual-libc-dev"
> =20
> -PR =3D "r9"
> +PR =3D "r10"
> =20
>  # the -isystem in bitbake.conf screws up glibc do_stage
>  BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
> @@ -67,6 +67,7 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV=
}.tar.bz2 \
>  	   file://generic-bits_time.h \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk \
> +           file://march-i686.patch;patch=3D1;pnum=3D0 \
>             "
> =20
> =20
> diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
> index 0af9f26..7859876 100644
> --- a/recipes/glibc/glibc_2.9.bb
> +++ b/recipes/glibc/glibc_2.9.bb
> @@ -5,6 +5,8 @@ ARM_INSTRUCTION_SET =3D "arm"
>  PACKAGES_DYNAMIC =3D "libc6*"
>  RPROVIDES_${PN}-dev =3D "libc6-dev virtual-libc-dev"
> =20
> +PR =3D "r1"
> +
>  # the -isystem in bitbake.conf screws up glibc do_stage
>  BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
>  TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGET}${layout_includedir}"
> @@ -58,6 +60,7 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV=
}.tar.bz2 \
>  	   file://generic-bits_time.h \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk \
> +           file://march-i686.patch;patch=3D1;pnum=3D0 \
>             "
> =20
> =20
> --=20
> 1.6.2.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


