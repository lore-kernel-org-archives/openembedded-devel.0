Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id D10A06E903
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 17:51:11 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0U00BPIEWSWIB0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	11 Feb 2014 11:50:53 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 75F5D200BE; Tue,
	11 Feb 2014 12:50:52 -0500 (EST)
Date: Tue, 11 Feb 2014 12:50:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140211175052.GM22890@denix.org>
References: <1391458395-9941-1-git-send-email-gjohnson@agleader.com>
	<EF93C63B81FE3D4F81C98317512457471295D9D477@agmail-mb1>
	<20140204221559.GK3698@jama>
MIME-version: 1.0
In-reply-to: <20140204221559.GK3698@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH] Fix file search paths for nativesdk packages.
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
X-List-Received-Date: Tue, 11 Feb 2014 17:51:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 04, 2014 at 11:15:59PM +0100, Martin Jansa wrote:
> On Mon, Feb 03, 2014 at 02:14:14PM -0600, Gabe Johnson wrote:
> > Signed-off-by: Gabe Johnson
> 
> Is this really needed now when all local patches are in BPN directories?
> It was needed before when there were patches in BPN-PV and we needed to
> put them in FILESPATH before the BPN/override version IIRC, but that's
> not the case anymore.

FWIW, that FILESPATH addition is still needed when you use meta-qt5 with past 
stable releases. Of course, it's not needed on master.


> OE qemux86@ ~/build/oe-core $ grep ^FILESPATH= env.nativesdk-qtbase | sed "s/=\"/\n/g; s/:/\n/g"
> FILESPATH
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/nodistro
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/nodistro
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/nodistro
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/qemux86
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/qemux86
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/qemux86
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/qemuall
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/qemuall
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/qemuall
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/x86
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/x86
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/x86
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/x86-64
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/x86-64
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/x86-64
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/"
> 
> > ---
> >  recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb  |    2 ++
> >  recipes-qt/qt5/nativesdk-qttools_5.2.0.bb |    2 ++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb b/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb
> > index aca8dea..223baa3 100644
> > --- a/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb
> > +++ b/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb
> > @@ -1,5 +1,7 @@
> >  require qt5-${PV}.inc
> >  require ${PN}.inc
> > 
> > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
> > +
> >  SRC_URI[md5sum] = "c94bbaf1bb7f0f4a32d2caa7501416e1"
> >  SRC_URI[sha256sum] = "51556cd2562a6d4bbb70ffcc93e8ef83ec79b170753aac6e4b195957c61cb628"
> > diff --git a/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb b/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb
> > index 0effa1b..3d2c05a 100644
> > --- a/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb
> > +++ b/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb
> > @@ -1,5 +1,7 @@
> >  require qt5-${PV}.inc
> >  require ${PN}.inc
> > 
> > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/qttools:"
> > +
> >  SRC_URI[md5sum] = "76a0992967b6d02220ecb69a5ba04ef1"
> >  SRC_URI[sha256sum] = "ff331510ecb776b3059953e216e9fa7a4c0736eeb148c4cf11acc8150811b7f0"
> > --
> > 1.7.9.5
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


