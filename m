Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RnWJ4-0003sA-Si
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 15:16:06 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id q0IDuODL010568
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 14:56:29 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0247.003; Wed, 18 Jan 2012 14:56:24 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Extending meta-toolchain-*
Thread-Index: AQHM1eYWN0IHQEXCvEuXcj5Y6VygspYSJZH0
Date: Wed, 18 Jan 2012 13:56:23 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C40235559@post.tritech.se>
References: <4F16CA98.70503@gmail.com>
In-Reply-To: <4F16CA98.70503@gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: Re: Extending meta-toolchain-*
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
X-List-Received-Date: Wed, 18 Jan 2012 14:16:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bj=F6rn,=0A=
=0A=
I recently had a similar problem.=0A=
I think it solved itself by some more thorough clean'ing, e.g. clean for bo=
th the toolchain and the affected tasks.=0A=
The RDEPENDS of the target task should be the right place.=0A=
=0A=
BR // Mats=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Bj=F6rn Krombholz [pirobk@gma=
il.com]=0A=
Sent: Wednesday, January 18, 2012 2:35 PM=0A=
To: ML openembedded-devel=0A=
Subject: [oe] Extending meta-toolchain-*=0A=
=0A=
Hi,=0A=
=0A=
I need someone to point me in the right direction.=0A=
=0A=
I'm trying to extend meta-toolchain-qte to generate an external=0A=
toolchain for QTembedded with QWT.=0A=
=0A=
What are the required steps to add any libraries/headers to toolchains?=0A=
=0A=
I tried adding libqwt-dev to the RDEPENDS of the meta package itself or=0A=
the affected task-qte-toolchain-target.bb.=0A=
=0A=
This triggers a build of qwt when bitbaking meta-toolchain-qte, but the=0A=
resulting toolchain tarball doesn't contain anything qwt related.=0A=
=0A=
Any hints?=0A=
=0A=
=0A=
Thx=0A=
Bj=F6rn=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


