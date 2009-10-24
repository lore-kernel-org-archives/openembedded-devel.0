Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N1hOC-0006gF-4h
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 16:14:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 6ACE11416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 16:10:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zfi1SRgCZ4Yy
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 16:10:01 +0200 (CEST)
Received: from zaurus (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id A07F81416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 16:10:00 +0200 (CEST)
Date: Sat, 24 Oct 2009 16:13:43 +0200
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1256390835.4307.0@zaurus> (from utx@penguin.cz on Sat Oct 24
	15:27:15 2009)
X-Mailer: Balsa 2.4.1
Message-Id: <1256393623.4307.1@zaurus>
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
X-List-Received-Date: Sat, 24 Oct 2009 14:14:43 -0000
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stanislav Brabec wrote:

> FILES_${PN}-static =3D "" is not fully correct general solution. There
> are projects, that have more static libraries. Only listed static
> libraries must go to -dev, the rest may go to -static. A good
> example is libsdl-x11. Only libSDLmain.a must go to -dev, the rest
SDL is not a good example, orbit2 is a better example.

Being able to write ${PN}-dev +=3D "${libdir}/libfoo.a" instead of =20
overwriting of
${PN}-static with a negative expression would be more comfortable. I =20
guess that it depends only on the order of evaluation in the bbclass =20
file.

The QA test should be:
libfoo.a is in -static but libfoo.so does not exist =3D> issue fatal QA =20
error with
proposed fix: move libfoo.a e. g. to -dev.

Note that libgcc.a has to go to the main package. Even -dev is not =20
correct here.

Here is a new bash command and its output:

utx@/OE/build/tmp/work> find */*/image -name '*.a' | fgrep -v .debug | =20
while read ; do if ! test -f "${REPLY%.a}.so" ; then PKG=3D$REPLY ; =20
PKG=3D${PKG#*/} ; PKG=3D${PKG%%/*} ; echo
$PKG ; fi ; done | uniq -c | while read COUNT PKG ; do XCOUNT=3D$(find =20
*/$PKG/image -name '*.a' | fgrep -v .debug | wc -l) ; echo -n $PKG: =20
$XCOUNT static total, $COUNT static unique ; if test $COUNT -eq $XCOUNT =20
; then echo ' =3D> can use simple expression' ; else echo ' =3D> needs =20
complex expression' ; fi ; done
alsa-oss-1.0.17-r0: 3 static total, 1 static unique =3D> needs complex =20
expression
binutils-2.18-r8.1: 3 static total, 1 static unique =3D> needs complex =20
expression
bison-2.3-r0: 1 static total, 1 static unique =3D> can use simple =20
expression
bridge-utils-1.4-r0: 1 static total, 1 static unique =3D> can use simple =20
expression
firefox-3.5.2-r2: 12 static total, 12 static unique =3D> can use simple =20
expression
flex-2.5.31-r4: 1 static total, 1 static unique =3D> can use simple =20
expression
gcc-cross-4.3.3-r7.1: 12 static total, 12 static unique =3D> can use =20
simple expression
gcc-4.3.3-r7.1: 10 static total, 7 static unique =3D> needs complex =20
expression
gdb-7.0-r0: 3 static total, 3 static unique =3D> can use simple expression
glibc-2.9-r35.2: 17 static total, 6 static unique =3D> needs complex =20
expression
libassuan-0.6.9-r0: 1 static total, 1 static unique =3D> can use simple =20
expression
libatomics-ops-1.2-r2: 2 static total, 2 static unique =3D> can use =20
simple expression
libsdl-x11-1.2.11-r8: 1 static total, 1 static unique =3D> can use simple =20
expression
mysql-4.1.22-r3: 11 static total, 10 static unique =3D> needs complex =20
expression
orbit2-2.14.17-r0: 5 static total, 1 static unique =3D> needs complex =20
expression
perl-5.8.8-r28: 1 static total, 1 static unique =3D> can use simple =20
expression
python-2.6.1-ml8.0: 1 static total, 1 static unique =3D> can use simple =20
expression
tcl-8.4.19-r2: 1 static total, 1 static unique =3D> can use simple =20
expression
tk-8.4.19-r0: 1 static total, 1 static unique =3D> can use simple =20
expression
tcl-native-8.4.19-r2: 1 static total, 1 static unique =3D> can use simple =20
expression
tk-native-8.4.19-r0: 1 static total, 1 static unique =3D> can use simple =20
expression

The simple expression can be .../*.a in -dev (or -sdk or so) or =20
emptying of -static.

gcc may need special care and double thinking. But I guess that the =20
logic: "Do you want to compile static binaries? Install gcc-static." is =20
valid here as well.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus


