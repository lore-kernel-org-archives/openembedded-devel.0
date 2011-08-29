Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QxxRh-00032z-4C
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 10:43:53 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QxxN0-0001C1-J3 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 01:39:02 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 29 Aug 2011 10:38:59 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A586E@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1313665760-21930-1-git-send-email-noor_ahsan@mentor.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [PATCH][meta-oe] python-lxml: Added new recipe in meta-oe for
	2.2.8 version
Thread-Index: Acxdl0y9M2Rq/ls8QW+EEEBw5ENdEAIj7Yfw
References: <1313665760-21930-1-git-send-email-noor_ahsan@mentor.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] python-lxml: Added new recipe in meta-oe for 2.2.8 version
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
X-List-Received-Date: Mon, 29 Aug 2011 08:43:53 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Ahsan, Noor
> Sent: Thursday, August 18, 2011 4:09 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Ahsan, Noor
> Subject: [PATCH][meta-oe] python-lxml: Added new recipe in meta-oe for
> 2.2.8 version
>=20
> From: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> * Added new recipe in meta-oe for 2.2.8 version
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  .../recipes-devtools/python/python-lxml_2.2.8.bb   |   32
> ++++++++++++++++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> new file mode 100644
> index 0000000..b1aac3f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION =3D "Powerful and Pythonic XML processing library =
combining
> \
> +libxml2/libxslt with the ElementTree API."
> +HOMEPAGE =3D "http://codespeak.net/lxml"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSES.txt;md5=3D7de92baeb3b7bfaebe72404155fdb346"
> +SRCNAME =3D "lxml"
> +
> +DEPENDS =3D "libxml2 libxslt"
> +RDEPENDS_${PN} +=3D "libxml2 libxslt python-compression"
> +
> +SRC_URI =3D
> "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-
> ${PV}.tar.gz;name=3Dlxml"
> +SRC_URI[lxml.md5sum] =3D "d6c612d63a84d79440912a1b29d3b981"
> +SRC_URI[lxml.sha256sum] =3D
> "89b73925b5e3295dcf4675cb948007a20eb029fe35c9a162ae19ec11f1abafe5"
> +
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +DISTUTILS_BUILD_ARGS +=3D " \
> +
--with-xslt-config=3D'${STAGING_BINDIR_NATIVE}/pkg-
> config libxslt' \
> +                     --with-xml2-
> config=3D'${STAGING_BINDIR_NATIVE}/xml2-config' \
> +"
> +
> +DISTUTILS_INSTALL_ARGS +=3D " \
> +
--with-xslt-config=3D'${STAGING_BINDIR_NATIVE}/pkg-
> config libxslt' \
> +                     --with-xml2-
> config=3D'${STAGING_BINDIR_NATIVE}/xml2-config' \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +RDEPENDS_${PN}_virtclass-native =3D "libxml2-native libxslt-native"
> +
> +
> --
> 1.7.0.4
Hi,

Kindly pull this patch. Thanks

Regards,
Noor


