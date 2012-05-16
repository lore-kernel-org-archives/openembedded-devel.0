Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1SUeRN-0006w6-Pn
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 15:38:58 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id q4GDSpoa015248
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 15:28:56 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0283.003; Wed, 16 May 2012 15:28:51 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: packages built but not deployed - RECALL
Thread-Index: AQHNM2fUTrAG0gQS9kCgpto/QjX+gg==
Date: Wed, 16 May 2012 13:28:50 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4256D893@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: packages built but not deployed - RECALL
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
X-List-Received-Date: Wed, 16 May 2012 13:38:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I'm too tired...=0A=
the packages are called libcunit... and not cunit... that I was looking for=
.=0A=
// Mats=0A=
________________________________________=0A=
From: Mats K=E4rrman=0A=
Sent: Wednesday, May 16, 2012 2:48 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: packages built but not deployed=0A=
=0A=
Hi,=0A=
=0A=
I have made an OE-classic recipe for CUnit, see below, that I'm using toget=
her with 2011.03-maintenance and a "headless" Angstrom image.=0A=
There was one complication; the source folder inside the source tar contain=
s upper-case letters but there is a rule in do_package_stage that only acce=
pts lower case letters in the recipe name. The explicit setting of "S" belo=
w together with using only lower case letters for the recipe seemed to solv=
e this problem.=0A=
=0A=
cunit_2.1-2.bb:=0A=
------------------------------------------------------------------=0A=
DESCRIPTION =3D "Automated testing framework for 'C'."=0A=
HOMEPAGE =3D "http://sourceforge.net/projects/cunit/"=0A=
PRIORITY =3D "optional"=0A=
SECTION =3D "libs"=0A=
LICENSE =3D "LGPLv2"=0A=
PR =3D "r0"=0A=
=0A=
inherit autotools=0A=
=0A=
# Recipe name must be all lower case because of do_package_stage rule but s=
ource=0A=
# tar uses uppercase in source code folder name, hence:=0A=
S =3D "${WORKDIR}/CUnit-${PV}"=0A=
=0A=
SRC_URI =3D " \=0A=
    ${SOURCEFORGE_MIRROR}/project/cunit/CUnit/2.1-2/CUnit-2.1-2-src.tar.bz2=
;name=3Dcunit \=0A=
    "=0A=
=0A=
SRC_URI[cunit.md5sum] =3D "31c62bd7a65007737ba28b7aafc44d3a"=0A=
SRC_URI[cunit.sha256sum] =3D "1f705f30b36fe1dadb5494989d1d663241603f456b468=
c81f606a1bdbc168bea"=0A=
=0A=
--------------------------------------------------------=0A=
=0A=
Now:=0A=
- Build works OK.=0A=
- Lib's etc are working and properly staged under sysroots.=0A=
- Packages are built (found under work/.../staging-pkg)=0A=
- Packages are NOT deployed (i.e. not found under deploy/glibc/ipk/...).=0A=
=0A=
Any help appreciated!=0A=
BR // Mats=0A=


