Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1QhKVo-0002uk-RI
	for Openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 13:55:25 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p6EBpJ0O017073
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 13:51:24 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Thu, 14 Jul 2011 13:51:19 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Unwanted dependency on X from ppp
Thread-Index: AcxBVadKX3oznpENRgmgOmmUfA9rmgAAVVyAAAY+8nH//+14AIABaP64
Date: Thu, 14 Jul 2011 11:51:18 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C06C48B@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C06B114@post.tritech.se>,
	<CA+Hv2hE6SgFS0uHFAp6Qz=BeTXDQZmbMiC3ZetscxrwRr_woDQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C06C3C6@post.tritech.se>,
	<4E1DC39A.5010309@mwester.net>
In-Reply-To: <4E1DC39A.5010309@mwester.net>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: Unwanted dependency on X from ppp
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
X-List-Received-Date: Thu, 14 Jul 2011 11:55:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks again, Mike & Bob,=0A=
=0A=
I added something in the line of Mike's suggestion to my machine conf and=
=0A=
got the number of tasks down to just over 2200 and the build runs reasonabl=
y=0A=
fast. There are still a bunch of X native related dependencies generated fr=
om=0A=
dbus but I found no easy way to get rid of them.=0A=
=0A=
Still - a huge improvement!=0A=
=0A=
// Mats=0A=
________________________________________=0A=
From: Mike Westerhof [mike@mwester.net]=0A=
Sent: Wednesday, July 13, 2011 6:11 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Cc: Mats K=E4rrman=0A=
Subject: Re: [oe] Unwanted dependency on X from ppp=0A=
=0A=
On 7/13/2011 10:37 AM, Mats K=E4rrman wrote:=0A=
> Thank you Bob!=0A=
>=0A=
> You're my hero, honestly!=0A=
>=0A=
> The "clean build" time concerns me though. I will need bluez components,=
=0A=
> but not gstreamer so I guess I'll set out to find a neat way to override=
=0A=
> the default bluez recipe and get rid of that dependency.=0A=
=0A=
This topic comes up for discussion now and again, and nothing really=0A=
ever gets resolved.  There are two camps, it seems -- I fall into the=0A=
group that cares about build time as much as I care about what ends up=0A=
in the image.=0A=
=0A=
In any case, perhaps the following incantations might be helpful; they=0A=
are somewhat dated (double-check these against the current recipes!),=0A=
but I used these in my local.conf to get rid of useless X11 builds on my=0A=
build machines:=0A=
=0A=
DEPENDS_pn-bluez-libs =3D "dbus"=0A=
EXTRA_OECONF_pn-bluez-libs =3D "--disable-tools --disable-network=0A=
--disable-serial --disable-service --disable-usb --enable-alsa"=0A=
=0A=
DEPENDS_pn-bluez4 =3D "alsa-lib virtual/libusb0 dbus-glib libsndfile1"=0A=
EXTRA_OECONF_pn-bluez4 =3D "--disable-gstreamer --enable-alsa --enable-usb=
=0A=
--enable-netlink --enable-tools --enable-bccmd --enable-hid2hci=0A=
--enable-dfutool --enable-hidd --enable-pand --enable-dund=0A=
--disable-cups --enable-test --enable-manpages --enable-configfiles=0A=
--enable-initscripts --disable-pcmciarules"=0A=
=0A=
DEPENDS_pn-dbus =3D "expat glib-2.0 virtual/libintl libsm libice"=0A=
EXTRA_OECONF_X_pn-dbus =3D "--without-x"=0A=
=0A=
-Mike (mwester)=0A=
=0A=
>=0A=
> // Mats=0A=
>=0A=
> ________________________________________=0A=
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Bob Foerster [robert@erafx.=
com]=0A=
> Sent: Wednesday, July 13, 2011 4:18 PM=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: Re: [oe] Unwanted dependency on X from ppp=0A=
>=0A=
> Hi Mats,=0A=
>=0A=
> On Wed, Jul 13, 2011 at 8:16 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>=
wrote:=0A=
>=0A=
>> Hi Everyone!=0A=
>>=0A=
>> I'm building a small "headless" embedded system with OE and the Angstrom=
=0A=
>> distro. A normal rootfs build consists of about 1500 tasks. Everything f=
ine=0A=
>> so far.=0A=
>>=0A=
>> Now I wanted to include the ppp daemon in my build and thus just added=
=0A=
>> "ppp" to IMAGE_INSTALL. Suddenly the rootfs build is about 4000 tasks an=
d a=0A=
>> lot of X/display related stuff is downloaded and built. I fail to see th=
e=0A=
>> connection.=0A=
>>=0A=
>=0A=
> Are the X/display items you're concerned about actually making it into th=
e=0A=
> final image, or just being built?  If they are ending up in the image, th=
en=0A=
> it will take some investigation as to why that's happening. If they're ju=
st=0A=
> being built there is probably not much you can do, but the following may=
=0A=
> help shed some light as to why they are built.=0A=
>=0A=
> To understand why adding ppp pulls in various X/display packages, keep in=
=0A=
> mind that what is downloaded and built does not directly correlate to wha=
t=0A=
> ends up in the image.  Often, recipes may provide several packages which=
=0A=
> have a broad set of build time dependencies, but these don't all necessar=
ily=0A=
> end up in the image.=0A=
>=0A=
> For tracking down dependencies, you can fire up the dependency explorer g=
ui=0A=
> for bitbake:=0A=
> bitbake -g -u depexp ppp=0A=
>=0A=
> Doing this and following the trail, one sees:=0A=
> ppp -> libpcap -> bluez-libs (here, bluez4 is selected as provider for=0A=
> bluez-libs) -> gst-plugins-base -> gtk+ -> libx*=0A=
>=0A=
> Given this dependency chain, we start to see why building ppp causes vari=
ous=0A=
> gtk+ and X packages to be built. The bluez4 recipe provides a package=0A=
> gst-plugin-bluez, causing a build time dependency on gst-plugins-base.=0A=
>  gst-plugins-base depends on many things, including gtk+.  As a result of=
=0A=
> these dependencies, many packages end up being built.  The shlibs code in=
 OE=0A=
> automatically detects the run time libs required for a given package and=
=0A=
> appropriately associates run time dependencies on them.  As such, unless =
one=0A=
> adds gst-plugin-bluez to IMAGE_INSTALL, I wouldn't expect the various gtk=
+,=0A=
> libx*, etc packages to make it into the final image.  If they are, then=
=0A=
> there is another dependency that is pulling them into the image and needs=
=0A=
> explored.  For a little bit more background on build vs run time=0A=
> dependencies, see [1].=0A=
>=0A=
> Hope that helps clarify a bit.=0A=
> Bob=0A=
>=0A=
> [1]=0A=
> http://dominion.thruhere.net/koen/cms/reducing-the-size-of-your-angstrom-=
rootfs-without-changing-the-buildsystem=0A=
>=0A=
>=0A=
>=0A=
>> I'm afraid I'm not using the latest trunk or release of OE but any=0A=
>> suggestions or directions on how to find/eliminate the cause of the prob=
lem=0A=
>> would be greatly appreciated!=0A=
>>=0A=
>> Best Regards,=0A=
>> Mats=0A=
>>=0A=
>> _______________________________________________=0A=
>> Openembedded-devel mailing list=0A=
>> Openembedded-devel@lists.openembedded.org=0A=
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=
=0A=
>>=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
>=0A=
>=0A=
=0A=


