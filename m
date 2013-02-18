Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7ZpK-0007Gt-Bj
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 00:08:59 +0100
Received: by mail-pa0-f50.google.com with SMTP id fa11so3040404pad.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 14:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mA2VivWISxYYSwZrswgmgzfZHMextpCZbzmR7VUkNXc=;
	b=n6rIN52UifmsFiwTU+NXM3aWb2W1miORVaHEyS2ybkMkicl958fetllpAadGSoMDbU
	gVgRs+NTx/LIRi2+iaoR4X8cgY+tAo1GLq46IVNm4/fZLAE+rPvm7u8KjWkZ9WY+tb5f
	fRsvb4i7nd2Ake+l9VX22+QtxjSDeWCtekRPkuAQq0dM4ZJJZACa//CXyGjxnAwO30S2
	TSZg/rMUFncEYFWZq1Bq7T4KOuaeJR2k/3OPjPRU4hrwpN+JkJuHOVjAH08HUpwZTyV8
	CY9U/2FyJAqr0jUBO2HVjY8WuBLfq2Mj9PdrvhakK4GdwU1RYwmdFeF1RQ8Vt/W6aAxl
	YodQ==
X-Received: by 10.66.82.200 with SMTP id k8mr39978811pay.56.1361227961169;
	Mon, 18 Feb 2013 14:52:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm4200463pba.32.2013.02.18.14.52.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 14:52:40 -0800 (PST)
Date: Mon, 18 Feb 2013 23:52:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130218225241.GJ3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-5-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360234263-18278-5-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 4/8] memcached: add 1.4.15
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
X-List-Received-Date: Mon, 18 Feb 2013 23:09:04 -0000
X-Groupsio-MsgNum: 43227
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pO/lLFQm5EGc7Efl"
Content-Disposition: inline

--pO/lLFQm5EGc7Efl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2013 at 11:50:59AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-support/memcached/memcached_1.4.15.bb | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-support/memcached/memcached_1.4.15.bb
>=20
> diff --git a/meta-oe/recipes-support/memcached/memcached_1.4.15.bb b/meta=
-oe/recipes-support/memcached/memcached_1.4.15.bb
> new file mode 100644
> index 0000000..b6d436e
> --- /dev/null
> +++ b/meta-oe/recipes-support/memcached/memcached_1.4.15.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Free & open source, high-performance, distributed memor=
y object \
> +caching system, generic in nature, but intended for use in speeding up d=
ynamic \
> +web applications by alleviating database load."
> +HOMEPAGE =3D "http://memcached.org/"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7e5ded7363d335e1bb18013ca0804=
6ff"
> +
> +SRC_URI =3D "http://memcached.googlecode.com/files/memcached-${PV}.tar.g=
z"
> +
> +SRC_URI[md5sum] =3D "36ea966f5a29655be1746bf4949f7f69"
> +SRC_URI[sha256sum] =3D "169721ab7a7531add6ae9f6b14b6b5641725fe0b1f0bdf5c=
3a4327725901e2b4"
> +
> +DEPENDS =3D "libevent"
> +
> +inherit autotools
> +
> +do_configure_prepend_aarch64() {
> +	export ac_cv_c_endian=3Dlittle

we need this for other machines as well
| checking for endianness... configure: error: in
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/memcached/1.4.15-r0/memcached-1.4.15':
| configure: error: cannot run test program while cross compiling
| See `config.log' for more details

> +}
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

--pO/lLFQm5EGc7Efl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEisLkACgkQN1Ujt2V2gByEfQCbBCBB2ecpMjFbfxZfhmoxAyYN
nKYAni9J7KVQ8hIyN2FwjYsKIgr+8H8S
=C1O+
-----END PGP SIGNATURE-----

--pO/lLFQm5EGc7Efl--
