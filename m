Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id E9DCC60D27
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:37:54 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id d17so5863705eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wbGwMbqtj+Dx4lvQqc0y963UAGhszn9sBKV1pe1S7Uo=;
	b=eETFBIyMrMicqclyg0T7D/lXiybKg6LJZOV0S6aXOLQd/+/SVqQLO950Ee8giMfgbu
	auEwimEfvn9QE0KffKInD4tL29mOTYxEEDK9usVUzWVpinRmK49dQ9Ss4ZJE3RAbVBj9
	y4l03Vy+nYa6ucfiA5NLnrcTQwaTjdqywLyNdQhTlvXOiyv7nRNjNQQytmJlgYNyljeF
	EdjTp6M7xO5RhF3mzYoKN+yUE3fp/qFjJ8xWpKU0AWVWlQHaIg4VY2mvw96awTDSupU9
	fBlvA7OMRilwOPgoBEKE0hvKXEmTvsVtsaeGCIQVpP6iYoRd3e4xJw1HJIDoLtxcZ6IS
	vVXA==
X-Received: by 10.15.77.134 with SMTP id p6mr64632968eey.0.1388579875725;
	Wed, 01 Jan 2014 04:37:55 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	n1sm126730190eep.20.2014.01.01.04.37.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:37:54 -0800 (PST)
Date: Wed, 1 Jan 2014 13:37:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140101123757.GD11840@jama>
References: <1388455711-20416-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1388455711-20416-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe] tearofsteel-1080p: Add recipe
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
X-List-Received-Date: Wed, 01 Jan 2014 12:37:56 -0000
X-Groupsio-MsgNum: 47549
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2013 at 12:08:31AM -0200, Otavio Salvador wrote:
> This adds the Tears of Steel movie in 1080P as a sample content for
> easy addition in images.

ERROR: No checksum specified for /home/jenkins/oe/shr-core-branches/shr-cor=
e/downloads/ToS-4k-1920.mov, please add at least one to the recipe:
SRC_URI[md5sum] =3D "e3fee55b1779c553e37b1d3988e6fad6"
SRC_URI[sha256sum] =3D "bd2b5bc6c16d4085034f47ef7e4b3938afe86b4eec4ac3cf268=
5367d3b0b23b0"
ERROR: Function failed: Fetcher failure for URL: 'http://ftp.nluug.nl/pub/g=
raphics/blender/demo/movies/ToS/ToS-4k-1920.mov'. Missing SRC_URI checksum

I'll fix, but please be more careful next time.

>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../sample-content/tearsofsteel-1080p.bb                   | 14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/sample-content/tea=
rsofsteel-1080p.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofste=
el-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofstee=
l-1080p.bb
> new file mode 100644
> index 0000000..86e79f3
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080=
p.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "Tears of Steel movie - 1080P"
> +LICENSE =3D "CC-BY-3.0"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/CC-B=
Y-3.0;md5=3Ddfa02b5755629022e267f10b9c0a2ab7"
> +
> +SRC_URI =3D "http://ftp.nluug.nl/pub/graphics/blender/demo/movies/ToS/To=
S-4k-1920.mov"
> +
> +inherit allarch
> +
> +do_install() {
> +	install -d ${D}${datadir}/movies
> +	install -m 0644 ${WORKDIR}/ToS-4k-1920.mov ${D}${datadir}/movies/
> +}
> +
> +FILES_${PN} +=3D "${datadir}/movies"
> --=20
> 1.8.5.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLEDCUACgkQN1Ujt2V2gBxxAgCfTKJ0+f7JHV4IdIvonF5OX2k2
eQsAnAwGk+7i5frqVDwV7SlMmCie7mRt
=WKKk
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
