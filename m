Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QBBIx-0002V0-N4
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 21:37:15 +0200
Received: from [10.10.20.100] (95.249.56.93) by smtp203.alice.it (8.5.124.08)
	(authenticated as editempo@alice.it)
	id 4C1A2A96088A7E4E for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 21:34:57 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302956885.8709.69.camel@mattotaupa>
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
	<1302900059.3534.1.camel@gnutoo-desktop>
	<1302956885.8709.69.camel@mattotaupa>
Date: Sat, 16 Apr 2011 21:34:55 +0200
Message-ID: <1302982495.4189.1.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] firefox: Added libIDL-2.0 CFLAGS and LIBS
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
X-List-Received-Date: Sat, 16 Apr 2011 19:37:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: Quoted-Printable

On Sat, 2011-04-16 at 14:28 +0200, Paul Menzel wrote:
> Am Freitag, den 15.04.2011, 22:40 +0200 schrieb Denis 'GNUtoo' Carikli:
> > On Fri, 2011-04-15 at 18:42 +0200, Patrik Dahlstr=C3=B6m wrote:
> > > * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
> > >   patch sets the appropriate flags in autoconf.mk.in for
> > >   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
> > What error did you get?
> > Maybe you could add something like:
> >  This patch fixes the following error:
> >  [ERROR here]
> > To the commit message.
>=20
> I get the following error message.
>=20
>         make[7]: Entering directory `/oe/build-minimal-eglibc/minimal-d=
ev/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/xpcom/type=
lib/xpidl'
>         xpidl.c
>         gcc -o host_xpidl.o -c -isystem/oe/build-minimal-eglibc/minimal=
-dev/sysroots/i686-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=3D\=
"md/_linux.cfg\"  -I. -I. -I../../..
>         /dist/include -I../../../dist/include/nsprpub  -I/oe/build-mini=
mal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozi=
lla-1.9.2/dist/include/nspr -I/hom
>         e/paul/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux=
-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/oe/build=
-minimal-eglibc/minimal-dev/work/a
>         rmv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/incl=
ude/nspr xpidl.c
>        =20
>         In file included from xpidl.c:42:
>         xpidl.h:49:18: error: glib.h: No such file or directory
I think I had the same error while trying to cross-compile firefox(I
remember some glib.h) ...

Thanks a lot for the patch.

Denis.




