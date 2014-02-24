Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6E25260144
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 18:28:16 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id t10so108839eei.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iUsyqw6p4d/The+jICLNn7XUT9ATSqSpumrekOyl8UE=;
	b=KtYQBedXRNDu5yoG1xL6wfcl1S6iXT6CmJyPIKRi0Q1qshtEQh9iFnIR3/vb+aJw0G
	VvBQF526ohMGIlLt+vVZkFG1BvFkiKcqYF1W8d5N7mCpnJMMhWwEoNIly27nrRDMoOdz
	LJqMyEBXwEsTJgTX5o6x5PqsasjuI0HrzLOKdx1CM7sGcZfLiMid7MaxhOMLjTKsTMVD
	X7EpGkBzPShYlsDGchEpBhvTSF10q55iFj2kPjQFklvj1V2glceuFYHZg8spA5zqL4a3
	SAyhWqi2Ku3E/HF5UCQXo28BA5Q6m4i9DLXTVHSpq05nOqwGnWixWqWDvM3IXCWbcuY+
	2H2A==
X-Received: by 10.14.199.137 with SMTP id x9mr5999895een.3.1393266497637;
	Mon, 24 Feb 2014 10:28:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm66666857een.7.2014.02.24.10.28.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 10:28:16 -0800 (PST)
Date: Mon, 24 Feb 2014 19:28:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140224182814.GK26981@jama>
References: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
	<1393047007-20507-2-git-send-email-armccurdy@gmail.com>
	<20140222063919.GJ3854@jama> <20140222082502.GL3854@jama>
	<CAP71WjzXR=qCBBqHLK1UtvtwJ4Cr8wy60tjvmsHsB5ajr4HU0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjzXR=qCBBqHLK1UtvtwJ4Cr8wy60tjvmsHsB5ajr4HU0Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH v2 2/2] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Mon, 24 Feb 2014 18:28:17 -0000
X-Groupsio-MsgNum: 48316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgLLobvf7eP6VP5c"
Content-Disposition: inline

--bgLLobvf7eP6VP5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 07:06:29PM +0100, Nicolas Dechesne wrote:
> On Sat, Feb 22, 2014 at 9:25 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Please ignore my comment, I haven't noticed that you've added
> > PACKAGECONFIG_OPENSSL to qt5.inc and it's actually "from qtbase's
> > PACKAGECONFIG".
> >
> > I've added comment in qtbase.inc and integrated this to master-next.
>=20
> hmm. still i don't get it. openssl can be added to PACKAGECONFIG
> without being added in PACKAGECONFIG_OPENSSL, right? so why don't we
> test is openssl is in PACKAGECONFIG?
>=20
> Am I missing anything?

because qtwebkit-examples is checking PACKAGECONFIG from qtbase recipe

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bgLLobvf7eP6VP5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLjz4ACgkQN1Ujt2V2gBxocwCdGi9QkTcVg27PXNknW/ZoffBa
E3IAn2cbtH4h5YlRQeMi6teGZ799hCxX
=o89S
-----END PGP SIGNATURE-----

--bgLLobvf7eP6VP5c--
