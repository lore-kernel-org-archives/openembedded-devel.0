Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 140EC65FC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 11:25:44 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u56so4993597wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P5ZCaw42eCKsjwgZfXYaSP1kzdQumHUzgvgxXeHX9IY=;
	b=jvCR7frUehNOCVcl5mHE20GFwLxYN+FayXL6Oc7lCgVe28RbOLznz/c6+oREmT4akp
	EEQj+EuPDM2XcogeB2IkWO2nBVOvU1qhEVMluAZEiPzlpX8J03Ieaf0kTSWCMYc5gy3O
	+bteFg4fyCL/+Ht37t6q5/d4imHeH6rx4Dn7enSAZtu8trioMcGIwmpiVWFoNQ9yYGKJ
	FtiGxXY8lZqcD+efJnLChFin+4LNwjb5e8n1IzFIWJOT/m3IMMRSUDqO+yVjZeIpIVvD
	LKviOzeO7HhmV0GjaTkIIUl1DJyrcJkuSKK3pV+Uvww5m9EuTPw2iR9GFK3tSU4sKB9+
	61eA==
X-Received: by 10.15.35.72 with SMTP id f48mr327647eev.13.1402399545411;
	Tue, 10 Jun 2014 04:25:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	4sm51686323eeu.16.2014.06.10.04.25.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jun 2014 04:25:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Jun 2014 13:26:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140610112604.GF2433@jama>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 10 Jun 2014 11:25:47 -0000
X-Groupsio-MsgNum: 50250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Content-Disposition: inline

--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2014 at 12:27:39PM -0700, Ash Charles wrote:
> The po subdirectory is not copied over to the build directory of
> found on the VPATH for an out-of-tree build so we symlink it over.
>=20
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  meta-oe/recipes-support/eject/eject_2.1.5.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recip=
es-support/eject/eject_2.1.5.bb
> index c47c653..5c9c749 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -14,7 +14,9 @@ SRC_URI[sha256sum] =3D "ef9f7906484cfde4ba223b2682a3705=
8f9a3c7d3bb1adda7a34a67402e
> =20
>  S =3D "${WORKDIR}/${BPN}"
> =20
> -PR =3D "r1"
> +do_compile_prepend() {
> +    ln -s ${S}/po po
> +}

Fails in world builds:

ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe=
/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r=
1/temp/log.do_compile.29499)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/temp/log.do_compile.=
29499 =20
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-=
64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| cp: cannot copy a directory, `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po', into itself, `=
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-lin=
ux/eject/2.1.5-r1/eject/po/po'
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5=
-r1/temp/log.do_compile.29499)
NOTE: recipe eject-2.1.5-r1: task do_compile: Failed
ERROR: Task 34 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedd=
ed/meta-oe/recipes-support/eject/eject_2.1.5.bb, do_compile) failed with ex=
it code '1'


> =20
>  ALTERNATIVE_${PN} =3D "volname eject"
>  ALTERNATIVE_LINK_NAME[volname] =3D "${bindir}/volname"
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOW60wACgkQN1Ujt2V2gBy1yQCfezuvIHVJcVUA2LaoCGdTSXXy
f2MAn2dvckHo7TQVGoYicoPjaiNHcs+9
=kzci
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
