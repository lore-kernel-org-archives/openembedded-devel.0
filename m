Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QU2Fv-000117-Ln
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 21:48:03 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMF00GZAO1U8RT2@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Jun 2011 13:44:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8F21514AF5D; Tue,
	07 Jun 2011 14:44:18 -0400 (EDT)
Date: Tue, 07 Jun 2011 14:44:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110607184418.GA2512@denix.org>
References: <1307369743-14738-1-git-send-email-j-lance1@ti.com>
	<1307370959.4011.17.camel@mattotaupa>
	<BANLkTikbajbPaptoGjE=bwZrCsE+KyyTHw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <BANLkTikbajbPaptoGjE=bwZrCsE+KyyTHw@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 1/1] matrix_gui: Update SRCREV
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
X-List-Received-Date: Tue, 07 Jun 2011 19:48:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 06, 2011 at 10:58:57AM -0500, Jeff Lance wrote:
> Paul,
> 
> Thanks for the help. I will use -s now. Previously I was hand typing in the
> commit message.
> I will resubmit a corrected version of this patch.

I agree with all Paul's comments, except the one requiring From and SoB fields 
to match - in some cases it's not possible, especially when people try to 
avoid inline patches being mangled by corporate mail servers...

-- 
Denys

> On Mon, Jun 6, 2011 at 9:35 AM, Paul Menzel <
> paulepanter@users.sourceforge.net> wrote:
> 
> > Dear Jeff,
> >
> > Am Montag, den 06.06.2011, 09:15 -0500 schrieb Jeff Lance:
> >
> > you can make the commit subject more informational by writing the
> > following.
> >
> >        matrix_gui: Update SRCREV to revision 257
> >
> > >       * Adding arm only multimedia apps to am37x
> > >       * Wifi updates to am37x, am180x
> > >       * Adding to am180x, am37x, am35x, beagle:
> > >               * Oprofile example
> >
> > do you copy those lines from `git log`? `git log` adds indentation in
> > front of the commit message. Please use `git format-patch`.
> >
> > > Signed-off-by  Jeff Lance   <j-lance1@ti.com>
> >
> > A colon ?:? is missing and it is formatting strangely. Please use the
> > option `-s`.
> >
> > As I wrote often enough please make sure the From and Signed-off-by
> > field match.
> >
> > > ---
> > >  recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
> > >  recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
> > >  recipes/ti/matrix-gui_1.3.bb        |    4 ++--
> > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/
> > matrix-gui-common_1.4.bb
> > > index 6f7376d..0b4b25b 100644
> > > --- a/recipes/ti/matrix-gui-common_1.4.bb
> > > +++ b/recipes/ti/matrix-gui-common_1.4.bb
> > > @@ -4,5 +4,5 @@ require matrix-gui-common.inc
> > >  # prebuilt version in the repository.
> > >  RRECOMMENDS_${PN} = "am-sysinfo"
> > >
> > > -SRCREV = "249"
> > > -PR = "${INC_PR}.10"
> > > +SRCREV = "257"
> >
> > Would it be beneficial to add `SRCREV` to `matrix-gui.inc` and require
> > that everywhere?
> >
> > > +PR = "${INC_PR}.11"
> > > diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/
> > matrix-gui-e_1.3.bb
> > > index 8f2df1c..a6eb17f 100644
> > > --- a/recipes/ti/matrix-gui-e_1.3.bb
> > > +++ b/recipes/ti/matrix-gui-e_1.3.bb
> > > @@ -1,5 +1,5 @@
> > >  require matrix-gui-e.inc
> > >
> > > -SRCREV = "249"
> > > -PR = "${INC_PR}.9"
> > > +SRCREV = "257"
> > > +PR = "${INC_PR}.10"
> > >
> > > diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
> > > index f7e56a3..51678df 100644
> > > --- a/recipes/ti/matrix-gui_1.3.bb
> > > +++ b/recipes/ti/matrix-gui_1.3.bb
> > > @@ -1,4 +1,4 @@
> > >  require matrix-gui.inc
> > >
> > > -SRCREV = "249"
> > > -PR = "${INC_PR}.5"
> > > +SRCREV = "257"
> > > +PR = "${INC_PR}.6"
> >
> > Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
> >
> > I did not build or runtest though.
> >
> >
> > Thanks,
> >
> > Paul
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


