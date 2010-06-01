Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OJQht-0000mc-Ie
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 14:36:36 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OJQdn-0004Bh-W3; Tue, 01 Jun 2010 08:32:20 -0400
Date: Tue, 1 Jun 2010 08:32:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C04F6FD.4070804@mlbassoc.com>
Message-ID: <alpine.DEB.2.00.1006010824270.8729@lynx>
References: <4C04F6FD.4070804@mlbassoc.com>
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: Is Angstrom dead?
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
X-List-Received-Date: Tue, 01 Jun 2010 12:36:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 1 Jun 2010, Gary Thomas wrote:

> It sure feels like it :-(
>
> For a week, I've been trying to build various images in Angstrom and
> the problems I've faced have gone totally unanswered on either the
> Angstrom or OE mailing lists.  I'm not the only one facing these
> problems either.
>
> I'm mostly interested in building
> beagleboard-linuxtag2010-demo-image which [at least] implies it
> should be a great demo to show at LinuxTag (which starts in only a
> few days now).  Surely a show piece would be something that a
> popular project would want to support and be available to the
> masses??
>
> I tried again today, updating to org.openembedded.dev branch, commit
> a2834c64fb3ed535fca51c25547754fa907e4ca5 Sadly, new problems (and
> probably still the old ones) remain:
>
> | checking for CHEESE... configure: error: Package requirements (  glib-2.0 >=
> 2.16.0   gobject-2.0 >= 2.12.0   gio-2.0 >= 2.16.0   gtk+-2.0 >= 2.19.1
> gdk-2.0 >= 2.14.0 gnome-desktop-2.0 >= 2.26.0   gconf-2.0 >= 2.16.0
> gstreamer-0.10 >= 0.10.23   gstreamer-plugins-base-0.10 >= 0.10.23   cairo >=
> 1.4.0   dbus-1 >= 1.0   dbus-glib-1 >= 0.7 pangocairo >= 1.18.0   librsvg-2.0
> >= 2.18.0
> |   libcanberra-gtk gudev-1.0) were not met:
> |
> | No package 'gstreamer-plugins-base-0.10' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables CHEESE_CFLAGS
> | and CHEESE_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> |
> NOTE: package cheese-2.30.1-r0: task do_configure: Failed

  heh.  i feel your pain.  there's still a couple packages that fail
to build for me for beagleboard-demo-image but as for the other issue,
i went through that yesterday in another context.

  apparently (as best i understand), some distros build packages that
come with a pkg-config component, while others don't.  a given build
procedure might, when trying to figure out *how* to compile a given
package, consult pkg-config.  if there's no pkg-config info, what
happens is exactly what you see above, so you need to set the
corresponding vars to " " to effectively say you *know* what those
values should be and just leave pkg-config out of it.  and when you
fix that, it might happen again for another package.  etc, etc.
eventually, depending on your distro, you'll build up a list of env
vars that override pkg-config in some cases.

  i did this yesterday for a package that allegedly builds fine on
fedora, but fails as above on ubuntu.  and you didn't mention what
distro you were using.  ubuntu, perhaps?

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


