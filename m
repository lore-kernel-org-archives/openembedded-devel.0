Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF5771B57
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:37:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 29 Sep 2017 10:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,453,1500966000"; d="scan'208";a="317764181"
Received: from ttorling-mac01.jf.intel.com (HELO [10.24.14.228])
	([10.24.14.228])
	by fmsmga004.fm.intel.com with ESMTP; 29 Sep 2017 10:37:16 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <1506673565-17289-1-git-send-email-guy@guy-morand.ch>
Date: Fri, 29 Sep 2017 10:37:17 -0700
Message-Id: <47BE632C-49AC-4509-9E45-A00124619DF5@linux.intel.com>
References: <1506673565-17289-1-git-send-email-guy@guy-morand.ch>
To: Guy Morand <guy@guy-morand.ch>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] Add python pandas recipes
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
X-List-Received-Date: Fri, 29 Sep 2017 17:37:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Sep 29, 2017, at 1:26 AM, Guy Morand <guy@guy-morand.ch> wrote:
>=20
> =E2=80=94
> <snip>
> diff --git =
a/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb =
b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
> new file mode 100644
> index 0000000..f4c486b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
> @@ -0,0 +1,10 @@
> +inherit setuptools
> +require python-pandas.inc
> +
> +RDEPENDS_${PN} +=3D " \
> +  ${PYTHON_PN}-json \
> +  ${PYTHON_PN}-importlib \
> +  "
> +
> +SRC_URI[md5sum] =3D "4df858f28b4bf4fa07d9fbb7f2568173"
> +SRC_URI[sha256sum] =3D =
=E2=80=9Ca777e07633d83d546c55706420179551c8e01075b53c497dcf8ae4036766bc66"=


These SRC_URI checksum lines should go in the python-pandas.inc file, =
rather than duplicate them in both the python-pandas and python3-pandas =
files.

It is quite common now for the =E2=80=9Cversion specific=E2=80=9D files =
to only be the =E2=80=9Cinherit=E2=80=9D line and the =E2=80=9Crequire =
foo.inc=E2=80=9D line.

DRY and KISS.

> diff --git =
a/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb =
b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
> new file mode 100644
> index 0000000..81dd360
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
> @@ -0,0 +1,5 @@
> +inherit setuptools3
> +require python-pandas.inc
> +
> +SRC_URI[md5sum] =3D "4df858f28b4bf4fa07d9fbb7f2568173"
> +SRC_URI[sha256sum] =3D =
"a777e07633d83d546c55706420179551c8e01075b53c497dcf8ae4036766bc66"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


