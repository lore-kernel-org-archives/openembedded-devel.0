Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGDjW-000439-IZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 19:45:46 +0200
Received: by bkat8 with SMTP id t8so1194996bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 10:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/k1JBaBYTbpjiHSX/zkr/hgaXe+896M8q5rIlbPfSuM=;
	b=v5AEpaZ1HSYKCGnB4eb6sPJW99t8AOjhde83W0ZsFkga2WyipTfWA/V93uCG0jQh8Y
	7DoGJs+FE/3P4kV0zq22tZLoT8LtNx1+CWrz8By7EjZbuO57g7x75BXBYZYh+iUvCZqN
	0fMPvIiP1iT4dxbAM7Nm12ZKGXVBkAdOBOltI=
Received: by 10.204.141.142 with SMTP id m14mr2500879bku.89.1318959596623;
	Tue, 18 Oct 2011 10:39:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm3008351bka.0.2011.10.18.10.39.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 10:39:55 -0700 (PDT)
Date: Tue, 18 Oct 2011 19:39:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018173948.GA556@jama.jama.net>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
	<c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
	<1318949469.3538.34.camel@mattotaupa>
	<20111018162433.GJ20678@jama.jama.net>
	<j7ka5s$ioi$1@dough.gmane.org>
	<20111018165107.GA17242@jama.jama.net>
	<j7kb44$pmd$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j7kb44$pmd$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 18 Oct 2011 17:45:46 -0000
X-Groupsio-MsgNum: 34875
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 06:56:36PM +0200, Koen Kooi wrote:
> > because of eglibc or uclibc?
>=20
> uclibc, the 'libc-glibc' override is true for both (e)glibc.

Ah OK,

-RDEPENDS_${PN}-test =3D "glibc-gconv-utf-16"
+RDEPENDS_${PN}-test_append_libc-glibc =3D "glibc-gconv-utf-16"

tested on nokia900 and done in branch

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6dueQACgkQN1Ujt2V2gByF4ACggxwZwtUPK6nFDqAD7Zp+V6j3
uq4AoJPvp5euVLYd3/5gXe86nWTSGsT2
=bLVY
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
