Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OJUB1-0000gx-4z
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 18:18:54 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OJU6v-0000R9-Py for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 12:14:38 -0400
Date: Tue, 1 Jun 2010 12:14:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201006011647.23770.ml@vdm-design.de>
Message-ID: <alpine.DEB.2.00.1006011210330.26192@lynx>
References: <4C04F6FD.4070804@mlbassoc.com>
	<alpine.DEB.2.00.1006011021440.32142@lynx>
	<201006011647.23770.ml@vdm-design.de>
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
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 01 Jun 2010 16:18:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 1 Jun 2010, Thomas Zimmermann wrote:

> Am Dienstag 01 Juni 2010, 16:24:33 schrieb Robert P. J. Day:
> > On Tue, 1 Jun 2010, Gary Thomas wrote:
> > > |   libcanberra-gtk gudev-1.0) were not met:
> > > | No package 'gstreamer-plugins-base-0.10' found
> > > |
> > > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > > | installed software in a non-standard prefix.
> > > |
> > > | Alternatively, you may set the environment variables CHEESE_CFLAGS
> > > | and CHEESE_LIBS to avoid the need to call pkg-config.
> > > | See the pkg-config man page for more details.
> > >
> > > NOTE: package cheese-2.30.1-r0: task do_configure: Failed
> >
> >   now i'm slightly confused since neither ubuntu or fedora appear to
> > have any pkgconfig info for the cheese package, so why would there be
> > a test for it that you would need to override?  or is this not
> > pkgconfig-related?
>
> It should never depend on the pkconfig files installed on your buildhost. Are
> you sure that the gstreamer package is build?

  my test build of the beagle linuxtag target just finished,
culminating in:

NOTE: Tasks Summary: Attempted 9996 tasks of which 7920 didn't need to be rerun and 7 failed.
ERROR: '/home/rpjday/oe/openembedded/recipes/webm/libvpx_0.9.0.bb' failed
ERROR: '/home/rpjday/oe/openembedded/recipes/ti/ti-cgt6x_6.1.9.bb' failed
ERROR: '/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb' failed
ERROR: '/home/rpjday/oe/openembedded/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb' failed
ERROR: '/home/rpjday/oe/openembedded/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb' failed
ERROR: '/home/rpjday/oe/openembedded/recipes/abiword/abiword_2.8.3.bb' failed
ERROR: '/home/rpjday/oe/openembedded/recipes/gnome/cheese_2.30.1.bb' failed

  i have to run off but briefly:

* i expected the firefox and abiword failures since they were failing
for beagleboard-demo-image for me

* i just did a git pull and noticed some checkins for both cheese and
gstreamer so i'll restart the build and see the difference when i get
back.

* if we're going to keep discussing this (and i'm willing to help with
the debugging), should we change the thread name?


  back in a while, when i'll look at the log files more carefully.

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


