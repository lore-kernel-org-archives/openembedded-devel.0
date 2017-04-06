Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3D56A72F7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 06:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491460231; x=1522996231;
	h=mime-version:subject:from:in-reply-to:date:cc:
	content-transfer-encoding:message-id:references:to;
	bh=JS5rh3iIL/li+DemweAQcaTpeIRCZx501gIvKnIEJlQ=;
	b=pGnFQeXVoMdoMPXUOUdr7xvcp7WBvvFjNcCIu1YaPKPxqlmVbFEU5zSH
	WSCqz+Stb4wDkFbFRBLpzuvT/fTZ4A==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 23:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,283,1488873600"; d="scan'208";a="1116084188"
Received: from acucurul-mobl.ger.corp.intel.com ([10.252.23.88])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2017 23:30:29 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <20170406011225.25591-1-andrej.rode@ettus.com>
Date: Thu, 6 Apr 2017 08:30:27 +0200
Message-Id: <171FD608-F7C9-4CE8-9401-5E2848728E63@linux.intel.com>
References: <20170406011225.25591-1-andrej.rode@ettus.com>
To: Andrej Rode <andrej.rode@ettus.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] systemd-python: add a new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 06:30:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 6, 2017, at 3:12 AM, Andrej Rode <andrej.rode@ettus.com> wrote:
>=20
> Adds new recipe for systemd-python, python bindings for libsystemd
>=20

This is breaking Debian naming for python packages, it should be =
python-systemd, not systemd-python. We need to be consistent.

=E2=80=94Tim
> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> ---
> meta-python/recipes-devtools/python/systemd-python_234.bb | 11 =
+++++++++++
> 1 file changed, 11 insertions(+)
> create mode 100644 =
meta-python/recipes-devtools/python/systemd-python_234.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/systemd-python_234.bb =
b/meta-python/recipes-devtools/python/systemd-python_234.bb
> new file mode 100644
> index 0000000..4cfa629
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/systemd-python_234.bb
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "Python interface for libsystemd"
> +HOMEPAGE =3D "https://github.com/systemd/systemd-python"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3D4fbd65380cdd255951079008b364516c"
> +DEPENDS +=3D "systemd"
> +RDEPENDS_${PN} +=3D "systemd"
> +
> +SRC_URI[md5sum] =3D "5071ea5bcb976186e92a3f5e75df221d"
> +SRC_URI[sha256sum] =3D =
"fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
> +
> +inherit pypi setuptools
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


