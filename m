Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7513F60E68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:09:32 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so3840487eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CM9toSmOHH5b4S6PVfRp58MruANVOXYBKMKwJGyV9Uk=;
	b=E+0VL3Hb66vJFoB2k4G87wn/9RVTCiGfnm7OByDCJC2jQUO756cIomBuzytyb6nWmq
	/1Lbd1g21mjVQDoqSjrAUL6grlAqfs999Gre7AVuNwxWomozpD7hg9XzbT3u7qxYdNLi
	o7INH9M+o8xdK5yI1Iol/wdexjUei9bP5aimrpptFYKKBtsph5HdRFb67YOFNjssZREc
	AvcUjp6oPbBT0UBXXMZE6oyuHy0TrxrDJefdnQWK99Zf+HIwtgApa+W7uDIx3GXJ8rjY
	ba/QWy/n5UUMLt3I7dYq+YFT4pWB6J3vna90wU2JuVo+xdxvdFuvaspTwnPnR5aRhUBa
	kSVQ==
X-Received: by 10.15.21.2 with SMTP id c2mr156163eeu.78.1396001373662;
	Fri, 28 Mar 2014 03:09:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm10603884eeg.4.2014.03.28.03.09.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Mar 2014 03:09:32 -0700 (PDT)
Date: Fri, 28 Mar 2014 11:09:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140328100934.GA3714@jama>
References: <1395986585-15248-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1395986585-15248-1-git-send-email-b40290@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] daq: update to 2.0.2
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
X-List-Received-Date: Fri, 28 Mar 2014 10:09:33 -0000
X-Groupsio-MsgNum: 48879
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2014 at 02:03:05PM +0800, b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

There is patch like this already, but it still doesn't fix the build
issue.

> ---
>  meta-oe/recipes-connectivity/daq/{daq_2.0.1.bb =3D> daq_2.0.2.bb} | 4 ++=
--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/daq/{daq_2.0.1.bb =3D> daq_2.0.2.bb}=
 (73%)
>=20
> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/reci=
pes-connectivity/daq/daq_2.0.2.bb
> similarity index 73%
> rename from meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> rename to meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> index c12ccde..2675e2a 100644
> --- a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> @@ -10,7 +10,7 @@ DEPENDS =3D "libpcap libpcre "
>  SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
>              file://disable-run-test-program-while-cross-compiling.patch "
> =20
> -SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
> -SRC_URI[sha256sum] =3D "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d=
1ba1ea6ce518ec6d"
> +SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
> +SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51=
f605309beac269a8"
> =20
>  inherit autotools
> --=20
> 1.8.3.2
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM1Sl4ACgkQN1Ujt2V2gBzKngCdF2fexZKCL9Nsv6TkmtvFqfIA
HNUAnAi7uR5Y5VLjETeRBZRbzO3qfCWt
=FZVK
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
