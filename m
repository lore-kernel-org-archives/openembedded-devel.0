Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1QgzTJ-000751-ER
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 15:27:25 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p6DDNMpn014573
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 15:23:27 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 13 Jul 2011 15:23:23 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: using i2c on a mx28evk
Thread-Index: AcxBWJ5pFBYD1L5iTGuri3lGNGnqIQABuC0P
Date: Wed, 13 Jul 2011 13:23:22 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C06C364@post.tritech.se>
References: <311EE95A63F86C4E960B402004EAD7E310AF74E158@ZEUS.schoeps.local>
In-Reply-To: <311EE95A63F86C4E960B402004EAD7E310AF74E158@ZEUS.schoeps.local>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: using i2c on a mx28evk
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
X-List-Received-Date: Wed, 13 Jul 2011 13:27:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
Some "generic" clues:=0A=
Kernel modules are installed in the file system by adding "kernel-modules" =
to "IMAGE_INSTALL". =0A=
Some packages build their modules separately and then you need to add somet=
hing like "kernel-module-XYZ" to "IMAGE_INSTALL", this should be visible fr=
om the respective recipe.=0A=
=0A=
Hope this helps,=0A=
Mats=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Christian Borutta [Borutta@sc=
hoeps.de]=0A=
Sent: Wednesday, July 13, 2011 2:30 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: [oe] using i2c on a mx28evk=0A=
=0A=
Hello,=0A=
=0A=
I'm running an Angstr=F6m Linux on a Freescale mx28evk board. For using the=
 i2c ports of the board I compiled and installed the packages i2c and i2c-d=
ev, but the Kernelmoduls are missing.=0A=
=0A=
While booting the system sends the message:=0A=
=0A=
" FATAL: Module i2c-pxa not found.=0A=
   FATAL: Module i2c-pxa not found."=0A=
=0A=
I'm neither able to load the modules with modprobe nor do I find the module=
s ( I think one of them is  i2c-dev.ko) anywhere in the filesystem.=0A=
=0A=
Can anybody help me solving this issue?=0A=
=0A=
Christian Borutta=0A=
=0A=
Schoeps Mikrofone=0A=
Schalltechnik Dr.-Ing. Schoeps GmbH=0A=
Spitalstr. 20=0A=
76227 Karlsruhe - Germany=0A=
=0A=
Phone:+49 (0)721-94320-42=0A=
Fax: +49 (0)721-94320-50=0A=
www.schoeps.de=0A=
=0A=
Sitz der Gesellschaft: Karlsruhe=0A=
Amtsgericht Mannheim, HRB Nr. 102442=0A=
Gesch=E4ftsf=FChrer: Ulrich Schoeps, Dr. Helmut Wittek=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


