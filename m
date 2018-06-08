Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 10D047524B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 23:18:41 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id D56AD280428; Fri,  8 Jun 2018 16:22:40 -0700 (PDT)
Date: Fri, 8 Jun 2018 16:22:40 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180608232240.GG31886@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20180608225036.GF31886@vctlabs.com>
	<CA+chaQccz9f-D+V3vbYLoEen-ZRA_-0MZZRFAj2Rg4rmghe7pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQccz9f-D+V3vbYLoEen-ZRA_-0MZZRFAj2Rg4rmghe7pw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [sumo][meta-qt5][PATCH] qt: upstream git branch 5.10.1 disappeared
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 23:18:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yes, agreed that would be nicer... I don't understand the point of '5.10' branch,
since it doesn't contain *any* of the official v5.10.x release tags! 

On Sat, Jun 09, 2018 at 12:52:57AM +0200, Martin Jansa wrote:
> It would be much nicer if they exist at least on 5.10 branch instead of
> 5.11 :/.
> 
> Pruning origin
> URL: git://code.qt.io/qt/qtbase.git
>  * [pruned] origin/5.10.1
>  * [pruned] origin/5.9.0
>  * [pruned] origin/5.9.4
>  * [pruned] origin/5.9.5
> 
> I still don't understand why they delete the branches, the commits are
> still there, having them reachable from multiple branches doesn't add any
> significant overhead.
> 
> On Sat, Jun 9, 2018 at 12:46 AM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
> 
> > The branch called 5.10.1 no longer exists at code.qt.io repos.
> >
> > The corresponding v5.10.1 qt tags still exist (at least on those repos
> > that originally got tagged during the release), and they are available
> > on the 5.11 branch. Thus we can keep Qt source at 5.10.1 commits, but
> > use 5.11 branch to check out those specific commits.
> >
> > This could be a bit confusing, making it look like 5.11 is the current
> > default version for recipes, so for now there is a comment in qt5-git.inc
> > trying to clarify the situation.
> >
> > A couple of repos that already were lacking 5.10.1 branch no longer
> > need to override QT_MODULE_BRANCH, since their chosen commits are
> > also available on 5.11 branch.
> >
> > Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> > ---
> >  recipes-qt/qt5/qt5-git.inc   | 3 ++-
> >  recipes-qt/qt5/qtknx_git.bb  | 2 --
> >  recipes-qt/qt5/qtmqtt_git.bb | 2 --
> >  3 files changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > index beba913..ae50871 100644
> > --- a/recipes-qt/qt5/qt5-git.inc
> > +++ b/recipes-qt/qt5/qt5-git.inc
> > @@ -2,7 +2,8 @@
> >  # Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
> >
> >  QT_MODULE ?= "${BPN}"
> > -QT_MODULE_BRANCH ?= "5.10.1"
> > +# branch named 5.10.1 got deleted upstream, but v5.10.1 tag still exists
> > on 5.11 branch
> > +QT_MODULE_BRANCH ?= "5.11"
> >  QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
> >
> >  # each module needs to define valid SRCREV
> > diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
> > index fa981ab..5e01e3c 100644
> > --- a/recipes-qt/qt5/qtknx_git.bb
> > +++ b/recipes-qt/qt5/qtknx_git.bb
> > @@ -9,6 +9,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase"
> >
> > -QT_MODULE_BRANCH = "5.10"
> > -
> >  SRCREV = "29c34e8f072afd01002ed3847d752b4e065f977e"
> > diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
> > index 90c255d..b705f7c 100644
> > --- a/recipes-qt/qt5/qtmqtt_git.bb
> > +++ b/recipes-qt/qt5/qtmqtt_git.bb
> > @@ -9,6 +9,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase"
> >
> > -QT_MODULE_BRANCH = "5.10"
> > -
> >  SRCREV = "2c3c2a41c55a179332ec2a076856990f36dd5ef9"
> > --
> > 1.9.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

