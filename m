Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8462E6B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:47:05 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1I00DLR91NCJ00@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 Feb 2014 08:46:45 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 12BD2200A9; Mon,
	24 Feb 2014 09:46:35 -0500 (EST)
Date: Mon, 24 Feb 2014 09:46:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140224144634.GY22890@denix.org>
References: <1392916331-30391-1-git-send-email-denis@denix.org>
	<20140222080505.GK3854@jama>
MIME-version: 1.0
In-reply-to: <20140222080505.GK3854@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCHv2] nativesdk-qtbase: do qmake replacement in ${D} instead of ${B}
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
X-List-Received-Date: Mon, 24 Feb 2014 14:47:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Feb 22, 2014 at 09:05:05AM +0100, Martin Jansa wrote:
> On Thu, Feb 20, 2014 at 12:12:11PM -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > * This way we don't mangle ${B} and can repeat do_install if necessary. And
> >   previously it would require running do_compile again to restore the proper
> >   state of ${B}.
> > * Need to bump PR, since do_compile isn't changing, but needs to re-run to
> >   re-populate qmake-real binary.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-qt/qt5/nativesdk-qtbase.inc | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
> > index fa44009..3cb9b0e 100644
> > --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> > +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> > @@ -10,6 +10,8 @@ require nativesdk-qt5.inc
> >  # it's already included with newer oe-core, but include it here for dylan
> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
> >  
> > +PR = "r1"
> > +
> 
> It's already merged, but please don't add new PRs, especially to .inc
> files.

Please read the commit description above that explains the reason PR is 
required here. Without it, the build will be broken for everyone who already 
built nativesdk-qtbase and would require a clean up or rerun of do_compile


> >  # common with -native and target version
> >  SRC_URI += "\
> >      file://0001-Add-linux-oe-g-platform.patch \
> > @@ -192,14 +194,12 @@ do_install() {
> >      # Fix install paths for all
> >      find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> >  
> > -    # switch back the proper qmake
> > -    if [ -e ${B}/bin/qmake-real ]; then
> > -        rm ${B}/bin/qmake
> > -        mv ${B}/bin/qmake-real ${B}/bin/qmake
> > -    fi
> > -
> >      oe_runmake install INSTALL_ROOT=${D}
> >  
> > +    # replace the native qmake installed above with nativesdk version
> > +    rm -rf ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
> > +    install -m 755 ${B}/bin/qmake-real ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
> > +
> >      # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
> >      # e.g. qt3d, qtwayland
> >      ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> > -- 
> > 1.8.3.2
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


