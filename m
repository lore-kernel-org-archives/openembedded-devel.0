Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2grU-0002Qk-3A
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 12:38:54 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so86846pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CijMEEiPRbjQeIdG+FMp8wb54WqxgOaCljysEPyviPQ=;
	b=R3v41YTqoUWiQXGl/IotoXwl8Ev4UY87cUv9gilO0yi/TEDM/EWHFh2H9lu87nUXA+
	Xegn67jgsltAR1X/nSB6289j80EDilqUPpNHyklbNZdHEnZ4BE2zUVRv96bWxylZOhTl
	obM1DoymyH6f5xiU929CzKNfYeUf2s0N5FzQL9dlomp0ekkpcW4/hAgjgv77yHZefPzG
	dnZsVw+A8S8Kh8joygUjDMAetDDDA6ldsiV52G4iHBrxbDZ4z8NN3eRfA6zPv+x2tKJf
	jmT7cIZ+XakWUsN+Vgzx4HtWtb6rLN8oeGMIZ9BD1dGT5KJ3/Z6Du1ZkW5TD7rRcr6PB
	IHxw==
X-Received: by 10.66.73.164 with SMTP id m4mr63644591pav.12.1360063381795;
	Tue, 05 Feb 2013 03:23:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l8sm28671954pax.9.2013.02.05.03.22.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 03:23:00 -0800 (PST)
Date: Tue, 5 Feb 2013 12:22:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205112251.GO3271@jama>
References: <1360062139-10894-1-git-send-email-andrei.gherzan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1360062139-10894-1-git-send-email-andrei.gherzan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [meta-oe][meta-systemd][PATCH] wpa-supplicant: Add bbappend to package systemd service in a -systemd package
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
X-List-Received-Date: Tue, 05 Feb 2013 11:38:57 -0000
X-Groupsio-MsgNum: 43002
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="37cJpJlYZwAfNbm5"
Content-Disposition: inline

--37cJpJlYZwAfNbm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2013 at 01:02:19PM +0200, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  .../wpa-supplicant/wpa-supplicant_2.0.bbappend     |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>  create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplic=
ant/wpa-supplicant_2.0.bbappend
>=20
> diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa=
-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-su=
pplicant/wpa-supplicant_2.0.bbappend
> new file mode 100644
> index 0000000..d286689
> --- /dev/null
> +++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant_2.0.bbappend
> @@ -0,0 +1,7 @@
> +PRINC :=3D "${@int(PRINC) + 1}"
> +
> +inherit systemd
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "wpa_supplicant.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"

oe-core wpa-supplicant now installs wpa_supplicant.service to PN, is
this SYSTEMD_PACKAGES correct now?

http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/043675=
=2Ehtml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--37cJpJlYZwAfNbm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEQ64sACgkQN1Ujt2V2gBwGAgCfQKNKcjwfBAiie7HiHvsarCSh
tb8An3DB5k2jyiG42EvTHD/m2H8iCVB1
=VkwM
-----END PGP SIGNATURE-----

--37cJpJlYZwAfNbm5--
