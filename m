Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OD4vi-0003oQ-0d
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 02:08:35 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OD4rr-00037C-RP from Tom_Rini@mentor.com ;
	Fri, 14 May 2010 17:04:36 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 14 May 2010 17:04:32 -0700
Received: from 172.30.80.61 ([172.30.80.61]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sat, 15 May 2010 00:04:30 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	14 May 2010 17:04:25 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimDt7fVT14jNofov1ESwO2M_CvBAe6RsdvzZicE@mail.gmail.com>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
	<1273859746.22943.454.camel@trini-m4400>
	<AANLkTimDt7fVT14jNofov1ESwO2M_CvBAe6RsdvzZicE@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Fri, 14 May 2010 17:04:25 -0700
Message-ID: <1273881865.8005.205.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 15 May 2010 00:04:32.0585 (UTC)
	FILETIME=[3241AB90:01CAF3C2]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Sat, 15 May 2010 00:08:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-05-14 at 23:21 +0200, Andrea Adami wrote:=20
> > With DISTRO=3D ?  I do most of my builds with 4 and haven't seen this.
> > But with a failure log on gtk+-native, figuring out the missing dep
> > shouldn't be too bad.
>=20
> FWIW distro is Angstrom, devel branch.
>=20
> DEPENDS_virtclass-native =3D "libpng-native atk-native pango-native
> cairo-native libxrender-native libxext-native"
>=20
> It's not a problem of missing deps, I suppose, because
>=20
> PARALLEL_MAKE =3D "-j5"
> #BB_NUMBER_THREADS =3D "4"
> BB_NUMBER_THREADS =3D "2"
> fixed the things. This time the dependencies were (correctly) built befor=
e.

Right.  Lower number of threads means less stuff going on at once.  I've
seen a lot of dep issues that only show up once you have a lot of
threads, or have packaged staging (which then marks off a lot of things
in the dep graph).

> Short resume:
>=20
> i repeatdly see (Angstrom) console-image failing *from scratch*
> because gtk+native do_compile errors out with:
>=20
>  Cannot load module
> /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules=
/input/im-xim.la:
> /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/mo
> dules/input/.libs/im-xim.so: undefined symbol: g_realloc_n
> | /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modul=
es/input/im-xim.la
> does not export GTK+ IM module API:
> /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0
>=20
> g_realloc_n is defined in glib-2.0
>=20
> I've inspected the workdir and I've noticed  "atk-native"  and
> "pango-native" builds were not finished when gtk+-native broke.
> Both atk-native and pango-native (and cairo-native, which was built)
> have glib-2 as explicit dependency, so something seems wrong...

So, it really sounds like a bitbake bug.  Doing a bitbake -e on gtk
+-native gives:
DEPENDS_virtclass-native=3D"autoconf-native automake-native libtool-native
gnu-config-native coreutils-native libpng-native atk-native pango-native
cairo-native libxrender-native libxext-native"
DEPENDS=3D"autoconf-native automake-native libtool-native
gnu-config-native coreutils-native libpng-native atk-native pango-native
cairo-native libxrender-native libxext-native"

So it's supposed to be waiting on all of that stuff, but it's not.  And
I'm sure RP will need to know what version of bitbake you're using.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


