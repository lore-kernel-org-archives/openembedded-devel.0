Received: from [82.192.226.27] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1MwQ5u-0004KH-Qi
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Oct 2009 02:46:01 +0200
Received: from dizzy-6.localnet ([::ffff:192.168.2.122])
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by koffein with esmtp; Sat, 10 Oct 2009 01:32:03 +0200
	id 0000000000013E15.000000004ACFC7F3.000054BF
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Oct 2009 02:46:01 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31.1; KDE/4.3.1; x86_64; ; )
References: <A22F8CDABC6B406EA2FC80E3109602BD@pcvirus>
	<200910082311.16084.david.lanzendoerfer@o2s.ch>
	<4ACF4AF7.9070406@hardware-datenbank.de>
In-Reply-To: <4ACF4AF7.9070406@hardware-datenbank.de>
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{); h
	=s@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')Ul8f}F%1vdg9|52W=Xs
	rR^/E/SPo^{-R22[a}c?@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA; *0A,6>
	*GY(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(32pVlT:=&
	i4l[3%?Z<zzP~wGSke?1VJj\cd~Z(,Upc;nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
MIME-Version: 1.0
Message-Id: <200910100246.06278.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 82.192.226.27
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build of libxrender failed
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
X-List-Received-Date: Sat, 10 Oct 2009 00:46:02 -0000
X-Groupsio-MsgNum: 13392
Content-Type: multipart/signed; boundary="nextPart4894699.cVUH8cySso";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4894699.cVUH8cySso
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi
> I have a config file for the beagleboard (attached).
Ok. Looks good.

> In the openembedded/conf/distro/angstrom-2008.1.conf I've set=20
"PREFERRED_VERSION_linux-libc-headers" to "2.6.29"
Don't do this in the conf. For this purpose there is an include folder!
Enter the versions in conf/distro/include/angstrom-2008-preferred-versions.=
inc
And your problem seems to be a glibc problem.
Which version gets installed if you make glibc-native?

greatings leviathan

--nextPart4894699.cVUH8cySso
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrP2U4ACgkQAeZw77btGjqL8QCfaNf8lgerR6EOXOSwafKfVD33
rO0AmwUvZPwm5KPJmFKgwCOD39aoMcWg
=x5q2
-----END PGP SIGNATURE-----

--nextPart4894699.cVUH8cySso--
