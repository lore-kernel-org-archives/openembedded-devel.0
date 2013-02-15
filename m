Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6Fi1-0000Ac-SE
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 08:27:50 +0100
Received: by mail-pb0-f51.google.com with SMTP id un15so507020pbc.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 23:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5Q4z4jJyBIUDYFocX5MgjZ9VTuQbdgUA8tRO4EGMow0=;
	b=A+6TjAWGoMdD0pzJNWlJ56pc2618VKVf6Y8bcutDlmRXVjjmSmLmh136Y16tA3kyBO
	AjUJ9LbqoVMUbErtLb+URvj3CPIgEpzEiIXGL7tpq8/B8otxFvn7KBWU2i8k5cUBxm82
	5P8APQxxR+JhCkDTtf+fc29GqZoMV5bTEwFnVb4DsM/Goe4QZcqgOw11M2hLS3ZtIki2
	ZW46daMYs1fD9mKsdombhHblocNzRNc9QuaCeeqsK5TkfNG3oX5d3LWptE4zCAaKhbj7
	HMQjdOoAyUK31LP5yNdb2StuQzKfn1zGeRVSgR0keJzN/glaYlzLS78xoDoLgV5zzHx7
	KrHg==
X-Received: by 10.68.189.40 with SMTP id gf8mr3577909pbc.128.1360912305788;
	Thu, 14 Feb 2013 23:11:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u10sm42671540pax.14.2013.02.14.23.11.42
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 23:11:43 -0800 (PST)
Date: Fri, 15 Feb 2013 08:11:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130215071140.GO3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-7-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360234263-18278-7-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 6/8] libmemcached: add 1.0.15 and 1.0.7 versions
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
X-List-Received-Date: Fri, 15 Feb 2013 07:27:50 -0000
X-Groupsio-MsgNum: 43175
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="acOuGx3oQeOcSZJu"
Content-Disposition: inline

--acOuGx3oQeOcSZJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2013 at 11:51:01AM +0100, Marcin Juszkiewicz wrote:
> 1.0.15 is latest
> 1.0.7 is required by HipHopVM
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-support/libmemcached/libmemcached.inc       | 10 +++++++=
+++
>  meta-oe/recipes-support/libmemcached/libmemcached_1.0.15.bb |  6 ++++++
>  meta-oe/recipes-support/libmemcached/libmemcached_1.0.7.bb  |  8 ++++++++
>  meta-oe/recipes-support/libunwind/files/aarch64.patch       |  8 ++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libmemcached/libmemcached.inc
>  create mode 100644 meta-oe/recipes-support/libmemcached/libmemcached_1.0=
=2E15.bb
>  create mode 100644 meta-oe/recipes-support/libmemcached/libmemcached_1.0=
=2E7.bb
>=20
> diff --git a/meta-oe/recipes-support/libmemcached/libmemcached.inc b/meta=
-oe/recipes-support/libmemcached/libmemcached.inc
> new file mode 100644
> index 0000000..448a15d
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmemcached/libmemcached.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "open source C/C++ client library and tools for the memc=
ached server"
> +DEPENDS =3D "libevent util-linux"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D865490941c91ba790f0ea78dec93b=
d60"
> +
> +SRC_URI =3D "http://launchpad.net/libmemcached/1.0/${PV}/+download/libme=
mcached-${PV}.tar.gz"
> +
> +TARGET_LDFLAGS +=3D "-luuid"
> +
> +inherit autotools gettext pkgconfig
> diff --git a/meta-oe/recipes-support/libmemcached/libmemcached_1.0.15.bb =
b/meta-oe/recipes-support/libmemcached/libmemcached_1.0.15.bb
> new file mode 100644
> index 0000000..18232b4
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmemcached/libmemcached_1.0.15.bb
> @@ -0,0 +1,6 @@
> +require libmemcached.inc
> +
> +SRC_URI +=3D "file://crosscompile.patch"

Where do you hide crosscompile.patch? Looks like older/newer name for
aarch64.patch which is not used in recipe?

WARNING: Unable to get checksum for libmemcached SRC_URI entry
crosscompile.patch: file could not be found

> +
> +SRC_URI[md5sum] =3D "616297a1aedefc52b3f6922eda5d559a"
> +SRC_URI[sha256sum] =3D "dd7e9560029835bddf761a5b4c2339d9e5c7374558659b6c=
11b2c95e7d3a4325"
> diff --git a/meta-oe/recipes-support/libmemcached/libmemcached_1.0.7.bb b=
/meta-oe/recipes-support/libmemcached/libmemcached_1.0.7.bb
> new file mode 100644
> index 0000000..0aa3050
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmemcached/libmemcached_1.0.7.bb
> @@ -0,0 +1,8 @@
> +require libmemcached.inc
> +
> +SRC_URI[md5sum] =3D "d59a462a92d296f76bff2d9bc72b2516"
> +SRC_URI[sha256sum] =3D "3efa86c9733eaad55d7119cb16769424e2aa6c22b3392e8f=
973946fce6678d81"
> +
> +do_configure_prepend_aarch64() {
> +    export ac_cv_c_endian=3Dlittle
> +}
> diff --git a/meta-oe/recipes-support/libunwind/files/aarch64.patch b/meta=
-oe/recipes-support/libunwind/files/aarch64.patch
> index 9ea8d83..bb19747 100644
> --- a/meta-oe/recipes-support/libunwind/files/aarch64.patch
> +++ b/meta-oe/recipes-support/libunwind/files/aarch64.patch
> @@ -1,3 +1,11 @@
> +Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +Upstream-Status: unsuitable
> +
> +We need to port it for AArch64 first. This patch just makes it die during
> +compilation.
> +
> +https://bugs.launchpad.net/linaro-aarch64/+bug/1099810
>  ---
>   configure.ac |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--acOuGx3oQeOcSZJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEd36wACgkQN1Ujt2V2gBxKpgCfcqSMbN2sBHkXZcUbbaoZgpkw
gngAn23IcT74ymRe1PeTkYHjPpWBB4s+
=o2TQ
-----END PGP SIGNATURE-----

--acOuGx3oQeOcSZJu--
