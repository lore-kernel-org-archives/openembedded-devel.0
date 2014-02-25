Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 09D096F364
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:17:31 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id r15so265122ead.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0QbGvePtYihbeqkGHBsW+rbCh226HkVb8LQZusQpFYs=;
	b=W52ohXE3uccLaUM23b0Eh/z2XuKe9Rk08zMLOtZ9kfNorY/qlgdhqHrrpnMAA5NgAQ
	bPI6YsSiARiq7hEUhGyDbjR2t6xEJrIk/ExeuWKlUY2m4b45lyTSWcAHQZ5O6kHMCc9d
	vBSQA3ApjPzuq5FXcZ0OLUprcdHm03bHQP2rVcs1V31jAd7YOy5MzzfbIwh/AXDJdIfw
	LleZR4eFK+nizRncCvrS/3jHsHSEY4TEnalGYv7TInCdRKc2UD2939B2kWR2foljOf60
	ImNQhQHdI7KcDa4mwQYMyEvwUAjqXBTchTwchhEKBOT/PlLFF4oYfTDK4N3gyVhkJuMK
	dH5w==
X-Received: by 10.14.3.72 with SMTP id 48mr1143287eeg.34.1393348651826;
	Tue, 25 Feb 2014 09:17:31 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm1104001eeu.0.2014.02.25.09.17.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 09:17:30 -0800 (PST)
Date: Tue, 25 Feb 2014 18:17:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140225171730.GP26981@jama>
References: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
	<1393345975-20556-3-git-send-email-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393345975-20556-3-git-send-email-ticotimo@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH 2/3] live555: update to 2013.04.30
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
X-List-Received-Date: Tue, 25 Feb 2014 17:17:32 -0000
X-Groupsio-MsgNum: 48348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uCozLMBrA/OCc/kF"
Content-Disposition: inline

--uCozLMBrA/OCc/kF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 08:32:54AM -0800, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-oe/recipes-multimedia/live555/live555_20130430.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/live555/live555_20130430.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/live555/live555_20130430.bb b/met=
a-oe/recipes-multimedia/live555/live555_20130430.bb
> new file mode 100644
> index 0000000..935550a
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/live555/live555_20130430.bb
> @@ -0,0 +1,9 @@
> +require live555.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D68ad62c64cc6c620126241fd429e6=
8fe"
> +
> +PR =3D "${INC_PR}.0"

Remove old recipe in the same commit and drop PR.

> +
> +SRC_URI[md5sum] =3D "95533d91bd196e42fd748076dc244b09"
> +SRC_URI[sha256sum] =3D "e549af608c9961d85cb647bc3b99804fec0fbaf5338c1b72=
d057558ae5cd2aea"
> +
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uCozLMBrA/OCc/kF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMM0CoACgkQN1Ujt2V2gBw8vwCeJpLMqKyi478ZlqXWiXxWN1Le
3HoAnjpdOWUioKjeJ2HVvTMzfIu3YFC8
=KqtN
-----END PGP SIGNATURE-----

--uCozLMBrA/OCc/kF--
