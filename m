Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1Qyh53-0002r1-QB
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 11:27:34 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p7V9MXG1007948
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 11:22:39 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 31 Aug 2011 11:22:34 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Creating static device nodes with udev
Thread-Index: AQHMZ7+CV6I14qODjkam1U616XMVRw==
Date: Wed, 31 Aug 2011 09:22:31 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C400408CF@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: Creating static device nodes with udev
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
X-List-Received-Date: Wed, 31 Aug 2011 09:27:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi again,=0A=
=0A=
In case anybody wonders, the reason for my trouble was that prior to udev 1=
55, the init script starting udev must itself copy the contents of /lib/ude=
v/devices to /dev after mounting the tmpfs on /dev and the OE init scripts =
I were using didn't do that. Upgrading to udev 162 solved the problem.=0A=
=0A=
// Mats=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Mats K=E4rrman [Mats.Karrman@=
tritech.se]=0A=
Sent: Tuesday, August 30, 2011 10:57 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: [oe] Creating static device nodes with udev=0A=
=0A=
Hi,=0A=
=0A=
I'm using OE-classic and udev 151 on a PPC target.=0A=
=0A=
I have some devices not supporting sysfs, eg ppp, so I need to create stati=
c device nodes for these.=0A=
Previously I have used scripts linked via rcS.d that runs mknod after udev =
has been loaded but this feels sort of sub-optimal.=0A=
=0A=
I found the "udev-static-devices" recipe but I can't make it work.=0A=
What I've done is:=0A=
- I manually created a directory 'devices' with the device nodes I need usi=
ng mknod.=0A=
- I tar'ed this into 'udev_static_devices_tarball'.=0A=
- I ran bitbake to put them into a package and installed this package on my=
 target using opkg.=0A=
- I verified that my device nodes now exist in /lib/udev/devices=0A=
- I rebooted the target.=0A=
.... Still, my device nodes does not exist in /dev.=0A=
=0A=
Any clue on what I have forgotten? Must the "static" feature be enabled in =
some way?=0A=
=0A=
Do anyone have a better approach to creating static device nodes? E.g. usin=
g makedevs or...=0A=
=0A=
Thanks a bunch for your support!=0A=
// Mats=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


