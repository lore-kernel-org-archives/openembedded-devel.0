Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RYZd8-0007UT-Ea
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Dec 2011 09:47:02 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pB88e7r1026130
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Dec 2011 09:40:13 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Thu, 8 Dec 2011 09:40:08 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Capture output of shell command in bb variable
Thread-Index: Acy1hFHk/SK/NCVGQhuyRzk3S/nlGw==
Date: Thu, 8 Dec 2011 08:40:08 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A5598@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Capture output of shell command in bb variable
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
X-List-Received-Date: Thu, 08 Dec 2011 08:47:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm not a bitbake or Phyton guru so I wonder if anyone could help with this=
. Is it possible to capture the output of a shell command in a bitbake vari=
able during parsing of the recipes?
What I like to do is something like:

SVN_URL =3D some-phyton-stuff ( svn info |grep 'URL:' |cut -f 2 -d ' ' )

The reason is that I have some in-house developed software in the same SVN =
repo but I like the recipe for building it to be independent of the repo UR=
I and still be able to set PV using the SVN revision.

Any help is appreciated!

Mats


