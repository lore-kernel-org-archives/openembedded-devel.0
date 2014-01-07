Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3106BF4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 13:08:41 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d49so60842eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2014 05:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8cpzWP/cMWVrQbVVZ8+2B2EF90j4YTV9v+j8IyLMLgo=;
	b=lfX9S8KGNWtjuzwnfVvDhhahTtmVNsImz/co8Bix+hbtgARuEwsWhniEnDvmw/IH/f
	o8Z3FOpbVOwVMDXmbYR4TTDRCVZkAQM3K7yUWNSfESxmyqOiMdNfmvVfezyaca//z4g8
	IU7mAAMl7ybq4HcD57oBs/x8+3pPKD5hGud54MkTkaHVfGb274AaXUmkvB76FZ5dlELW
	G6CkHLXH0pk+WBlMclaOUakLJKpSdV+Vpm1/N8z3lehZS4fYLDWngSj01oQLuoriVXHb
	b0OUXIJRO1NPkqYM3rLWLg2WiEGrb/YqzaCWs7WQnwznIzSatqsthALkOpUn9wHCpuMz
	HaiA==
X-Received: by 10.14.204.70 with SMTP id g46mr21470721eeo.84.1389100122012;
	Tue, 07 Jan 2014 05:08:42 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm179947676eew.18.2014.01.07.05.08.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 05:08:41 -0800 (PST)
Date: Tue, 7 Jan 2014 14:08:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140107130849.GP3709@jama>
References: <cover.1389098317.git.anders@chargestorm.se>
	<9df199bd032977929fa715af7710e4607a19f91e.1389098317.git.anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <9df199bd032977929fa715af7710e4607a19f91e.1389098317.git.anders@chargestorm.se>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-oe][PATCH 1/1] ktap: add configs for elfutils and ffi
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
X-List-Received-Date: Tue, 07 Jan 2014 13:08:42 -0000
X-Groupsio-MsgNum: 47628
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7a4X6VOqfbl9xMrG"
Content-Disposition: inline

--7a4X6VOqfbl9xMrG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 01:39:49PM +0100, Anders Darander wrote:
> libelf (elfutils) is required for resolving symbols in DSO and for sdt (t=
aken
> from ktap docs). The earlier v0.4 recipe built ktap against libelf if it =
was
> found, thus enable it per default.
>=20
> FFI needs to be enabled for both userspace and kernel module. Currently, =
it is
> only supported for x86_64 (enforced when building ktap-module).
>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb |  5 ++++-
>  meta-oe/recipes-kernel/ktap/ktap.inc           |  2 ++
>  meta-oe/recipes-kernel/ktap/ktap_0.4.bb        | 12 +++++++++++-
>  3 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb b/meta-oe/rec=
ipes-kernel/ktap/ktap-module_0.4.bb
> index 12167ea..ce6885c 100644
> --- a/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
> +++ b/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
> @@ -6,8 +6,11 @@ DESCRIPTION =3D "KTAP is a scripting dynamic tracing too=
l for Linux"
> =20
>  inherit module
> =20
> +# Available package configs: ffi (only supported on x86_64)
> +PACKAGECONFIG ?=3D ""
> +
>  # Only build the module
> -MAKE_TARGETS =3D "mod"
> +MAKE_TARGETS =3D "${@base_contains('PACKAGECONFIG', 'ffi', 'FFI=3D1', ''=
, d)} mod"
> =20
>  # Kernel module packages MUST begin with 'kernel-module-', otherwise
>  # multilib image generation can fail.
> diff --git a/meta-oe/recipes-kernel/ktap/ktap.inc b/meta-oe/recipes-kerne=
l/ktap/ktap.inc
> index 7e60453..93a4e2c 100644
> --- a/meta-oe/recipes-kernel/ktap/ktap.inc
> +++ b/meta-oe/recipes-kernel/ktap/ktap.inc
> @@ -9,3 +9,5 @@ SRC_URI =3D "git://github.com/ktap/ktap.git"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> +# Package config is abused as a general compile time configuration tool.
> +PACKAGECONFIG[ffi] =3D ""
> diff --git a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb b/meta-oe/recipes-ke=
rnel/ktap/ktap_0.4.bb
> index f5dd62f..a703aec 100644
> --- a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
> +++ b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
> @@ -5,8 +5,18 @@ require ktap.inc
>  SUMMARY =3D "KTAP is a scripting dynamic tracing tool for Linux"
>  DEPENDS =3D "ktap-module"
> =20
> +#Available package configs:
> +# libelf - needed to resolve symbols in DSO and for sdt
> +# ffi    - only supports x86_64 for now!. Needs to be enabled for ktap-m=
odule too.
> +PACKAGECONFIG ?=3D "libelf"
> +
> +PACKAGECONFIG[libelf] =3D ",,elfutils"
> +PACKAGECONFIG[ffi] =3D ""

This line is already in ktap.inc

Otherwise looks good, I like deterministic shiny things.

> +
>  # Only build the userspace app
> -EXTRA_OEMAKE =3D "ktap"
> +EXTRA_OEMAKE =3D "${@base_contains('PACKAGECONFIG', 'libelf', '', 'NO_LI=
BELF=3D1', d)} \
> +             ${@base_contains('PACKAGECONFIG', 'ffi', 'FFI=3D1', '', d)}=
 \
> +             ktap"
> =20
>  do_install() {
>      install -d ${D}${bindir}
> --=20
> 1.8.5.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7a4X6VOqfbl9xMrG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLL/GEACgkQN1Ujt2V2gBxN9gCcDAya3056HigZ9fJKpZvUznYJ
jRUAoIWlDmwJ3nmDHtQYvAapAYUHxwcj
=X2uk
-----END PGP SIGNATURE-----

--7a4X6VOqfbl9xMrG--
