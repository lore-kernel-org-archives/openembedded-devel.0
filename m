Return-Path: <prvs=77876d966=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCAF6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 09:38:46 +0000 (UTC)
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 09 Dec 2015 10:38:47 +0100
Received: from unknown (HELO esabb4.muc) ([160.50.100.33]) by esagw5.muc with
	ESMTP/TLS; 09 Dec 2015 10:38:46 +0100
Received: from smuch56b.muc (HELO SMUCH56B.europe.bmw.corp) ([160.46.137.110])
	by esabb4.muc with ESMTP/TLS; 09 Dec 2015 10:38:45 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH56B.europe.bmw.corp ([160.46.137.110]) with mapi id 14.03.0248.002;
	Wed, 9 Dec 2015 10:38:44 +0100
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH v2] cmake_qt5.bbclass: add DEPENDS to qtbase
Thread-Index: AQHRMmPAwCnMlpcKn02fY+mCOVaukJ7CVTwA
Date: Wed, 9 Dec 2015 09:38:44 +0000
Message-ID: <20151209093842.GC21728@loska>
References: <1449653187-16148-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1449653187-16148-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.107]
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCH v2] cmake_qt5.bbclass: add DEPENDS to qtbase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Dec 2015 09:38:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C3D84E773437A04E99DEF33EA6A88213@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2015 at 11:26:27AM +0200, Mikko Rapeli wrote:
> All packages using this class need it and it is too easy for developers
> to miss and leave race conditions into builds.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  classes/cmake_qt5.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
> index 94a60dc..f63be3c 100644
> --- a/classes/cmake_qt5.bbclass
> +++ b/classes/cmake_qt5.bbclass
> @@ -1,6 +1,8 @@
>  inherit cmake
>  inherit qmake5_paths
> =20
> +DEPENDS_prepend =3D "qtbase"

Scrap this, leading space only was not needed. Sorry.

-Mikko

> +
>  EXTRA_OECMAKE +=3D " \
>      -DOE_QMAKE_PATH_PREFIX=3D${OE_QMAKE_PATH_PREFIX} \
>      -DOE_QMAKE_PATH_HEADERS=3D${OE_QMAKE_PATH_HEADERS} \
> --=20
> 2.6.2
> =

