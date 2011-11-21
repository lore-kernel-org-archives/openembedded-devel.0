Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSVip-0003Dg-Op
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 16:23:53 +0100
Received: by yenm2 with SMTP id m2so3262919yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 07:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=ZWcbB8h1qpSdSAFlrYzR1b0S0DIHrtuUbvUsHRDN+DE=;
	b=aEFlGKqd6bjJugjfkS3YudvPRE1SW71zIgZSVeS9nvFRPzhnaXaYpiblzgHY5hnhFm
	l4TtxhqALvzfCpFVACS2yF03RIqRvWeOIFGTtJ3oBNpJsjvlhirJ4yTTg8xR+iqvHR6v
	7xbmXh4XWUOmbdAHiYrz/64C0VcDaduvyPfqs=
Received: by 10.152.0.138 with SMTP id 10mr9373424lae.3.1321888641130;
	Mon, 21 Nov 2011 07:17:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hr17sm9828861lab.12.2011.11.21.07.17.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 07:17:20 -0800 (PST)
Date: Mon, 21 Nov 2011 16:17:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111121151707.GK3565@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] openssl using wrong libdir
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
X-List-Received-Date: Mon, 21 Nov 2011 15:23:53 -0000
X-Groupsio-MsgNum: 35492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Content-Disposition: inline

--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

while building on 64bit host with MACHINE=3Dqemux86-64 I got
few errors like this
configure:11590: $PKG_CONFIG --exists --print-errors "openssl >=3D
$OPENSSL_REQUIRED"
Package openssl was not found in the pkg-config search path.
Perhaps you should add the directory containing `openssl.pc'
to the PKG_CONFIG_PATH environment variable
No package 'openssl' found
configure:11593: $? =3D 1

Even from packages with DEPENDS =3D "openssl" the real cause for this is
that openssl installs files to wrong libdir (/usr/lib64 is used on my
host - gentoo) and for OE build it should be just /usr/lib afaik). So
openssl files are not packaged and pkg-config is right to complain.

NOTE: package openssl-1.0.0e-r14.4: task do_package: Started
WARNING: For recipe openssl, the following files/directories were
installed but not shipped in any package:
WARNING:   /usr/lib64
WARNING:   /usr/lib64/libcrypto.so.1.0.0
WARNING:   /usr/lib64/libcrypto.a
WARNING:   /usr/lib64/libssl.a
WARNING:   /usr/lib64/libssl.so.1.0.0
WARNING:   /usr/lib64/libcrypto.so
WARNING:   /usr/lib64/libssl.so
WARNING:   /usr/lib64/engines
WARNING:   /usr/lib64/.debug
WARNING:   /usr/lib64/pkgconfig
WARNING:   /usr/lib64/ssl
WARNING:   /usr/lib64/.debug/libcrypto.so.1.0.0
WARNING:   /usr/lib64/.debug/libssl.so.1.0.0
WARNING:   /usr/lib64/.debug/libcrypto.so
WARNING:   /usr/lib64/.debug/libssl.so
WARNING:   /usr/lib64/pkgconfig/openssl.pc
WARNING:   /usr/lib64/pkgconfig/libcrypto.pc
WARNING:   /usr/lib64/pkgconfig/libssl.pc
WARNING:   /usr/lib64/ssl/engines
WARNING:   /usr/lib64/ssl/engines/lib4758cca.so
WARNING:   /usr/lib64/ssl/engines/libubsec.so
WARNING:   /usr/lib64/ssl/engines/libcswift.so
WARNING:   /usr/lib64/ssl/engines/libatalla.so
WARNING:   /usr/lib64/ssl/engines/libnuron.so
WARNING:   /usr/lib64/ssl/engines/libgmp.so
WARNING:   /usr/lib64/ssl/engines/libsureware.so
WARNING:   /usr/lib64/ssl/engines/libcapi.so
WARNING:   /usr/lib64/ssl/engines/libaep.so
WARNING:   /usr/lib64/ssl/engines/libpadlock.so
WARNING:   /usr/lib64/ssl/engines/libchil.so
WARNING:   /usr/lib64/ssl/engines/libgost.so
WARNING:   /usr/lib64/ssl/engines/.debug
WARNING:   /usr/lib64/ssl/engines/.debug/lib4758cca.so
WARNING:   /usr/lib64/ssl/engines/.debug/libubsec.so
WARNING:   /usr/lib64/ssl/engines/.debug/libcswift.so
WARNING:   /usr/lib64/ssl/engines/.debug/libatalla.so
WARNING:   /usr/lib64/ssl/engines/.debug/libnuron.so
WARNING:   /usr/lib64/ssl/engines/.debug/libgmp.so
WARNING:   /usr/lib64/ssl/engines/.debug/libsureware.so
WARNING:   /usr/lib64/ssl/engines/.debug/libcapi.so
WARNING:   /usr/lib64/ssl/engines/.debug/libaep.so
WARNING:   /usr/lib64/ssl/engines/.debug/libpadlock.so
WARNING:   /usr/lib64/ssl/engines/.debug/libchil.so
WARNING:   /usr/lib64/ssl/engines/.debug/libgost.so
WARNING:   /usr/lib/ssl/certs
WARNING:   /usr/lib/ssl/private
NOTE: package openssl-1.0.0e-r14.4: task do_package: Succeeded

Anyone seen this before? I didn't notice it on my last qemux86-64 build.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Ka3MACgkQN1Ujt2V2gBw7ewCgtAw3I/xHEXQ7Lo/mVoF/1OQY
8KQAnibeJ3cIE9/yjNjfhIAHUeLz3Too
=RKzi
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--
