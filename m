Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N1ij0-0006d3-SD
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 17:40:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 445341416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 17:35:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWBnhIfaXCwR
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 17:35:36 +0200 (CEST)
Received: from zaurus (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id F3BAF1416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 17:35:35 +0200 (CEST)
Date: Sat, 24 Oct 2009 17:39:17 +0200
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1256393164.15214.46.camel@lenovo.internal.reciva.com> (from
	philb@gnu.org on Sat Oct 24 16:06:04 2009)
X-Mailer: Balsa 2.4.1
Message-Id: <1256398757.4681.0@zaurus>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 15:40:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote:
> On Sat, 2009-10-24 at 10:48 +0200, Koen Kooi wrote:
> > On 24-10-09 00:31, Stanislav Brabec wrote:

> > > binutils-2.18-r8.1: /usr/lib/libiberty.a
>=20
> I'm not convinced you really want to be shipping libiberty at all.
> Every project that uses this library tends to bundle a local copy in
> with its source code.

Probaby agree. One instance of libibery per distro with header still
can exist.

> > > bison-2.3-r0: /usr/lib/liby.a
>=20
> That one is a special case: it wants to stay in the main bison
> package,
> since bison itself is a development tool.  I'm not sure why it is a
> static-only library; that might be an error.

It's OK. Ultra small shared libraries with one or two functions don't
make sense.

> > > bridge-utils-1.4-r0: /usr/lib/libbridge.a
>=20
> I think this is an internal convenience library, not intended for
> external use.  Debian doesn't seem to package it at all and I suspect
> OE
> probably shouldn't either.

There shoud be another generic rule: No .h files for the library =3D>
don't package the library.

libbridge.h is available =3D> it's OK to have libbridge. I cannot
decide whether it is useful without a knowledge of the package.

> > > flex-2.5.31-r4: /usr/lib/libfl.a
>=20
> This is like bison.

Yes, again an ultra small library.
=20
> > > gcc-4.3.3-r7.1: /usr/lib/libstdc++_pic.a
> > > gcc-4.3.3-r7.1: /usr/lib/libssp_nonshared.a
>=20
> Those are probably special.  I'm not quite sure what the deal is with
> libstdc++_pic, that would need some further investigation.

_pic.a is a convenient name for static libraries, if their contents may
be linked into a shared library (i. e. they are compiled with -fPIC).
=20
> > > gdb-7.0-r0: /usr/lib/libbfd.a
> > > gdb-7.0-r0: /usr/lib/libopcodes.a
> > > gdb-7.0-r0: /usr/lib/libiberty.a
>=20
> As for libiberty above.

Yes.

> > > glibc-2.9-r35.2: /usr/lib/libc_nonshared.a
> > > glibc-2.9-r35.2: /usr/lib/libmcheck.a
> > > glibc-2.9-r35.2: /usr/lib/libg.a
> > > glibc-2.9-r35.2: /usr/lib/libbsd-compat.a
> > > glibc-2.9-r35.2: /usr/lib/libieee.a
> > > glibc-2.9-r35.2: /usr/lib/libpthread_nonshared.a
>=20
> The nonshared ones are special.  The others belong in the -static
> package.

No for libpthread_nonshared.a. pthread_atfork is defined only here.

No for libmcheck.a. It is required for -mcheck*.

I am not sure for others. Some of them are dummy, but compiler may want
it. I guess we are on the safe side keeping all these in the main
package.

> > > mysql-4.1.22-r3: /usr/lib/libmysys.a
> > > mysql-4.1.22-r3: /usr/lib/libdbug.a
> > > mysql-4.1.22-r3: /usr/lib/libvio.a
> > > mysql-4.1.22-r3: /usr/lib/libheap.a
> > > mysql-4.1.22-r3: /usr/lib/libmerge.a
> > > mysql-4.1.22-r3: /usr/lib/libnisam.a
> > > mysql-4.1.22-r3: /usr/lib/libmysqld.a
> > > mysql-4.1.22-r3: /usr/lib/libmyisam.a
> > > mysql-4.1.22-r3: /usr/lib/libmyisammrg.a
> > > mysql-4.1.22-r3: /usr/lib/libmystrings.a
>=20
> I think those are all internal convenience libraries and should
> probably
> not be packaged.

I don't know mysql in deep. But if it has correspondent headers
installed, somebody may consider it useful.


But There are many really obsolete .a files:

All libraries intended for load by ltdl, gmodule etc.

Static instances of dynamic modules have absolutely no use and may be=20
silently deleted in the recipe.

It includes: GTK+ theme engines, input methods, pixbuf renderers and
a lot of other stuff.

Upstream does not do so, because libtool is not so flexible to create
static libraries only for part of the package.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx



