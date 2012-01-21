Received: from col0-omc4-s7.col0.hotmail.com ([65.55.34.209])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1RoOfy-00088q-6y
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jan 2012 01:19:22 +0100
Received: from COL120-W56 ([65.55.34.199]) by col0-omc4-s7.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 20 Jan 2012 16:10:35 -0800
Message-ID: <COL120-W56260B061BE4BC963E234CDD840@phx.gbl>
X-Originating-IP: [70.137.132.86]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Jan 2012 16:10:35 -0800
Importance: Normal
In-Reply-To: <COL120-W44E7D046D5A1A8EDA47CBFDD870@phx.gbl>
References: <COL120-W44E7D046D5A1A8EDA47CBFDD870@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Jan 2012 00:10:35.0853 (UTC)
	FILETIME=[193DF7D0:01CCD7D1]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Perl NET::SSLeay module
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
X-List-Received-Date: Sat, 21 Jan 2012 00:19:22 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


This is the recipe I have created
********************************DESCRIPTION =3D "Net::SSLeay perl module"PR=
 =3D "r0"
#DEPENDS =3D "openssl"#RDEPENDS_${PN} +=3D " \#	perl-module-extutils-makema=
ker \#	"
SRC_URI =3D "file://${PN}-${PV}.tar.gz"
S =3D "${WORKDIR}/Net-SSLeay-1.36"
#inherit cpan
fakeroot do_install() {
	mkdir -p ${D}/usr/bin/Net-SSLeay-1.36
#	cd Net-SSLeay-1.36#	perl Makefile.PL INSTALL_BASE=3D${WORKDIR}/image/usr/=
bin/Net-SSLeay-1.36	perl Makefile.PL	make install
}
FILES_${PN} +=3D "/usr/bin/net-ssleay"***********************************

> From: kyoonn@hotmail.com
> To: openembedded-devel@lists.openembedded.org
> Date: Fri=2C 20 Jan 2012 15:51:19 -0800
> Subject: [oe] Perl NET::SSLeay module
>=20
>=20
> Hello=2C
> I am trying to add a new module to the perl recipe for bitbake. I have ma=
de a recipe to install this using tar.gz file but have no success so far. I=
s there an easier way to add modules to the perl recipe and build an imagei=
f they are not already present. I am fairly new to open embedded and bitbak=
e. Thanks for any help.
> Sincerely=2CSim Gill
>  		 	   		 =20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
 		 	   		  =

