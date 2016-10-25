Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 689CD7199F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:27:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c78so1158236wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1z+VEoVH3c3oTtooZmoTjkVjbpIPS+EawT5Mo1lNg7g=;
	b=wCAcEMA2NiAXzsyTc0bQXZoqCbBdVIuLfCKgsaqbjA6moo3322+SnsEyLyccY8PIEu
	qeqMsBjGs+Ymzo7AObRWKYiG5deMVbdvsvbEZqiUXNNJ7GHRY6+kZeL6R5xi5meOP+aO
	nCtb7zq/NJJwKtfqlFLefrfjy/PGPjZ6SXvDmY+F5oF1hYieymhkn33mYHS0X7tru6GO
	2cUjE8+P8PNvT0W1Z9eZ8ptXYnF13rnBPn7G6Q480PBXtp7O2EUqDNvw+xgipyJOb5vi
	8wMWyBwni+j+CXI6RRXf8kujWtPDDoPtMVKX7AUawTMWCgfFDFVwbC/SVq8vBJyz6cgS
	/ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1z+VEoVH3c3oTtooZmoTjkVjbpIPS+EawT5Mo1lNg7g=;
	b=ACvR2+HSToPXUwZnG2+iVO/2/Gu50PJbwjmiMrrRbxqG6Lpjkj25LennRm+2D6WJK5
	0L3QlNLwHwpcGlEND/8k5c56XR3EKv8quzo/SmO3/Gh3gE+O1NxTY1orjjVyC0/hpOXK
	7Na8Fwbo7uR5nN53j2VfYedk+lP7dRILCTmvQzVXa0jzgyzwkW6RU+AJn0DYvNm8u8Me
	QVDcC0N6CMoIWiMX5/fR8G/UWn4AsmF1mL+fPZ5OikmUW4HaLWMXBY2ghqTkLLlUwUl+
	dKgOZc+1o9gP1yyKMLZIozaUip1SaMpHkSGN6zat+EzyPMJ4738oQduCcK8T0k9KB7Z5
	l7Tw==
X-Gm-Message-State: ABUngvc3prPCqIt4pTFNM0WKK2zX259gzjLdFxwvkmIQSXPVpAltrPGyVdPN/7iOrrB6TQ==
X-Received: by 10.28.37.68 with SMTP id l65mr3102785wml.59.1477402080844;
	Tue, 25 Oct 2016 06:28:00 -0700 (PDT)
Received: from localhost (ip-89-176-50-133.net.upcbroadband.cz.
	[89.176.50.133]) by smtp.gmail.com with ESMTPSA id
	jq10sm23039108wjb.46.2016.10.25.06.27.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Oct 2016 06:27:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Oct 2016 15:27:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161025132759.GA2911@jama>
References: <1476836925-14631-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1476836925-14631-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: akuster@mvista.com
Subject: Re: [meta-networking][PATCH] wireshark: install missing header files
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
X-List-Received-Date: Tue, 25 Oct 2016 13:28:01 -0000
X-Groupsio-MsgNum: 63594
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 05:28:45PM -0700, Armin Kuster wrote:
> Wireshark does not install header files. add install_append
> Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer need=
ed
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-support/wireshark/wireshark_2.2.1.bb   | 22 ++++++++++++++++=
+++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb=
 b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> index a5fb7f6..f7d7927 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> @@ -43,7 +43,23 @@ PACKAGECONFIG[c-ares] =3D "--with-c-ares=3Dyes, --with=
-c-ares=3Dno, c-ares"
> =20
>  EXTRA_OECONF +=3D "--with-qt=3Dno --enable-tshark --enable-rawshark"
> =20
> -ALLOW_EMPTY_${PN} =3D "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +# Currently wireshark does not install header files
> +do_install_append () {
> =20
> -FILES_${PN} +=3D "${datadir}*"

Why was this removed?

Now there is couple QA errors:


wireshark-2.2.1: wireshark: Files/directories were installed but not shippe=
d in any package:
  /usr/share/mime
  /usr/share/appdata
  /usr/share/icons
  /usr/share/mime/packages
  /usr/share/mime/packages/wireshark.xml
  /usr/share/appdata/wireshark.appdata.xml
  /usr/share/icons/hicolor
  /usr/share/icons/hicolor/16x16
  /usr/share/icons/hicolor/24x24
  /usr/share/icons/hicolor/32x32
  /usr/share/icons/hicolor/48x48
  /usr/share/icons/hicolor/64x64
  /usr/share/icons/hicolor/128x128
  /usr/share/icons/hicolor/256x256
  /usr/share/icons/hicolor/scalable
  /usr/share/icons/hicolor/16x16/apps
  /usr/share/icons/hicolor/16x16/mimetypes
  /usr/share/icons/hicolor/16x16/apps/wireshark.png
  /usr/share/icons/hicolor/16x16/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/24x24/apps
  /usr/share/icons/hicolor/24x24/mimetypes
  /usr/share/icons/hicolor/24x24/apps/wireshark.png
  /usr/share/icons/hicolor/24x24/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/32x32/apps
  /usr/share/icons/hicolor/32x32/mimetypes
  /usr/share/icons/hicolor/32x32/apps/wireshark.png
  /usr/share/icons/hicolor/32x32/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/48x48/apps
  /usr/share/icons/hicolor/48x48/mimetypes
  /usr/share/icons/hicolor/48x48/apps/wireshark.png
  /usr/share/icons/hicolor/48x48/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/64x64/apps
  /usr/share/icons/hicolor/64x64/mimetypes
  /usr/share/icons/hicolor/64x64/apps/wireshark.png
  /usr/share/icons/hicolor/64x64/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/128x128/apps
  /usr/share/icons/hicolor/128x128/mimetypes
  /usr/share/icons/hicolor/128x128/apps/wireshark.png
  /usr/share/icons/hicolor/128x128/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/256x256/apps
  /usr/share/icons/hicolor/256x256/mimetypes
  /usr/share/icons/hicolor/256x256/apps/wireshark.png
  /usr/share/icons/hicolor/256x256/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/scalable/apps
  /usr/share/icons/hicolor/scalable/apps/wireshark.svg
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
wireshark: 45 installed and not shipped files. [installed-vs-shipped]


> +	install -d ${D}/${includedir}/${BPN}
> +	install -d ${D}/${includedir}/${BPN}/epan
> +	install -d ${D}/${includedir}/${BPN}/epan/crypt
> +	install -d ${D}/${includedir}/${BPN}/epan/dfilter
> +	install -d ${D}/${includedir}/${BPN}/epan/dissectors
> +	install -d ${D}/${includedir}/${BPN}/epan/ftypes
> +	install -d ${D}/${includedir}/${BPN}/epan/wmem
> +
> +	install config.h ${D}/${includedir}/${BPN}
> +	install ${S}/register.h ${D}/${includedir}/${BPN}
> +	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
> +	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
> +	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
> +	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/diss=
ectors
> +	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
> +	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
> +}
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgPXdYACgkQN1Ujt2V2gBxdsgCffSbUJpDitSKjhs4lWHlUNcSc
R/sAn2N2S7wf/Us6lSIDJGtLxpShXPdm
=pIik
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
