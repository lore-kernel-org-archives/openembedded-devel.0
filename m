Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LrUxz-00027d-FC
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 12:25:14 +0200
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id B8397E080E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 12:22:07 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp6-g21.free.fr (Postfix) with ESMTP id C308BE08144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 12:22:04 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 6106A184007
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 12:22:08 +0200 (CEST)
Message-ID: <49DC7AD0.2010604@bolloretelecom.eu>
Date: Wed, 08 Apr 2009 12:22:08 +0200
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1239036448-9036-1-git-send-email-jeremy.laine@bolloretelecom.eu>
In-Reply-To: <1239036448-9036-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-SA-Exim-Connect-IP: 212.27.42.6
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] postgresql: use LDFLAGS for shared libs (fixes	QA error)
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
X-List-Received-Date: Wed, 08 Apr 2009 10:25:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Could a stable maintainer pleaser accept/reject this patch?

Cheers,
Jremy

Jeremy Lain=C3=A9 wrote:
> From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
>=20
>=20
> Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
> ---
>  recipes/postgresql/postgresql.inc      |    3 +++
>  recipes/postgresql/postgresql_8.1.4.bb |    2 +-
>  recipes/postgresql/postgresql_8.1.8.bb |    2 +-
>  recipes/postgresql/postgresql_8.2.4.bb |    2 +-
>  4 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/postgresql/postgresql.inc b/recipes/postgresql/pos=
tgresql.inc
> index da74516..4a11e2a 100644
> --- a/recipes/postgresql/postgresql.inc
> +++ b/recipes/postgresql/postgresql.inc
> @@ -11,6 +11,9 @@ SRC_URI =3D "ftp://ftp-archives.postgresql.org/pub/so=
urce/v${PV}/${P}.tar.bz2"
> =20
>  LEAD_SONAME =3D "libpq.so"
> =20
> +# LDFLAGS for shared libraries
> +export LDFLAGS_SL =3D "${LDFLAGS}"
> +
>  inherit autotools pkgconfig
> =20
>  do_compile_append() {
> diff --git a/recipes/postgresql/postgresql_8.1.4.bb b/recipes/postgresq=
l/postgresql_8.1.4.bb
> index cfb0162..42ba377 100644
> --- a/recipes/postgresql/postgresql_8.1.4.bb
> +++ b/recipes/postgresql/postgresql_8.1.4.bb
> @@ -1,3 +1,3 @@
>  require postgresql.inc
> =20
> -PR =3D "r3"
> +PR =3D "r4"
> diff --git a/recipes/postgresql/postgresql_8.1.8.bb b/recipes/postgresq=
l/postgresql_8.1.8.bb
> index cfb0162..42ba377 100644
> --- a/recipes/postgresql/postgresql_8.1.8.bb
> +++ b/recipes/postgresql/postgresql_8.1.8.bb
> @@ -1,3 +1,3 @@
>  require postgresql.inc
> =20
> -PR =3D "r3"
> +PR =3D "r4"
> diff --git a/recipes/postgresql/postgresql_8.2.4.bb b/recipes/postgresq=
l/postgresql_8.2.4.bb
> index 9b60b2b..7e2c370 100644
> --- a/recipes/postgresql/postgresql_8.2.4.bb
> +++ b/recipes/postgresql/postgresql_8.2.4.bb
> @@ -1,6 +1,6 @@
>  require postgresql.inc
> =20
> -PR =3D "r3"
> +PR =3D "r4"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "http://ftp.de.postgresql.org/mirror/postgresql/source/v${=
PV}/${P}.tar.bz2 \




