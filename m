Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Ojbak-0004uu-KN
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 19:29:24 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OjbaX-0005YL-MZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 21:29:10 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Aug 2010 21:29:05 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <4C4F6F91.8000902@mentor.com> <4C50507C.5050906@mentor.com>
	<4C642B76.6090402@mentor.com>
In-Reply-To: <4C642B76.6090402@mentor.com>
MIME-Version: 1.0
Message-Id: <201008122129.08412.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Disable packaged-staging for perl-native
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
X-List-Received-Date: Thu, 12 Aug 2010 17:29:24 -0000
X-Groupsio-MsgNum: 22122
Content-Type: multipart/signed; boundary="nextPart4704995.nrVUREZG3e";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4704995.nrVUREZG3e
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 12 =D0=B0=D0=B2=D0=B3=D1=83=D1=
=81=D1=82=D0=B0 2010 21:12:22 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Tom Rini wrote:
> > Roman I Khimov wrote:
> >> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=
=D1=82 =D0=A1=D1=80=D0=B5=D0=B4=D0=B0 28 =D0=B8=D1=8E=D0=BB=D1=8F 2010 03:4=
5:21 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BB:
> >>> I'd like to disable packaged-staging for perl-native.  The problem he=
re
> >>> comes from a number of things that happen.  Some of these can only
> >>> happen in combination with packaged-staging but others I believe could
> >>> happen today.  The problem itself is that if we have perl-native
> >>> available from packaged-staging it can suddenly exist very early.  Wh=
at
> >>> this means in practical terms is that now we're trying to generate say
> >>> pod2man.pl from pod2man.pl.in and @perl@ is expanded to something
> >>> beyond the "#!" mechanic length limit and recipes start failing to
> >>> build (fixable by changing pod2man.pl.in to use /usr/bin/env perl (and
> >>> if it had a -w changing to Use warnings: or whatever the perl is)).
> >>
> >> So the problem really is that we have perl in
> >> /very-very-long-path/perl? IMO /usr/bin/env change would be better in
> >> that case.
> >
> > The most common case is that one, yes.  I'm open to suggestions on
> > catching and fixing these problems ahead of time but the issue is we're
> > talking about for example wget which has no dependency on perl-native.
>=20
> As I go over the list of stuff to get a "1.0" of relocatable packaged
> staging done, ping?  Blacklist perl-native for now or someone suggest
> how to catch and fixup all the cases to be /usr/bin/env perl ?  iirc
> just setting ac_cv...=3D"/usr/bin/env perl" won't do it since we end up
> trying to invoke /usr/bin/env perl -w sometimes and that's an error.

Well, IMO, blacklisting just doesn't fix the problem here if the problem is=
=20
/long/long/long/path/to/perl. Because whether from packaged staging or from=
=20
really built perl-native the perl will be there anyway and so is the chance=
 of=20
breakage.

Maybe some automatic

$ sed -ri "s,#!.\s*${STAGING_NATIVE_BINDIR}/perl,#!/usr/bin/env perl,"

somewhere (and probably something more hacky to only catch the first line)?

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart4704995.nrVUREZG3e
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkxkL2QACgkQXJ70z+XgVcPVxgCfY7Rmg/yQ5PSklA/5xCR4px19
FiwAoLvo8zkS8s9fUAY+fFE54eqxwCSp
=m/wP
-----END PGP SIGNATURE-----

--nextPart4704995.nrVUREZG3e--
