Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1U0WCf-0002vn-FE
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 12:51:45 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id ACE5BF811FD; Wed, 30 Jan 2013 04:36:05 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 96668F811FB;
	Wed, 30 Jan 2013 04:36:04 -0700 (MST)
Message-ID: <510905C3.9080409@mlbassoc.com>
Date: Wed, 30 Jan 2013 04:36:35 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1359539878-8331-1-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1359539878-8331-1-git-send-email-david.nystrom@enea.com>
Subject: Re: [meta-oe][PATCH] Upgrade of python-lxml to 2.3.5
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
X-List-Received-Date: Wed, 30 Jan 2013 11:51:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013-01-30 02:57, David Nystr=C3=B6m wrote:
> Signed-off-by: David Nystr=C3=B6m <david.nystrom@enea.com>
> ---
>   .../{python-lxml_2.2.8.bb =3D> python-lxml_2.3.5.bb} |   15 +++++++--=
------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>   rename meta-oe/recipes-devtools/python/{python-lxml_2.2.8.bb =3D> pyt=
hon-lxml_2.3.5.bb} (69%)
>
> diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/met=
a-oe/recipes-devtools/python/python-lxml_2.3.5.bb
> similarity index 69%
> rename from meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> rename to meta-oe/recipes-devtools/python/python-lxml_2.3.5.bb
> index a175609..76821ff 100644
> --- a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> +++ b/meta-oe/recipes-devtools/python/python-lxml_2.3.5.bb
> @@ -2,20 +2,21 @@ DESCRIPTION =3D "Powerful and Pythonic XML processing=
 library combining \
>   libxml2/libxslt with the ElementTree API."
>   HOMEPAGE =3D "http://codespeak.net/lxml"
>   LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3D7de92baeb3b7bfaebe7240=
4155fdb346"
> +LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3D3638a580895ea734c2cbb4=
6f586afd2c"
>   SRCNAME =3D "lxml"
> -PR =3D "r2"
> +PR =3D "r0"
>
>   DEPENDS =3D "libxml2 libxslt"
>   RDEPENDS_${PN} +=3D "libxml2 libxslt python-compression"
>
> -SRC_URI =3D "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRC=
NAME}-${PV}.tar.gz;name=3Dlxml"
> -SRC_URI[lxml.md5sum] =3D "d6c612d63a84d79440912a1b29d3b981"
> -SRC_URI[lxml.sha256sum] =3D "89b73925b5e3295dcf4675cb948007a20eb029fe3=
5c9a162ae19ec11f1abafe5"
> +SRC_URI =3D "http://lxml.de/files/lxml-2.3.5.tgz \

Why the change away from the official pypi repository??

> +"
>
> +SRC_URI[md5sum] =3D "d03fb3b9139df7f182afffe72f412c87"
> +SRC_URI[sha256sum] =3D "7ec68de58814014543b3b6f21f36e3695359be715ad063=
48a14c7820dfa0e092"
>   S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>
> -inherit setuptools
> +inherit setuptools
>
>   DISTUTILS_BUILD_ARGS +=3D " \
>                        --with-xslt-config=3D'${STAGING_BINDIR_NATIVE}/p=
kg-config libxslt' \
> @@ -30,5 +31,3 @@ DISTUTILS_INSTALL_ARGS +=3D " \
>   BBCLASSEXTEND =3D "native nativesdk"
>   RDEPENDS_${PN}_virtclass-native =3D "libxml2-native libxslt-native"
>
> -
> -
>

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


