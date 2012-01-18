Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RnXuz-0006Dp-F8
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 16:59:21 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id q0IFpc71010939
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 16:51:43 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0247.003; Wed, 18 Jan 2012 16:51:38 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [2011.03-maintenance] Packaged staging -- dependency problem
Thread-Index: AQHM1fgslclPXSKuoUKXq76jtgMtFg==
Date: Wed, 18 Jan 2012 15:51:37 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C402355CD@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Packaged staging -- dependency problem
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
X-List-Received-Date: Wed, 18 Jan 2012 15:59:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Well, now at least it pulls packages from the mirror instead of building th=
em but there is a but.=0A=
=0A=
When building glib-2.0, do_configure uses autotools and the configure scrip=
t of glib-2.0 wants to use sed from sysroots. sed-native exists in the mirr=
or but has not been installed in sysroots. I am uncertain where the depende=
ncy on sed (or sed-native?) is missing/should be added. In the glib recipe =
or for autotools class? (this time i looked in master but found no relevant=
 patches.)=0A=
=0A=
Any advice?=0A=
=0A=
BR // Mats=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Mats K=E4rrman [Mats.Karrman@=
tritech.se]=0A=
Sent: Wednesday, January 18, 2012 3:57 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [2011.03-maintenance] Packaged staging, anyone?=0A=
=0A=
Hi Tom,=0A=
=0A=
Thanks for answering.=0A=
I just found the fix in master branch (sorry for not looking there first), =
commit       1aeea48674d3e831a5830e43ad4fdcfab295ebd2 on /classes/packaged-=
staging.bbclass.=0A=
Apparently you helped fixing this issue then :)=0A=
I have tried the patch and it works for me so I will send you a pull-reques=
t shortly.=0A=
=0A=
BR // Mats=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gmail.com]=
=0A=
Sent: Wednesday, January 18, 2012 3:49 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [2011.03-maintenance] Packaged staging, anyone?=0A=
=0A=
On Wed, Jan 18, 2012 at 2:33 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> w=
rote:=0A=
> Hi,=0A=
>=0A=
> I'm trying to set up packaged staging for my project. I found some instru=
ctions in the packaged-staging.bb file header and some info in the mailing =
list that I followed but it don't seem to work. Everything is built from sc=
ratch anyway -- no error messages.=0A=
[snip]=0A=
=0A=
After populating the pstage mirror directory, when you do bitbake -e=0A=
somepkg (where somepkg is in the pstage mirror) do the PSTAGE*=0A=
variables expand such that the file it's looking for as a pstage=0A=
exist?  What if you use python or some other trivial http server and=0A=
try and use the mirror that way?  I seem to recall I had an issue with=0A=
PSTAGE_MIRROR and file URIs but I forget if there was a good solution=0A=
to it (or if making use of python -m SImpleHTTPServer was the=0A=
solution).=0A=
=0A=
--=0A=
Tom=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


