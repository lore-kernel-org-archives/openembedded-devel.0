Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RmFpo-0001pz-1H
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 03:28:40 +0100
Received: (qmail invoked by alias); 15 Jan 2012 02:21:06 -0000
Received: from p5B0A0A21.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.10.33]
	by mail.gmx.net (mp008) with SMTP; 15 Jan 2012 03:21:06 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/dzD18mQTdUP6O53DGuk3FSMGZeuq6C/eddC2qZu
	rUtBwwcNigFOX2
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jan 2012 03:22:22 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <20120113110213.AFF2110331@opal>
	<201201131659.37622.schnitzeltony@gmx.de>
	<jerg1f$kn1$1@dough.gmane.org>
In-Reply-To: <jerg1f$kn1$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201201150322.22329.schnitzeltony@gmx.de>
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
X-List-Received-Date: Sun, 15 Jan 2012 02:28:40 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, January 14, 2012 09:57:21 AM Koen Kooi wrote:
> Op 13-01-12 16:59, Andreas M=C3=BCller schreef:
> > Another stupid question from my side: How can I make this replace
> > libjpeg?
>=20
> Build it manually and then opkg upgrade or set PREFERRED_PROVIDER_jpeg =3D
> "libjpeg-turbo". Angstrom will make it the default next week.
>=20
In the first step I have set

PREFERRED_PROVIDER_jpeg =3D "libjpeg-turbo"

in my machine configuration and built image incremental and from scratch.

In the second step after angstrom update (and native fix by Eric) I have bu=
ild=20
image incremental.

In all cases the only jpeg library found in my image was:

libjpeg8_8c+1.2.0-r0_armv7a.ipk

What went wrong?

Andreas


