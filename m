Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmrL9-0008S6-Bm
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 17:22:31 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmrIM-0002Fg-NQ from Tom_Rini@mentor.com ;
	Wed, 03 Mar 2010 08:19:34 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 3 Mar 2010 08:19:34 -0800
Received: from 172.30.80.138 ([172.30.80.138]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed,  3 Mar 2010 16:19:27 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	03 Mar 2010 09:19:25 -0700
From: Tom Rini <tom_rini@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <1267630481.4739.331.camel@trini-m4400>
References: <E1NmW1P-0001Ed-Un@melo.openembedded.org>
	<20100303092557.GK3206@jama>  <1267630481.4739.331.camel@trini-m4400>
Organization: Mentor Graphics Corporation
Date: Wed, 03 Mar 2010 09:19:25 -0700
Message-ID: <1267633165.4739.335.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 03 Mar 2010 16:19:34.0076 (UTC)
	FILETIME=[4FB507C0:01CABAED]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Tom Rini : qemu: Perform our sanity checks based on ENABLE_BINARY_LOCALE_GENERATION
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
X-List-Received-Date: Wed, 03 Mar 2010 16:22:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-03 at 08:34 -0700, Tom Rini wrote:
> On Wed, 2010-03-03 at 10:25 +0100, Martin Jansa wrote:
> > On Tue, Mar 02, 2010 at 05:36:39PM +0000, git version control wrote:
> > > Module: openembedded.git
> > > Branch: org.openembedded.dev
> > > Commit: 31e93854259130e20a4e08c9d803c34edc4b447e
> > > URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D31e93854259130e20a4e08c9d803c34edc4b447e
> > >=20
> > > Author: Tom Rini <tom_rini@mentor.com>
> > > Date:   Mon Mar  1 11:18:28 2010 +0000
> > >=20
> > > qemu: Perform our sanity checks based on ENABLE_BINARY_LOCALE_GENERAT=
ION
> > >=20
> > >  		if "qemu-native" in assume_provided:
> > > -			if not check_app_exists("qemu-arm", e.data):
> > > -				messages =3D messages + "qemu-native was in ASSUME_PROVIDED but =
the QEMU binaries (qemu-arm) can't be found in PATH"
> > > +			required_utilities +=3D "qemu"
> >=20
> > Hi,
> >=20
> > You need space before qemu, because it's hard to find following missing
> > utilities: md5sumqemu :).
>=20
> Oops.
>=20
> > Also I'm not really happy from qemu-arm -> qemu change, as my qemu-kvm
> > built in gentoo with USE flags only for what I need
> >=20
> > USE=3D"aio -alsa -bluetooth -curl -esd -fdt -gnutls -hardened -kvm-trac=
e -ncurses -pulseaudio -qemu-ifup% -sasl -sdl -static -vde"
> > QEMU_SOFTMMU_TARGETS=3D"arm -cris -i386 -m68k -microblaze -mips -mips64=
 -mips64el -mipsel -ppc -ppc64 -ppcemb -sh4 -sh4eb -sparc -sparc64 -x86_64"
> > QEMU_USER_TARGETS=3D"arm armeb -alpha -cris -i386 -m68k -microblaze -mi=
ps -mipsel -ppc -ppc64 -ppc64abi32 -sh4 -sh4eb -sparc -sparc32plus -sparc64=
 -x86_64"
> >=20
> > then qemu binary is not built, but qemu-arm which AFAIK is used for=20
> > binary locale generation is available.
>=20
> Ah, I figured that a 'qemu' was always built, since what we need is a
> test that works for your usecase, except you care about powerpc (or mips
> or ...).

So after a little irc'ing we've got an idea I'm testing and then will
post for comments.  glibc/eglibc-package.bbclass have logic to go from
TARGET_ARCH to qemu-%s.  I've modified that a bit more to spit out
qemu-whatever (which is what they all wanted), and moved the gcc version
check as well into qemu.bbclass.  I'm doing a couple of builds now to
make sure I didn't break the uses qemu logic and then I'll make sure the
assume provided stuff works, and post.  Sorry / Thanks all!


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


