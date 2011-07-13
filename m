Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1Qh0Kg-0008Ct-RU
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 16:22:35 +0200
Received: by vxa37 with SMTP id 37so4746342vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 07:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.86.8 with SMTP id q8mr324124vcl.174.1310566715230; Wed, 13
	Jul 2011 07:18:35 -0700 (PDT)
Received: by 10.220.182.136 with HTTP; Wed, 13 Jul 2011 07:18:35 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C06B114@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C06B114@post.tritech.se>
Date: Wed, 13 Jul 2011 10:18:35 -0400
Message-ID: <CA+Hv2hE6SgFS0uHFAp6Qz=BeTXDQZmbMiC3ZetscxrwRr_woDQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jul 2011 14:22:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Mats,

On Wed, Jul 13, 2011 at 8:16 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>wr=
ote:

> Hi Everyone!
>
> I'm building a small "headless" embedded system with OE and the Angstrom
> distro. A normal rootfs build consists of about 1500 tasks. Everything fi=
ne
> so far.
>
> Now I wanted to include the ppp daemon in my build and thus just added
> "ppp" to IMAGE_INSTALL. Suddenly the rootfs build is about 4000 tasks and=
 a
> lot of X/display related stuff is downloaded and built. I fail to see the
> connection.
>

Are the X/display items you're concerned about actually making it into the
final image, or just being built?  If they are ending up in the image, then
it will take some investigation as to why that's happening. If they're just
being built there is probably not much you can do, but the following may
help shed some light as to why they are built.

To understand why adding ppp pulls in various X/display packages, keep in
mind that what is downloaded and built does not directly correlate to what
ends up in the image.  Often, recipes may provide several packages which
have a broad set of build time dependencies, but these don't all necessaril=
y
end up in the image.

For tracking down dependencies, you can fire up the dependency explorer gui
for bitbake:
bitbake -g -u depexp ppp

Doing this and following the trail, one sees:
ppp -> libpcap -> bluez-libs (here, bluez4 is selected as provider for
bluez-libs) -> gst-plugins-base -> gtk+ -> libx*

Given this dependency chain, we start to see why building ppp causes variou=
s
gtk+ and X packages to be built. The bluez4 recipe provides a package
gst-plugin-bluez, causing a build time dependency on gst-plugins-base.
 gst-plugins-base depends on many things, including gtk+.  As a result of
these dependencies, many packages end up being built.  The shlibs code in O=
E
automatically detects the run time libs required for a given package and
appropriately associates run time dependencies on them.  As such, unless on=
e
adds gst-plugin-bluez to IMAGE_INSTALL, I wouldn't expect the various gtk+,
libx*, etc packages to make it into the final image.  If they are, then
there is another dependency that is pulling them into the image and needs
explored.  For a little bit more background on build vs run time
dependencies, see [1].

Hope that helps clarify a bit.
Bob

[1]
http://dominion.thruhere.net/koen/cms/reducing-the-size-of-your-angstrom-ro=
otfs-without-changing-the-buildsystem



> I'm afraid I'm not using the latest trunk or release of OE but any
> suggestions or directions on how to find/eliminate the cause of the probl=
em
> would be greatly appreciated!
>
> Best Regards,
> Mats
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

