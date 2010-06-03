Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OKDhf-0006Tk-FO
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 18:55:38 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L3G005ML6SW37UD@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	03 Jun 2010 11:51:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DE6BE14AF60; Thu,
	03 Jun 2010 12:50:55 -0400 (EDT)
Date: Thu, 03 Jun 2010 12:50:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100603165055.GA4402@denix.org>
References: <1275578113-17291-1-git-send-email-chase.maupin@ti.com>
	<hu8ivf$250$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <hu8ivf$250$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: rename qtdemo file
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
X-List-Received-Date: Thu, 03 Jun 2010 16:55:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jun 03, 2010 at 05:50:06PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 03-06-10 17:15, Chase Maupin wrote:
> > * Changed the name of the qtdemo exectable installed
> >   in the /usr/bin directory to qtdemoE for Qt
> >   embedded builds.  This allows the Qt embedded
> >   version of the demos package to co-exist with
> >   the Qt X11 version.
> > * Changed the demos package file list to accept
> >   both qtdemo and qtdemoE.
> > 
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> 
> Acked-by: Koen Kooi <k-kooi@ti.com>

Applied, thanks.

> > ---
> >  recipes/qt4/qt-4.6.2.inc     |    3 +++
> >  recipes/qt4/qt4-embedded.inc |    2 +-
> >  recipes/qt4/qt4.inc          |    4 ++--
> >  3 files changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes/qt4/qt-4.6.2.inc b/recipes/qt4/qt-4.6.2.inc
> > index e89cf17..4a9f077 100644
> > --- a/recipes/qt4/qt-4.6.2.inc
> > +++ b/recipes/qt4/qt-4.6.2.inc
> > @@ -57,6 +57,9 @@ do_install_append() {
> >  	for i in rcc uic moc ; do
> >  		install -m 0755 ${S}/bin/$i ${D}${bindir}/
> >  	done
> > +
> > +	#Append an E to the qtdemo file
> > +	mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
> >  }
> >  
> >  LICENSE = "LGPLv2.1 GPLv3"
> > diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> > index 9aaca6e..436f64c 100644
> > --- a/recipes/qt4/qt4-embedded.inc
> > +++ b/recipes/qt4/qt4-embedded.inc
> > @@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
> >  PRIORITY = "optional"
> >  HOMEPAGE = "http://www.trolltech.com"
> >  DEPENDS += "directfb tslib"
> > -INC_PR = "r19"
> > +INC_PR = "r20"
> >  
> >  QT_BASE_NAME ?= "qt4-embedded"
> >  QT_BASE_LIB  ?= "libqt-embedded"
> > diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
> > index 5a19f65..e246e17 100644
> > --- a/recipes/qt4/qt4.inc
> > +++ b/recipes/qt4/qt4.inc
> > @@ -103,8 +103,8 @@ FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
> >  FILES_${QT_BASE_NAME}-common-dbg           = "${bindir}/.debug/qtconfig"
> >  FILES_${QT_BASE_NAME}-dbus                 = "${bindir}/qdbus ${bindir}/qdbusxml2cpp ${bindir}/qdbuscpp2xml ${bindir}/qdbusviewer"
> >  FILES_${QT_BASE_NAME}-dbus-dbg             = "${bindir}/.debug/qdbus ${bindir}/.debug/qdbusxml2cpp ${bindir}/.debug/qdbuscpp2xml ${bindir}/.debug/qdbusviewer"
> > -FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo ${bindir}/${QT_DIR_NAME}/demos/*"
> > -FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/*/.debug"
> > +FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/*"
> > +FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/*/.debug"
> >  FILES_${QT_BASE_NAME}-designer             = "${bindir}/*designer*"
> >  FILES_${QT_BASE_NAME}-designer-dbg         = "${bindir}/.debug/*designer*"
> >  FILES_${QT_BASE_NAME}-examples             = "${bindir}/${QT_DIR_NAME}/examples/*"
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFMB88uMkyGM64RGpERAvNNAJ9dxgbS0or8dffW2g3EyQDgy2+YLACeKsUl
> aw4UUGIRN8dpTA3Y694MOFY=
> =YC+E
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


