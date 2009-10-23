Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N1SgM-0003oV-Fv
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 00:32:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 7EEE7140972F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 00:27:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpqfCJhPaeAN
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 00:27:45 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 319A1140972E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 00:27:44 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200910231334.13581.holger+oe@freyther.de>
References: <200910230504.57681.holger+oe@freyther.de>
	<hbru1e$m80$1@ger.gmane.org> <1256296026.9503.26.camel@hammer.suse.cz>
	<200910231334.13581.holger+oe@freyther.de>
Date: Sat, 24 Oct 2009 00:31:24 +0200
Message-Id: <1256337084.9460.9.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
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
X-List-Received-Date: Fri, 23 Oct 2009 22:32:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Holger Hans Peter Freyther wrote:
> On Friday 23 October 2009 13:07:06 Stanislav Brabec wrote:

> > I think that the logic should be:
> >=20
> > libfoo.a exists and libfoo.so exists =3D> put .a to -static.
> >=20
> > libfoo.a exists and libfoo.so does not exist =3D> put .a to -dev.
> >=20
> > This logic will work as most users expect and will need no exception =
for
> > glibc.
>=20
> This will add even more python code to package.bbclass and can not be r=
ealized=20
> with a FILES_* change. I would prefer a stupid QA check for that as I d=
on't=20
> expect this to happen on many packages.

That it will happen for all packages that don't provide shared library.
These packages may end by broken -dev package with just the
*.a =3D> -static rule.

I am not sure, how many such packages exist in the tree, but here is a
list of files=EF=BB=BF in my work directory that would need special care:

alsa-oss-1.0.17-r0: /usr/lib/libossredir.a
binutils-2.18-r8.1: /usr/lib/libiberty.a
bison-2.3-r0: /usr/lib/liby.a
bridge-utils-1.4-r0: /usr/lib/libbridge.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libnss.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libnssutil.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libunicharutil_ext=
ernal_s.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libembed_base_stan=
dalone.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libsoftokn.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libssl.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libembed_base_s.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libcrmf.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libsmime.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libxpcomglue_s.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libmozreg_s.a
firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libxpcomglue.a
flex-2.5.31-r4: /usr/lib/libfl.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/lib64/libiberty.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnue=
abi/lib/libgfortran.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnue=
abi/lib/libssp.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnue=
abi/lib/libiberty.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnue=
abi/lib/libstdc++_pic.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnue=
abi/lib/libssp_nonshared.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnue=
abi/lib/libsupc++.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnue=
abi/lib/libstdc++.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/lib/gcc/arm-angstrom-li=
nux-gnueabi/4.3.3/libgcc.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/lib/gcc/arm-angstrom-li=
nux-gnueabi/4.3.3/libgcc_eh.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/lib/gcc/arm-angstrom-li=
nux-gnueabi/4.3.3/libgfortranbegin.a
gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/lib/gcc/arm-angstrom-li=
nux-gnueabi/4.3.3/libgcov.a
gcc-4.3.3-r7.1: /usr/lib/libstdc++_pic.a
gcc-4.3.3-r7.1: /usr/lib/libssp_nonshared.a
gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcc.a
gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcc_eh.a
gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgfortran=
begin.a
gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcov.a
gcc-4.3.3-r7.1: /usr/lib/libsupc++.a
gdb-7.0-r0: /usr/lib/libbfd.a
gdb-7.0-r0: /usr/lib/libopcodes.a
gdb-7.0-r0: /usr/lib/libiberty.a
glibc-2.9-r35.2: /usr/lib/libc_nonshared.a
glibc-2.9-r35.2: /usr/lib/libmcheck.a
glibc-2.9-r35.2: /usr/lib/libg.a
glibc-2.9-r35.2: /usr/lib/libbsd-compat.a
glibc-2.9-r35.2: /usr/lib/libieee.a
glibc-2.9-r35.2: /usr/lib/libpthread_nonshared.a
libassuan-0.6.9-r0: /usr/lib/libassuan.a
libatomics-ops-1.2-r2: /usr/lib/libatomic_ops_gpl.a
libatomics-ops-1.2-r2: /usr/lib/libatomic_ops.a
libsdl-x11-1.2.11-r8: /usr/lib/libSDLmain.a
mysql-4.1.22-r3: /usr/lib/libmysys.a
mysql-4.1.22-r3: /usr/lib/libdbug.a
mysql-4.1.22-r3: /usr/lib/libvio.a
mysql-4.1.22-r3: /usr/lib/libheap.a
mysql-4.1.22-r3: /usr/lib/libmerge.a
mysql-4.1.22-r3: /usr/lib/libnisam.a
mysql-4.1.22-r3: /usr/lib/libmysqld.a
mysql-4.1.22-r3: /usr/lib/libmyisam.a
mysql-4.1.22-r3: /usr/lib/libmyisammrg.a
mysql-4.1.22-r3: /usr/lib/libmystrings.a
orbit2-2.14.17-r0: /usr/lib/libname-server-2.a
perl-5.8.8-r28: /usr/lib/perl/5.8.8/auto/DynaLoader/DynaLoader.a
python-2.6.1-ml8.0: /usr/lib/python2.6/config/libpython2.6.a
tcl-8.4.19-r2: /usr/lib/libtclstub8.4.a
tk-8.4.19-r0: /usr/lib/libtkstub8.4.a
tcl-native-8.4.19-r2: /OE/build/tmp/staging/x86_64-linux/usr/lib/libtclst=
ub8.4.a
tk-native-8.4.19-r0: /OE/build/tmp/staging/x86_64-linux/usr/lib/libtkstub=
8.4.a

=EF=BB=BFFound by this bash command:
find */*/image -name '*.a' | fgrep -v .debug | while read ; do if ! test =
-f "${REPLY%.a}.so" ; then PKG=3D$REPLY ; PKG=3D${PKG#*/} ; PKG=3D${PKG%%=
/*} ; echo $PKG: ${REPLY#*/image} ; fi ; done


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



