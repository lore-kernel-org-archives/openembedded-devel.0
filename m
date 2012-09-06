Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T9djr-0000ij-D7
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 17:11:27 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T9dXs-0005XM-Uz
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 16:59:05 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 06 Sep 2012 15:59:03 +0100
In-Reply-To: <5048B901.3060103@communistcode.co.uk>
References: <5048B901.3060103@communistcode.co.uk>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346943545.2673.198.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 15:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-06 at 15:53 +0100, Jack Mitchell wrote:
> I'm failing to be able to build tinyXML which it seems is required for=
=20
> XBMC after it was dropped from their internal tree. The package just has=
=20
> a Makefile and all in all seems a bit sketchy at best. Has anyone come=
=20
> across an error like this before:
>=20
>     DEBUG: Executing shell function do_compile
>     NOTE: make -j 7 -e MAKEFLAGS=3D
>     arm-poky-linux-gnueabi-ld
>     --sysroot=3D/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/rasp=
berrypi
>     -o xmltest -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed tinyxml.o
>     tinyxmlparser.o xmltest.o tinyxmlerror.o tinystr.o
>     arm-poky-linux-gnueabi-ld: unrecognized option '-Wl,-O1'
>     arm-poky-linux-gnueabi-ld: use the --help option for usage informatio=
n
>     make: *** [xmltest] Error 1

It's using ${LD} where it should be using ${CCLD}.  This is, admittedly,
confusing since one would tend to na=C3=AFvely assume that ${LDFLAGS} is
intended for consumption by ${LD} but that is not in fact the case.

I'm not actually sure that there are any places where ${LD} is the right
thing to use.  Maybe that variable should be deleted.

p.




