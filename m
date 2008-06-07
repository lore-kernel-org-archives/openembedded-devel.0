Received: from [58.28.4.13] (helo=titania.wxnz.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tkemp@klc.net.nz>) id 1K58LH-0007Qj-IL
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jun 2008 02:01:04 +0200
Received: from [192.168.10.2] (ip-118-90-48-148.xdsl.xnet.co.nz
	[118.90.48.148])
	by titania.wxnz.net (Postfix) with ESMTP id 1FCEE1098BC8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jun 2008 11:54:50 +1200 (NZST)
From: Terry Kemp <tkemp@klc.net.nz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 08 Jun 2008 11:55:57 +1200
Message-Id: <1212882957.7163.12.camel@sulphur.klc>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 (2.22.2-2.fc9) 
Subject: perl native + intltool probs Fedora 9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 08 Jun 2008 00:01:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

intltool-native and others fail on...

checking for XML::Parser... configure: error: XML::Parser perl module is
required for intltool

log follows...
---------------------------------------------------------------------------=
--
automake (GNU automake) 1.10
Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.

Copyright 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is
NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
AUTOV is 1
NOTE: Executing autoreconf --verbose --install --force
--exclude=3Dautopoint
-I /build/OE/gumstix-verdex/build/tmp/angstrom/work/i686-linux/intltool-nat=
ive-0.37.1-r0/intltool-0.37.1/ -I/build/OE/gumstix-verdex/build/tmp/angstro=
m/staging/i686-linux/usr/share/aclocal-1 -I /build/OE/gumstix-verdex/build/=
tmp/angstrom/staging/i686-linux/usr/share/aclocal
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal
-I /build/OE/gumstix-verdex/build/tmp/angstrom/work/i686-linux/intltool-nat=
ive-0.37.1-r0/intltool-0.37.1/ -I /build/OE/gumstix-verdex/build/tmp/angstr=
om/staging/i686-linux/usr/share/aclocal-1 -I /build/OE/gumstix-verdex/build=
/tmp/angstrom/staging/i686-linux/usr/share/aclocal --force=20
autoreconf: configure.in: tracing
autoreconf: configure.in: not using Libtool
autoreconf:
running: /build/OE/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/usr=
/bin/autoconf --include=3D/build/OE/gumstix-verdex/build/tmp/angstrom/work/=
i686-linux/intltool-native-0.37.1-r0/intltool-0.37.1/ --include=3D/build/OE=
/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/usr/share/aclocal-1 -=
-include=3D/build/OE/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/u=
sr/share/aclocal --force --warnings=3Dcross
autoreconf: configure.in: not using Autoheader
autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=3Dcross
automake: unknown warning category `cross'
autoreconf: running: gnu-configize
autoreconf: Leaving directory `.'
NOTE:
Running /build/OE/gumstix-verdex/build/tmp/angstrom/work/i686-linux/intltoo=
l-native-0.37.1-r0/intltool-0.37.1/configure 		    --build=3Di686-linux 		 =
   --host=3Di686-linux 		    --target=3Di686-linux 		    --prefix=3D/build/=
OE/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/usr 		    --exec_pr=
efix=3D/build/OE/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/usr 	=
	    --bindir=3D/build/OE/gumstix-verdex/build/tmp/angstrom/staging/i686-li=
nux/usr/bin 		    --sbindir=3D/build/OE/gumstix-verdex/build/tmp/angstrom/s=
taging/i686-linux/usr/sbin 		    --libexecdir=3D/build/OE/gumstix-verdex/bu=
ild/tmp/angstrom/staging/i686-linux/usr/libexec 		    --datadir=3D/build/OE=
/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/usr/share 		    --sys=
confdir=3D/build/OE/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/et=
c 		    --sharedstatedir=3D/build/OE/gumstix-verdex/build/tmp/angstrom/stag=
ing/i686-linux/usr/com 		    --localstatedir=3D/build/OE/gumstix-verdex/bui=
ld/tmp/angstrom/staging/i686-linux/var 		    --libdir=3D/build/OE/gumstix-v=
erdex/build/tmp/angstrom/staging/i686-linux/usr/lib 		    --includedir=3D/b=
uild/OE/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/usr/include 		=
    --oldincludedir=3D/build/OE/gumstix-verdex/build/tmp/angstrom/staging/i=
686-linux/usr/include 		    --infodir=3D/build/OE/gumstix-verdex/build/tmp/=
angstrom/staging/i686-linux/usr/share/info 		    --mandir=3D/build/OE/gumst=
ix-verdex/build/tmp/angstrom/staging/i686-linux/usr/share/man 			 		    ...
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for perl... /usr/bin/env perl
checking for XML::Parser... configure: error: XML::Parser perl module is
required for intltool
FATAL: oe_runconf failed
-----------------------------------------------------------------

looking at the error output for the test (if `$PERL -e "require
XML::Parser" 2>/dev/null`; then) I found...

perl: symbol lookup
error: /usr/lib/perl5/vendor_perl/5.10.0/i386-linux-thread-multi/auto/XML/P=
arser/Expat/Expat.so: undefined symbol: Perl_Istack_sp_ptr

It should be compiling perl-5.8.8 but its picking up the Fedora 9 host
perl-5.10.0 and staging it...

[tmk@sulphur perl-native-5.8.8-r13]$ cd $OLDPWD
[tmk@sulphur perl5]$ tree
.
|-- 5.10.0
|   `-- i386-linux-thread-multi
|       `-- perllocal.pod
`-- site_perl
    `-- 5.10.0
        |-- Error.pm
        |-- Git.pm
        `-- i386-linux-thread-multi
            `-- auto
                `-- Git

7 directories, 3 files
[tmk@sulphur perl5]$ pwd
/build/OE/gumstix-verdex/build/tmp/angstrom/staging/i686-linux/usr/lib/perl=
5

I am 98% sure this is not happening on an x86_64 build but I do need to
recheck.

I am looking at making a recipe for perl-5.10.0 but this will only mask
the real problem being host inclusion.

pointers?

Thanks

Terry
=20




