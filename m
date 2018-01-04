Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 218AC6010B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 16:44:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 08:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,314,1511856000"; d="scan'208";a="17492383"
Received: from lattal-mobl6.amr.corp.intel.com ([10.254.35.187])
	by orsmga003.jf.intel.com with ESMTP; 04 Jan 2018 08:44:37 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <20180104160623.23830-1-rjpdasilva@gmail.com>
Date: Thu, 4 Jan 2018 08:44:37 -0800
Message-Id: <C86C34FA-F934-44CA-8A2B-64478F87AD82@linux.intel.com>
References: <20180104160623.23830-1-rjpdasilva@gmail.com>
To: Ricardo Silva <rjpdasilva@gmail.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] pycrypto: Add recipe to have support on python3
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
X-List-Received-Date: Thu, 04 Jan 2018 16:44:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 4, 2018, at 8:06 AM, Ricardo Silva <rjpdasilva@gmail.com> =
wrote:
>=20
> The pycrypto module sources can be used for both python2 and python3,
> but a recipe for python3 was missing, so add it.
>=20
> Recipe is basically the same as for python2 =
(python-pycrypto_2.6.1.bb),
> but using distutils3 instead.
>=20
> Signed-off-by: Ricardo Silva <rjpdasilva@gmail.com>
> ---
> .../recipes-devtools/python/python3-pycrypto_2.6.1.bb       | 13 =
+++++++++++++
> 1 file changed, 13 insertions(+)
> create mode 100644 =
meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
>=20
> diff --git =
a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb =
b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
> new file mode 100644
> index 000000000..2878c8599
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
> @@ -0,0 +1,13 @@
> +inherit distutils3
> +require python-pycrypto.inc
> +
> +SRC_URI +=3D "file://cross-compiling.patch \
> +            file://CVE-2013-7459.patch \
> +

These will not be picked up as they are in "python-pycrypto" directory =
(not in =E2=80=9Cfiles=E2=80=9D or =E2=80=9Cpython3-pycrypto=E2=80=9D, =
etc.). This will result in a fetcher failure.

Rather than duplicate the SRC_URI in both python2- and python3- recipes, =
we should add them to python-pycrypto.inc and add the following to =
python-pycrypto.inc

FILESEXTRAPATHS_prepend :=3D "${THISDIR}/python-pycrypto:=E2=80=9D

>           "
> +
> +# We explicitly call distutils_do_install, since we want it to run, =
but
> +# *don't* want the autotools install to run, since this package =
doesn't
> +# provide a "make install" target.
> +do_install() {
> +       distutils3_do_install
> +}
> --=20
> 2.15.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


