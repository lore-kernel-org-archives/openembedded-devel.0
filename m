Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDDC60CFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 21:44:03 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so9610991wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 14:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U+nMtP3dJT3U1a68AISzPi0bt4e4TLcRpjmJ5/pOn0k=;
	b=dEnD9MKR8NUh3m301D+OU4emlw1FHpFlxtyOAU68Dj7q3j4MKCS/r5ZMvRnz/zKeWz
	f1I9AG5DhNsg2xy400rvmfS6HIcaOl7vEuPfyokljx+PIwvA9TlIu9AyyBfV16Rjt4UJ
	ne+nwwl3UXXcRsngU0gSEonRRc8Sm2SZJfKp7TV1GJjqy7jjCAqnrvkfhOh7jSnJAhxC
	uFEhhqa2+SNlHO8cOlat0bzt2jPi9vVmkc+xmeKsSSQFTdemEyPZ5I6q4bHsjfKwLtcU
	Gr/Hr70pKe4UpWJUAlZRFlC3d7UGSzYAXx4RxYEVs3e66lxJzqE3fB2qTdp+sNz+pHvc
	OGKA==
X-Received: by 10.194.92.115 with SMTP id cl19mr19401505wjb.29.1407361444938; 
	Wed, 06 Aug 2014 14:44:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u10sm9953115wix.14.2014.08.06.14.44.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 14:44:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 23:44:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806214435.GS14848@jama>
References: <CAP9ODKpe1xeC9KksG+7igf_nrLY5-hx5UgeoC=2p=D4Vysj1hA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpe1xeC9KksG+7igf_nrLY5-hx5UgeoC=2p=D4Vysj1hA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5] Patch failing to apply
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
X-List-Received-Date: Wed, 06 Aug 2014 21:44:12 -0000
X-Groupsio-MsgNum: 51472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPT5DIEyVHz5yXBV"
Content-Disposition: inline

--GPT5DIEyVHz5yXBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 02:59:06PM -0300, Otavio Salvador wrote:
> Hello,
>=20
> The daisy branch seems to be broken. Please check:
>=20
> recipe qtimageformats-5.2.1-r0: task do_patch: Started
> ERROR: Command Error: exit status: 1  Output:
> Applying patch 0001-qtimageformats.pro-Make-the-dependencies-determinist.=
patch
> patching file qtimageformats.pro
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file qtimageformats.pro
> Patch 0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
> does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> .../build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/qtimageformats/5=
=2E2.1-r0/temp/log.do_patch.22853

I'm sorry, it was pushed to daisy by accident, I'll revert it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GPT5DIEyVHz5yXBV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiocMACgkQN1Ujt2V2gBzqWACdE7nnew0tveG9keqcDGjqD90U
xI0An3r2oLPR1XHotRu5PnzVvmlM0C45
=cpnv
-----END PGP SIGNATURE-----

--GPT5DIEyVHz5yXBV--
