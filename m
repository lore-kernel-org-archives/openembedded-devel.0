Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UYa3t-0004bc-3G
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 May 2013 12:51:44 +0200
Received: by mail-ee0-f46.google.com with SMTP id b57so1115767eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 May 2013 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AQ5XgViE1eU1t3YgfkyC+NXdMvFlYvo3s/fOgaHA324=;
	b=nDi8bFK/mYotK9VKlnqGzTBfjMILfc8GTSOEsJXHkw1O2g3+hWQb4Hlj1Ddf8VCKDJ
	xMUJv/TTQKNlgsBA7u6NTjpIkZoPpWaUIK1ybjUuzgtGCtkCtRNXoN7Hkc6iQm7VNWtw
	DZQR1dEUHNjgxy9V5n7ilWZbF/bDuMyDqFFtHR0EXeNEJ23RnEFqFpSS3VZZppXwbUBO
	+KDhJSxD17qRMnraZZHs9RE8lDecILnxEBxv1StipQzXsH6Y5FvYPeFVbuZ/y5PKi6Lf
	AUdl58d2JZmktKqnHFADDcIFlEomVcnlhVbdPYMndMDLIlvV+BVZq1SJSD9yRUZyCW/2
	tgPQ==
X-Received: by 10.14.172.197 with SMTP id t45mr40426100eel.37.1367663612982;
	Sat, 04 May 2013 03:33:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i3sm21055441eev.1.2013.05.04.03.33.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 04 May 2013 03:33:32 -0700 (PDT)
Date: Sat, 4 May 2013 12:34:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130504103400.GA3180@jama>
References: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
	<1367660117-19572-6-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1367660117-19572-6-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH 5/5] vlc: fix configure failures with ENTERPRISE_DISTRO=1
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
X-List-Received-Date: Sat, 04 May 2013 10:52:09 -0000
X-Groupsio-MsgNum: 44594
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 04, 2013 at 10:35:17AM +0100, Paul Barker wrote:
> VLC will by default search for libmad, liba52 and other libraries and may=
 fail
> to configure if they are not available. We add the relevant options to
> EXTRA_OECONF to ensure that ENTERPRISE_DISTRO is respected.

It would be great to convert them to PACKAGECONFIG options, but it can
be in follow-up change.

> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index 059d7d2..531a018 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -65,6 +65,9 @@ EXTRA_OECONF =3D "\
>      ac_cv_path_MOC=3D${STAGING_BINDIR_NATIVE}/moc4 \
>      ac_cv_path_RCC=3D${STAGING_BINDIR_NATIVE}/rcc4 \
>      ac_cv_path_UIC=3D${STAGING_BINDIR_NATIVE}/uic4 \
> +    ${@base_conditional('ENTERPRISE_DISTRO', '1', \
> +	'--disable-mad --disable-id3tag --disable-a52 --disable-libmpeg2', \
> +	'--enable-mad --enable-id3tag --enable-a52 --enable-libmpeg2', d)} \
>  "
> =20
> =20
> --=20
> 1.8.2.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGE5BgACgkQN1Ujt2V2gBwt5ACeK8QRXsLqJ0ZpduGbllcao+KY
FnoAnjRsyvh8vCFHkJoQ4Z6QCC2boC70
=BgGx
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
