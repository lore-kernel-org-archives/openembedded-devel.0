Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RnS5m-0006et-OX
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 10:46:07 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id q0I9XM8H009732
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 10:33:27 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0247.003; Wed, 18 Jan 2012 10:33:22 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [2011.03-maintenance] Packaged staging, anyone?
Thread-Index: AczVwbA+u1Boubb6TNimhWV0/ZIKgQ==
Date: Wed, 18 Jan 2012 09:33:20 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C402354D3@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: [2011.03-maintenance] Packaged staging, anyone?
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
X-List-Received-Date: Wed, 18 Jan 2012 09:46:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I'm trying to set up packaged staging for my project. I found some instruct=
ions in the packaged-staging.bb file header and some info in the mailing li=
st that I followed but it don't seem to work. Everything is built from scra=
tch anyway -- no error messages.=0A=
=0A=
Project layout:=0A=
=0A=
oe   (this is "OEBASE")=0A=
 |- bitbake  (1.12.0)=0A=
 |- build=0A=
 |    |- tmp  (normal build output)=0A=
 |    '- pstage_mirror  (copies of tmp/pstage)=0A=
 |- conf  (contains local.conf)=0A=
 |- local  (my project specific conf, recipes and bbappend's)=0A=
 '- openembedded  (2011.03 metadata, unchanged)=0A=
=0A=
In local conf I added:=0A=
=0A=
INHERIT +=3D "packaged-staging"=0A=
PSTAGE_MIRROR =3D "file://${OEBASE}/build/pstage_mirror"=0A=
=0A=
Values parses OK according to bitbake -e.=0A=
What I do:=0A=
=0A=
1) rm -rf build/tmp=0A=
2) MACHINE=3Dmymachine bitbake meta-toolchain=0A=
3) copy all contents of build/tmp/pstage to build/pstage_mirror=0A=
4) rm -rf build/tmp=0A=
5) MACHINE=3Dmymachine bitbake my-image=0A=
=0A=
Do anyone have any clues to what might be wrong, I would appreciate some hi=
nts!=0A=
=0A=
Thanks // Mats=0A=
=0A=


