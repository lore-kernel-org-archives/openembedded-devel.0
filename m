Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id C19EC7026A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 08:19:17 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so6082367wes.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 01:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zns3Gq1zNjSCxwszLWfe500EhhX6xIBXYonPdNsnN20=;
	b=KiKOYlP2JkNeMTuEvcxco9bJTvsgE1Z7KbQa8eg9OM6TTuBEFqnmSB/V6+xrklyT6D
	mPzl7jN7rMwGZvd2pIHBP5n6EolJ1hGpb3cn8zXM+2hZhIuTWDGQ+9VdvjqP+D1apMpA
	6yEnl1T8SG8bvhJvhXkeS7q/QO7kgmtsSAkH9shWrKSeP0e76TNSAQWDML1buTrTfoSa
	t2m4VY4qCGF62gSKk31hqpP6RbCYWpPMk4vGO4Qw5i8DtBpTsnD/HkMGCZ5sPEr8recr
	HFn8iLn45h2GNCHGpL6YKs2pFfoO2KBw3KK8fuqDWYC8nQJbUySrXjMjchDizt9WYLAU
	9c/g==
X-Received: by 10.194.110.10 with SMTP id hw10mr11133973wjb.81.1405844358860; 
	Sun, 20 Jul 2014 01:19:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bg2sm27471156wib.21.2014.07.20.01.19.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 01:19:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 10:19:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140720081931.GU2433@jama>
References: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
	<1405829260-13293-5-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1405829260-13293-5-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-multimedia][PATCH 4/4] vlc: add patches to fix B!=S and pkg-config
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
X-List-Received-Date: Sun, 20 Jul 2014 08:19:20 -0000
X-Groupsio-MsgNum: 51103
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RRAIye3QNVdtSBls"
Content-Disposition: inline

--RRAIye3QNVdtSBls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2014 at 09:07:40PM -0700, Tim Orling wrote:
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb b/meta-m=
ultimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> index 46a2712..f9be48d 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> @@ -5,6 +5,8 @@ EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
> =20
>  SRC_URI +=3D "file://0001-enable-subdir-objects.patch \
>              file://0002-glibc-does-not-provide-strlcpy.patch \
> +            file://0003-use-am-path-libgcrypt.patch \
> +            file://0004-modules-gui-qt4-out-of-tree-build.patch \
>  "

Please add this together with .patch file itself.

>  SRC_URI[md5sum] =3D "7ed67d22f7425011078772bfc62ac222"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RRAIye3QNVdtSBls
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPLe5MACgkQN1Ujt2V2gBw2/wCgsOaDmMPvNs9+KPaB04fFU1Zl
VgAAoJW5SwEVcT+Yt50yXcHvVnlb9NEX
=HOQT
-----END PGP SIGNATURE-----

--RRAIye3QNVdtSBls--
