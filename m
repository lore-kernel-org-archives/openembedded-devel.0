Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1Mshal-0004jH-Lo
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 20:38:30 +0200
Received: by ewy20 with SMTP id 20so13366820ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2009 11:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=f4t/J3uyPu8ssWZdJZZFi2mLU1ekEygB4fwalj6aeu8=;
	b=Zgqpo+KPQMYsGWZLaZASXNviYEBZpGSUg/MzccuTxv68kfhPrvwlE9qWSMhrB5r4Bv
	me39nGLoZzkwec11q+rPdD/OuH4BWpRxc3DKSLzlNtcx/MOVN+ztEp5qMiHVftOylF1v
	fUMPFWT9gVMrhfMUP0RmNEYRdwgQr/wWFDK/0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=JxkKRvcGeaVYmmm+OTkLn7ObGgDrPI9qDlT1f6Di5wHFjNxf/EQyscX5JKAQRdIF1w
	Z93MeNb3oj0rbFDjLWeeQARg2khstQR/rrkZt9f+bp7lEdA0KLGdDQS1s+elFXBULioD
	H38WVpqVibrPGW9bOcmTCf7wve6IuWTrqklL4=
Received: by 10.211.132.36 with SMTP id j36mr5538829ebn.51.1254249463838;
	Tue, 29 Sep 2009 11:37:43 -0700 (PDT)
Received: from anarsoul-laptop.localnet ([195.222.84.231])
	by mx.google.com with ESMTPS id 10sm127090eyd.10.2009.09.29.11.37.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Sep 2009 11:37:41 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2009 21:37:09 +0300
User-Agent: KMail/1.12.1 (Linux/2.6.31-gentoo-anarsoul; KDE/4.3.1; i686; ; )
References: <200909281752.11487.anarsoul@gmail.com>
	<1254215340.12689.643.camel@mill.internal.reciva.com>
	<20090929181002.GA12138@denix.org>
In-Reply-To: <20090929181002.GA12138@denix.org>
MIME-Version: 1.0
Message-Id: <200909292137.14707.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.220
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: udev problems on angstrom-2008.1
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
X-List-Received-Date: Tue, 29 Sep 2009 18:38:30 -0000
X-Groupsio-MsgNum: 13269
Content-Type: multipart/signed; boundary="nextPart1422721.hZgIt9qDyd";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1422721.hZgIt9qDyd
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
29 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2009 21:10:02 =D0=B0=D0=
=B2=D1=82=D0=BE=D1=80 Denys Dmytriyenko =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=BB:
=20
> From the tmpfs documentation it kind of implies inodes take half the RAM
> pages:
>=20
> nr_inodes: The maximum number of inodes for this instance. The default
>            is half of the number of your physical RAM pages, or (on a
>            machine with highmem) the number of lowmem RAM pages,
>            whichever is the lower.
>=20
> Now while reading it again, I think I may have misread it previously...
> Looks like half the RAM pages is used as a default number of inodes, but
> inodes don't consume that much. It's good to know udev is not a pig... :)

Anyway, your suggestion works, I've disabled LEGACY_PTY and now system boot=
s.=20
Thanks ;)

Regards
Vasily=20

--nextPart1422721.hZgIt9qDyd
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrCU9oACgkQRM6pQpltKE7VzgCdF1lB6IiIsD+0LQro9reQCFOe
k7YAoLK5Fl2s7cqn2Oy4vqlbbsDGeb1i
=8pMO
-----END PGP SIGNATURE-----

--nextPart1422721.hZgIt9qDyd--
