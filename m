Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TupjO-00089P-30
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 20:30:08 +0100
Received: by mail-pb0-f54.google.com with SMTP id wz12so2342636pbc.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zOJ1BjqxyqvLIv6o8AjooVbsDOby3s6EdRxrEQpBHW4=;
	b=d+km6Bcg2VzYw3J5A2VkUeS3J6Xy/WHTDAgQSMsh1peZxAhNcND9ewbMTwJKQ76sah
	EiWEVFeDm07cOfjPT4sXcbIxyK7CN9csBlpPUs7QgKa2Much2KWbNMhlQF4a4Vr/n55f
	lq4bvoldnm/rfu8Ikg+79VQDvphfgMt+MNCAwhQJ6pK2+KsoMERg3QiO2AwKxvISGYG9
	W/GBbAKsX9HDUnWOuKTwR8bEkxV5+gdShWt5Xns/qsnxQfjUJDmwbPNqsDV+kYRtD8Tr
	dSaXPhkfJMotXG9apP9lQ5jwfyf14YytTlEoGtVQhZaIDfMYTa4R8tZ17fenzs1Rb602
	w+4w==
X-Received: by 10.68.190.227 with SMTP id gt3mr259308467pbc.5.1358190882180;
	Mon, 14 Jan 2013 11:14:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ai8sm8664244pbd.14.2013.01.14.11.14.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 11:14:41 -0800 (PST)
Date: Mon, 14 Jan 2013 20:14:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130114191440.GH2992@jama>
References: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [meta-oe][meta-systemd][PATCH 1/4] bluez4: Package systemd service
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
X-List-Received-Date: Mon, 14 Jan 2013 19:30:11 -0000
X-List-Received-Date: Mon, 14 Jan 2013 19:30:11 -0000
X-Groupsio-MsgNum: 42696
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Content-Disposition: inline

--lrvsYIebpInmECXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2013 at 08:42:53PM +0200, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  .../bluez/bluez4_4.101.bbappend                    |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/bluez/bluez=
4_4.101.bbappend

http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/043452=
=2Ehtml

>=20
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101=
=2Ebbappend b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.=
bbappend
> new file mode 100644
> index 0000000..8945a6d
> --- /dev/null
> +++ b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd
> @@ -0,0 +1,9 @@
> +PRINC :=3D "${@int(PRINC) + 1}"
> +
> +inherit systemd
> +
> +EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "bluetooth.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD0WSAACgkQN1Ujt2V2gBweCACcDA9xmyIUluz9ZAg4wPOSp5rM
PgEAn2DG0qBpfDYSzgr3To8zPGfxd4N/
=4ya4
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--
