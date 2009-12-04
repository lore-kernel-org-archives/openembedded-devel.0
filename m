Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Phil.Black@hillcrestlabs.com>) id 1NGaAK-0002x4-N2
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 16:33:55 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-ae-4b1927f652fe
From: Phil Black <phil.black@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1259880334.25344.7.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1259880334.25344.7.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Fri, 04 Dec 2009 10:17:08 -0500
Message-Id: <1259939828.4859.1456.camel@pblack-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Phil.Black@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [abiword] CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/freetype2
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
X-List-Received-Date: Fri, 04 Dec 2009 15:33:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I believe this is more an indication of a problem with the abiword
package.  My understanding is OE applies a patch to the cross compiler
so that if '/usr/include' (or some sub dir thereof) is ever included the
compile will fail.  This is to protect host (the system you are building
on) include files from contaminating cross-compiled programs.=20

The fix may be as simple as making sure freetype2 is built before ABI
word (added freetype2 to the DEPENDS list).
-Phil

On Thu, 2009-12-03 at 23:45 +0100, Paul Menzel wrote:
> Dear OpenEmbedded hackers,
>=20
>=20
> I ran `bitbake beagleboard-demo-image` and got the following error. I am
> using HEAD 7303994323260b1190486655b694397b3a8a7272.
>=20
>         $ bitbake beagleboard-demo-image
>         [=E2=80=A6]
>         ERROR: function do_compile failed
>         ERROR: see log in /srv/oe/angstrom-dev/work/armv7a-angstrom-linux=
-gnueabi/abiword-2.8.1-r2/temp/log.do_compile.13680
>         NOTE: Task failed: /srv/oe/angstrom-dev/work/armv7a-angstrom-linu=
x-gnueabi/abiword-2.8.1-r2/temp/log.do_compile.13680
>         ERROR: TaskFailed event exception, aborting
>         ERROR: Build of /srv/oe/openembedded/recipes/abiword/abiword_2.8.=
1.bb do_compile failed
>         NOTE: Running task 10113 of 10150 (ID: 19, /srv/oe/openembedded/r=
ecipes/images/beagleboard-demo-image.bb, do_package_write_ipk)
>         NOTE: Running task 10114 of 10150 (ID: 12, /srv/oe/openembedded/r=
ecipes/images/beagleboard-demo-image.bb, do_qa_staging)
>         ERROR: Task 3406 (/srv/oe/openembedded/recipes/abiword/abiword_2.=
8.1.bb, do_compile) failed
>         NOTE: Waiting for 3 active tasks to finish
>         NOTE: 1: /srv/oe/openembedded/recipes/images/beagleboard-demo-ima=
ge.bb, do_qa_staging (6766)
>         NOTE: 2: /srv/oe/openembedded/recipes/opkg/opkg-native_svn.bb, do=
_configure (5978)
>         NOTE: 3: /srv/oe/openembedded/recipes/images/beagleboard-demo-ima=
ge.bb, do_package_write_ipk (6719)
>         NOTE: Waiting for 2 active tasks to finish
>         NOTE: 1: /srv/oe/openembedded/recipes/images/beagleboard-demo-ima=
ge.bb, do_qa_staging (6766)
>         NOTE: 2: /srv/oe/openembedded/recipes/opkg/opkg-native_svn.bb, do=
_configure (5978)
>         NOTE: Waiting for 1 active tasks to finish
>         NOTE: 1: /srv/oe/openembedded/recipes/opkg/opkg-native_svn.bb, do=
_configure (5978)
>         NOTE: Tasks Summary: Attempted 10110 tasks of which 9772 didn't n=
eed to be rerun and 1 failed.
>         ERROR: '/srv/oe/openembedded/recipes/abiword/abiword_2.8.1.bb' fa=
iled
>        =20
>         $ more build/conf/local.conf
>         [=E2=80=A6]
>         DISTRO =3D "angstrom-2008.1"
>        =20
>         MACHINE =3D "beagleboard"
>         BUILD_ARCH =3D "i686"
>         BUILD_OS =3D "linux"
>        =20
>         BB_NICE_LEVEL=3D"19"
>        =20
>         $ more oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/abiword=
-2.8.1-r2/temp/log.do_compile.13680
>         [=E2=80=A6]
>         Making all in xp
>         make[4]: Entering directory `/srv/oe/angstrom-dev/work/armv7a-ang=
strom-linux-gnueabi/abiword-2.8.1-r2/abiword-2.8.1/plugins/wmf/xp'
>         /bin/sh ../../../arm-angstrom-linux-gnueabi-libtool --tag=3DCXX  =
 --mode=3Dcompile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3D=
cortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -DHAVE_CONFIG_H -I. -I../../.. =
 -I/usr/include/freetype2 -I/usr/include -pthread -I/srv/oe/angstrom-dev/st=
aging/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/srv/oe/angstrom=
-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include   -pthr=
ead -DORBIT2=3D1 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnuea=
bi/usr/include/fribidi -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux=
-gnueabi/usr/include/glib-2.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstro=
m-linux-gnueabi/usr/lib/glib-2.0/include -I/srv/oe/angstrom-dev/staging/arm=
v7a-angstrom-linux-gnueabi/usr/include/libgsf-1 -I/srv/oe/angstrom-dev/stag=
ing/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 -I/srv/oe/angstrom-de=
v/staging/armv7a-angstrom-linux-gnueabi/usr/include/wv -I/srv/oe/angstrom-d=
ev/staging/armv7a-angstrom-linux-gnueabi/usr/include/enchant -I/srv/oe/angs=
trom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/gnome-vfs-2.0 -I=
/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/gnome-vf=
s-2.0/include -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/=
usr/include/gconf/2 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gn=
ueabi/usr/include/orbit-2.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-=
linux-gnueabi/usr/include/dbus-1.0 -I/srv/oe/angstrom-dev/staging/armv7a-an=
gstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/srv/oe/angstrom-dev/stagin=
g/armv7a-angstrom-linux-gnueabi/usr/include/libbonobo-2.0 -I/srv/oe/angstro=
m-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/bonobo-activation-2=
.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include=
/libgoffice-0.8 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueab=
i/usr/include/gtk-2.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-=
gnueabi/usr/include/libglade-2.0 -I/srv/oe/angstrom-dev/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/cairo -I/srv/oe/angstrom-dev/staging/armv7a-=
angstrom-linux-gnueabi/usr/include/pango-1.0 -I/srv/oe/angstrom-dev/staging=
/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include -I/srv/oe/angstrom-d=
ev/staging/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0 -I/srv/oe/angs=
trom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1 -I/srv/=
oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/freetype2=
 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/l=
ibpng12 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/in=
clude/gtk-unix-print-2.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-lin=
ux-gnueabi/usr/include/librsvg-2   -I../../..  -I../../../src/af/ev/gtk -I.=
./../../src/af/ev/xp -I../../../src/af/gr/gtk -I../../../src/af/gr/xp -I../=
../../src/af/util/unix -I../../../src/af/util/xp -I../../../src/af/xap/gtk =
-I../../../src/af/xap/xp -I../../../src/text/fmt/gtk -I../../../src/text/fm=
t/xp -I../../../src/text/ptbl/xp -I../../../src/wp/impexp/gtk -I../../../sr=
c/wp/impexp/xp -I../../../src/wp/ap/gtk -I../../../src/wp/ap/xp -I../../../=
src/plugins -DABI_DLL -DABI_BUILD_VERSION=3D\"2.8.1\" -isystem/srv/oe/angst=
rom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include -Wall -Wextra -Ws=
ign-compare -Wpointer-arith -Wchar-subscripts -Wwrite-strings -Wmissing-nor=
eturn -Wunused -Wpointer-arith -Wshadow  -isystem/srv/oe/angstrom-dev/stagi=
ng/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fre=
name-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-in=
lines-hidden -MT ie_impGraphic_WMF.lo -MD -MP -MF .deps/ie_impGraphic_WMF.T=
po -c -o ie_impGraphic_WMF.lo ie_impGraphic_WMF.cpp
>         arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-=
gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp -DHAVE_CONFIG_H -I. -I../../.. -I/usr/include/freetype2 -I/usr/inclu=
de -pthread -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/us=
r/include/glib-2.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnu=
eabi/usr/lib/glib-2.0/include -pthread -DORBIT2=3D1 -I/srv/oe/angstrom-dev/=
staging/armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I/srv/oe/angstro=
m-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/srv/oe/=
angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include=
 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/l=
ibgsf-1 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/in=
clude/libxml2 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/=
usr/include/wv -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi=
/usr/include/enchant -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-g=
nueabi/usr/include/gnome-vfs-2.0 -I/srv/oe/angstrom-dev/staging/armv7a-angs=
trom-linux-gnueabi/usr/lib/gnome-vfs-2.0/include -I/srv/oe/angstrom-dev/sta=
ging/armv7a-angstrom-linux-gnueabi/usr/include/gconf/2 -I/srv/oe/angstrom-d=
ev/staging/armv7a-angstrom-linux-gnueabi/usr/include/orbit-2.0 -I/srv/oe/an=
gstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/sr=
v/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/in=
clude -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/incl=
ude/libbonobo-2.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnue=
abi/usr/include/bonobo-activation-2.0 -I/srv/oe/angstrom-dev/staging/armv7a=
-angstrom-linux-gnueabi/usr/include/libgoffice-0.8 -I/srv/oe/angstrom-dev/s=
taging/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0 -I/srv/oe/angstrom=
-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/libglade-2.0 -I/srv/=
oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/cairo -I/=
srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/pango=
-1.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/g=
tk-2.0/include -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi=
/usr/include/atk-1.0 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-g=
nueabi/usr/include/pixman-1 -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-=
linux-gnueabi/usr/include/freetype2 -I/srv/oe/angstrom-dev/staging/armv7a-a=
ngstrom-linux-gnueabi/usr/include/libpng12 -I/srv/oe/angstrom-dev/staging/a=
rmv7a-angstrom-linux-gnueabi/usr/include/gtk-unix-print-2.0 -I/srv/oe/angst=
rom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/librsvg-2 -I../..=
/.. -I../../../src/af/ev/gtk -I../../../src/af/ev/xp -I../../../src/af/gr/g=
tk -I../../../src/af/gr/xp -I../../../src/af/util/unix -I../../../src/af/ut=
il/xp -I../../../src/af/xap/gtk -I../../../src/af/xap/xp -I../../../src/tex=
t/fmt/gtk -I../../../src/text/fmt/xp -I../../../src/text/ptbl/xp -I../../..=
/src/wp/impexp/gtk -I../../../src/wp/impexp/xp -I../../../src/wp/ap/gtk -I.=
./../../src/wp/ap/xp -I../../../src/plugins -DABI_DLL -DABI_BUILD_VERSION=
=3D\"2.8.1\" -isystem/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnu=
eabi/usr/include -Wall -Wextra -Wsign-compare -Wpointer-arith -Wchar-subscr=
ipts -Wwrite-strings -Wmissing-noreturn -Wunused -Wpointer-arith -Wshadow -=
isystem/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/inclu=
de -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -g=
gdb3 -fpermissive -fvisibility-inlines-hidden -MT ie_impGraphic_WMF.lo -MD =
-MP -MF .deps/ie_impGraphic_WMF.Tpo -c ie_impGraphic_WMF.cpp  -fPIC -DPIC -=
o .libs/ie_impGraphic_WMF.o
>         CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/=
freetype2
>         cc1plus: internal compiler error: in add_path, at c-incpath.c:425
>         Please submit a full bug report,
>         with preprocessed source if appropriate.
>         See <http://gcc.gnu.org/bugs.html> for instructions.
>         make[4]: *** [ie_impGraphic_WMF.lo] Error 1
>         make[4]: Leaving directory `/srv/oe/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/abiword-2.8.1-r2/abiword-2.8.1/plugins/wmf/xp'
>         make[3]: *** [all-recursive] Error 1
>         make[3]: Leaving directory `/srv/oe/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/abiword-2.8.1-r2/abiword-2.8.1/plugins/wmf'
>         make[2]: *** [all-recursive] Error 1
>         make[2]: Leaving directory `/srv/oe/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/abiword-2.8.1-r2/abiword-2.8.1/plugins'
>         make[1]: *** [all-recursive] Error 1
>         make[1]: Leaving directory `/srv/oe/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/abiword-2.8.1-r2/abiword-2.8.1'
>         make: *** [all] Error 2
>         FATAL: oe_runmake failed
>=20
> Do I need to report this to gcc upstream? Can I provide more
> information?
>=20
>=20
> Thanks,
>=20
> Paul=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


