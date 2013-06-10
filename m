Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D89A6A689
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 15:29:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5AFTu1B029423
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 08:29:57 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 10 Jun 2013 08:29:55 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id E99F27FE2;
	Mon, 10 Jun 2013 11:29:44 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id E0C9C4049F; Mon,
	10 Jun 2013 11:29:54 -0400 (EDT)
Date: Mon, 10 Jun 2013 11:29:54 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Xufeng Zhang <xufeng.zhang@windriver.com>
Message-ID: <20130610152954.GF9561@windriver.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
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
X-List-Received-Date: Mon, 10 Jun 2013 15:29:55 -0000
X-Groupsio-MsgNum: 44992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline

--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Xufeng,

[[oe] [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors] On 13.05.31 =
(Fri 14:18) Xufeng Zhang wrote:

> The main changes include:
> 1). Add ntp:ntp(user:group) to system.
> 2). Running ntpd dameon as ntp:ntp.
> 3). Move relevant files from /usr/bin to /usr/sbin.
> 4). Add crypto support.

This one seems to have trailed off.  Sorry if you guys were waiting on
my input as well.

First, I agree with Paul on both #3 and #4.  I would rather see a patch
that updates NTP to use sbindir instead of bindir in the options (or at
least a follow-up indicating that it's infeasible for some reason, I
also don't know what NTP's build system looks like, so maybe that's not
an option).  I also agree that my preferred scenario is for the system
to be as secure as possible by default, but crypto support is available
and not everyone wants or needs it.  We (relatively) recently when
through an extended discussion about ntp versus ntp-ssl and the current
situation seems to be the best compromise for everyone.

As a more general comment, you have four bullet-points below.  That's
normally an indication (to me, at least) that four patches are
appropriate.  Looking a bit closer, it looks like two related changes
and two unrelated ones, so I'd want to see three patches for this unless
there's a good reason why all of them are tied together.

#1 and #2 aren't likely to be contentious, so feel free to send out a
single patch doing both of those any time and we can revisit #3 and #4
at your convenience.

Thanks,
-J.

>=20
> [YOCTO #4567]
> [ CQID: WIND00417282 ]
>=20
> Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/files/ntpd    |    8 ++++----
>  meta-networking/recipes-support/ntp/files/ntpdate |    6 +++---
>  meta-networking/recipes-support/ntp/ntp.inc       |   20 ++++++++++++---=
-----
>  3 files changed, 19 insertions(+), 15 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networ=
king/recipes-support/ntp/files/ntpd
> index ae50f13..285f5c0 100755
> --- a/meta-networking/recipes-support/ntp/files/ntpd
> +++ b/meta-networking/recipes-support/ntp/files/ntpd
> @@ -1,7 +1,7 @@
>  #! /bin/sh
>  #
>  # ntpd	init.d script for ntpdc from ntp.isc.org
> -test -x /usr/bin/ntpd -a -r /etc/ntp.conf || exit 0
> +test -x /usr/sbin/ntpd -a -r /etc/ntp.conf || exit 0
>  # rcS contains TICKADJ
>  test -r /etc/default/rcS && . /etc/default/rcS
> =20
> @@ -9,9 +9,9 @@ test -r /etc/default/rcS && . /etc/default/rcS
>  settick(){
>    	# If TICKADJ is set we *must* adjust it before we start, because the
>  	# driftfile relies on the correct setting
> -	test -n "$TICKADJ" -a -x /usr/bin/tickadj && {
> +	test -n "$TICKADJ" -a -x /usr/sbin/tickadj && {
>  		echo -n "Setting tick to $TICKADJ: "
> -		/usr/bin/tickadj "$TICKADJ"
> +		/usr/sbin/tickadj "$TICKADJ"
>  		echo "done"
>  	}
>  }
> @@ -21,7 +21,7 @@ startdaemon(){
>  	# this.  If ntpd seems to disappear after a while assume TICKADJ
>  	# above is set to a totally incorrect value.
>  	echo -n "Starting ntpd: "
> -	start-stop-daemon --start -x /usr/bin/ntpd -- -p /var/run/ntp.pid "$@"
> +	start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p /var/run/n=
tp.pid "$@"
>  	echo "done"
>  }
>  stopdaemon(){
> diff --git a/meta-networking/recipes-support/ntp/files/ntpdate b/meta-net=
working/recipes-support/ntp/files/ntpdate
> index ab0551c..17b64d1 100755
> --- a/meta-networking/recipes-support/ntp/files/ntpdate
> +++ b/meta-networking/recipes-support/ntp/files/ntpdate
> @@ -1,8 +1,8 @@
>  #!/bin/sh
> =20
> -PATH=3D/sbin:/bin:/usr/bin
> +PATH=3D/sbin:/bin:/usr/bin:/usr/sbin
> =20
> -test -x /usr/bin/ntpdate || exit 0
> +test -x /usr/sbin/ntpdate || exit 0
> =20
>  if test -f /etc/default/ntpdate ; then
>  . /etc/default/ntpdate
> @@ -40,7 +40,7 @@ if [ -x /usr/bin/lockfile-create ]; then
>  	LOCKTOUCHPID=3D"$!"
>  fi
> =20
> -if /usr/bin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
> +if /usr/sbin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
>  	if [ "$UPDATE_HWCLOCK" =3D "yes" ]; then
>  		hwclock --systohc || :
>  	fi
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 79e7401..b52a7d6 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -24,14 +24,19 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool=
/ntp4/ntp-4.2/ntp-${PV}.tar.g
>             file://sntp \
>  "
> =20
> -inherit autotools update-rc.d systemd
> +inherit autotools update-rc.d systemd useradd
> =20
>  # The ac_cv_header_readline_history is to stop ntpdc depending on either
>  # readline or curses
> -EXTRA_OECONF +=3D "--with-net-snmp-config=3Dno --without-ntpsnmpd ac_cv_=
header_readline_history_h=3Dno"
> +EXTRA_OECONF +=3D "--with-net-snmp-config=3Dno --without-ntpsnmpd ac_cv_=
header_readline_history_h=3Dno --with-binsubdir=3Dsbin"
>  CFLAGS_append =3D " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
> =20
> -PACKAGECONFIG ??=3D ""
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D "--system --home /etc/ntp \
> +		       --no-create-home --shell /bin/false \
> +		       --user-group ntp"
> +
> +PACKAGECONFIG ??=3D "openssl"
>  PACKAGECONFIG[openssl] =3D "--with-openssl-libdir=3D${STAGING_LIBDIR} \
>                            --with-openssl-incdir=3D${STAGING_INCDIR} \
>                            --with-crypto, \
> @@ -91,10 +96,10 @@ RCONFLICTS_ntpdate +=3D "ntpdate-systemd"
> =20
>  RSUGGESTS_${PN} =3D "iana-etc"
> =20
> -FILES_${PN} =3D "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/ini=
t.d/ntpd ${sbindir} ${libdir}"
> -FILES_${PN}-tickadj =3D "${bindir}/tickadj"
> -FILES_${PN}-utils =3D "${bindir}"
> -FILES_ntpdate =3D "${bindir}/ntpdate \
> +FILES_${PN} =3D "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/in=
it.d/ntpd ${libdir}"
> +FILES_${PN}-tickadj =3D "${sbindir}/tickadj"
> +FILES_${PN}-utils =3D "${sbindir}"
> +FILES_ntpdate =3D "${sbindir}/ntpdate \
>      ${sysconfdir}/network/if-up.d/ntpdate-sync \
>      ${bindir}/ntpdate-sync \
>      ${sysconfdir}/default/ntpdate \
> @@ -122,4 +127,3 @@ else
>      fi
>  fi
>  }
> -
--=20
-Joe MacDonald.
:wq

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlG18PIACgkQPN8S4W6ZZnfzxACfbXVrvFMJkSutaudzHVCi/JJP
vVoAnjqMpdQJ+g+MNHjU/aKmBQAb1FNu
=8lmv
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
