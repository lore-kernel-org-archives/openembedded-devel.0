Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id B56CA6B7AD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 06:38:43 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so2010802eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 22:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mnxkYmWFB6UyefjZPFeSmQC/PaCwJ36ZWp/cgGk7vRc=;
	b=hCFdyPsHKNic/+itNyiUUtJ2KeXmctpkNwCNJLMw8LLIXqXTqoV51nyKdsdCRcjrZ1
	dDRD8M07p6/7WmYNInF0PPoRH6VJAvYHQm9T3BFKWxUG1qlXMQbnmB4kPd/F5DnYjjUP
	vnZPEq5sMJKL7xpvgIgfbNyKu4LcrE8ubCUPsW32LoCJ8PJtsn81D9tfaPPZTTVyQoNt
	mBdx4SX8QzhdaOrEQ1wFANn1uBO3vzYapxnuM2faPIcfDoDjbupYxoChV/cK9A2OVk/+
	OogtV6DttphAiZwZBB/ht9OnF4ui4CR+OrTY/n7yBbANJgWfQw04fvlyapqydK7QE3hF
	Lo9w==
X-Received: by 10.14.209.3 with SMTP id r3mr6609877eeo.85.1393051124049;
	Fri, 21 Feb 2014 22:38:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o43sm35185258eef.12.2014.02.21.22.38.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Feb 2014 22:38:42 -0800 (PST)
Date: Sat, 22 Feb 2014 07:39:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140222063919.GJ3854@jama>
References: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
	<1393047007-20507-2-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393047007-20507-2-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH v2 2/2] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Sat, 22 Feb 2014 06:38:46 -0000
X-Groupsio-MsgNum: 48264
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVh9lyqKgK19OcEf"
Content-Disposition: inline

--EVh9lyqKgK19OcEf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2014 at 09:30:07PM -0800, Andre McCurdy wrote:
> If qtbase is configured with openssl support then the
> qtwebkit browser example apps require CA certificates.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  recipes-qt/qt5/qt5.inc               | 2 ++
>  recipes-qt/qt5/qtbase.inc            | 2 +-
>  recipes-qt/qt5/qtwebkit-examples.inc | 1 +
>  3 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index 7e739c5..e2a1662 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -7,6 +7,8 @@ inherit qmake5
>  ICU =3D "icu "
>  ICU_powerpc =3D "pango"
> =20
> +PACKAGECONFIG_OPENSSL ?=3D "openssl"
> +
>  QT_MODULE ?=3D "${BPN}"
> =20
>  # we don't want conflicts with qt4
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 6a0149a..d805c47 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -47,7 +47,7 @@ PACKAGECONFIG ??=3D " \
>      udev \
>      evdev \
>      widgets \
> -    openssl \
> +    ${PACKAGECONFIG_OPENSSL} \
>      ${PACKAGECONFIG_GL} \
>      ${PACKAGECONFIG_FB} \
>      ${PACKAGECONFIG_X11} \
> diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebk=
it-examples.inc
> index 50c28cd..84f16a4 100644
> --- a/recipes-qt/qt5/qtwebkit-examples.inc
> +++ b/recipes-qt/qt5/qtwebkit-examples.inc
> @@ -10,3 +10,4 @@ SRC_URI +=3D " \
> =20
>  DEPENDS +=3D "qtwebkit"
>  RDEPENDS_${PN}-examples +=3D "qtwebkit-qmlplugins"
> +RDEPENDS_${PN}-examples +=3D "${@base_contains('PACKAGECONFIG_OPENSSL', =
'openssl', 'ca-certificates', '', d)}"

This should be checking PACKAGECONFIG variable (not
PACKAGECONFIG_OPENSSL).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVh9lyqKgK19OcEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMIRhcACgkQN1Ujt2V2gBzSnQCeLepMeE4Cmd+iUcwysG6jVQ72
Sw4AoLCofO0qhXQGIbZtVprGet7WewQY
=rlsw
-----END PGP SIGNATURE-----

--EVh9lyqKgK19OcEf--
