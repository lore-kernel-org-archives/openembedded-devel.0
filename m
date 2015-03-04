Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8E260144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 13:39:07 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1YT9Vz-00036v-Vg from Joe_MacDonald@mentor.com ;
	Wed, 04 Mar 2015 05:39:08 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 05:39:07 -0800
Received: by burninator (Postfix, from userid 1000)	id A1CB0581EE8; Wed,  4
	Mar 2015 08:39:13 -0500 (EST)
Date: Wed, 4 Mar 2015 08:39:13 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <20150304133913.GA26456@mentor.com>
References: <1423042412-17651-1-git-send-email-wenzong.fan@windriver.com>
	<20150212021749.GK30457@mentor.com>
	<54F6B37C.6040706@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54F6B37C.6040706@windriver.com>
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
X-List-Received-Date: Wed, 04 Mar 2015 13:39:12 -0000
X-Groupsio-MsgNum: 54616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][meta-networking] iscsi-initiator-utils: fix SELinux label=
 for initiatorname.iscsi] On 15.03.04 (Wed 15:25) wenzong fan wrote:

> On 02/12/2015 10:17 AM, Joe MacDonald wrote:
> >Hey Wenzong,
> >
> >[[oe] [PATCH][meta-networking] iscsi-initiator-utils: fix SELinux label =
for initiatorname.iscsi] On 15.02.04 (Wed 17:33) wenzong.fan@windriver.com =
wrote:
> >
> >>From: Wenzong Fan <wenzong.fan@windriver.com>
> >>
> >>* /etc/iscsi/initiatorname.iscsi: etc_runtime_t -> etc_t
> >>
> >>This config file was created by postinstall or initscript, fix SELinux
> >>label for it to remove:
> >>
> >>   avc: denied { read } for pid=3D6094 comm=3D"iscsid" \
> >>   name=3D"initiatorname.iscsi" dev=3D"sda3" ino=3D1057846 \
> >>   scontext=3Dsystem_u:system_r:iscsid_t:s0-s15:c0.c1023 \
> >>   tcontext=3Dsystem_u:object_r:etc_runtime_t:s0 tclass=3Dfile
> >
> >Since this is an issue that only shows up when you have SELinux on your
> >system and since it is tweaking a file that is manually installed by a
> >do_install() in iscsi-initiator-utils, could you re-work this as a
> >bbappend in meta-selinux?
>=20
> Hi Joe,
>=20
> This make sense, but there's an issue that meta-networking is not
> depended by meta-selinux, adding a bbappend may block the building
> of meta-selinux & oe-core only.
>=20
> Any suggestions about that?

As a matter of fact, we just addressed that with
d382d54f0a9a913791fca1d7f61e87fcfd32842b in meta-selinux a couple of
weeks back.  There is still a mistake in that, but Philip has a patch
for it that I'm integrating now, but the core idea works.  So your patch
would go into a networking-layer/ hierarchy in meta-selinux/ and then it
would either be picked up if meta-networking is included or ignored in
the meta-selinux+oe-core-only scenario.

-J.

>=20
> Thanks
> Wenzong
>=20
> >
> >-J.
> >
> >>
> >>Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> >>---
> >>  .../recipes-daemons/iscsi-initiator-utils/files/initd.debian         =
 | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >>diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/file=
s/initd.debian b/meta-networking/recipes-daemons/iscsi-initiator-utils/file=
s/initd.debian
> >>index 99a7638..43fb348 100644
> >>--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd=
=2Edebian
> >>+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd=
=2Edebian
> >>@@ -39,6 +39,10 @@ start() {
> >>  InitiatorName=3D$INITIATORNAME
> >>  EOF
> >>  	fi
> >>+
> >>+	# Fix label for /etc/iscsi/initiatorname.iscsi if SELinux was enabled
> >>+	test ! -x /sbin/restorecon || /sbin/restorecon -F /etc/iscsi/initiato=
rname.iscsi
> >>+
> >>  	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON
> >>  	RETVAL=3D$?
> >>  	starttargets
> >>--
> >>1.9.1
> >>

--=20
-Joe MacDonald.
:wq

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU9wsBAAoJEEn8ffcsOfaWSiYIAMHyF7wNzctNbPKqns5+UQtM
O97caz778tBsyLmkrgK/a9XK/MW5gnOOjyGVt9ErMaMBkEIDT+3zHaX/i4+n4nqG
qf5mH7x4g3HCgjPN2yPwgTzj8+7Tk0EBfRL1o24Pj91aLwe87bblfuWR+dYHlYbQ
Wvfwi+Ugs8xoOb9THTkz1z1OzOj2ZgjpDs9b10Lo7DJySuN4FInTQM5WhI6I/sSn
KBoTYJpMVWQIqfclWmOJ98yV6xKYdMOhBqAtVYeQaIwtb27HRetSgTtVJ/nDVYHw
wm8nlCHktZWb5J165Rh8zsDgnL7E+UTFAGCMyY+nsGv6j4xS/pLTx7Hrqyej+x0=
=lELm
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
