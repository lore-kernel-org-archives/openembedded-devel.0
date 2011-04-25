Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QEQnR-0003Xl-60
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 20:46:09 +0200
Received: by bwz5 with SMTP id 5so2042648bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=RfNkkbcXXTXdgMcN8JMkFxpOzna53CC6zM7hiAUhnD4=;
	b=Q5ypkUsMxZ3HuKAX4qg9wWjAy2NV50EwRUjcm+vVaKwhoC9CTwW+OFdtg3l5m/ldN8
	C8zZUzK7EY48XK35vKZAeBYZfbuOai4dVYuxXWr3s5nkS6YdwmMwA1s5j6KLmVFFxXT1
	/Q0p1dJo2X+3bM5BD6iMSOp5gGoEwMz6gAxc8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Qgenr9GgQxEIR9p0LlEkOluu7sTagps+BKc3tyxF3T/pZvk1oTO8UApf7ecixMbOAh
	BbCGYEo1doG+z1kSVnLFXKTV7cbCwwWWdThqSTgx7VAZvDHkkbpXA/pEO/NPC/MdyQpx
	YBEk+rMPjBBuFu/n3GALLYWs+rH5s56AdaxBA=
Received: by 10.204.39.68 with SMTP id f4mr3758744bke.17.1303757019645;
	Mon, 25 Apr 2011 11:43:39 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q18sm3408466bka.15.2011.04.25.11.43.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:43:38 -0700 (PDT)
Date: Mon, 25 Apr 2011 20:43:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110425184331.GA3376@jama.jama.net>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
	<1303756273-22385-4-git-send-email-tom_rini@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1303756273-22385-4-git-send-email-tom_rini@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH 3/3] bluez4: Add 4.91 and make it default for Angstrom
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
X-List-Received-Date: Mon, 25 Apr 2011 18:46:09 -0000
X-Groupsio-MsgNum: 31446
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2011 at 11:31:13AM -0700, Tom Rini wrote:
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  recipes/bluez/bluez4_4.91.bb |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/bluez/bluez4_4.91.bb
>=20
> diff --git a/recipes/bluez/bluez4_4.91.bb b/recipes/bluez/bluez4_4.91.bb
> new file mode 100644
> index 0000000..16f06d5
> --- /dev/null
> +++ b/recipes/bluez/bluez4_4.91.bb
> @@ -0,0 +1,18 @@
> +require bluez4.inc
> +
> +SRC_URI[md5sum] =3D "3059b7ef5168c84cd0c6a67034ce79f9"
> +SRC_URI[sha256sum] =3D "11e9279e2669db996afd464b96d2c68f41f157f6eb9b8842=
a0bbcad8a4eac18d"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE_angstrom =3D "1"

please make it default for shr too, we're using bluez4_4.91 now from=20
meta-oe and it works ok, so we can keep it in sync, thanks

> +
> +DEPENDS +=3D "libsndfile1"
> +
> +PR =3D "${INC_PR}.0"
> +
> +# Not all distros have a recent enough udev
> +BTUDEV =3D " --disable-udevrules"
> +BTUDEV_angstrom =3D " --enable-udevrules"
> +BTUDEV_shr =3D " --enable-udevrules"
> +
> +EXTRA_OECONF +=3D "${BTUDEV}"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk21wNMACgkQN1Ujt2V2gBxpbACfeyVD5PMKPSC6z9ZLkQHnbCEC
ogQAn3AVzW9B4C0DiZxr+H9C94TxUm6K
=Ee/o
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
