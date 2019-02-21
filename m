Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 76C9D7CAE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 05:42:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2019 21:42:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="124062990"
Received: from mtomozan-mobl.gar.corp.intel.com ([10.254.19.106])
	by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2019 21:42:35 -0800
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <20190221053537.4549-1-timothy.t.orling@linux.intel.com>
Date: Wed, 20 Feb 2019 21:42:34 -0800
Message-Id: <63AF48AB-CC50-4906-AC38-D23D6B26EF55@linux.intel.com>
References: <20190221053537.4549-1-timothy.t.orling@linux.intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] libterm-readkey-perl: fix upstream check
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
X-List-Received-Date: Thu, 21 Feb 2019 05:42:34 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Please ignore. This was applied on top of local changes=E2=80=A6 :/=20

> On Feb 20, 2019, at 9:35 PM, Tim Orling =
<timothy.t.orling@linux.intel.com> wrote:
>=20
> Add UPSTREAM_CHECK_REGEX
> Add UPSTREAM_CHECK_URI
>=20
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
> meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git =
a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb =
b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> index 6679588359..f29f156612 100644
> --- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> @@ -19,7 +19,8 @@ SRC_URI[sha256sum] =3D =
"4a9383cf2e0e0194668fe2bd546e894ffad41d556b41d2f2f577c8db68
>=20
> S =3D "${WORKDIR}/TermReadKey-${PV}"
>=20
> -UPSTREAM_CHECK_REGEX =3D =
"TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar"
> +UPSTREAM_CHECK_URI =3D "https://metacpan.org/release/TermReadKey"
> +UPSTREAM_CHECK_REGEX =3D =
"TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar.gz"
>=20
> # It needs depend on native to let dynamic loader use native modules
> # rather than target ones.
> --=20
> 2.20.1
>=20


