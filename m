Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rultr-00062y-Qh for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 15:20:03 +0100
Received: from f053044122.adsl.alicedsl.de ([78.53.44.122]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RulmA-0005HS-DW for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 14:12:06 +0000
Message-ID: <1328623914.4320.5.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 07 Feb 2012 15:11:54 +0100
In-Reply-To: <1328607054-21182-1-git-send-email-koen@dominion.thruhere.net>
References: <1328607054-21182-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] systemd: move to v40 and don't kill user processes on exit
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
X-List-Received-Date: Tue, 07 Feb 2012 14:20:03 -0000
X-Groupsio-MsgNum: 36932
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-hM38oM5WnipkEW7tGC+Z"

--=-hM38oM5WnipkEW7tGC+Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 07.02.2012, 10:30 +0100 schrieb Koen Kooi:
> This fixes screen and tmux persistency issues.

Two patches would have been better. Or is v40 also needed to fix these
issues?

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../0001-docs-fix-build-without-xsltproc.patch     |    8 ++--
>  ...-logind-don-t-kill-user-processes-on-exit.patch |   31 ++++++++++++++=
++++++
>  meta-oe/recipes-core/systemd/systemd_git.bb        |    5 ++-
>  3 files changed, 38 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-core/systemd/systemd/0002-systemd-log=
ind-don-t-kill-user-processes-on-exit.patch
>=20
> diff --git a/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-wit=
hout-xsltproc.patch b/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-bu=
ild-without-xsltproc.patch
> index 6775349..390d65c 100644
> --- a/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xs=
ltproc.patch
> +++ b/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xs=
ltproc.patch
> @@ -1,4 +1,4 @@
> -From 97719ec99e3bd0040b616b044ab6ae33ae1cfd15 Mon Sep 17 00:00:00 2001
> +From 7395173a5af08e9e58aed33e831d0bfc6515891d Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen@dominion.thruhere.net>
>  Date: Sun, 2 Oct 2011 19:54:29 +0200
>  Subject: [PATCH 1/2] docs: fix build without xsltproc
> @@ -6,18 +6,18 @@ Subject: [PATCH 1/2] docs: fix build without xsltproc
>  Make would choke on missing rules for man/systemd.1
> =20
>  Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> =20
>  Upstream-status: rejected [fix your docbook install]
> =20
> +---
>   Makefile.am |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
> =20
>  diff --git a/Makefile.am b/Makefile.am
> -index 110a2f4..a5e57b7 100644
> +index f1f975f..53f99a1 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -650,6 +650,7 @@ EXTRA_DIST +=3D \
> +@@ -649,6 +649,7 @@ EXTRA_DIST +=3D \
>   	src/acl-util.h \
>   	src/logs-show.h
>  =20
> diff --git a/meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don=
-t-kill-user-processes-on-exit.patch b/meta-oe/recipes-core/systemd/systemd=
/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch
> new file mode 100644
> index 0000000..c28f189
> --- /dev/null
> +++ b/meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill=
-user-processes-on-exit.patch
> @@ -0,0 +1,31 @@
> +From eccbcfd37d41e1cb66bdf19cded899a36cc3842d Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Tue, 7 Feb 2012 10:12:51 +0100
> +Subject: [PATCH 2/2] systemd-logind: don't kill user processes on exit
> +
> +This fixed screen and tmux
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +
> +Upstream-status: Unknown
> +
> +---
> + src/login/systemd-logind.conf |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/src/login/systemd-logind.conf b/src/login/systemd-logind.co=
nf
> +index 9909804..ba69b6c 100644
> +--- a/src/login/systemd-logind.conf
> ++++ b/src/login/systemd-logind.conf
> +@@ -9,7 +9,7 @@
> +=20
> + [Login]
> + #NAutoVTs=3D6
> +-#KillUserProcesses=3Dno
> ++KillUserProcesses=3Dno
> + #KillOnlyUsers=3D
> + #KillExcludeUsers=3Droot
> + #Controllers=3D
> +--=20
> +1.7.2.5
> +
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipe=
s-core/systemd/systemd_git.bb
> index 89f910b..c1a0117 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -14,14 +14,15 @@ inherit gitpkgv
>  PKGV =3D "v${GITPKGVTAG}"
> =20
>  PV =3D "git"
> -PR =3D "r13"
> +PR =3D "r15"

Only do `r14`?

>  inherit useradd pkgconfig autotools vala perlnative
> =20
> -SRCREV =3D "bbd9b8c2139a70005e4e83d198575e2a10fe1db2"
> +SRCREV =3D "d26e4270409506cd398875216413b651d6ee7de6"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;protocol=3Dgi=
t \
>             file://0001-docs-fix-build-without-xsltproc.patch \
> +           file://0002-systemd-logind-don-t-kill-user-processes-on-exit.=
patch \
>             ${UCLIBCPATCHES} \
>            "
>  UCLIBCPATCHES =3D ""

I have no time to test this. But I guess you did.

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-hM38oM5WnipkEW7tGC+Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8xMSoACgkQPX1aK2wOHViQuwCcCx0q8mJ+v43zuI+BshgJrfhe
z/cAn3GdlPr9ceHkVTPmM2YEsUOFTbJ7
=jkgT
-----END PGP SIGNATURE-----

--=-hM38oM5WnipkEW7tGC+Z--
