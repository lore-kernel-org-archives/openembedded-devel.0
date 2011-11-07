Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNOVQ-00041t-M3
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 13:40:52 +0100
Received: by bkbzs2 with SMTP id zs2so312902bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 04:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wf17+3kQHUr6PyFEvgJEOJKaE3jz7qz2RPvQ1AyV0/I=;
	b=sjB7fWN/phI+D7bnITwjxkrpWbPMXYDFj1VztGdZoQvhkV/iQr6i1MghsBMmOQsjrY
	ZyFGw4JL8qBDdydhgm0vYQYeVKMOBBMmSWQyIueFCZTMdsLqoMRxTNqUow4BWE/5u30L
	467wS7fitvYach8Zs6wOmqMSQRDR4zkhIcODg=
Received: by 10.152.105.203 with SMTP id go11mr6360653lab.10.1320669279546;
	Mon, 07 Nov 2011 04:34:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id nw10sm8409098lab.4.2011.11.07.04.34.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 04:34:38 -0800 (PST)
Date: Mon, 7 Nov 2011 12:34:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111107113426.GB4237@jama.jama.net>
References: <1320399536-9588-1-git-send-email-Martin.Jansa@gmail.com>
	<j915dk$4rp$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j915dk$4rp$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] mplayer2: import from OE-classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 12:40:52 -0000
X-Groupsio-MsgNum: 35237
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2011 at 05:55:16PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 04-11-11 10:38, Martin Jansa schreef:
> > * taken from 1a91fc4b705b0c4f45eb088a2f7aea01ebc9c98e * dropped V4L1,
> > largefile, xvmc * added libass * added LIC_FILES_CHKSUM * upgraded to
> > latest SRCREV * moved glamo patch to meta-openmoko layer
>=20
> I did some more fixes, it still doesn't build for armv7a or if you use
> - --as-needed, but to get parsing to work again I pushed it, OE-core styl=
e ;)

I had it built for armv4t (om-gta02), armv5te (spitz, qemuarm) and
armv7a-vfp-neon (nokia900, palmpre, palmpre2) and qemux86,qemux86-64
before sending this patch, but seems like something was wrong here even
with successfull build :/.

thanks for armv7a fixes, but there was also one typo introduced..

-SRC_URI_append_armv7a =3D " \
+SRC_URI_append_aarmv7a =3D " \

Restarting test builds to see if it still builds..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk63wkIACgkQN1Ujt2V2gBxb9QCgnZM0lbt1zeKd5cTkctRXODCz
qWoAni+9APAWzZaK9yNcI1d4iy2absNh
=0O2U
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
