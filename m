Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1QyKDQ-0004tZ-UA
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 11:02:41 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p7U8vg2R003841
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 10:57:47 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Tue, 30 Aug 2011 10:57:42 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Creating static device nodes with udev
Thread-Index: Acxm8Y+OZx1IhKaQTkqkN2Ucp6Nxng==
Date: Tue, 30 Aug 2011 08:57:41 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C40040669@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Creating static device nodes with udev
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
X-List-Received-Date: Tue, 30 Aug 2011 09:02:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm using OE-classic and udev 151 on a PPC target.

I have some devices not supporting sysfs, eg ppp, so I need to create stati=
c device nodes for these.
Previously I have used scripts linked via rcS.d that runs mknod after udev =
has been loaded but this feels sort of sub-optimal.

I found the "udev-static-devices" recipe but I can't make it work.
What I've done is:
- I manually created a directory 'devices' with the device nodes I need usi=
ng mknod.
- I tar'ed this into 'udev_static_devices_tarball'.
- I ran bitbake to put them into a package and installed this package on my=
 target using opkg.
- I verified that my device nodes now exist in /lib/udev/devices
- I rebooted the target.
... Still, my device nodes does not exist in /dev.

Any clue on what I have forgotten? Must the "static" feature be enabled in =
some way?

Do anyone have a better approach to creating static device nodes? E.g. usin=
g makedevs or...

Thanks a bunch for your support!
// Mats


