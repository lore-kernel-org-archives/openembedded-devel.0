Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULYZt-0006YV-PR
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 13:38:41 +0100
Received: by mail-ea0-f170.google.com with SMTP id a15so205240eae.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=io+IAryZRgAQt/O2K+MWq/WNMEOVN3h6+TX2rcb+VIw=;
	b=OIbmf70RUfR4yOQi8BbVQIxdDF+p1tbqKMb2eoD2aQiGIS6cB08bMDSmQME0RIccxM
	cNqYp8rakf2sbhAS0syOMHyJcvUogEZXo+IzToijskDMMmgTQCpZUzMgIvn5bQbH15uw
	mARAO8o7cYCdEGDgs8V8VdWRliQd2XjaoRW+hVjMS+4Ky29S1hxuRZSi5k4Yrdj5WUxj
	wESkfTnF9b+2DZY82aDvrTd2AM41VcCFhPLDLYeuwb818f2zSaUK32Jswc/iZzj65YMA
	tBdlfKUPOod3r9eHo76RLa1LKyn7U+E6ZjTaf+e8RYTBPw6Vxc65unbCZwAjecdmUJxc
	tjvw==
X-Received: by 10.15.22.76 with SMTP id e52mr7556709eeu.7.1364559698076;
	Fri, 29 Mar 2013 05:21:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r4sm3688106eeo.12.2013.03.29.05.21.36
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 05:21:36 -0700 (PDT)
Date: Fri, 29 Mar 2013 13:21:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130329122140.GD11120@jama>
References: <1364204339-16695-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1364204339-16695-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libunwind: add 1.1 version
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
X-List-Received-Date: Fri, 29 Mar 2013 12:38:41 -0000
X-Groupsio-MsgNum: 43785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 10:38:59AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Applied, thanks!

Hopefully in right (last) revision.

Would be great if you can update patchwork status and use PATCHvN for
next patches.

memcached/libmemcached are still pending (unresolved review comments=20
afaik).

> ---
>  meta-oe/recipes-support/libunwind/libunwind.inc    | 12 ++++++++++++
>  meta-oe/recipes-support/libunwind/libunwind_1.1.bb |  4 ++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libunwind/libunwind.inc
>  create mode 100644 meta-oe/recipes-support/libunwind/libunwind_1.1.bb
>=20
> diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/re=
cipes-support/libunwind/libunwind.inc
> new file mode 100644
> index 0000000..f028766
> --- /dev/null
> +++ b/meta-oe/recipes-support/libunwind/libunwind.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to determine the call-chain of a program"
> +HOMEPAGE =3D "http://www.nongnu.org/libunwind"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3fced11d6df719b47505837a51c16=
ae5"
> +
> +SRC_URI =3D "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-=
${PV}.tar.gz"
> +
> +inherit autotools
> +
> +EXTRA_OECONF_arm =3D "--enable-debug-frame"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-oe=
/recipes-support/libunwind/libunwind_1.1.bb
> new file mode 100644
> index 0000000..bc38e36
> --- /dev/null
> +++ b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> @@ -0,0 +1,4 @@
> +require libunwind.inc
> +
> +SRC_URI[md5sum] =3D "fb4ea2f6fbbe45bf032cd36e586883ce"
> +SRC_URI[sha256sum] =3D "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab=
302d41a8aee8d09a"
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFVh1QACgkQN1Ujt2V2gBwFZQCdHJhis6Epc2o1/7LXuwPu7wLR
ipQAn1pEzSMZ9vNBP051z1pfBLe9LLqk
=X1uI
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
