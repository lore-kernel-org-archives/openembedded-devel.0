Received: from smtp-out05.msg.oleane.net ([62.161.7.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QI15w-0003Q6-FY for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 18:08:04 +0200
Received: from smtp06.msg.oleane.net (smtp06.mail.priv [172.17.20.115]) 
	by smtp-out05.msg.oleane.net with ESMTP id p45G5QP6019299
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 May 2011 18:05:26 +0200
Received: from [192.168.1.106] (AMarseille-551-1-8-51.w80-9.abo.wanadoo.fr
	[80.9.203.51]) (authenticated)
	by smtp06.msg.oleane.net (MTA) with ESMTP id p45FjLJ8004368
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 May 2011 17:45:21 +0200
X-Oleane-Rep: REPA
Message-ID: <4DC2C611.8010408@cioinfoindus.fr>
Date: Thu, 05 May 2011 17:45:21 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110419 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.5.153314 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Subject: Re: [PATCH v4] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Thu, 05 May 2011 16:08:04 -0000
X-Groupsio-MsgNum: 31635
Content-Type: multipart/mixed; boundary="------------050700040707090600000402"

--------------050700040707090600000402
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp-out05.msg.oleane.net id p45G5QP6019299


Le 04/05/2011 10:56, Paul Menzel a =C3=A9crit :
>  Dear Christian,
>
>
>  we are almost there.
>
>
>  Am Montag, den 02.05.2011, 19:40 +0200 schrieb Christian Charreyre:
>
>  Please remember to add what build configuration you used. (You can jus=
t
>  paste it from the BitBake output.)
>
>>  Signed-off-by: Christian Charreyre<christian.charreyre@cioinfoindus.f=
r>
>>  ---
>
>  If you send patch iterations (v2, v3, v4, =E2=80=A6) it is common to p=
ut below
>  =C2=BB---=C2=AB what changed in the iterations to make it easier for r=
eviewers to
>  know what changed. Put =C2=BB---=C2=AB behind that, since it is not ne=
eded for the
>  actual commit message.
>
>  Example:
>
>  Commit message.
>
>  S-o-b: Joe User<joe@example.org>
>  ---
>  v2: add foo to DEPENDS
>  v3: reorder to adhere to styleguide
>  v4: change install to =E2=80=A6
>  ---
>  diff
>
Noted.

I've tried to be explicite with a first message describing the
evolution, then the patch itself (I used git send-email --compose),
I'll had this in later posts.

>>    recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
>>    recipes/mypaint/mypaint_0.9.1.bb        |   36 ++++++++++++++++++++=
+++++++++++
>>    2 files changed, 56 insertions(+), 0 deletions(-)
>>    create mode 100644 recipes/mypaint/files/scons-adapt.patch
>>    create mode 100644 recipes/mypaint/mypaint_0.9.1.bb
>>
>>  diff --git a/recipes/mypaint/files/scons-adapt.patch b/recipes/mypain=
t/files/scons-adapt.patch
>>  new file mode 100644
>>  index 0000000..dcad6db
>>  --- /dev/null
>>  +++ b/recipes/mypaint/files/scons-adapt.patch
>>  @@ -0,0 +1,50 @@
>>  +Author: Christian Charreyre<christian.charreyre@cioinfoindus.fr>
>>  +
>>  +Adapt scons to OE
>>  +Index: mypaint-0.9.1/lib/SConscript
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +--- mypaint-0.9.1.orig/lib/SConscript	2011-04-21 11:31:29.000000000 =
+0200
>>  ++++ mypaint-0.9.1/lib/SConscript	2011-04-21 11:35:30.000000000 +0200
>>  +@@ -1,5 +1,11 @@
>>  + Import('env')
>>  +-import sys
>>  ++import sys, os
>>  ++env.Replace(SHCXX =3D os.environ['CXX'])
>>  ++env.Replace(SHLINK =3D os.environ['CXX'])
>>  ++env.Replace(LDMODULEFLAGS =3D os.environ['TARGET_LDFLAGS'])
>>  ++env.Append(LDMODULEFLAGS =3D ['-Wl,--hash-style=3Dgnu'])
>>  ++env.Append(LDMODULEFLAGS =3D ['-shared'])
>>  ++env.Replace(PATH =3D os.environ['PATH'])
>>  +
>>  + # For the record: I know that scons supports swig. But it doesn't s=
can for #include in the generated code.
>>  + #
>>  +Index: mypaint-0.9.1/SConstruct
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +--- mypaint-0.9.1.orig/SConstruct	2011-03-04 15:44:59.000000000 +010=
0
>>  ++++ mypaint-0.9.1/SConstruct	2011-05-02 17:21:17.000000000 +0200
>>  +@@ -11,13 +11,6 @@
>>  + if sys.platform =3D=3D "win32":
>>  +     python =3D 'python' # usually no versioned binaries on Windows
>>  +
>>  +-try:
>>  +-    import numpy
>>  +-except ImportError:
>>  +-    print 'You need to have numpy installed.'
>>  +-    print
>>  +-    raise
>>  +-
>>  + SConsignFile() # no .scsonsign into $PREFIX please
>>  +
>>  + if sys.platform =3D=3D "darwin":
>>  +@@ -40,8 +33,9 @@
>>  +
>>  + env.Append(CXXFLAGS=3D' -Wall -Wno-sign-compare -Wno-write-strings'=
)
>>  +
>>  +-# Get the numpy include path (for numpy/arrayobject.h).
>>  +-numpy_path =3D numpy.get_include()
>>  ++# Defines the numpy include path (for numpy/arrayobject.h).
>>  ++# This is specefic to OE, to avoid to build python-numpy-native
>
>  spec*i*fic
>
>>  ++numpy_path =3D os.environ['STAGING_DIR_TARGET']+os.environ['PYTHON_=
SITEPACKAGES_DIR']+'/numpy/core/include'
>>  + env.Append(CPPPATH=3Dnumpy_path)
>>  +
>>  +
>>  diff --git a/recipes/mypaint/mypaint_0.9.1.bb b/recipes/mypaint/mypai=
nt_0.9.1.bb
>>  new file mode 100644
>>  index 0000000..a7e5077
>>  --- /dev/null
>>  +++ b/recipes/mypaint/mypaint_0.9.1.bb
>>  @@ -0,0 +1,37 @@
>>  +DESCRIPTION=3D"fast and easy open-source graphics application for di=
gital painters"
>>  +LICENSE=3D"GPL"
>>  +SECTION =3D "x11/applications"
>>  +PRIORITY =3D "optional"
>>  +HOMEPAGE =3D "http://mypaint.intilinux.com/"
>>  +
>>  +DEPENDS =3D "glib-2.0 libpng python-numpy"
>>  +RDEPENDS_${PN} =3D "python-image python-json"
>
>  I am now getting the following build error
>
>           + /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/us=
r/bin/scons -j4 'CXX=3Darm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -m=
tune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno=
-thumb --sysroot=3D/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi' PREFIX=3D/usr prefix=3D/usr
>           scons: Reading SConscript files ...
>           Building for python2.6
>           swig -o mypaintlib_wrap.cpp -noproxydel -python -c++ mypaintl=
ib.i
>           sh: swig: command not found
>           scons: *** Error 127
>           + oefatal 'scons build execution failed.'
>           + echo FATAL: 'scons build execution failed.'
>           FATAL: scons build execution failed.
>           + exit 1
>
>  which I fixed by building `swig-native` beforehand. Please add
>  `swig-native` to `DEPENDS`. You probably did not encounter this error
>  since you have it installed locally.
>
>  [=E2=80=A6]
>
>
>  Thank you very much for your patience and improved patches,
>
>  Paul
>
>
I think your right, I have tried to update correctly DEPENDS, but as
swig-native was already there for me I've missed it.

Thanks for your patience to review it and teach me good practices....

Do I submit a v5 with DEPENDS updated ?
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------050700040707090600000402
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"
Content-Transfer-Encoding: base64

YmVnaW46dmNhcmQNCmZuOkNocmlzdGlhbiAgQ2hhcnJleXJlDQpuOkNoYXJyZXlyZTtDaHJpc3Rp
YW4gDQpvcmc6Q0lPIEluZm9ybWF0aXF1ZSBJbmR1c3RyaWVsbGUNCmFkcjtkb206OzsxMSBBdmVu
dWUgTWFyaWdueTtNYXJzZWlsbGU7OzEzMDE0DQplbWFpbDtpbnRlcm5ldDpjaHJpc3RpYW4uY2hh
cnJleXJlQGNpb2luZm9pbmR1cy5mcg0KdGVsO3dvcms6MDQgOTUgMDUgMTkgNDENCnVybDpodHRw
Oi8vd3d3LmNpb2luZm9pbmR1cy5mcg0KdmVyc2lvbjoyLjENCmVuZDp2Y2FyZA0KDQo=

--------------050700040707090600000402--
