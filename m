Received: from p3plsmtpa07-02.prod.phx3.secureserver.net ([173.201.192.231])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Qh31n-0003S3-JQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 19:15:15 +0200
Received: (qmail 16676 invoked from network); 13 Jul 2011 16:11:13 -0000
Received: from unknown (209.242.7.176)
	by p3plsmtpa07-02.prod.phx3.secureserver.net (173.201.192.231) with
	ESMTP; 13 Jul 2011 16:11:13 -0000
Message-ID: <4E1DC39A.5010309@mwester.net>
Date: Wed, 13 Jul 2011 11:11:06 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C06B114@post.tritech.se>,
	<CA+Hv2hE6SgFS0uHFAp6Qz=BeTXDQZmbMiC3ZetscxrwRr_woDQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C06C3C6@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C06C3C6@post.tritech.se>
Cc: =?ISO-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
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
X-List-Received-Date: Wed, 13 Jul 2011 17:15:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 7/13/2011 10:37 AM, Mats Kärrman wrote:
> Thank you Bob!
> 
> You're my hero, honestly!
> 
> The "clean build" time concerns me though. I will need bluez components,
> but not gstreamer so I guess I'll set out to find a neat way to override
> the default bluez recipe and get rid of that dependency.

This topic comes up for discussion now and again, and nothing really
ever gets resolved.  There are two camps, it seems -- I fall into the
group that cares about build time as much as I care about what ends up
in the image.

In any case, perhaps the following incantations might be helpful; they
are somewhat dated (double-check these against the current recipes!),
but I used these in my local.conf to get rid of useless X11 builds on my
build machines:

DEPENDS_pn-bluez-libs = "dbus"
EXTRA_OECONF_pn-bluez-libs = "--disable-tools --disable-network
--disable-serial --disable-service --disable-usb --enable-alsa"

DEPENDS_pn-bluez4 = "alsa-lib virtual/libusb0 dbus-glib libsndfile1"
EXTRA_OECONF_pn-bluez4 = "--disable-gstreamer --enable-alsa --enable-usb
--enable-netlink --enable-tools --enable-bccmd --enable-hid2hci
--enable-dfutool --enable-hidd --enable-pand --enable-dund
--disable-cups --enable-test --enable-manpages --enable-configfiles
--enable-initscripts --disable-pcmciarules"

DEPENDS_pn-dbus = "expat glib-2.0 virtual/libintl libsm libice"
EXTRA_OECONF_X_pn-dbus = "--without-x"

-Mike (mwester)

> 
> // Mats
> 
> ________________________________________     
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel-bounces@lists.openembedded.org] on behalf of Bob Foerster [robert@erafx.com]
> Sent: Wednesday, July 13, 2011 4:18 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Unwanted dependency on X from ppp
> 
> Hi Mats,
> 
> On Wed, Jul 13, 2011 at 8:16 AM, Mats Kärrman <Mats.Karrman@tritech.se>wrote:
> 
>> Hi Everyone!
>>
>> I'm building a small "headless" embedded system with OE and the Angstrom
>> distro. A normal rootfs build consists of about 1500 tasks. Everything fine
>> so far.
>>
>> Now I wanted to include the ppp daemon in my build and thus just added
>> "ppp" to IMAGE_INSTALL. Suddenly the rootfs build is about 4000 tasks and a
>> lot of X/display related stuff is downloaded and built. I fail to see the
>> connection.
>>
> 
> Are the X/display items you're concerned about actually making it into the
> final image, or just being built?  If they are ending up in the image, then
> it will take some investigation as to why that's happening. If they're just
> being built there is probably not much you can do, but the following may
> help shed some light as to why they are built.
> 
> To understand why adding ppp pulls in various X/display packages, keep in
> mind that what is downloaded and built does not directly correlate to what
> ends up in the image.  Often, recipes may provide several packages which
> have a broad set of build time dependencies, but these don't all necessarily
> end up in the image.
> 
> For tracking down dependencies, you can fire up the dependency explorer gui
> for bitbake:
> bitbake -g -u depexp ppp
> 
> Doing this and following the trail, one sees:
> ppp -> libpcap -> bluez-libs (here, bluez4 is selected as provider for
> bluez-libs) -> gst-plugins-base -> gtk+ -> libx*
> 
> Given this dependency chain, we start to see why building ppp causes various
> gtk+ and X packages to be built. The bluez4 recipe provides a package
> gst-plugin-bluez, causing a build time dependency on gst-plugins-base.
>  gst-plugins-base depends on many things, including gtk+.  As a result of
> these dependencies, many packages end up being built.  The shlibs code in OE
> automatically detects the run time libs required for a given package and
> appropriately associates run time dependencies on them.  As such, unless one
> adds gst-plugin-bluez to IMAGE_INSTALL, I wouldn't expect the various gtk+,
> libx*, etc packages to make it into the final image.  If they are, then
> there is another dependency that is pulling them into the image and needs
> explored.  For a little bit more background on build vs run time
> dependencies, see [1].
> 
> Hope that helps clarify a bit.
> Bob
> 
> [1]
> http://dominion.thruhere.net/koen/cms/reducing-the-size-of-your-angstrom-rootfs-without-changing-the-buildsystem
> 
> 
> 
>> I'm afraid I'm not using the latest trunk or release of OE but any
>> suggestions or directions on how to find/eliminate the cause of the problem
>> would be greatly appreciated!
>>
>> Best Regards,
>> Mats
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 



