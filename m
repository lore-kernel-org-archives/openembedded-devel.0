Received: from smtpauth04.prod.mesa1.secureserver.net ([64.202.165.95])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <dbatzle@dcbcyber.com>) id 1PArTh-0004PR-9Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 23:54:46 +0200
Received: (qmail 31535 invoked from network); 26 Oct 2010 21:47:20 -0000
Received: from unknown (75.182.70.212)
	by smtpauth04.prod.mesa1.secureserver.net (64.202.165.95) with ESMTP;
	26 Oct 2010 21:47:20 -0000
From: David <dbatzle@dcbcyber.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=W1g++5vP22Zeu+XGEsMqhk5Sr38sA88YZDcjw@mail.gmail.com>
References: <1288124872-18813-1-git-send-email-dbatzle@dcbcyber.com>
	<AANLkTi=W1g++5vP22Zeu+XGEsMqhk5Sr38sA88YZDcjw@mail.gmail.com>
Date: Tue, 26 Oct 2010 17:48:08 -0400
Message-Id: <1288129688.19076.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.5 (2.24.5-2.fc10) 
X-SA-Exim-Connect-IP: 64.202.165.95
X-SA-Exim-Mail-From: dbatzle@dcbcyber.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] bullet.bb New recipe
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
X-List-Received-Date: Tue, 26 Oct 2010 21:54:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2010-10-26 at 14:30 -0700, Khem Raj wrote:
> On Tue, Oct 26, 2010 at 1:27 PM, David Batzle <dbatzle@dcbcyber.com> wrote:
> > ---
> >  recipes/bullet/bullet.bb |   14 ++++++++++++++
> >  1 files changed, 14 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/bullet/bullet.bb
> >
> > diff --git a/recipes/bullet/bullet.bb b/recipes/bullet/bullet.bb
> > new file mode 100644
> > index 0000000..c466e7a
> > --- /dev/null
> > +++ b/recipes/bullet/bullet.bb
> > @@ -0,0 +1,14 @@
> > +DESCRIPTION = "Bullet Physics Library"
> > +HOMEPAGE = "www.bulletphysics.org"
> > +LICENSE = "Zlib"
> 
> if you look closely under the sources different parts are licensed
> under different licenses
> while you are at it could you mention all the licenses that the
> package is using.
> 
> Otherwise it look ok.

Some of these parts have license text instead of a license type. What
is the correct way to handle these?

Is it appropriate to have more than one LICENSE= line if I want to try
organize the listing?
> 
> > +PV = "2.77+svnr${SRCPV}"
> > +PR = "r0"
> 
> you could omit PR setting when its r0 i.e. initial first rev because
> bitbake will set it to r0
> if it does not find a PR definition but then if some fix it done later
> then it has to be bumped
> to r1 then one has to add that in recipe but its ok to set it to r0 as
> well its just FYI
> 
> > +
> > +SRC_URI = "svn://bullet.googlecode.com/svn;module=trunk;proto=http"
> > +
> > +SRCREV = "2218"
> > +S = "${WORKDIR}/trunk"
> > +
> > +inherit cmake
> > +
> > +EXTRA_OECMAKE = "-DBUILD_DEMOS:BOOL=OFF -DBUILD_EXTRAS:BOOL=OFF -DUSE_GLUT:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=ON"
> > --
> > 1.6.0.6
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



