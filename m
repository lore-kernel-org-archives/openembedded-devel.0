Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB52361AD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2013 19:47:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r62Jl9pj028589
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Jul 2013 12:47:09 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 2 Jul 2013 12:47:07 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 6CC3252D0B	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2013 15:46:57 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id A7ABC40534; Tue,
	2 Jul 2013 15:47:07 -0400 (EDT)
Date: Tue, 2 Jul 2013 15:47:07 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130702194707.GA11321@windriver.com>
References: <1372789916-2672-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1372789916-2672-1-git-send-email-Martin.Jansa@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] vsftpd: add missing dependency on openssl
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
X-List-Received-Date: Tue, 02 Jul 2013 19:47:07 -0000
X-Groupsio-MsgNum: 45261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] vsftpd: add missing dependency on openssl] O=
n 13.07.02 (Tue 20:31) Martin Jansa wrote:

> * Fails without openssl in sysroot:
>   | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/sysroots/qem=
ux86 -o vsftpd main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.=
o tunables.o ftpdataio.o secbuf.o ls.o postprivparent.o logging.o str.o net=
str.o sysstr.o strlist.o banner.o filestr.o parseconf.o secutil.o ascii.o o=
neprocess.o twoprocess.o privops.o standalone.o hash.o tcpwrap.o ipaddrpars=
e.o access.o features.o readwrite.o opts.o ssl.o sslslave.o ptracesandbox.o=
 ftppolicy.o sysutil.o sysdeputil.o  -lssl -lcrypto -lnsl -lresolv -Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--as-needed -lcrypt -lcap
>   | /OE/sysroots/x86_64-linux/usr/libexec/i586-webos-linux/gcc/i586-webos=
-linux/4.7.2/ld: cannot find -lssl
>   | /OE/sysroots/x86_64-linux/usr/libexec/i586-webos-linux/gcc/i586-webos=
-linux/4.7.2/ld: cannot find -lcrypto
>   | collect2: error: ld returned 1 exit status
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> index c02ee9c..f146910 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> @@ -4,7 +4,7 @@ SECTION =3D "network"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271"
> =20
> -DEPENDS =3D "libcap"
> +DEPENDS =3D "libcap openssl"
> =20
>  SRC_URI =3D "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
>             file://makefile-destdir.patch \

Thanks, merged.

--=20
-Joe MacDonald.
:wq

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHTLjsACgkQPN8S4W6ZZndUvgCfRx8ubB12mHgjqMQID9i5DbMk
YFoAnjnsyyeKIm+ND546UC1xKrmw8gfm
=ya/+
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
