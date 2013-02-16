Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6aUT-00060C-PG
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 06:39:20 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so882544pbc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 21:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BiYpaDrpFZPJHWAo78KOrDtvMNIkyLTmk0X0YSMv0hI=;
	b=E5/p0ufP+1ObVAoxbW5EgRgEGD8HjS2j4kdj41ZyXXyr86fetRg68FmWGAA5DFo1Gv
	Mlk3DYNNZFyZcVdEV+kf1Dq7Bpp9VFmkX39iRixv+dJWYpsRwWrQ4Dam26m7m6VAgugq
	BRBmcujPTCQR/Lt/lWAGKfm1YWG7wBLtINuIkCvYozD4guGJThRqjlFUTOjJt+uDqxDK
	mJmhwHLd9m0xURH3xDLxpusg74EKe0BBr0GghB2AuG8KIO8rNjxAZnQdrt4JKyh7hE9a
	5uozbEpLmJBfUTJla1KdOjV/CxGlXL6qXp3I8gIudl2Uk3fRVZ+B9URUkiT2QcDLJNj1
	s2Dg==
X-Received: by 10.68.50.1 with SMTP id y1mr11815477pbn.22.1360992188444;
	Fri, 15 Feb 2013 21:23:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id c8sm6911578pbq.10.2013.02.15.21.23.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 21:23:07 -0800 (PST)
Date: Sat, 16 Feb 2013 06:23:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216052306.GW3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-9-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360234263-18278-9-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 8/8] google-perftools: add 2.0
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
X-List-Received-Date: Sat, 16 Feb 2013 05:39:43 -0000
X-Groupsio-MsgNum: 43197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fCmRXBY78W5odcVA"
Content-Disposition: inline

--fCmRXBY78W5odcVA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2013 at 11:51:03AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Fails to install with newer autotools:

| /usr/bin/install: will not overwrite just-created
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/gperftools/2.0-r0/image/usr/include/google/tcmalloc.h'
with `src/windows/google/tcmalloc.h'
| make[1]: *** [install-googleincludeHEADERS] Error 1

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30215_060633.log/

> ---
>  meta-oe/recipes-support/google-perftools/gperftools_2.0.bb | 11 ++++++++=
+++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-support/google-perftools/gperftools_2=
=2E0.bb
>=20
> diff --git a/meta-oe/recipes-support/google-perftools/gperftools_2.0.bb b=
/meta-oe/recipes-support/google-perftools/gperftools_2.0.bb
> new file mode 100644
> index 0000000..1717752
> --- /dev/null
> +++ b/meta-oe/recipes-support/google-perftools/gperftools_2.0.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Fast, multi-threaded malloc() and nifty performance ana=
lysis tools"
> +HOMEPAGE =3D "http://code.google.com/p/gperftools/"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D762732742c73dc6c7fbe8632f06c0=
59a"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/g/google-perftools/google-perftools_$=
{PV}.orig.tar.gz"
> +
> +SRC_URI[md5sum] =3D "13f6e8961bc6a26749783137995786b6"
> +SRC_URI[sha256sum] =3D "7de3dd91f018825b1e7d332af1edace15c6211f430186feb=
ede1835069861080"
> +
> +inherit autotools
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

--fCmRXBY78W5odcVA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEfF7oACgkQN1Ujt2V2gByXYwCeIz5o2/Ykr1CFYpmoe/zrLgXw
g9IAoI8GFhALVsGBtYvfLBgyEngkpjdV
=5TWV
-----END PGP SIGNATURE-----

--fCmRXBY78W5odcVA--
