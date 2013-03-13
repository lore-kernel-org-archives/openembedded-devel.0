Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFdyG-0008BM-5f
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 06:11:29 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so239207daj.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2013 21:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=aZ7Yd3pwigDoTTPr4C2n/81563iICJkF5YsHpvLTtFw=;
	b=sp2L78TJBRc9qCTiaJs3iXru7wIwKu/kU+dd8b37lbD6bWPvvHyoZutGh0z0LHbiB0
	LEPIO1zPGVzZYDRI0StQkBgybf4WY3A25WRql/JYny1X+HGOhphbnmHLvWyxsT3ur24C
	/NBz2mIcjsRkmG06a2gfJBn7IJq1re1a1qK+UDPPgHsud7cwUIVG7tWHvvSsGoHpIu+t
	0z+vL97kTZCSzhoOhyD07bdT4tZrlRA66hlhKEZmRvKpbdYtf9rFEvpUROBV+0nB15jv
	bGvABPcFb3nCYUEVxN4lwQd++LubhLaDwUVBPBj7d/+hDzXBMml0anENw7liM82Vnn1T
	HrFg==
X-Received: by 10.68.225.138 with SMTP id rk10mr36016741pbc.146.1363150482669; 
	Tue, 12 Mar 2013 21:54:42 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id vd4sm27907455pbc.35.2013.03.12.21.54.40
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 21:54:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1363146643-30820-1-git-send-email-b28495@freescale.com>
Date: Tue, 12 Mar 2013 21:54:38 -0700
Message-Id: <4E524730-2F6C-4396-8DDC-2BD21AA7AA05@gmail.com>
References: <1363146643-30820-1-git-send-email-b28495@freescale.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Subject: Re: [meta-oe][PATCH] tclap: initial add 1.2.1
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
X-List-Received-Date: Wed, 13 Mar 2013 05:11:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 12, 2013, at 8:50 PM, b28495@freescale.com wrote:

> From: Ting Liu <b28495@freescale.com>
>=20
> TCLAP (Templatized C++ Command Line Parser Library ) is a small,
> flexible library that provides a simple interface for defining
> and accessing command line arguments. Templatized C++ Command
> Line Parser Library.
>=20
> Use the commit of tag tclap-1-2-1-release-final.
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
> meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   13 +++++++++++++
> 1 files changed, 13 insertions(+), 0 deletions(-)
> create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
>=20
> diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb =
b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> new file mode 100644
> index 0000000..c2b03a4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Templatized C++ Command Line Parser"=20
> +HOMEPAGE =3D "http://tclap.sourceforge.net/"=20
> +SECTION =3D "tclap"=20

why a special section dedicated to it.?

> +LICENSE =3D "MIT"=20
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dc8ab0ff134bcc584d0e6b5b9f8732453"
> +
> +SRCREV =3D "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
> +SRC_URI =3D "git://tclap.git.sourceforge.net/gitroot/tclap/tclap"=20
> +
> +S =3D "${WORKDIR}/git"
> +inherit autotools
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.3.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



