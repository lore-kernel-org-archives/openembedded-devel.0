Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 62EE177114
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 08:09:10 +0000 (UTC)
Received: (qmail 8709 invoked by uid 1003); 2 Feb 2016 08:09:10 -0000
Received: from unknown (HELO ?192.168.1.43?) (philip@opensdr.com@91.177.26.95)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	2 Feb 2016 08:09:10 -0000
To: openembedded-devel@lists.openembedded.org
References: <1453217976-27313-1-git-send-email-philip@balister.org>
	<20160129180337.GB15053@jama>
From: Philip Balister <philip@balister.org>
Message-ID: <56B0641E.4090704@balister.org>
Date: Tue, 2 Feb 2016 09:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160129180337.GB15053@jama>
Subject: Re: [meta-oe][PATCHv3] thrift: Add recipe for Apache Thrift.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Feb 2016 08:09:11 -0000
X-Groupsio-MsgNum: 59807
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Q2E6KlC2na7nr7TSBv7EvMFfrEqVwIlwk"

--Q2E6KlC2na7nr7TSBv7EvMFfrEqVwIlwk
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 01/29/2016 07:03 PM, Martin Jansa wrote:
> On Tue, Jan 19, 2016 at 10:39:36AM -0500, Philip Balister wrote:
>>  * Run tested cpp bindings with GNU Radio Control Port.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 34 +++++++++++++=
+++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.b=
b
>>
>> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/met=
a-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>> new file mode 100644
>> index 0000000..7c8f407
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>> @@ -0,0 +1,34 @@
>> +SUMMARY =3D "Apache Thrift"
>> +DESCRIPTION =3D  "A software framework, for scalable cross-language s=
ervices development"
>> +HOMEPAGE =3D "https://thrift.apache.org/"
>> +
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4ed21f679b2aafef26eac82ab=
0c2cbf"
>> +
>> +DEPENDS =3D "thrift-native boost python libevent flex-native bison-na=
tive \
>> +           glib-2.0 openssl"
>> +
>> +SRC_URI =3D "git://git-wip-us.apache.org/repos/asf/thrift.git;protoco=
l=3Dhttps \
>> +"
>> +SRCREV =3D "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
>> +S =3D "${WORKDIR}/git"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> +
>> +inherit pkgconfig cmake pythonnative
>> +
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>> +export BUILD_SYS
>> +export HOST_SYS
>> +
>> +EXTRA_OECMAKE =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF"
>> +EXTRA_OECMAKE_class-native =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF \
>> +             -DBUILD_TESTING=3DOFF -DBUILD_EXAMPLES=3DOFF -DWITH_CPP=3D=
OFF"
>> +EXTRA_OECMAKE_class-nativesdk =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF =
\
>> +             -DBUILD_TESTING=3DOFF -DBUILD_EXAMPLES=3DOFF -DWITH_PYTH=
ON=3DOFF"
>=20
> Didn't help with Qt5:

Bother, I'll try and get a build with Qt5 staged so I can test locally.
Sorry for the trouble.

Philip


>=20
> | -- Parsed Thrift version: 1.0.0 (1.0.0)
> | CMake Error at /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qem=
uarm/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:27 (message):
> |   The imported target "Qt5::Core" references the file
> |=20
> |      "/qmake"
> |=20
> |   but this file does not exist.  Possible reasons include:
> |=20
> |   * The file was deleted, renamed, or moved to another location.
> |=20
> |   * An install or uninstall procedure did not complete successfully.
> |=20
> |   * The installation package was faulty and contained
> |=20
> |      "/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/=
lib/cmake/Qt5Core/Qt5CoreConfigExtras.cmake"
> |=20
> |   but not all the files it references.
> |=20
> | Call Stack (most recent call first):
> |   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/=
cmake/Qt5Core/Qt5CoreConfigExtras.cmake:6 (_qt5_Core_check_file_exists)
> |   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/=
cmake/Qt5Core/Qt5CoreConfig.cmake:158 (include)
> |   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/=
cmake/Qt5/Qt5Config.cmake:26 (find_package)
> |   build/cmake/DefineOptions.cmake:55 (find_package)
> |   CMakeLists.txt:45 (include)
> |=20
> |=20
> | -- Configuring incomplete, errors occurred!
> | See also "/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-l=
inux-gnueabi/thrift/0.9.3-r0/build/CMakeFiles/CMakeOutput.log".
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/je=
nkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/thrift/0.=
9.3-r0/temp/log.do_configure.18928)
> NOTE: recipe thrift-0.9.3-r0: task do_configure: Failed
> ERROR: Task 16213 (/home/jenkins/oe/world/shr-core/meta-openembedded/me=
ta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb, do_configure) failed w=
ith exit code '1'
>=20
>> +
>> +do_install_append () {
>> +	ln -sf thrift ${D}/${bindir}/thrift-compiler
>> +}
>> +
>> --=20
>> 2.5.0
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20


--Q2E6KlC2na7nr7TSBv7EvMFfrEqVwIlwk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWsGQkAAoJEMDJd4rr0mere7gH/0uGMsfZicwpSmLWnqwuc0dg
jl0GTYd66SPXT3xQZjRbbSiT9i3d8hrJvti++y0Dv2xoC77uch+cqB590Ar2/g3P
XYGfxfVYsJv6ufQpCHeGa1fzDXTfQCJNC9tL/vC/V+w8QUI5hlLuAFi8g15WAOmf
QO+1EGBPD41Ui3byxezV32IW5gL5cTk4vCTYuLmkzDEKzmA89oEhlQOt3ITqAiKf
pF0XSXYEoYZrMWwqjT+eK9v+QG8T7SF/CfSUOjCfV54fTpBWw/SvVlcrxrJnUVdQ
IM+EZ32yy5mzs7uSiK7hUcnSB4i7vhgD5t1p1jsEJ4VCeTRMhcAu4heenNs+vtk=
=WewY
-----END PGP SIGNATURE-----

--Q2E6KlC2na7nr7TSBv7EvMFfrEqVwIlwk--
