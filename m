Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PeuD5-00055Y-KA
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 19:53:48 +0100
Received: by fxm17 with SMTP id 17so6238962fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 10:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aBGcQnvQ+Y9wSu7lD+6EzvOwsALdLZVo6eQeqmxM7oU=;
	b=l2DIa+bZJIq9FM2F+PL/79zQ2B5c3B9/ydfI1PLPOMqTdju9zim2xDgXRM89p1Gbfd
	XmnC6/2l3nqoYRnRfvA9JSgpP9W7RdstgrYUEeQDLv9AjIGFn0cYmY5rBoKLKyjheXIz
	BUlgPoFkuINCR0A08YT+Go28ko0CL4wfGka0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kXPCzzkAMVMxhood+hZg8I28uMyssuMyzfefWIjesP3UO6hWEz6G7nhWP+4MUNW5Rv
	VLeZ8uDIPsD0TrxzvSgtaw/Njjn71vVb7WKr31m+yDo/Lfgc3y60cqI8VGWZso9kdY/Y
	jgBNIxPP1LymaJ9oMkxNxXKM1WgPk18r8yFZE=
Received: by 10.223.83.144 with SMTP id f16mr5251595fal.4.1295290386617;
	Mon, 17 Jan 2011 10:53:06 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm1794579faa.5.2011.01.17.10.53.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 10:53:05 -0800 (PST)
Date: Mon, 17 Jan 2011 19:53:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110117185345.GK21179@jama>
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
	<1295286639-4901-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1295286639-4901-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] sane-toolchain.inc: Prefer binutils 2.21
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
X-List-Received-Date: Mon, 17 Jan 2011 18:53:48 -0000
X-Groupsio-MsgNum: 28104
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline

--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2011 at 09:50:39AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I'm using it locally for a while and looks ok.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  conf/distro/include/sane-toolchain.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include=
/sane-toolchain.inc
> index 642f289..dd06650 100644
> --- a/conf/distro/include/sane-toolchain.inc
> +++ b/conf/distro/include/sane-toolchain.inc
> @@ -6,7 +6,7 @@
> =20
>  # Base line versions, good for most things
>  PREFERRED_GCC_VERSION                ?=3D "4.5"
> -PREFERRED_BINUTILS_VERSION           ?=3D "2.20.1"
> +PREFERRED_BINUTILS_VERSION           ?=3D "2.21"
>  PREFERRED_UCLIBC_VERSION             ?=3D "git"
>  PREFERRED_EGLIBC_VERSION             ?=3D "2.12"
>  PREFERRED_GLIBC_VERSION              ?=3D "2.10.1"
> --=20
> 1.7.2.3
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk00kDkACgkQN1Ujt2V2gBxhvQCgniI4rvs3llhkLmbWR3CkViBB
4CYAn3sxbPNL4cNBXzXr7bRzJNWu7peu
=PQNA
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--
