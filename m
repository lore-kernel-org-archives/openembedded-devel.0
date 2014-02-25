Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9B56ED65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:17:15 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c13so1218018eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eCgblVuOF+RMqzrJ7+TzWRM3vuFwoyZD8BIzaiVDujU=;
	b=ghrWKI2RwUK0Mr8zAAdAt4ez7JsmsPWhDGP2mzJ58L/7fe/dqVGn6gj4p5FXySyp8h
	MI6jQQmJJ3n4U0f9DoXGijfUg3w7E79M4SXKuCqalUsLy6IpVUSKIKGmIWraV/nLFeek
	6UAIeuGKLyqhbpXXM6Ig0GM1u8SAe+4Iqz1OVbhC59iRDrGXgZIP2CHhgSx7cYKufkcP
	j4YtHeFir+2kfCR7PpbP1n/taVOWNk6biVlxXNMb6hdpG0IQvamGNaANPxARHWsuSD+w
	xer7324lAFeiCHzNpJf7Nor457NnJCoRXxFu3tb8hyPoMT7nhqMg6gmqln1UdXmvd4T4
	yO9w==
X-Received: by 10.15.48.1 with SMTP id g1mr916254eew.51.1393348635844;
	Tue, 25 Feb 2014 09:17:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a2sm63514004eem.18.2014.02.25.09.17.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 09:17:14 -0800 (PST)
Date: Tue, 25 Feb 2014 18:17:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140225171710.GO26981@jama>
References: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
	<1393345975-20556-2-git-send-email-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393345975-20556-2-git-send-email-ticotimo@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH 1/3] libdvdcss: update to 1.2.13
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
X-List-Received-Date: Tue, 25 Feb 2014 17:17:19 -0000
X-Groupsio-MsgNum: 48347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w1A23YewkF9s+fLd"
Content-Disposition: inline

--w1A23YewkF9s+fLd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 08:32:53AM -0800, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb | 13 ++++++++=
+++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.=
13.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb b=
/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
> new file mode 100644
> index 0000000..42a704e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "libdvdcss is a simple library designed for accessing DV=
Ds like a block device without having to bother about the decryption."
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +PR =3D "r2"

Remove old recipe in the same commit and drop PR.

> +
> +SRC_URI =3D "http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-=
${PV}.tar.bz2"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D " --disable-doc "
> +
> +SRC_URI[md5sum] =3D "53cfc52a60a156763c425572e5179273"
> +SRC_URI[sha256sum] =3D "84f1bba6cfef1df87f774fceaefc8e73c4cda32e8f6700b2=
24ad0acb5511ba2c"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w1A23YewkF9s+fLd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMM0BYACgkQN1Ujt2V2gBwmOQCgjaF5tDvcsr+n1UTY8fW+ZyDk
ij4AoI4EvqLw+uV12vARrimXwcvLsWyR
=Fcf/
-----END PGP SIGNATURE-----

--w1A23YewkF9s+fLd--
