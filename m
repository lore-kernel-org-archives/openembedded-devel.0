Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OAODU-0003As-OI
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 16:07:50 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OAO9m-0002xH-41 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 07:03:58 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 7 May 2010 07:03:57 -0700
Received: from 172.30.80.68 ([172.30.80.68]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri,  7 May 2010 14:03:57 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	07 May 2010 07:03:53 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hs0mho$rst$1@dough.gmane.org>
References: <hs0mho$rst$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Fri, 07 May 2010 07:03:53 -0700
Message-ID: <1273241033.457.319.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 07 May 2010 14:03:57.0649 (UTC)
	FILETIME=[22DE8C10:01CAEDEE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: perl build problem in .dev
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
X-List-Received-Date: Fri, 07 May 2010 14:07:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-05-07 at 11:29 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> I'm unable to build perl_5.8.8.bb:
>=20
> | ln -s hostperl miniperl
> | ./miniperl -Ilib configpm --heavy=3Dlib/Config_heavy.pl lib/Config.pm
> | ./miniperl: error while loading shared libraries: libperl.so: cannot
> open shared object file: No such file or directory
> | make[1]: *** [lib/Config.pod] Error 127
> | make[1]: Leaving directory
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-=
5.8.8'
> | make[1]: Entering directory
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-=
5.8.8'
> | ./miniperl -Ilib configpm --heavy=3Dlib/Config_heavy.pl lib/Config.pm
> | ./miniperl: error while loading shared libraries: libperl.so: cannot
> open shared object file: No such file or directory
> | make[1]: *** [lib/Config.pod] Error 127
> | make[1]: Leaving directory
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-=
5.8.8'
>=20
> koen@dominion:/OE/build$ !find
> find /OE/angstrom-dev/sysroots/ -name "libperl.so*"
> /OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/perl/5.8.8/CORE/libperl.so
>=20
> I tried doing
>=20
> - -export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
> +export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl/${PV}/CORE/"
>=20
> which didn't help. Any ideas?

Yeah, when we mangle it for $ORIGIN, we just broke how target perl works
since (expanding
$ORIGIN) /OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33=
/perl-5.8.8/../lib/perl/5.8.8/CORE/libperl.so
doesn't exist.  Not sure how to solve this with chrpath, but I know when
we link vs $ORIGIN we 'fix' this by still having a path based link left
in (as the more common problem we run into is "build a util that's not
installed, to build the final util that is installed").

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


