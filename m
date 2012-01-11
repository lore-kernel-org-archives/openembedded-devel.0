Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1Rl4Nq-0006ZS-PI
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jan 2012 21:02:54 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id q0BJtJWg006799
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2012 20:55:24 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0247.003; Wed, 11 Jan 2012 20:55:19 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Classic SDK host utilities missing
Thread-Index: AQHM0Jryp15JumBlRUujedxbn3HolA==
Date: Wed, 11 Jan 2012 19:55:19 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C40233DEB@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: Classic SDK host utilities missing
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
X-List-Received-Date: Wed, 11 Jan 2012 20:02:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 Hi,=0A=
=0A=
I'm using OE 2011.03-maintenance for a PowerPC based product and have creat=
ed an SDK following the QTE example in the (very old) OE manual.=0A=
=0A=
The base SDK generation works fine.=0A=
Adding target libraries etc also works fine.=0A=
Adding host tools does not.=0A=
=0A=
What I'm trying to do is to add the cramfs tools to my SDK.=0A=
=0A=
I have created cramfs-sdk_1.1.bb:=0A=
----------------=0A=
inherit sdk=0A=
require recipes/cramfs/cramfs_1.1.bb=0A=
----------------=0A=
=0A=
And meta-toolchain-xxx.bb:=0A=
----------------=0A=
DESCRIPTION =3D "Xxx SDK meta recipe"=0A=
LICENSE =3D "MIT"=0A=
PR =3D "r0"=0A=
=0A=
TOOLCHAIN_TARGET_TASK =3D "task-xxx-toolchain-target"=0A=
TOOLCHAIN_HOST_TASK =3D "task-xxx-toolchain-host"=0A=
=0A=
require recipes/meta/meta-toolchain.bb=0A=
SDK_SUFFIX =3D "toolchain-xxx"=0A=
----------------=0A=
=0A=
And task-xxx-toolchain-host.bb:=0A=
----------------=0A=
require recipes/tasks/task-sdk-host.bb=0A=
=0A=
DESCRIPTION =3D "Host packages for Xxx SDK"=0A=
LICENSE =3D "MIT"=0A=
PR =3D "r0"=0A=
=0A=
ALLOW_EMPTY =3D "1"=0A=
=0A=
RDEPENDS_${PN} +=3D "cramfs-sdk"=0A=
----------------=0A=
=0A=
When building a cramfs-sdk package is created containing the correct binari=
es in the correct location. The SDK is also created without errors but the =
files from cramfs-sdk is just not there.=0A=
=0A=
I have looked around all log-files but the only suspicious thing I found is=
 from log.do_package of cramfs-sdk:=0A=
-------------=0A=
NOTE: Couldn't find shared library provider for libz.so.1=0A=
NOTE: Couldn't find shared library provider for libc.so.6=0A=
NOTE: Couldn't find shared library provider for libz.so.1=0A=
NOTE: Couldn't find shared library provider for libc.so.6=0A=
-------------=0A=
=0A=
If this is the problem, what to do about it?=0A=
If not, any other clues would be very appreciated.=0A=
=0A=
Thanks // Mats=0A=


