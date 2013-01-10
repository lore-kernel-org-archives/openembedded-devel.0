Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtG8Y-0001gh-Ct
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:17:49 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so290304pad.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FBiecRTl0cnFqeBjgaQ/BhTfi8Hrr8a8Tf+k9uEMylo=;
	b=Pfs8F+6FX2NiBoeQBgOjSio7t6Y/NqEyoRZ/qWIZrC0EHpciOoMqYfZBGdqjLWS7q6
	sr3z0iLfCGcQ+ZgjPnR41va+/ltQXdvDlBddpCMhOlhDEm+S4lYkH3AjZvQtSZ9vp9He
	ZJnw0oMxu75g3V5MO3RE/tuiGErENSQNq7CcIuR6kQ+lrja7EvGtVJeT9eZt4yaQvc5r
	xonJx77cmOXI+h0JmWKEmBa0vS+0G9NK3KgMUCeEW4CXGaBCyqoBfexnJs3mi//rASqB
	T059bcqcrUjGhFN+2Zm6yqLVyh+KffukSzLOIqb4iZfElIsEI1XboYbpXJrNejQPuShG
	NLug==
X-Received: by 10.68.234.167 with SMTP id uf7mr217079490pbc.20.1357815736516; 
	Thu, 10 Jan 2013 03:02:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t7sm865097pax.17.2013.01.10.03.02.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:02:15 -0800 (PST)
Date: Thu, 10 Jan 2013 12:02:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110110220.GV3722@jama.palm1.palmone.com>
References: <1357815181-1896-1-git-send-email-noor_ahsan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1357815181-1896-1-git-send-email-noor_ahsan@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH] autofs: Adds bbappend to add systemd support.
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
X-List-Received-Date: Thu, 10 Jan 2013 11:17:51 -0000
X-Groupsio-MsgNum: 42622
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ptMYGWplstB9CqWP"
Content-Disposition: inline

--ptMYGWplstB9CqWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 03:53:01PM +0500, Noor, Ahsan wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> * Removed systemd support from meta-networking recipe
> and added bbappend to add its support.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  .../recipes-daemons/autofs/autofs_5.0.7.bbappend   |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5=
=2E0.7.bbappend b/meta-systemd/meta-networking/recipes-daemons/autofs/autof=
s_5.0.7.bbappend
> new file mode 100644
> index 0000000..f095d1b
> --- /dev/null
> +++ b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb=
append
> @@ -0,0 +1,5 @@
> +inherit systemd
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "autofs.service"
> +

Both merged with added PRINC to this one.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ptMYGWplstB9CqWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDun7wACgkQN1Ujt2V2gBwo+wCeIL8LZqqxseJtPe3bYV11sdbH
YUcAnR3JzYorYP/dSxV+cZDzvkHOdamV
=6uOD
-----END PGP SIGNATURE-----

--ptMYGWplstB9CqWP--
