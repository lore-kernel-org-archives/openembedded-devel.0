Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1Qh1uD-0001t3-EH
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 18:03:21 +0200
Received: by vws2 with SMTP id 2so4900326vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 08:59:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.95.194 with SMTP id dm2mr1313462vdb.47.1310572761924; Wed,
	13 Jul 2011 08:59:21 -0700 (PDT)
Received: by 10.220.182.136 with HTTP; Wed, 13 Jul 2011 08:59:21 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C06C3C6@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C06B114@post.tritech.se>
	<CA+Hv2hE6SgFS0uHFAp6Qz=BeTXDQZmbMiC3ZetscxrwRr_woDQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C06C3C6@post.tritech.se>
Date: Wed, 13 Jul 2011 11:59:21 -0400
Message-ID: <CA+Hv2hH=cOYWH1SnsEtza_kp54wTE1U01b5Yv6E7xwtYdC8fZg@mail.gmail.com>
From: Bob Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Wed, 13 Jul 2011 16:03:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2011 at 11:37 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>w=
rote:

> Thank you Bob!
>
> You're my hero, honestly!
>

No problem, happy to help!


> The "clean build" time concerns me though. I will need bluez components,
> but not gstreamer so I guess I'll set out to find a neat way to override
> the default bluez recipe and get rid of that dependency.
>
>
I would normally override this in my layer using amend.inc. You can probabl=
y
do it with bbappend too, but I'm not too familiar with that.

The basic idea to remove that dependency would be to override/modify
bluez4.inc (or any other offending files):
 - remove gst-plugins-base from DEPENDS so gstreamer and all dependencies
don't get built
 - fix configuring/compiling of the package after removing the dependency
(like modify EXTRA_OECONF to get rid of the enable gstreamer switch)

That may not be all that needs done, but that should at least get you on th=
e
right track.

Enjoy!
Bob

// Mats
>
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [
> openembedded-devel-bounces@lists.openembedded.org] on behalf of Bob
> Foerster [robert@erafx.com]
> Sent: Wednesday, July 13, 2011 4:18 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Unwanted dependency on X from ppp
>
> Hi Mats,
>
> On Wed, Jul 13, 2011 at 8:16 AM, Mats K=E4rrman <Mats.Karrman@tritech.se
> >wrote:
>
> > Hi Everyone!
> >
> > I'm building a small "headless" embedded system with OE and the Angstro=
m
> > distro. A normal rootfs build consists of about 1500 tasks. Everything
> fine
> > so far.
> >
> > Now I wanted to include the ppp daemon in my build and thus just added
> > "ppp" to IMAGE_INSTALL. Suddenly the rootfs build is about 4000 tasks a=
nd
> a
> > lot of X/display related stuff is downloaded and built. I fail to see t=
he
> > connection.
> >
>
> Are the X/display items you're concerned about actually making it into th=
e
> final image, or just being built?  If they are ending up in the image, th=
en
> it will take some investigation as to why that's happening. If they're ju=
st
> being built there is probably not much you can do, but the following may
> help shed some light as to why they are built.
>
> To understand why adding ppp pulls in various X/display packages, keep in
> mind that what is downloaded and built does not directly correlate to wha=
t
> ends up in the image.  Often, recipes may provide several packages which
> have a broad set of build time dependencies, but these don't all
> necessarily
> end up in the image.
>
> For tracking down dependencies, you can fire up the dependency explorer g=
ui
> for bitbake:
> bitbake -g -u depexp ppp
>
> Doing this and following the trail, one sees:
> ppp -> libpcap -> bluez-libs (here, bluez4 is selected as provider for
> bluez-libs) -> gst-plugins-base -> gtk+ -> libx*
>
> Given this dependency chain, we start to see why building ppp causes
> various
> gtk+ and X packages to be built. The bluez4 recipe provides a package
> gst-plugin-bluez, causing a build time dependency on gst-plugins-base.
>  gst-plugins-base depends on many things, including gtk+.  As a result of
> these dependencies, many packages end up being built.  The shlibs code in
> OE
> automatically detects the run time libs required for a given package and
> appropriately associates run time dependencies on them.  As such, unless
> one
> adds gst-plugin-bluez to IMAGE_INSTALL, I wouldn't expect the various gtk=
+,
> libx*, etc packages to make it into the final image.  If they are, then
> there is another dependency that is pulling them into the image and needs
> explored.  For a little bit more background on build vs run time
> dependencies, see [1].
>
> Hope that helps clarify a bit.
> Bob
>
> [1]
>
> http://dominion.thruhere.net/koen/cms/reducing-the-size-of-your-angstrom-=
rootfs-without-changing-the-buildsystem
>
>
>
> > I'm afraid I'm not using the latest trunk or release of OE but any
> > suggestions or directions on how to find/eliminate the cause of the
> problem
> > would be greatly appreciated!
> >
> > Best Regards,
> > Mats
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
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

