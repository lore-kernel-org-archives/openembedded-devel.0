Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1SUDf3-0002F8-KB
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 11:03:17 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id q4F8na6l010197
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 10:49:41 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0283.003; Tue, 15 May 2012 10:49:36 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: autotools + native ends up with no include in sysroots
Thread-Index: Ac0ydoL3mlVDuEEQR+S9jkY0DWbWig==
Date: Tue, 15 May 2012 08:49:35 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4256A4EA@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: autotools + native ends up with no include in sysroots
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
X-List-Received-Date: Tue, 15 May 2012 09:03:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I'm running a project using OE-classic.=0A=
=0A=
I have a recipe (call it xxx) that uses autotools and builds a package succ=
essfully for target. This recipe uses a custom do_install to extract releva=
nt files from the source, e.g. include files for the dev package.=0A=
=0A=
I have now tried to build a native version by creating a new xxx-native rec=
ipe that requires the xxx recipe and inherits native (something that have w=
orked well for other recipes). This recipe also builds without errors and I=
 get working executables and libraries under sysroots but there are no incl=
ude files... =0A=
=0A=
I have tried to decipher the log files and native and autotools classes and=
 found that my custom do_install is simply ignored when building for native=
.=0A=
=0A=
Is there a way to convince the native build to use my do_install?=0A=
Any other advice how to proceed?=0A=
=0A=
Thanks && BR // Mats=0A=


