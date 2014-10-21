Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0BA65CA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 18:42:48 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1XgeOP-0004F5-Fb from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2014 11:42:49 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 21 Oct 2014 11:42:48 -0700
Received: by burninator (Postfix, from userid 1000)	id 47A5158103D; Tue, 21
	Oct 2014 14:42:48 -0400 (EDT)
Date: Tue, 21 Oct 2014 14:42:48 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141021184247.GC18243@mentor.com>
References: <1413450161-14160-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1413450161-14160-1-git-send-email-kai.kang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] postfix: remove overriding config config_directory
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
X-List-Received-Date: Tue, 21 Oct 2014 18:42:50 -0000
X-Groupsio-MsgNum: 52582
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline

--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] postfix: remove overriding config config_dir=
ectory] On 14.10.16 (Thu 17:02) Kai Kang wrote:

> postfix 2.11.1 adds overriding config check. In postinstall script, it
> calls command newaliases to read configure file main.cf_2.0.
> config_directory is set in config main.cf_2.0, but it is an overriding
> config and warning shows when build an image:
>=20
> WARNING: log_check: There is a warn message in the logfile
> WARNING: log_check: Matched keyword: [warn]
> WARNING: log_check: newaliases: warning:
> /buildarea3/kkang/poky/qemuarm-build/tmp/work/qemuarm-poky-linux-gnueabi/=
core-
> image-minimal/1.0-r0/rootfs/etc/postfix/main.cf, line 27: overriding
> earlier entry: config_directory=3D/buildarea3/kkang/
> poky/qemuarm-build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-minimal=
/1.0-r0/rootfs/etc/postfix
>=20
> Remove config_directory setting in main.cf_2.0 to avoid this warning.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/files/main.cf_2.0 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 b/=
meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> index a128faa..bb31451 100644
> --- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> +++ b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> @@ -24,7 +24,7 @@ virtual_gid_maps =3D static:`grep vmail /etc/passwd | c=
ut -d ":" -f 4`
> =20
> =20
>  # General stuff here again
> -config_directory =3D /etc/postfix
> +#config_directory =3D /etc/postfix
>  sample_directory =3D /etc/postfix
>  queue_directory =3D /var/spool/postfix
>  mail_spool_directory =3D /var/spool/mail
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJURqknAAoJEEn8ffcsOfaWxFEIAKRCcUM/plTuqps5Q0/ZrfdL
iTXhYMFUGGh5udfJm4/E8BWkuKu1TELuM3O4lKr9SqYWw0AWXp2WeaiAtG237c8c
VyDKk6rYW5ZUQSQ1EVIXV4rnJPSyhwAJYn7HV6CoCdprY4vCoGDcoMzMq3HzfLGA
g2I8TOl/fLuUEY7gKil0E8MGg49sl2cBoIisQDXGOidc3gwRnskGpzD2lnYLZ/vH
9O3BGoKyI6ClD/3zwCG/cX87TynSbryhKoSxRQ4a4uQxti9BK4KRiEptetEtQ7VE
jZ5xd/MVVhxzffU4ZruxMcIqhozmzUdfjYugV8G+UEP8ty/Bt79Od3RxCT1k4Ns=
=FhlC
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
