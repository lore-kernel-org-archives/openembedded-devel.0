Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5B53076230
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 04:00:04 +0000 (UTC)
Received: by pasz6 with SMTP id z6so76252002pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 20:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=xaTJRZzYoz9gmAIqH5MgRtNF6fL2P5zbGhJxTa/aTa8=;
	b=Kceanio3qIzAOLv1b0KMmcMFHYZmlmHOJSF7RSAlvNWESaBgygcio8O0Cd1gCiibAD
	0wKSAPW/j0lNlWWxb8dSnlmtMNdBvVBKc0Y0s/Gye3Ckr71uzV3bW/zw3zuUkX9cAQn7
	21KomKCu6TIsccV57Og/wcj3ySQTH7ipIZQA5xK6EFUm4p4RgU670aHfApnzGNpnZGbG
	YlwayiK3ggvYbiUs0Z03ly0wkck44nxaIv8gLV3o2Cmr0IjobLAfsrNHSsu1gbF0XAeX
	pSOF0/lXCV8HaDD9/jgMG+eA4yfPOaRtLO/OYP0CluXfBBlHP9EjRfNfTxcO8g1GePRr
	H+Qw==
X-Received: by 10.68.98.129 with SMTP id ei1mr6500171pbb.7.1446696004479;
	Wed, 04 Nov 2015 20:00:04 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:441f:6745:6fd9:23af?
	([2601:646:8601:4580:441f:6745:6fd9:23af])
	by smtp.gmail.com with ESMTPSA id
	qy7sm4818121pab.37.2015.11.04.20.00.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Nov 2015 20:00:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1446695892-21744-1-git-send-email-danismostlikely@gmail.com>
Date: Wed, 4 Nov 2015 19:59:55 -0800
Message-Id: <4E31BAC6-C2FD-4A5F-816C-C131831653AC@gmail.com>
References: <1446695892-21744-1-git-send-email-danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3106)
Subject: Re: [meta-python][PATCH 1/2] python-html5lib: import recipe from meta-openstack
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
X-List-Received-Date: Thu, 05 Nov 2015 04:00:04 -0000
X-Groupsio-MsgNum: 58326
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EF54E85F-6EFE-4BAF-A217-7B91CFF213D5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EF54E85F-6EFE-4BAF-A217-7B91CFF213D5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 4, 2015, at 7:58 PM, Dan McGregor <danismostlikely@gmail.com> =
wrote:
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> This recipe is needed for GateOne.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
> .../python/python-html5lib_0.999.bb                | 27 =
++++++++++++++++++++++
> 1 file changed, 27 insertions(+)
> create mode 100644 =
meta-python/recipes-devtools/python/python-html5lib_0.999.bb
>=20
> diff --git =
a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb =
b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
> new file mode 100644
> index 0000000..9ad84e8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "HTML parser based on the WHATWG HTML specifcation"
> +HOMEPAGE =3D "https://github.com/html5lib/html5lib-python"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D1ba5ada9e6fead1fdc32f43c9f10ba7c"
> +
> +PR =3D =E2=80=9Cr0"

drop it.

> +
> +SRCNAME =3D "html5lib"
> +SRC_URI =3D =
"http://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.=
gz"
> +
> +SRC_URI[md5sum] =3D "acb8ba4d6db5637360a07859192eb7f8"
> +SRC_URI[sha256sum] =3D =
"c3887f7e2875d7666107fa8bee761ff95b9391acdcc7cd1b5fd57a23b5fbc49e"
> +
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS +=3D " \
> +        python-pip \
> +        "
> +
> +# RDEPENDS_default:
> +RDEPENDS_${PN} +=3D " \
> +        =E2=80=9C

why is this needed.

> --
> 2.6.2.11.gb05c2f9
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_EF54E85F-6EFE-4BAF-A217-7B91CFF213D5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY61EMACgkQuwUzVZGdMxSzhQCdEnOj2BWppjWU6ku+IWb2Nibh
4GQAnjfxmW6NfNOOmSyZ7FsdVtg0YXwK
=XH+l
-----END PGP SIGNATURE-----

--Apple-Mail=_EF54E85F-6EFE-4BAF-A217-7B91CFF213D5--
