Return-Path: <rcagle@omnitron-systems.com>
Received: from mail01.omnitron-systems.com (mail01.omnitron-systems.com
	[70.169.247.114])
	by mail.openembedded.org (Postfix) with ESMTP id D905073281
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:39:35 +0000 (UTC)
Received: from OSCAR.ostdom.com ([fe80::2158:4d9b:82b3:313d]) by
	oscar.ostdom.com ([fe80::2158:4d9b:82b3:313d%14]) with mapi id
	14.03.0319.002; Tue, 13 Dec 2016 15:39:36 -0800
From: Robert Cagle <rcagle@omnitron-systems.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] bitbake dependency question
Thread-Index: AdJU5iU1LANZZXXMQKOKaHr7Dnu+lQARkN2A//+VNKuAAZypgP//hYX5
Date: Tue, 13 Dec 2016 23:39:35 +0000
Message-ID: <44E60BE3F360494194A33E0B8411CB9A62BEDC@oscar.ostdom.com>
References: <44E60BE3F360494194A33E0B8411CB9A62ADD8@oscar.ostdom.com>
	<eb581f04-c965-f26c-97c2-3b04fd639515@windriver.com>
	<44E60BE3F360494194A33E0B8411CB9A62AE16@oscar.ostdom.com>,
	<2668593.4cPb1u5Jh3@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2668593.4cPb1u5Jh3@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.25.105]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: bitbake dependency question
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
X-List-Received-Date: Tue, 13 Dec 2016 23:39:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
Thanks for the response.

> Another way to handle this kind of situation with plugins is to simply bu=
ild
> them all with all dependencies, and have the runtime design such that it'=
s
> fully flexible as to which plugins are installed - then you just make the
> choice in the image. (Perhaps what you're building is already that way an=
d
> you're just trying to save on build time?)

Unfortunately in this particular case it is more of a "compile-time plugin"=
. RecipeD=20
generates and compiles a C file based on artifacts left in /usr/share by it=
s=20
dependencies (Recipes A, B, and/or C), so runtime configuration isn't an op=
tion.=20
In this case including unused plugins would cause incorrect results.=20

It appears this form of dependency isn't supported in OE, so I'll either us=
e a
variable defined in local.conf or more likely restructure the app so the pl=
ugins=20
and their host are all built within a single recipe/build. =20

Thanks for the info though, it is all very interesting.

> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

-Bob

