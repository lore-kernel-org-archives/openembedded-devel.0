Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9172973E11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 08:03:10 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so64952192pdr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 01:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=BH5gPGhafmRMsQb7pXdHarQhpTpIXAmO7Vo30IBNt3Q=;
	b=PAqeFiqrtxgBuEosKVTJiLAB9jPQUbgsIodbAfYM+AV9alzVqtV7cwGNPVgAiwnzRV
	VtnEXLAyxfs9iPuqaMqAkTDhqzsI07uI4zKa59orW0QjCvD4xwaBffGTYK9HVWGKzOlb
	md63bhPgPddWrq1JE5z1XYn8poVAj4xB5mK7djfwDdqJwvzpmE8wYGabdJHVtWKBlv/t
	jtLYJWVD2wbd0UMbY1K1MWWgTQ9Cxneq9nfsD3GFzwPcLVvFyuGv0o5RGqEAulnbiwxh
	J1GhV+HgVQyW8V6D7lho1XtASYNADCaJc0Vs/70OTKlfwmhTU2gTUuDAJKhOlhoHbVgg
	Df+w==
X-Received: by 10.70.47.129 with SMTP id d1mr54701966pdn.6.1440489790952;
	Tue, 25 Aug 2015 01:03:10 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ded:b62b:f72d:209d?
	([2601:646:8601:4580:4ded:b62b:f72d:209d])
	by smtp.gmail.com with ESMTPSA id
	w6sm19993707pdn.46.2015.08.25.01.03.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 01:03:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.5.1
Date: Tue, 25 Aug 2015 01:03:07 -0700
Message-Id: <9150AC0D-F129-4100-A3CD-D954AB76E732@gmail.com>
To: llvmlinux@lists.linuxfoundation.org,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: Clang cross compiler with OpenEmbedded
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
X-List-Received-Date: Tue, 25 Aug 2015 08:03:11 -0000
X-Groupsio-MsgNum: 57002
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6B533996-C9E9-41F5-B5AD-05A88B45CF85";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6B533996-C9E9-41F5-B5AD-05A88B45CF85
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all

We have put together clang as system cross compiler support into =
OpenEmbedded, here is a writeup on how to use it
in your setups.

http://himvis.com/using-clang-with-openembeddedyocto-project/

At present, it is able to compile a lot of packages already and =
core-image-minimal when build mixed with clang and gcc
boots fine on qemux86 and rpi2, I have not tested ppc and mips images =
yet but build wise a lot of packages can be build for ppc/mips too.

Interested ? then please come on board and help porting the packages to =
work with clang

if you find issues or have questions please feel free to send them my =
way

Thanks
-Khem


--Apple-Mail=_6B533996-C9E9-41F5-B5AD-05A88B45CF85
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAlXcIT8ACgkQuwUzVZGdMxT/mQCeNa3vJgUHmfzWprig7JcpTibg
urEAmJaVFOrvic3HUp8UWT9USvpBZG4=
=9QGb
-----END PGP SIGNATURE-----

--Apple-Mail=_6B533996-C9E9-41F5-B5AD-05A88B45CF85--
