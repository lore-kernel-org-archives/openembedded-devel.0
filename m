Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O69B9-0000M8-Mb
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 23:16:06 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O697b-0007I0-Qr from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 14:12:11 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sun, 25 Apr 2010 14:12:11 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sun, 25 Apr 2010 21:12:10 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Apr 2010 14:12:05 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201004260042.14155.roman@khimov.ru>
References: <1272217739.3865.546.camel@trini-m4400>
	<201004260042.14155.roman@khimov.ru>
Organization: Mentor Graphics Corporation
Date: Sun, 25 Apr 2010 14:12:05 -0700
Message-ID: <1272229925.3865.554.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Apr 2010 21:12:11.0318 (UTC)
	FILETIME=[F8884D60:01CAE4BB]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The coreutils-native race...
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
X-List-Received-Date: Sun, 25 Apr 2010 21:16:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-04-26 at 00:42 +0400, Roman I Khimov wrote:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 25 =
=D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2010 21:48:59 =D0=B0=D0=B2=D1=82=D0=BE=
=D1=80 Tom Rini =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > Right now, with a big enough BB_NUM_THREADS we can get into a race wher=
e
> > coreutils-native is installing programs and elsewhere we are in a
> > do_fetch and either trying to use 'cp' or 'md5sum', and blam, we try an=
d
> > invoke the program while it's being installed (and see things like
> > sh: /path/to/staging/i686-linux/usr/bin/cp: Textfile is busy).
> >=20
> > There's a few ways out of this:
> > 1) Don't rely on 'cp' and 'md5sum' anymore but use python for it.
>=20
> I guess it couldn't really be done, since those could be invoked from any=
=20
> shell script, right? Although it only is a concern for things before=20
> do_configure, so there shouldn't be many scripts there.

We control (as it's in bbclasses) what's invoked in these tasks that are
allowed to run before do_configure is invoked (the current choke point
the world has on coreutils-native being complete).

> > 2) Make an oe_cp and oe_md5sum to go with oe_sha256sum
> > 3) IIRC, the big part of coreutils-native was a fully functional,
> > always, 'install'.  We could just copy the install we build or provide
> > an install wrapper (oe_install) or so
>=20
> We've had install-native, but that was some broken dusty script that act =
like=20
> a detonator - you build some package having it in DEPENDS (not many had, =
but I=20
> was lucky enough) and boom! random packages brake randomly in do_install=20
> because of disfunctional install.

True, but we could just as easily replace coreutils-native with
oeinstall-native in base.bbclass.

> I've proposed back then to just drop it. But there've been a concern that=
 for=20
> reliable builds it's better to be sure that we have known proper install =
and=20
> that is provided by coreutils along with many other things, which are als=
o=20
> good to have in some known good state for an OS-independent build system.
>=20
> This is the way we've got to the point of having coreutils-native in all =
of=20
> our builds.

I think I forgot #5
5) Make coreutils-native:do_populate_sysroot (or whatever fully staged
means at this point) before anything else is really allowed to go on.

> Although, as I'm personally building my things on sane GNU hosts with san=
e=20
> coreutils with known nice install, I've always had coreutils-native in=20
> ASSUME_PROVIDED. Thus, not seeing any failures with usual 4 bb threads.

This rarely happens with 4 threads here and is much more often at 6 or 8
threads.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


