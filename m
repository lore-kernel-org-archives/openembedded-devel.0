Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RnX4q-0005Po-R7
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 16:05:28 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id q0IEvjGF010789
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 15:57:50 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0247.003; Wed, 18 Jan 2012 15:57:45 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [2011.03-maintenance] Packaged staging, anyone?
Thread-Index: AczVwbA+u1Boubb6TNimhWV0/ZIKgQAJks4AAAI5HIk=
Date: Wed, 18 Jan 2012 14:57:44 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4023559A@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C402354D3@post.tritech.se>,
	<CA+M6bXknfM8wUn+4veBsabFL6cRLxpqA+P_NNGpNv0o=zPOrVg@mail.gmail.com>
In-Reply-To: <CA+M6bXknfM8wUn+4veBsabFL6cRLxpqA+P_NNGpNv0o=zPOrVg@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Packaged staging, anyone?
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
X-List-Received-Date: Wed, 18 Jan 2012 15:05:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Tom,=0A=
=0A=
Thanks for answering.=0A=
I just found the fix in master branch (sorry for not looking there first), =
commit 	1aeea48674d3e831a5830e43ad4fdcfab295ebd2 on /classes/packaged-stagi=
ng.bbclass.=0A=
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


