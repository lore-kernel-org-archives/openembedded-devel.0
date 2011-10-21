Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RH8uE-0007h3-0S
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 08:48:38 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p9L6gekW008842
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:42:45 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Fri, 21 Oct 2011 08:42:40 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] 2011.03-maintenance: Bad checksums in
	binutils-cross-sdk_2.18.bb
Thread-Index: AQHMj7wNioF1hjTXskiWCAQz6BdIcg==
Date: Fri, 21 Oct 2011 06:42:39 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4013CD9B@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: [PATCH] 2011.03-maintenance: Bad checksums in binutils-cross-sdk_2.18.bb
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
X-List-Received-Date: Fri, 21 Oct 2011 06:48:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
My first patch, please be gentle if i did something wrong ;)=0A=
The following patch is from a local branch tracking 2011.03-maintenance, sh=
ould it be done different?=0A=
=0A=
=0A=
The binutils_2.18 tarball from GNU has changed checksums, ref. to this<http=
://git.openembedded.org/openembedded/commit/recipes/binutils/binutils_2.18.=
bb?h=3D2011.03-maintenance&id=3Dbc8ddbf7944f82383936d88379619aa46c3954a2>=
=0A=
As binutils-cross-sdk_2.18.bb includes binutils_2.18.bb it does not need to=
 specify its own checksums.=0A=
=0A=
diff --git a/recipes/binutils/binutils-cross-sdk_2.18.bb b/recipes/binutils=
/binutils-cross-sdk_2.18.bb=0A=
index 837ebbe..2f13b26 100644=0A=
--- a/recipes/binutils/binutils-cross-sdk_2.18.bb=0A=
+++ b/recipes/binutils/binutils-cross-sdk_2.18.bb=0A=
@@ -1,6 +1,3 @@=0A=
 require binutils_${PV}.bb=0A=
 require binutils-cross-sdk.inc=0A=
 PR =3D "${INC_PR}.1"=0A=
-=0A=
-SRC_URI[md5sum] =3D "9d22ee4dafa3a194457caf4706f9cf01"=0A=
-SRC_URI[sha256sum] =3D "487a33a452f0edcf1f8bb8fc23dff5c7a82edec3f3f8b65632=
b6c945e961ee9b"=0A=


