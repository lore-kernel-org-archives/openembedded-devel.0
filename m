Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LuLQr-0000Ef-TU
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 08:50:51 +0200
Received: by wf-out-1314.google.com with SMTP id 25so264564wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 23:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:message-id; bh=NIqZLgek/1X4LjjoH4dYsfi16lAGw+7gvknlH5rQfFQ=;
	b=CeekHldGXfqmc0ly3Nzd5lfxftaoI8ktd8idpfRo0mruocnsd5G9UN0KsQRXdPYvXL
	CvRg+u9KLUlGyNT2/KPGcPGTpdIgu+N9orS+2aIIXEbkSsoZMfNDSjkVxBm0aBrUL2FG
	VXMBBCav+74I13JwSHX3115HweJXUR8mR6FDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	b=iD8scyQ/VgBrggtRJG/TarzY/UsRthmbSyMED5IiE07VRgksVxEU8DLilgyeGC6/3V
	ppQPFN3J14N4ytmYpz98nHyiLyvfwRbdab+p4sYNtX4ca5T1VcxeYWc7N1tF2XsEBqpm
	K7R7slIhC6QqfqmpCCpySjwm5epXMEEnojofw=
Received: by 10.143.8.17 with SMTP id l17mr1708852wfi.173.1239864413710;
	Wed, 15 Apr 2009 23:46:53 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id 30sm2770250wff.27.2009.04.15.23.46.52
	(version=SSLv3 cipher=RC4-MD5); Wed, 15 Apr 2009 23:46:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 23:46:45 -0700
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200904152346.51072.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.200.172
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: uclibc/thumb toolchain versions to use
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
X-List-Received-Date: Thu, 16 Apr 2009 06:50:55 -0000
X-Groupsio-MsgNum: 9420
Content-Type: multipart/signed; boundary="nextPart1416647.lJzFtcUAaA";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1416647.lJzFtcUAaA
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi

Recently, after switching to thumb mode for some on architectures. I tried =
to enable thumb for uclibc recipe itself too.
Unfortunately it does not work with all versions of gcc and binutils we have

The version combos that work are

gcc 4.3.x + binutils 2.18
gcc-4.3.x + binutils_cvs

2.19x does not work and also 2.18.50.x.x does not work because of improper =
thumb to thumb veneer handling by linker
gcc 4.2.4 does not work because ldso.c we relaxed optimization level which =
causes a gcc ICE

default gcc for angstrom is 4.2.4 and binutils 2.18.50.0.7 and unfortunatel=
y this combo will not work for uclibc thumb

Either we can think of bumping default gcc to 4.3.x and downgrade default b=
inutils to 2.18 or let uclibc compile in arm mode even though everything el=
se is in thumb mode.

Thanks

=2D-=20
Khem Raj

--nextPart1416647.lJzFtcUAaA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknm1FcACgkQHnJKy6V6em6aWgCffHPFQvvCB8WAVgpS/6kb9rN9
PRMAn2Z6GN3gs4GmgFt7AZ//L0ExT1xv
=fWvW
-----END PGP SIGNATURE-----

--nextPart1416647.lJzFtcUAaA--
