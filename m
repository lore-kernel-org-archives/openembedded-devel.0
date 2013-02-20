Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jeffrey.honig@windriver.com>) id 1U8EWF-00029A-24
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 19:35:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1KIJY8A010997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2013 10:19:34 -0800 (PST)
Received: from jch-schlepp.wrs.com (172.25.32.253) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 20 Feb 2013 10:19:25 -0800
Received: from schlepp.honig.net (schlepp.honig.net [127.0.0.1])	by
	jch-schlepp.wrs.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	r1KIJKUw017068	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=NOT);	Wed, 20 Feb 2013 13:19:20 -0500
Received: from schlepp.honig.net (jch@localhost)	by schlepp.honig.net
	(8.14.4/8.14.4/Submit) with ESMTP id r1KIJIB0017064;	Wed, 20 Feb 2013
	13:19:19 -0500
From: Jeffrey Honig <jeffrey.honig@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: Message from Paul Eggleton <paul.eggleton@linux.intel.com> on
	Wed, 20 Feb 2013 16:55:49 +0000.<5676087.MgqTuTql2e@helios>
References: <1360707747-8128-1-git-send-email-jeffrey.honig@windriver.com>
	<511B6EA1.5020806@communistcode.co.uk>
	<5124FC05.40403@windriver.com> <5676087.MgqTuTql2e@helios>
X-Mailer: MH-E 8.4+bzr; nmh 1.3; GNU Emacs 24.3.50
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEXMnHK1jHX257A2GQY+
	AQD2yp+TalXrsYfLpNnfAAACHUlEQVR4nG3TwYrbMBAG4NFCrKu1UO+1FZhc1zioD+DSc2oY
	fLUJq16VgDKv31+W5aTtKoFl9WVGM2OZfvy/Ons2hsp/w+kzGPq0CrgHpO1HhBv/gkfIzx2G
	3nn/OfiaQKchn3gr0LtaJJDfzhledpi1YEEyvG7QO5LIiKkua8zw8nWDRQszRPm1gHL44Gbh
	0UJCc1mBc8TgSdjalqeg1vPdmKH3Om5AHiFDZ48FtgihBqf4jxX6k1sQkRZANZduGjP0gLRt
	J8JS/rdFtFrB5FR09zNRMz9AEWlrj/FIwagn6Crv52gnTGtStVp2mCvM9jAKfoyCpXqKaMjc
	ONRX4jNxNUIyNJWfOQqJAMYmAWVoMEVNMkk8a/a3Au9UaQkIQIdBi99TfQ9BYgBxix7F7fCO
	fQ5x0jE1Hx7gzjoiPb7IJdcVwgoBgFSoCnB3tkBPAKUpPS+enqFGUUYTmTe2XBUwBsOVatE6
	qDcM495t4DFBZoVnMlF8BqRyI58rQan8L9xaDoSEuERttezl9v2rZUFl+FhufJINPvCUJM1W
	J/Bfdug4YD+2ARUAzGivGRxjC90F3Z4BixkLHEKdrrU6MG4poFYZljrgNtg0YswAnS0FFqmj
	bSfBqyDXBCb3YZb05qQFegKPP7ilyIWDRuWXxuS7q4w5IMK2ggZbkxfhjb0a85Y6TEH2WwG3
	pNHXSB/TkKwpgHOQymB33f9V4A+X8QoMXFv/KAAAAABJRU5ErkJggg==
Organization: Wind River Systems, Inc.; Trumansburg, NY  USA
MIME-Version: 1.0
Date: Wed, 20 Feb 2013 13:19:18 -0500
Message-ID: <17062.1361384358@schlepp.honig.net>
Sender: <Jeffrey.Honig@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] hiawatha: ennsure C flags are passed to builds.
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
X-List-Received-Date: Wed, 20 Feb 2013 18:35:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> On Wednesday 20 February 2013 10:38:29 Mark Hatle wrote:
> > On 2/13/13 4:44 AM, Jack Mitchell wrote:
> > > On 12/02/13 22:22, Jeffrey C Honig wrote:
> > >> [ CQID: WIND00403568 ]
> > >>=20
> > >> Hiawatha was overriding existing C flags instead of prepending warni=
ng
> > >> flags. This caused build failures on multilibs because the C compiler
> > >> could not find the proper sysroot.
> > >>=20
> > >> Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
> > >> ---
> > >>=20
> > >>    recipes-httpd/hiawatha/files/cmake.patch |   16 ++++++++++++++++
> > >>    recipes-httpd/hiawatha/hiawatha_8.6.bb   |    3 +++
> > >>    2 files changed, 19 insertions(+)
> > >>    create mode 100644 recipes-httpd/hiawatha/files/cmake.patch
> > >>=20
> > >> diff --git a/recipes-httpd/hiawatha/files/cmake.patch
> > >> b/recipes-httpd/hiawatha/files/cmake.patch new file mode 100644
> > >> index 0000000..f597781
> > >> --- /dev/null
> > >> +++ b/recipes-httpd/hiawatha/files/cmake.patch
> > >> @@ -0,0 +1,16 @@
> > >> +It is necessary to include the original CMAKE_C_FLAGS to insure that
> > >> +the sysroot is passed to the compiler, instead of just setting warn=
ing
> > >> +options.  Otherwise we'll get problem croos compiling in some
> > >> +circumstances.
> > >> +
> > >> +--- a/CMakeLists.txt	2012-10-31 14:16:45.000000000 -0400
> > >> ++++ b/CMakeLists.txt	2013-02-12 14:07:04.297058345 -0500
> > >> +@@ -2,7 +2,7 @@
> > >> + project(Hiawatha C)
> > >> +
> > >> + # Compiler
> > >> +-set(CMAKE_C_FLAGS "-Wall -Wextra")
> > >> ++set(CMAKE_C_FLAGS "-Wall -Wextra ${CMAKE_C_FLAGS}")
> > >> + set(CMAKE_BUILD_TYPE "RelWithDebInfo")
> > >> +
> > >> + # Options
> > >> diff --git a/recipes-httpd/hiawatha/hiawatha_8.6.bb
> > >> b/recipes-httpd/hiawatha/hiawatha_8.6.bb index 837354b..d46a525 1006=
44
> > >> --- a/recipes-httpd/hiawatha/hiawatha_8.6.bb
> > >> +++ b/recipes-httpd/hiawatha/hiawatha_8.6.bb
> > >> @@ -4,9 +4,12 @@ LICENSE =3D "GPLv2"
> > >>=20
> > >>    LIC_FILES_CHKSUM =3D
> > >>    "file://LICENSE;md5=3D751419260aa954499f7abaabaa882bbe"
> > >>    DEPENDS =3D "libxml2 libxslt"
> > >>=20
> > >> +PR =3D "r1"
> > >> +
> > >>=20
> > >>    SECTION =3D "net"
> > >>=20=20=20=20
> > >>    SRC_URI =3D "http://hiawatha-webserver.org/files/${BPN}-${PV}.tar=
.gz \
> > >>=20
> > >> +           file://cmake.patch \
> > >>=20
> > >>               file://hiawatha-init"
> > >>=20=20=20=20
> > >>    SRC_URI[md5sum] =3D "372ea9e8329ed36e4fb781fdc1a6734c"
> > >=20
> > > What's the upstream status on this? If you email Hugo (the developer)
> > > directly he usually responds within a few hours and will pull the
> > > changes into the next release.
> >=20
> > I'm following up for Jeff.  He has contacted Hugo and the above patch h=
as
> > been included upstream.
>=20
> Great. Should I still apply this to meta-webserver then or do we wait for=
 a=20
> new upstream release?

We have a local patch applied, we are good.  It is fine to wait.

Thanks!

Jeff

--=20
Jeffrey C. Honig
Manager of Linux Products Division / SDT
Wind River (=E9=A3=8E=E6=B2=B3)
+1.607.216.8613
http://www.windriver.com


