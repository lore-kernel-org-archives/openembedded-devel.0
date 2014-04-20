Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2C65365DDC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:45:31 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2995862eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2v8ljgcP8tFlk3jxppUF7f89tOG/r2sYvrZFPSs7ZvU=;
	b=hCezh0NnKDRCApQYfLobLb45PBWwWJtTmz5Jo75oxwo9GQZaeCnbXKi3brf7pJQenc
	f5Y7sKxaHcDY0fzip8MvtWbw4/98FhK8Ud5Dm2WoiNCOJP4O/pYhGWNOs8O3rxcgAc1Q
	Q4zPRrkHuD9ZatT1hoxlCp7BPDlDbnFJND6Zp57/r32nY3QJqxsZxqI50WY5kh6jpQcf
	j/T/PtIviMunqpwztq3nTdiz/vV1edgVGK1EegstIB866/JkF6Bg047bTS7nMm6WFaL6
	R67aGB8d7MgesnNkbruZCOYCnNRAmIOxf9Ap2wczoW/j0XnOeGIfZcuMFhMxlb3jhKwj
	iedw==
X-Received: by 10.14.179.193 with SMTP id h41mr38084815eem.27.1397994331975;
	Sun, 20 Apr 2014 04:45:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t50sm93939191eev.28.2014.04.20.04.45.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:45:30 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:45:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420114535.GZ2486@jama>
References: <1396651675-32469-1-git-send-email-stephen.arnold42@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396651675-32469-1-git-send-email-stephen.arnold42@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] gpm: sets D equal to DESTDIR instead of ROOT in do_install
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
X-List-Received-Date: Sun, 20 Apr 2014 11:45:35 -0000
X-Groupsio-MsgNum: 49333
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t+hlxQ2APDzOSz17"
Content-Disposition: inline

--t+hlxQ2APDzOSz17
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2014 at 03:47:55PM -0700, Stephen Arnold wrote:
> This corrects a gpm install failure due to ROOT being used instead of
> DESTDIR, resulting in DESTDIR being undefined.

Merged, thanks!

>=20
> Upstream-Status: Inappropriate (distribution/packaging fix)
>=20
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> ---
>  meta-oe/recipes-support/gpm/gpm_1.99.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-=
support/gpm/gpm_1.99.7.bb
> index e35e50e..a30a891 100644
> --- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> +++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> @@ -40,7 +40,7 @@ CFLAGS +=3D "-Wno-extra -Wno-error=3Dunused-but-set-par=
ameter -Wno-error=3Dunused-but-
>  CFLAGS +=3D "-Wno-error=3Dint-to-pointer-cast -Wno-error"
> =20
>  do_install () {
> -    oe_runmake 'ROOT=3D${D}' install
> +    oe_runmake 'DESTDIR=3D${D}' install
>      install -m 0644 src/headers/gpm.h ${D}${includedir}
>      install -d ${D}/${sysconfdir}/init.d
>      install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t+hlxQ2APDzOSz17
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTs18ACgkQN1Ujt2V2gByXzACfdQPT8Sc9tRAa4Oe+zy37cLSc
gOIAoIIE/zA1uSqYDJ3BkqKsvOqFSOVr
=F8KW
-----END PGP SIGNATURE-----

--t+hlxQ2APDzOSz17--
