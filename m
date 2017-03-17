Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE7777A4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Mar 2017 13:44:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 17 Mar 2017 06:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,176,1486454400"; d="scan'208";a="1109548248"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2017 06:44:15 -0700
Date: Fri, 17 Mar 2017 15:44:04 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Dan McGregor <danismostlikely@gmail.com>
Message-ID: <20170317134404.GA21032@mbabyjoh-desk.ger.corp.intel.com>
References: <1489396937-21461-1-git-send-email-maxin.john@intel.com>
	<CACS+7ZT=qTVr=mhaG97YCyPOps4mOhcSS6=g6CPs=BEpSHna9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACS+7ZT=qTVr=mhaG97YCyPOps4mOhcSS6=g6CPs=BEpSHna9w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] jikes: fix absolute symlink error
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
X-List-Received-Date: Fri, 17 Mar 2017 13:44:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dan,

On Thu, Mar 16, 2017 at 10:42:43AM -0600, Dan McGregor wrote:
> On 13 March 2017 at 03:22, Maxin B. John <maxin.john@intel.com> wrote:
> > The following oe-core commit made asbolute symlink an error:
> >
> > commit 3eee8e99e114b3db8b718834ca52da8d2919b83f
> > sstate: Make absolute symlinks an error
> >
> > Fix this by inheritting relative_symlinks class:
> > ERROR: jikes-native-1.22-r0 do_populate_sysroot: sstate found an
> > absolute path symlink
> >
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  recipes-core/jikes/jikes_1.22.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-core/jikes/jikes_1.22.bb b/recipes-core/jikes/jikes_1.22.bb
> > index 0c33118..a35cfcf 100644
> > --- a/recipes-core/jikes/jikes_1.22.bb
> > +++ b/recipes-core/jikes/jikes_1.22.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
> >                     "
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/jikes/jikes-${PV}.tar.bz2"
> >
> > -inherit autotools update-alternatives
> > +inherit autotools update-alternatives relative_symlinks
> >
> >  BBCLASSEXTEND = "native"
> >
> > --
> > 2.4.0
> >
> 
> This change makes the layer depend on master, not krogoth or master
> like the README says. Should we add the relative_symlinks
> functionality locally, or update the README?

You are right. This functionality depends on the master branch. It also
reminds me that meta-java has been particularly bad in keeping up with 
branching of oe-core releases.

I have been testing some patches to remove "meta-oe" dependency for
"meta-java" layer (PACKAGECONFIG way). Will update README along that
patchset. Hope that is ok.

Best Regards,
Maxin

