Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1R0eMw-0001Gf-7D
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 20:58:06 +0200
Received: by fxg11 with SMTP id 11so3924614fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2011 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=dCKpKwESOX7CCviURNZ09/XdcSDSne5Cf6pOhbFdYBQ=;
	b=osukGfMfQFCBq4VV0vdHmA1bFmC5PsnFvX0RY8Hor7O4P7ZwhHiCTK5v+XWLFnzADS
	q7JSWyBeV+RBRmSs6cW28MOt0nZEvhvhJooa7ctBvMd7W6nsi9EsVbQJzh6dpOaDQ0bv
	uDqGGoRk5l2Ev+3NlMTwts10Trzil4S4RyvZ4=
Received: by 10.223.99.91 with SMTP id t27mr118340fan.56.1315248783050; Mon,
	05 Sep 2011 11:53:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.107.73 with HTTP; Mon, 5 Sep 2011 11:52:43 -0700 (PDT)
In-Reply-To: <c0474b5644b7bdf87555b5aaba317d4288e0c6fc.1315235172.git.noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
	<c0474b5644b7bdf87555b5aaba317d4288e0c6fc.1315235172.git.noor_ahsan@mentor.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Mon, 5 Sep 2011 20:52:43 +0200
Message-ID: <CACVrrM=sjt0b0Fn1bP-L2rbpZ8rFXRH3ACb=zPwuSh5R-AB-Aw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 1/1] python-lxml: Add version 2.2.8 (initial recipe)
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
X-List-Received-Date: Mon, 05 Sep 2011 18:58:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I probably missed the initial submission of this patch (sorry for this), bu=
t...

2011/9/5 Noor, Ahsan <noor_ahsan@mentor.com>:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * Imported from oe.dev commit id bc6a94559157e6fcc190a22a259c0f757b8664ae=
.
> * Tested with MACHINE =3D 'qemuppc'
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> =A0.../recipes-devtools/python/python-lxml_2.2.8.bb =A0 | =A0 32 ++++++++=
++++++++++++
> =A01 files changed, 32 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-oe/recipes-devtools/python/python-lxml_2.2.8.b=
b
>
> diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/meta-=
oe/recipes-devtools/python/python-lxml_2.2.8.bb
> new file mode 100644
> index 0000000..b1aac3f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION =3D "Powerful and Pythonic XML processing library combining =
\
> +libxml2/libxslt with the ElementTree API."
> +HOMEPAGE =3D "http://codespeak.net/lxml"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3D7de92baeb3b7bfaebe724041=
55fdb346"
> +SRCNAME =3D "lxml"
> +
> +DEPENDS =3D "libxml2 libxslt"
> +RDEPENDS_${PN} +=3D "libxml2 libxslt python-compression"
> +
> +SRC_URI =3D "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNA=
ME}-${PV}.tar.gz;name=3Dlxml"
> +SRC_URI[lxml.md5sum] =3D "d6c612d63a84d79440912a1b29d3b981"
> +SRC_URI[lxml.sha256sum] =3D "89b73925b5e3295dcf4675cb948007a20eb029fe35c=
9a162ae19ec11f1abafe5"
> +
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +DISTUTILS_BUILD_ARGS +=3D " \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-xslt-config=3D'${STAGING=
_BINDIR_NATIVE}/pkg-config libxslt' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-xml2-config=3D'${STAGING=
_BINDIR_NATIVE}/xml2-config' \
> +"

Shouldn't this be STAGING_BINDIR_CROSS? BINDIR_NATIVE usually refers
to native libs and linking against them using setuptools may fail
(kind of) silently.

> +
> +DISTUTILS_INSTALL_ARGS +=3D " \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-xslt-config=3D'${STAGING=
_BINDIR_NATIVE}/pkg-config libxslt' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-xml2-config=3D'${STAGING=
_BINDIR_NATIVE}/xml2-config' \
> +"

Same here.

> +
> +BBCLASSEXTEND =3D "native nativesdk"

I don't know about native then. Basically one would have to
switch/create a 2nd recipe?

> +RDEPENDS_${PN}_virtclass-native =3D "libxml2-native libxslt-native"
> +
> +
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Regards,
  Michael


