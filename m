Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFE56DDD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:20:20 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1207051eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 09:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3wnykVXHUlYV7QdPblVTjKAcGAEa0MyTj9iCm+8/bzI=;
	b=gqFkpzfwFBJptprdGJtcCU4gDYA5BnYBsDsbXtP5WxEsJwAxOLM2Si9TaUPeqeoLdb
	KAZQCoQFBDAksnojeq/ilU+y8yZu8MH1s36ZEXbZ+CttVUBbB6LCgY6YJjxz+faZIbe3
	Sj29dBgoLehDLZnR+8TVSQcMxCeRPJssiTac/sgbhdNCM6rlt0wo+22EmSSGiSeWhJSv
	FPbkrZNQwv/uz/Xgu5cR7muo8dlUc/HuObhroRfOa/xby8z5v3pJZntEDPueJ8pGXUB4
	8QWp6Z/0iaBnNC1GVL+RHCLvJl+CTq8TsHjyCHYedl5Mpl1PLCZsdpmWVcaYBM1YGLti
	Gh3Q==
X-Received: by 10.14.109.201 with SMTP id s49mr4223210eeg.88.1394040021026;
	Wed, 05 Mar 2014 09:20:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm11366928eeg.8.2014.03.05.09.20.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 09:20:19 -0800 (PST)
Date: Wed, 5 Mar 2014 18:20:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140305172026.GX26981@jama>
References: <cover.1394010806.git.ajlennon@dynamicdevices.co.uk>
	<ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>
MIME-Version: 1.0
In-Reply-To: <ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe] [PATCH 1/1] daq: Update from 2.0.1 to 2.0.2
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
X-List-Received-Date: Wed, 05 Mar 2014 17:20:21 -0000
X-Groupsio-MsgNum: 48522
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nf2vo/mUTtJdHW8B"
Content-Disposition: inline

--nf2vo/mUTtJdHW8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2014 at 03:49:13PM +0000, Alex J Lennon wrote:
> daq-2.0.1.tar.gz is missing from SRC_URI location. Presumably replaced wi=
th 2.02.

Sorry I haven't noticed it when replying on oe-core version, but can you
please remove 2.0.1 version in the same patch and sent with -M?

Do you know if it fixes do_install issue when building on host with
dash? It's reported regularly in:
http://www.openembedded.org/wiki/Bitbake_World_Status

Thanks!

>=20
> Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
> ---
>  meta-oe/recipes-connectivity/daq/daq_2.0.2.bb |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/reci=
pes-connectivity/daq/daq_2.0.2.bb
> new file mode 100644
> index 0000000..2675e2a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "The dump DAQ test the various inline mode features "
> +HOMEPAGE =3D "http://www.snort.org"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b21c4=
0e0"
> +
> +PARALLEL_MAKE =3D ""
> +
> +DEPENDS =3D "libpcap libpcre "
> +
> +SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> +            file://disable-run-test-program-while-cross-compiling.patch "
> +
> +SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
> +SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51=
f605309beac269a8"
> +
> +inherit autotools
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nf2vo/mUTtJdHW8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMXXNoACgkQN1Ujt2V2gBxyJQCdHTAkE285gAfWJI5NXrxICswU
xO8An2ouIBGEw8EfbhSTPFb/FqL1zQyW
=M/Qo
-----END PGP SIGNATURE-----

--nf2vo/mUTtJdHW8B--
