Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QGw2j-0002f9-Vx for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 18:32:18 +0200
Received: from smtp04.msg.oleane.net (smtp04.mail.priv [172.17.20.113]) 
	by smtp-out06.msg.oleane.net with ESMTP id p42GThjR027339
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 May 2011 18:29:43 +0200
Received: from [192.168.1.148] (AMarseille-551-1-66-56.w80-9.abo.wanadoo.fr
	[80.9.121.56]) (authenticated)
	by smtp04.msg.oleane.net (MTA) with ESMTP id p42G9VNd031326
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 May 2011 18:09:31 +0200
X-Oleane-Rep: REPA
Message-ID: <4DBED73B.7050904@cioinfoindus.fr>
Date: Mon, 02 May 2011 18:09:31 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110419 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304091838-23333-1-git-send-email-christian.charreyre@cioinfoindus.fr>	<1304091838-23333-2-git-send-email-christian.charreyre@cioinfoindus.fr>
	<1304148125.5773.6.camel@mattotaupa>
In-Reply-To: <1304148125.5773.6.camel@mattotaupa>
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.6.0.2009776, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.2.155116 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Subject: Re: [PATCH v2] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Mon, 02 May 2011 16:32:18 -0000
X-Groupsio-MsgNum: 31569
Content-Type: multipart/mixed; boundary="------------030006080906000209060903"

--------------030006080906000209060903
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp-out06.msg.oleane.net id p42GThjR027339

Dear Paul,

my configuration is MACHINE=3D"beagleboard" and DISTRO=3D"angstrom-2008.1=
".

I've successfully reproduced your problem, that is explained by missing=20
dependencies in mypaint recipe.
In fact scons normally uses python-numpy (native version) to define=20
parts of the include path.
As python-numpy is not availbale in native version, I first made a=20
receipe to generate it, but with Arm target and X86_64 host troubles may=20
happen regarding type's length, so I patched Sconscript to give the=20
correct path without python-numpy-native.

In my environment it seems to work correctly.

I will submit a new version (v3) that I hope will work better in a=20
second mail.

Concerning my first name, I don't understand what happens because git=20
config user.name returns "Christian Charreyre".
I have manually corrected in the v3 patch.

Regards

Le 30/04/2011 09:22, Paul Menzel a =C3=A9crit :
> Dear Christian,
>
>
> thank you for your improved patch.
>
> Am Freitag, den 29.04.2011, 17:43 +0200 schrieb C. Charreyre:
>
> What distribution and machine do you use to build this?
>
> I applied your patches. Unfortunately task compile fails with the
> following error using `angstrom-2010.x` or `minimal` with `MACHINE =3D
> "beagleboard".
>
>          + scons_do_compile
>          + '[' '' =3D 1 ']'
>          + /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr=
/bin/scons -j4 'CXX=3Darm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mt=
une=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-=
thumb --sysroot=3D/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-an=
gstrom-linux-gnueabi' PREFIX=3D/usr prefix=3D/usr
>          scons: Reading SConscript files ...
>          Building for python2.6
>          You need to have numpy installed.
>
>          ImportError: No module named numpy:
>            File "/oe/build-angstrom-next/angstrom-dev/work/armv7a-angst=
rom-linux-gnueabi/mypaint-0.9.1-r0/mypaint-0.9.1/SConstruct", line 15:
>              import numpy
>          + oefatal 'scons build
>
>> Signed-off-by: C. Charreyre<christian.charreyre@cioinfoindus.fr>
> Maybe spell out you first name.
>
>          git config user.name "Christian Charreyre" # maybe even
>          `--global`
>
>> ---
>>   recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
>>   recipes/mypaint/mypaint_0.9.1.bb        |   36 +++++++++++++++++++++=
++++++++++
>>   2 files changed, 56 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes/mypaint/files/scons-adapt.patch
>>   create mode 100644 recipes/mypaint/mypaint_0.9.1.bb
>>
>> diff --git a/recipes/mypaint/files/scons-adapt.patch b/recipes/mypaint=
/files/scons-adapt.patch
>> new file mode 100644
>> index 0000000..dcad6db
>> --- /dev/null
>> +++ b/recipes/mypaint/files/scons-adapt.patch
>> @@ -0,0 +1,20 @@
>> +Author: Christian Charreyre<christian.charreyre@cioinfoindus.fr>
>> +
>> +Adapt scons to OE
>> +Index: mypaint-0.9.1/lib/SConscript
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- mypaint-0.9.1.orig/lib/SConscript	2011-04-21 11:31:29.000000000 +=
0200
>> ++++ mypaint-0.9.1/lib/SConscript	2011-04-21 11:35:30.000000000 +0200
>> +@@ -1,5 +1,11 @@
>> + Import('env')
>> +-import sys
>> ++import sys, os
>> ++env.Replace(SHCXX =3D os.environ['CXX'])
>> ++env.Replace(SHLINK =3D os.environ['CXX'])
>> ++env.Replace(LDMODULEFLAGS =3D os.environ['TARGET_LDFLAGS'])
>> ++env.Append(LDMODULEFLAGS =3D ['-Wl,--hash-style=3Dgnu'])
>> ++env.Append(LDMODULEFLAGS =3D ['-shared'])
>> ++env.Replace(PATH =3D os.environ['PATH'])
>> +
>> + # For the record: I know that scons supports swig. But it doesn't sc=
an for #include in the generated code.
>> + #
>> diff --git a/recipes/mypaint/mypaint_0.9.1.bb b/recipes/mypaint/mypain=
t_0.9.1.bb
>> new file mode 100644
>> index 0000000..a7e5077
>> --- /dev/null
>> +++ b/recipes/mypaint/mypaint_0.9.1.bb
>> @@ -0,0 +1,31 @@
>> +DESCRIPTION=3D"fast and easy open-source graphics application for dig=
ital painters"
>> +LICENSE=3D"GPL"
>> +SECTION =3D "x11/applications"
>> +PRIORITY =3D "optional"
>> +HOMEPAGE =3D "http://mypaint.intilinux.com/"
>> +
>> +RDEPENDS_${PN} =3D "python-image python-json python-numpy"
>> +
>> +SRC_URI =3D "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
>> +	file://scons-adapt.patch \
>> +"
>> +SRC_URI[md5sum] =3D "6249a16359a438d6dc658f5765b35515"
>> +SRC_URI[sha256sum] =3D "407b599f62fb0d6e711fee57d22e64d3aec88825364fb=
5f7f73b9f0940aa7aed"
>> +
>> +inherit distutils scons
>> +
>> +do_compile() {
>> +	STAGING_INCDIR=3D${STAGING_INCDIR} \
>> +       STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>> +       BUILD_SYS=3D${BUILD_SYS} \
>> +	HOST_SYS=3D${HOST_SYS} \
>> +	PATH=3D${PATH} scons_do_compile
>> +}
>> +
>> +do_install() {
>> +	BUILD_SYS=3D${BUILD_SYS} \
>> +	HOST_SYS=3D${HOST_SYS} \
>> +	scons_do_install
>> +}
>> +
>> +FILES_${PN} +=3D "${datadir}"
>
> Thanks,
>
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--------------030006080906000209060903
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

--------------030006080906000209060903--
