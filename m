Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBNIR-00035F-86
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 11:34:49 +0100
Received: by mail-pa0-f43.google.com with SMTP id bh2so1752452pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2013 02:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MctDQokQf2W09wRX5YZLH8DvnHYtGw2aVZB/Sa9uE88=;
	b=jxzjH+UVdM6Wk+uXp4+4Ws1Zy+B57CkUzkkVfDnfb1nXf2A3BEFA5vaQwgTUZlxwOr
	ueqe86iFdHCGVgpd3o7zlPqMCgTkaiCOXL2lkKaKgJU6U5mafNV5OBjeRSoe3h/GBOMI
	Awo4u9J9m5AN5CVOANBNaEgWLSThDZX/F1ZZV6c5UqVIPuk4U5YmGkRQK375Z7CUxzpU
	/uc2BVfmd+Y/ktBWkezabq1ciVzFNtU0iTKxG9Zw5piBpHQF8DAjbnpW7syMISFDEarw
	vLFNa49EIzHzZfZ4rkF+omspdoqiEiVq/ChbZ4lc7YCpx5DbGGQBiLc4+Q5z8+ikxGaK
	8X7g==
X-Received: by 10.68.197.70 with SMTP id is6mr13771692pbc.79.1362133091273;
	Fri, 01 Mar 2013 02:18:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e6sm12621706paw.16.2013.03.01.02.18.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 02:18:10 -0800 (PST)
Date: Fri, 1 Mar 2013 11:18:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130301101805.GJ3279@jama>
References: <1362131442-26879-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1362131442-26879-1-git-send-email-B40290@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: B29882@freescale.com, Chunrong Guo <B40290@freescale.com>,
	B19537@freescale.com
Subject: Re: [OE-core][PATCH] lmbench: update config script
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
X-List-Received-Date: Fri, 01 Mar 2013 10:34:51 -0000
X-Groupsio-MsgNum: 43348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUvfsPTz/SzOZDdw"
Content-Disposition: inline

--fUvfsPTz/SzOZDdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 05:50:42PM +0800, Chunrong Guo wrote:
> From: Chunrong Guo <b40290@freescale.com>
>=20
>       *fix bug that can not find  CONFIG file
>       |error: run ./results|./results: line 15: .: CONFIG.p2041rdb: file =
not found
>       * update CONFIG file path
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../lmbench-3.0-a9/update-config-script.patch      |   12 ++++++++++++
>  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    5 +++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/upda=
te-config-script.patch
>=20
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-conf=
ig-script.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-c=
onfig-script.patch
> new file mode 100644
> index 0000000..b46e09a
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-scri=
pt.patch
> @@ -0,0 +1,12 @@
> +Upstream-Status: Pending
> +Index: lmbench-3.0-a9/scripts/config
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- lmbench-3.0-a9/scripts/config	2000-01-31 18:29:31.000000000 -0600
> ++++ lmbench-3.0-a9/scripts/config	2013-03-01 00:19:41.032984315 -0600
> +@@ -3,5 +3,5 @@
> + UNAME=3D`uname -n 2>/dev/null`
> + if [ X$UNAME =3D X ]
> + then	echo CONFIG
> +-else	echo CONFIG.$UNAME
> ++else	echo ../scripts/CONFIG.$UNAME
> + fi
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-o=
e/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 611013e..026b067 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -7,14 +7,15 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c=
2336e835926c2166c28b \
> =20
>  inherit autotools
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
>  	   file://lmbench-run \
>  	   file://rename-line-binary.patch \
>  	   file://update-results-script.patch \
>  	   file://obey-ranlib.patch \
> -	   "
> +	   file://update-config-script.patch \=20
> +	  "

Please don't mix tabs and spaces. I know it was there before.

>  SRC_URI[md5sum] =3D "b3351a3294db66a72e2864a199d37cbf"
>  SRC_URI[sha256sum] =3D "cbd5777d15f44eab7666dcac418054c3c09df99826961a39=
7d9acf43d8a2a551"
> =20
> --=20
> 1.7.5.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUvfsPTz/SzOZDdw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEwgFwACgkQN1Ujt2V2gBxqoQCgh9I0ZKdnk7KSV1VkGW/uRNGt
BxUAoIF9oiGnSoMheQ6U0A8kz/nvJlMB
=YvmJ
-----END PGP SIGNATURE-----

--fUvfsPTz/SzOZDdw--
