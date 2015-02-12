Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0828062252
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 02:17:49 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YLjLi-0003ho-Up from Joe_MacDonald@mentor.com ;
	Wed, 11 Feb 2015 18:17:50 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 18:17:50 -0800
Received: by burninator (Postfix, from userid 1000)	id CECA6581332; Wed, 11
	Feb 2015 21:17:49 -0500 (EST)
Date: Wed, 11 Feb 2015 21:17:49 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <wenzong.fan@windriver.com>
Message-ID: <20150212021749.GK30457@mentor.com>
References: <1423042412-17651-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1423042412-17651-1-git-send-email-wenzong.fan@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] iscsi-initiator-utils: fix SELinux label for initiatorname.iscsi
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
X-List-Received-Date: Thu, 12 Feb 2015 02:17:59 -0000
X-Groupsio-MsgNum: 54197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1hKfHPzOXWu1rh0v"
Content-Disposition: inline

--1hKfHPzOXWu1rh0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Wenzong,

[[oe] [PATCH][meta-networking] iscsi-initiator-utils: fix SELinux label for=
 initiatorname.iscsi] On 15.02.04 (Wed 17:33) wenzong.fan@windriver.com wro=
te:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> * /etc/iscsi/initiatorname.iscsi: etc_runtime_t -> etc_t
>=20
> This config file was created by postinstall or initscript, fix SELinux
> label for it to remove:
>=20
>   avc: denied { read } for pid=3D6094 comm=3D"iscsid" \
>   name=3D"initiatorname.iscsi" dev=3D"sda3" ino=3D1057846 \
>   scontext=3Dsystem_u:system_r:iscsid_t:s0-s15:c0.c1023 \
>   tcontext=3Dsystem_u:object_r:etc_runtime_t:s0 tclass=3Dfile

Since this is an issue that only shows up when you have SELinux on your
system and since it is tweaking a file that is manually installed by a
do_install() in iscsi-initiator-utils, could you re-work this as a
bbappend in meta-selinux?

-J.

>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../recipes-daemons/iscsi-initiator-utils/files/initd.debian          | =
4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/=
initd.debian b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/=
initd.debian
> index 99a7638..43fb348 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.d=
ebian
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.d=
ebian
> @@ -39,6 +39,10 @@ start() {
>  InitiatorName=3D$INITIATORNAME
>  EOF
>  	fi
> +
> +	# Fix label for /etc/iscsi/initiatorname.iscsi if SELinux was enabled
> +	test ! -x /sbin/restorecon || /sbin/restorecon -F /etc/iscsi/initiatorn=
ame.iscsi
> +
>  	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON
>  	RETVAL=3D$?
>  	starttargets
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--1hKfHPzOXWu1rh0v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU3A1NAAoJEEn8ffcsOfaWJPUIAL3dIurdTdAUVWwVy5VTWVfz
VrHduOqfQLyOXGvWHqSk3aefKVSpBVHTEEdXNT4wBWr1Kwl37E4SVIMoF8qmH6d6
Q39tGYkJjGpkLPnSZshTeIs+Kt9PY4BimncgPgkj1F5SJlttF1vKu01LLFPagIC+
NCaquoS+hTh4iww2BJkkpwPitKjpN5/L7zbWF4FWo5kdPN+Q1KJKLQZkoO8WaENo
FWmJI7mXJsmnyeYHS6lmA+dmAMH7cGEjbiW0AV4ENmKhedWYDbHBL9H65LfOObzv
H345n079AvGljBncFofigMn1daous74A7qFhPNUhglBH5Jl01fGuHWWiI1Yj1do=
=AEEt
-----END PGP SIGNATURE-----

--1hKfHPzOXWu1rh0v--
