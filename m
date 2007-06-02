Received: from [65.254.253.161] (helo=mailout20.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.67) (envelope-from
	<SRS0=c6KqOX=LC=thegnar.org=markgross@yourhostingaccount.com>)
	id 1HuSxX-00042R-6u
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2007 14:43:56 +0200
Received: from mailscan20.yourhostingaccount.com ([10.1.15.20]
	helo=mailscan20.yourhostingaccount.com)
	by mailout20.yourhostingaccount.com with esmtp (Exim)
	id 1HuSvb-0004r6-Q6
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2007 08:41:56 -0400
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8] ident=exim)
	by mailscan20.yourhostingaccount.com with spamscanlookuphost (Exim)
	id 1HuSvb-0002fN-Cd
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2007 08:41:55 -0400
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8]
	helo=authsmtp08.yourhostingaccount.com)
	by mailscan20.yourhostingaccount.com with esmtp (Exim)
	id 1HuSva-0002fK-Pc
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2007 08:41:54 -0400
Received: from pool-71-245-108-49.ptldor.fios.verizon.net ([71.245.108.49]
	helo=mgross-desktop)
	by authsmtp08.yourhostingaccount.com with esmtpa (Exim)
	id 1HuSva-00030U-3q
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2007 08:41:54 -0400
Received: by mgross-desktop (Postfix, from userid 1000)
	id 3B54DC2E5D; Sat,  2 Jun 2007 05:42:55 -0700 (PDT)
Date: Sat, 2 Jun 2007 05:42:55 -0700
From: Mark Gross <markgross@thegnar.org>
To: openembedded-devel@openembedded.org
Message-ID: <20070602124255.GB7110@thegnar.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.11
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: Mark Gross <markgross@thegnar.org>
X-EN-OrigIP: 71.245.108.49
X-EN-OrigHost: pool-71-245-108-49.ptldor.fios.verizon.net
Subject: slugos built as Little Endian
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Jun 2007 12:43:56 -0000
X-Groupsio-MsgNum: 2160
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline

--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have a robotics application where I'm using the slugos on an NSLU2 and
the spca5xx camera driver.  I found that the vid captures from the
driver that none of the brightness and white ballance commands seem to
work when issued from the slug using the default SlugOS build.   Looking
at the driver I saw that there are endianness issues with it.  So rather
than try to fix the driver I thought I'd try building the slugos-imgage
as LE.  So I swithiched the nslug.conf file to use le tool chains and
whatnot.

My question is this:
If I issue bitbake -DDD slugos-image from the command line the build hangs =
when building the kernel
+ oe_runmake zImage 'CC=3Darm-linux-gcc -march=3Darmv5te -mtune=3Dxscale
-mno-thumb-interwork -mno-thumb' 'LD=3Darm-linux-ld '
+ '[' xmake =3D x ']'
+ oenote make -j 4 -e MAKEFLAGS=3D EXTRAVERSION=3D LOCALVERSION=3D
MAKEFLAGS=3D--no-print-directory zImage 'CC=3Darm-linux-gcc -march=3Darmv5te
-mtune=3Dxscale -mno-thumb-interwork -mno-thumb' 'LD=3Darm-linux-ld '
+ echo NOTE: 'make -j 4 -e MAKEFLAGS=3D EXTRAVERSION=3D LOCALVERSION=3D
MAKEFLAGS=3D--no-print-directory zImage CC=3Darm-linux-gcc -march=3Darmv5te
-mtune=3Dxscale -mno-thumb-interwork -mno-thumb LD=3Darm-linux-ld '
NOTE: make -j 4 -e MAKEFLAGS=3D EXTRAVERSION=3D LOCALVERSION=3D
MAKEFLAGS=3D--no-print-directory zImage CC=3Darm-linux-gcc -march=3Darmv5te
-mtune=3Dxscale -mno-thumb-interwork -mno-thumb LD=3Darm-linux-ld=20
+ make -j 4 -e MAKEFLAGS=3D EXTRAVERSION=3D LOCALVERSION=3D
MAKEFLAGS=3D--no-print-directory zImage 'CC=3Darm-linux-gcc -march=3Darmv5te
-mtune=3Dxscale -mno-thumb-interwork -mno-thumb' 'LD=3Darm-linux-ld '
  CHK     include/linux/version.h
  ^CNOTE: Waiting for 1 active tasks to finish
  NOTE: 1:
  /home/mgross/_dev/oe/org.openembedded.dev/packages/linux/ixp4xx-kernel_2.=
6.20.bb,
  do_compile (16677)
  NOTE: Sending SIGINT to remaining 1 tasks
  NOTE: KeyboardInterrupt - Build not completed.
=20
 I ^c'ed the build after waiting a long time.

However; if I attempt the same command (after rm -rf tmp) with nohup=20
"nohup bitbake -DDD slugos-image" it seems to have built.

Why would nohup or -DDD effect the build process?

Thanks,

--mgross

BTW I "think" the brightness control for the camera is working now, but
I have more investigations to do later this weekend :)


--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGYWXPhK5OsmQOmSARAiZ+AKCT3sRvea7d5MfubwjtgTlB52JLfwCfYF5G
T2qrdjO+RZ6McuOGKVvwBe8=
=Y0wP
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
