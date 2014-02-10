Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id B6A026DC4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:22:23 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0S00BOAU1CRA40@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 Feb 2014 15:22:24 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4BE422016F; Mon,
	10 Feb 2014 16:22:24 -0500 (EST)
Date: Mon, 10 Feb 2014 16:22:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140210212224.GL22890@denix.org>
References: <CACgAsMeiKrLgjPnsZwOJtncRJ4nKExvjtS23VXNXcwyMsWtaDw@mail.gmail.com>
	<20140203173755.GE3698@jama> <52EFD53A.8060009@mlbassoc.com>
	<CAP9ODKpW=jrTZQfxwYrdTDwtsHh0AQoFU4w3KiX2earOcwxPAw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKpW=jrTZQfxwYrdTDwtsHh0AQoFU4w3KiX2earOcwxPAw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: meta-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Feb 2014 21:22:24 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Fri, Feb 07, 2014 at 11:47:16AM -0200, Otavio Salvador wrote:
> Hello,
> 
> On Mon, Feb 3, 2014 at 3:43 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> > On 2014-02-03 10:37, Martin Jansa wrote:
> >>
> >> On Mon, Feb 03, 2014 at 12:07:30PM -0500, Kevyn-Alexandre Paré wrote:
> >>>
> >>> Morning Martin,
> >>
> >>
> >> morning,
> >>
> >>> I found your email from here:
> >>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-qt5/
> >>>
> >>> I'm searching for help on that package/doc
> >>>
> >>> If you prefer I can send my question to a specific mailing list if you
> >>> pin point me where?
> >>
> >>
> >> openembedded-devel@lists.openembedded.org is better place (see README
> >> file)
> >>
> >>> So my goal is to run qt5 on my OMAP3 board by using yocto.
> >>>
> >>> I have fallow :
> >>> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard
> >>> and &
> >>> http://gpupowered.org/node/20
> >>>
> >>> Try to run this:
> >>> root@overo:/# export QT_DEBUG_BACKINGSTORE=1
> >>> root@overo:/# export QT_QPA_PLATFORM=minimal
> >>> root@overo:/# Qt5_CinematicExperience -plugin tslib
> >>> libpng warning: iCCP: known incorrect sRGB profile
> >>> libpng warning: iCCP: known incorrect sRGB profile
> >>> This plugin does not support createPlatformOpenGLContext!
> >>> QtQuick: failed to create OpenGL context
> >>> This plugin does not support createPlatformOpenGLContext!
> >>> QtQuick: failed to create OpenGL context
> >>>
> >>> Result:
> >>> nothing is visible on my LCD except the console...
> >>>
> >>> So do you have any idea where I should start digging to simply start
> >>> by making a qt5 example run on my board?
> >>
> >>
> >> I've no experience with wandaboard, but few people asked about it with
> >> relation to qt5, so maybe someone will respond on ML.
> >>
> >
> > This works on my SabreLite which I built without X11 support.  I did not
> > use any of your QT_xxx exports, only this command line.
> >
> >   # Qt5_CinematicExperience -platform eglfs -plugin
> > tslib:/dev/input/touchscreen0
> 
> Same works for Wandboard. I have one customer using it.

Not sure what omap3 board specifically that is, but meta-qt5 was successfully 
tested on another TI platform with OpenGLES on SGX - AM335x. No X11 though.

-- 
Denys

