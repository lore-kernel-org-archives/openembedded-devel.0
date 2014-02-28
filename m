Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id B4CE46F203
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:59:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1P00E45TVA9E10@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	28 Feb 2014 10:59:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 48D1F20370; Fri,
	28 Feb 2014 11:59:34 -0500 (EST)
Date: Fri, 28 Feb 2014 11:59:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140228165934.GZ22890@denix.org>
References: <1393446351-9280-1-git-send-email-obi@opendreambox.org>
	<20140226210522.GT26981@jama> <530FDF58.8040505@opendreambox.org>
	<20140228011301.GG26981@jama>
MIME-version: 1.0
In-reply-to: <20140228011301.GG26981@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH] qtwebkit: accept gstreamer 0.10 as an option
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
X-List-Received-Date: Fri, 28 Feb 2014 17:00:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 28, 2014 at 02:13:01AM +0100, Martin Jansa wrote:
> On Fri, Feb 28, 2014 at 01:59:04AM +0100, Andreas Oberritter wrote:
> > On 26.02.2014 22:05, Martin Jansa wrote:
> > > On Wed, Feb 26, 2014 at 09:25:51PM +0100, Andreas Oberritter wrote:
> > >> There's no configuration knob, though. QtWebKit will prefer
> > >> gstreamer 1.0 if available.
> > > 
> > > Can you please add configuration knob first?
> > > 
> > > The problem is that without the knob it will be undeterministic, with
> > > gstreamer010 in PACKAGECONFIG you can run 2nd build with gstreamer10
> > > already staged for some other component and the resulting qtwebkit will
> > > be different than in 1st build.
> > 
> > I'll see what I can do. I'm not a big fan of (Qt)WebKit's build system,
> > so this might take a while.
> 
> You can use the same hack as I've used in qtmultimedia, it's not nice,
> but works.
> 
> > FWIW, I noticed that qtlocation and qtsensors are optional build
> > dependencies which need packageconfigs, too.
> 
> True, we're even disabling qtlocation in some our builds (because of
> qt3d dependency), so having PACKAGECONFIG would be very appreciated.

+1 on this one!

> > >> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > >> ---
> > >>  recipes-qt/qt5/qtwebkit.inc | 6 +++++-
> > >>  1 file changed, 5 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> > >> index aea9dad..5e96f39 100644
> > >> --- a/recipes-qt/qt5/qtwebkit.inc
> > >> +++ b/recipes-qt/qt5/qtwebkit.inc
> > >> @@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
> > >>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
> > >>                      file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
> > >>  
> > >> -DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
> > >> +DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 libxslt"
> > >> +
> > >> +PACKAGECONFIG ??= "gstreamer10"
> > >> +PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
> > >> +PACKAGECONFIG[gstreamer10] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
> > >>  
> > >>  # qtwebkit gets terribly big when linking with all debug info, disable by default
> > >>  QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
> > >> -- 
> > >> 1.8.3.2
> > >>
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


