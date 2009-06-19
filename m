Received: from [65.55.34.211] (helo=col0-omc4-s9.col0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pascal_kesseli@hotmail.com>) id 1MHc99-0001nO-Er
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 13:20:39 +0200
Received: from COL109-DS9 ([65.55.34.200]) by col0-omc4-s9.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 19 Jun 2009 04:09:59 -0700
X-Originating-IP: [213.3.31.124]
X-Originating-Email: [pascal_kesseli@hotmail.com]
Message-ID: <COL109-DS950449B65B62F9BEEB07AF23A0@phx.gbl>
From: "Pascal Kesseli" <pascal_kesseli@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jun 2009 13:09:56 +0200
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcnwznpQcvu+mTLuRR28MhjPm67kow==
X-OriginalArrivalTime: 19 Jun 2009 11:09:59.0014 (UTC)
	FILETIME=[7BF1C060:01C9F0CE]
Subject: classpath-minimum fails
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
X-List-Received-Date: Fri, 19 Jun 2009 11:20:39 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: de-ch

Hi everyone=20

Using the following DISTRO:=20

DISTRO =3D ewbmeter=20
DISTRO_NAME =3D EwbMeter=20
DISTRO_VERSION =3D "3.0"=20
TARGET_OS =3D linux=20
INHERIT +=3D " package_ipk"=20
PREFERRED_VERSION_gcc =3D "3.3.2"=20
PREFERRED_VERSION_gcc-cross =3D "3.3.2"=20
PREFERRED_VERSION_glibc =3D "2.2.5"=20
PREFERRED_PROVIDER_virtual/libc =3D "glibc"=20
PREFERRED_PROVIDER_classpath =3D classpath-minimal=20
PREFERRED_VERSION_classpath-minimal =3D 0.96.1.bb=20
PREFERRED_PROVIDER_virtual/java-initial =3D jamvm-initial=20
PREFERRED_VERSION_jamvm-initial =3D 1.5.0=20
PREFERRED_PROVIDER_classpath-initial =3D classpath=20
PREFERRED_PROVIDER_virtual/java-native =3D jamvm-native=20
PREFERRED_VERSION_jamvm-native =3D 1.5.3=20
PREFERRED_PROVIDER_virtual/javac-native =3D openjdk-javac-native=20

PREFERRED_PROVIDER_gtk+ =3D gtk+=20
PREFERRED_PROVIDER_gconf =3D gconf=20
PREFERRED_PROVIDER_virtual/libintl =3D glibc=20
PREFERRED_PROVIDER_linux-libc-headers =3D linux-libc-headers=20
PREFERRED_PROVIDER_virtual/libiconv =3D glibc=20
PREFERRED_PROVIDER_virtual/libx11 =3D libx11=20
PREFERRED_PROVIDER_virtual/arm-linux-binutils =3D binutils-cross=20
PREFERRED_PROVIDER_virtual/arm-linux-libc-initial =3D glibc-initial=20
PREFERRED_PROVIDER_virtual/db-native =3D db-native

the classpath-minimal build fails with a Java compiler error:=20

| 3205. ERROR in ../java/nio/ShortViewBufferImpl.java (at line 57)=20
| this.address =3D VMDirectByteBuffer.adjustAddress(bb.address, offset); =

| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0^^^^^^^^^^^^^=20
| The method adjustAddress(RawData, int) in the type VMDirectByteBuffer =
is
not applicable for the arguments (Pointer, int)=20
| ----------=20
| 3206. ERROR in ../java/nio/ShortViewBufferImpl.java (at line 70)=20
| this.address =3D VMDirectByteBuffer.adjustAddress(bb.address, offset); =

| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0^^^^^^^^^^^^^=20
| The method adjustAddress(RawData, int) in the type VMDirectByteBuffer =
is
not applicable for the arguments (Pointer, int)

What am I missing?=20

Thanks for any help and best regards=20
Kessi




