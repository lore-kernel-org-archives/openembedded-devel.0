Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PJ9Sy-0008Va-NB for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 19:44:17 +0100
Received: from f053032179.adsl.alicedsl.de ([78.53.32.179]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PJ9Rv-0004EM-2C for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 18:43:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=cnG0DyVCmJjKrBEqR4AQgTVVn_ugHyUY194gF@mail.gmail.com>
References: <4CE3D70F.2000101@gmail.com>
	<AANLkTin0i5rSxwA8Q3+jN7tLR-Rn3JEei6D==1CjKOh9@mail.gmail.com>
	<4CE3EF4C.2050105@gmail.com>
	<AANLkTin2v1+3UP_rk593i+V4=e4QeKgPinAkoWNwY0BO@mail.gmail.com>
	<4CE42FF0.1000702@mentor.com> <4CE4EC1E.50903@gmail.com>
	<AANLkTi=cnG0DyVCmJjKrBEqR4AQgTVVn_ugHyUY194gF@mail.gmail.com>
Date: Thu, 18 Nov 2010 19:43:09 +0100
Message-ID: <1290105789.3755.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git-native: fails with `/usr/bin/autoreconf: unrecognized option `--exclude=autopoint'` (was: Error: git was compiled without libcurl support)
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
X-List-Received-Date: Thu, 18 Nov 2010 18:44:17 -0000
X-Groupsio-MsgNum: 26279
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Bl/+lIiHC4xosbA+iWFC"

--=-Bl/+lIiHC4xosbA+iWFC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 18.11.2010, 10:30 -0800 schrieb Khem Raj:
> On Thu, Nov 18, 2010 at 1:04 AM, Marco Cavallini <koansoftware@gmail.com>=
 wrote:
> > Tom Rini ha scritto, Il 17/11/2010 20:41:
> >> On 11/17/2010 12:30 PM, Khem Raj wrote:
> >>> On Wed, Nov 17, 2010 at 7:05 AM, Marco Cavallini wrote:

[=E2=80=A6]

> >>>> I tried removing ASSUME_PROVIDED git-native from my config (local.co=
nf)
> >>>> in this case bitbake create git and use it instead of the host provi=
ded.
> >>>> Then I did
> >>>>
> >>>>   bitbake -b git-native
> >>>>
> >>>> Anyway there are errors again
> >>>> http://tinderbox.openembedded.net/packages/985559/
> >>>>
> >>> can you post your local.conf and additionally what version of autocon=
f
> >>> is installed on your build host.
> >>
> >> On IRC we confirm that debian/lenny (on 64bit) has a git bug atm.
> >>
> >
> > Here is my workaround, if you are using Debian Lenny as host distro
> > please read this carefully
> > http://www.kaeilos.com/debian-lenny-and-git-native
> >
> > Suggestions would be appreciated.
>=20
> why not just use git-native ?

As Marco wrote four messages before, it fails for him [1]. I guess you
still need the version of `autoconf`.


Thanks,

Paul


[1] http://tinderbox.openembedded.net/public/logs/task/10259740.txt

--=-Bl/+lIiHC4xosbA+iWFC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzlc70ACgkQPX1aK2wOHVg8WgCeOJo9Iq+F/l7H/YcRsomXcU9O
nYsAn2X+S2MQlYAJO82maIx4cjJijYkU
=wdof
-----END PGP SIGNATURE-----

--=-Bl/+lIiHC4xosbA+iWFC--
