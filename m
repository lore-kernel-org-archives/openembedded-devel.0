Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ual9T-0007Lr-Jh
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 13:06:24 +0200
Received: by mail-ee0-f42.google.com with SMTP id c13so2127359eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=kRU3L62aC8S4Ur/d7yu51H4i3dPEOjC55iEImX5LAR4=;
	b=xLkOYOJ1YBa1/5+tEjLKxbIeVXM5NT+ofkJy0L8UrRPNlDVrdOnLUOnyBAbqg5DcW3
	DxE/ILfNsvhs1d2GLkeooVNXLZSxbsJfBm5de3cnBeHfzBmRPrWGiMqPi9hP2s3jc4kK
	8AXtZ7lAXLTAr3omO7lJdF/E/juL+S9am8MfUQCpkrwx5qYGuB/fY1Agey3+LBFfwUVZ
	vXekulicV2vWmLF07WtS5ytIWfhMTFodbm4Of2tGtz4KuVsPINAcNyNl5qkoAj60f4De
	gXO39l05OM1Q9HBiA8QLNUqxrjMbtvGpLMOSDWL+PwYFRcNEYlZ8sQ5dmLjnFOXMEV6o
	ou+g==
X-Received: by 10.14.99.198 with SMTP id x46mr39789532eef.38.1368182890687;
	Fri, 10 May 2013 03:48:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id n7sm2844254eeo.0.2013.05.10.03.48.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 03:48:10 -0700 (PDT)
Date: Fri, 10 May 2013 12:48:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130510104811.GD12329@jama.dyndns-home.com>
References: <1365866956.81107.YahooMailNeo@web125602.mail.ne1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1365866956.81107.YahooMailNeo@web125602.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5] Qt5.0.1 eglfs with gles2 - patchset
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
X-List-Received-Date: Fri, 10 May 2013 11:06:24 -0000
X-Groupsio-MsgNum: 44653
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2013 at 08:29:16AM -0700, Prabindh Sundareson wrote:
> Below github link has Qt5 eglfs patches for review - for working with gle=
s2 platforms. Is this the right way to submit for review ? If not, should I=
 submit individual patches ?
>=20
>=20
> https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd=
85d9c56410a
>=20
> I ran into the issue of managing the GL providers for eglfs support, and =
currently using a DISTRO_FEATURE check for virtual/libgl support and=20
> falling back to libgles2. I am sure there are better ways.
>=20
> This is build tested on Poky, with Yocto, and runtime checked with minima=
l plugin on Beaglebone, with TI SGX530 drivers on 3.8.5 kernel. There is no=
 fb support on Beaglebone yet, but I hope to get to Arago on one of the EVM=
s next.

Sorry for very long delay, but there were bigger issues in meta-qt5
which needed to be fixed first before applying more changes to it.

Now it should work correctly, please rebase your and check if that
qtbase patch is still needed.

gl/gles2 selection is DISTRO choice, but testing=20
virtual/libgl in DISTRO_FEATURES is not going to work, we're using only
one DISTRO_FEATURE "opengl" and for gl/gles2 we would need finer
granularity.

Also please notice that there are now 2 variables and example how to
overwrite in distro .bbappend to force gles2 (+eglfs)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGM0GsACgkQN1Ujt2V2gBwUdQCeJQ09XKZsAsXqGI1U4/EmK6Hs
wA0AnjCQGl7Z9vQahCrHH50K4dP4Th83
=kAIt
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
