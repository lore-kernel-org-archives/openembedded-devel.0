Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0C13C6CEA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 13:51:19 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUC001N0RTGRH60@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	08 Oct 2013 08:51:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 73BD0200F4; Tue,
	08 Oct 2013 09:51:16 -0400 (EDT)
Date: Tue, 08 Oct 2013 09:51:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20131008135116.GD22340@denix.org>
References: <1381236055-734-1-git-send-email-eric@eukrea.com>
	<20131008124523.GA2872@jama> <20131008134523.GC22340@denix.org>
	<20131008134759.GC2872@jama>
MIME-version: 1.0
In-reply-to: <20131008134759.GC2872@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH] cinematicexperience: fix typo
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
X-List-Received-Date: Tue, 08 Oct 2013 13:51:19 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Tue, Oct 08, 2013 at 03:47:59PM +0200, Martin Jansa wrote:
> On Tue, Oct 08, 2013 at 09:45:23AM -0400, Denys Dmytriyenko wrote:
> > On Tue, Oct 08, 2013 at 02:45:23PM +0200, Martin Jansa wrote:
> > > On Tue, Oct 08, 2013 at 02:40:55PM +0200, Eric Bénard wrote:
> > > > Signed-off-by: Eric Bénard <eric@eukrea.com>
> > > > ---
> > > >  recipes-qt/examples/cinematicexperience_1.0.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
> > > > index 3fa6f06..9ee5532 100644
> > > > --- a/recipes-qt/examples/cinematicexperience_1.0.bb
> > > > +++ b/recipes-qt/examples/cinematicexperience_1.0.bb
> > > > @@ -32,7 +32,7 @@ do_install() {
> > > >      echo "#!/bin/sh" > ${D}${bindir}/Qt5_CinematicExperience
> > > >      echo "export QML_IMPORT_PATH=${datadir}/${P}" >> ${D}${bindir}/Qt5_CinematicExperience
> > > >      echo "export QML2_IMPORT_PATH=${datadir}/${P}" >> ${D}${bindir}/Qt5_CinematicExperience
> > > > -    echo "${datadir}/${P}/Qt5_CinematicExperiencea \$* " >> ${D}${bindir}/Qt5_CinematicExperience
> > > > +    echo "${datadir}/${P}/Qt5_CinematicExperience \$* " >> ${D}${bindir}/Qt5_CinematicExperience
> > > >      chmod +x ${D}${bindir}/Qt5_CinematicExperience
> > > >  }
> > > 
> > > Thanks, I'll squash this into cinematicexperience commit.
> > 
> > Martin,
> > 
> > Could you please also pick up my other patch for PACKAGECONFIG[linuxfb]? 
> 
> It's already in jansa/test and dora-next since this morning.

I see it in dora-next now, thanks!

-- 
Denys

