Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OJTXu-0006Lg-BT
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 17:38:29 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OJTTo-0004DN-9k; Tue, 01 Jun 2010 11:34:12 -0400
Date: Tue, 1 Jun 2010 11:34:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
In-Reply-To: <20100601144602.GE5446@jama>
Message-ID: <alpine.DEB.2.00.1006011129500.17707@lynx>
References: <4C04F6FD.4070804@mlbassoc.com>
	<alpine.DEB.2.00.1006011021440.32142@lynx>
	<20100601144602.GE5446@jama>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] Is Angstrom dead?
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
X-List-Received-Date: Tue, 01 Jun 2010 15:38:29 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 1 Jun 2010, Martin Jansa wrote:

> On Tue, Jun 01, 2010 at 10:24:33AM -0400, Robert P. J. Day wrote:
> > On Tue, 1 Jun 2010, Gary Thomas wrote:
> >
> > > I tried again today, updating to org.openembedded.dev branch,
> > > commit a2834c64fb3ed535fca51c25547754fa907e4ca5  Sadly, new
> > > problems (and probably still the old ones) remain:
> > >
> > > | checking for CHEESE... configure: error: Package requirements (  glib-2.0 >=
> > > 2.16.0   gobject-2.0 >= 2.12.0   gio-2.0 >= 2.16.0   gtk+-2.0 >= 2.19.1
> > > gdk-2.0 >= 2.14.0 gnome-desktop-2.0 >= 2.26.0   gconf-2.0 >= 2.16.0
> > > gstreamer-0.10 >= 0.10.23   gstreamer-plugins-base-0.10 >= 0.10.23   cairo >=
> > > 1.4.0   dbus-1 >= 1.0   dbus-glib-1 >= 0.7 pangocairo >= 1.18.0   librsvg-2.0
> > > >= 2.18.0
> > > |   libcanberra-gtk gudev-1.0) were not met:
> > > |
> > > | No package 'gstreamer-plugins-base-0.10' found
> > > |
> > > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > > | installed software in a non-standard prefix.
> > > |
> > > | Alternatively, you may set the environment variables CHEESE_CFLAGS
> > > | and CHEESE_LIBS to avoid the need to call pkg-config.
> > > | See the pkg-config man page for more details.
> > > |
> > > NOTE: package cheese-2.30.1-r0: task do_configure: Failed
> >
> >   now i'm slightly confused since neither ubuntu or fedora appear to
> > have any pkgconfig info for the cheese package, so why would there be
> > a test for it that you would need to override?  or is this not
> > pkgconfig-related?
>
> It says:
> > > | No package 'gstreamer-plugins-base-0.10' found
>
> was gstreamer-plugins-base built before building cheese? It's only
> in RRECOMMENDS so if it's now in latest version required dependency
> then gstreamer should be moved to DEPENDS (to make sure it's built
> before do_configure of cheese.
>
> Or it cannot find pkgconfig from gstreamer-plugins-base, I don't see
> why it should look from its own pkgconfig file..

  i can't comment on that and i could be entirely off-base here.  i'm
simply pointing out that, ironically, i had *exactly* this issue
yesterday with a different software package -- running the initial
"configure" step expected to find that package's pkgconfig info and,
if it wasn't there, the configure failed.  the only way around it was
(exactly as above) to set the variables *_CFLAGS and *_LIBS manually,
which would override the configuration's attempt to query pkconfig for
that info.

  as i said, i could be *completely* wrong.  but this is what i dealt
with yesterday, and that's how i fixed it.

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


