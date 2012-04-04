Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFWWa-0002h8-C4
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 22:09:48 +0200
Received: by wgbdr12 with SMTP id dr12so561440wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 13:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gSfJJMk4ZK0G1LOstEetvJANO24VrZblqfu8yelaxCw=;
	b=Lff2w++g46daYLBEEu7qiwrKyBu/p929cELaz2JaKCFTByqc8rDHHP4+sWaxtzBpWb
	Ibls2tr7B0WsjhDTw+4k4diUPFaxMxk4n540oER41TuSKNxLtwIKMMmRP4LH58dfJCLc
	doLaCGbXjUZaN4oW9fy88m9ZlAgxo5YMTNkbOBN/0w7RXMQwyYvGOTFtvshhlObcRral
	Vz5ZPTDKCvV0vP3o9LcEbNhvRM/vEq12u9pl8F2iY1pkmrysu3STLsbfAW8r9sqVVaO5
	Z99gg6xbhdQxctGt/HYOnpaAE0nk/73/8eada9YdZD2+p9uoX1Q+dn4TLYWDrV/JxlzS
	jMxw==
Received: by 10.216.133.39 with SMTP id p39mr2130956wei.40.1333569637706;
	Wed, 04 Apr 2012 13:00:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm7377583wix.8.2012.04.04.13.00.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 13:00:36 -0700 (PDT)
Date: Wed, 4 Apr 2012 22:00:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120404200036.GI4181@jama.jama.net>
References: <20120402210435.GA10553@hermes>
	<CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
	<20120404195704.GA16410@hermes>
MIME-Version: 1.0
In-Reply-To: <20120404195704.GA16410@hermes>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Package build failure
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
X-List-Received-Date: Wed, 04 Apr 2012 20:09:48 -0000
X-Groupsio-MsgNum: 38120
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FUFe+yI/t+r3nyH4"
Content-Disposition: inline

--FUFe+yI/t+r3nyH4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 04, 2012 at 09:57:04PM +0200, Apelete Seketeli wrote:
> Le 03-Apr-12, Andrei Gherzan a =E9crit:
> > On Tue, Apr 3, 2012 at 00:04, Apelete Seketeli <apelete@seketeli.net> w=
rote:
> > >
> > > It seems http://svn.openmoko.org is unreachable.
> > > How can I resolve this issue ?
> > >
> > >
> > You actually cant solve this issue as the upstream link is down. You ha=
ve
> > two simple choices:
> > 1. Find an upstream mirror
> > 2. Use a local archive instead.
>=20
> Thanks for the advice.
> I decided to try this upstream mirror:
> http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/.
>=20
> So I replaced the SRC_URI as follow (hereafter is the content of
> opkg-utils_svn.bb):

You need at least replace SRCREV with something valid for git as error
suggests.. see
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/op=
kg-utils/opkg-utils_git.bb

>=20
>=20
> ~~ beginning of file ~~
> DESCRIPTION =3D "OPKG Package Manager Utilities"
> SECTION =3D "base"
> HOMEPAGE =3D "http://wiki.openmoko.org/wiki/Opkg"
> PRIORITY =3D "optional"
> LICENSE =3D "GPLv2"
> RDEPENDS_${PN} =3D "python"
> RDEPENDS_${PN}_virtclass-native =3D ""
> SRCREV =3D "4747"
> PV =3D "0.1.8+svnr${SRCPV}"
> PR =3D "r7"
>=20
> SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
>            file://index-ignore-filenotfound.patch \
>            file://arfile_header_split.patch \
>            file://mtime-int.patch"
>=20
> S =3D "${WORKDIR}/opkg-utils"
>=20
> # Avoid circular dependencies from package_ipk.bbclass
> PACKAGES_virtclass-native =3D ""
>=20
> do_install() {
>         oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> }
>=20
> BBCLASSEXTEND =3D "native"
> TARGET_CC_ARCH +=3D "${LDFLAGS}"
> ~~ end of file ~~
>=20
>=20
> During the execution of my test command 'bitbake nano' I get the
> following error:
>=20
>=20
> ~~ beginning of build output ~~
> NOTE: Running task 352 of 557 (ID: 70, virtual:native:/home/apelete/devel=
/openembedded/master/recipes/opkg-utils/opkg-utils_svn.bb, do_fetch)
> NOTE: package opkg-utils-native-0.1.8+svnr0+4747-r7: task do_fetch: Start=
ed
> NOTE: package gcc-cross-4.5-r38.1+svnr170880: task do_populate_sysroot: S=
ucceeded
> NOTE: Running task 353 of 557 (ID: 156, /home/apelete/devel/openembedded/=
master/recipes/libtool/libtool-cross_2.4.bb, do_configure)
> NOTE: package libtool-cross-2.4-r28.2: task do_configure: Started
> From git://git.yoctoproject.org/opkg-utils
>   * branch            master     -> FETCH_HEAD
>  fatal: Not a valid object name 4747
> WARNING: /usr/lib/pymodules/python2.7/bb/fetch/git.py:191: DeprecationWar=
ning: Call to deprecated function bb.mkdirhier: Please use bb.utils.mkdirhi=
er instead.
>   bb.mkdirhier(codir)
>=20
> NOTE: package opkg-utils-native-0.1.8+svnr0+4747-r7: task Fetch failed: U=
nable to fetch URL git://git.yoctoproject.org/opkg-utils;protocol=3Dgit fro=
m any source.: Failed
> ERROR: Function 'Fetch failed: Unable to fetch URL git://git.yoctoproject=
=2Eorg/opkg-utils;protocol=3Dgit from any source.' failed
> ERROR: Task 70 (virtual:native:/home/apelete/devel/openembedded/master/re=
cipes/opkg-utils/opkg-utils_svn.bb, do_fetch) failed with exit code '1'
> Waiting for 1 active tasks to finish:
> 0: libtool-cross-2.4-r28.2 do_configure (pid 12101)
> NOTE: package libtool-cross-2.4-r28.2: task do_configure: Succeeded
> ERROR: 'virtual:native:/home/apelete/devel/openembedded/master/recipes/op=
kg-utils/opkg-utils_svn.bb' failed
> ~~ end of build output ~~
>=20
>=20
> My guess is that the opkg-utils_svn.bb file now needs more changes, to
> adapt to the new SRC_URI: it was an svn link and the mirror is now a
> git link.
>=20
> Somebody care to help some more ?
> --=20
>         Apelete
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FUFe+yI/t+r3nyH4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk98qGQACgkQN1Ujt2V2gBzoQgCeNQe+/0MC2MuOKiRzDCGa682o
ZaUAoKg+PzOstUR0Aj+jUQs9FgWNaWSw
=6zO9
-----END PGP SIGNATURE-----

--FUFe+yI/t+r3nyH4--
