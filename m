Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEFC65D15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:49:22 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so2927291eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GHnGKWaJGOeu/10JRwMBk/32RkJZPfAu0LuvqsMgaw0=;
	b=RHhGKrqCj8jscRVqyfNNPYP4H5ca+iNSJLVMmAUkoUpbbCg0thR7sHBO9WhOTOfRqF
	Sueu6oC0o2ar4/dCvCS7VPi0n9MTq4jElO1HfPGjmNUJ1odCIvqwldjVIdNedCnYTwh6
	gXiyem0LSzTpNACk8xULVPjmp6j8ToaJhyprqlY0oOT0jSj/5LRkVpdmfLDN9YpxmZrx
	hVoO+w9+RX0DO32WSbd/L8L80SL/JMHhqwLGfPpqGhDUM9EM2MLbRPzuWIcXzLXYKPHD
	Q/AoMriNOeWC6dwwQn2zgeyy1/+zqe9qmK2nVHRXi3n2RkU+rW6Qg6fCFIwDwEOJ2wbC
	tARA==
X-Received: by 10.15.83.68 with SMTP id b44mr38145138eez.11.1397994563626;
	Sun, 20 Apr 2014 04:49:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t4sm93966580eeb.29.2014.04.20.04.49.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:49:22 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:49:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420114919.GF2486@jama>
References: <1397623303-8512-1-git-send-email-changhyeok.bae@lge.com>
MIME-Version: 1.0
In-Reply-To: <1397623303-8512-1-git-send-email-changhyeok.bae@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libunwind: Add mirror site
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Apr 2014 11:49:28 -0000
X-Groupsio-MsgNum: 49339
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5p9QWNAcIBsfgc97"
Content-Disposition: inline

--5p9QWNAcIBsfgc97
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2014 at 01:41:43PM +0900, Changhyeok Bae wrote:
> The SRC_URI is not accessible.
> So need to add mirror site referred by the original site.

Merged, thanks!

for others: I've discussed this with Changhyeok and the problem is that
http://download.savannah.nongnu.org/releases redirects to closest mirror
and few mirrors (e.g. .jp) weren't working correctly while
http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.

I'll add this to commit message.

> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>  meta-oe/recipes-support/libunwind/libunwind.inc |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/re=
cipes-support/libunwind/libunwind.inc
> index a5b7482..a70ec2e 100644
> --- a/meta-oe/recipes-support/libunwind/libunwind.inc
> +++ b/meta-oe/recipes-support/libunwind/libunwind.inc
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3fced11d6df719=
b47505837a51c16ae5"
> =20
>  SRC_URI =3D "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-=
${PV}.tar.gz"
> =20
> +MIRRORS +=3D "http://download.savannah.nongnu.org/releases/ http://downl=
oad-mirror.savannah.gnu.org/releases/ \n"
> +
>  inherit autotools
> =20
>  PACKAGECONFIG ??=3D ""
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5p9QWNAcIBsfgc97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTtD8ACgkQN1Ujt2V2gByvZQCdFjaIIl+mRQz4FpQLoak7shsg
IiwAn1aX5OLcyyLncI390v0ckG+KRZ1L
=jc5G
-----END PGP SIGNATURE-----

--5p9QWNAcIBsfgc97--
