Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CF0E160034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 16:25:41 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Yql5r-00071F-F4 from Joe_MacDonald@mentor.com ;
	Fri, 08 May 2015 09:25:43 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2; Fri, 8 May 2015
	09:25:43 -0700
Received: by burninator (Postfix, from userid 1000)	id ABAEF5806FD; Fri,  8
	May 2015 12:25:47 -0400 (EDT)
Date: Fri, 8 May 2015 12:25:47 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150508162547.GC7280@mentor.com>
References: <1429173305-443-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1429173305-443-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] netkit-telnet: support the cross-compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 May 2015 16:25:42 -0000
X-Groupsio-MsgNum: 55406
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline

--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roy,

[[PATCH][meta-networking] netkit-telnet: support the cross-compile] On 15.0=
4.16 (Thu 16:35) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> when check the CC, only compile the object by CC, not run the object.
> MCONFIG file includes more configuration, we can not clear it
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../netkit-telnet/files/cross-compile.patch        | 48 ++++++++++++++++=
++++++
>  .../netkit-telnet/netkit-telnet_0.17.bb            |  6 ++-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/cr=
oss-compile.patch
>=20
> diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/cross-com=
pile.patch b/meta-networking/recipes-netkit/netkit-telnet/files/cross-compi=
le.patch
> new file mode 100644
> index 0000000..b3fe36b
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-telnet/files/cross-compile.pa=
tch
> @@ -0,0 +1,48 @@
> +To support the cross-compile
> +
> +Upstream-Status: Pending
> +
> +make the configure to support the cross-compile, by only to compile the
> +target, and not to run it
> +
> +Roy Li <rongqing.li@windriver.com>

I guess you meant to make this a signed-off-by line.

Also, this looks like a re-submission of the patch initially from Li Xin
at Fujitsu last November.  It was dropped in the v2 of the recipe and I
didn't ask any more after it, but can you follow-up on the requests I
had regarding it at the time?

http://lists.openembedded.org/pipermail/openembedded-devel/2014-November/09=
8982.html

-J.

> +Index: netkit-telnet-0.17/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- netkit-telnet-0.17.orig/configure	2008-11-23 22:01:26.000000000 +0100
> ++++ netkit-telnet-0.17/configure	2008-11-23 22:05:00.000000000 +0100
> +@@ -94,7 +94,7 @@
> +     echo -n 'Checking if C compiler works... '
> +     if (
> +           $CC __conftest.c -o __conftest || exit 1
> +-          ./__conftest || exit 1
> ++          # Idiots belong shot! ./__conftest || exit 1
> +        ) >/dev/null 2>&1; then
> +          echo 'yes'
> +      else
> +@@ -141,7 +141,7 @@
> +     echo -n 'Checking if C++ compiler works... '
> +     if (
> +           $CXX __conftest.cc -o __conftest || exit 1
> +-          ./__conftest || exit 1
> ++          # Iditios belong shot! ./__conftest || exit 1
> +        ) >/dev/null 2>&1; then
> +          echo 'yes'
> +      else
> +@@ -284,7 +284,7 @@
> + else
> +     if (
> +           $CXX $CXXFLAGS -D__USE_BSD_SIGNAL __conftest.cc  -o __conftes=
t || exit 1
> +-          ./__conftest || exit 1
> ++          # running still does not work./__conftest || exit 1
> +        ) >/dev/null 2>&1; then
> +         echo '-D__USE_BSD_SIGNAL'
> +         CFLAGS=3D"$CFLAGS -D__USE_BSD_SIGNAL"
> +@@ -501,7 +501,7 @@
> + EOF
> + if (
> +       $CXX $CXXFLAGS  __conftest.cc $LIBBSD -o __conftest || exit 1
> +-      ./__conftest || exit 1
> ++      # argh! morons!./__conftest || exit 1
> +    ) >/dev/null 2>&1; then
> +     echo 'ok'
> + else
> diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0=
=2E17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.=
bb
> index a2dc1c2..6b2e72f 100644
> --- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> @@ -8,6 +8,7 @@ SRC_URI =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/=
netkit/${BP}.tar.gz \
>      file://To-aviod-buffer-overflow-in-telnet.patch \
>      file://Warning-fix-in-the-step-of-install.patch \
>      file://telnet-xinetd \
> +    file://cross-compile.patch \
>  "
> =20
>  EXTRA_OEMAKE =3D "INSTALLROOT=3D${D} SBINDIR=3D${sbindir} DAEMONMODE=3D7=
55 \
> @@ -15,7 +16,10 @@ EXTRA_OEMAKE =3D "INSTALLROOT=3D${D} SBINDIR=3D${sbind=
ir} DAEMONMODE=3D755 \
> =20
>  do_configure () {
>      ./configure --prefix=3D${prefix}
> -    echo "LDFLAGS=3D${LDFLAGS}" > MCONFIG
> +    sed -e 's#^CFLAGS=3D\(.*\)$#CFLAGS=3D -D_GNU_SOURCE \1#' \
> +        -e 's#^CXXFLAGS=3D\(.*\)$#CXXFLAGS=3D -D_GNU_SOURCE \1#' \
> +        -e 's#^LDFLAGS=3D.*$#LDFLAGS=3D ${LDFLAGS}#' \
> +        -i MCONFIG
>  }
> =20
>  do_compile () {
--=20
-Joe MacDonald.
:wq

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVTOOLAAoJEEn8ffcsOfaWV8oH/1kg3t+Nv7WukFoymlR1Zzei
8gnpgEA+TCGz5W19l1X2/BHhV/o+2Q0HZSkaTfSEjiXBqTEPlhZRUOb1qDjC20iB
+frCqaJBVH1gMsu61RmTG23XcsvRriGhaKoiZdKXSgdHX8khkQBSC/M9VNUwLZE+
isng9+tIPiVCM1588PdKZ2Ihb9ROMQERq2Lkjz3FDlf5xp+Cxs/vzCGCvqJJJd9A
2uUQ9CsDfM8US/VI1sXil1ymHpkmHlwjmhv7a7+5nISNM9xCufg0yYIvNqhfq1N7
R9RVrZV8yhYU3YmMCK8FdV5v4e4cGRi6UE7VDdB4Lf+fG3//Nts06KL/tbjYZQ4=
=nQBw
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
