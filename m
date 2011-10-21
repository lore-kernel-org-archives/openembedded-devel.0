Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RHNYN-0002c1-Ha
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Oct 2011 00:27:03 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p9LML3vX011583
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Oct 2011 00:21:09 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Sat, 22 Oct 2011 00:21:03 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] binutils_2.18: update SRC_URI to avoid manual delete
Thread-Index: AcyQP2i+EqEu9y5VSQ6+TECLiEP/7A==
Date: Fri, 21 Oct 2011 22:21:02 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4013D1AD@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.89.227.239]
MIME-Version: 1.0
Subject: [PATCH] binutils_2.18: update SRC_URI to avoid manual delete
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
X-List-Received-Date: Fri, 21 Oct 2011 22:27:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

For reasons described in [1], the URL and contents of the source archive ha=
s changed and the old URL redirects to this. The checksums were updated by =
a previous commit [2], but only changing the checksums requires a previousl=
y downloaded archive to be manually deleted. This patch avoids this by upda=
ting the SRC_URI to the new URL.=0A=
=0A=
[1] http://git.openembedded.org/openembedded/commit/?id=3Df4faecdbd0b7c83e5=
787735ef1495a34aca861e4=0A=
[2] http://git.openembedded.org/openembedded/commit/?id=3Dbc8ddbf7944f82383=
936d88379619aa46c3954a2=0A=
=0A=
Signed-off-by: Mats K=E4rrman <mats.karrman@tritech.se>=0A=
=0A=
diff -pu a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutils_2.=
18.bb=0A=
--- a/recipes/binutils/binutils_2.18.bb=0A=
+++ b/recipes/binutils/binutils_2.18.bb=0A=
@@ -3,7 +3,7 @@ PR =3D "${INC_PR}.2"=0A=
 LICENSE =3D "GPLv3"=0A=
 =0A=
 SRC_URI =3D "\=0A=
-     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \=0A=
+     ${GNU_MIRROR}/binutils/binutils-${PV}a.tar.bz2 \=0A=
      file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \=0A=
      file://binutils-configure-texinfo-version.patch \=0A=
      file://binutils-uclibc-100-uclibc-conf.patch \=


