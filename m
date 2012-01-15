Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RmPXg-0002hb-Eg
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 13:50:36 +0100
Received: (qmail invoked by alias); 15 Jan 2012 12:43:00 -0000
Received: from p5B0A2462.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.36.98]
	by mail.gmx.net (mp005) with SMTP; 15 Jan 2012 13:43:00 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18IiGAnw4oI6BQ4ZINdO5nKuuqUegtdxPIGcYVpCY
	WpvNxzHl2eaS52
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jan 2012 13:44:16 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <20120113110213.AFF2110331@opal>
	<201201150322.22329.schnitzeltony@gmx.de>
	<jeu53e$cvt$1@dough.gmane.org>
In-Reply-To: <jeu53e$cvt$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201201151344.16594.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] Koen Kooi : libjpeg-turbo: initial add
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
X-List-Received-Date: Sun, 15 Jan 2012 12:50:36 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday, January 15, 2012 10:09:03 AM Koen Kooi wrote:
> Op 15-01-12 03:22, Andreas M=C3=BCller schreef:
> > On Saturday, January 14, 2012 09:57:21 AM Koen Kooi wrote:
> >> Op 13-01-12 16:59, Andreas M=C3=BCller schreef:
> >>> Another stupid question from my side: How can I make this replace
> >>> libjpeg?
> >>=20
> >> Build it manually and then opkg upgrade or set PREFERRED_PROVIDER_jpeg
> >> =3D "libjpeg-turbo". Angstrom will make it the default next week.
> >=20
> > In the first step I have set
> >=20
> > PREFERRED_PROVIDER_jpeg =3D "libjpeg-turbo"
> >=20
> > in my machine configuration and built image incremental and from
> > scratch.
> >=20
> > In the second step after angstrom update (and native fix by Eric) I have
> > build image incremental.
> >=20
> > In all cases the only jpeg library found in my image was:
> >=20
> > libjpeg8_8c+1.2.0-r0_armv7a.ipk
>=20
> And that's how it should be:
>=20
> $ dpkg-deb -I libjpeg8_8c+1.2.0-r0_armv7a.ipk
>  new debian package, version 2.0.
>  size 81424 bytes: control archive=3D 489 bytes.
>      554 bytes,    15 lines      control
>  Package: libjpeg8
>  Version: 8c+1.2.0-r0
>  Description: libjpeg-turbo version 8c+1.2.0-r0
>   libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions
>   (MMX, SSE2, NEON) to accelerate baseline JPEG compression and
>   decompression
>  Section: base
>  Priority: optional
>  Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
>  License: BSD-3-Clause
>  Architecture: armv7a
>  OE: libjpeg-turbo
>  Homepage: http://libjpeg-turbo.org/
>  Depends: libc6 (>=3D 2.12)
>  Source:
> svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;proto=3Dhtt=
ps;m
> odule=3Dtrunk
>=20
Oops: libjpeg8_8c+1.2.0-r0_armv7a.ipk was created by libjpeg-turbo. Sorry f=
or=20
the noise

Andreas


