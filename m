Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0ECA275A38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 10:25:24 +0000 (UTC)
Received: by wieq12 with SMTP id q12so24844324wie.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k4f4wVKZKxjfETbF/oxjjL0HF5y6E6I8uwTF7fbGsIc=;
	b=yjTaIs/LBjUvYkL2QNRnT+zOECWeKucXqclaUV/duTTB+B3NBaqKiAgE9kUQLvmCR4
	K3xMvOFYW0c+w5FGP/oXh3E7ovp0n6KBl3g+qCovy49w6KyZIbxFbL/K6D3eA0Tr33YP
	Cvl+MKEkH8j96z0UZd/Bv02P2aNNIeTJvGl6jO3SK1/QdtFhEoz9iuOSg9d8sXSXqmpf
	nHIvLtIJrXW+h4RMvlkemuoEPINoVPkrMbOxaOAMJ3ldPo5iV9SfBCjjGqSby7iDfV/K
	LM8faQdHUMeKywDyGyjcu0xFt9BPG+WaPDQ6E4RsXU8lQvcI9om+BIzIWgSixN14iUIS
	mLzw==
X-Received: by 10.194.118.5 with SMTP id ki5mr34772190wjb.94.1444731924716;
	Tue, 13 Oct 2015 03:25:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id uq5sm2791504wjc.3.2015.10.13.03.25.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 03:25:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Oct 2015 12:25:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151013102528.GB2396@jama>
References: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
	<1443016567-15788-5-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1443016567-15788-5-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 5/5] opencore-amr: add new recipe
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
X-List-Received-Date: Tue, 13 Oct 2015 10:25:30 -0000
X-Groupsio-MsgNum: 57792
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 03:56:07PM +0200, Carlos Rafael Giani wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

This breaks gst-plugins-ugly:
http://errors.yoctoproject.org/Errors/Details/20432/

Please try to add:
http://lists.freedesktop.org/archives/gstreamer-commits/2012-March/060287.h=
tml
to gst-plugins-ugly if we don't have that already or check why it didn't
work.

> ---
>  .../recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb   | 13 +++++++=
++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/opencore-amr/openc=
ore-amr_0.1.3.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr=
_0.1.3.bb b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.=
1.3.bb
> new file mode 100644
> index 0000000..ab5813e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.=
bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "OpenCORE Adaptive Multi Rate (AMR) speech codec library=
 implementation"
> +HOMEPAGE =3D "http://sourceforge.net/projects/opencore-amr/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "Apache-2.0"
> +LICENSE_FLAGS =3D "commercial"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddd2c2486aca02190153cf399e508c=
7e7"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
> +SRC_URI[md5sum] =3D "09d2c5dfb43a9f6e9fec8b1ae678e725"
> +SRC_URI[sha256sum] =3D "106bf811c1f36444d7671d8fd2589f8b2e0cca58a2c764da=
62ffc4a070595385"
> +
> +inherit autotools
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYc3BgACgkQN1Ujt2V2gBzOhQCfTh0ewZyqm0PNqVJAllzdhS6D
GPIAn29eWYGxSWG44pbtzFICk5ezxYZZ
=w12G
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
