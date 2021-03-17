Subject: [meta-oe] [meta-java] openjdk-14 do_configure failed #error #oe
To: openembedded-devel@lists.openembedded.org
From: konstantin.kletschke@inside-m2m.de
X-Originating-Location: Mannheim, Baden-Württemberg, DE (217.91.183.55)
X-Originating-Platform: Unknown Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Mar 2021 05:25:04 -0700
Message-ID: <5wG7.1615983904169009383.LMiQ@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pdZERQiVLSaE4fLsZCIo"

--pdZERQiVLSaE4fLsZCIo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello guys,
I have a core-image-base for a beaglebone black compiled and running, I am=
 very happy with the yocto framework I am trying to get flying in our proje=
ct. On top of my current image I am trying to put a openjre into my image w=
ith the meta-java layer.

In bblayers.conf I added

/home/insidem2m/poky/meta-openembedded/meta-oe

/home/insidem2m/poky/meta-java

and in my local.conf I added

IMAGE_INSTALL_append =3D " e2fsprogs-resize2fs dropbear i2c-tools docker-c=
e openjre-14"

OPENJDK14_BOOT_JDK=3D"/home/insidem2m/buildroot-2021.02-rc3/output/host/us=
r/lib/jvm"

PREFERRED_PROVIDER_virtual/java-initial-native =3D "cacao-initial-native"

PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"

PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"

Nevertheless if I try to pull in openjdk-8, openjre-8 or openjre-14 (from =
the meta-java g0hl1n/jdk14 branch), my build breaks this way:

| AUTOV is 1.16

| NOTE: Executing ACLOCAL=3D"aclocal --system-acdir=3D/home/insidem2m/poky=
/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/recipe-sysroot-nat=
ive/usr/share/aclocal/ --automake-acdir=3D/home/insidem2m/poky/build/tmp/wo=
rk/x86_64-linux/openjdk-14-native/14.0.1-r0/recipe-sysroot-native/usr/share=
/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=3Da=
utopoint --exclude=3Dgtkdocize -I /home/insidem2m/poky/build/tmp/work/x86_6=
4-linux/openjdk-14-native/14.0.1-r0/jdk14u-jdk-14.0.1-ga/make/autoconf/ -I =
/home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r=
0/jdk14u-jdk-14.0.1-ga/make/autoconf/build-aux/

| autoreconf: export WARNINGS=3Dcross,no-obsolete

| autoreconf: Entering directory '.'

| autoreconf: configure.ac: not using Gettext

| autoreconf: running: aclocal --system-acdir=3D/home/insidem2m/poky/build=
/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/recipe-sysroot-native/us=
r/share/aclocal/ --automake-acdir=3D/home/insidem2m/poky/build/tmp/work/x86=
_64-linux/openjdk-14-native/14.0.1-r0/recipe-sysroot-native/usr/share/acloc=
al-1.16 -I /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-nati=
ve/14.0.1-r0/jdk14u-jdk-14.0.1-ga/make/autoconf/ -I /home/insidem2m/poky/bu=
ild/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/jdk14u-jdk-14.0.1-ga/=
make/autoconf/build-aux/ --force

| basics.m4:52: warning: underquoted definition of $1

| basics.m4:52: run info Automake 'Extending aclocal'

| basics.m4:52: or see https://www.gnu.org/software/automake/manual/automa=
ke.html#Extending-aclocal

| Use of uninitialized value $1 in quotemeta at (eval 16) line 470.

| Use of uninitialized value $1 in string at (eval 16) line 470.

| Use of uninitialized value $1 in quotemeta at (eval 16) line 470.

| Use of uninitialized value $1 in string at (eval 16) line 470.

| Use of uninitialized value $1 in quotemeta at (eval 16) line 470.

| Use of uninitialized value $1 in string at (eval 16) line 470.

[...] very much millions of those lines snipped

| Use of uninitialized value $1 in quotemeta at (eval 16) line 470.

| Use of uninitialized value $1 in string at (eval 16) line 470.

| configure.ac:225: warning: AC_CHECK_HEADERS($HEADERS_TO_CHECK): you shou=
ld use literals

| ../autoconf-2.71/lib/autoconf/headers.m4:217: AC_CHECK_HEADERS is expand=
ed from...

| libraries.m4:85: LIB_SETUP_LIBRARIES is expanded from...

| configure.ac:225: the top level

| autoreconf: configure.ac: tracing

| autoreconf: configure.ac: creating directory $TOPDIR/make/autoconf/build=
-aux

| autoreconf: error: cannot create $TOPDIR/make/autoconf/build-aux: No suc=
h file or directory

| autoreconf: configure.ac: not using Libtool

| autoreconf: configure.ac: not using Intltool

| autoreconf: configure.ac: not using Gtkdoc

| autoreconf: running: /home/insidem2m/poky/build/tmp/work/x86_64-linux/op=
enjdk-14-native/14.0.1-r0/recipe-sysroot-native/usr/bin/autoconf --include=
=3D/home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0=
.1-r0/jdk14u-jdk-14.0.1-ga/make/autoconf/ --include=3D/home/insidem2m/poky/=
build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/jdk14u-jdk-14.0.1-g=
a/make/autoconf/build-aux/ --force

| configure.ac:225: warning: AC_CHECK_HEADERS($HEADERS_TO_CHECK): you shou=
ld use literals

| ../autoconf-2.71/lib/autoconf/headers.m4:217: AC_CHECK_HEADERS is expand=
ed from...

| libraries.m4:85: LIB_SETUP_LIBRARIES is expanded from...

| configure.ac:225: the top level

| autoreconf: configure.ac: not using Autoheader

| autoreconf: configure.ac: not using Automake

| Error in tempfile() using template $TOPDIR/make/autoconf/build-aux/XXXXX=
XXXXX: Parent directory ($TOPDIR/make/autoconf/build-aux/) does not exist a=
t /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1=
-r0/recipe-sysroot-native/usr/bin/autoreconf line 411.

| WARNING: /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-nat=
ive/14.0.1-r0/temp/run.do_configure.27035:293 exit 1 from 'exit 1'

| WARNING: Backtrace (BB generated script):

| #1: bbfatal_log, /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjd=
k-14-native/14.0.1-r0/temp/run.do_configure.27035, line 293

| #2: die, /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-nat=
ive/14.0.1-r0/temp/run.do_configure.27035, line 273

| #3: autotools_do_configure, /home/insidem2m/poky/build/tmp/work/x86_64-l=
inux/openjdk-14-native/14.0.1-r0/temp/run.do_configure.27035, line 235

| #4: do_configure, /home/insidem2m/poky/build/tmp/work/x86_64-linux/openj=
dk-14-native/14.0.1-r0/temp/run.do_configure.27035, line 159

| #5: main, /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-na=
tive/14.0.1-r0/temp/run.do_configure.27035, line 297

|

| Backtrace (metadata-relative locations):

| #1: bbfatal_log, /home/insidem2m/poky/meta/classes/logging.bbclass, line=
 72

| #2: die, /home/insidem2m/poky/meta/classes/base.bbclass, line 56

| #3: autotools_do_configure, /home/insidem2m/poky/meta/classes/autotools.=
bbclass, line 224

| #4: do_configure, autogenerated, line 5

*ERROR* : Task (virtual:native:/home/insidem2m/poky/meta-java/recipes-core=
/openjdk/openjdk-14_14.0.1.bb:do_configure) failed with exit code '1'

*NOTE* : Tasks Summary: Attempted 5311 tasks of which 5219 didn't need to =
be rerun and 1 failed.

Summary: 1 task failed:

virtual:native:/home/insidem2m/poky/meta-java/recipes-core/openjdk/openjdk=
-14_14.0.1.bb:do_configure

Summary: There were 7 WARNING messages shown.

Summary: There were 2 ERROR messages shown, returning a non-zero exit code=
.

Can somebody experienced help me to find out what is breaking my build? It=
 looks like there is a variable missing or generally something missing the =
build is referring to.

I found something similair in this list at

[oe] OpenJdk9 (openembedded.org) ( https://www.openembedded.org/pipermail/=
openembedded-devel/2017-July/113896.html )

with the suggestion to skip the autoconf stuff. But this is not helpful be=
cause then I am missing the patch applied before configuring

0002-make-autoconf-toolchain-remove-invalid-compiler-chec.patch

which looks introduced into the openjdk-14 branch. At this place my openjd=
k-8 build attempts breaks (BASENAME invalid argument stuff) also, this is w=
hy I tested the openjre-14 branch.

Kind Regards
Konsti

--pdZERQiVLSaE4fLsZCIo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello guys,<br />I have a core-image-base for a beaglebone black compiled a=
nd running, I am very happy with the yocto framework I am trying to get fly=
ing in our project. On top of my current image I am trying to put a openjre=
 into my image with the meta-java layer.&nbsp;<br /><br />In bblayers.conf =
I added<br /><br />
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">/home/insidem2m/poky=
/meta-openembedded/meta-oe<br /></span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">/home/insidem2m/poky=
/meta-java<br /><br />and in my local.conf I added<br /><br /></span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">IMAGE_INSTALL_append=
 =3D " e2fsprogs-resize2fs dropbear i2c-tools docker-ce openjre-14"</span><=
/p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">OPENJDK14_BOOT_JDK=
=3D"/home/insidem2m/buildroot-2021.02-rc3/output/host/usr/lib/jvm"</span><=
/p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">PREFERRED_PROVIDER_v=
irtual/java-initial-native =3D "cacao-initial-native"</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">PREFERRED_PROVIDER_v=
irtual/java-native =3D "jamvm-native"</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">PREFERRED_PROVIDER_v=
irtual/javac-native =3D "ecj-bootstrap-native"</span></p>
<p class=3D"p2" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000; min-height: 13px;"><=
span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><b=
r /><br />Nevertheless if I try to pull in openjdk-8, openjre-8 or openjre-=
14 (from the meta-java g0hl1n/jdk14 branch), my build breaks this way:<br /=
><br /><br /></span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| AUTOV is 1.16</spa=
n></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| NOTE: Executing AC=
LOCAL=3D"aclocal --system-acdir=3D/home/insidem2m/poky/build/tmp/work/x86_6=
4-linux/openjdk-14-native/14.0.1-r0/recipe-sysroot-native/usr/share/aclocal=
/ --automake-acdir=3D/home/insidem2m/poky/build/tmp/work/x86_64-linux/openj=
dk-14-native/14.0.1-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autore=
conf -Wcross --verbose --install --force --exclude=3Dautopoint --exclude=3D=
gtkdocize -I /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-na=
tive/14.0.1-r0/jdk14u-jdk-14.0.1-ga/make/autoconf/ -I /home/insidem2m/poky/=
build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/jdk14u-jdk-14.0.1-g=
a/make/autoconf/build-aux/</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: export=
 WARNINGS=3Dcross,no-obsolete</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: Enteri=
ng directory '.'</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: config=
ure.ac: not using Gettext</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: runnin=
g: aclocal --system-acdir=3D/home/insidem2m/poky/build/tmp/work/x86_64-linu=
x/openjdk-14-native/14.0.1-r0/recipe-sysroot-native/usr/share/aclocal/ --au=
tomake-acdir=3D/home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-=
native/14.0.1-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/insi=
dem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/jdk14u-j=
dk-14.0.1-ga/make/autoconf/ -I /home/insidem2m/poky/build/tmp/work/x86_64-l=
inux/openjdk-14-native/14.0.1-r0/jdk14u-jdk-14.0.1-ga/make/autoconf/build-a=
ux/ --force</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| basics.m4:52: warn=
ing: underquoted definition of $1</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| basics.m4:52: <spa=
n class=3D"Apple-converted-space">&nbsp; </span>run info Automake 'Extendin=
g aclocal'</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| basics.m4:52: <spa=
n class=3D"Apple-converted-space">&nbsp; </span>or see https://www.gnu.org/=
software/automake/manual/automake.html#Extending-aclocal</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Use of uninitializ=
ed value $1 in quotemeta at (eval 16) line 470.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Use of uninitializ=
ed value $1 in string at (eval 16) line 470.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Use of uninitializ=
ed value $1 in quotemeta at (eval 16) line 470.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Use of uninitializ=
ed value $1 in string at (eval 16) line 470.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Use of uninitializ=
ed value $1 in quotemeta at (eval 16) line 470.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Use of uninitializ=
ed value $1 in string at (eval 16) line 470.<br /><br />[...] very much mil=
lions of those lines snipped<br /><br /></span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Use of uninitializ=
ed value $1 in quotemeta at (eval 16) line 470.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Use of uninitializ=
ed value $1 in string at (eval 16) line 470.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| configure.ac:225: =
warning: AC_CHECK_HEADERS($HEADERS_TO_CHECK): you should use literals</span=
></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| ../autoconf-2.71/l=
ib/autoconf/headers.m4:217: AC_CHECK_HEADERS is expanded from...</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| libraries.m4:85: L=
IB_SETUP_LIBRARIES is expanded from...</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| configure.ac:225: =
the top level</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: config=
ure.ac: tracing</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: config=
ure.ac: creating directory $TOPDIR/make/autoconf/build-aux</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: error:=
 cannot create $TOPDIR/make/autoconf/build-aux: No such file or directory</=
span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: config=
ure.ac: not using Libtool</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: config=
ure.ac: not using Intltool</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: config=
ure.ac: not using Gtkdoc</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: runnin=
g: /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.=
1-r0/recipe-sysroot-native/usr/bin/autoconf --include=3D/home/insidem2m/pok=
y/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/jdk14u-jdk-14.0.1=
-ga/make/autoconf/ --include=3D/home/insidem2m/poky/build/tmp/work/x86_64-l=
inux/openjdk-14-native/14.0.1-r0/jdk14u-jdk-14.0.1-ga/make/autoconf/build-a=
ux/ --force</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| configure.ac:225: =
warning: AC_CHECK_HEADERS($HEADERS_TO_CHECK): you should use literals</span=
></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| ../autoconf-2.71/l=
ib/autoconf/headers.m4:217: AC_CHECK_HEADERS is expanded from...</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| libraries.m4:85: L=
IB_SETUP_LIBRARIES is expanded from...</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| configure.ac:225: =
the top level</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: config=
ure.ac: not using Autoheader</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| autoreconf: config=
ure.ac: not using Automake</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Error in tempfile(=
) using template $TOPDIR/make/autoconf/build-aux/XXXXXXXXXX: Parent directo=
ry ($TOPDIR/make/autoconf/build-aux/) does not exist at /home/insidem2m/pok=
y/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/recipe-sysroot-na=
tive/usr/bin/autoreconf line 411.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| WARNING: /home/ins=
idem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/temp/ru=
n.do_configure.27035:293 exit 1 from 'exit 1'</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| WARNING: Backtrace=
 (BB generated script):</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#1: bbfatal_log, /home/ins=
idem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/temp/ru=
n.do_configure.27035, line 293</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#2: die, /home/insidem2m/p=
oky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/temp/run.do_con=
figure.27035, line 273</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#3: autotools_do_configure=
, /home/insidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1=
-r0/temp/run.do_configure.27035, line 235</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#4: do_configure, /home/in=
sidem2m/poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/temp/r=
un.do_configure.27035, line 159</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#5: main, /home/insidem2m/=
poky/build/tmp/work/x86_64-linux/openjdk-14-native/14.0.1-r0/temp/run.do_co=
nfigure.27035, line 297</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">|<span class=3D"Appl=
e-converted-space">&nbsp;</span></span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| Backtrace (metadat=
a-relative locations):</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#1: bbfatal_log, /home/ins=
idem2m/poky/meta/classes/logging.bbclass, line 72</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#2: die, /home/insidem2m/p=
oky/meta/classes/base.bbclass, line 56</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#3: autotools_do_configure=
, /home/insidem2m/poky/meta/classes/autotools.bbclass, line 224</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">| <span class=3D"App=
le-tab-span" style=3D"white-space: pre;"> </span>#4: do_configure, autogene=
rated, line 5</span></p>
<p class=3D"p2" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #b42419;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;"><strong>ERROR</stron=
g></span><span class=3D"s2" style=3D"font-variant-ligatures: no-common-liga=
tures; color: #000000;">: </span><span class=3D"s1" style=3D"font-variant-l=
igatures: no-common-ligatures;">Task (virtual:native:/home/insidem2m/poky/m=
eta-java/recipes-core/openjdk/openjdk-14_14.0.1.bb:do_configure) failed wit=
h exit code '1'</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;"><strong>NOTE</strong=
>: Tasks Summary: Attempted 5311 tasks of which 5219 didn't need to be reru=
n and 1 failed.</span></p>
<p class=3D"p3" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000; min-height: 13px;">&=
nbsp;</p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">Summary: 1 task fail=
ed:</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;"><span class=3D"Apple=
-converted-space">&nbsp; </span>virtual:native:/home/insidem2m/poky/meta-ja=
va/recipes-core/openjdk/openjdk-14_14.0.1.bb:do_configure</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">Summary: There were =
7 WARNING messages shown.</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;">&nbsp;</p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">Summary: There were =
2 ERROR messages shown, returning a non-zero exit code.<br /><br />Can some=
body experienced help me to find out what is breaking my build? It looks li=
ke there is a variable missing or generally something missing the build is =
referring to.<br /><br />I found something similair in this list at&nbsp;<b=
r /><br /><a href=3D"https://www.openembedded.org/pipermail/openembedded-de=
vel/2017-July/113896.html">[oe] OpenJdk9 (openembedded.org)</a><br /><br />=
with the suggestion to skip the autoconf stuff. But this is not helpful bec=
ause then I am missing the patch applied before configuring<br /><br /></sp=
an></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;">0002-make-autoconf-t=
oolchain-remove-invalid-compiler-chec.patch<br /><br />which looks introduc=
ed into the openjdk-14 branch. At this place my openjdk-8 build attempts br=
eaks (BASENAME invalid argument stuff) also, this is why I tested the openj=
re-14 branch.<br /><br /><br />Kind Regards<br />Konsti</span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;"><br /><br /><br /></=
span></p>
<p class=3D"p2" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000; min-height: 13px;"><=
span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><b=
r /><br /><br /></span><span style=3D"background-color: rgba(0, 0, 0, 0.85)=
; color: #f2f2f2; font-family: Monaco; font-size: 12px; font-variant-ligatu=
res: no-common-ligatures;"></span></p>
<p class=3D"p2" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000; min-height: 13px;"><=
span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><b=
r /></span></p>
<p class=3D"p1" style=3D"margin-bottom: 0px; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: #000000;"><span class=3D"s1" =
style=3D"font-variant-ligatures: no-common-ligatures;"><br /><br /><br /></=
span></p>

--pdZERQiVLSaE4fLsZCIo--
