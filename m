Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQEVl-0005sW-7H
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 10:04:41 +0200
Received: by fxm19 with SMTP id 19so2032368fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=9Fostv+kpOOgJ0QdhSTkljMv6wF4id/ELEb9Viv8rGs=;
	b=Bohzd4i1whDnL55bb//bYLDO/DNCgEJdcO0xPHSVeknHRIZkMtpTNsJAhko2ZezUqB
	1ew5Pwg7ZSnUqPMaZukWu/WB1+fCnlno3yEEAILCZUsmCtwg9OM0xubKlqspvZoSN2kE
	fqb7GLU30/MlY2ZUzTvIvUdvfbXg5mifAsHko=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=mXmfCKAydXcqG1x3vAFNvRLs9E2f8PePqHpd2JzsbIXez5vVicsiuz9TFP58xrn8Yr
	pGncozDV0h8Lt9oEudmX364rgQCXxKUgjWETnh1v9YrYMEi5ibNgTJx6/N2i4OkGX63d
	dxKYUFjTExnAwJlWzLYvExFfShtwQdhRb86lE=
Received: by 10.223.98.4 with SMTP id o4mr1060201fan.120.1306569690783;
	Sat, 28 May 2011 01:01:30 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id r10sm88339fah.2.2011.05.28.01.01.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 01:01:30 -0700 (PDT)
Date: Sat, 28 May 2011 10:01:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110528080123.GR3222@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: qt4-x11-free with PACKAGE_ARCH=palmpre :/
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
X-List-Received-Date: Sat, 28 May 2011 08:04:42 -0000
X-Groupsio-MsgNum: 32318
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kLVKJMuKEUFaIs8+"
Content-Disposition: inline

--kLVKJMuKEUFaIs8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

8a8dbc88232935835c1698cdf162bdf02fc1701b
qt4-embedded: add palmpre specific profile script and bump PR

sets PACKAGE_ARCH_palmpre =3D "${MACHINE_ARCH}" only in=20
qt4-embedded.inc, but machine specific file
qt4/files/palmpre/qte.sh
is included *also* in shared qt-${PV}.inc SRC_URI

=2E/qt-4.7.3.inc:SRC_URI +=3D "file://qte.sh"
=2E/qt-4.6.3.inc:SRC_URI +=3D "file://qte.sh"
=2E/qt4-embedded.inc:SRC_URI +=3D "file://qte.sh"

which makes qt4-x11-free also MACHINE_ARCH because of=20
utils.bbclass:machine_paths

I don't see qte.sh used in qt4-x11-free so I'm going to remove it from
=2Einc file as well as PACKAGE_ARCH_palmpre which is detected fine by
utils.bbclass.

I'll attach patch, please test, because I'm using qt4-x11-free only.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kLVKJMuKEUFaIs8+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3gq9MACgkQN1Ujt2V2gBwO9wCgq43YFtsnpEoupoY7Szu7j32H
XLQAoKStmbWt04tqWURPkD5Id9mQvxwK
=jjin
-----END PGP SIGNATURE-----

--kLVKJMuKEUFaIs8+--
