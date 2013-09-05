Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id AD41960F1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:09:23 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0E20AA6317;
	Thu,  5 Sep 2013 14:09:18 +0200 (CEST)
Date: Thu, 5 Sep 2013 14:09:17 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: javier.viguera@digi.com
Message-ID: <20130905140917.48edcb06@e6520eb>
In-Reply-To: <1378382068-24795-1-git-send-email-javier.viguera@digi.com>
References: <1378382068-24795-1-git-send-email-javier.viguera@digi.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver] cherokee: fix SRC_URI
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
X-List-Received-Date: Thu, 05 Sep 2013 12:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Le Thu, 5 Sep 2013 13:54:28 +0200,
Javier Viguera <javier.viguera@digi.com> a =E9crit :

> The package is no longer available in the official cherokee site,
> so download it from a mirror.
>=20
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>=20
> Notes:
>     To be cherry-picked to Dylan as well.
>=20
>  meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/m=
eta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> index 265e24e..4b2d68d 100644
> --- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> @@ -9,7 +9,7 @@ PR =3D "r9"
> =20
>  DEPENDS =3D "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', =
'pam', 'libpam', '', d)}"
> =20
> -SRC_URI =3D "http://www.cherokee-project.com/download/1.2/${PV}/cherokee=
-${PV}.tar.gz \
> +SRC_URI =3D "ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${PV}.t=
ar.gz \
>             file://cherokee.init \
>             file://cherokee.service \
>  "

in fact the correct URL is now :
https://github.com/cherokee/webserver/archive/v1.2.98.tar.gz
so I think you can switch to :
+SRC_URI =3D "https://github.com/cherokee/webserver/archive/v${PV}.tar.gz

Eric

