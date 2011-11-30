Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RVhEK-0003yI-NJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 11:17:33 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pAUAAlkM026958
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 11:10:52 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 30 Nov 2011 11:10:48 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Can't get BBLAYERS working with 2011.03-maintenance RECALL
Thread-Index: AQHMr0hULX7buIvbbUS4naZTWT7Z5Q==
Date: Wed, 30 Nov 2011 10:10:48 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A242A@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: Can't get BBLAYERS working with 2011.03-maintenance RECALL
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
X-List-Received-Date: Wed, 30 Nov 2011 10:17:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry!=0A=
Forget this, I'm an idiot!=0A=
I found a conflicting definition of BBFILES in local.conf.=0A=
=0A=
BR // Mats=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Mats K=E4rrman [Mats.Karrman@=
tritech.se]=0A=
Sent: Wednesday, November 30, 2011 10:37 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: [oe] Can't get BBLAYERS working with 2011.03-maintenance=0A=
=0A=
 Hi,=0A=
=0A=
I want to start using BBLAYERS and .bbappend with my 2011.03-maintenance pr=
oject. I found a nice introduction ( http://sakrah.homelinux.org/blog/2010/=
11/bblayers-bbappend/ ) that I followed.=0A=
Now I've got the following ($PWD and TOPDIR is .../oe/):=0A=
=0A=
--- setup script ---=0A=
export OEBASE=3D$PWD=0A=
export DL_DIR=3D$ARCHIVE_DIR=0A=
export BB_ENV_EXTRAWHITE=3D"OEBASE MACHINE DISTRO DL_DIR"=0A=
export PATH=3D$OEBASE/bitbake/bin:$PATH=0A=
=0A=
--- .../oe/conf//bblayers.conf ---=0A=
TOPDIR :=3D "${@os.path.dirname(os.path.dirname(d.getVar('FILE', True)))}"=
=0A=
BBPATH =3D "${TOPDIR}"=0A=
BBLAYERS =3D "${TOPDIR}/openembedded ${TOPDIR}/local"=0A=
=0A=
--- .../oe/openembedded/conf/layer.conf ---=0A=
BBFILES +=3D "${LAYERDIR}/recipes/*/*.bb"=0A=
BBPATH .=3D ":${LAYERDIR}"=0A=
BBFILE_COLLECTIONS +=3D "oe"=0A=
BBFILE_PRIORITY_oe =3D "0"=0A=
BBFILE_PATTERN_oe =3D "^${LAYERDIR}/"=0A=
=0A=
--- .../oe/local/conf/layer.conf ---=0A=
BBFILES +=3D "${LAYERDIR}/recipes/*/*.bb ${LAYERDIR}/recipes/*/*.bbappend"=
=0A=
BBPATH .=3D ":${LAYERDIR}"=0A=
BBFILE_COLLECTIONS +=3D "local"=0A=
BBFILE_PRIORITY_local =3D "1"=0A=
BBFILE_PATTERN_local =3D "${LAYERDIR}"=0A=
=0A=
Now, if I run "bitbake -e" all variables seem to get the correct values exc=
ept BBFILES that gets the .bb entry for both openembedded and local but no =
.bbappend!=0A=
I have tried with both bitbake 1.12.0 and 1.14.0 but there is no difference=
 in the outcome.=0A=
I can see in the debug log that the .../oe/local/conf/layer.conf is loaded =
and if I change the BBFILES line to garbage I get a parsing error but no ma=
tter what I write between the quotes it doesn't show up in the output...=0A=
=0A=
If anyone have a clue on what is wrong I would appreciate your help!=0A=
=0A=
BR // Mats=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


