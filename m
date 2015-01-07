Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D06D465C66
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 04:36:05 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1Y8iLl-0001tu-NS from Joe_MacDonald@mentor.com ;
	Tue, 06 Jan 2015 20:36:05 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 6 Jan 2015 20:36:05 -0800
Received: by burninator (Postfix, from userid 1000)	id 2BBF1580726; Tue,  6
	Jan 2015 23:36:01 -0500 (EST)
Date: Tue, 6 Jan 2015 23:36:01 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20150107043600.GD10013@mentor.com>
References: <1420559960-8518-1-git-send-email-akuster808@gmail.com>
	<1420559960-8518-2-git-send-email-akuster808@gmail.com>
	<20150106162610.GA12498@jama> <54AC9065.70108@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54AC9065.70108@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] proftpd: fix rdepends issue
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
X-List-Received-Date: Wed, 07 Jan 2015 04:36:07 -0000
X-Groupsio-MsgNum: 53714
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline

--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/2] proftpd: fix rdepends  issue] On 15.=
01.06 (Tue 17:48) akuster808 wrote:

>=20
>=20
> On 01/06/2015 08:26 AM, Martin Jansa wrote:
> >On Tue, Jan 06, 2015 at 07:59:19AM -0800, Armin Kuster wrote:
> >>Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >>---
> >>  meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b=
/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> >>index cba39e8..7d285a0 100644
> >>--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> >>+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> >>@@ -99,4 +99,4 @@ USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} --ho=
me-dir /var/lib/${FTPUSER} --
> >>
> >>  FILES_${PN} +=3D "/home/${FTPUSER}"
> >>
> >>-RDEPENDS_${PN} +=3D "perl"
> >>+RDEPENDS_${PN} +=3D "perl initscripts-functions"
> >
> >It's not that simple.
>=20
> Had to try :)
> >
> >The initscripts-functions is added to RDEPENDS conditionally based on
> >"sysvinit" in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS.
> >
> >Adding it explicitly here will pull it to image even for people who
> >care only about systemd services (and don't want any iniscripts to
> >pollute their startup sequence).
>=20
> make sense.
>=20
> >
> >See meta/classes/update-rc.d.bbclass
>=20
> thanks for the reference.
> >
> >I know we already have one recipe like this:
> >meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb:RDEPENDS_${PN} +=3D "in=
itscripts-functions"
> >
> >but honestly silencing this warning like this does more harm then
> >the warning. I think it should be fixed in bbclass, because all
> >recipes which inherit it, suffer from this. Maybe by adding another
> >VIRTUAL_RUNTIME which can be set to empty when sysv isn't enabled.
>=20
> k.
>=20
> Does the 5 second rule count ? or because I touched it I am stuck
> with it ; )

If you invoke the five-second-rule, I think it can apply, but if you're
anything like me, once you step in something it's almost impossible to
pretend you didn't.  ;-)

-J.

>=20
> I will take a look.
>=20
> thanks,
> Armin
> >
> >
> >
--=20
-Joe MacDonald.
:wq

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUrLewAAoJEEn8ffcsOfaW9PEIAJCD/JaKbqFvRnIWdm9/YUaG
3/PFMwYUqEkJ4SkeeNdmr1v/R0TsX1nSpj/ab2jGZ5It8gceTEWdQB+T3t2jxDYa
jmYTtSmc85H52Fozuaj8uOLKe3MtKsTxcqPKXwiWwVNp17SSoQ8fb1Dam/EMumnT
0BrzKkOfuKXimOgRKoXm7lv0jiDKbLzb5JhwayTSrqZITzvkejxRVC4FiyY3jrAV
m+oaFIirQAfKhz6ss2+VHKBYfTE5OFq3V/3TYaVeR2sEDcGM/X/EaDvTUO5awJVm
tCFHR6POvIWME2/XZy2oczamLbJ6+W1vSezbp7ESbT4V+zaMrADvLmGCNAdMV40=
=WRpG
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
