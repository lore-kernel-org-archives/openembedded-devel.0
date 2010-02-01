Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nbx7R-0006Kn-2Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 15:19:16 +0100
Received: from [192.168.1.12] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 1BCCD5847EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2010 16:09:39 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1264719083-19638-3-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2010 15:16:48 +0100
Message-Id: <CAC5C270-BE2D-47F4-8209-50C2FA0B9113@vanille-media.de>
References: <1264719083-19638-1-git-send-email-Martin.Jansa@gmail.com>
	<1264719083-19638-2-git-send-email-Martin.Jansa@gmail.com>
	<1264719083-19638-3-git-send-email-Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] python-cython: add version 0.12
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
X-List-Received-Date: Mon, 01 Feb 2010 14:19:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>

Am 28.01.2010 um 23:51 schrieb Martin Jansa:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> recipes/python/python-cython-native_0.12.bb |   10 ++++++++++
> recipes/python/python-cython_0.12.bb        |   16 ++++++++++++++++
> 2 files changed, 26 insertions(+), 0 deletions(-)
> create mode 100644 recipes/python/python-cython-native_0.12.bb
> create mode 100644 recipes/python/python-cython_0.12.bb
>=20
> diff --git a/recipes/python/python-cython-native_0.12.bb =
b/recipes/python/python-cython-native_0.12.bb
> new file mode 100644
> index 0000000..95886ae
> --- /dev/null
> +++ b/recipes/python/python-cython-native_0.12.bb
> @@ -0,0 +1,10 @@
> +require python-cython_${PV}.bb
> +inherit native
> +DEPENDS =3D "python-native"
> +RDEPENDS =3D ""
> +
> +do_stage() {
> +    PYTHONPATH=3D${STAGING_BINDIR} BUILD_SYS=3D${BUILD_SYS} =
HOST_SYS=3D${HOST_SYS} \
> +    STAGING_LIBDIR=3D${STAGING_LIBDIR} =
STAGING_INCDIR=3D${STAGING_INCDIR} \
> +        ${STAGING_BINDIR}/python setup.py install =
--prefix=3D${STAGING_BINDIR}/.. --install-data=3D${STAGING_DATADIR}
> +}
> diff --git a/recipes/python/python-cython_0.12.bb =
b/recipes/python/python-cython_0.12.bb
> new file mode 100644
> index 0000000..846be47
> --- /dev/null
> +++ b/recipes/python/python-cython_0.12.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Cython is a language specially designed for writing =
Python extension modules. \
> +It's designed to bridge the gap between the nice, high-level, =
easy-to-use world of Python \
> +and the messy, low-level world of C."
> +SECTION =3D "devel/python"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"
> +SRCNAME =3D "Cython"
> +PR =3D "ml0"
> +
> +SRC_URI =3D =
"http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz;name=3Darchive"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +SRC_URI[archive.md5sum] =3D "f73ad2258115c92ce982d34d27580076"
> +SRC_URI[archive.sha256sum] =3D =
"90d611aeff8d017a5ccca3b1e02ec8d6dd0efc7dfd29806f721bc718d3774ea3"
> +
> +inherit distutils
> --=20
> 1.6.6.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



