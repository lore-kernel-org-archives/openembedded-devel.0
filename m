Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RvWYT-0007IG-3A
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 17:09:05 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so507334eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 08:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xx6HuHb2c4PHP55vLxVJYOPMQoZ2GD3SJBR5Y+76qWk=;
	b=kCGrAk1J8gHFwjzvREFQegvInkR7P3PRej/Im0LZ0wHXu5un+DdIL9sri+p/vAfBrT
	cWOyBFo5Xo+maS2YZqBXFEq+EDgNyLdDQT88TRBV9KNRqoczVxVAx6f2pssWjOjdRaOr
	CwXNrTzEWaOqLkfnu+vmBhf0zlKZbOofAmKTc=
Received: by 10.213.32.67 with SMTP id b3mr479259ebd.75.1328803262620;
	Thu, 09 Feb 2012 08:01:02 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm11063103eei.3.2012.02.09.08.01.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 08:01:01 -0800 (PST)
Date: Thu, 9 Feb 2012 17:01:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120209160100.GD10322@jama.jama.net>
References: <cover.1328648257.git.otavio@ossystems.com.br>
	<883623185202434d1d83aebc211fffae3c05e800.1328648257.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <883623185202434d1d83aebc211fffae3c05e800.1328648257.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe 1/3] Revert "systemd.bbclass: depends on systemd"
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
X-List-Received-Date: Thu, 09 Feb 2012 16:09:05 -0000
X-Groupsio-MsgNum: 37050
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline

--bajzpZikUji1w+G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2012 at 08:58:22PM +0000, Otavio Salvador wrote:
> This reverts commit c029d4a268de1ac7076fbeb9e337e96fdb1b226d.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta-oe/classes/systemd.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bb=
class
> index 094a12c..2ca7bfc 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS_append =3D " systemd systemd-systemctl-native"
> +DEPENDS_append =3D " systemd-systemctl-native"
> =20
>  systemd_postinst() {
>  OPTS=3D""
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8z7bwACgkQN1Ujt2V2gByt7wCcCA0cClqmflwFwcAR0vZCAbIu
vFYAoJtacxghSb9oYnSSrnIcLzl2wN5Z
=43z1
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
