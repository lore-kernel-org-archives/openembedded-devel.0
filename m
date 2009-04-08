Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lrd63-00011P-Ss
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 21:06:15 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHS00GVEQ89FJB1@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2009 14:02:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 27B446B83B5; Wed,
	08 Apr 2009 15:02:33 -0400 (EDT)
Date: Wed, 08 Apr 2009 15:02:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090408190233.GE14502@denix.org>
References: <1239036448-9036-1-git-send-email-jeremy.laine@bolloretelecom.eu>
	<49DC7AD0.2010604@bolloretelecom.eu>
MIME-version: 1.0
In-reply-to: <49DC7AD0.2010604@bolloretelecom.eu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] postgresql: use LDFLAGS for shared libs	(fixes QA error)
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
X-List-Received-Date: Wed, 08 Apr 2009 19:06:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 08, 2009 at 12:22:08PM +0200, Jeremy Lain?? wrote:
> Could a stable maintainer pleaser accept/reject this patch?

Looks good to me.

Acked-by: Denys Dmytriyenko <denis@denix.org>

> Jeremy Lain?? wrote:
> > From: Jeremy Lain?? <jeremy.laine@m4x.org>
> > 
> > 
> > Signed-off-by: Jeremy Lain?? <jeremy.laine@m4x.org>
> > ---
> >  recipes/postgresql/postgresql.inc      |    3 +++
> >  recipes/postgresql/postgresql_8.1.4.bb |    2 +-
> >  recipes/postgresql/postgresql_8.1.8.bb |    2 +-
> >  recipes/postgresql/postgresql_8.2.4.bb |    2 +-
> >  4 files changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes/postgresql/postgresql.inc b/recipes/postgresql/postgresql.inc
> > index da74516..4a11e2a 100644
> > --- a/recipes/postgresql/postgresql.inc
> > +++ b/recipes/postgresql/postgresql.inc
> > @@ -11,6 +11,9 @@ SRC_URI = "ftp://ftp-archives.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
> >  
> >  LEAD_SONAME = "libpq.so"
> >  
> > +# LDFLAGS for shared libraries
> > +export LDFLAGS_SL = "${LDFLAGS}"
> > +
> >  inherit autotools pkgconfig
> >  
> >  do_compile_append() {
> > diff --git a/recipes/postgresql/postgresql_8.1.4.bb b/recipes/postgresql/postgresql_8.1.4.bb
> > index cfb0162..42ba377 100644
> > --- a/recipes/postgresql/postgresql_8.1.4.bb
> > +++ b/recipes/postgresql/postgresql_8.1.4.bb
> > @@ -1,3 +1,3 @@
> >  require postgresql.inc
> >  
> > -PR = "r3"
> > +PR = "r4"
> > diff --git a/recipes/postgresql/postgresql_8.1.8.bb b/recipes/postgresql/postgresql_8.1.8.bb
> > index cfb0162..42ba377 100644
> > --- a/recipes/postgresql/postgresql_8.1.8.bb
> > +++ b/recipes/postgresql/postgresql_8.1.8.bb
> > @@ -1,3 +1,3 @@
> >  require postgresql.inc
> >  
> > -PR = "r3"
> > +PR = "r4"
> > diff --git a/recipes/postgresql/postgresql_8.2.4.bb b/recipes/postgresql/postgresql_8.2.4.bb
> > index 9b60b2b..7e2c370 100644
> > --- a/recipes/postgresql/postgresql_8.2.4.bb
> > +++ b/recipes/postgresql/postgresql_8.2.4.bb
> > @@ -1,6 +1,6 @@
> >  require postgresql.inc
> >  
> > -PR = "r3"
> > +PR = "r4"
> >  DEFAULT_PREFERENCE = "-1"
> >  
> >  SRC_URI = "http://ftp.de.postgresql.org/mirror/postgresql/source/v${PV}/${P}.tar.bz2 \
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


