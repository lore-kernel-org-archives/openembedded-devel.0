Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RGrgy-0005Sd-EP
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 14:25:49 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p9KCJp8o006468
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:19:56 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Thu, 20 Oct 2011 14:19:51 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Bad checksums in binutils-cross-sdk_2.18.bb
Thread-Index: AcyPHyqgvw1ePdaiSielyjODLl0+3w==
Date: Thu, 20 Oct 2011 12:19:50 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4013CA51@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Bad checksums in binutils-cross-sdk_2.18.bb
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
X-List-Received-Date: Thu, 20 Oct 2011 12:25:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm using OE-classic "2011.03-maintenance" branch.

According to commit bc8ddbf7944f82383936d88379619aa46c3954a2<http://git.ope=
nembedded.org/openembedded/commit/recipes/binutils/binutils_2.18.bb?h=3D201=
1.03-maintenance&id=3Dbc8ddbf7944f82383936d88379619aa46c3954a2> the checksu=
ms of the binutils 2.18 tarball has changed (verified, works fine).

However, the binutils-cross-sdk_2.18.bb recipe "require"s the binutils_2.18=
.bb recipe but still overrides the checksums with the old values causing SD=
K build to fail.

// Mats
<http://git.openembedded.org/openembedded/commit/recipes/binutils/binutils_=
2.18.bb?h=3D2011.03-maintenance&id=3Dbc8ddbf7944f82383936d88379619aa46c3954=
a2>

