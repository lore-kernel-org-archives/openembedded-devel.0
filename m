Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q9C66-00032M-O6
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 10:03:46 +0200
Received: by bwz5 with SMTP id 5so4436735bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 01:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=uGOQKc+fYwhOFxd+6bVOtgflJzBU1Ttg6dH9mSjsGq4=;
	b=t7Cn5J4aSlZLS5cQ1XtrkYx2M+do+jsP3lcNjDdXY/fdQIOz+WttT1H1zDYQ5NNakQ
	M7K7fEgYz5vWDa67MbO6EqssclRZKKYhn0zLS35x+CgSapyEOz0cMbogASKSQMyvEKeU
	gYvHKPwm34FcCJxx6TXB3nGp2IgLXBIjwY/1k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HqMdiJdr9kWASwGZRk+1gAWXr1qCnMNFOLpEi2INHf5NnBWqlvlvl5lHqnEYq2+rAQ
	s2w4/0Kya6FGb5mMg1IANJOnqmcnJgmpLsKJGMCVcFYH4K1G0w+2y40U0QVy0l4MleQA
	hj/hHDitkB4bE/Ljj9ZlcBAZzDPLB7ASsdyQE=
Received: by 10.204.20.134 with SMTP id f6mr4462814bkb.165.1302508893625;
	Mon, 11 Apr 2011 01:01:33 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm3045124bka.3.2011.04.11.01.01.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Apr 2011 01:01:32 -0700 (PDT)
Date: Mon, 11 Apr 2011 10:01:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110411080125.GB28101@jama.jama.net>
References: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] lowpan-tools_0.2.2; : fix build with static libnl1
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
X-List-Received-Date: Mon, 11 Apr 2011 08:03:46 -0000
X-Groupsio-MsgNum: 31100
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 10, 2011 at 07:27:21PM +0200, Anders Darander wrote:
> * add NL_CFLAGS to a few Makefiles.am

look like adding -D_GNU_SOURCE not $(NL_CFLAGS) except iplink/Makefile.am=
=20
and lib/Makefile.am, why was -D_GNU_SOURCE needed?

and lowpan-tools_0.2.2.bb gets PR bump from INC_PR, no need to bump .1
too.

but otherwise looks ok (I haven't tested it - never used lowpan-tools).

Regards,

> * git version not fixed
> * build and runtime tested, although only in qemuarm
>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  .../0001-Add-NL_CFLAGS-to-libcommon.patch          |   65 ++++++++++++++=
++++++
>  recipes/lowpan-tools/lowpan-tools.inc              |    4 +-
>  recipes/lowpan-tools/lowpan-tools_0.2.2.bb         |    6 ++-
>  3 files changed, 72 insertions(+), 3 deletions(-)
>  create mode 100644 recipes/lowpan-tools/lowpan-tools-0.2.2/0001-Add-NL_C=
FLAGS-to-libcommon.patch
>=20
> diff --git a/recipes/lowpan-tools/lowpan-tools-0.2.2/0001-Add-NL_CFLAGS-t=
o-libcommon.patch b/recipes/lowpan-tools/lowpan-tools-0.2.2/0001-Add-NL_CFL=
AGS-to-libcommon.patch
> new file mode 100644
> index 0000000..45cc4d0
> --- /dev/null
> +++ b/recipes/lowpan-tools/lowpan-tools-0.2.2/0001-Add-NL_CFLAGS-to-libco=
mmon.patch
> @@ -0,0 +1,65 @@
> +From 7fa435ea775b1410d9ccb95d2e315847f5a0f09c Mon Sep 17 00:00:00 2001
> +From: Anders Darander <anders@chargestorm.se>
> +Date: Tue, 5 Apr 2011 20:24:54 +0200
> +Subject: [PATCH] Add-NL_CFLAGS-to-libcommon
> +
> +Signed-off-by: Anders Darander <anders@chargestorm.se>
> +---
> + iplink/Makefile.am |    1 +
> + lib/Makefile.am    |    1 +
> + src/Makefile.am    |    4 ++--
> + tests/Makefile.am  |    2 +-
> + 4 files changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/iplink/Makefile.am b/iplink/Makefile.am
> +index bbed7ba..6e87ae0 100644
> +--- a/iplink/Makefile.am
> ++++ b/iplink/Makefile.am
> +@@ -4,3 +4,4 @@ noinst_HEADERS =3D iplink.h
> + iproute_LTLIBRARIES =3D link_wpan.la
> + link_wpan_la_LDFLAGS =3D -module -avoid-version -shared
> +=20
> ++link_wpan_la_CFLAGS =3D $(NL_CFLAGS) -D_GNU_SOURCE
> +\ No newline at end of file
> +diff --git a/lib/Makefile.am b/lib/Makefile.am
> +index 5e15018..6936ebb 100644
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -3,3 +3,4 @@ include $(top_srcdir)/Makefile.common
> + noinst_LTLIBRARIES =3D libcommon.la
> + libcommon_la_SOURCES =3D printbuf.c genl.c parse.c shash.c logging.c nl=
_policy.c
> +=20
> ++libcommon_la_CFLAGS =3D $(NL_CFLAGS) -D_GNU_SOURCE
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 555e214..46c4017 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -20,11 +20,11 @@ iz_SOURCES =3D iz.c iz-common.c iz-mac.c iz-phy.c
> + noinst_HEADERS =3D iz.h
> +=20
> + izcoordinator_SOURCES =3D coordinator.c
> +-izcoordinator_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS) -DLEASE_FILE=3D\"$(l=
easefile)\"
> ++izcoordinator_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS) -DLEASE_FILE=3D\"$(l=
easefile)\" -D_GNU_SOURCE
> + izcoordinator_CFLAGS +=3D -DPID_FILE=3D\"$(pidfile)\"
> + izcoordinator_LDADD =3D ../addrdb/libaddrdb.la $(LDADD) $(NL_LIBS) $(LE=
XLIB)
> +=20
> +-iz_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS)
> ++iz_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE
> + iz_LDADD =3D $(LDADD) $(NL_LIBS)
> +=20
> + izattach.8: $(izattach_SOURCES) $(top_srcdir)/configure.ac
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index d491be5..00621ca 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -4,6 +4,6 @@ zbtest_PROGRAMS =3D listen-packet test test2 test3 test4=
 test5 test6 test7 gnl izl
> +=20
> + izlisten_SOURCES =3D listen.c
> +=20
> +-gnl_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS)
> ++gnl_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE
> + gnl_LDADD =3D $(LDADD) $(NL_LIBS)
> +=20
> +--=20
> +1.7.4.1
> +
> diff --git a/recipes/lowpan-tools/lowpan-tools.inc b/recipes/lowpan-tools=
/lowpan-tools.inc
> index f429f96..94faf9c 100644
> --- a/recipes/lowpan-tools/lowpan-tools.inc
> +++ b/recipes/lowpan-tools/lowpan-tools.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "LoWPAN utilities (IEEE802.15.4)"
>  LICENSE =3D "GPLv2"
> -DEPENDS =3D "libnl bison-native flex-native python-native"
> -INC_PR =3D "r11"
> +DEPENDS =3D "libnl1 bison-native flex-native python-native"
> +INC_PR =3D "r12"
> =20
>  SRC_URI =3D "http://prdownloads.sourceforge.net/linux-zigbee/linux-zigbe=
e-sources/${PV}/lowpan-tools-${PV}.tar.gz"
> =20
> diff --git a/recipes/lowpan-tools/lowpan-tools_0.2.2.bb b/recipes/lowpan-=
tools/lowpan-tools_0.2.2.bb
> index 5686487..103109e 100644
> --- a/recipes/lowpan-tools/lowpan-tools_0.2.2.bb
> +++ b/recipes/lowpan-tools/lowpan-tools_0.2.2.bb
> @@ -1,6 +1,10 @@
>  require lowpan-tools.inc
> =20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> +
> +SRC_URI_append =3D " \
> +      file://0001-Add-NL_CFLAGS-to-libcommon.patch \
> +      "
> =20
>  EXTRA_OECONF =3D "--enable-ip-plugin"
> =20
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2itVUACgkQN1Ujt2V2gByt6gCfZJXR//sjwYvkyIKhg6AIOqcX
jOcAn0TNAfh9SBd9keV2SU2VHDe4etjh
=H+ng
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
