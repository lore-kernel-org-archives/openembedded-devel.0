Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4819B7F44C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 17:48:58 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id h7so4769150ybp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FPhvoNKf33Zbso4LjubQOjtncD15QLnn76XH2QUkAiA=;
	b=gzsFu5BNtArOQulbCaJk+gzYjaGqAl8VIX2R5p3mxG2TPcvTsBYA7oRGjqxxLbGIvW
	x0n6zcyQgzzmgiqfWsfgSLpXzut1pKF6yqFRbp5vmw7m2VUPJQzdc+dgQEYKAaIYRG9m
	ZTTt6JbyriZTlNrn8THWPFjMw41XOVodxVYag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FPhvoNKf33Zbso4LjubQOjtncD15QLnn76XH2QUkAiA=;
	b=QsmdM08f4vwS4cqvfFkb1jOqLGMgYufWHZwcdHTGCZcDtdqSdNsgI7Z2sXRchCLrzF
	w909JFJbi8MhtuCtirbMHu4r/igGbfPBv6HQqwCnhvw+kfPzESzppVbISGN0mfxNYXXM
	WeJXb3BsAammVj0mdfyp+BUcwioKsyMH2KHD+aG0L4dxhx5rZm6CSZy21GvOHXatmaTc
	NJ+LgfWJcM3j8wuk9iIgrLmYD00FSESdwrgeq5t2DNaBmvyFeJfmb6oWKF4xNikrqXxV
	xaWAtUI82KW1ihA8y7JsnhfS6UbDGbpmB7zm0LMxaplGAvf2JJhXVqLoG9x7QlJmEagK
	K2jg==
X-Gm-Message-State: APjAAAUroErgFGGjyd8zFk38GVJ1MncU5a6w2kByWHUXWcKluA4V6cWe
	sesxYeC+oaCQ0AcyjTCKG38oLA==
X-Google-Smtp-Source: APXvYqxQIVCckqmWe890DDYxllkwNTPbqibRVrGvt6W5q7LPVZ6k4J/R1llDWrxGyKjqyXOMvi6QyQ==
X-Received: by 2002:a25:bc4f:: with SMTP id d15mr23601162ybk.314.1571161738827;
	Tue, 15 Oct 2019 10:48:58 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id s1sm5406317ywa.67.2019.10.15.10.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Oct 2019 10:48:57 -0700 (PDT)
Date: Tue, 15 Oct 2019 13:48:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Message-ID: <20191015174854.GN16029@bill-the-cat>
References: <20191014222047.22306-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191014222047.22306-1-schnitzeltony@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] pipewire: initial add 0.2.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2019 17:48:58 -0000
X-Groupsio-MsgNum: 80141
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qj2xQFWTK7ooCBoA"
Content-Disposition: inline

--qj2xQFWTK7ooCBoA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 12:20:46AM +0200, Andreas M=FCller wrote:

> Have 0.2.4 in meta-qt5-extra as dependency for liri-shell. Soon it gets an
> optional dependency for mutter so move latest to meta-oe.
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com>
> ---
>  .../pipewire/pipewire_git.bb                  | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta-o=
e/recipes-multimedia/pipewire/pipewire_git.bb
> new file mode 100644
> index 000000000..9b9b64205
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Multimedia processing graphs"
> +HOMEPAGE =3D "http://pipewire.org/"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE;md5=3Dd8153c6e65986f862a0550ca74a3ed73 \
> +    file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +"
> +
> +inherit meson
> +
> +DEPENDS +=3D " \
> +    dbus \
> +    glib-2.0 \
> +    alsa-lib \
> +    v4l-utils \
> +    gstreamer1.0 \
> +    gstreamer1.0-plugins-base \
> +"
> +
> +SRC_URI =3D "git://github.com/PipeWire/pipewire.git"
> +PV =3D "0.2.7"
> +SRCREV =3D "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
> +S =3D "${WORKDIR}/git"
> +
> +
> +FILES_${PN} +=3D " \
> +    ${systemd_user_unitdir} \
> +    ${libdir}/pipewire-0.2 \
> +    ${libdir}/spa \
> +    ${libdir}/gstreamer-1.0 \
> +"

A few thoughts.  First, there's a lot of knobs that can be set, and it
might be a good idea to take a look at the recipe in AGL:
https://gerrit.automotivelinux.org/gerrit/gitweb?p=3DAGL/meta-agl-devel.git=
;a=3Dtree;f=3Dmeta-pipewire/recipes-multimedia/pipewire;h=3D59d7d7bae1b0c07=
2afbfe804857c0f7b4676766a;hb=3DHEAD

Second, it's worth keeping in mind for future updates that after v0.2.7
the license changed to MIT (and yes, I know LIC_FILES_CHKSUM will catch
this):
https://github.com/PipeWire/pipewire/blob/master/LICENSE

--=20
Tom

--qj2xQFWTK7ooCBoA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2mBoMACgkQh/n2NdMd
dlJ3jg//caaIszSMHK3qimsXNDIMfib4sNGxDX5YfKgf1ofmyebKQ5m9QEEpQeQg
xVia3VAKKueuSyxVk0GPAYSckJYXVSBXiNfqFU/vll4LjRBxP48VM6OnbRdHZYjY
vBvkNtHWvurRYIt8spYrY2KOF9fwFz79oha2xp7dfD01oVHaNx7C34HcijMbSw6T
wsNqXmV3i2Af2+qiV5Q+GAAqjNwvktzTB7S1cBKIrIcdEGZKphwcoyymoCxA8U4j
glKO7ilMKhfCEd9uAFKJSRsNc5ym+t/vFW8/hrKuNWWOOitw73Fu4joAyxNfO9Ct
rXBrv5ugU81vPGGOzQBQxgHfkRahaOK6c/IOUjlLYbaPYu3lYIPcy+uUzZN62NDh
wJO3/y8BtGs8LUWicgXWHSOt20m0W3FKhY8o98NIow2M4wIKc+d3+oqRuGWPTdmZ
8SPfWcLjM8zw14xVIsNqGvDCOFmxkGpvBojk+Iv1Hc4wMD4dz7+FYA7ESu245STJ
gthF2zUhc0rL/5GunkjlXt9f9FUDGpnSJNr7uzd+pTp6ALPp4Gj4wFWWvj0zYEFD
E/hCGjud8Se/hR/HlkcsV++jGAstYmIOxr2Uu5pZpUivr8KSPVjKwOB68f8DAmnM
rzpsrbcsmbiuEiBQt6+2Pg42sgqtv2pYV3k12FlFjbKp5HUnNcM=
=mpyw
-----END PGP SIGNATURE-----

--qj2xQFWTK7ooCBoA--
